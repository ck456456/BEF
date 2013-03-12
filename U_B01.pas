unit U_B01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ExtCtrls, DB, Menus;

type
  TF_B01 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    E_201: TEdit;
    E_203: TEdit;
    CB_002: TComboBox;
    E_001: TEdit;
    E_202: TEdit;
    E_204: TEdit;
    B_201: TButton;
    B_202: TButton;
    E_102: TEdit;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    CB_101: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    Label3: TLabel;
    E_103: TEdit;
    Label5: TLabel;
    E_003: TEdit;
    Label7: TLabel;
    E_004: TEdit;
    procedure FormShow(Sender: TObject);
    procedure B_201Click(Sender: TObject);
    procedure CB_101Change(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01DblClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure PNoLoad(CB :TComboBox);
    procedure OpenF05(S1 : String);
    procedure OpenF02(S1 : String);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF02;
    procedure SveF02;
  public
    { Public declarations }
  end;

var
  F_B01: TF_B01;

implementation

uses U_KcPub, U_D, U_F, U_V02;

{$R *.dfm}

procedure TF_B01.PNoLoad(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_B01.OpenF05(S1 : String);
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

procedure TF_B01.OpenF02(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF02 With (INDEX(BEFF02_101)) Where'+
            ' BEF02101 = '''+S1+''' Order by BEF02001';
  if (CB_101.ItemIndex=0) Then SQLStr := 'Select * From BEFF02 Order by BEF02001';
  KC_T3Close(D.F02,D.SC);
  D.F02.CommandText := SQLStr;
  KC_T3OPEN(D.F02,D.SC);
  D.F02.First;
end;

procedure TF_B01.SG01INI;
begin
  SG01.Cells[00,0] := 'Running';
  SG01.Cells[01,0] := 'No';
  SG01.Cells[02,0] := 'Type';
  SG01.Cells[03,0] := '�e�T';
  SG01.Cells[04,0] := '�p��';
  SG01.Cells[05,0] := '�Ѿl�ؤo';
  SG01.Cells[06,0] := '��l�ؤo';
  SG01.Cells[07,0] := '�w�ϥΤؤo';
  SG01.Cells[08,0] := '�J�ܮɶ�';
  SG01.Cells[09,0] := '���ܮɶ�';
  SG01.Cells[10,0] := '�J�ܻ���';
  SG01.Cells[11,0] := '���ܻ���';
end;

procedure TF_B01.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F02.First;
  While not D.F02.Eof do
  Begin
    SG01.Cells[00,i] := F.Running00(D.F02.FieldByName('BEF02101').AsString);
    SG01.Cells[01,i] := D.F02.FieldByName('BEF02001').ASString;
    SG01.Cells[02,i] := D.F02.FieldByName('BEF02002').ASString;
    SG01.Cells[03,i] := D.F02.FieldByName('BEF02003').ASString;
    SG01.Cells[04,i] := D.F02.FieldByName('BEF02004').ASString;
    SG01.Cells[05,i] := FloatToStr(D.F02.FieldByName('BEF02102').ASFloat-
                                  D.F02.FieldByName('BEF02103').ASFloat);
    SG01.Cells[06,i] := D.F02.FieldByName('BEF02102').ASString;
    SG01.Cells[07,i] := D.F02.FieldByName('BEF02103').ASString;
    SG01.Cells[08,i] := D.F02.FieldByName('BEF02201').ASString;
    SG01.Cells[09,i] := D.F02.FieldByName('BEF02202').ASString;
    SG01.Cells[10,i] := D.F02.FieldByName('BEF02203').ASString;
    SG01.Cells[11,i] := D.F02.FieldByName('BEF02204').ASString;
    inc(i);
    D.F02.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B01.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_B01,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B01,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B01,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_101.Enabled := true;
end;

procedure TF_B01.Updata;
begin
  D.F02.Locate('BEF02001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F02.FieldByName('BEF02001').ASString;
 CB_002.Text := D.F02.FieldByName('BEF02002').ASString;
  E_003.Text := D.F02.FieldByName('BEF02003').ASString;
  E_004.Text := D.F02.FieldByName('BEF02004').ASString;
  E_102.Text := D.F02.FieldByName('BEF02102').ASString;
  E_103.Text := D.F02.FieldByName('BEF02103').ASString;
  E_201.Text := D.F02.FieldByName('BEF02201').ASString;
  E_202.Text := D.F02.FieldByName('BEF02202').ASString;
  E_203.Text := D.F02.FieldByName('BEF02203').ASString;
  E_204.Text := D.F02.FieldByName('BEF02204').ASString;
end;

procedure TF_B01.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF00;
  OpenF05(D.F00.FieldByName('BEF00201').ASString);
  PNoLoad(CB_002);
  OpenF02(KC_GetSubStr('.',CB_101.Text,1));
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B01.B_201Click(Sender: TObject);
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  if (TControl(Sender).Name = 'B_201') Then E_201.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  if (TControl(Sender).Name = 'B_202') Then E_202.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
end;

procedure TF_B01.CB_101Change(Sender: TObject);
begin
  OpenF02(KC_GetSubStr('.',CB_101.Text,1));
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B01.DelF02;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F02.Delete;
  D.F02.ApplyUpdates(-1);
  OpenF02(KC_GetSubStr('.',CB_101.Text,1));
  SG01Snd;
  UpData;
  C_Kind(2);
end;

procedure TF_B01.SveF02;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : Begin
         D.F02.Append;
         D.F02.FieldByName('BEF02301').ASString :=  F.Pass_Man;
         D.F02.FieldByName('BEF02302').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
       End;
   1 : D.F02.edit;
  End;
  D.F02.FieldByName('BEF02001').ASString :=  E_001.Text;
  D.F02.FieldByName('BEF02002').ASString := CB_002.Text;
  D.F02.FieldByName('BEF02003').ASString :=  E_003.Text;
  D.F02.FieldByName('BEF02004').ASString :=  E_004.Text;
  D.F02.FieldByName('BEF02102').ASString :=  E_102.Text;
  D.F02.FieldByName('BEF02103').ASString :=  E_103.Text;
  D.F02.FieldByName('BEF02201').ASString :=  E_201.Text;
  D.F02.FieldByName('BEF02202').ASString :=  E_202.Text;
  D.F02.FieldByName('BEF02203').ASString :=  E_203.Text;
  D.F02.FieldByName('BEF02204').ASString :=  E_204.Text;
  D.F02.FieldByName('BEF02303').ASString :=  F.Pass_Man;
  D.F02.FieldByName('BEF02304').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  D.F02.ApplyUpdates(-1);
  OpenF02(KC_GetSubStr('.',CB_101.Text,1));
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B01.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF02;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF02;
end;

procedure TF_B01.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_B01.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

procedure TF_B01.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V02         := TF_V02.Create(Application);
          F_V02.Running     := SG01.Cells[0,SG01.Row];
          F_V02.No      := SG01.Cells[1,SG01.Row];
          F_V02.SType   := SG01.Cells[2,SG01.Row];
          F_V02.iType   := 1;
          F_V02.ShowModal;
          F_V02.Free;
          OpenF02(KC_GetSubStr('.',CB_101.Text,1));
          SG01INI;
          SG01Snd;
          Updata;
          C_Kind(2);
        End;
  end;
end;

procedure TF_B01.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

end.

