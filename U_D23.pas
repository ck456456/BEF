unit U_D23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, CIM_Grid, DB;

type
  TF_D23 = class(TForm)
    P_Main: TPanel;
    Panel6: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel1: TPanel;
    SG01: TCIM_Grid;
    Label5: TLabel;
    E_BDat: TEdit;
    E_EDat: TEdit;
    E_Run: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    V : Variant;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure OpenF20;
    procedure OpenG19(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D23: TF_D23;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_D23.SG01Ini;
begin
  SG01.Clear;
  SG01.Cells[00,0] := '出貨日期';
  SG01.Cells[01,0] := '客戶';
  SG01.Cells[02,0] := '棧板號';
  SG01.Cells[03,0] := '產品別';
  SG01.Cells[04,0] := '成品料號';
  SG01.Cells[05,0] := 'Run no';
  SG01.Cells[06,0] := '等級';
  SG01.Cells[07,0] := 'PET寬幅';
  SG01.Cells[08,0] := '成型寬幅';
  SG01.Cells[09,0] := '長度m';
  SG01.Cells[10,0] := '長度m2';
  SG01.Cells[11,0] := '重量(kg)';
  SG01.Cells[12,0] := '長*寬*高';
  SG01.AutoSize;
end;

procedure TF_D23.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D.OpenF05;
  D.OpenF01('T');
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-30;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymmdd',D1);
  E_EDaT.Text := FormatDateTime('yyyymmdd',D2);
  SG01Ini;
end;

procedure TF_D23.OpenF20;
begin
  KC_T3Close(D.F20,D.SC);
  D.F20.CommandText := 'SELECT * FROM BEFF20 Where BEF20005 >= '''+E_BDat.Text+
                                           ''' and BEF20005 <= '''+E_EDat.Text+
                                    'z'' Order by  BEF20005';
  KC_T3OPEN(D.F20,D.SC);
  D.F20.First;
end;

procedure TF_D23.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19008 = '''+S1+
                                           ''' and BEF19101 = '''+'4'+
                                    ''' Order by  BEF19010,BEF19011';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_D23.SG01Snd;
var
  S : String;
  i : integer;
  f1,f2 : Real;
begin
  KC_SGClear(1,SG01);
  D.F20.First;
  i := 1;
  While not D.F20.Eof do
  Begin
    OpenG19(D.F20.FieldByName('BEF20001').AsString);
    D.G19.First;
    While not D.G19.Eof do
    Begin
      S := D.G19.FieldByName('BEF19001').AsString+D.G19.FieldByName('BEF19007').AsString;
      if (E_Run.Text) <> copy(S,1,length(E_Run.Text)) Then
      Begin
        D.G19.Next;
        Continue;
      End;
      D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
      f1 := KC_StrToFloat(D.G19.FieldByName('BEF19502').AsString);
      f2 := KC_StrToFloat(D.G19.FieldByName('BEF19501').AsString);
      SG01.Cells[00,i] := copy(D.F20.FieldByName('BEF20005').AsString,1,4)+'/'+
                          copy(D.F20.FieldByName('BEF20005').AsString,5,2)+'/'+
                          copy(D.F20.FieldByName('BEF20005').AsString,7,2);
      SG01.Cells[01,i] := D.F20.FieldByName('BEF20006').AsString; //
      SG01.Cells[02,i] := D.G19.FieldByName('BEF19010').AsString; // '棧板號';
      SG01.Cells[03,i] := D.G19.FieldByName('BEF19002').AsString; // '產品別';
      SG01.Cells[04,i] := D.F05.FieldByName('BEF05008').AsString; // '成品料號';
      SG01.Cells[05,i] := D.G19.FieldByName('BEF19001').AsString+
                          D.G19.FieldByName('BEF19007').AsString; // 'Run no';
      SG01.Cells[06,i] := D.F05.FieldByName('BEF05003').AsString; // '等級';
      SG01.Cells[07,i] := D.F05.FieldByName('BEF05004').AsString; // 'PET寬幅';
      SG01.Cells[08,i] := D.G19.FieldByName('BEF19502').AsString; // '成型寬幅';
      SG01.Cells[09,i] := D.G19.FieldByName('BEF19501').AsString; // '長度m';
      SG01.Cells[10,i] := format('%0.0f',[f1*f2/1000]); // '長度m2';
      SG01.Cells[11,i] := D.G19.FieldByName('BEF19012').AsString; // '重量(kg)';
      // SG01.Cells[10,i] := D.G19.FieldByName('').AsString; // '備註';
      D.G19.Next;
      inc(i);
    End;
    D.F20.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_D23.B_OKClick(Sender: TObject);
begin
  OpenF20;
  SG01Snd;
end;

procedure TF_D23.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D23.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D23.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+1,i+1].Value := SG01.Cells[i,j];
end;

procedure TF_D23.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

end.


