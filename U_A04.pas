unit U_A04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DB;

type
  TF_A04 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    E_002: TEdit;
    E_003: TEdit;
    E_099: TEdit;
    Panel3: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    CB_001: TComboBox;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure CB_001Change(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    Kind  : Byte;
    procedure C_Kind(CC_Kind : Byte);
    procedure SG01ini;
    procedure SG01Snd;
    procedure UpData;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A04: TF_A04;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_A04.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Station';
  SG01.Cells[1,0] := 'No';
  SG01.Cells[2,0] := 'Name';
  SG01.Cells[3,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A04.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F07.First;
  i := 1;
  While not D.F07.eof do
  Begin
    if (CB_001.Text <> D.F07.FieldByName('BEF07001').ASSTRING) Then
    Begin
      D.F07.Next;
      Continue;
    End;
    SG01.Cells[0,i] := D.F07.FieldByName('BEF07001').ASSTRING;
    SG01.Cells[1,i] := D.F07.FieldByName('BEF07002').ASSTRING;
    SG01.Cells[2,i] := D.F07.FieldByName('BEF07003').ASSTRING;
    SG01.Cells[3,i] := D.F07.FieldByName('BEF07099').ASSTRING;
    inc(i);
    D.F07.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A04.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A04,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A04,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A04,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_001.Enabled := True;
End;

procedure TF_A04.UpData;
begin
  D.F07.Locate('BEF07001;BEF07002', VarArrayOf([SG01.Cells[0,SG01.Row],
                                                SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
   E_002.TEXT := D.F07.FieldByName('BEF07002').ASSTRING;
   E_003.TEXT := D.F07.FieldByName('BEF07003').ASSTRING;
   E_099.TEXT := D.F07.FieldByName('BEF07099').ASSTRING;
end;

procedure TF_A04.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F07.Delete;
  D.F07.ApplyUpdates(-1);
  SG01ini;
  SG01Snd;
  Updata;
end;

procedure TF_A04.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  case kind of
    0 : D.F07.Append;
    1 : D.F07.edit;
  end;

  D.F07.FieldByName('BEF07001').ASSTRING := CB_001.TEXT;
  D.F07.FieldByName('BEF07002').ASSTRING :=  E_002.TEXT;
  D.F07.FieldByName('BEF07003').ASSTRING :=  E_003.TEXT;
  D.F07.FieldByName('BEF07099').ASSTRING :=  E_099.TEXT;
  D.F07.ApplyUpdates(-1);
  D.OpenF07;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A04.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF07;
  SG01ini;
  SG01Snd;
  Kind := 2;
  C_Kind(2);
  Updata;
end;

procedure TF_A04.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A04.CB_001Change(Sender: TObject);
begin
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A04.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A04.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.


