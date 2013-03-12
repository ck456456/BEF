unit U_D07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TeEngine, TeeTools, Series, GanttCh, DB,
  TeeLegendScrollBar, TeeProcs, Chart, TeeComma, Grids, ComCtrls, ExtCtrls, DBClient,
  TeeExtraLegendTool, TeeSelectorTool, CIM_Grid;

type
  TF_D07 = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    Label11: TLabel;
    Label3: TLabel;
    L_Type: TLabel;
    CB_001: TComboBox;
    E_BDT: TEdit;
    E_EDT: TEdit;
    CB_Type: TComboBox;
    Panel3: TPanel;
    PC01: TPageControl;
    TS01: TTabSheet;
    TS02: TTabSheet;
    SG02: TStringGrid;
    TS03: TTabSheet;
    CmdEve01: TTeeCommander;
    CEve01: TChart;
    SEveDown: TBarSeries;
    SEveUp: TBarSeries;
    TS04: TTabSheet;
    PC02: TPageControl;
    TS0401: TTabSheet;
    TeeCommander2: TTeeCommander;
    Chart1: TChart;
    SC01: TPieSeries;
    TS0402: TTabSheet;
    TeeCommander3: TTeeCommander;
    Chart2: TChart;
    SC02: TPieSeries;
    TS05: TTabSheet;
    CmdEve02: TTeeCommander;
    CEve02: TChart;
    Utilization: TLineSeries;
    ChartTool1: TLegendScrollBar;
    TS06: TTabSheet;
    TeeCommander1: TTeeCommander;
    Obs: TChart;
    SObs: TGanttSeries;
    ChartTool2: TAxisArrowTool;
    Panel2: TPanel;
    B_Cls: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    ChartTool3: TDragMarksTool;
    ChartTool4: TExtraLegendTool;
    ChartTool5: TDragMarksTool;
    ChartTool6: TExtraLegendTool;
    ChartTool7: TDragMarksTool;
    SG01: TCIM_Grid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB_001Change(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure CB_BLnChange(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    V  : Variant;
    GoNow : TDateTime;
    SL01 : TStringList;
    SLxx : TStringList;
    SEv: array of TBarSeries;
    function  GetHr(S1,S2 : String) : String;
    function  GetMin(S1,S2 : String) : String;
    procedure OpenF16(S1,S2 : String);
    procedure OpenF19(S1,S2 : String);
    procedure OpenF17(S1,S2,S3 : String);
    procedure SG01INI(TSG:TStringGrid);
    procedure SG02INI(TSG:TStringGrid);
    procedure LoadLne(S1 : String);
    procedure SendSL01; overload;
    procedure SendSL01(FF : TClientDataSet); overload;
    procedure SendSG01;
    procedure SendSG02;
    procedure Chrt3Ini;
    procedure Chrt1Snd;
    procedure Chrt1Add;
    procedure Chrt4Add;
    procedure Chrt2Snd01;
    procedure Chrt2Snd02;
    procedure Chrt3Snd;
    procedure Chrt4Snd;
  public
    { Public declarations }
  end;

var
  F_D07: TF_D07;

implementation

uses U_KcPub, U_D, U_F, U_V04;

{$R *.dfm}

procedure TF_D07.LoadLne(S1 : String);
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

procedure TF_D07.SG01INI(TSG:TStringGrid);
begin
  KC_SGClear(0,SG01);
  TSG.Cells[00,00] := 'Line';
  TSG.Cells[01,00] := 'Running';
  TSG.Cells[02,00] := 'Begin  DateTime';
  TSG.Cells[03,00] := 'Finish DateTime';
  TSG.Cells[04,00] := 'Run/Event no';
  TSG.Cells[05,00] := 'Product';
  TSG.Cells[06,00] := 'Min';
  TSG.Cells[07,00] := '線速 M/min';
  TSG.Cells[08,00] := 'hr';
  TSG.Cells[09,00] := '收料';
  TSG.Cells[10,00] := '損耗';
  TSG.Cells[11,00] := 'Start OPID';
  TSG.Cells[12,00] := 'Start Note';
  TSG.Cells[13,00] := 'Finish OPID';
  TSG.Cells[14,00] := 'Finish Note';
  TSG.Cells[15,00] := 'Run/Event';
  SG01.AutoSize;
end;

procedure TF_D07.SG02INI(TSG:TStringGrid);
var
  i,j : Integer;
begin
  KC_SGClear(0,SG02);
  TSG.Cells[00,00] := 'Line';
  TSG.Cells[01,00] := 'Running'#255'$0080FF80';
  TSG.Cells[02,00] := '未褙膜'#255'$0000AE00';
  TSG.Cells[03,00] := '已褙膜'#255'$0000AE00';
  TSG.Cells[04,00] := '自動報廢'#255'$0081FECC';
  TSG.Cells[05,00] := '手動報廢'#255'$0081FECC';
  TSG.Cells[06,00] := 'Idle'#255'$0000CACA';
  j := 7;
  D.F11.First;
  While not D.F11.Eof do
  Begin
    if (D.F11.FieldByName('BEF11001').AsString='9999') or
       (D.F11.FieldByName('BEF11101').AsString<>CB_001.Text) Then
    Begin
      D.F11.Next;
      Continue;
    End;
    TSG.Cells[j,00] := D.F11.FieldByName('BEF11002').AsString+#255+
                       D.F11.FieldByName('BEF11001').AsString+#255+
                       D.F11.FieldByName('BEF11102').AsString+#255+
                       D.F11.FieldByName('BEF11103').AsString+#255+
                       D.F11.FieldByName('BEF11104').AsString;
    D.F11.Next;
    inc(j);
  End;
  TSG.ColCount := j;
  for i := 6 to TSG.ColCount-1 do TSG.ColWidths[i] := 120;

  i := 1;
  D.F12.First;
  While not D.F12.eof do
  Begin
    if((D.F12.FieldByName('BEF12001').AsString<>CB_001.Text) or
       (D.F12.FieldByName('BEF12002').AsString<(CB_BLn.Text)) or
       (D.F12.FieldByName('BEF12002').AsString>(CB_ELn.Text+'z'))) Then
    Begin
      D.F12.Next;
      Continue;
    End;
    TSG.Cells[00,i] := D.F12.FieldByName('BEF12002').ASSTRING;
    inc(i);
    D.F12.Next;
  End;
  TSG.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_D07.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  SL01 := TStringList.Create;
  SLxx := TStringList.Create;
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  LoadLne(CB_001.Text);
  D.OpenF11;
  D.OpenF12;
  SG01INI(SG01);
  SG02INI(SG02);
  SObs.Clear;
end;

procedure TF_D07.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SLxx.Free;
  KC_CloseExcel(V);
end;

procedure TF_D07.CB_001Change(Sender: TObject);
begin
  LoadLne(CB_001.Text);
  SG01INI(SG01);
  SG02INI(SG02);
end;

procedure TF_D07.OpenF19(S1,S2 : String);
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19102 >= '''+S1+
                                           ''' and BEF19102 <= '''+S2+
                                      ''' Order by BEF19102';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_D07.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 >= '''+S1+
                                           ''' and BEF16102 <= '''+S2+
                                      ''' Order by BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D07.OpenF17(S1,S2,S3 : String);
begin
  KC_T3Close(D.F17,D.SC);
  D.F17.CommandText := 'SELECT * FROM BEFF17 Where BEF17001 =  '''+S1+
                                           ''' and BEF17102 >= '''+S2+
                                           ''' and BEF17102 <= '''+S3+
                                      ''' Order by BEF17002,BEF17102';
  KC_T3OPEN(D.F17,D.SC);
  D.F17.First;
end;

procedure TF_D07.SendSL01(FF : TClientDataSet);
var
  SS : array[1..12] of String;
  D1,D2,D3,D4 : TDateTime;
  S1,S2,S3,S4,S5,S6 : String;
  i : integer;
begin
  D1 := KC_B2DateTime(E_BDT.Text);// KC_B2Day(E_BDT.Text)+  F.DayNight.BeginDay;
  D2 := KC_B2DateTime(E_EDT.Text);// KC_B2Day(E_EDT.Text)+1+F.DayNight.BeginDay;
  i := 0;
  if (FF.Name = 'F17') Then i := 0;
  if (FF.Name = 'F16') Then i := 1;
  if (FF.Name = 'F19') Then i := 2;
  case i of
    0 : Begin
          SS[01] := 'BEF17002';  // Line No.
          SS[02] := 'BEF17003';  // Event No.
          SS[03] := 'BEF17101';  // 0.Hold 1.Running 2.Finish 3.Fail
          SS[04] := 'BEF17102';  // Begin  DateTime
          SS[05] := 'BEF17103';  // Finish DateTime
          SS[06] := 'BEF17201';  // Start OPID
          SS[07] := 'BEF17299';  // Start Note
          SS[08] := 'BEF17301';  // Finish OPID
          SS[09] := 'BEF17399';  // Finish Note
          SS[10] := '';  // OK
          SS[11] := '';  // NG
          SS[12] := 'BEF17104';  // Product
          S4 := 'Event';
        End;
    1 : Begin
          SS[01] := 'BEF16005';  // Line No.
          SS[02] := 'BEF16001';  // Run No.
          SS[03] := 'BEF16101';  // 0.Hold 1.Running 2.Finish 3.Fail
          SS[04] := 'BEF16102';  // Begin  DateTime
          SS[05] := 'BEF16103';  // Finish DateTime
          SS[06] := 'BEF16201';  // Start OPID
          SS[07] := 'BEF16299';  // Start Note
          SS[08] := 'BEF16301';  // Finish OPID
          SS[09] := 'BEF16399';  // Finish Note
          SS[10] := 'BEF16303';  // OK
          SS[11] := 'BEF16306';  // NG
          SS[12] := 'BEF16003';  // Product
          S4 := 'Run';
        End;
    2 : Begin
          SS[01] := 'BEF19005';  // Line No.
          SS[02] := 'BEF19001-BEF19007';  // Run No.
          SS[03] := 'BEF19101';  // 0.Hold 1.Running 2.Finish 3.Fail
          SS[04] := 'BEF19102';  // Begin  DateTime
          SS[05] := 'BEF19103';  // Finish DateTime
          SS[06] := 'BEF19201';  // Start OPID
          SS[07] := 'BEF19299';  // Start Note
          SS[08] := 'BEF19301';  // Finish OPID
          SS[09] := 'BEF19399';  // Finish Note
          SS[10] := 'BEF19303';  // OK
          SS[11] := 'BEF19306';  // NG
          SS[12] := 'BEF19003';  // Product
          S4 := 'Run';
        End;
  End;
  FF.First;
  While not FF.Eof do
  Begin
    D3 := F.KCTime(FF.FieldByName(SS[4]).ASSTRING,GoNow);
    D4 := iif((FF.FieldByName(SS[3]).ASSTRING <'2'),GoNow,F.KCTime(FF.FieldByName(SS[5]).ASSTRING,GoNow));
    if ((D4 < D1) or
        (D3 > D2))  Then
    Begin
      FF.Next;
      Continue;
    End;
    if((FF.FieldByName(SS[1]).ASSTRING <  CB_BLn.Text) or
       (FF.FieldByName(SS[1]).ASSTRING > (CB_ELn.Text+'z'))) Then
    Begin
      FF.Next;
      Continue;
    End;
    S1 := ''; S2 := ''; S3 := ''; S5 := '';
    if (SS[10]<>'') Then S1 := format('%0.2f',[FF.FieldByName(SS[10]).ASFloat]);
    if (SS[11]<>'') Then S2 := format('%0.2f',[FF.FieldByName(SS[11]).ASFloat]);
    case i of
        0 : Begin
              D.OpenF15(FF.FieldByName(SS[12]).ASSTRING);
              S3 := D.F15.FieldByName('BEF15002').ASSTRING;
            End;
      1,2 : S3 := FF.FieldByName(SS[12]).ASSTRING;
    End;
    S6 := '';
    case i of
     0 : Begin
         if (D.F11.Locate('BEF11001',FF.FieldByName(SS[02]).ASSTRING,[loCaseInsensitive])) Then
           S5 := D.F11.FieldByName('BEF11002').ASSTRING;
           S6 := FF.FieldByName(SS[02]).ASSTRING;
         End;
     1 : S5 := FF.FieldByName(SS[2]).ASSTRING;
     2 : S5 := FF.FieldByName(KC_GetSubStr('-',SS[2],1)).ASSTRING+'-'+
               FF.FieldByName(KC_GetSubStr('-',SS[2],2)).ASSTRING;
    End;
    SL01.Add(FF.FieldByName(SS[1]).ASSTRING+#255+      // 01.Line No.
             ''+#255+                                  // 02.SubLine
             FormatDateTime('yyyymmddhhnnss',D3)+#255+ // 03.Begin  DateTime
             FormatDateTime('yyyymmddhhnnss',D4)+#255+ // 04.Finish DateTime
             S5+#255+                                  // 05.Run No.
             FF.FieldByName(SS[3]).ASSTRING+#255+      // 06.0.Hold 1.Running 2.Finish 3.Fail
             FF.FieldByName(SS[6]).ASSTRING+#255+      // 07.Start OPID
             FF.FieldByName(SS[7]).ASSTRING+#255+      // 08.Start Note
             FF.FieldByName(SS[8]).ASSTRING+#255+      // 09.Finish OPID
             FF.FieldByName(SS[9]).ASSTRING+#255+      // 10.Finish Note
             S1+#255+                                  // 11.OK
             S2+#255+                                  // 12.NG
             S3+#255+                                  // 13.Product
             S4+#255+                                  // 14.Run,Event
             S6);                                      // 15.No
    FF.Next;
  End;
end;

procedure TF_D07.SendSL01;
var
  D1,D2 : String;
begin
  D1  := KC_Data2B((KC_B2Day(E_BDT.Text)-100));
  D2  := KC_Data2B((KC_B2Day(E_EDT.Text)+2));
  SL01.Clear;
  OpenF17(CB_001.Text,D1,D2);
  SendSL01(D.F17);
  case CB_001.ItemIndex of
    0 : Begin
          OpenF16(D1,D2);
          SendSL01(D.F16);
        End;
    1 : Begin
          OpenF19(D1,D2);
          SendSL01(D.F19);
        End;
  End;
  SL01.Sort;
end;

procedure TF_D07.SendSG02;
var
  i,j,k : Integer;
  D1,D2,D3,D4 : TDateTime;
  TotTme : TDateTime;
  RunningTme : TDateTime;
  SumTme : TDateTime;
  S1 : String;
begin
  D1 := KC_B2DateTime(E_BDT.Text);//KC_B2Day(E_BDT.Text)+  F.DayNight.BeginDay;
  D2 := KC_B2DateTime(E_EDT.Text);//KC_B2Day(E_EDT.Text)+1+F.DayNight.BeginDay;
  for i:=1 to (SG02.RowCount-1) do
  Begin
    TotTme := (D2-D1)*24;
    SumTme := 0;
    for j:=1 to (SG02.ColCount-1) do
    Begin
      if (j=6) Then Continue; // Idle
      case j of
        1..5 : S1 := 'Run';
      else     S1 := 'Event';
      End;
      RunningTme := 0;
      for k:=0 to (SL01.Count-1) do
      Begin
        if (SG02.Cells[0,i]<>KC_GetSubStr(#255,SL01.Strings[k],1)) Then Continue; // line
        if (S1<>KC_GetSubStr(#255,SL01.Strings[k],14)) Then Continue; // Event/Run
        if ((j=1) and ('1'<>KC_GetSubStr(#255,SL01.Strings[k],6))) Then Continue; // Running
        if ((j=2) and ('2'<>KC_GetSubStr(#255,SL01.Strings[k],6))) Then Continue; // 未褙膜
        if ((j=3) and ('3'<>KC_GetSubStr(#255,SL01.Strings[k],6))) Then Continue; // 已褙膜
        if ((j=4) and ('4'<>KC_GetSubStr(#255,SL01.Strings[k],6))) Then Continue; // 自動報廢
        if ((j=5) and ('5'<>KC_GetSubStr(#255,SL01.Strings[k],6))) Then Continue; // 手動報廢
        if ((S1='Event') and (KC_GetSubStr(#255,SG02.Cells[j,0],1)<>KC_GetSubStr(#255,SL01.Strings[k],5))) Then Continue;
        D3 := F.KCTime(KC_GetSubStr(#255,SL01.Strings[k],3),GoNow);
        D4 := F.KCTime(KC_GetSubStr(#255,SL01.Strings[k],4),GoNow);
        D3 := iif((D1>D3),D1,D3);
        D4 := iif((D2<D4),D2,D4);
        RunningTme := RunningTme+F.Hr(D3,D4);
        SumTme := SumTme+F.Hr(D3,D4);
      End;
      SG02.Cells[j,i]:= Format('%2.2f',[RunningTme]);
    End;
    SG02.Cells[6,i]:= Format('%2.2f',[TotTme-sumTme])
  End;
  KC_ColAutoSize(SG02);
end;

function  TF_D07.GetMin(S1,S2 : String) : String;
var
  T1,T2 : String;
  D1,D2 : TDateTime;
begin
  D1 := KC_B2DateTime(E_BDT.Text);// KC_B2Day(E_BDT.Text)+  F.DayNight.BeginDay;
  D2 := KC_B2DateTime(E_EDT.Text);//KC_B2Day(E_EDT.Text)+1+F.DayNight.BeginDay;
  T1 := FormatDateTime('yyyymmddhhnnss',D1);
  T2 := FormatDateTime('yyyymmddhhnnss',D2);
  T1 := iif(T1>S1,T1,S1);
  T2 := iif(T2<S2,T2,S2);
  // Result := F.Minute(T1,T2);
  Result := F.Minute(S1,S2);
end;

function  TF_D07.GetHr(S1,S2 : String) : String;
var
  T1,T2 : String;
  D1,D2 : TDateTime;
begin
  D1 := KC_B2DateTime(E_BDT.Text);// KC_B2Day(E_BDT.Text)+  F.DayNight.BeginDay;
  D2 := KC_B2DateTime(E_EDT.Text);// KC_B2Day(E_EDT.Text)+1+F.DayNight.BeginDay;
  T1 := FormatDateTime('yyyymmddhhnnss',D1);
  T2 := FormatDateTime('yyyymmddhhnnss',D2);
  T1 := iif(T1>S1,T1,S1);
  T2 := iif(T2<S2,T2,S2);
  // Result := F.Hr(T1,T2);
  Result := F.Hr(S1,S2);
end;

procedure TF_D07.SendSG01;
var
  i,ARow : integer;
  iBool : Boolean;
begin
  ARow := 1;
  for i:=0 to (SL01.Count-1) do
  Begin
    iBool := true;
    case CB_Type.ItemIndex of
      0 : iBool := true;
      1 : iBool := (KC_GetSubStr(#255,SL01.Strings[i],14) = 'Run');
      2 : iBool := (KC_GetSubStr(#255,SL01.Strings[i],14) = 'Event');
    End;
    SG01.Cells[05,ARow] := '--';
    if not iBool Then Continue;

    SG01.Cells[00,ARow] := KC_GetSubStr(#255,SL01.Strings[i],01);
    SG01.Cells[01,ARow] := F.Running00(KC_GetSubStr(#255,SL01.Strings[i],06));
    SG01.Cells[02,ARow] := KC_GetSubStr(#255,SL01.Strings[i],03);
    SG01.Cells[03,ARow] := KC_GetSubStr(#255,SL01.Strings[i],04);
    SG01.Cells[04,ARow] := KC_GetSubStr(#255,SL01.Strings[i],05);
    SG01.Cells[05,ARow] := KC_GetSubStr(#255,SL01.Strings[i],13);
    SG01.Cells[06,ARow] := GetMin(KC_GetSubStr(#255,SL01.Strings[i],03),KC_GetSubStr(#255,SL01.Strings[i],04));
    SG01.Cells[07,ARow] := '';
    SG01.Cells[08,ARow] := GetHr(KC_GetSubStr(#255,SL01.Strings[i],03),KC_GetSubStr(#255,SL01.Strings[i],04));
    SG01.Cells[09,ARow] := KC_GetSubStr(#255,SL01.Strings[i],11);
    SG01.Cells[10,ARow] := KC_GetSubStr(#255,SL01.Strings[i],12);
    SG01.Cells[11,ARow] := KC_GetSubStr(#255,SL01.Strings[i],07);
    SG01.Cells[12,ARow] := KC_GetSubStr(#255,SL01.Strings[i],08);
    SG01.Cells[13,ARow] := KC_GetSubStr(#255,SL01.Strings[i],09);
    SG01.Cells[14,ARow] := KC_GetSubStr(#255,SL01.Strings[i],10);
    SG01.Cells[15,ARow] := KC_GetSubStr(#255,SL01.Strings[i],14);
    SG01.Cells[16,ARow] := KC_GetSubStr(#255,SL01.Strings[i],15);
    if ((KC_StrToFloat(SG01.Cells[09,ARow]) <> 0) and
        (KC_StrToFloat(SG01.Cells[06,ARow]) <> 0)) Then
        SG01.Cells[07,ARow] := format('%0.2f',[KC_StrToFloat(SG01.Cells[09,ARow])/KC_StrToFloat(SG01.Cells[06,ARow])]);
    inc(ARow);
  End;
  SG01.RowCount := iif(SL01.Count=0,2,ARow);
  SG01.AutoSize;
end;

procedure TF_D07.Chrt1Add;
var
  i,j : integer;
  k : Real;
  S : String;
begin
  SLxx.Clear;
  for i := 1 to (SG02.ColCount-1) do
  Begin
    k := 0;
    for j := 1 to (SG02.RowCount-1) do
    Begin
      k:=k+KC_StrToFloat(SG02.Cells[i,j]);
    End;
    S := SG02.Cells[i,0];
    // S := KC_GetSubStr(#255,SG02.Cells[i,0],1);
    if (k<>0) Then
      case i of
        1..5 : SLxx.Add('F'+#255+KC_GetSubStr(#255,S,1)+#255+FloatToStr(k)+#255+KC_GetSubStr(#255,SG02.Cells[i,0],2));
           6 : SLxx.Add('T'+#255+KC_GetSubStr(#255,S,1)+#255+FloatToStr(k)+#255+KC_GetSubStr(#255,SG02.Cells[i,0],2));
       else    SLxx.Add(KC_GetSubStr(#255,S,4)+#255+
                        KC_GetSubStr(#255,S,1)+'-'+
                        KC_GetSubStr(#255,S,3)+#255+
                        FloatToStr(k)+#255+
                        KC_GetSubStr(#255,SG02.Cells[i,0],5));
      End;
  End;
end;

procedure TF_D07.Chrt1Snd;
var
  i : integer;
  i1,i2 : integer;
begin
  SEveUp.Clear;
  SEveDown.Clear;
  Chrt1Add;
  i1:=0;
  i2:=0;
  For i:=0 to SLxx.Count-1 do
  Begin
    if (KC_GetSubStr(#255,SLxx.Strings[i],1) = 'T') Then
    Begin
        SEveDown.AddXY(i2,StrToFloat(KC_GetSubStr(#255,SLxx.Strings[i],3)),
                                     KC_GetSubStr(#255,SLxx.Strings[i],2),
                            StrToInt(KC_GetSubStr(#255,SLxx.Strings[i],4)));
        inc(i2);
    End;
    if (KC_GetSubStr(#255,SLxx.Strings[i],1) <>'T') Then
    Begin
        SEveUp  .AddXY(i1,StrToFloat(KC_GetSubStr(#255,SLxx.Strings[i],3)),
                                     KC_GetSubStr(#255,SLxx.Strings[i],2),
                            StrToInt(KC_GetSubStr(#255,SLxx.Strings[i],4)));
        inc(i1);
    End;
  End;
end;

procedure TF_D07.Chrt2Snd01;
var
  i : integer;
  i1 : integer;
begin
  SC01.Clear;
  Chrt1Add;
  i1 := 0;
  For i:=0 to SLxx.Count-1 do
  Begin
    SC01.AddXY(i1,StrToFloat(KC_GetSubStr(#255,SLxx.Strings[i],3)),
                             KC_GetSubStr(#255,SLxx.Strings[i],2),
                    StrToInt(KC_GetSubStr(#255,SLxx.Strings[i],4)));
    inc(i1);
  End;
end;

procedure TF_D07.Chrt2Snd02;
var
  i : integer;
  f1,f2 : Real;
begin
  SC02.Clear;
  Chrt1Add;
  f1 := 0;
  f2 := 0;
  For i:=0 to SLxx.Count-1 do
  Begin
    if (KC_GetSubStr(#255,SLxx.Strings[i],1)<> 'T') Then f1 := f1+StrToFloat(KC_GetSubStr(#255,SLxx.Strings[i],3));
    if (KC_GetSubStr(#255,SLxx.Strings[i],1) = 'T') Then f2 := f2+StrToFloat(KC_GetSubStr(#255,SLxx.Strings[i],3));
  End;
  SC02.AddXY(1,f1,'Uptime',clGreen);
  SC02.AddXY(2,f2,'Downtime',clRed);
end;

procedure TF_D07.Chrt3Ini;
var
  i : integer;
  S : String;
begin
  Utilization.Clear;
  for i := Low(SEv) to High(SEv) do SEv[i].Free;

  SetLength(SEv,SG02.ColCount-1);
  for i := Low(SEv) to High(SEv) do
  Begin
    SEv[i] := TBarSeries.Create(CEve02);
    S := SG02.Cells[i+1,0];
    if (i < 6) Then
    Begin
      SEv[i].Title := KC_GetSubStr(#255,S,1);
      SEv[i].SeriesColor := StrToInt(KC_GetSubStr(#255,S,2));
    End
    else
    Begin
      SEv[i].Title := KC_GetSubStr(#255,S,1)+'-'+
                      KC_GetSubStr(#255,S,3)+'('+
                      KC_GetSubStr(#255,S,4)+')';
      SEv[i].SeriesColor := StrToInt(KC_GetSubStr(#255,S,5));
    End;
    SEv[i].MultiBar := mbStacked;
    SEv[i].Marks.Visible := False;
    SEv[i].StackGroup := iif(KC_GetSubStr(#255,S,4) = 'T',1,0);
    if (AnsiLowerCase(SEv[i].Title) = 'idle') Then SEv[i].StackGroup := 1;
    // SEv[i].Visible := (SEv[i].StackGroup = 1);
    SEv[i].Visible := (AnsiLowerCase(SEv[i].Title) = 'idle');
    CEve02.AddSeries(SEv[i]);
  End;
  for i := Low(SEv) to High(SEv) do CEve02.SeriesDown(Utilization);
end;

procedure TF_D07.Chrt3Snd;
var
  S : String;
  i,j : integer;
  Yd,Yc : Real;
begin
  Chrt3Ini;
  for j := 1 to (SG02.RowCount-1) do
  Begin
    Yd := 0;
    Yc := 0;
    for i := Low(SEv) to High(SEv) do
    Begin
      S := SG02.Cells[0,j];
      SEv[i].AddXY(j,KC_StrToFloat(SG02.Cells[i+1,j]),
                     S,SEv[i].SeriesColor);
      Yc := Yc + KC_StrToFloat(SG02.Cells[i+1,j]);
      if (SEv[i].StackGroup=0) Then Yd := Yd + KC_StrToFloat(SG02.Cells[i+1,j]);
    End;
    if (Yc<>0) Then Utilization.AddXY(j,(Yd/Yc)*100,S,Utilization.SeriesColor);
  End;
end;

procedure TF_D07.Chrt4Add;
var
  i : integer;
  j : integer;
  S1,S2,S3,S4,S5 : String;
  SS : String;
  DT1,DT2 : TDateTime;
begin
  SLxx.Clear;
  if(SL01.Count = 0) Then Exit;
  SL01.Sort;
  j := 0;
  For i:=0 to SL01.Count-1 do
  Begin
    S1 := KC_GetSubStr(#255,SL01.Strings[i], 1); // 01.Line No.
    S2 := KC_GetSubStr(#255,SL01.Strings[i], 3); // 03.Begin  DateTime
    S3 := KC_GetSubStr(#255,SL01.Strings[i], 4); // 04.Finish DateTime
    S4 := KC_GetSubStr(#255,SL01.Strings[i],14); // 14.Run,Event
    S5 := KC_GetSubStr(#255,SL01.Strings[i], 5)+'-'+ // 05.Run No.
          KC_GetSubStr(#255,SL01.Strings[i],13); // 13.Product
    SLxx.Add(S2+S3+#255+S1);
    DT1 := KC_B2Day(copy(S2,1,8))+KC_B2Time(copy(S2,9,6));
    DT2 := DT1;
    if (S3 <> '') Then DT2 := KC_B2Day(copy(S3,1,8))+KC_B2Time(copy(S3,9,6));
    SObs.AddGanttColor(DT1,DT2, j,S5,iif((S4 = 'Event'),clRed,clGreen));
    if (i<SL01.Count-1) Then
    Begin
      SS := KC_GetSubStr(#255,SL01.Strings[i+1],1);
      if (S1<>SS) Then inc(j);
    End;
  End;
  SLxx.Sort;
end;

procedure TF_D07.Chrt4Snd;
begin
  SObs.Clear;
  Chrt4Add;
  Obs.BottomAxis.SetMinMax(SObs.EndValues.MaxValue-1,SObs.EndValues.MaxValue);
end;

procedure TF_D07.B_OKClick(Sender: TObject);
begin
  GoNow := F.IdTime.DateTime;
  SG01INI(SG01);
  SG02INI(SG02);
  SendSL01;
  SendSG01;
  SendSG02;
  Chrt1Snd;
  Chrt2Snd01;
  Chrt2Snd02;
  Chrt3Snd;
  Chrt4Snd;
end;

procedure TF_D07.B_ExcelClick(Sender: TObject);
var
  i,j,k : integer;
  W   : Variant;
begin
  KC_CopyToTemp(F.WorkDir,'D07.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D07.xls');
  W := V.Workbooks[1].WorkSheets['Report'];
  k := 1;
  For j:=0 to SG01.RowCount-1 do
  Begin
    For i:=0 to SG01.ColCount-0 do
    Begin
      if (SG01.Cells[i,j] = '') Then Continue;
      W.Cells[k+12,i+02].Value  := SG01.Cells[i,j];
    End;
    inc(k);
  End;
  W := V.Workbooks[1].WorkSheets['Downtime'];
  k := 1;
  For j:=0 to SG02.RowCount-1 do
  Begin
    For i:=0 to SG02.ColCount-0 do
    Begin
      if (SG02.Cells[i,j] = '') Then Continue;
      W.Cells[k+12,i+02].Value  := KC_GetSubStr(#255,SG02.Cells[i,j],1);
    End;
    inc(k);
  End;
end;

procedure TF_D07.CB_BLnChange(Sender: TObject);
begin
  SG01INI(SG01);
  SG02INI(SG02);
end;

procedure TF_D07.SG01DblClick(Sender: TObject);
begin
  if (SG01.Cells[15,SG01.Row] <> 'Event') Then Exit;
  F_V04 := TF_V04.Create(Application);
  F_V04.Kind := 3;
  F_V04.L_001.Caption := CB_001.Text;
  F_V04.L_002.Caption := SG01.Cells[00,SG01.Row];
  F_V04.L_003.Caption := SG01.Cells[16,SG01.Row]+#255+SG01.Cells[04,SG01.Row];
  F_V04.L_102.Caption := copy(SG01.Cells[2,SG01.Row],1,8)+'-'+
                         copy(SG01.Cells[2,SG01.Row],9,6);
  F_V04.ShowModal;
  F_V04.Free;
  D.OpenF11;
end;

end.


