unit U_D19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB, TeeComma, TeEngine,
  Series, TeeProcs, Chart, ComCtrls;

type
  TF_D19 = class(TForm)
    P_Main: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
    B_Excel: TBitBtn;
    Panel1: TPanel;
    CB_000: TComboBox;
    Label3: TLabel;
    PC01: TPageControl;
    TS01: TTabSheet;
    TS02: TTabSheet;
    SG01: TStringGrid;
    Chrt: TChart;
    T20: TBarSeries;
    TeeCommander3: TTeeCommander;
    CBType: TComboBox;
    Label4: TLabel;
    CB_999: TComboBox;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure CB_000Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01      : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure PTypeLd(CB :TComboBox);
    procedure LoadLne(S1 : String);
    procedure SG01Ini;
    procedure SG01Snd;
    procedure ChrtSnd;
    procedure SL01Snd;
    procedure OpenF16;
    procedure OpenF19;
  public
    { Public declarations }
  end;

var
  F_D19: TF_D19;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D19.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D19.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D19.PTypeLd(CB :TComboBox);
begin
  D.OpenF01('T');
  CB.Items.Clear;
  CB.Items.Add('all');
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB.ItemIndex := iif(CB.Items.Count=0,-1,0);
end;

procedure TF_D19.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Date';          // BEF19102
  SG01.Cells[01,0] := 'Working No.';   // BEF19006
  SG01.Cells[02,0] := 'BEF Run No.';   // BEF19001+BEF19007
  SG01.Cells[03,0] := 'Product Type';  // BEF16002
  SG01.Cells[04,0] := '收料長度';      //
  SG01.Cells[05,0] := '損耗長度';      //
  SG01.Cells[06,0] := 'No';            //
  SG01.Cells[07,0] := 'Name';          //
  KC_ColAutoSize(SG01);
end;

procedure TF_D19.LoadLne(S1 : String);
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

procedure TF_D19.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  SL01 := TStringList.Create;
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  D.OpenF00;
  D.OpenF05;
  D.OpenF23;
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  PTypeLd(CBType);
  LoadLne(CB_000.Text);
  SG01Ini;
end;

procedure TF_D19.OpenF16;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFF16 Where BEF16001 >= '''+E_BRun.Text+
                             ''' and BEF16001 <= '''+E_ERun.Text+
                            'z'' and BEF16005 >= '''+CB_BLn.Text+
                             ''' and BEF16005 <= '''+CB_ELn.Text+
                            'z'' and BEF16102 >= '''+E_BDat.Text+
                             ''' and BEF16102 <= '''+E_EDat.Text+
                            'z'' and BEF16006 >= '''+CB_BWNo.Text+
                             ''' and BEF16006 <= '''+CB_EWNo.Text+
                       'z'' Order by BEF16102';
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_D19.OpenF19;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFF19 Where BEF19001 >= '''+E_BRun.Text+
                             ''' and BEF19001 <= '''+E_ERun.Text+
                            'z'' and BEF19005 >= '''+CB_BLn.Text+
                             ''' and BEF19005 <= '''+CB_ELn.Text+
                            'z'' and BEF19102 >= '''+E_BDat.Text+
                             ''' and BEF19102 <= '''+E_EDat.Text+
                            'z'' and BEF19006 >= '''+CB_BWNo.Text+
                             ''' and BEF19006 <= '''+CB_EWNo.Text+
                       'z'' Order by BEF19102';
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_D19.SG01Snd;
var
  i : integer;
  S1,S2,S3 : String;
begin
  KC_SGClear(1,SG01);
  D.FP1.First;
  i := 1;
  S1 := 'BEF16';
  case CB_000.ItemIndex of
    0 : S1 := 'BEF16';
    1 : S1 := 'BEF19';
  End;
  While not D.FP1.Eof do
  Begin
    if (CBType.ItemIndex <> 0) and (D.FP1.FieldByName(S1+'002').AsString <> CBType.Text) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    case CB_000.ItemIndex of
      0 : Begin
            S3 := '';
            case CB_999.ItemIndex of
              0 : S3 := D.FP1.FieldByName('BEF16312').AsString;
              1 : S3 := D.FP1.FieldByName('BEF16314').AsString;
            End;
            S2 := '';
            if  D.F23.Locate('BEF23001;BEF23004;BEF23002',
                          VarArrayOf(['成型站',IntToStr(CB_999.ItemIndex),S3]),
                          [loCaseInsensitive]) Then
              S2 := D.F23.FieldByName('BEF23003').AsString;
            SG01.Cells[00,i] := copy(D.FP1.FieldByName('BEF16102').AsString,1,8);
            SG01.Cells[01,i] :=      D.FP1.FieldByName('BEF16006').AsString;
            SG01.Cells[02,i] :=      D.FP1.FieldByName('BEF16001').AsString;
            SG01.Cells[03,i] :=      D.FP1.FieldByName('BEF16002').AsString;
            SG01.Cells[04,i] :=      D.FP1.FieldByName('BEF16303').AsString;
            SG01.Cells[05,i] :=      D.FP1.FieldByName('BEF16306').AsString;
            SG01.Cells[06,i] :=      S3;
            SG01.Cells[07,i] :=      S2;
          End;
      1 : Begin
            S3 := '';
            case CB_999.ItemIndex of
              0 : S3 := D.FP1.FieldByName('BEF19310').AsString;
              1 : S3 := D.FP1.FieldByName('BEF19311').AsString;
            End;
            S2 := '';
            if  D.F23.Locate('BEF23001;BEF23004;BEF23002',
                          VarArrayOf(['褙膜站', IntToStr(CB_999.ItemIndex),S3]),
                          [loCaseInsensitive]) Then
              S2 := D.F23.FieldByName('BEF23003').AsString;
            SG01.Cells[00,i] := copy(D.FP1.FieldByName('BEF19102').AsString,1,8);
            SG01.Cells[01,i] :=      D.FP1.FieldByName('BEF19006').AsString;
            SG01.Cells[02,i] :=      D.FP1.FieldByName('BEF19001').AsString+'-'+
                                     D.FP1.FieldByName('BEF19007').AsString;
            SG01.Cells[03,i] :=      D.FP1.FieldByName('BEF19002').AsString;
            SG01.Cells[04,i] :=      D.FP1.FieldByName('BEF19303').AsString;
            SG01.Cells[05,i] :=      D.FP1.FieldByName('BEF19306').AsString;
            SG01.Cells[06,i] :=      S3;
            SG01.Cells[07,i] :=      S2;
          End;
    End;
    inc(i);
    D.FP1.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_D19.SL01Snd;
var
  i,j : integer;
  Bool : Boolean;
  Qty : Real;
  S1  : String;
begin
  SL01.Clear;
  S1 := '';
  For i := 1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[06,i] = '') Then Continue;
    Bool := False;
    S1 := SG01.Cells[06,i];
    for j := 0 to SL01.Count-1 do
      if (S1 = KC_GetSubStr(#255,SL01.Strings[j],2)) Then Bool := True;
    if Bool Then Continue;
    Qty := 0;
    for j := 0 to SG01.RowCount-1 do
      if (S1 = SG01.Cells[06,j]) Then
        Qty := Qty+1;
    SL01.Add(KC_FillCharBefore(format('%0.2f',[Qty]),20,'0')+#255+S1);
  End;
  SL01.Sort;
end;

procedure TF_D19.ChrtSnd;
var
  i : integer;
begin
  T20.Clear;
  SL01Snd;
  for i:=0 to SL01.Count-1 do
    T20.AddXY((SL01.Count-1)-i,KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],1)),KC_GetSubStr(#255,SL01.Strings[i],2),T20.SeriesColor);
end;

procedure TF_D19.B_OKClick(Sender: TObject);
begin
  SG01INI;
  case CB_000.ItemIndex of
    0 : OpenF16;
    1 : OpenF19;
  End;
  SG01Snd;
  ChrtSnd;
end;

procedure TF_D19.CB_000Change(Sender: TObject);
begin
  LoadLne(CB_000.Text);
end;

procedure TF_D19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D19.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D19.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D19.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
  W := V.Workbooks[1].WorkSheets['Chart'];
  Chrt.CopyToClipboardBitmap; W.Activate; W.Range['A2'].Activate; W.Paste;
end;

end.



