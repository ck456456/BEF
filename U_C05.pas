unit U_C05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DB, Math;

type
  TF_C05 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel2: TPanel;
    SG01: TStringGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    B_B03: TBitBtn;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Splitter2: TSplitter;
    Panel7: TPanel;
    Splitter3: TSplitter;
    Panel8: TPanel;
    SG04: TStringGrid;
    Panel10: TPanel;
    SG02: TStringGrid;
    Panel9: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    E_010: TEdit;
    E_011: TEdit;
    E_012: TEdit;
    B_Save: TButton;
    Panel4: TPanel;
    Splitter4: TSplitter;
    Panel3: TPanel;
    SG05: TStringGrid;
    Panel12: TPanel;
    B_Excel: TButton;
    Panel6: TPanel;
    SG03: TStringGrid;
    Panel11: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_010T: TEdit;
    E_011T: TEdit;
    E_012T: TEdit;
    B_SaveT: TButton;
    B_Pass: TButton;
    Panel13: TPanel;
    SG99: TStringGrid;
    Splitter5: TSplitter;
    Panel14: TPanel;
    CB_Type: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG04KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_SaveClick(Sender: TObject);
    procedure SG02DblClick(Sender: TObject);
    procedure B_SaveTClick(Sender: TObject);
    procedure SG03DblClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG05KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG05MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_PassClick(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    function  ChkSpec : boolean;
    procedure OpenF20;
    procedure ORunningG19(S1,S2,S3 : String);
    procedure OpenF19(S1 : String);
    procedure OpnG19B(S1,S2 : String);
    procedure OpenG19(S1 : String);
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG04INI;
    procedure SG05INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG04Snd;
    procedure SG05Snd;
    procedure SG99Ini;
    procedure SG99Snd(S1 : String);
    function  GetRow(TSG : TStringGrid;iRow : integer) : integer;
    procedure SG02UpData;
    procedure SG03UpData;
    function  GetF501 : String;
    function  GetF502 : String;
  public
    { Public declarations }
  end;

var
  F_C05: TF_C05;

implementation

uses U_KcPub, U_D, U_F, U_V01, U_V05, U_V07;

{$R *.dfm}

procedure TF_C05.SG99Ini;
begin
  KC_SGClear(0,SG99);
  SG99.Cells[01,0] := 'A';
  SG99.Cells[02,0] := 'B';
  SG99.Cells[03,0] := 'C';
  SG99.Cells[04,0] := 'D';
  SG99.Cells[05,0] := 'NG';
  SG99.Cells[06,0] := '其他';
  SG99.Cells[07,0] := '合計';
  SG99.Cells[00,1] := 'm';
  SG99.Cells[00,2] := 'm2';
  SG99.Cells[00,3] := 'count';
  KC_ColAutoSize(SG99);
end;

procedure TF_C05.SG99Snd(S1 : String);
var
  i,j : integer;
  SQL : String;
  FF  : Real;
  Ans : array[1..3, 1..6] of Real;
begin
  if (S1='') Then Exit;
  for i:=1 to 3 do
    for j:=1 to 6 do
      Ans[i,j] := 0.0;
      
  D.G19.First;
  While not D.G19.eof do
  Begin
    j := 6;
    if (D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive])) Then
    Begin
      if ('A'  = D.F05.FieldByName('BEF05003').AsString) Then j := 1;
      if ('B'  = D.F05.FieldByName('BEF05003').AsString) Then j := 2;
      if ('C'  = D.F05.FieldByName('BEF05003').AsString) Then j := 3;
      if ('D'  = D.F05.FieldByName('BEF05003').AsString) Then j := 4;
      if ('NG' = D.F05.FieldByName('BEF05003').AsString) Then j := 5;
    End;
    Ans[1,j] := Ans[1,j]+D.G19.FieldByName('BEF19501').AsFloat;
    Ans[2,j] := Ans[2,j]+(D.G19.FieldByName('BEF19501').AsFloat*
                          D.G19.FieldByName('BEF19502').AsFloat/1000);
    Ans[3,j] := Ans[3,j]+1;

    for i:=1 to 3 do
      for j:=1 to 6 do
        SG99.Cells[j,i] := iif(Ans[i,j]=0.0,'',format('%0.0f',[Ans[i,j]]));

    for i:=1 to 3 do
    Begin
      FF := 0;
      for j:=1 to 6 do FF := FF+Ans[i,j];
      SG99.Cells[7,i] := iif(FF=0.0,'',format('%0.0f',[FF]));
    End;
    D.G19.Next;
  End;
  KC_ColAutoSize(SG99);
End;

procedure TF_C05.SG03UpData;
var
  S1 : String;
begin
  E_010T.Text := SG05.Cells[0,SG05.Row];
  E_011T.Text := KC_FillCharBefore(IntToStr(SG03.Row),3,'0');
  E_012T.Text := '';
  S1 := SG03.Cells[04,SG03.Row];
  if (S1 = '') Then Exit;
  D.G19.Locate('BEF19001;BEF19007;BEF19500',VarArrayOf([KC_GetSubStr(#255,S1,1),KC_GetSubStr(#255,S1,2),KC_GetSubStr(#255,S1,3)]), [loCaseInsensitive]);
  E_012T.Text := D.G19.FieldByName('BEF19012').AsString;
end;

procedure TF_C05.SG02UpData;
var
  S1 : String;
begin
  E_010T.Text := SG04.Cells[0,SG04.Row];
  E_011T.Text := KC_FillCharBefore(IntToStr(SG02.Row),3,'0');
  E_012T.Text := SG02.Cells[09,SG02.Row];

  E_010.Text := iif(SG05.Cells[0,SG05.Row]='',SG04.Cells[0,SG04.Row],SG05.Cells[0,SG05.Row]);
  E_011.Text := KC_FillCharBefore(IntToStr(GetRow(SG03,0)),3,'0');
  E_012.Text := SG02.Cells[09,SG02.Row];

  S1 := SG03.Cells[04,SG03.Row];
  if (S1 = '') Then Exit;
  D.G19.Locate('BEF19001;BEF19007',VarArrayOf([KC_GetSubStr(#255,S1,1),KC_GetSubStr(#255,S1,2)]), [loCaseInsensitive]);
  E_012T.Text := D.G19.FieldByName('BEF19012').AsString;
end;

procedure TF_C05.OpenF19(S1 : String);
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 With (INDEX(BEFF19_008)) Where BEF19008 = '''+S1+''' Order by BEF19001';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_C05.OpenF20;
begin
  KC_T3Close(D.F20,D.SC);
  D.F20.CommandText := 'SELECT * FROM BEFF20 Where BEF20101 = ''1'' Order by BEF20001';
  KC_T3OPEN(D.F20,D.SC);
  D.F20.First;
end;

procedure TF_C05.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';    // BEF20101
  SG01.Cells[01,0] := '單號';       // BEF20001
  SG01.Cells[02,0] := '目標料號';   // BEF20002
  SG01.Cells[03,0] := '成品料號';   // BEF20008
  SG01.Cells[04,0] := 'QTY';        // BEF20007
  SG01.Cells[05,0] := '長度下限';   // BEF20102
  SG01.Cells[06,0] := '長度上限';   // BEF20103
  SG01.Cells[07,0] := '等級限制';   // BEF20104
  SG01.Cells[08,0] := '工單號碼';   // BEF20003
  SG01.Cells[09,0] := '客戶';       // BEF20006
  SG01.Cells[10,0] := '預計出貨日'; // BEF20004
  SG01.Cells[11,0] := '實際完成日'; // BEF20005
  SG01.Cells[12,0] := 'Note';       // BEF20099
  KC_ColAutoSize(SG01);
end;

procedure TF_C05.SG04INI;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[00,0] := 'No';       // BEF19011
  KC_ColAutoSize(SG04);
end;

procedure TF_C05.SG05INI;
begin
  KC_SGClear(0,SG05);                                      
  SG05.Cells[00,0] := 'No';       // BEF19011
  KC_ColAutoSize(SG05);
end;

procedure TF_C05.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'SN';       // BEF19011
  SG02.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG02.Cells[02,0] := '規格';     // BEF19002
  SG02.Cells[03,0] := '成品料號'; // BEF19004
  SG02.Cells[04,0] := 'Run';      // BEF19001
  SG02.Cells[05,0] := 'm2';       // BEF19001
  SG02.Cells[06,0] := '剩餘寬幅'; // BEF16304
  SG02.Cells[07,0] := 'PET寬幅';  // BEF05004
  SG02.Cells[08,0] := 'm';        // BEF19303
  SG02.Cells[09,0] := '重量';     // BEF19012
  SG02.Cells[10,0] := '規格';     // BEF19002
  KC_ColAutoSize(SG02);
end;

procedure TF_C05.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'SN';       // BEF19011
  SG03.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG03.Cells[02,0] := '規格';     // BEF19002
  SG03.Cells[03,0] := '成品料號'; // BEF19004
  SG03.Cells[04,0] := 'Run';      // BEF19001
  SG03.Cells[05,0] := 'm2';       // BEF19001
  SG03.Cells[06,0] := '出貨寬幅'; // BEF16304
  SG03.Cells[07,0] := 'PET寬幅';  // BEF05004
  SG03.Cells[08,0] := 'm';        // BEF19303
  SG03.Cells[09,0] := '重量';     // BEF19012
  SG03.Cells[10,0] := '料號';     // BEF19003
  KC_ColAutoSize(SG03);
end;

procedure TF_C05.SG01Snd;
var
  SS : String;
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  D.F20.First;
  While not D.F20.Eof do
  Begin
    SS := '';
    if (D.F05.Locate('BEF05001',D.F20.FieldByName('BEF20008').AsString, [loCaseInsensitive])) Then
      SS:= D.F05.FieldByName('BEF05008').AsString;
    SG01.Cells[00,i] := F.Running00(D.F20.FieldByName('BEF20101').ASSTRING);
    SG01.Cells[01,i] :=         D.F20.FieldByName('BEF20001').AsString;
    SG01.Cells[02,i] :=         D.F20.FieldByName('BEF20002').AsString;
    SG01.Cells[03,i] :=         SS;
    SG01.Cells[04,i] :=         D.F20.FieldByName('BEF20007').AsString;
    SG01.Cells[05,i] :=         D.F20.FieldByName('BEF20102').AsString;
    SG01.Cells[06,i] :=         D.F20.FieldByName('BEF20103').AsString;
    SG01.Cells[07,i] :=         D.F20.FieldByName('BEF20104').AsString;
    SG01.Cells[08,i] :=         D.F20.FieldByName('BEF20003').AsString;
    SG01.Cells[09,i] :=         D.F20.FieldByName('BEF20006').AsString;
    SG01.Cells[10,i] :=         D.F20.FieldByName('BEF20004').AsString;
    SG01.Cells[11,i] :=         D.F20.FieldByName('BEF20005').AsString;
    SG01.Cells[12,i] :=         D.F20.FieldByName('BEF20099').AsString;
    SG01.Cells[13,i] :=         D.F20.FieldByName('BEF20008').AsString;
    inc(i);
    D.F20.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
End;

procedure TF_C05.ORunningG19(S1,S2,S3 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'Select * From BEFG19 With (INDEX(BEFG19_101)) Where'+
                                            ' BEF19101 = '''+S1+
                                      ''' and BEF19002 = '''+S2+
                                      ''' and BEF19004 = '''+S3+
                                 ''' Order by BEF19010,BEF19011,BEF19001';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
End;

function  TF_C05.GetRow(TSG : TStringGrid;iRow : integer) : integer;
var
  i : integer;
begin
  Result := iRow;
  if (TSG.Cells[04,iRow] = '') Then Exit;
  While (TSG.Cells[04,Result] <> '') do
    inc(Result);
End;

procedure TF_C05.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'Select * From BEFG19 With (INDEX(BEFG19_008)) Where'+
                                            ' BEF19008 = '''+S1+
                                      ''' and BEF19101 = ''4'+
                                 ''' Order by BEF19010,BEF19011,BEF19001';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C05.OpnG19B(S1,S2 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'Select * From BEFG19 With (INDEX(BEFG19_101)) Where'+
                                            ' BEF19101 = '''+S2+
                                      ''' and BEF19010 = '''+S1+
                                          ''' Order by BEF19010,BEF19011,BEF19001';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C05.SG02Snd;
var
  i,i1 : integer;
  f1,f2 : Real;
  SS : String;
  SS1,SS2,SS3: String;
  CRow : integer;
begin
  i := 1;
  i1 := 1;
  CRow := 2;
  KC_SGClear(1,SG02);
  OpnG19B(SG04.Cells[0,SG04.Row],'9');
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SG04.Cells[0,SG04.Row] <> D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (CB_Type.ItemIndex = 1) and
       (SG01.Cells[01,SG01.Row] <> D.G19.FieldByName('BEF19008').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS1 := '';
    SS2 := '';
    SS3 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
    Begin
      SS1 := D.F05.FieldByName('BEF05003').ASString;
      SS2 := D.F05.FieldByName('BEF05004').ASString;
      SS3 := D.F05.FieldByName('BEF05008').ASString;
    End;
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19501').ASString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19502').ASString);
    CRow := max(i,KC_StrToInt(D.G19.FieldByName('BEF19011').ASString));
    i := KC_StrToInt(D.G19.FieldByName('BEF19011').ASString);
    i := GetRow(SG02,i);
    SS := '';
    if (D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19004').ASString, [loCaseInsensitive])) Then
      SS:= D.F05.FieldByName('BEF05008').AsString;
    SG02.Cells[00,i] := D.G19.FieldByName('BEF19011').ASString;      // BEF19011
    SG02.Cells[01,i] := SS1;
    SG02.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;      // BEF19002
    SG02.Cells[03,i] := SS;      // BEF19004
    SG02.Cells[04,i] := D.G19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                        D.G19.FieldByName('BEF19007').ASString+#255+ //  'Run';
                        D.G19.FieldByName('BEF19500').ASString;      // 'Run
    SG02.Cells[05,i] := format('%0.0f',[f1*f2/1000]);
    SG02.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    SG02.Cells[07,i] := SS2;
    SG02.Cells[08,i] := format('%0.2f',[f1]);      // BEF19303
    SG02.Cells[09,i] := D.G19.FieldByName('BEF19012').ASString;      // BEF19012
    SG02.Cells[10,i] := SS3;
    inc(i1);
    D.G19.Next;
  End;
  D.F05.Locate('BEF05001',VarArrayOf([D.F10.FieldByName('BEF10102').AsString]), [loCaseInsensitive]);
  CRow := max(2,CRow+1);
  CRow := max(CRow,i1+1);
  CRow := max(CRow,KC_StrToInt(D.F05.FieldByName('BEF05203').ASString));
  SG02.RowCount := CRow;
  for i:=1 to CRow-1 do
    if (SG02.Cells[04,i] = '') Then
      SG02.Cells[00,i] := KC_FillCharBefore(IntToStr(i),3,'0');
  KC_ColAutoSize(SG02);
end;

procedure TF_C05.SG03Snd;
var
  i,i1 : integer;
  f1,f2 : Real;
  SS,SS1,SS2,SS3: String;
  CRow : integer;
begin
  i := 1;
  i1 := 1;
  KC_SGClear(1,SG03);
  if (SG01.Cells[01,SG01.Row]='') Then Exit;
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SG05.Cells[0,SG05.Row] <> D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS1 := '';
    SS2 := '';
    SS3 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
    Begin
      SS1 := D.F05.FieldByName('BEF05003').ASString;
      SS2 := D.F05.FieldByName('BEF05004').ASString;
      SS3 := D.F05.FieldByName('BEF05008').ASString;
    End;
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19501').ASString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19502').ASString);
    CRow := max(i,KC_StrToInt(D.G19.FieldByName('BEF19011').ASString));
    i := KC_StrToInt(D.G19.FieldByName('BEF19011').ASString);
    i := GetRow(SG03,i);
    SS := '';
    if (D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19004').ASString, [loCaseInsensitive])) Then
      SS:= D.F05.FieldByName('BEF05008').AsString;
    SG03.Cells[00,i] := D.G19.FieldByName('BEF19011').ASString;       // BEF19011
    SG03.Cells[01,i] := SS1;
    SG03.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;      // BEF19002
    SG03.Cells[03,i] := SS;      // BEF19004
    SG03.Cells[04,i] := D.G19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19500').ASString;      // 'Run
    SG03.Cells[05,i] := format('%0.0f',[f1*f2/1000]);
    SG03.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString; // '檢驗寬幅'
    SG03.Cells[07,i] := SS2;
    SG03.Cells[08,i] := D.G19.FieldByName('BEF19501').ASString;      // BEF19303
    SG03.Cells[09,i] := D.G19.FieldByName('BEF19012').ASString;      // BEF19012
    SG03.Cells[10,i] := SS3;
    inc(i1);
    D.G19.Next;
  End;
  D.F05.Locate('BEF05001',VarArrayOf([D.F10.FieldByName('BEF10102').AsString]), [loCaseInsensitive]);
  CRow := max(2,CRow+1);
  CRow := max(CRow,i1+1);
  CRow := max(CRow,KC_StrToInt(D.F05.FieldByName('BEF05203').ASString));
  SG03.RowCount := CRow;
  for i:=1 to CRow-1 do
    if (SG03.Cells[04,i] = '') Then
      SG03.Cells[00,i] := KC_FillCharBefore(IntToStr(i),3,'0');
  KC_ColAutoSize(SG03);
end;

procedure TF_C05.SG05Snd;
var                                                     
  i : integer;
  SS: String;
begin
  KC_SGClear(1,SG05);
  if (SG01.Cells[01,SG01.Row]='') Then Exit;
  i := 1;
  SS := 'zz';
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SS=D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS:=D.G19.FieldByName('BEF19010').ASString;
    SG05.Cells[0,i] :=  SS;     //  'Running';
    D.G19.Next;
    inc(i);
  End;
  SG05.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG05);
end;

procedure TF_C05.SG04Snd;
var
  i : integer;
  SS: String;
begin
  KC_SGClear(1,SG04);
  ORunningG19('9',SG01.Cells[2,SG01.Row],SG01.Cells[13,SG01.Row]);
  i := 1;
  SS := 'zz';
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SS=D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (CB_Type.ItemIndex = 1) and
       (SG01.Cells[01,SG01.Row] <> D.G19.FieldByName('BEF19008').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS:=D.G19.FieldByName('BEF19010').ASString;
    SG04.Cells[0,i] :=  SS;     //  'Running';
    D.G19.Next;
    inc(i);
  End;
  SG04.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG04);
end;

procedure TF_C05.FormShow(Sender: TObject);
begin
  D.OpenF05;
  SG01INI;
  SG04INI;
  SG02INI;
  SG05INI;
  SG03INI;
  OpenF20;
  SG01Snd;
  D.OpenF10(SG01.Cells[2,SG01.Row],SG01.Cells[13,SG01.Row]);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.B_B03Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TF_C05.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.RunningToColor(Cells[ACol,ARow]);
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

procedure TF_C05.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    7 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 4;
          F_V01.PType    := SG01.Cells[01,SG01.Row];
          F_V01.Working  := SG01.Cells[00,SG01.Row];
          F_V01.Running      := SG01.Cells[07,SG01.Row];
          F_V01.BDate    := '-';
          F_V01.ShowModal;
          F_V01.Free;
          OpenF20;
          SG01Snd;
        End;
  end;
end;

procedure TF_C05.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.StationToColor(Cells[ACol,ARow]);
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

procedure TF_C05.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  D.OpenF10(SG01.Cells[2,SG01.Row],SG01.Cells[13,SG01.Row]);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  D.OpenF10(SG01.Cells[2,SG01.Row],SG01.Cells[13,SG01.Row]);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.SG04KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG02Snd; SG02UpData;
end;

procedure TF_C05.SG04MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd; SG02UpData;
end;

procedure TF_C05.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02UpData;
end;

procedure TF_C05.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG02UpData;
end;

function  TF_C05.ChkSpec : boolean;
begin
  Result := True;
  if ((KC_StrTofloat(SG02.Cells[08,SG02.Row])+0.000001) <= KC_StrTofloat(SG01.Cells[05,SG01.Row])) or
     ((KC_StrTofloat(SG02.Cells[08,SG02.Row])-0.000001) >= KC_StrTofloat(SG01.Cells[06,SG01.Row])) Then
  Begin
    ShowMessage('長度不符 .... ');
    Result := false;
  End;
  if (SG01.Cells[07,SG01.Row]='') Then Exit;
  if (POS(SG02.Cells[01,SG02.Row],SG01.Cells[07,SG01.Row])=0) Then
  Begin
    ShowMessage('級別不符 .... ');
    Result := false;
  End;
end;

procedure TF_C05.B_SaveClick(Sender: TObject);
var
  SQL1,SQL2 : String;
begin
  if (SG02.Cells[04,SG02.Row] = '') Then Exit;
  if (SG01.Cells[03,SG01.Row] <> SG02.Cells[03,SG02.Row]) Then
  Begin
    ShowMessage('Process 不符合');
    Exit;
  End;
  if not ChkSpec Then Exit;
  SQL1 := 'UpDate BEFG19 Set BEF19010 = '''+E_010.Text+
                       ''', BEF19011 = '''+E_011.Text+
                       ''', BEF19012 = '''+E_012.Text+
                       ''', BEF19101 = ''4'+
                       ''', BEF19008 = '''+SG01.Cells[1,SG01.Row]+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],2)+
                    ''' and BEF19500 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],3)+'''';
  SQL2 := 'UpDate BEFF19 Set BEF19101 = ''4'+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],2)+'''';
  KC_T2ExecSQL(SQL1,D.FCmd);
  KC_T2ExecSQL(SQL2,D.FCmd);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.SG02DblClick(Sender: TObject);
begin
  (*
  if (SG02.Cells[04,SG02.Row] = '') Then Exit;
  if (SG01.Cells[03,SG01.Row] <> SG02.Cells[03,SG02.Row]) Then
  Begin
    ShowMessage('Process 不符合');
    Exit;
  End;
  F_V07 := TF_V07.Create(Application);
  F_V07.L_Run.Caption := SG02.Cells[04,SG02.Row];
  F_V07.L_No .Caption := SG01.Cells[01,SG01.Row];       
  F_V07.ShowModal;
  F_V07.Free;
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  *)
end;

procedure TF_C05.B_SaveTClick(Sender: TObject);
var
  SQL : String;
begin
  if (SG02.Cells[4,SG02.Row] = '') Then Exit;
  SQL := 'UpDate BEFG19 Set BEF19010 = '''+E_010T.Text+
                       ''', BEF19011 = '''+E_011T.Text+
                       ''', BEF19012 = '''+E_012T.Text+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],2)+
                    ''' and BEF19500 = '''+KC_GetSubStr(#255,SG02.Cells[4,SG02.Row],3)+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

function  TF_C05.GetF501 : String;
var
  f1,f2,ret : Real;
begin
  f1 := D.F19.FieldByName('BEF19501').ASfloat+KC_StrToFloat(SG03.Cells[08,SG03.Row]);
  f2 := D.F19.FieldByName('BEF19303').ASfloat;
  ret := iif(f1>f2,f2,f1);
  Result := format('%0.2f',[ret]);
end;

function  TF_C05.GetF502 : String;
var
  f1,f2,ret : Real;
begin
  D.OpenF16(D.F19.FieldByName('BEF19001').ASString);
  f1 := D.F19.FieldByName('BEF19502').ASfloat+KC_StrToFloat(SG03.Cells[06,SG03.Row]);
  f2 := D.F16.FieldByName('BEF16304').ASfloat;
  ret := iif(f1>f2,f2,f1);
  Result := format('%0.2f',[ret]);
end;

procedure TF_C05.SG03DblClick(Sender: TObject);
var
  S1,SQL1,SQL2 : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  S1 := ''',BEF19008 = '''+SG01.Cells[1,SG01.Row];
  if (MessageDlg('是否註銷保留?' , mtConfirmation,[mbOk, mbCancel], 0)  = mrOk) then
     S1 := ''',BEF19008 = '''+'';

  SQL1 := 'UpDate BEFG19 Set BEF19101 = '''+'9'+
                  S1+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],1)+
                  ''' and   BEF19007 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],2)+
                  ''' and   BEF19500 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],3)+'''';
  SQL2 := 'UpDate BEFF19 Set BEF19101 = '''+'9'+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],1)+
                  ''' and   BEF19007 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],2)+'''';
  KC_T3ExecSQL(SQL1,D.SC);
  KC_T3ExecSQL(SQL2,D.SC);
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.B_ExcelClick(Sender: TObject);
var
  W1,W2 : Variant;
  iPg   : Integer;
  i,j,k : integer;
begin
  KC_CopyToTemp(F.WorkDir,'C05.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\C05.xls');
  W1 := V.Workbooks[1].WorkSheets['Base'];
  W1.Activate; W1.Range['A2:M11'].Copy;
  W2 := V.Workbooks[1].WorkSheets['Data'];
  iPg := 2;
  For i:=1 to SG05.RowCount-1 do
  Begin
    W2.Activate; W2.Range['A'+IntToStr(iPg)].Select; W2.Paste;
    SG05.Row := i; SG03Snd; SG03UpData;
    W2.Cells[iPg+1,1].Value := SG05.Cells[0,i];
    W2.Cells[iPg+1,2].Value := FormatDateTime('yyyy/mm/dd', Date);
    W2.Cells[iPg+1,3].Value := '=Sum(E'+IntToStr(iPg+5)+':M'+IntToStr(iPg+5)+')';
    For k:=1 to SG03.RowCount-1 do
      For j:=1 to 9 do
      Begin
        if (SG03.Cells[j,k] = '') then Continue;
        W2.Cells[iPg+j,k+4].Value := SG03.Cells[j,k];
      End;
    inc(iPg,11);
  End;
end;

procedure TF_C05.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_C05.SG05KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.SG05MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.B_PassClick(Sender: TObject);
var
  i : integer;
  SQL1,SQL2 : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  for i:=1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[04,SG02.Row] = '') Then Continue;
    if (SG01.Cells[03,SG01.Row] <> SG02.Cells[03,SG02.Row]) Then Continue;
    if not ChkSpec Then Continue;
    SQL1 := 'UpDate BEFG19 Set BEF19101 = ''4'+
                         ''', BEF19008 = '''+SG01.Cells[1,SG01.Row]+
                    ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[4,i],1)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[4,i],2)+
                      ''' and BEF19500 = '''+KC_GetSubStr(#255,SG02.Cells[4,i],3)+'''';
    SQL2 := 'UpDate BEFF19 Set BEF19101 = ''4'+
                    ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[4,i],1)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[4,i],2)+'''';
    KC_T2ExecSQL(SQL1,D.FCmd);
    KC_T2ExecSQL(SQL2,D.FCmd);
  End;
  SG04Snd;
  SG02Snd; SG02UpData;
  OpenG19(SG01.Cells[01,SG01.Row]);
  SG05Snd;
  SG03Snd; SG03UpData;
  SG99ini;
  SG99Snd(SG01.Cells[01,SG01.Row]);
end;

procedure TF_C05.CB_TypeChange(Sender: TObject);
begin
  SG04Snd;
  SG02Snd;
end;

end.


