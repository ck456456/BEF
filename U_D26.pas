unit U_D26;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB;

type
  TF_D26 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    V : Variant;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure OpenF02;
    procedure OpenF03;
    procedure OpenF12;
    procedure OpenF13;
    procedure OpenF14;
    procedure OpenF16;
  public
    { Public declarations }
  end;

var
  F_D26: TF_D26;

implementation

uses U_KcPub, U_F, U_D, U_V12;

{$R *.dfm}

procedure TF_D26.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := '產品別';
  SG01.Cells[1,0] := '料號';
  SG01.Cells[2,0] := '名稱';
  SG01.Cells[3,0] := 'm/數量';
  SG01.Cells[4,0] := 'm2';
  SG01.Cells[5,0] := '重量';
  KC_ColAutoSize(SG01);
end;

procedure TF_D26.FormShow(Sender: TObject);
begin
  D.OpenF00;
  D.OpenF05;
  SG01Ini;
end;

procedure TF_D26.OpenF03;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF03 With (INDEX(BEFF03_000)) Where'+
            ' BEF03000 = ''0'' Order by BEF03002,BEF03001';
  KC_T3Close(D.F03,D.SC);
  D.F03.CommandText := SQL;
  KC_T3OPEN(D.F03,D.SC);
  D.F03.First;
end;

procedure TF_D26.OpenF02;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF02 With (INDEX(BEFF02_101)) Where'+
            ' BEF02101 >= ''0'' and BEF02101 <= ''1'' Order by BEF02002,BEF02001';
  KC_T3Close(D.F02,D.SC);
  D.F02.CommandText := SQL;
  KC_T3OPEN(D.F02,D.SC);
  D.F02.First;
end;

procedure TF_D26.OpenF13;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF13 With (INDEX(BEFF13_101)) Where'+
              ' BEF13101 >= ''0'' and BEF13101 <= ''1'' Order by BEF13002,BEF13001';
  KC_T3Close(D.F13,D.SC);
  D.F13.CommandText := SQL;
  KC_T3OPEN(D.F13,D.SC);
  D.F13.First;
End;

procedure TF_D26.OpenF14;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF14 With (INDEX(BEFF14_101)) Where'+
            ' BEF14101 >= ''0'' and BEF14101 <= ''1'' Order by BEF14002,BEF14001';
  KC_T3Close(D.F14,D.SC);
  D.F14.CommandText := SQL;
  KC_T3OPEN(D.F14,D.SC);
  D.F14.First;
End;

procedure TF_D26.OpenF16;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFF16 With (INDEX(BEFF16_101)) '+
                             'Where BEF16101 = ''2'' '+
                              ' and BEF16007 <> ''Y'' Order by BEF16002,BEF16004';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D26.SG01Snd;
var
  bool  : boolean;
  iRow  : integer;
  S1,S2,S3 : String;
  f1,f2 : Real;
begin
  KC_SGClear(1,SG01);
  iRow := 1;

  f1 := 0;
  f2 := 0;
  bool := false;
  D.F02.First;
  SG01.Cells[00,iRow] := 'PET';
  S1   := D.F02.FieldByName('BEF02002').AsString;
  While not D.F02.Eof do
  Begin
    bool := true;
    if (S1<>D.F02.FieldByName('BEF02002').AsString) Then
    Begin
      D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
      SG01.Cells[01,iRow] := S1;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
      SG01.Cells[03,iRow] := format('%0.0f',[f1]);
      SG01.Cells[04,iRow] := format('%0.0f',[f2]);
      SG01.Cells[05,iRow] := format('%0.0f',[f1*D.F05.FieldByName('BEF05202').AsFloat]);
      SG01.Cells[06,iRow] := '';
      f1 := 0;
      f2 := 0;
      S1   := D.F02.FieldByName('BEF02002').AsString;
      inc(iRow);
    End;
    f1 := f1+D.F02.FieldByName('BEF02102').AsFloat-D.F02.FieldByName('BEF02103').AsFloat;
    f2 := f2+((D.F02.FieldByName('BEF02102').AsFloat-D.F02.FieldByName('BEF02103').AsFloat)*D.F02.FieldByName('BEF02003').AsFloat)/1000;
    D.F02.Next;
  End;
  if bool Then
  Begin
    D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
    SG01.Cells[01,iRow] := S1;
    SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
    SG01.Cells[03,iRow] := format('%0.0f',[f1]);
    SG01.Cells[04,iRow] := format('%0.0f',[f2]);
    SG01.Cells[05,iRow] := format('%0.0f',[f1*D.F05.FieldByName('BEF05202').AsFloat]);
    SG01.Cells[06,iRow] := '';
    inc(iRow);
  End;

  f1 := 0;
  bool := false;
  D.F03.First;
  SG01.Cells[00,iRow] := 'UV膠';
  S1   := D.F03.FieldByName('BEF03002').AsString;
  While not D.F03.Eof do
  Begin
    bool := true;
    if (S1<>D.F03.FieldByName('BEF03002').AsString) Then
    Begin
      if D.F12.Locate('BEF12006',VarArrayOf([S1]),[loCaseInsensitive]) Then
         f1 := f1+ D.F12.FieldByName('QTY').AsFloat;

      D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
      SG01.Cells[01,iRow] := S1;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
      SG01.Cells[03,iRow] := format('%0.0f',[f1]);
      SG01.Cells[06,iRow] := '';
      f1 := 0;
      S1 := D.F03.FieldByName('BEF03002').AsString;
      inc(iRow);
    End;
    f2 := D.F03.FieldByName('BEF03103').ASFloat;
    if (D.F03.FieldByName('BEF03103').ASFloat = 0) Then f2 := D.F03.FieldByName('BEF03102').ASFloat;
    f1 := f1+f2;
    D.F03.Next;
  End;
  if bool Then
  Begin
    if D.F12.Locate('BEF12006',VarArrayOf([S1]),[loCaseInsensitive]) Then
       f1 := f1+ D.F12.FieldByName('QTY').AsFloat;

    D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
    SG01.Cells[01,iRow] := S1;
    SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
    SG01.Cells[03,iRow] := format('%0.0f',[f1]);
    SG01.Cells[06,iRow] := '';
    inc(iRow);
  End;

  f1 := 0;
  f2 := 0;
  bool := false;
  D.F13.First;
  SG01.Cells[00,iRow] := '上保護膜';
  S1   := D.F13.FieldByName('BEF13002').AsString;
  While not D.F13.Eof do
  Begin
    bool := true;
    if (S1<>D.F13.FieldByName('BEF13002').AsString) Then
    Begin
      D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
      SG01.Cells[01,iRow] := S1;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
      SG01.Cells[03,iRow] := format('%0.0f',[f1]);
      SG01.Cells[04,iRow] := format('%0.0f',[(f1*D.F05.FieldByName('BEF05101').AsFloat)/1000]);
      SG01.Cells[06,iRow] := '';
      f1 := 0;
      f2 := 0;
      S1 := D.F13.FieldByName('BEF13002').AsString;
      inc(iRow);
    End;
    f1 := f1+D.F13.FieldByName('BEF13102').AsFloat-D.F13.FieldByName('BEF13103').AsFloat;
    D.F13.Next;
  End;
  if bool Then
  Begin
    D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
    SG01.Cells[01,iRow] := S1;
    SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
    SG01.Cells[03,iRow] := format('%0.0f',[f1]);
    SG01.Cells[04,iRow] := format('%0.0f',[(f1*D.F05.FieldByName('BEF05101').AsFloat)/1000]);
    SG01.Cells[06,iRow] := '';
    inc(iRow);
  End;

  f1 := 0;
  bool := false;
  D.F14.First;
  SG01.Cells[00,iRow] := '下保護膜';
  S1   := D.F14.FieldByName('BEF14002').AsString;
  While not D.F14.Eof do
  Begin
    bool := true;
    if (S1<>D.F14.FieldByName('BEF14002').AsString) Then
    Begin
      D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
      SG01.Cells[01,iRow] := S1;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
      SG01.Cells[03,iRow] := format('%0.0f',[f1]);
      SG01.Cells[04,iRow] := format('%0.0f',[(f1*D.F05.FieldByName('BEF05101').AsFloat)/1000]);
      SG01.Cells[06,iRow] := '';
      f1 := 0;
      S1 := D.F14.FieldByName('BEF14002').AsString;
      inc(iRow);
    End;
    f1 := f1+D.F14.FieldByName('BEF14102').AsFloat-D.F14.FieldByName('BEF14103').AsFloat;
    D.F14.Next;
  End;
  if bool Then
  Begin
    D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]);
    SG01.Cells[01,iRow] := S1;
    SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
    SG01.Cells[03,iRow] := format('%0.0f',[f1]);
    SG01.Cells[04,iRow] := format('%0.0f',[(f1*D.F05.FieldByName('BEF05101').AsFloat)/1000]);
    SG01.Cells[06,iRow] := '';
    inc(iRow);
  End;

  f1 := 0;
  f2 := 0;
  bool := false;
  D.F16.First;
  S1   := D.F16.FieldByName('BEF16002').AsString;
  SG01.Cells[00,iRow] := S1;
  S2   := D.F16.FieldByName('BEF16002').AsString+#255+
          D.F16.FieldByName('BEF16004').AsString;
  SG01.Cells[00,iRow] := S1;
  While not D.F16.Eof do
  Begin
    bool := true;
    if (S2<>D.F16.FieldByName('BEF16002').AsString+#255+
            D.F16.FieldByName('BEF16004').AsString) Then
    Begin
      D.OpenF10(KC_GetSubStr(#255,S2,1),KC_GetSubStr(#255,S2,2));
      SG01.Cells[01,iRow] := KC_GetSubStr(#255,S2,2);
      SG01.Cells[02,iRow] := D.F10.FieldByName('BEF10099').AsString;
      SG01.Cells[03,iRow] := format('%0.0f',[f1]);
      SG01.Cells[04,iRow] := format('%0.0f',[f2]);
      SG01.Cells[06,iRow] := '*';
      f1 := 0;
      f2 := 0;
      S2 := D.F16.FieldByName('BEF16002').AsString+#255+
            D.F16.FieldByName('BEF16004').AsString;
      inc(iRow);
    End;
    if (S1<>D.F16.FieldByName('BEF16002').AsString) Then
    Begin
      SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16002').AsString;
      S1 := D.F16.FieldByName('BEF16002').AsString;
    End;
    f1 := f1+D.F16.FieldByName('BEF16307').AsFloat;
    f2 := f2+(D.F16.FieldByName('BEF16307').AsFloat*D.F16.FieldByName('BEF16304').AsFloat)/1000;
    D.F16.Next;
  End;
  if bool Then
  Begin
    D.OpenF10(KC_GetSubStr(#255,S2,1),KC_GetSubStr(#255,S2,2));
    SG01.Cells[01,iRow] := KC_GetSubStr(#255,S2,2);
    SG01.Cells[02,iRow] := D.F10.FieldByName('BEF10099').AsString;
    SG01.Cells[03,iRow] := format('%0.0f',[f1]);
    SG01.Cells[04,iRow] := format('%0.0f',[f2]);
    SG01.Cells[06,iRow] := '*';
    inc(iRow);
  End;


  SG01.Cells[00,iRow] := '包材';
  D.F05.First;
  While not D.F05.Eof do
  Begin
    bool := true;
    if (D.F00.FieldByName('BEF00206').AsString <> D.F05.FieldByName('BEF05002').AsString) Then
    Begin
      D.F05.Next;
      Continue;
    End;
    SG01.Cells[01,iRow] := D.F05.FieldByName('BEF05001').AsString;
    SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05099').AsString;
    SG01.Cells[03,iRow] := D.F05.FieldByName('BEF05009').AsString;
    inc(iRow);
    D.F05.Next;
  End;

  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
end;

procedure TF_D26.OpenF12;
begin
  KC_T3Close(D.F12,D.SC);
  D.F12.CommandText := 'SELECT BEF12006,Sum(BEF12007) AS QTY FROM BEFF12 Where BEF12001 = ''成型站'' Group by BEF12006 Order by BEF12006';
  KC_T3OPEN(D.F12,D.SC);
  D.F12.First;
end;

procedure TF_D26.B_OKClick(Sender: TObject);
begin
  D.OpenF05;
  OpenF12;
  OpenF03;
  OpenF02;
  OpenF13;
  OpenF14;
  OpenF16;
  SG01Snd;
end;

procedure TF_D26.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D26.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D26.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+1,i+1].Value := SG01.Cells[i,j];
end;

procedure TF_D26.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_D26.SG01DblClick(Sender: TObject);
begin
  if SG01.Cells[06,SG01.Row] = '' Then Exit;
  F_V12 := TF_V12.Create(Application);
  try
     F_V12.Pno := SG01.Cells[01,SG01.Row];
     F_V12.ShowModal;
  finally
     F_V12.Free;
  end;
end;

end.


