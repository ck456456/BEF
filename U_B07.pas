unit U_B07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_B07 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    L_000: TLabel;
    E_002: TEdit;
    E_999: TEdit;
    E_005: TEdit;
    E_006: TEdit;
    E_007: TEdit;
    Panel3: TPanel;
    SG01: TStringGrid;
    Panel4: TPanel;
    Label3: TLabel;
    CB_001: TComboBox;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Label4: TLabel;
    CB_004: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure CB_001Change(Sender: TObject);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure Load004;
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    Function  GetType(S1 : String) : String;
    Function  Get004(S1 : String) : Integer;
    procedure DelF26;
    procedure SveF26;
  public
    { Public declarations }
  end;

var
  F_B07: TF_B07;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_B07.Load004;
begin
  CB_004.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    if(D.F00.FieldByName('BEF00206').ASString<>D.F05.FieldByName('BEF05002').ASString) Then
    Begin
      D.F05.Next;
      Continue;
    End;
    CB_004.Items.Add(D.F05.FieldByName('BEF05001').ASString+#255+D.F05.FieldByName('BEF05099').ASString);
    D.F05.Next;
  End;
End;

procedure TF_B07.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,00] := 'No.';         // BEF26002
  SG01.Cells[01,00] := 'Date';        // BEF26007
  SG01.Cells[02,00] := 'Product';     // BEF26004
  SG01.Cells[03,00] := 'Type';        // BEF26001
  SG01.Cells[04,00] := 'Qty';         // BEF26005
  SG01.Cells[05,00] := 'OP';          // BEF26006
  SG01.Cells[06,00] := 'Note';        // BEF26999
  SG01.Cells[07,00] := '異動時間'; // BEF26000
  KC_ColAutoSize(SG01);
End;

Function  TF_B07.GetType(S1 : String) : String;
begin
  Result := '01.領料';
  if (S1 = '01') Then Result := '01.領料';
  if (S1 = '02') Then Result := '02.調整';
  if (S1 = '03') Then Result := '03.現場';
end;

procedure TF_B07.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F26.First;
  While not D.F26.eof do
  Begin
    if (D.F26.FieldByName('BEF26001').AsString <> KC_GetSubStr('.',CB_001.Text,1))Then
    Begin
      D.F26.Next;
      Continue;
    End;
    SG01.Cells[00,i] := D.F26.FieldByName('BEF26002').AsString;
    SG01.Cells[01,i] := D.F26.FieldByName('BEF26007').AsString;
    SG01.Cells[02,i] := D.F26.FieldByName('BEF26004').AsString;
    SG01.Cells[03,i] := GetType(D.F26.FieldByName('BEF26001').AsString);
    SG01.Cells[04,i] := D.F26.FieldByName('BEF26005').AsString;
    SG01.Cells[05,i] := D.F26.FieldByName('BEF26006').AsString;
    SG01.Cells[06,i] := D.F26.FieldByName('BEF26999').AsString;
    SG01.Cells[07,i] := D.F26.FieldByName('BEF26000').AsString;
    inc(i);
    D.F26.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

Function  TF_B07.Get004(S1 : String) : Integer;
var
  i : integer;
begin
  Result := -1;
  for i:=0 to CB_004.Items.Count-1 do
    if (S1=KC_GetSubStr(#255,CB_004.Items.Strings[i],1)) Then Result := i;
end;

procedure TF_B07.Updata;
begin
  D.F26.Locate('BEF26002',VarArrayOf([SG01.Cells[0,SG01.Row]]), [loCaseInsensitive]);
  E_002.Text      := D.F26.FieldByName('BEF26002').AsString;
 CB_004.ItemIndex := Get004(D.F26.FieldByName('BEF26004').AsString);
  E_006.Text      := D.F26.FieldByName('BEF26006').AsString;
  E_005.Text      := D.F26.FieldByName('BEF26005').AsString;
  E_007.Text      := D.F26.FieldByName('BEF26007').AsString;
  E_999.Text      := D.F26.FieldByName('BEF26999').AsString;
end;

procedure TF_B07.FormShow(Sender: TObject);
begin
  D.OpenF00;
  D.OpenF05;
  D.OpenF26;
  Load004;
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2)
end;

procedure TF_B07.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          E_007.Text := FormatDateTime('yyyymmdd', Now);
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_B07,['TEdit']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B07,['TEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B07,['TEdit']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_B07.SveF26;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F26.Append;
   1 : D.F26.edit;
  End;
  D.F26.FieldByName('BEF26000').AsString := FormatDateTime('yyyymmddhhnnsszzz', F.IdTime.DateTime);
  D.F26.FieldByName('BEF26001').AsString := KC_GetSubStr('.',CB_001.Text,1);
  D.F26.FieldByName('BEF26002').AsString :=  E_002.Text;
  D.F26.FieldByName('BEF26003').AsString :=  D.F00.FieldByName('BEF00206').ASString;
  D.F26.FieldByName('BEF26004').AsString := KC_GetSubStr(#255,CB_004.Text,1);
  D.F26.FieldByName('BEF26005').AsString :=  E_005.Text;
  D.F26.FieldByName('BEF26006').AsString :=  E_006.Text;
  D.F26.FieldByName('BEF26007').AsString :=  E_007.Text;
  D.F26.FieldByName('BEF26999').AsString :=  E_999.Text;

  if (D.F26.ApplyUpdates(-1) <> 0) Then
  Begin
    D.OpenF26;
    SG01Snd;
    UpData;
    C_Kind(2);
    Exit;
  End;
  case kind of
   0 : Begin
         F.BEF_Stock( 1,KC_GetSubStr(#255,CB_004.Text,1),KC_StrToFloat(E_005.Text));
       End;
   1 : Begin
         F.BEF_Stock(-1,SG01.Cells[02,SG01.Row],KC_StrToFloat(SG01.Cells[04,SG01.Row]));
         F.BEF_Stock( 1,KC_GetSubStr(#255,CB_004.Text,1),KC_StrToFloat(E_005.Text));
       End;
  End;
  D.OpenF26;
  SG01Snd;
  UpData;
  C_Kind(2)
End;

procedure TF_B07.DelF26;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F26.Delete;
  if (D.F26.ApplyUpdates(-1) <> 0) Then
  Begin
    D.OpenF26;
    SG01Snd;
    UpData;
    C_Kind(2);
    Exit;
  End;
  F.BEF_Stock(-1,SG01.Cells[02,SG01.Row],KC_StrToFloat(SG01.Cells[04,SG01.Row]));
  D.OpenF26;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B07.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF26;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF26;
end;

procedure TF_B07.CB_001Change(Sender: TObject);
begin
  B_Delete.Enabled := (CB_001.ItemIndex <> 2);
  B_Save  .Enabled := (CB_001.ItemIndex <> 2);
  SG01Snd;
  UpData;
  C_Kind(2)
end;

end.
