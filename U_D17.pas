unit U_D17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_D17 = class(TForm)
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
    Panel1: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01      : TStringList;
    procedure OpenWF05;
    procedure OpenWF15;
    procedure OpenF19;
    procedure LoadLne(S1 : String);
    procedure PWorkLd(CB :TComboBox);
    procedure PTypeLd(CB :TComboBox);
    procedure SG01Ini;
    procedure SG01Snd;
  public
    { Public declarations }
  end;

var
  F_D17: TF_D17;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_D17.OpenWF05;
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT BEF05001 FROM BEFF05 Where BEF05002='''+CBType.Text+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

procedure TF_D17.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D17.PTypeLd(CB :TComboBox);
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

procedure TF_D17.LoadLne(S1 : String);
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

procedure TF_D17.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D17.SG01Ini;
var
  iCol : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Date';                 // BEF19102
  SG01.Cells[01,0] := 'Working No.';          // BEF19006
  SG01.Cells[02,0] := 'BEF Run No.';          // BEF19001+BEF19007
  SG01.Cells[03,0] := 'Product Type';         // BEF16002
  SG01.Cells[04,0] := '上保種類';             //
  SG01.Cells[05,0] := '上保編號';             // BEF19202
  SG01.Cells[06,0] := '下保種類';             //
  SG01.Cells[07,0] := '下保編號';             // BEF19203
  SG01.Cells[08,0] := '生產寬幅(mm)';         //
  SG01.Cells[09,0] := '收料長度(m)';          // BEF19303
  SG01.Cells[10,0] := 'QA Note';              // BEF19499
  SG01.Cells[11,0] := '首檢/尾檢';              // BEF19499
  D.OpenF08('褙膜站',D.F00.FieldByName('BEF00400').AsString);
  iCol := 12;
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

procedure TF_D17.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  D.OpenF00;
  D.OpenF05;
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  PTypeLd(CBType);
  LoadLne('褙膜站');
  SG01Ini;
end;

procedure TF_D17.OpenF19;
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
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := SQL;
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_D17.SG01Snd;
var
  S1,S2 : String;
  i,j,k : integer;
  iRow  : integer;
begin
  KC_SGClear(1,SG01);
  D.F19.First;
  i := 1;
  While not D.F19.Eof do
  Begin
    if (CBType.ItemIndex <> 0) and (D.F19.FieldByName('BEF19002').AsString <> CBType.Text) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    SG01.Cells[00,i] := copy(D.F19.FieldByName('BEF19102').AsString,1,8);
    SG01.Cells[01,i] := D.F19.FieldByName('BEF19006').AsString;
    SG01.Cells[02,i] := D.F19.FieldByName('BEF19001').AsString+'-'+D.F19.FieldByName('BEF19007').AsString;
    D.OpenF16(D.F19.FieldByName('BEF19001').AsString);
    D.OpenF13(D.F19.FieldByName('BEF19202').AsString);
    S1 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.F13.FieldByName('BEF13002').AsString]), [loCaseInsensitive]) Then
      S1 := D.F05.FieldByName('BEF05104').ASString;
    SG01.Cells[03,i] := D.F16.FieldByName('BEF16002').AsString;
    SG01.Cells[04,i] := S1;
    SG01.Cells[05,i] := D.F19.FieldByName('BEF19202').AsString;

    D.OpenF14(D.F19.FieldByName('BEF19203').AsString);
    S1 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.F14.FieldByName('BEF14002').AsString]), [loCaseInsensitive]) Then
      S1 := D.F05.FieldByName('BEF05104').ASString;
    SG01.Cells[06,i] := S1;
    SG01.Cells[07,i] := D.F19.FieldByName('BEF19203').AsString;
    SG01.Cells[08,i] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[09,i] := D.F19.FieldByName('BEF19303').AsString;
    SG01.Cells[10,i] := D.F19.FieldByName('BEF19499').AsString;
    SG01.Cells[11,i]   := '首檢';
    SG01.Cells[11,i+1] := '尾檢';
    SL01.Assign(D.F19.FieldByName('BEF19901'));
    for j := 12 to SG01.ColCount-1 do
    Begin
      S1 := KC_GetSubStr(#255,SG01.Cells[j,0],1);
      for k := 0 to SL01.Count-1 do
      Begin
        S2 := SL01.Strings[k];
        if (KC_GetSubStr(#255,S2,1) <> '褙膜站') Then Continue;
        if (KC_GetSubStr(#255,S2,3) <> D.F00.FieldByName('BEF00400').AsString) Then Continue;
        if (KC_GetSubStr(#255,S2,4) <> S1) Then Continue;
        iRow := -1;
        if (KC_GetSubStr(#255,S2,2) = '首檢') Then iRow :=  0;
        if (KC_GetSubStr(#255,S2,2) = '尾檢') Then iRow :=  1;
        if (iRow = -1) Then Continue;
        SG01.Cells[j,i+iRow] := KC_GetSubStr(#255,S2,6);
      End;
    End;
    inc(i,2);
    D.F19.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_D17.B_OKClick(Sender: TObject);
begin
  SG01INI;
  OpenF19;
  SG01Snd;
end;

procedure TF_D17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D17.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D17.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D17.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

end.

