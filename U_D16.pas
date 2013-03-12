unit U_D16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TF_D16 = class(TForm)
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
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    Panel1: TPanel;
    SG01: TStringGrid;
    E_BRun: TEdit;
    E_ERun: TEdit;
    B_Excel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    V         : Variant;
    procedure OpenWF05;
    procedure OpenWF15;
    procedure OpenF16;
    procedure LoadLne(S1 : String);
    procedure PWorkLd(CB :TComboBox);
    procedure PTypeLd(CB :TComboBox);
    procedure SG01Ini;
    procedure SG01Snd;
  public
    { Public declarations }
  end;

var
  F_D16: TF_D16;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_D16.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D16.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D16.PTypeLd(CB :TComboBox);
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

procedure TF_D16.LoadLne(S1 : String);
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

procedure TF_D16.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Date';             // BEF16102
  SG01.Cells[01,0] := 'Working No.';      // BEF16006
  SG01.Cells[02,0] := 'Run No.';          // BEF16001
  SG01.Cells[03,0] := 'Product Type';     // BEF16002
  SG01.Cells[04,0] := 'Line Number';      // BEF16005
  SG01.Cells[05,0] := 'Roller No.';       // BEF16204
  SG01.Cells[06,0] := '收料長度(m)';      // BEF16303
  SG01.Cells[07,0] := '寬幅(mm)';         // BEF16304
  SG01.Cells[08,0] := '首檢良率';         // BEF16309
  SG01.Cells[09,0] := '尾檢良率';         // BEF16310
  SG01.Cells[10,0] := '級別';             // BEF16308
  SG01.Cells[11,0] := 'QA Note';          // BEF16499
  SG01.Cells[12,0] := 'Begin Date time';  // BEF16102
  SG01.Cells[13,0] := 'Finish date Time'; // BEF16103
  KC_ColAutoSize(SG01);
end;

procedure TF_D16.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDat.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  PTypeLd(CBType);
  LoadLne('成型站');
  SG01Ini;
end;

procedure TF_D16.OpenWF05;
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT BEF05001 FROM BEFF05 Where BEF05002='''+CBType.Text+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

procedure TF_D16.OpenF16;
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

procedure TF_D16.SG01Snd;
var
  i : integer;
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
    SG01.Cells[01,i] := D.F16.FieldByName('BEF16006').AsString;
    SG01.Cells[02,i] := D.F16.FieldByName('BEF16001').AsString;
    SG01.Cells[03,i] := D.F16.FieldByName('BEF16002').AsString;
    SG01.Cells[04,i] := D.F16.FieldByName('BEF16005').AsString;
    SG01.Cells[05,i] := D.F16.FieldByName('BEF16204').AsString;
    SG01.Cells[06,i] := D.F16.FieldByName('BEF16303').AsString;
    SG01.Cells[07,i] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[08,i] := D.F16.FieldByName('BEF16309').AsString;
    SG01.Cells[09,i] := D.F16.FieldByName('BEF16310').AsString;
    SG01.Cells[10,i] := D.F16.FieldByName('BEF16308').AsString;
    SG01.Cells[11,i] := D.F16.FieldByName('BEF16499').AsString;
    SG01.Cells[12,i] := D.F16.FieldByName('BEF16102').AsString;
    SG01.Cells[13,i] := D.F16.FieldByName('BEF16103').AsString;
    inc(i);
    D.F16.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_D16.B_OKClick(Sender: TObject);
begin
  SG01INI;
  OpenF16;
  SG01Snd;
end;

procedure TF_D16.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D16.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D16.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

procedure TF_D16.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

end.
