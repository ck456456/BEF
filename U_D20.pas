unit U_D20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, StatChar, TeeBoxPlot, TeEngine, U_KCSPC,
  TeeFunci, Series, TeeProcs, Chart, Grids, ComCtrls, DB, Math;

type
  TF_D20 = class(TForm)
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;                                       
    CBType: TComboBox;
    E_BDat: TEdit;
    E_EDat: TEdit;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    CB_BWNo: TComboBox;
    CB_EWNo: TComboBox;
    E_BRun: TEdit;
    E_ERun: TEdit;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    Label3: TLabel;
    CB_Grp: TComboBox;
    CB_SPEC: TComboBox;
    Label7: TLabel;
    CB_001: TComboBox;
    Label11: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SG01: TStringGrid;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    P_Left: TPanel;
    Panel7: TPanel;
    OChart: TChart;
    ODt: TPointSeries;
    Panel8: TPanel;
    MRChart: TChart;
    MDt: TLineSeries;
    MMean: TLineSeries;
    M3U: TLineSeries;
    Panel9: TPanel;
    XChart: TChart;
    XSL: TLineSeries;
    XSU: TLineSeries;
    XDt: TLineSeries;
    XMean: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    X3U: TLineSeries;
    X3L: TLineSeries;
    P_Right: TPanel;
    Panel10: TPanel;
    BChart: TChart;
    BDt: TBoxSeries;
    Panel11: TPanel;
    HChart: TChart;
    HDt: THistogramSeries;
    Splitter1: TSplitter;
    SG02: TStringGrid;
    Panel5: TPanel;
    Label8: TLabel;
    CB_Type: TComboBox;
    CB_CPK: TComboBox;
    B_Excel: TBitBtn;
    procedure SG02TopLeftChanged(Sender: TObject);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure CB_001Change(Sender: TObject);
    procedure CB_GrpChange(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CBTypeChange(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
    procedure CB_CPKChange(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    SL02 : TStringList;
    SPC       : TKCSPC;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure OpenWF15;
    procedure OpenF09(S1,S2 : String);
    procedure PWorkLd(CB :TComboBox);
    procedure PTypeLd(CB :TComboBox);
    procedure LoadLne(S1 : String);
    procedure LoadGrp(S1 : String);
    procedure LadSPEC(S1,S2 : String);
    procedure SetType;
    procedure AddConstSeries;
    procedure OpenFP1;
  public
    { Public declarations }
  end;

var
  F_D20: TF_D20;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D20.SG02TopLeftChanged(Sender: TObject);
begin
  SG01.LeftCol := SG02.LeftCol;
end;

procedure TF_D20.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i : integer;
begin
  for i := 0 to SG02.ColCount-1 do SG01.ColWidths[i] := SG02.ColWidths[i];
end;

procedure TF_D20.SG01Ini;
var
  i : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,00] := 'SU';
  SG01.Cells[00,01] := 'SL';
  SG01.Cells[00,02] := 'StdDev';
  SG01.Cells[00,03] := 'Average';
  SG01.Cells[00,04] := 'Max';
  SG01.Cells[00,05] := 'Min';
  SG01.Cells[00,06] := 'CPU';
  SG01.Cells[00,07] := 'CPL';
  SG01.Cells[00,08] := 'CP';
  SG01.Cells[00,09] := 'Ca';
  SG01.Cells[00,10] := 'CPK';
  SG01.Cells[00,11] := 'Count';
  SG01.ColCount := SG02.ColCount;
  for i := 0 to SG02.ColCount-1 do SG01.ColWidths[i] := SG02.ColWidths[i];
end;

procedure TF_D20.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D20.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D20.PTypeLd(CB :TComboBox);
begin
  D.OpenF01('T');
  CB.Items.Clear;
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB.ItemIndex := iif(CB.Items.Count=0,-1,0);
end;

procedure TF_D20.LoadGrp(S1 : String);
begin
  D.OpenF07(S1);
  D.F07.First;
  CB_Grp.Clear;
  While not D.F07.Eof do
  Begin
    CB_Grp.Items.Add(D.F07.FieldByName('BEF07002').AsString+#255+
                     D.F07.FieldByName('BEF07003').AsString);
    D.F07.Next;
  End;
  CB_Grp.ItemIndex := iif(CB_Grp.Items.Count=0,-1,0);
end;

procedure TF_D20.LoadLne(S1 : String);
begin
  D.OpenF12(S1);
  D.F12.First;
  CB_BLn.Clear;
  CB_ELn.Clear;
  While not D.F12.Eof do
  Begin
    CB_BLn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    CB_ELn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB_BLn.ItemIndex := iif(CB_BLn.Items.Count=0,-1,0);
  CB_ELn.ItemIndex := CB_ELn.Items.Count-1;
End;

procedure TF_D20.OpenF09(S1,S2 : String);
begin
  KC_T3Close(D.F09,D.SC);
  D.F09.CommandText := 'SELECT BEF09101 FROM BEFF09 Where BEF09001 = '''+S1+
                                                  ''' and BEF09002 = '''+S2+
                                             ''' Group by BEF09101'+
                                               ' Order by BEF09101';
  KC_T3OPEN(D.F09,D.SC);
  D.F09.First;
End;

procedure TF_D20.LadSPEC(S1,S2 : String);
begin
  OpenF09(S1,S2);
  D.F09.First;
  CB_SPEC.Clear;
  While not D.F09.Eof do
  Begin
    CB_SPEC.Items.Add(D.F09.FieldByName('BEF09101').AsString);
    D.F09.Next;
  End;
  CB_SPEC.ItemIndex := iif(CB_SPEC.Items.Count=0,-1,0);
End;

procedure TF_D20.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  SPC := TKCSPC.Create;
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-18;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  D.OpenF00;
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  PTypeLd(CBType);
  LoadLne(CB_001.Text);
  LoadGrp(CB_001.Text);
  LadSPEC(CB_001.Text,KC_GetSubStr(#255,CB_Grp.Text,1));
  SG01Ini;
end;

procedure TF_D20.CB_001Change(Sender: TObject);
begin
  LoadLne(CB_001.Text);
  LoadGrp(CB_001.Text);
  LadSPEC(CB_001.Text,KC_GetSubStr(#255,CB_Grp.Text,1));
end;

procedure TF_D20.CB_GrpChange(Sender: TObject);
begin
  LadSPEC(CB_001.Text,KC_GetSubStr(#255,CB_Grp.Text,1));
  CBTypeChange(Sender);
end;

procedure TF_D20.SG02Ini;                       
var
  iCol : integer;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := '生產日期';         // BEF16102   BEF19102
  SG02.Cells[01,0] := 'Line ';            // BEF16005   BEF19005
  SG02.Cells[02,0] := 'Working No.';      // BEF16006   BEF19006
  SG02.Cells[03,0] := 'Run No.';          // BEF16001   BEF19001-BEF19007
  SG02.Cells[04,0] := 'Type';             // BEF16002   BEF19002
  SG02.Cells[05,0] := 'Process No';       // BEF16004   BEF19004
  SG02.Cells[06,0] := '收料長度(m)';      // BEF16303   BEF19303
  SG02.Cells[07,0] := '級別';             // BEF16308   BEF19003
  SG02.Cells[08,0] := '首檢/尾檢';
  D.OpenF08(CB_001.Text,KC_GetSubStr(#255,CB_Grp.Text,1));
  iCol := 9;
  While not D.F08.Eof do
  Begin
    SG02.Cells[iCol,0] := D.F08.FieldByName('BEF08101').AsString+#255+
                          D.F08.FieldByName('BEF08102').AsString;
    inc(iCol);
    D.F08.Next;
  End;
  SG02.ColCount := iCol;
  KC_ColAutoSize(SG02);
end;

procedure TF_D20.OpenFP1;
var
  SQL : String;
begin
  case CB_001.ItemIndex of
    0 : SQL := 'SELECT * FROM BEFF16 Where BEF16001 >= '''+E_BRun.Text+
                                   ''' and BEF16001 <= '''+E_ERun.Text+
                                  'z'' and BEF16005 >= '''+CB_BLn.Text+
                                   ''' and BEF16005 <= '''+CB_ELn.Text+
                                  'z'' and BEF16102 >= '''+E_BDat.Text+
                                   ''' and BEF16102 <= '''+E_EDat.Text+
                                  'z'' and BEF16006 >= '''+CB_BWNo.Text+
                                   ''' and BEF16006 <= '''+CB_EWNo.Text+
                             'z'' Order by BEF16102';
    1 : SQL := 'SELECT * FROM BEFF19 Where BEF19001 >= '''+E_BRun.Text+
                                   ''' and BEF19001 <= '''+E_ERun.Text+
                                  'z'' and BEF19005 >= '''+CB_BLn.Text+
                                   ''' and BEF19005 <= '''+CB_ELn.Text+
                                  'z'' and BEF19102 >= '''+E_BDat.Text+
                                   ''' and BEF19102 <= '''+E_EDat.Text+
                                  'z'' and BEF19006 >= '''+CB_BWNo.Text+
                                   ''' and BEF19006 <= '''+CB_EWNo.Text+
                             'z'' Order by BEF19102';
  End;
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_D20.SG02Snd;
var
  SS : array[1..12] of String;
  S1,S2,S3 : String;
  i,j,k : integer;
  iRow  : integer;
begin
  case CB_001.ItemIndex of
    0 : Begin
          SS[01] := 'BEF16102';  // 生產日期
          SS[02] := 'BEF16005';  // Line
          SS[03] := 'BEF16006';  // Working No.
          SS[04] := 'BEF16001';  // Run No.
          SS[05] := 'BEF16002';  // Type
          SS[06] := 'BEF16004';  // Process No
          SS[07] := 'BEF16303';  // 收料長度(m)
          SS[08] := 'BEF16308';  // 級別
          SS[09] := 'BEF16901';  // Data
          SS[10] := '';
          SS[11] := '';
          SS[12] := '';
        End;
    1 : Begin
          SS[01] := 'BEF19102';           // 生產日期
          SS[02] := 'BEF19005';           // Line
          SS[03] := 'BEF19006';           // Working No.
          SS[04] := 'BEF19001-BEF19007';  // Run No.
          SS[05] := 'BEF19002';           // Type
          SS[06] := 'BEF19004';           // Process No
          SS[07] := 'BEF19303';           // 收料長度(m)
          SS[08] := 'BEF19003';           // 級別
          SS[09] := 'BEF19901';           // Data
          SS[10] := '';
          SS[11] := '';
          SS[12] := '';
        End;
  End;
  D.OpenF10(CBType.Text);
  KC_SGClear(1,SG02);
  D.FP1.First;
  i := 1;
  While not D.FP1.Eof do
  Begin
    if (D.FP1.FieldByName(SS[05]).AsString <> CBType.Text) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    S3 := '';
    case CB_001.ItemIndex of
      0 : S3 := D.FP1.FieldByName(SS[4]).ASSTRING;
      1 : S3 := D.FP1.FieldByName(KC_GetSubStr('-',SS[4],1)).ASSTRING+'-'+
                D.FP1.FieldByName(KC_GetSubStr('-',SS[4],2)).ASSTRING;
    End;
    SG02.Cells[00,i] := copy(D.FP1.FieldByName(SS[01]).AsString,1,8);
    SG02.Cells[01,i] := D.FP1.FieldByName(SS[02]).AsString;
    SG02.Cells[02,i] := D.FP1.FieldByName(SS[03]).AsString;
    SG02.Cells[03,i] := S3;
    SG02.Cells[04,i] := D.FP1.FieldByName(SS[05]).AsString;
    SG02.Cells[05,i] := D.FP1.FieldByName(SS[06]).AsString;
    SG02.Cells[06,i] := D.FP1.FieldByName(SS[07]).AsString;
    SG02.Cells[07,i] := D.FP1.FieldByName(SS[08]).AsString;
    SL02.Clear;
    if D.F10.Locate('BEF10002',VarArrayOf([D.FP1.FieldByName(SS[06]).AsString]),[loCaseInsensitive]) Then
      SL02.Assign(D.F10.FieldByName('BEF10901'));
    SG02.Cells[08,i]   := '*首檢';
    SG02.Cells[08,i+1] := '*尾檢';
    for j := 0 to SL02.Count-1 do
    Begin
      S1 := SL02.Strings[j];
      case CB_001.ItemIndex of
        0 : Begin
              if((KC_GetSubStr(#255,S1,1) = '成型站-前') and
                 (KC_GetSubStr(#255,S1,2) = KC_GetSubStr(#255,CB_Grp.Text,1)) and
                 (KC_GetSubStr(#255,S1,3) = CB_SPEC.Text)) Then
                 SG02.Cells[08,i]   := '首檢';
              if((KC_GetSubStr(#255,S1,1) = '成型站-後') and
                 (KC_GetSubStr(#255,S1,2) = KC_GetSubStr(#255,CB_Grp.Text,1)) and
                 (KC_GetSubStr(#255,S1,3) = CB_SPEC.Text)) Then
                 SG02.Cells[08,i+1] := '尾檢';
            End;
        1 : Begin
              if((KC_GetSubStr(#255,S1,1) = '褙膜站') and
                 (KC_GetSubStr(#255,S1,2) = KC_GetSubStr(#255,CB_Grp.Text,1)) and
                 (KC_GetSubStr(#255,S1,3) = CB_SPEC.Text)) Then
              Begin
                 SG02.Cells[08,i]   := '首檢';
                 SG02.Cells[08,i+1] := '尾檢';
              End;
            End;
      End;
    End;

    SL01.Assign(D.FP1.FieldByName(SS[09]));
    for j := 9 to SG02.ColCount-1 do
    Begin
      S1 := KC_GetSubStr(#255,SG02.Cells[j,0],1);
      for k := 0 to SL01.Count-1 do
      Begin
        S2 := SL01.Strings[k];
        case CB_001.ItemIndex of
          0 : Begin
                if (KC_GetSubStr(#255,S2,3) <> KC_GetSubStr(#255,CB_Grp.Text,1)) Then Continue;
                if (KC_GetSubStr(#255,S2,4) <> S1) Then Continue;
                iRow := -1;
                if (KC_GetSubStr(#255,S2,2) = '成型站-前') Then iRow :=  0;
                if (KC_GetSubStr(#255,S2,2) = '成型站-後') Then iRow :=  1;
                if (iRow = -1) Then Continue;
                SG02.Cells[j,i+iRow] := format('%0.2f',[KC_StrToFloat(KC_GetSubStr(#255,S2,6))]);
              End;
          1 : Begin
                if (KC_GetSubStr(#255,S2,3) <> KC_GetSubStr(#255,CB_Grp.Text,1)) Then Continue;
                if (KC_GetSubStr(#255,S2,4) <> S1) Then Continue;
                iRow := -1;
                if (KC_GetSubStr(#255,S2,2) = '首檢') Then iRow :=  0;
                if (KC_GetSubStr(#255,S2,2) = '尾檢') Then iRow :=  1;
                if (iRow = -1) Then Continue;
                SG02.Cells[j,i+iRow] := format('%0.2f',[KC_StrToFloat(KC_GetSubStr(#255,S2,6))]);
              End;
        End;
      End;
    End;
    inc(i,2);
    D.FP1.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
  for i := 0 to SG02.ColCount-1 do SG01.ColWidths[i] := SG02.ColWidths[i];
end;

procedure TF_D20.SG01Snd;
var
  i,j : integer;
begin
  D.OpenF09(CB_001.Text,KC_GetSubStr(#255,CB_Grp.Text,1),CB_SPEC.Text);
  D.F09.First;
  While not D.F09.Eof do
  Begin
    for i:=9 to SG02.ColCount-1 do
    Begin
      if (D.F09.FieldByName('BEF09102').AsString<>KC_GetSubStr(#255,SG02.Cells[i,0],1)) Then Continue;
      SPC.Clear;
      SPC.SL := KC_StrToFloat(D.F09.FieldByName('BEF09213').AsString);
      SPC.SU := KC_StrToFloat(D.F09.FieldByName('BEF09214').AsString);
      SPC.SLU:= 0;
      For j := 1 to SG02.RowCount-1 do
      Begin
        case CB_CPK.ItemIndex of
          0 :; // all
          1 :if (POS('首檢',SG02.Cells[8,j])=0) Then Continue; // 首檢
          2 :if (POS('尾檢',SG02.Cells[8,j])=0) Then Continue; // 尾檢
        End;
        if (KC_StrToFloat(SG02.Cells[i,j])=0) Then Continue;
        SPC.Add(KC_StrToFloat(SG02.Cells[i,j]));
        SG01.Cells[i,00] := Format('%2.2f', [SPC.SU]);
        SG01.Cells[i,01] := Format('%2.2f', [SPC.SL]);
        SG01.Cells[i,02] := Format('%2.2f', [SPC.StdDev]);
        SG01.Cells[i,03] := Format('%2.2f', [SPC.Average]);
        SG01.Cells[i,04] := Format('%2.2f', [SPC.Max]);
        SG01.Cells[i,05] := Format('%2.2f', [SPC.Min]);
        SG01.Cells[i,06] := Format('%2.2f', [SPC.CPU]);
        SG01.Cells[i,07] := Format('%2.2f', [SPC.CPL]);
        SG01.Cells[i,08] := Format('%2.2f', [SPC.CP]);
        SG01.Cells[i,09] := Format('%2.2f', [SPC.Ca]);
        SG01.Cells[i,10] := Format('%2.2f', [SPC.CPK]);
        SG01.Cells[i,11] := Format('%d'   , [SPC.Count]);
      End;
    End;
    D.F09.Next;
  End;
end;

procedure TF_D20.SetType;
var
  i :Integer;
begin
  CB_Type.Clear;
  for i := 9 To (SG02.ColCount-1) do
  if SG02.Cells[i,0] <> '' then
    CB_Type.Items.Add(SG02.Cells[i,0]);
  CB_Type.ItemIndex := 0;
end;

procedure TF_D20.AddConstSeries;
var
   i,j : Integer;
 RunNo : Double;
  Mean : Real;
  Subt : Real;
  RDat : array of Double;
  HDat : array[0..9] of Integer;
  HMin : Double;
  HMax : Double;
  HAve : Double;
  LBDt : TStringList;
begin
  LBDt := TStringList.Create;
  LBDt .Clear;

  ODt  .Clear;
  HDt  .Clear;
  BDt  .Clear;

  XDt  .Clear;
  XSU  .Clear;
  XSL  .Clear;
  XMean.Clear;
  X3U  .Clear;
  X3L  .Clear;

  MDt  .Clear;
  MMean.Clear;
  M3U  .Clear;
  if SG02.RowCount<=2 then
  Begin
    LBDt.Free;
    Exit;
  End;;

  for i := low(HDat) to High(HDat) do HDat[i] := 0;
  HMax := KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,4]);
  HMin := KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,5]);
  HAve := (HMax-HMin)/(High(HDat)+1);
  For i := 1 To min(100,(SG02.RowCount-1)) do
  Begin
    case CB_CPK.ItemIndex of
      0 :; // all
      1 :if (POS('首檢',SG02.Cells[8,i])=0) Then Continue; // 首檢
      2 :if (POS('尾檢',SG02.Cells[8,i])=0) Then Continue; // 尾檢
    End;
    For j := low(HDat) to High(HDat) do
      if ((KC_StrToFloat(SG02.Cells[CB_Type.ItemIndex+9,i])-0.0000001)<
          (HMin+(j+1)*HAve)) Then
      Begin
        HDat[j] := HDat[j]+1;
        Break;
      End;
    RunNo := KC_StrToFloat(iif(SG02.Cells[00,i]='',SG02.Cells[00,i-1],SG02.Cells[00,i])); //??
    ODt .AddXY(RunNo,KC_StrToFloat (SG02.Cells[CB_Type.ItemIndex+9,i]),'',clBlue);
    XDt .AddXY(    i,KC_StrToFloat (SG02.Cells[CB_Type.ItemIndex+9,i]),'',clBlue);
    LBDt.Add  (KC_FillCharBefore(SG02.Cells[CB_Type.ItemIndex+9,i],50,' '));
    if (i<>1) Then
    Begin
      Subt := abs(KC_StrToFloat(SG02.Cells[CB_Type.ItemIndex+9,i]) -
                  KC_StrToFloat(SG02.Cells[CB_Type.ItemIndex+9,i-1]));
      SetLength(RDat, i-1);
      RDat[i-2] := Subt;
      MDt  .AddXY( i,Subt,'',clBlue);
    End;
  End;

  Mean := (KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,1])+KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,0]))/2;
  For i := 1 To min(100,(SG02.RowCount-1)) do
  Begin
    MMean.AddXY( i,Math.Mean(RDat),'',clBlack);
    M3U  .AddXY( i,Math.Mean(RDat)+3*KC_StdDev(RDat),'',clBlack);

    XSU  .AddXY( i,KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,0]),'',clRed);
    XSL  .AddXY( i,KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,1]),'',clRed);
    XMean.AddXY( i,Mean,'',clRed);

    X3U  .AddXY( i,KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,3])+3*KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,2]),'',clBlack);
    X3L  .AddXY( i,KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,3])-3*KC_StrToFloat(SG01.Cells[CB_Type.ItemIndex+9,2]),'',clBlack);
  End;
  For j := low(HDat) to High(HDat) do
      HDt.AddXY( (HMin+(j+1)*HAve),HDat[j],'',clRed);

  LBDt.Sort;
  For i:=LBDt.Count-1 downto 0 do
    if (POS('-',LBDt.Strings[i]) <> 0) Then
      BDt.Add(KC_StrToFloat(Trim(LBDt.Strings[i])),'',clBlue);

  For i:=0 to LBDt.Count-1 do
    if (POS('-',LBDt.Strings[i]) =  0) Then
      BDt.Add(KC_StrToFloat(Trim(LBDt.Strings[i])),'',clBlue);
  LBDt .Free;
end;

procedure TF_D20.B_OKClick(Sender: TObject);
begin
  SG02Ini;
  SG01Ini;
  OpenFP1;
  SG02Snd;
  SG01Snd;
  SetType;
  AddConstSeries;
end;

procedure TF_D20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SPC.Free;
  KC_CloseExcel(V);
end;

procedure TF_D20.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with Sender as TStringGrid do
  begin
    if (Cells[ACol,ARow] <> '*首檢') and (Cells[ACol,ARow] <> '*尾檢') Then Exit;
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := clRed;
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left , Rect.Top + 2, Cells[ACol,ARow]);
    if (gdSelected in State) then
    Begin
       Canvas.Brush.Color := clBlack;
       Canvas.FrameRect(Rect);
       Canvas.DrawFocusRect(Rect);
    End;
  End;
end;

procedure TF_D20.CBTypeChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to CB_SPEC.Items.Count do
    if (POS(CBType.Text,CB_SPEC.Items.Strings[i]) <> 0) Then CB_SPEC.ItemIndex := i;
end;

procedure TF_D20.CB_TypeChange(Sender: TObject);
begin
  AddConstSeries;
end;

procedure TF_D20.CB_CPKChange(Sender: TObject);
begin
  SG01Snd;
  AddConstSeries;
end;

procedure TF_D20.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D20.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D20.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG02.RowCount-1 do
  for i:=0 to SG02.ColCount-1 do
    if (SG02.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG02.Cells[i,j];
end;

end.


