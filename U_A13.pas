unit U_A13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A13 = class(TForm)
    P_Main: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    E_002: TEdit;
    E_003: TEdit;
    Panel4: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    CB_001: TComboBox;
    Label11: TLabel;
    Label2: TLabel;
    CB_004: TComboBox;
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
  F_A13: TF_A13;

implementation

uses U_D,U_KcPub, U_F;

{$R *.dfm}

procedure TF_A13.UpData;
var
  S : String;
begin
  S := iif((SG01.Cells[1,SG01.Row]='·l¯Ó'),'0','1');
  D.F23.Locate('BEF23001;BEF23004;BEF23002', VarArrayOf([SG01.Cells[0,SG01.Row],S,SG01.Cells[2,SG01.Row]]), [loCaseInsensitive]);
  CB_001.TEXT := D.F23.FieldByName('BEF23001').ASSTRING;
   E_002.TEXT := D.F23.FieldByName('BEF23002').ASSTRING;
   E_003.TEXT := D.F23.FieldByName('BEF23003').ASSTRING;
  CB_004.ItemIndex := D.F23.FieldByName('BEF23004').ASInteger;
end;

procedure TF_A13.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F23.First;
  i := 1;
  While not D.F23.eof do
  Begin
    SG01.Cells[0,i] := D.F23.FieldByName('BEF23001').ASSTRING;
    SG01.Cells[1,i] := iif(D.F23.FieldByName('BEF23004').ASSTRING='0','·l¯Ó','¦¬®Æ¤£¨¬');
    SG01.Cells[2,i] := D.F23.FieldByName('BEF23002').ASSTRING;
    SG01.Cells[3,i] := D.F23.FieldByName('BEF23003').ASSTRING;
    inc(i);
    D.F23.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A13.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Station';
  SG01.Cells[1,0] := 'Type';
  SG01.Cells[2,0] := 'No';
  SG01.Cells[3,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A13.C_Kind(CC_Kind : Byte);  // 0:Append 1.Modify  2.View
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A13,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A13,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A13,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_A13.F_Save;
var
  S : String;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  S := iif((SG01.Cells[1,SG01.Row]='·l¯Ó'),'0','1');
  D.F23.Locate('BEF23001;BEF23004;BEF23002', VarArrayOf([SG01.Cells[0,SG01.Row],S,SG01.Cells[2,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.F23.Append;
    1 : D.F23.edit;
  end;

  D.F23.FieldByName('BEF23001').ASSTRING :=  CB_001.TEXT;
  D.F23.FieldByName('BEF23002').ASSTRING :=   E_002.TEXT;
  D.F23.FieldByName('BEF23003').ASSTRING :=   E_003.TEXT;
  D.F23.FieldByName('BEF23004').ASSTRING :=  IntToStr(CB_004.ItemIndex);
  D.F23.ApplyUpdates(-1);
  D.OpenF23;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;


procedure TF_A13.F_Del;
var
  S : String;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  S := iif((SG01.Cells[1,SG01.Row]='·l¯Ó'),'0','1');
  D.F23.Locate('BEF23001;BEF23004;BEF23002', VarArrayOf([SG01.Cells[0,SG01.Row],S,SG01.Cells[2,SG01.Row]]), [loCaseInsensitive]);
  D.F23.Delete;
  D.F23.ApplyUpdates(-1);
  SG01ini;
  SG01Snd;
  Updata;
end;


procedure TF_A13.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF23;
  SG01ini;
  SG01Snd;
  Kind := 2;
  C_Kind(2);
  Updata;
end;

procedure TF_A13.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A13.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A13.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.


