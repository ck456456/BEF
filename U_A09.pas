unit U_A09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_A09 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    E_099: TEdit;
    E_002: TEdit;
    E_003: TEdit;
    Panel3: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    CB_001: TComboBox;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Label2: TLabel;
    E_004: TEdit;
    Label3: TLabel;
    CB_005: TComboBox;
    Label4: TLabel;
    CB_006: TComboBox;
    Label5: TLabel;
    E_007: TEdit;
    Label6: TLabel;
    E_008: TEdit;
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
    procedure OpenF05(S1 : String);
    procedure UpData;
    procedure LoadF21;
    procedure Load006;
    procedure SG01ini;
    procedure SG01Snd;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A09: TF_A09;

implementation

uses U_D,U_KcPub, U_F;

{$R *.dfm}

procedure TF_A09.UpData;
begin
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  CB_001.TEXT := D.F12.FieldByName('BEF12001').ASSTRING;
   E_002.TEXT := D.F12.FieldByName('BEF12002').ASSTRING;
   E_003.TEXT := D.F12.FieldByName('BEF12003').ASSTRING;
   E_004.TEXT := D.F12.FieldByName('BEF12004').ASSTRING;
  CB_005.TEXT := D.F12.FieldByName('BEF12005').ASSTRING;
  CB_006.TEXT := D.F12.FieldByName('BEF12006').ASSTRING;
   E_007.TEXT := D.F12.FieldByName('BEF12007').ASSTRING;
   E_008.TEXT := D.F12.FieldByName('BEF12008').ASSTRING;
   E_099.TEXT := D.F12.FieldByName('BEF12099').ASSTRING;
end;

procedure TF_A09.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F12.First;
  i := 1;
  While not D.F12.eof do
  Begin
    if (CB_001.Text <> D.F12.FieldByName('BEF12001').ASSTRING) Then
    Begin
      D.F12.Next;
      Continue;
    End;
    SG01.Cells[0,i] := D.F12.FieldByName('BEF12001').ASSTRING;
    SG01.Cells[1,i] := D.F12.FieldByName('BEF12002').ASSTRING;
    SG01.Cells[2,i] := D.F12.FieldByName('BEF12005').ASSTRING;
    SG01.Cells[3,i] := D.F12.FieldByName('BEF12003').ASSTRING;
    SG01.Cells[4,i] := D.F12.FieldByName('BEF12004').ASSTRING;
    SG01.Cells[5,i] := D.F12.FieldByName('BEF12099').ASSTRING;
    inc(i);
    D.F12.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A09.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Station';
  SG01.Cells[1,0] := 'No';
  SG01.Cells[2,0] := '¼t°Ï';
  SG01.Cells[3,0] := 'Name';
  SG01.Cells[4,0] := 'RunSub';
  SG01.Cells[5,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A09.C_Kind(CC_Kind : Byte);  // 0:Append 1.Modify  2.View
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A09,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';               
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A09,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A09,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_001.Enabled := True;
End;

procedure TF_A09.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.F12.Append;
    1 : D.F12.edit;
  end;

  D.F12.FieldByName('BEF12001').ASSTRING := CB_001.TEXT;
  D.F12.FieldByName('BEF12002').ASSTRING :=  E_002.TEXT;
  D.F12.FieldByName('BEF12003').ASSTRING :=  E_003.TEXT;
  D.F12.FieldByName('BEF12004').ASSTRING :=  E_004.TEXT;
  D.F12.FieldByName('BEF12005').ASSTRING := CB_005.TEXT;
  D.F12.FieldByName('BEF12006').ASSTRING := CB_006.TEXT;
  D.F12.FieldByName('BEF12007').ASSTRING :=  E_007.TEXT;
  D.F12.FieldByName('BEF12008').ASSTRING :=  E_008.TEXT;
  D.F12.FieldByName('BEF12099').ASSTRING :=  E_099.TEXT;
  D.F12.ApplyUpdates(-1);
  D.OpenF12;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;


procedure TF_A09.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf([SG01.Cells[0,SG01.Row],SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  D.F12.Delete;
  D.F12.ApplyUpdates(-1);
  SG01ini;
  SG01Snd;
  Updata;
end;


procedure TF_A09.LoadF21;
begin
  CB_005.Items.Clear;
  D.F21.First;
  While not D.F21.Eof do
  Begin
    CB_005.Items.Add(D.F21.FieldByName('BEF21001').AsString);
    D.F21.Next;
  End;
  CB_005.ItemIndex := iif(CB_005.Items.Count=0,-1,0);
end;

procedure TF_A09.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05002= '''+S1+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
End;

procedure TF_A09.Load006;
begin
  OpenF05(D.F00.FieldByName('BEF00202').AsString);
  CB_006.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB_006.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
  CB_006.ItemIndex := iif(CB_006.Items.Count=0,-1,0);
end;

procedure TF_A09.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF00;
  D.OpenF21;
  D.OpenF12;
  Load006;
  LoadF21;
  SG01ini;
  SG01Snd;
  Kind := 2;
  C_Kind(2);
  Updata;
end;

procedure TF_A09.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A09.CB_001Change(Sender: TObject);
begin
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A09.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_A09.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

end.
