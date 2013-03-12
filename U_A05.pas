unit U_A05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, CIM_Grid;

type
  TF_A05 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel1: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    CB_001: TComboBox;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    E_101: TEdit;
    E_102: TEdit;
    CB_103: TComboBox;
    Panel7: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    CB_104: TComboBox;
    Label6: TLabel;
    CB_105: TComboBox;
    SG02: TStringGrid;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CB_001Change(Sender: TObject);
  private
    { Private declarations }
    Kind  : Byte;
    procedure C_Kind(CC_Kind : Byte);
    procedure SG01ini;
    procedure SG01Snd;
    procedure SG02ini;
    procedure SG02Snd;
    procedure UpData;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A05: TF_A05;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_A05.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No';
  SG01.Cells[1,0] := 'Name';
  SG01.Cells[2,0] := 'Note';
  KC_ColAutoSize(SG01);
end;

procedure TF_A05.SG01Snd;
var
  i : integer;
begin
  D.F07.First;
  i := 1;
  While not D.F07.eof do
  Begin
    if (CB_001.Text <> D.F07.FieldByName('BEF07001').ASSTRING) Then
    Begin
      D.F07.Next;
      Continue;
    End;
    SG01.Cells[0,i] := D.F07.FieldByName('BEF07002').ASSTRING;
    SG01.Cells[1,i] := D.F07.FieldByName('BEF07003').ASSTRING;
    SG01.Cells[2,i] := D.F07.FieldByName('BEF07099').ASSTRING;
    inc(i);
    D.F07.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A05.SG02ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[0,0] := 'No';
  SG02.Cells[1,0] := 'Name';
  SG02.Cells[2,0] := 'Value/Boolean';
  SG02.Cells[3,0] := '預估良率公式';
  SG02.Cells[4,0] := 'Judge';
  KC_ColAutoSize(SG02);
end;

procedure TF_A05.SG02Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG02);
  D.F08.First;
  While not D.F08.eof do
  Begin
    if (CB_001.Text <> D.F08.FieldByName('BEF08001').ASSTRING) Then
    Begin
      D.F08.Next;
      Continue;
    End;
    if (SG01.Cells[0,SG01.Row] <> D.F08.FieldByName('BEF08002').ASSTRING) Then
    Begin
      D.F08.Next;
      Continue;
    End;
    SG02.Cells[0,i] := D.F08.FieldByName('BEF08101').ASSTRING;
    SG02.Cells[1,i] := D.F08.FieldByName('BEF08102').ASSTRING;
    SG02.Cells[2,i] := iif(D.F08.FieldByName('BEF08103').ASSTRING='0','Value','Boolean');
    SG02.Cells[3,i] := D.F08.FieldByName('BEF08104').ASSTRING;
    SG02.Cells[4,i] := D.F08.FieldByName('BEF08105').ASSTRING;
    inc(i);
    D.F08.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_A05.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A05,['TEdit','TComboBox','TRichEdit']);
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A05,['TEdit','TComboBox','TRichEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A05,['TEdit','TComboBox','TRichEdit']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_001.Enabled := True;
End;

procedure TF_A05.UpData;
begin
  D.F08.Locate('BEF08001;BEF08002;BEF08101', VarArrayOf([CB_001.Text,
                                                         SG01.Cells[0,SG01.Row],
                                                         SG02.Cells[0,SG02.Row]]), [loCaseInsensitive]);
        E_101.TEXT := D.F08.FieldByName('BEF08101').ASSTRING;
        E_102.TEXT := D.F08.FieldByName('BEF08102').ASSTRING;
  CB_103.ItemIndex := iif(D.F08.FieldByName('BEF08103').ASSTRING='0',0,1);
  CB_104.ItemIndex := KC_StrToInt(D.F08.FieldByName('BEF08104').ASSTRING);
  CB_105.ItemIndex := KC_StrToInt(D.F08.FieldByName('BEF08105').ASSTRING);
end;

procedure TF_A05.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F08.Delete;
  D.F08.ApplyUpdates(-1);
  SG02ini;
  SG02Snd;
  Updata;
end;

procedure TF_A05.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  case kind of
    0 : D.F08.Append;
    1 : D.F08.edit;
  end;

  D.F08.FieldByName('BEF08001').ASSTRING := CB_001.TEXT;
  D.F08.FieldByName('BEF08002').ASSTRING := SG01.Cells[0,SG01.Row];
  D.F08.FieldByName('BEF08101').ASSTRING := E_101.TEXT;
  D.F08.FieldByName('BEF08102').ASSTRING := E_102.TEXT;
  D.F08.FieldByName('BEF08103').ASSTRING := IntToStr(CB_103.ItemIndex);
  D.F08.FieldByName('BEF08104').ASSTRING := IntToStr(CB_104.ItemIndex);
  D.F08.FieldByName('BEF08105').ASSTRING := IntToStr(CB_105.ItemIndex);
  D.F08.ApplyUpdates(-1);
  D.OpenF08;
  SG02ini;
  SG02Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_A05.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF07;
  SG01ini;
  SG01Snd;
  D.OpenF08;
  SG02ini;
  SG02Snd;
  C_Kind(2);
  Updata;
end;

procedure TF_A05.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A05.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd;
  UpData;
end;

procedure TF_A05.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG02Snd;
  UpData;
end;

procedure TF_A05.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  Updata;
end;

procedure TF_A05.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Updata;
end;

procedure TF_A05.CB_001Change(Sender: TObject);
begin
  SG01ini;
  SG01Snd;
  SG02ini;
  SG02Snd;
  Updata;
  C_Kind(2);
end;

end.
