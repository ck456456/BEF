unit U_D22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, CIM_Grid, DB;

type
  TF_D22 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel6: TPanel;
    CB_Type: TComboBox;
    Panel1: TPanel;
    SG01: TCIM_Grid;
    Label1: TLabel;
    E_LEN: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    CB_013: TComboBox;
    E_Run: TEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    V : Variant;
    procedure CB013Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure TypeLd;
    procedure OpenG19;
  public
    { Public declarations }
  end;

var
  F_D22: TF_D22;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_D22.CB013Ld;
begin
  CB_013.Clear;
  CB_013.Items.Add('all');
  D.F22.First;
  While not D.F22.Eof do
  Begin
    if (D.F22.FieldByName('BEF22002').AsString <> '成品') Then
    Begin
      D.F22.Next;
      Continue;
    End;
    CB_013.Items.Add(D.F22.FieldByName('BEF22001').AsString);
    D.F22.Next;
  End;
  CB_013.ItemIndex := 0;
end;

procedure TF_D22.TypeLd;
begin
  CB_Type.Clear;
  CB_Type.Items.Add('all');
  While not D.F01.Eof do
  begin
    CB_Type.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB_Type.ItemIndex := 0;
end;

procedure TF_D22.SG01Ini;
begin
  SG01.Clear;
  SG01.Cells[00,0] := '棧板號';     //
  SG01.Cells[01,0] := '倉別';       //
  SG01.Cells[02,0] := '產品別';     //
  SG01.Cells[03,0] := '成品料號';   //
  SG01.Cells[04,0] := 'Run no';     //
  SG01.Cells[05,0] := '等級';       //
  SG01.Cells[06,0] := '成型寬幅';   //
  SG01.Cells[07,0] := '長度m';      //
  SG01.Cells[08,0] := '長度m2';     //
  SG01.Cells[09,0] := '重量(kg)';   //
  SG01.Cells[10,0] := '備註';       //
  SG01.Cells[11,0] := '保留單號';   //
  SG01.AutoSize;
end;

procedure TF_D22.FormShow(Sender: TObject);
begin
  D.OpenF22;
  D.OpenF05;
  D.OpenF01('T');
  TypeLd;
  CB013Ld;
  SG01Ini;
end;

procedure TF_D22.OpenG19;
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_101)) Where BEF19101 = ''9'' Order by  BEF19001,BEF19007,BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_D22.SG01Snd;
var
  S : String;
  i : integer;
  f1,f2 : Real;
begin
  if not D.G19.Active Then Exit;
  KC_SGClear(1,SG01);
  D.G19.First;
  i := 1;
  While not D.G19.Eof do
  Begin
    if (CB_013.ItemIndex<>0) and (CB_013.Text<>D.G19.FieldByName('BEF19013').AsString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (CB_Type.ItemIndex<>0) and (CB_Type.Text<>D.G19.FieldByName('BEF19002').AsString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (KC_StrToFloat(E_LEN.Text)>KC_StrToFloat(D.G19.FieldByName('BEF19501').AsString)) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    S := D.G19.FieldByName('BEF19001').AsString+D.G19.FieldByName('BEF19007').AsString;
    if (E_Run.Text) <> copy(S,1,length(E_Run.Text)) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    // D.OpenF16(D.G19.FieldByName('BEF19001').AsString);
    // D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19502').AsString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19501').AsString);
    SG01.Cells[00,i] := D.G19.FieldByName('BEF19010').AsString; // 棧板號
    SG01.Cells[01,i] := D.G19.FieldByName('BEF19013').AsString; // 倉別
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').AsString; // 產品別
    SG01.Cells[03,i] := D.F05.FieldByName('BEF05008').AsString; // 成品料號
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19001').AsString+
                        D.G19.FieldByName('BEF19007').AsString; // Run no
    SG01.Cells[05,i] := D.F05.FieldByName('BEF05003').AsString; // 等級

    // SG01.Cells[06,i] := D.F02.FieldByName('BEF02003').AsString; // PET寬幅

    SG01.Cells[06,i] := D.G19.FieldByName('BEF19502').AsString; // '成型寬幅
    SG01.Cells[07,i] := D.G19.FieldByName('BEF19501').AsString; // '長度m';
    SG01.Cells[08,i] := format('%0.0f',[f1*f2/1000]); // '長度m2';
    SG01.Cells[09,i] := D.G19.FieldByName('BEF19012').AsString; // '重量(kg)';
    // SG01.Cells[10,i] := D.G19.FieldByName('').AsString; // '備註';
    SG01.Cells[11,i] := D.G19.FieldByName('BEF19008').AsString; // '產品別';
    SG01.Cells[12,i] := D.G19.FieldByName('BEF19003').AsString; // '產品別';
    SG01.Cells[13,i] := D.F05.FieldByName('BEF05001').AsString; // '產品別';
    SG01.Cells[14,i] := D.G19.FieldByName('BEF19004').AsString; // '產品別';
    D.G19.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_D22.B_OKClick(Sender: TObject);
begin
  OpenG19;
  SG01Snd;
end;

procedure TF_D22.CB_TypeChange(Sender: TObject);
begin
  SG01Snd;
end;

procedure TF_D22.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D22.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D22.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+1,i+1].Value := SG01.Cells[i,j];
end;

procedure TF_D22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_D22.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow = 0) Then Exit;
  with Sender as TStringGrid do
  begin
    if (Cells[11,ARow] = '') Then Exit;
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := clAqua;
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

end.


