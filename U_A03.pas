unit U_A03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A03 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    E_001: TEdit;
    E_002: TEdit;
    E_099: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    CB_000: TComboBox;
    Panel4: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure CB_000Change(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF06;
    procedure SveF06;
  public
    { Public declarations }
  end;

var
  F_A03: TF_A03;

implementation

uses U_F,U_KcPub,  U_D, U_V02;

{$R *.dfm}

procedure TF_A03.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Running';
  SG01.Cells[1,0] := 'No.';
  SG01.Cells[2,0] := '®e¶q';
  SG01.Cells[3,0] := 'Note';
  KC_ColAutoSize(SG01);
End;

procedure TF_A03.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F06.First;
  While not D.F06.Eof do
  Begin
    if ((CB_000.ItemIndex <> 0) and
        (D.F06.FieldByName('BEF06000').AsString <> KC_GetSubStr('.',CB_000.Text,1)))Then
    Begin
      D.F06.Next;
      Continue;
    End;
    SG01.Cells[0,i] := F.Running00(D.F06.FieldByName('BEF06000').AsString);
    SG01.Cells[1,i] := D.F06.FieldByName('BEF06001').ASString;
    SG01.Cells[2,i] := D.F06.FieldByName('BEF06002').ASString;
    SG01.Cells[3,i] := D.F06.FieldByName('BEF06099').ASString;
    inc(i);
    D.F06.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A03.Updata;
begin
  D.F06.Locate('BEF06001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F06.FieldByName('BEF06001').ASString;
  E_002.Text := D.F06.FieldByName('BEF06002').ASString;
  E_099.Text := D.F06.FieldByName('BEF06099').ASString;
end;

procedure TF_A03.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_A03,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_A03,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_A03,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_000.Enabled := true;
end;

procedure TF_A03.DelF06;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F06.Delete;
  D.F06.ApplyUpdates(-1);
  D.OpenF06;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A03.SveF06;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F06.Append;
   1 : D.F06.edit;
  End;
  D.F06.FieldByName('BEF06001').ASString := E_001.Text;
  D.F06.FieldByName('BEF06002').ASString := E_002.Text;
  D.F06.FieldByName('BEF06099').ASString := E_099.Text;
  D.F06.ApplyUpdates(-1);
  D.OpenF06;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A03.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF06;
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A03.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF06;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF06;
end;

procedure TF_A03.CB_000Change(Sender: TObject);
begin
  if (Kind <> 2) Then Exit;
  SG01Snd;
  UpData;
end;

procedure TF_A03.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A03.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

procedure TF_A03.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_A03.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V02 := TF_V02.Create(Application);
          F_V02.Running     := SG01.Cells[0,SG01.Row];
          F_V02.No      := SG01.Cells[1,SG01.Row];
          F_V02.SType   := '';
          F_V02.iType   := 3;
          F_V02.ShowModal;
          F_V02.Free;
          D.OpenF06;
          SG01INI;
          SG01Snd;
          Updata;
          C_Kind(2);
        End;
  end;
end;

end.
