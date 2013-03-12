unit U_D06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TF_D06 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel4: TPanel;
    L_005: TLabel;
    Label1: TLabel;
    CB004: TComboBox;
    EB002: TEdit;
    EE002: TEdit;
    Panel6: TPanel;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_ExcelClick(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    function SList(S1 : String) : String;
    procedure CB004Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure OpenF18(S1,S2 : String);
  public
    { Public declarations }
  end;

var
  F_D06: TF_D06;

implementation

uses U_KcPub, U_F, U_D, U_D0601;

{$R *.dfm}

procedure TF_D06.CB004Ld;
begin
  D.OpenF12('成型站');
  CB004.Clear;
  CB004.Items.Add('all');
  While not D.F12.Eof do
  Begin
    CB004.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB004.ItemIndex := 1;
End;

procedure TF_D06.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Line';
  SG01.Cells[01,0] := 'Running';
  SG01.Cells[02,0] := 'Start';
  SG01.Cells[03,0] := 'Finish';
  SG01.Cells[04,0] := 'Hr';
  SG01.Cells[05,0] := 'PNo';
  SG01.Cells[06,0] := '耗用量';
  SG01.Cells[07,0] := '剩餘量';
  SG01.Cells[08,0] := '加入總量';
  SG01.Cells[09,0] := '加入明細'; // No#255加入量#255剩餘量
  SG01.Cells[10,0] := 'Start OPID';
  SG01.Cells[11,0] := 'Start Note';
  SG01.Cells[12,0] := 'Finish OPID';
  SG01.Cells[13,0] := 'Finish Note';
  KC_ColAutoSize(SG01);
End;

procedure TF_D06.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 >= '''+S1+
                                           ''' and BEF18002 <= '''+S2+
                                     'z'' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

function TF_D06.SList(S1 : String) : String;
var
  i : integer;
  SS : String;
begin
  SL01.Text := S1;
  Result := '';
  for i:=0 to SL01.Count-1 do
  Begin
    SS := SL01.Strings[i];
    Result := KC_GetSubStr(#255,SS,1)+':'+
              KC_GetSubStr(#255,SS,2)+
              iif(i=(SL01.Count-1),'',';');
  End;
end;

procedure TF_D06.SG01Snd;
var
  iRow : integer;
  S1   : String;
begin
  KC_SGClear(1,SG01);
  iRow := 1;
  While not D.F18.Eof do
  Begin
    if ((0 <> CB004.ItemIndex) and
        (D.F18.FieldByName('BEF18004').AsString <> CB004.Text)) Then
    Begin
      D.F18.Next;
      Continue;
    End;
    S1 := F.Hr(D.F18.FieldByName('BEF18002').AsString);
    if (D.F18.FieldByName('BEF18001').AsString <> '1') Then
      S1 := F.Hr(D.F18.FieldByName('BEF18002').AsString,
                 D.F18.FieldByName('BEF18003').AsString);
    SG01.Cells[00,iRow] := D.F18.FieldByName('BEF18004').AsString;
    SG01.Cells[01,iRow] := F.Running00(D.F18.FieldByName('BEF18001').AsString);
    SG01.Cells[02,iRow] := D.F18.FieldByName('BEF18002').AsString;
    SG01.Cells[03,iRow] := D.F18.FieldByName('BEF18003').AsString;
    SG01.Cells[04,iRow] := S1;
    SG01.Cells[05,iRow] := D.F18.FieldByName('BEF18005').AsString;
    SG01.Cells[06,iRow] := format('%0.2f',[D.F18.FieldByName('BEF18102').Asfloat-
                                           D.F18.FieldByName('BEF18202').Asfloat]);//'耗用量';
    SG01.Cells[07,iRow] := D.F18.FieldByName('BEF18202').AsString;//'剩餘量';
    SG01.Cells[08,iRow] := D.F18.FieldByName('BEF18102').AsString;//'加入總量';
    SG01.Cells[09,iRow] := SList(D.F18.FieldByName('BEF18901').AsString);// '加入明細'; // No#255加入量#255剩餘量
    SG01.Cells[10,iRow] := D.F18.FieldByName('BEF18101').AsString;// 'Start OPID';
    SG01.Cells[11,iRow] := D.F18.FieldByName('BEF18199').AsString;// 'Start Note';
    SG01.Cells[12,iRow] := D.F18.FieldByName('BEF18201').AsString;// 'Finish OPID';
    SG01.Cells[13,iRow] := D.F18.FieldByName('BEF18299').AsString;// 'Finish Note';
    inc(iRow);
    D.F18.Next;
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);

end;

procedure TF_D06.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  EB002.Text := KC_Data2B(F.IdTime.DateTime-7);
  EE002.Text := KC_Data2B(F.IdTime.DateTime);
  CB004Ld;
  SG01Ini;
end;

procedure TF_D06.B_OKClick(Sender: TObject);
begin
  OpenF18(EB002.Text,EE002.Text);
  SG01Snd;
end;

procedure TF_D06.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D06.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.RunningToColor(SG01.Cells[ACol,ARow]);
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

procedure TF_D06.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D06.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D06.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
End;

procedure TF_D06.SG01DblClick(Sender: TObject);
begin
  if (SG01.Cells[00,SG01.Row] = '') then Exit;
  F_D0601 := TF_D0601.Create(Application);
  try
    F_D0601.SS1 := SG01.Cells[02,SG01.Row];
    F_D0601.SS2 := SG01.Cells[00,SG01.Row];
    F_D0601.ShowModal;
  finally
    F_D0601.Free;
  end;
End;

end.


