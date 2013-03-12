unit U_C01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TF_C01 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    Splitter2: TSplitter;
    Panel6: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    E_001: TEdit;
    E_099: TEdit;
    E_201: TEdit;
    E_202: TEdit;
    CB_004: TComboBox;
    Panel1: TPanel;
    Label8: TLabel;
    CB_Status: TComboBox;
    Label1: TLabel;
    CB_002: TComboBox;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    L_Kind: TLabel;
    Label9: TLabel;
    CB_005: TComboBox;
    Panel4: TPanel;
    SG01: TStringGrid;
    CB_006: TComboBox;
    Label3: TLabel;
    L_301: TLabel;
    L_302: TLabel;
    L_303: TLabel;
    L_304: TLabel;
    L_305: TLabel;
    E_301: TEdit;
    E_302: TEdit;
    E_303: TEdit;
    E_304: TEdit;
    E_305: TEdit;
    procedure FormShow(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure CB_StatusChange(Sender: TObject);
    procedure CB_002Change(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CB_004Change(Sender: TObject);
  private
    { Private declarations }
    Kind  : Byte;
    function  Get300(S1 : String) : String;
    procedure OpenF05(S1 : String);
    procedure LoadPro(S1 : String);
    procedure C_Kind(CC_Kind : Byte);
    procedure LoadTyp;
    procedure LoadLne(S1 : String);
    procedure SG01Ini;
    procedure SG01Snd;
    procedure UpData;
    procedure F_Del;
    procedure F_Save;
    procedure SaveF27; overload;
    procedure SaveF27(S1,S2 : String); overload;
  public
    { Public declarations }
  end;

var
  F_C01: TF_C01;

implementation

uses U_D, U_KcPub, U_F, U_V01;

{$R *.dfm}

procedure TF_C01.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'Select * From BEFF05 Where BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

function  TF_C01.Get300(S1 : String) : String;
begin
  Result := S1+'(nil) : ';
  D.F05.First;
  While not D.F05.Eof do
  Begin
    if (POS(CB_004.Text,D.F05.FieldByName('BEF05001').ASSTRING) = 0) or
                 (S1 <> D.F05.FieldByName('BEF05003').ASSTRING ) Then
    Begin
      D.F05.Next;
      Continue;
    End;
    Result := D.F05.FieldByName('BEF05008').ASSTRING+' : ';
    Break;
  End;
end;

procedure TF_C01.LoadPro(S1 : String);
begin
  D.OpenF10S(S1);
  D.F10.First;
  CB_004.Clear;
  While not D.F10.Eof do
  Begin
    CB_004.Items.Add(D.F10.FieldByName('BEF10002').AsString);
    D.F10.Next;
  End;
  CB_004.ItemIndex := iif(CB_004.Items.Count=0,-1,0);
end;

procedure TF_C01.LoadLne(S1 : String);
begin
  D.OpenF12(S1);
  D.F12.First;
  CB_005.Clear;
  While not D.F12.Eof do
  Begin
    CB_005.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB_005.ItemIndex := iif(CB_005.Items.Count=0,-1,0);
End;

procedure TF_C01.LoadTyp;
begin
  D.OpenF01('T');
  D.F01.First;
  CB_002.Clear;
  While not D.F01.Eof do
  Begin
    CB_002.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB_002.ItemIndex := iif(CB_002.Items.Count=0,-1,0);
end;

procedure TF_C01.UpData;
begin
  D.F15.Locate('BEF15001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  E_001.TEXT := D.F15.FieldByName('BEF15001').ASSTRING;
 CB_004.TEXT := D.F15.FieldByName('BEF15004').ASSTRING;
  E_201.TEXT := D.F15.FieldByName('BEF15201').ASSTRING;
  E_202.TEXT := D.F15.FieldByName('BEF15202').ASSTRING;
  E_301.TEXT := D.F15.FieldByName('BEF15301').ASSTRING;
  E_302.TEXT := D.F15.FieldByName('BEF15302').ASSTRING;
  E_303.TEXT := D.F15.FieldByName('BEF15303').ASSTRING;
  E_304.TEXT := D.F15.FieldByName('BEF15304').ASSTRING;
  E_305.TEXT := D.F15.FieldByName('BEF15305').ASSTRING;
  E_099.TEXT := D.F15.FieldByName('BEF15099').ASSTRING;
  OpenF05(CB_002.TEXT);
  L_301.Caption := Get300('A');
  L_302.Caption := Get300('B');
  L_303.Caption := Get300('C');
  L_304.Caption := Get300('D');
  L_305.Caption := Get300('NG');
end;

procedure TF_C01.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '站別';        //*BEF15006    A(24)
  SG01.Cells[01,0] := 'Working No';  //*BEF15001    A(24)
  SG01.Cells[02,0] := '生產目標料號';// BEF15002    A(12)
  SG01.Cells[03,0] := 'Process';     // BEF15004    A(20)
  SG01.Cells[04,0] := 'Running';     // BEF15101    A(01)
  SG01.Cells[05,0] := '成型站';      // BEF15102    A(01)
  SG01.Cells[06,0] := '褙膜站';      // BEF15103    A(01)
  SG01.Cells[07,0] := '庫房站';      // BEF15104    A(01)
  SG01.Cells[08,0] := 'Begin  Date'; // BEF15201    A(08)
  SG01.Cells[09,0] := 'Finish Date'; // BEF15202    A(08)
  SG01.Cells[10,0] := 'Note';        // BEF15099    A(64)
  KC_ColAutoSize(SG01);
end;

procedure TF_C01.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F15.First;
  i := 1;
  While not D.F15.Eof do
  Begin
    case CB_Status.ItemIndex of
      0 :;
      1 : if (D.F15.FieldByName('BEF15101').AsString <> '0') and
             (D.F15.FieldByName('BEF15101').AsString <> '1') Then
          Begin
            D.F15.Next;
            Continue;
          End;
      2 : if (D.F15.FieldByName('BEF15101').AsString <> '2') Then
          Begin
            D.F15.Next;
            Continue;
          End;
      3 : if (D.F15.FieldByName('BEF15101').AsString <> '3') Then
          Begin
            D.F15.Next;
            Continue;
          End;
    End;

    if (D.F15.FieldByName('BEF15002').AsString <> CB_002.Text) Then
    Begin
      D.F15.Next;
      Continue;
    End;

    if((CB_006.ItemIndex <> 0) and
       (D.F15.FieldByName('BEF15006').AsString <> 'all') and
       (D.F15.FieldByName('BEF15006').AsString <> CB_006.Text))Then
    Begin
      D.F15.Next;
      Continue;
    End;

    SG01.Cells[00,i] :=       D.F15.FieldByName('BEF15006').AsString;
    SG01.Cells[01,i] :=       D.F15.FieldByName('BEF15001').AsString;
    SG01.Cells[02,i] :=       D.F15.FieldByName('BEF15002').AsString;
    SG01.Cells[03,i] :=       D.F15.FieldByName('BEF15004').AsString;
    SG01.Cells[04,i] := F.Running00(D.F15.FieldByName('BEF15101').ASSTRING);
    SG01.Cells[05,i] := F.Running00(D.F15.FieldByName('BEF15102').ASSTRING);
    SG01.Cells[06,i] := F.Running00(D.F15.FieldByName('BEF15103').ASSTRING);
    SG01.Cells[07,i] := F.Running00(D.F15.FieldByName('BEF15104').ASSTRING);
    SG01.Cells[08,i] :=       D.F15.FieldByName('BEF15201').AsString;
    SG01.Cells[09,i] :=       D.F15.FieldByName('BEF15202').AsString;
    SG01.Cells[10,i] :=       D.F15.FieldByName('BEF15099').AsString;
    inc(i);
    D.F15.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_C01.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          SB_Append.Down := True;
        end;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_C01.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F15.Locate('BEF15001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  D.F15.Delete;
  D.F15.ApplyUpdates(-1);
  D.OpenF15;
  SG01Snd;
  Updata;
End;

procedure TF_C01.SaveF27(S1,S2 : String);
var
  SQL : String;
begin
  if (''=S2) then Exit;
  if (''=KC_GetSubStr(':',S1,1)) then Exit;
  if (0<>POS('nil',KC_GetSubStr(':',S1,1))) then Exit;
  SQL := 'INSERT INTO BEFF27 (BEF27001,BEF27002,BEF27003)'+
                   ' VALUES ('''+E_001.Text+
                             ''','''+S2+
                             ''','''+Trim(KC_GetSubStr(':',S1,1))+
                             ''')';
  KC_T2ExecSQL(SQL,D.FCmd);
End;

procedure TF_C01.SaveF27;
var
  SQL : String;
begin
  SQL := 'Delete BEFF27 Where BEF27001 = '''+E_001.Text+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  SaveF27(L_301.Caption,E_301.Text);
  SaveF27(L_302.Caption,E_302.Text);
  SaveF27(L_303.Caption,E_303.Text);
  SaveF27(L_304.Caption,E_304.Text);
  SaveF27(L_305.Caption,E_305.Text);
End;

procedure TF_C01.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  D.F15.Locate('BEF15001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.F15.Append;
    1 : D.F15.edit;
  end;

  D.F15.FieldByName('BEF15001').ASSTRING :=  E_001.TEXT;
  D.F15.FieldByName('BEF15002').ASSTRING := CB_002.TEXT;
  D.F15.FieldByName('BEF15003').ASSTRING := CB_002.TEXT;
  D.F15.FieldByName('BEF15004').ASSTRING := CB_004.TEXT;
  D.F15.FieldByName('BEF15005').ASSTRING := CB_005.TEXT;
  D.F15.FieldByName('BEF15006').ASSTRING := CB_006.TEXT;
  D.F15.FieldByName('BEF15201').ASSTRING :=  E_201.TEXT;
  D.F15.FieldByName('BEF15202').ASSTRING :=  E_202.TEXT;
  D.F15.FieldByName('BEF15301').ASSTRING :=  E_301.TEXT;              
  D.F15.FieldByName('BEF15302').ASSTRING :=  E_302.TEXT;
  D.F15.FieldByName('BEF15303').ASSTRING :=  E_303.TEXT;
  D.F15.FieldByName('BEF15304').ASSTRING :=  E_304.TEXT;
  D.F15.FieldByName('BEF15305').ASSTRING :=  E_305.TEXT;
  D.F15.FieldByName('BEF15099').ASSTRING :=  E_099.TEXT;
  D.F15.ApplyUpdates(-1);
  SaveF27;
  D.OpenF15;
  SG01ini;
  SG01Snd;
  Updata;
  C_Kind(2);
End;

procedure TF_C01.FormShow(Sender: TObject);
begin
  D.OpenF15;
  LoadLne('成型站');
  LoadTyp;
  SG01Ini;
  SG01Snd;
  C_Kind(2);
  UpData;
end;

procedure TF_C01.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_C01.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C01.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    4 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 0;
          F_V01.PType    := CB_002.Text;
          F_V01.Working  := SG01.Cells[1,SG01.Row];
          F_V01.Running      := SG01.Cells[4,SG01.Row];
          F_V01.BDate    := E_201.Text+'-'+E_202.Text;
          F_V01.ShowModal;
          F_V01.Free;
          D.OpenF15;
          SG01Snd;
          Updata;
        End;
  end;
end;

procedure TF_C01.CB_StatusChange(Sender: TObject);
begin
  SG01Snd;
  Updata;
end;

procedure TF_C01.CB_002Change(Sender: TObject);
begin
  LoadPro(CB_002.Text);
  SG01Snd;
  Updata;
end;

procedure TF_C01.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Updata;
end;

procedure TF_C01.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
end;

procedure TF_C01.CB_004Change(Sender: TObject);
begin
  OpenF05(CB_002.TEXT);
  L_301.Caption := Get300('A');
  L_302.Caption := Get300('B');
  L_303.Caption := Get300('C');
  L_304.Caption := Get300('D');
  L_305.Caption := Get300('NG');
end;

end.

