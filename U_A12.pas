unit U_A12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A12 = class(TForm)
    P_Main: TPanel;
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
    procedure F_Save;
    procedure F_Del;
  public
    { Public declarations }
  end;

var
  F_A12: TF_A12;

implementation

uses U_D,U_KcPub, U_F;

{$R *.dfm}

procedure TF_A12.UpData;
begin
  D.F22.Locate('BEF22002;BEF22001', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
   E_001.TEXT := D.F22.FieldByName('BEF22001').ASSTRING;
  CB_002.TEXT := D.F22.FieldByName('BEF22002').ASSTRING;
   E_099.TEXT := D.F22.FieldByName('BEF22099').ASSTRING;
end;

procedure TF_A12.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F22.First;
  i := 1;
  While not D.F22.eof do
  Begin
    SG01.Cells[0,i] := D.F22.FieldByName('BEF22002').ASSTRING;
    SG01.Cells[1,i] := D.F22.FieldByName('BEF22001').ASSTRING;
    SG01.Cells[2,i] := D.F22.FieldByName('BEF22099').ASSTRING;
    inc(i);
    D.F22.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A12.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Type';
  SG01.Cells[1,0] := 'No';
  SG01.Cells[2,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A12.C_Kind(CC_Kind : Byte);  // 0:Append 1.Modify  2.View
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A12,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A12,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A12,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_A12.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  D.F22.Locate('BEF22002;BEF22001', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.F22.Append;
    1 : D.F22.edit;
  end;
  D.F22.FieldByName('BEF22001').ASSTRING :=  E_001.TEXT;
  D.F22.FieldByName('BEF22002').ASSTRING := CB_002.TEXT;
  D.F22.FieldByName('BEF22099').ASSTRING :=  E_099.TEXT;
  D.F22.ApplyUpdates(-1);
  D.OpenF22;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;


procedure TF_A12.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F22.Locate('BEF22002;BEF22001', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  D.F22.Delete;
  D.F22.ApplyUpdates(-1);
  SG01ini;
  SG01Snd;
  Updata;
end;


procedure TF_A12.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF22;
  SG01ini;
  SG01Snd;
  Kind := 2;
  C_Kind(2);
  Updata;
end;

procedure TF_A12.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A12.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A12.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.

