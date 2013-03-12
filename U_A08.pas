unit U_A08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TF_A08 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    E_001: TEdit;
    E_002: TEdit;
    CB_102: TComboBox;
    CB_103: TCheckBox;
    P_104: TPanel;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel4: TPanel;
    SG01: TStringGrid;
    CDg: TColorDialog;
    Panel6: TPanel;
    Label11: TLabel;
    CB_101: TComboBox;
    CB_105: TCheckBox;
    CB_106: TCheckBox;
    CB_107: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure P_104Click(Sender: TObject);
    procedure CB_101Change(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF11;
    procedure SveF11;
  public
    { Public declarations }
  end;

var
  F_A08: TF_A08;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_A08.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No';
  SG01.Cells[1,0] := 'Events';
  KC_ColAutoSize(SG01);
end;

procedure TF_A08.SG01Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  D.F11.First;
  While not D.F11.Eof do
  Begin
    if (D.F11.FieldByName('BEF11101').ASString <> CB_101.Text)or
       (D.F11.FieldByName('BEF11001').ASString =  '9998')or
       (D.F11.FieldByName('BEF11001').ASString =  '9999')Then
    Begin
      D.F11.Next;
      Continue;
    End;
    SG01.Cells[0,i] := D.F11.FieldByName('BEF11001').ASString;
    SG01.Cells[1,i] := D.F11.FieldByName('BEF11002').ASString;
    inc(i);
    D.F11.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A08.Updata;
begin
  D.F11.Locate('BEF11101;BEF11001',VarArrayOf([CB_101.Text,SG01.Cells[0,SG01.Row]]), [loCaseInsensitive]);
  E_001.Text := D.F11.FieldByName('BEF11001').ASString;
  E_002.Text := D.F11.FieldByName('BEF11002').ASString;
  CB_102.ItemIndex := CB_102.Items.IndexOf(D.F11.FieldByName('BEF11102').ASString);
  CB_103.Checked := (D.F11.FieldByName('BEF11103').ASString = 'T');
  CB_105.Checked := (D.F11.FieldByName('BEF11105').ASString = 'T');
  CB_106.Checked := (D.F11.FieldByName('BEF11106').ASString = 'T');
  CB_107.Checked := (D.F11.FieldByName('BEF11107').ASString = 'T');
  P_104.Color := D.F11.FieldByName('BEF11104').ASInteger;
end;

procedure TF_A08.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_A08,['TEdit','TComboBox','TCheckBox']);
          E_001.SetFocus;
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_A08,['TEdit','TComboBox','TCheckBox']);
          E_001.SetFocus;
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_A08,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_101.Enabled := True;
End;

procedure TF_A08.DelF11;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F11.Delete;
  D.F11.ApplyUpdates(-1);
  D.OpenF11;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A08.SveF11;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F11.Append;
   1 : D.F11.edit;
  End;
  D.F11.FieldByName('BEF11001').AsString := E_001.Text;
  D.F11.FieldByName('BEF11002').AsString := E_002.Text;
  D.F11.FieldByName('BEF11101').AsString := CB_101.Text;
  D.F11.FieldByName('BEF11102').AsString := CB_102.Text;
  D.F11.FieldByName('BEF11103').AsString := iif(CB_103.Checked,'T','F');
  D.F11.FieldByName('BEF11104').ASInteger := P_104.Color;
  D.F11.FieldByName('BEF11105').AsString := iif(CB_105.Checked,'T','F');
  D.F11.FieldByName('BEF11106').AsString := iif(CB_106.Checked,'T','F');
  D.F11.FieldByName('BEF11107').AsString := iif(CB_107.Checked,'T','F');
  D.F11.ApplyUpdates(-1);
  D.OpenF11;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A08.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF11;
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A08.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF11;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF11;
end;

procedure TF_A08.P_104Click(Sender: TObject);
begin
  if CDg.Execute then P_104.Color := CDg.Color;
end;

procedure TF_A08.CB_101Change(Sender: TObject);
begin
  SG01Snd;
  UpData;
end;

procedure TF_A08.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A08.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.



