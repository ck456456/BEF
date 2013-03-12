unit U_B02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, StdCtrls, ExtCtrls, DB;

type
  TF_B02 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    E_201: TEdit;
    E_203: TEdit;
    CB_002: TComboBox;
    E_001: TEdit;
    E_202: TEdit;
    E_204: TEdit;
    B_201: TButton;
    B_202: TButton;
    Panel4: TPanel;
    Label2: TLabel;
    CB_101: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Label3: TLabel;
    CB_003: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_201Click(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure CB_101Change(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure LoadF21;
    procedure PNoLoad(CB :TComboBox);
    procedure OpenF05(S1 : String);
    procedure SG01INI;
    procedure SG01Snd;
    procedure Updata;
    procedure DelF04;
    procedure SveF04;
  public
    { Public declarations }
  end;

var
  F_B02: TF_B02;

implementation

uses U_D, U_KcPub, U_F, U_V02;

{$R *.dfm}

procedure TF_B02.LoadF21;
begin
  CB_003.Items.Clear;
  D.F21.First;
  While not D.F21.Eof do
  Begin
    CB_003.Items.Add(D.F21.FieldByName('BEF21001').AsString);
    D.F21.Next;
  End;
  CB_003.ItemIndex := iif(CB_003.Items.Count=0,-1,0);
end;

procedure TF_B02.PNoLoad(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_B02.SG01INI;
begin
  SG01.Cells[0,0] := 'Running';
  SG01.Cells[1,0] := 'No';
  SG01.Cells[2,0] := '廠區';
  SG01.Cells[3,0] := 'Type';
  SG01.Cells[4,0] := '入倉時間';
  SG01.Cells[5,0] := '離倉時間';
  SG01.Cells[6,0] := '入倉說明';
  SG01.Cells[7,0] := '離倉說明';
end;

procedure TF_B02.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F04.First;
  While not D.F04.Eof do
  Begin
    if ((CB_101.ItemIndex <> 0) and
        (D.F04.FieldByName('BEF04101').AsString <> KC_GetSubStr('.',CB_101.Text,1)))Then
    Begin
      D.F04.Next;
      Continue;
    End;
    SG01.Cells[0,i] := F.Running00(D.F04.FieldByName('BEF04101').AsString);
    SG01.Cells[1,i] := D.F04.FieldByName('BEF04001').ASString;
    SG01.Cells[2,i] := D.F04.FieldByName('BEF04003').ASString;
    SG01.Cells[3,i] := D.F04.FieldByName('BEF04002').ASString;
    SG01.Cells[4,i] := D.F04.FieldByName('BEF04201').ASString;
    SG01.Cells[5,i] := D.F04.FieldByName('BEF04202').ASString;
    SG01.Cells[6,i] := D.F04.FieldByName('BEF04203').ASString;
    SG01.Cells[7,i] := D.F04.FieldByName('BEF04204').ASString;
    inc(i);
    D.F04.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B02.C_Kind(CC_Kind : Byte);
begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          TbStpEdit(True,F_B02,['TEdit','TComboBox','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B02,['TEdit','TComboBox','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B02,['TEdit','TComboBox','TCheckBox']);
          SB_Inquire.Down := True;
        End;
  End;
  CB_101.Enabled := true;
end;

procedure TF_B02.Updata;
begin
  D.F04.Locate('BEF04001',SG01.Cells[1,SG01.Row], [loCaseInsensitive]);
  E_001.Text := D.F04.FieldByName('BEF04001').ASString;
 CB_002.Text := D.F04.FieldByName('BEF04002').ASString;
 CB_003.Text := D.F04.FieldByName('BEF04003').ASString;
  E_201.Text := D.F04.FieldByName('BEF04201').ASString;
  E_202.Text := D.F04.FieldByName('BEF04202').ASString;
  E_203.Text := D.F04.FieldByName('BEF04203').ASString;
  E_204.Text := D.F04.FieldByName('BEF04204').ASString;
end;

procedure TF_B02.OpenF05(S1 : String);
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

procedure TF_B02.FormShow(Sender: TObject);
begin
  B_Save  .Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  D.OpenF00;
  OpenF05(D.F00.FieldByName('BEF00203').ASString);
  D.OpenF21;
  LoadF21;
  PNoLoad(CB_002);
  D.OpenF04;
  SG01INI;
  SG01Snd;
  Updata;
  C_Kind(2);
end;

procedure TF_B02.DelF04;
begin
  if not (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;

  D.F04.Delete;
  D.F04.ApplyUpdates(-1);
  D.OpenF04;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B02.SveF04;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case kind of
   0 : Begin
         D.F04.Append;
         D.F04.FieldByName('BEF04301').ASString :=  F.Pass_Man;
         D.F04.FieldByName('BEF04302').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
       End;
   1 : D.F04.edit;
  End;
  D.F04.FieldByName('BEF04001').ASString :=  E_001.Text;
  D.F04.FieldByName('BEF04002').ASString := CB_002.Text;
  D.F04.FieldByName('BEF04003').ASString := CB_003.Text;
  D.F04.FieldByName('BEF04201').ASString :=  E_201.Text;
  D.F04.FieldByName('BEF04202').ASString :=  E_202.Text;
  D.F04.FieldByName('BEF04203').ASString :=  E_203.Text;
  D.F04.FieldByName('BEF04204').ASString :=  E_204.Text;
  D.F04.FieldByName('BEF04303').ASString :=  F.Pass_Man;
  D.F04.FieldByName('BEF04304').ASString :=  FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  D.F04.ApplyUpdates(-1);
  D.OpenF04;
  SG01Snd;
  UpData;
  C_Kind(2)
end;

procedure TF_B02.B_201Click(Sender: TObject);
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  if (TControl(Sender).Name = 'B_201') Then E_201.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
  if (TControl(Sender).Name = 'B_202') Then E_202.Text := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime);
end;

procedure TF_B02.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF04;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF04;
end;

procedure TF_B02.CB_101Change(Sender: TObject);
begin
  SG01Snd;
  Updata;
end;

procedure TF_B02.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_B02.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
end;

procedure TF_B02.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_B02.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V02 := TF_V02.Create(Application);
          F_V02.Running := SG01.Cells[0,SG01.Row];
          F_V02.No      := SG01.Cells[1,SG01.Row];
          F_V02.SType   := SG01.Cells[2,SG01.Row];
          F_V02.iType   := 2;
          F_V02.ShowModal;
          F_V02.Free;
          D.OpenF04;
          SG01INI;
          SG01Snd;
          Updata;
          C_Kind(2);
        End;
  end;
end;

end.



