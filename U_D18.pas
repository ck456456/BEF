unit U_D18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, ExtCtrls, TeeComma, Series,
  TeEngine, TeeProcs, Chart;

type
  TF_D18 = class(TForm)
    P_Main: TPanel;
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
    B_Excel: TBitBtn;
    PageControl1: TPageControl;
    TS01: TTabSheet;
    TS02: TTabSheet;
    TS03: TTabSheet;
    TS04: TTabSheet;
    SG01: TStringGrid;
    Chart1: TChart;
    T00: TBarSeries;
    T01: TLineSeries;
    TeeCommander1: TTeeCommander;
    TeeCommander2: TTeeCommander;
    Chart2: TChart;
    T10: TBarSeries;
    T11: TLineSeries;
    TeeCommander3: TTeeCommander;
    Chart3: TChart;
    T20: TBarSeries;
    T21: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01      : TStringList;
    procedure OpenWF15;
    procedure OpenF16;
    procedure LoadLne(S1 : String);
    procedure PWorkLd(CB :TComboBox);
    procedure PTypeLd(CB :TComboBox);
    procedure SG01Ini;
    procedure SG01Snd;
    procedure ChrtAll;
    procedure ChartClear;
    procedure AddSLTPar(S1 : String);
    procedure AddTPar(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D18: TF_D18;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_D18.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D18.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D18.PTypeLd(CB :TComboBox);
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

procedure TF_D18.LoadLne(S1 : String);
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

procedure TF_D18.SG01Ini;
var
  iCol : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Date';             // BEF16102
  SG01.Cells[01,0] := 'Run No.';          // BEF16001
  SG01.Cells[02,0] := 'Product Type';     // BEF16002
  SG01.Cells[03,0] := 'Line Number';      // BEF16005
  SG01.Cells[04,0] := 'Roller No.';       // BEF16204
  SG01.Cells[05,0] := '收料長度(m)';      // BEF16303
  SG01.Cells[06,0] := '寬幅(mm)';         // BEF16304
  SG01.Cells[07,0] := '級別';             // BEF16308
  SG01.Cells[08,0] := '首檢/尾檢';
  D.OpenF08('成型站',D.F00.FieldByName('BEF00305').AsString);
  iCol := 9;
  While not D.F08.Eof do
  Begin
    SG01.Cells[iCol,0] := D.F08.FieldByName('BEF08101').AsString+#255+
                          D.F08.FieldByName('BEF08102').AsString;
    inc(iCol);
    D.F08.Next;
  End;
  SG01.ColCount := iCol;
  KC_ColAutoSize(SG01);
end;

procedure TF_D18.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  D.OpenF00;
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  PTypeLd(CBType);
  LoadLne('成型站');
  SG01Ini;
end;

procedure TF_D18.OpenF16;
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
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D18.SG01Snd;
var
  S1,S2 : String;
  i,j,k : integer;
  iRow  : integer;
begin
  KC_SGClear(1,SG01);
  D.F16.First;
  i := 1;
  While not D.F16.Eof do
  Begin
    if (CBType.ItemIndex <> 0) and (D.F16.FieldByName('BEF16002').AsString <> CBType.Text) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SG01.Cells[00,i] := copy(D.F16.FieldByName('BEF16102').AsString,1,8);
    SG01.Cells[01,i] := D.F16.FieldByName('BEF16001').AsString;
    SG01.Cells[02,i] := D.F16.FieldByName('BEF16002').AsString;
    SG01.Cells[03,i] := D.F16.FieldByName('BEF16005').AsString;
    SG01.Cells[04,i] := D.F16.FieldByName('BEF16204').AsString;
    SG01.Cells[05,i] := D.F16.FieldByName('BEF16303').AsString;
    SG01.Cells[06,i] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[07,i] := D.F16.FieldByName('BEF16308').AsString;
    SG01.Cells[08,i]   := '首檢';
    SG01.Cells[08,i+1] := '尾檢';
    SL01.Assign(D.F16.FieldByName('BEF16902'));
    for j := 9 to SG01.ColCount-1 do
    Begin
      S1 := KC_GetSubStr(#255,SG01.Cells[j,0],1);
      for k := 0 to SL01.Count-1 do
      Begin
        S2 := SL01.Strings[k];
        if (KC_GetSubStr(#255,S2,2) <> D.F00.FieldByName('BEF00305').AsString) Then Continue;
        if (KC_GetSubStr(#255,S2,3) <> S1) Then Continue;
        iRow := -1;
        if (KC_GetSubStr(#255,S2,1) = '成型站-前') Then iRow :=  0;
        if (KC_GetSubStr(#255,S2,1) = '成型站-後') Then iRow :=  1;
        if (iRow = -1) Then Continue;
        SG01.Cells[j,i+iRow] := KC_GetSubStr(#255,S2,5);
      End;
    End;
    inc(i,2);
    D.F16.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_D18.ChartClear;
begin
  T00.Clear;
  T01.Clear;
  T10.Clear;
  T11.Clear;
  T20.Clear;
  T21.Clear;
end;

procedure TF_D18.AddSLTPar(S1 : String);
var
  i,j : integer;
  Qty : integer;
begin
  SL01.Clear;
  For i := 9 to SG01.ColCount-1 do
  Begin
    Qty := 0;
    For j := 1 to SG01.RowCount-1 do
    Begin
      if (S1 = 'ALL')           Then Qty := Qty + KC_StrToInt(SG01.Cells[i,j]);
      if (S1 = SG01.Cells[8,j]) Then Qty := Qty + KC_StrToInt(SG01.Cells[i,j]);
    End;
    if (Qty = 0) Then Continue;
    SL01.Add(KC_IntFillChar(Qty,10,'0')+#255+SG01.Cells[i,0]);
  End;
  SL01.Sort;
End;

procedure TF_D18.AddTPar(S1 : String);
var
  i,m,Sum : Integer;
begin
  Sum := 0;
  m := 0;
  For i := (SL01.Count-1) downto 0 do
    Sum := Sum+KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1));

  For i := (SL01.Count-1) downto 0 do
  Begin
    m := m + KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1));
    if (S1 = 'ALL') Then
    Begin
      T00.AddXY((SL01.Count-1)-i,KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1)),KC_GetSubStr(#255,SL01.Strings[i],3),T00.SeriesColor);
      T01.AddXY((SL01.Count-1)-i,                                      (m/Sum)*100,KC_GetSubStr(#255,SL01.Strings[i],3),T01.SeriesColor);
    End;
    if (S1 = '尾檢') Then
    Begin
      T10.AddXY((SL01.Count-1)-i,KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1)),KC_GetSubStr(#255,SL01.Strings[i],3),T10.SeriesColor);
      T11.AddXY((SL01.Count-1)-i,                                      (m/Sum)*100,KC_GetSubStr(#255,SL01.Strings[i],3),T11.SeriesColor);
    End;
    if (S1 = '首檢') Then
    Begin
      T20.AddXY((SL01.Count-1)-i,KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1)),KC_GetSubStr(#255,SL01.Strings[i],3),T20.SeriesColor);
      T21.AddXY((SL01.Count-1)-i,                                      (m/Sum)*100,KC_GetSubStr(#255,SL01.Strings[i],3),T21.SeriesColor);
    End;
  End;
end;

procedure TF_D18.ChrtAll;
begin
  ChartClear;
  AddSLTPar('ALL');
  AddTPar  ('ALL');
  AddSLTPar('首檢');
  AddTPar  ('首檢');
  AddSLTPar('尾檢');
  AddTPar  ('尾檢');
end;

procedure TF_D18.B_OKClick(Sender: TObject);
begin
  SG01INI;
  OpenF16;
  SG01Snd;
  ChrtAll;
end;

procedure TF_D18.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D18.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D18.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D18.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
  W := V.Workbooks[1].WorkSheets['全部'];
  Chart1.CopyToClipboardBitmap; W.Activate; W.Range['A2'].Activate; W.Paste;
  W := V.Workbooks[1].WorkSheets['尾檢'];
  Chart2.CopyToClipboardBitmap; W.Activate; W.Range['A2'].Activate; W.Paste;
  W := V.Workbooks[1].WorkSheets['首檢'];
  Chart3.CopyToClipboardBitmap; W.Activate; W.Range['A2'].Activate; W.Paste;
end;

end.
