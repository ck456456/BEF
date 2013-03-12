unit U_B05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Buttons, StdCtrls, ExtCtrls, DB;

type
  TF_B05 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    E_201: TEdit;
    E_203: TEdit;
    CB_002: TComboBox;
    E_001: TEdit;
    E_202: TEdit;
    E_204: TEdit;
    B_201: TButton;
    B_202: TButton;
    E_102: TEdit;
    E_103: TEdit;
    Panel4: TPanel;
    Label2: TLabel;
    CB_101: TComboBox;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel6: TPanel;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure B_201Click(Sender: TObject);
    procedure CB_101Change(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure PNoLoad(CB :TComboBox);
    procedure OpenF05(S1 : String);
    procedure OpenF14(S1 : String);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF14;
    procedure SveF14;
  public
    { Public declarations }
  end;

var
  F_B05: TF_B05;

implementation

uses U_KcPub, U_D, U_F, U_V02;

{$R *.dfm}

procedure TF_B05.PNoLoad(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_B05.OpenF05(S1 : String);
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

procedure TF_B05.OpenF14(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF14 With (INDEX(BEFF14_101)) Where'+
            ' BEF14101 = '''+S1+''' Order by BEF14001';
  if (CB_101.ItemIndex=0) Then SQLStr := 'Select * From BEFF14 Order by BEF14001';
  KC_T3Close(D.F14,D.SC);
  D.F14.CommandText := SQLStr;
  KC_T3OPEN(D.F14,D.SC);
  D.F14.First;
end;

procedure TF_B05.SG01INI;
begin
  SG01.Cells[0,0] := 'Running';
  SG01.Cells[1,0] := 'No';
  SG01.Cells[2,0] := 'Type';
  SG01.Cells[3,0] := '�Ѿl�ؤo';
  SG01.Cells[4,0] := '��l�ؤo';
  SG01.Cells[5,0] := '�w�ϥΤؤo';
  SG01.Cells[6,0] := '�J�ܮɶ�';
  SG01.Cells[7,0] := '���ܮɶ�';
  SG01.Cells[8,0] := '�J�ܻ���';
  SG01.Cells[9,0] := '���ܻ���';
end;

procedure TF_B05.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F14.First;
  While not D.F14.Eof do
  Begin
    SG01.Cells[0,i] := F.Running00(D.F14.FieldByName('BEF14101').AsString);
    SG01.Cells[1,i] := D.F14.FieldByName('BEF14001').ASString;
    SG01.Cells[2,i] := D.F14.FieldByName('BEF14002').ASString;
    SG01.Cells[3,i] := FloatToStr(D.F14.FieldByName('BEF14102').ASFloat-
                                  D.F14.FieldByName('BEF14103').ASFloat);
    SG01.Cells[4,i] := D.F14.FieldByName('BEF14102').ASString;
    SG01.Cells[5,i] := D.F14.FieldByName('BEF14103').ASString;
    SG01.Cells[6,i] := D.F14.FieldByName('BEF14201').ASString;
    SG01.Cells[7,i] := D.F14.FieldByName('BEF14202').ASString;
    SG01.Cells[8,i] := D.F14.FieldByName('BEF14203').ASString;
    SG01.Cells[9,i] := D.F14.FieldByName('BEF14204').ASString;
    inc(i);
    D.F14.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B05.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_B05,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B05,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B05,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
    CB_101.Enabled := true;
end;

procedure TF_B05.Updata;
begin
  D.F14.Locate('BEF14001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F14.FieldByName('BEF14001').ASString;
 CB_002.Text := D.F14.FieldByName('BEF14002').ASString;
  E_102.Text := D.F14.FieldByName('BEF14102').ASString;
  E_103.Text := D.F14.FieldByName('BEF14103').ASString;
  E_201.Text := D.F14.FieldByName('BEF14201').ASString;
  E_202.Text := D.F14.FieldByName('BEF14202').ASString;
  E_203.Text := D.F14.FieldByName('BEF14203').ASString;
  E_204.Text := D.F14.FieldByName('BEF14204').ASString;
end;

procedure TF_B05.DelF14;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F14.Delete;
  D.F14.ApplyUpdates(-1);
  OpenF14(KC_GetSubStr('.',CB_101.Text,1));
  SG01Snd;
  UpData;
  C_Kind(2);
end;

procedure TF_B05.SveF14;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : Begin
         D.F14.Append;
         D.F14.FieldByName('BEF14301').ASString :=  F.Pass_Man;
         D.F14.FieldByName('BEF14302').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
       End;
   1 : D.F14.edit;
  End;
  D.F14.FieldByName('BEF14001').ASString :=  E_001.Text;
  D.F14.FieldByName('BEF14002').ASString := CB_002.Text;
  D.F14.FieldByName('BEF14102').ASFloat  :=  KC_StrToFloat(E_102.Text);
  D.F14.FieldByName('BEF14103').ASFloat  :=  KC_StrToFloat(E_103.Text);
  D.F14.FieldByName('BEF14201').ASString :=  E_201.Text;
  D.F14.FieldByName('BEF14202').ASString :=  E_202.Text;
  D.F14.FieldByName('BEF14203').ASString :=  E_203.Text;
  D.F14.FieldByName('BEF14204').ASString :=  E_204.Text;
  D.F14.FieldByName('BEF14303').ASString :=  F.Pass_Man;
  D.F14.FieldByName('BEF14304').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  D.F14.ApplyUpdates(-1);
  OpenF14(KC_GetSubStr('.',CB_101.Text,1));
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B05.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF00;
  OpenF05(D.F00.FieldByName('BEF00205').ASString);
  PNoLoad(CB_002);
  OpenF14(KC_GetSubStr('.',CB_101.Text,1));
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B05.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF14;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF14;

end;

procedure TF_B05.B_201Click(Sender: TObject);
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  if (TControl(Sender).Name = 'B_201') Then E_201.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  if (TControl(Sender).Name = 'B_202') Then E_202.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
end;

procedure TF_B05.CB_101Change(Sender: TObject);
begin
  OpenF14(KC_GetSubStr('.',CB_101.Text,1));
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B05.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_B05.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_B05.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

procedure TF_B05.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V02         := TF_V02.Create(Application);
          F_V02.Running     := SG01.Cells[0,SG01.Row];
          F_V02.No      := SG01.Cells[1,SG01.Row];
          F_V02.SType   := SG01.Cells[2,SG01.Row];
          F_V02.iType   := 5;
          F_V02.ShowModal;
          F_V02.Free;
          OpenF14(KC_GetSubStr('.',CB_101.Text,1));
          SG01INI;
          SG01Snd;
          Updata;
          C_Kind(2);
        End;
  end;
end;

end.
