unit U_D13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TF_D13 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel4: TPanel;
    Label4: TLabel;
    CB_BNo: TComboBox;
    CB_ENo: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    E_EDT: TEdit;
    E_BDT: TEdit;
    L_Date: TLabel;
    CB_Type: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL04 : TStringList;
    procedure PetLd;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure OpenF16; overload;
    procedure OpenF16(S1,S2 : String); overload;
    procedure GetSL04;
    function  GetF19(S1 : String) : String;
  public
    { Public declarations }
  end;

var
  F_D13: TF_D13;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D13.PetLd;
begin
  CB_BNo.Clear;
  CB_ENo.Clear;
  D.F02.First;
  While not D.F02.Eof do
  Begin
    CB_BNo.Items.Add(D.F02.FieldByName('BEF02001').AsString);
    CB_ENo.Items.Add(D.F02.FieldByName('BEF02001').AsString);
    D.F02.Next;
  End;
  CB_BNo.ItemIndex := 0;
  CB_ENo.ItemIndex := 0;// CB_ENo.Items.Count-1;
end;

procedure TF_D13.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Pet ID';
  SG01.Cells[01,0] := '總長';
  SG01.Cells[02,0] := '剩餘';
  SG01.Cells[03,0] := '使用率';
  SG01.Cells[04,0] := '成型未判';
  SG01.Cells[05,0] := '成型A';
  SG01.Cells[06,0] := '成型B';
  SG01.Cells[07,0] := '成型C';
  SG01.Cells[08,0] := '成型損耗';
  SG01.Cells[09,0] := '褙模未判';
  SG01.Cells[10,0] := '褙模A';
  SG01.Cells[11,0] := '褙模B';
  SG01.Cells[12,0] := '褙模C';
  SG01.Cells[13,0] := '褙模損耗';
  SG01.Cells[14,0] := '入倉Not';
  SG01.Cells[15,0] := '離倉Not';
  SG01.RowCount := 2;
  KC_ColAutoSize(SG01);
end;

procedure TF_D13.FormShow(Sender: TObject);
begin
  E_BDT.Text := KC_Data2B(F.IdTime.DateTime-7);
  E_EDT.Text := KC_Data2B(F.IdTime.DateTime);
  SL04 := TStringList.Create;
  D.OpenF05;
  D.OpenF02;
  PetLd;
  SG01Ini;
end;

procedure TF_D13.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                      ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D13.OpenF16;
var
  SQL : String;
Begin
  SQL := 'Select * From BEFF16 Where BEF16202 >= '''+CB_BNo.Text+
                            ''' and  BEF16202 <= '''+CB_ENo.Text+
                           'z'' Order by BEF16202';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

function  TF_D13.GetF19(S1 : String) : String;
var
  Ret : Real;
begin
  Result := '';
  D.F19.First;
  Ret := 0;
  While not D.F19.Eof do
  Begin
    if ((S1 = '') and (D.F19.FieldByName('BEF19003').AsString = '')) Then
    Begin
      Ret := Ret + D.F19.FieldByName('BEF19303').Asfloat;
      D.F19.Next;
      Continue;
    End;

    D.F05.Locate('BEF05001',D.F19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
    if (S1 = #255) Then
    Begin
      Ret := Ret + D.F19.FieldByName('BEF19306').Asfloat;
      if (D.F05.FieldByName('BEF05003').AsString <> 'A') and
         (D.F05.FieldByName('BEF05003').AsString <> 'B') and
         (D.F05.FieldByName('BEF05003').AsString <> 'C') Then
         Ret := Ret + D.F19.FieldByName('BEF19306').Asfloat;
    End;
    if (D.F05.FieldByName('BEF05003').AsString = S1) Then
      Ret := Ret + D.F19.FieldByName('BEF19303').Asfloat;
    D.F19.Next;
  End;
  if (Ret <> 0) then Result := Format('%0.2f',[Ret]);
End;

procedure TF_D13.SG01Snd;
var
  F1,F2 : Real;
  iCol : integer;
  iRow : integer;
  iCRow : integer;
  i  : integer;
  RNo  : String;
  B    : Boolean;
begin
  KC_SGClear(1,SG01);
  iRow := 1;
  iCRow := 1;
  RNo := '---';
  While not D.F16.Eof do
  Begin
    B := False;
    for i:=0 to SL04.Count-1 do
      if (D.F16.FieldByName('BEF16202').AsString = SL04.Strings[i]) Then B := True;
    if (not B) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
    if (RNo <> D.F16.FieldByName('BEF16202').AsString) Then
    Begin
      D.F02.Locate('BEF02001',D.F16.FieldByName('BEF16202').AsString, [loCaseInsensitive]);
      SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16202').AsString;
      SG01.Cells[01,iRow] := D.F02.FieldByName('BEF02102').AsString;
      SG01.Cells[02,iRow] := Format('%0.2f',[D.F02.FieldByName('BEF02102').Asfloat -
                                             D.F02.FieldByName('BEF02103').Asfloat]) ;
      SG01.Cells[14,iRow] := D.F02.FieldByName('BEF02203').AsString;
      SG01.Cells[15,iRow] := D.F02.FieldByName('BEF02204').AsString;
      iCRow := iRow;
      RNo := D.F16.FieldByName('BEF16202').AsString;
      inc(iRow);
    End;
    if CB_Type.Checked Then
    Begin
      SG01.Cells[03,iRow] := D.F16.FieldByName('BEF16001').AsString;
      iCol := 8;
      if (D.F16.FieldByName('BEF16308').AsString = '')  Then iCol := 4;
      if (D.F16.FieldByName('BEF16308').AsString = 'A') Then iCol := 5;
      if (D.F16.FieldByName('BEF16308').AsString = 'B') Then iCol := 6;
      if (D.F16.FieldByName('BEF16308').AsString = 'C') Then iCol := 7;
      SG01.Cells[iCol,iRow] := D.F16.FieldByName('BEF16303').AsString;
      SG01.Cells[08,iRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[08,iRow]) +
                                             D.F16.FieldByName('BEF16306').Asfloat]) ;
      D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
      SG01.Cells[09,iRow] := GetF19('');
      SG01.Cells[10,iRow] := GetF19('A');
      SG01.Cells[11,iRow] := GetF19('B');
      SG01.Cells[12,iRow] := GetF19('C');
      SG01.Cells[13,iRow] := GetF19(#255);
      inc(iRow);
    End;
    iCol := 8;
    if (D.F16.FieldByName('BEF16308').AsString = '')  Then iCol := 4;
    if (D.F16.FieldByName('BEF16308').AsString = 'A') Then iCol := 5;
    if (D.F16.FieldByName('BEF16308').AsString = 'B') Then iCol := 6;
    if (D.F16.FieldByName('BEF16308').AsString = 'C') Then iCol := 7;
    SG01.Cells[iCol,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[iCol,iCRow]) + D.F16.FieldByName('BEF16303').Asfloat]);
    SG01.Cells[08  ,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[  08,iCRow]) + D.F16.FieldByName('BEF16306').Asfloat]);
    D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
    SG01.Cells[09,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[09,iCRow]) + KC_StrToFloat(GetF19(''))])  ;
    SG01.Cells[10,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[10,iCRow]) + KC_StrToFloat(GetF19('A'))]) ;
    SG01.Cells[11,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[11,iCRow]) + KC_StrToFloat(GetF19('B'))]) ;
    SG01.Cells[12,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[12,iCRow]) + KC_StrToFloat(GetF19('C'))]) ;
    SG01.Cells[13,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[13,iCRow]) + KC_StrToFloat(GetF19(#255))]);
    D.F16.Next;
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[00,i] = '') then Continue;
    F1 := KC_StrToFloat(SG01.Cells[01,i]);
    F2 := KC_StrToFloat(SG01.Cells[10,i])+
          KC_StrToFloat(SG01.Cells[11,i])+
          KC_StrToFloat(SG01.Cells[12,i]);
    if (F1<>0) Then SG01.Cells[03,i] := format('%0.2f%%',[F2/F1*100]);
  End;
  KC_ColAutoSize(SG01);
End;

procedure TF_D13.GetSL04;
var
  i : integer;
  B : Boolean;
begin
  OpenF16(E_BDT.Text,E_EDT.Text);
  SL04.Clear;
  While not D.F16.Eof do
  Begin
    B := False;
    for i:=0 to SL04.Count-1 do
      if (D.F16.FieldByName('BEF16202').AsString = SL04.Strings[i]) Then B := True;
    if not B Then SL04.Add(D.F16.FieldByName('BEF16202').AsString);
    D.F16.Next;
  End;
  SL04.Sort;
end;

procedure TF_D13.B_OKClick(Sender: TObject);
begin
  GetSL04;
  OpenF16;
  SG01Snd;
end;

procedure TF_D13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL04.Free;
  KC_CloseExcel(V);
end;

procedure TF_D13.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow = 0) Then Exit;
  with Sender as TStringGrid do
  begin
    if (Cells[0,ARow] = '') Then Exit;
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := $00E3FEE2;
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

procedure TF_D13.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D13.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D13.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

end.

