unit U_A02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A02 = class(TForm)
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
    Label2: TLabel;
    CB_002: TComboBox;
    Label3: TLabel;
    E_003: TEdit;
    Label4: TLabel;
    E_004: TEdit;
    Label6: TLabel;
    E_005: TEdit;
    Label7: TLabel;
    E_006: TEdit;
    Label8: TLabel;
    CB_007: TComboBox;
    Label9: TLabel;
    E_103: TEdit;
    Label10: TLabel;
    E_101: TEdit;
    Label11: TLabel;
    E_102: TEdit;
    Label12: TLabel;
    E_104: TEdit;
    Label13: TLabel;
    E_201: TEdit;
    Label14: TLabel;
    E_202: TEdit;
    Label15: TLabel;
    E_203: TEdit;
    Label16: TLabel;
    E_204: TEdit;
    Label17: TLabel;
    E_008: TEdit;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF05;
    procedure SveF05;
    procedure PTypeLd(CB :TComboBox);
  public
    { Public declarations }
  end;

var
  F_A02: TF_A02;

implementation

uses U_F,U_KcPub,U_D, U_B03;

{$R *.dfm}

procedure TF_A02.PTypeLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
end;

procedure TF_A02.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := '目標料號';  // BEFF05.BEF05002
  SG01.Cells[1,0] := '判級料號';  // BEFF01.BEF01002
  SG01.Cells[2,0] := '成品料號';  // BEFF05.BEF05008
  SG01.Cells[3,0] := '級別';      // BEFF01.BEF01002
  SG01.Cells[4,0] := 'Note';      // BEFF05.BEF05099
  KC_ColAutoSize(SG01);
end;

procedure TF_A02.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    SG01.Cells[0,i] := D.F05.FieldByName('BEF05002').AsString;
    SG01.Cells[1,i] := D.F05.FieldByName('BEF05001').AsString;
    SG01.Cells[2,i] := D.F05.FieldByName('BEF05008').AsString;
    SG01.Cells[3,i] := D.F05.FieldByName('BEF05003').AsString;
    SG01.Cells[4,i] := D.F05.FieldByName('BEF05099').ASString;
    inc(i);
    D.F05.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A02.Updata;
begin
  D.F05.Locate('BEF05001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F05.FieldByName('BEF05001').ASString;
 CB_002.Text := D.F05.FieldByName('BEF05002').ASString;
  E_003.Text := D.F05.FieldByName('BEF05003').ASString;
  E_004.Text := D.F05.FieldByName('BEF05004').ASString;
  E_005.Text := D.F05.FieldByName('BEF05005').ASString;
  E_006.Text := D.F05.FieldByName('BEF05006').ASString;
 CB_007.Text := D.F05.FieldByName('BEF05007').ASString;
  E_008.Text := D.F05.FieldByName('BEF05008').ASString;
  E_101.Text := D.F05.FieldByName('BEF05101').ASString;
  E_102.Text := D.F05.FieldByName('BEF05102').ASString;
  E_103.Text := D.F05.FieldByName('BEF05103').ASString;
  E_104.Text := D.F05.FieldByName('BEF05104').ASString;
  E_201.Text := D.F05.FieldByName('BEF05201').ASString;
  E_202.Text := D.F05.FieldByName('BEF05202').ASString;
  E_203.Text := D.F05.FieldByName('BEF05203').ASString;
  E_204.Text := D.F05.FieldByName('BEF05204').ASString;
  E_099.Text := D.F05.FieldByName('BEF05099').ASString;
end;

procedure TF_A02.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_A02,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_A02,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_A02,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
end;

procedure TF_A02.DelF05;
Begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F05.Delete;
  D.F05.ApplyUpdates(-1);
  D.OpenF05;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A02.SveF05;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : D.F05.Append;
   1 : D.F05.edit;
  End;
  D.F05.FieldByName('BEF05001').AsString :=  E_001.Text;
  D.F05.FieldByName('BEF05002').AsString := CB_002.Text;
  D.F05.FieldByName('BEF05003').AsString :=  E_003.Text;
  D.F05.FieldByName('BEF05004').AsString :=  E_004.Text;
  D.F05.FieldByName('BEF05005').AsString :=  E_005.Text;
  D.F05.FieldByName('BEF05006').AsString :=  E_006.Text;
  D.F05.FieldByName('BEF05007').AsString := CB_007.Text;
  D.F05.FieldByName('BEF05008').AsString :=  E_008.Text;
  D.F05.FieldByName('BEF05101').AsString :=  E_101.Text;
  D.F05.FieldByName('BEF05102').AsString :=  E_102.Text;
  D.F05.FieldByName('BEF05103').AsString :=  E_103.Text;
  D.F05.FieldByName('BEF05104').AsString :=  E_104.Text;
  D.F05.FieldByName('BEF05201').AsString :=  E_201.Text;
  D.F05.FieldByName('BEF05202').AsString :=  E_202.Text;
  D.F05.FieldByName('BEF05203').AsString :=  E_203.Text;
  D.F05.FieldByName('BEF05204').AsString :=  E_204.Text;
  D.F05.FieldByName('BEF05099').AsString :=  E_099.Text;
  D.F05.ApplyUpdates(-1);
  D.OpenF05;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_A02.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF01;
  D.OpenF05;
  PTypeLd(CB_002);
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A02.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF05;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF05;
end;

procedure TF_A02.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A02.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.


