unit U_A01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A01 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    E_001: TEdit;
    E_099: TEdit;
    Panel4: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    CB_002: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
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
    procedure DelF01;
    procedure SveF01;
  public
    { Public declarations }
  end;

var
  F_A01: TF_A01;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_A01.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No.';
  SG01.Cells[1,0] := '»s³y«~';
  SG01.Cells[2,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A01.Updata;
begin
  D.F01.Locate('BEF01001',SG01.Cells[0,SG01.Row], [loCaseInsensitive]);
  E_001.Text      := D.F01.FieldByName('BEF01001').ASString;
 CB_002.Checked   := ('T'=D.F01.FieldByName('BEF01002').ASString);
  E_099.Text      := D.F01.FieldByName('BEF01099').ASString;
end;

procedure TF_A01.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F01.First;
  While not D.F01.Eof do
  Begin
    SG01.Cells[0,i] := D.F01.FieldByName('BEF01001').AsString;
    SG01.Cells[1,i] := D.F01.FieldByName('BEF01002').AsString;
    SG01.Cells[2,i] := D.F01.FieldByName('BEF01099').ASString;
    inc(i);
    D.F01.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A01.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_A01,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_A01,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_A01,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
end;

procedure TF_A01.DelF01;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F01.Delete;
  D.F01.ApplyUpdates(-1);
  D.OpenF01;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A01.SveF01;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F01.Append;
   1 : D.F01.edit;
  End;
  D.F01.FieldByName('BEF01001').AsString  := E_001.Text;
  D.F01.FieldByName('BEF01002').AsString  := iif(CB_002.Checked,'T','F');
  D.F01.FieldByName('BEF01099').AsString  := E_099.Text;
  D.F01.ApplyUpdates(-1);
  D.OpenF01;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A01.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF01;
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A01.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF01;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF01;
end;

procedure TF_A01.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A01.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.


