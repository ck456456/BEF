unit U_B03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_B03 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    E_001: TEdit;
    E_006: TEdit;
    E_099: TEdit;
    E_101: TEdit;
    E_004: TEdit;
    E_102: TEdit;
    CB_003: TComboBox;
    E_103: TEdit;
    E_005: TEdit;
    E_007: TEdit;
    CB_002: TComboBox;
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
    procedure CB_000Change(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
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
    procedure OpenF05(S1 : String);
    procedure OpenF03(S1 : String);
    procedure PNoLoad(CB :TComboBox);
    procedure UVBoxLd(CB :TComboBox);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF03;
    procedure SveF03;
  public
    { Public declarations }
  end;

var
  F_B03: TF_B03;

implementation

uses U_KcPub, U_D, U_F, U_V02;

{$R *.dfm}

procedure TF_B03.OpenF05(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF05 With (INDEX(BEFF05_002)) Where'+
            ' BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := SQLStr;
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

procedure TF_B03.PNoLoad(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_B03.UVBoxLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F06.First;
  While not D.F06.Eof do
  Begin
    if not (D.F06.FieldByName('BEF06000').AsInteger in [0,1] ) Then
    Begin
      D.F06.Next;
      Continue;
    End;
    CB.Items.Add(D.F06.FieldByName('BEF06001').AsString);
    D.F06.Next;
  End;
end;

procedure TF_B03.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';
  SG01.Cells[01,0] := 'No';
  SG01.Cells[02,0] := '膠種';
  SG01.Cells[03,0] := 'Product';
  SG01.Cells[04,0] := '原物料編號1';
  SG01.Cells[05,0] := '原物料編號2';
  SG01.Cells[06,0] := '桶號';
  SG01.Cells[07,0] := '日期';
  SG01.Cells[08,0] := '黏度';
  SG01.Cells[09,0] := '總重';
  SG01.Cells[10,0] := '回收';
  SG01.Cells[11,0] := '耗用';
  SG01.Cells[12,0] := 'Note';
  KC_ColAutoSize(SG01);
End;

procedure TF_B03.OpenF03(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF03 With (INDEX(BEFF03_000)) Where'+
            ' BEF03000 = '''+S1+''' Order by BEF03001';
  KC_T3Close(D.F03,D.SC);
  D.F03.CommandText := SQLStr;
  KC_T3OPEN(D.F03,D.SC);
  D.F03.First;
End;

procedure TF_B03.SG01Snd;
var
  i : integer;
begin
  OpenF03(KC_GetSubStr('.',CB_000.Text,1));
  KC_SGClear(1,SG01);
  i := 1;
  D.F03.First;
  While not D.F03.Eof do
  Begin
    SG01.Cells[00,i] := F.Running00(D.F03.FieldByName('BEF03000').AsString);
    SG01.Cells[01,i] := D.F03.FieldByName('BEF03001').ASString;
    SG01.Cells[02,i] := D.F03.FieldByName('BEF03005').ASString;
    SG01.Cells[03,i] := D.F03.FieldByName('BEF03002').ASString;
    SG01.Cells[04,i] := D.F03.FieldByName('BEF03007').ASString;
    SG01.Cells[05,i] := D.F03.FieldByName('BEF03006').ASString;
    SG01.Cells[06,i] := D.F03.FieldByName('BEF03003').ASString;
    SG01.Cells[07,i] := D.F03.FieldByName('BEF03004').ASString;
    SG01.Cells[08,i] := D.F03.FieldByName('BEF03101').ASString;
    SG01.Cells[09,i] := D.F03.FieldByName('BEF03102').ASString;
    SG01.Cells[10,i] := D.F03.FieldByName('BEF03103').ASString;
    SG01.Cells[11,i] := Format('%0.2f',[D.F03.FieldByName('BEF03102').ASFloat-D.F03.FieldByName('BEF03103').ASFloat]);
    SG01.Cells[12,i] := D.F03.FieldByName('BEF03099').ASString;
    if ((SG01.Cells[00,i] = 'Running') or
        (SG01.Cells[00,i] = 'Hold')) and
        (D.F03.FieldByName('BEF03103').ASFloat = 0) Then
    SG01.Cells[11,i] := '0';

    inc(i);
    D.F03.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B03.Updata;
begin
  D.F03.Locate('BEF03001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F03.FieldByName('BEF03001').ASString;
 CB_002.Text := D.F03.FieldByName('BEF03002').ASString;
 CB_003.Text := D.F03.FieldByName('BEF03003').ASString;
  E_004.Text := D.F03.FieldByName('BEF03004').ASString;
  E_005.Text := D.F03.FieldByName('BEF03005').ASString;
  E_006.Text := D.F03.FieldByName('BEF03006').ASString;
  E_007.Text := D.F03.FieldByName('BEF03007').ASString;
  E_101.Text := D.F03.FieldByName('BEF03101').ASString;
  E_102.Text := D.F03.FieldByName('BEF03102').ASString;
  E_103.Text := D.F03.FieldByName('BEF03103').ASString;
  E_099.Text := D.F03.FieldByName('BEF03099').ASString;
end;

procedure TF_B03.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_B03,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B03,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B03,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_000.Enabled := true;
end;

procedure TF_B03.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);

  D.OpenF00;
  OpenF05(D.F00.FieldByName('BEF00202').ASString);
  PNoLoad(CB_002);
  D.OpenF06;
  UVBoxLd(CB_003);
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B03.CB_000Change(Sender: TObject);
begin
  if (Kind <> 2) Then Exit;
  SG01Snd;
  UpData;
end;

procedure TF_B03.DelF03;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F03.Delete;
  D.F03.ApplyUpdates(-1);
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B03.SveF03;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F03.Append;
   1 : D.F03.edit;
  End;
  D.F03.FieldByName('BEF03000').ASString := KC_GetSubStr('.',CB_000.Text,1);
  D.F03.FieldByName('BEF03001').ASString := E_001.Text;
  D.F03.FieldByName('BEF03002').ASString :=CB_002.Text;
  D.F03.FieldByName('BEF03003').ASString :=CB_003.Text;
  D.F03.FieldByName('BEF03004').ASString := E_004.Text;
  D.F03.FieldByName('BEF03005').ASString := E_005.Text;
  D.F03.FieldByName('BEF03006').ASString := E_006.Text;
  D.F03.FieldByName('BEF03007').ASString := E_007.Text;
  D.F03.FieldByName('BEF03101').ASString := E_101.Text;
  D.F03.FieldByName('BEF03102').ASString := E_102.Text;
  D.F03.FieldByName('BEF03103').ASString := E_103.Text;
  D.F03.FieldByName('BEF03099').ASString := E_099.Text;
  D.F03.ApplyUpdates(-1);
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B03.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF03;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF03;
end;

procedure TF_B03.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_B03.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

procedure TF_B03.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_B03.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V02         := TF_V02.Create(Application);
          F_V02.Running := SG01.Cells[0,SG01.Row];
          F_V02.No      := SG01.Cells[1,SG01.Row];
          F_V02.SType   := SG01.Cells[2,SG01.Row];
          F_V02.iType   := 6;
          F_V02.ShowModal;
          F_V02.Free;
          SG01INI;
          SG01Snd;
          Updata;
          C_Kind(2);
        End;
  end;
end;

end.


