unit U_A06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons, DB;

type
  TF_A06 = class(TForm)
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel1: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    Label2: TLabel;
    CB_001: TComboBox;
    CB_002: TComboBox;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    E_101: TEdit;
    B_Target: TButton;
    CB_103: TCheckBox;
    Panel5: TPanel;
    SG02: TStringGrid;
    Panel8: TPanel;
    Label3: TLabel;
    Panel7: TPanel;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure CB_001Change(Sender: TObject);
    procedure CB_002Change(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_TargetClick(Sender: TObject);
    procedure SG02DblClick(Sender: TObject);
  private
    { Private declarations }
    Kind  : Byte;
    procedure C_Kind(CC_Kind : Byte);
    procedure GTestLd(CB :TComboBox);
    procedure OpenF09(S1,S2 : String);
    procedure SG01ini;
    procedure SG01Snd;
    procedure SG02Ini;
    procedure SG02Hdr;
    procedure SG02Snd;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A06: TF_A06;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_A06.GTestLd(CB :TComboBox);
begin
  D.OpenF07(CB_001.Text);
  CB.Items.Clear;
  D.F07.First;
  While not D.F07.Eof do
  Begin
    CB.Items.Add(D.F07.FieldByName('BEF07002').AsString);
    D.F07.Next;
  End;
  CB.ItemIndex := iif(CB.Items.Count=0,-1,0);
end;

procedure TF_A06.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Spec No';
  SG01.Cells[1,0] := 'Use';
  KC_ColAutoSize(SG01);
end;

procedure TF_A06.SG02ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,00] := 'Item';
  SG02.Cells[01,00] := 'Type';
  SG02.Cells[02,00] := 'Target';
  SG02.Cells[03,00] := 'Low(A+)';
  SG02.Cells[04,00] := 'Up (A+)';
  SG02.Cells[05,00] := 'Low(A)';
  SG02.Cells[06,00] := 'Up (A)';
  SG02.Cells[07,00] := 'Low(A-)';
  SG02.Cells[08,00] := 'Up (A-)';
  SG02.Cells[09,00] := 'Low(B)';
  SG02.Cells[10,00] := 'Up (B)';
  SG02.Cells[11,00] := 'Low(C)';
  SG02.Cells[12,00] := 'Up (C)';
  SG02.Cells[13,00] := 'Low(CPK)';
  SG02.Cells[14,00] := 'Up (CPK)';
  KC_ColAutoSize(SG02);
end;

procedure TF_A06.SG02Hdr;
var
  i : integer;
begin
  D.OpenF08(CB_001.Text,CB_002.Text);
  i := 1;
  KC_SGClear(1,SG02);
  While (not D.F08.Eof) do
  Begin
   if (D.F08.FieldByName('BEF08103').ASSTRING = '0') Then
   Begin
      SG02.Cells[0,i] := D.F08.FieldByName('BEF08101').ASSTRING+#255+
                         D.F08.FieldByName('BEF08102').ASSTRING;
      inc(i);
   End;
   D.F08.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_A06.OpenF09(S1,S2 : String);
begin
  KC_T3Close(D.F09,D.SC);
  D.F09.CommandText := 'SELECT BEF09101,BEF09103 FROM BEFF09 Where BEF09001 = '''+S1+
                                                           ''' and BEF09002 = '''+S2+
                                                      ''' Group by BEF09101,BEF09103'+
                                                        ' Order by BEF09101,BEF09103';
  KC_T3OPEN(D.F09,D.SC);
  D.F09.First;
end;

procedure TF_A06.SG01Snd;
var
  i : integer;
begin
  i := 1;
  OpenF09(CB_001.Text,CB_002.Text);
  KC_SGClear(1,SG01);
  While (not D.F09.Eof) do
  Begin
   SG01.Cells[0,i] := D.F09.FieldByName('BEF09101').ASSTRING;
   SG01.Cells[1,i] := D.F09.FieldByName('BEF09103').ASSTRING;
   inc(i);
   D.F09.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A06.SG02Snd;
var
  i,j : integer;
begin
  for i := 1 to SG02.RowCount-1 do
  for j := 1 to SG02.ColCount-1 do
     SG02.Cells[i,j] := '';

  i := 1;
   E_101.Text    :=  SG01.Cells[0,SG01.Row];
  CB_103.Checked := (SG01.Cells[1,SG01.Row] = 'T');
  D.OpenF09(CB_001.Text,CB_002.Text,SG01.Cells[0,SG01.Row]);
  While (not D.F09.Eof) do
  Begin
    if not D.F09.Locate('BEF09001;BEF09002;BEF09101;BEF09102',
             VarArrayOf([CB_001.Text,
                         CB_002.Text,
                         SG01.Cells[0,SG01.Row],
                         KC_GetSubStr(#255,SG02.Cells[0,i],1)]), [loCaseInsensitive]) Then Continue;

   SG02.Cells[01,i] := D.F09.FieldByName('BEF09201').ASSTRING;
   SG02.Cells[02,i] := D.F09.FieldByName('BEF09202').ASSTRING;
   SG02.Cells[03,i] := D.F09.FieldByName('BEF09203').ASSTRING;
   SG02.Cells[04,i] := D.F09.FieldByName('BEF09204').ASSTRING;
   SG02.Cells[05,i] := D.F09.FieldByName('BEF09205').ASSTRING;
   SG02.Cells[06,i] := D.F09.FieldByName('BEF09206').ASSTRING;
   SG02.Cells[07,i] := D.F09.FieldByName('BEF09207').ASSTRING;
   SG02.Cells[08,i] := D.F09.FieldByName('BEF09208').ASSTRING;
   SG02.Cells[09,i] := D.F09.FieldByName('BEF09209').ASSTRING;
   SG02.Cells[10,i] := D.F09.FieldByName('BEF09210').ASSTRING;
   SG02.Cells[11,i] := D.F09.FieldByName('BEF09211').ASSTRING;
   SG02.Cells[12,i] := D.F09.FieldByName('BEF09212').ASSTRING;
   SG02.Cells[13,i] := D.F09.FieldByName('BEF09213').ASSTRING;
   SG02.Cells[14,i] := D.F09.FieldByName('BEF09214').ASSTRING;
   inc(i);
   D.F09.Next;
  End;
  // SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_A06.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A06,['TEdit','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A06,['TEdit','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A06,['TEdit','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_A06.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  GTestLd(CB_002);
  SG01Ini;
  SG01Snd;
  SG02Ini;
  SG02Hdr;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_A06.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  KC_T3ExecSQL('Delete BEFF09 Where BEF09001 = '''+CB_001.Text+
                           ''' and  BEF09002 = '''+CB_002.Text+
                           ''' and  BEF09101 = '''+SG01.Cells[0,SG01.Row]+'''',D.SC);
  SG01Snd;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_A06.F_Save;
var
  i : Integer;
Begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  if (1 = kind) Then  KC_T3ExecSQL('Delete BEFF09 Where BEF09001 = '''+CB_001.Text+
                                               ''' and  BEF09002 = '''+CB_002.Text+
                                               ''' and  BEF09101 = '''+SG01.Cells[0,SG01.Row]+'''',D.SC);
  For i := 1 to (SG02.RowCount-1) do
  Begin
    D.F09.Append;
    D.F09.FieldByName('BEF09001').ASSTRING := CB_001.Text;
    D.F09.FieldByName('BEF09002').ASSTRING := CB_002.Text;
    D.F09.FieldByName('BEF09101').ASSTRING :=  E_101.Text;
    D.F09.FieldByName('BEF09102').ASSTRING := KC_GetSubStr(#255,SG02.Cells[0,i],1);
    D.F09.FieldByName('BEF09103').ASSTRING := iif(CB_103.Checked,'T','F');
    D.F09.FieldByName('BEF09201').ASSTRING := SG02.Cells[01,i];
    D.F09.FieldByName('BEF09202').ASFloat  := KC_StrToFloat(SG02.Cells[02,i]);
    D.F09.FieldByName('BEF09203').ASFloat  := KC_StrToFloat(SG02.Cells[03,i]);
    D.F09.FieldByName('BEF09204').ASFloat  := KC_StrToFloat(SG02.Cells[04,i]);
    D.F09.FieldByName('BEF09205').ASFloat  := KC_StrToFloat(SG02.Cells[05,i]);
    D.F09.FieldByName('BEF09206').ASFloat  := KC_StrToFloat(SG02.Cells[06,i]);
    D.F09.FieldByName('BEF09207').ASFloat  := KC_StrToFloat(SG02.Cells[07,i]);
    D.F09.FieldByName('BEF09208').ASFloat  := KC_StrToFloat(SG02.Cells[08,i]);
    D.F09.FieldByName('BEF09209').ASFloat  := KC_StrToFloat(SG02.Cells[09,i]);
    D.F09.FieldByName('BEF09210').ASFloat  := KC_StrToFloat(SG02.Cells[10,i]);
    D.F09.FieldByName('BEF09211').ASFloat  := KC_StrToFloat(SG02.Cells[11,i]);
    D.F09.FieldByName('BEF09212').ASFloat  := KC_StrToFloat(SG02.Cells[12,i]);
    D.F09.FieldByName('BEF09213').ASFloat  := KC_StrToFloat(SG02.Cells[13,i]);
    D.F09.FieldByName('BEF09214').ASFloat  := KC_StrToFloat(SG02.Cells[14,i]);
    D.F09.ApplyUpdates(-1);
  End;
  SG01Snd;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_A06.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A06.CB_001Change(Sender: TObject);
begin
  GTestLd(CB_002);
  SG01Snd;
  SG02Hdr;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_A06.CB_002Change(Sender: TObject);
begin
  SG01Snd;
  SG02Hdr;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_A06.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG02Snd;
end;

procedure TF_A06.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd;
end;

procedure TF_A06.B_TargetClick(Sender: TObject);
var
  i,j : Integer;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  For i:=1 to SG02.RowCount-1 do
  Begin
    j := KC_StrToInt(SG02.Cells[1,i]);
    case j of
      2 : SG02.Cells[2,i] := SG02.Cells[13,i];
      3 : SG02.Cells[2,i] := SG02.Cells[14,i];
    else
          SG02.Cells[2,i] :=FloatToStr((KC_StrToFloat(SG02.Cells[14,i])+KC_StrToFloat(SG02.Cells[13,i]))/2);
    End;
  End;
end;

procedure TF_A06.SG02DblClick(Sender: TObject);
var
  i : integer;
begin
  if (SG02.Col <> 1) Then Exit;
  i := KC_StrToInt(SG02.Cells[1,SG02.Row]);
  case i of
    1 : SG02.Cells[1,SG02.Row] := '2';
    2 : SG02.Cells[1,SG02.Row] := '3';
    3 : SG02.Cells[1,SG02.Row] := '1';
  else
        SG02.Cells[1,SG02.Row] := '1';
  End;
end;

end.

