unit U_A99;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Buttons, DB;

type
  TF_A99 = class(TForm)
    P_Main: TPanel;
    L_Kind: TLabel;
    Panel4: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    E_001: TEdit;
    E_002: TEdit;
    E_003: TEdit;
    Panel7: TPanel;
    SG01: TStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Mm: TMemo;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Kind  : Byte;
    procedure C_Kind(CC_Kind : Byte);
    procedure UpData;
    procedure SG01ini;
    procedure SG01Snd;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A99: TF_A99;

implementation

uses U_D ,U_KcPub;

{$R *.dfm}

procedure TF_A99.SG01ini;
var
  i,j : integer;
begin
  for i:=1 to SG01.RowCount-1 do
  for j:=0 to SG01.ColCount-1 do
    SG01.Cells[j,i] := '';

  SG01.Cells[0,0] := '²Õ¸s';
  SG01.Cells[1,0] := '¦W¦r';
  SG01.Cells[2,0] := '±K½X';
end;

procedure TF_A99.SG01Snd;
var
  i : integer;
begin
  D.PSW.First;
  i := 1;
  While not D.PSW.eof do
  Begin
    SG01.Cells[0,i] := D.PSW.FieldByName('BEFPW001').ASSTRING;
    SG01.Cells[1,i] := D.PSW.FieldByName('BEFPW002').ASSTRING;
    SG01.Cells[2,i] := D.PSW.FieldByName('BEFPW003').ASSTRING;
    inc(i);
    D.PSW.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
end;

procedure TF_A99.C_Kind(CC_Kind : Byte);  // 0:Append 1.Modify  2.View
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A99,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A99,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A99,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_A99.UpData;
begin
  D.PSW.Locate('BEFPW002', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  E_001.TEXT := D.PSW.FieldByName('BEFPW001').ASSTRING;
  E_002.TEXT := D.PSW.FieldByName('BEFPW002').ASSTRING;
  E_003.TEXT := D.PSW.FieldByName('BEFPW003').ASSTRING;
end;

procedure TF_A99.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.PSW.Locate('BEFPW002', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  D.PSW.Delete;
  D.PSW.ApplyUpdates(-1);
  SG01ini;
  SG01Snd;
  Updata;
end;

procedure TF_A99.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  D.PSW.Locate('BEFPW002', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.PSW.Append;
    1 : D.PSW.edit;
  end;

  D.PSW.FieldByName('BEFPW001').ASSTRING :=  E_001.TEXT;
  D.PSW.FieldByName('BEFPW002').ASSTRING :=  E_002.TEXT;
  D.PSW.FieldByName('BEFPW003').ASSTRING :=  E_003.TEXT;
  D.PSW.ApplyUpdates(-1);
  D.OpenPSW;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A99.FormShow(Sender: TObject);
begin
  D.OpenPSW;
  SG01ini;
  SG01Snd;
  Kind := 2;
  C_Kind(2);
  Updata;
end;

procedure TF_A99.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A99.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A99.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.
