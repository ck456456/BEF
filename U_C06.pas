unit U_C06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, ComCtrls;

type
  TF_C06 = class(TForm)
    P_Main: TPanel;
    L_Kind: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    E_001: TEdit;
    E_099: TEdit;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Close: TBitBtn;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    Splitter1: TSplitter;
    Label3: TLabel;
    CB_002: TComboBox;
    E_007: TEdit;
    Label7: TLabel;
    E_003: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    E_004: TDateTimePicker;
    Label9: TLabel;
    CB_008: TComboBox;
    E_104: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    E_102: TEdit;
    E_103: TEdit;
    L_102: TLabel;
    SB_001: TSpeedButton;
    E_005: TDateTimePicker;
    CB_006: TComboBox;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    SG01: TStringGrid;
    Panel7: TPanel;
    Label8: TLabel;
    CB_Status: TComboBox;
    Splitter2: TSplitter;
    Panel8: TPanel;
    SG99: TStringGrid;
    Splitter3: TSplitter;
    SG02: TStringGrid;
    B_Select: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure CB_002Change(Sender: TObject);
    procedure CB_StatusChange(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure SB_001Click(Sender: TObject);
    procedure CB_008Change(Sender: TObject);
    procedure E_104Exit(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_SelectClick(Sender: TObject);
  private
    { Private declarations }
    Kind  : Byte;
    function  Get300(S1 : String) : String;
    function  PutL102 : String;
    function  GetF05(S1 : String) : integer;
    procedure OpenG19(S1 : String);
    procedure C_Kind(CC_Kind : Byte);
    procedure LoadTyp;
    procedure LoadPro(S1 : String);
    procedure LoadF25;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG99Ini;
    procedure SG99Snd(S1 : String);
    procedure UpData;
    procedure OpenF05(S1 : String);
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_C06: TF_C06;

implementation

uses U_D, U_KcPub, U_F, U_V01, U_V14;

{$R *.dfm}

procedure TF_C06.SG99Ini;
begin
  KC_SGClear(0,SG99);
  SG99.Cells[01,0] := 'A';
  SG99.Cells[02,0] := 'B';
  SG99.Cells[03,0] := 'C';
  SG99.Cells[04,0] := 'D';
  SG99.Cells[05,0] := 'NG';
  SG99.Cells[06,0] := '其他';
  SG99.Cells[07,0] := '合計';
  SG99.Cells[00,1] := 'm';
  SG99.Cells[00,2] := 'm2';
  SG99.Cells[00,3] := 'count';
  KC_ColAutoSize(SG99);
end;

procedure TF_C06.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := '狀態';
  SG02.Cells[01,0] := '棧板';
  SG02.Cells[02,0] := 'm';
  SG02.Cells[03,0] := 'm2';
  SG02.Cells[04,0] := '料號';
  SG02.Cells[05,0] := 'RunNo';
  KC_ColAutoSize(SG02);
end;

procedure TF_C06.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';        // BEF20101
  SG01.Cells[01,0] := '單號';       // BEF20001
  SG01.Cells[02,0] := '產品別';     // BEF20002
  SG01.Cells[03,0] := '成品料號';   // BEF20008
  SG01.Cells[04,0] := 'QTY';        // BEF20007
  SG01.Cells[05,0] := '工單號碼';   // BEF20003
  SG01.Cells[06,0] := '客戶';       // BEF20006
  SG01.Cells[07,0] := '預計出貨日'; // BEF20004
  SG01.Cells[08,0] := '實際完成日'; // BEF20005
  SG01.Cells[09,0] := 'Note';       // BEF20099
  KC_ColAutoSize(SG01);
end;

procedure TF_C06.SG99Snd(S1 : String);
var
  i,j : integer;
  FF  : Real;
  Ans : array[1..3, 1..6] of Real;
begin
  OpenF05(CB_002.TEXT);
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_008)) '+
                                            'Where BEF19101 = '''+'4'+
                                           ''' and BEF19008 = '''+S1+'''';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
  for i:=1 to 3 do
    for j:=1 to 6 do
      Ans[i,j] := 0.0;
  While not D.G19.eof do
  Begin
    j := 6;
    if (D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive])) Then
    Begin
      if ('A'  = D.F05.FieldByName('BEF05003').AsString) Then j := 1;
      if ('B'  = D.F05.FieldByName('BEF05003').AsString) Then j := 2;
      if ('C'  = D.F05.FieldByName('BEF05003').AsString) Then j := 3;
      if ('D'  = D.F05.FieldByName('BEF05003').AsString) Then j := 4;
      if ('NG' = D.F05.FieldByName('BEF05003').AsString) Then j := 5;
    End;
    Ans[1,j] := Ans[1,j]+D.G19.FieldByName('BEF19501').AsFloat;
    Ans[2,j] := Ans[2,j]+(D.G19.FieldByName('BEF19501').AsFloat*
                          D.G19.FieldByName('BEF19502').AsFloat/1000);
    Ans[3,j] := Ans[3,j]+1;
                                                     
    for i:=1 to 3 do
      for j:=1 to 6 do
        SG99.Cells[j,i] := iif(Ans[i,j]=0.0,'',format('%0.0f',[Ans[i,j]]));

    for i:=1 to 3 do
    Begin
      FF := 0;
      for j:=1 to 6 do FF := FF+Ans[i,j];
      SG99.Cells[7,i] := iif(FF=0.0,'',format('%0.0f',[FF]));
    End;
    D.G19.Next;
  End;
  KC_ColAutoSize(SG99);
End;

procedure TF_C06.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19008 = '''+S1+
                                         ''' Order by BEF19010, BEF19011';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
End;

procedure TF_C06.SG02Snd;
var
  i : integer;
  f1,f2 : Real;
begin
  i := 1;
  KC_SGClear(1,SG02);
  OpenG19(SG01.Cells[01,SG01.Row]);
  While not D.G19.Eof do
  Begin
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19501').ASString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19502').ASString);
    SG02.Cells[00,i] := F.Station(D.G19.FieldByName('BEF19101').ASString); // 狀態
    SG02.Cells[01,i] := D.G19.FieldByName('BEF19010').ASString;                     // '棧板';
    SG02.Cells[02,i] := D.G19.FieldByName('BEF19501').ASString;                     // 'm';
    SG02.Cells[03,i] := format('%0.0f',[f1*f2/1000]); // 'm2';
    SG02.Cells[04,i] := D.G19.FieldByName('BEF19003').ASString;
    SG02.Cells[05,i] := D.G19.FieldByName('BEF19001').ASString;
    SG02.Cells[00,i] := iif('已入庫'=SG02.Cells[00,i],'業務保留',SG02.Cells[00,i]);
    inc(i);
    D.G19.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
End;

procedure TF_C06.SG01Snd;
var
  SS : String;
  i : integer;
begin
  D.OpenF05;
  KC_SGClear(1,SG01);
  D.F20.First;
  i := 1;
  While not D.F20.Eof do
  Begin
    case CB_Status.ItemIndex of
      0 :;
      1 : if (D.F20.FieldByName('BEF20101').AsString <> '0') and
             (D.F20.FieldByName('BEF20101').AsString <> '1') Then
          Begin
            D.F20.Next;
            Continue;
          End;
      2 : if (D.F20.FieldByName('BEF20101').AsString <> '2') Then
          Begin
            D.F20.Next;
            Continue;
          End;
      3 : if (D.F20.FieldByName('BEF20101').AsString <> '3') Then
          Begin
            D.F20.Next;
            Continue;
          End;
    End;

    SS := '';
    if (D.F05.Locate('BEF05001',D.F20.FieldByName('BEF20008').AsString, [loCaseInsensitive])) Then
      SS:= D.F05.FieldByName('BEF05008').AsString;
    SG01.Cells[00,i] := F.Running00(D.F20.FieldByName('BEF20101').ASSTRING);
    SG01.Cells[01,i] :=       D.F20.FieldByName('BEF20001').AsString;
    SG01.Cells[02,i] :=       D.F20.FieldByName('BEF20002').AsString;
    SG01.Cells[03,i] :=       SS;
    SG01.Cells[04,i] :=       D.F20.FieldByName('BEF20007').AsString;
    SG01.Cells[05,i] :=       D.F20.FieldByName('BEF20003').AsString;
    SG01.Cells[06,i] :=       D.F20.FieldByName('BEF20006').AsString;
    SG01.Cells[07,i] :=       D.F20.FieldByName('BEF20004').AsString;
    SG01.Cells[08,i] :=       D.F20.FieldByName('BEF20005').AsString;
    SG01.Cells[09,i] :=       D.F20.FieldByName('BEF20099').AsString;
    inc(i);
    D.F20.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_C06.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
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

function  TF_C06.GetF05(S1 : String) : integer;
var
  i : integer;
begin
  Result := -1;
  for i:=0 to CB_008.Items.Count-1 do
    if (S1 = KC_GetSubStr(#255,CB_008.Items.Strings[i],1)) Then Result := i;
End;

procedure TF_C06.UpData;
begin
  if not D.F20.Locate('BEF20001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]) Then Exit;
  LoadPro(D.F20.FieldByName('BEF20002').ASSTRING);
  E_001.TEXT := D.F20.FieldByName('BEF20001').ASSTRING;
 CB_002.TEXT := D.F20.FieldByName('BEF20002').ASSTRING;
  E_003.TEXT := D.F20.FieldByName('BEF20003').ASSTRING;
  E_004.Date := KC_B2Day(D.F20.FieldByName('BEF20004').ASSTRING);
  E_005.Date := KC_B2Day(D.F20.FieldByName('BEF20005').ASSTRING);
 CB_006.TEXT := D.F20.FieldByName('BEF20006').ASSTRING;
  E_007.TEXT := D.F20.FieldByName('BEF20007').ASSTRING;
 CB_008.ItemIndex := GetF05(D.F20.FieldByName('BEF20008').ASSTRING);
  E_102.TEXT := D.F20.FieldByName('BEF20102').ASSTRING;
  E_103.TEXT := D.F20.FieldByName('BEF20103').ASSTRING;
  E_104.TEXT := D.F20.FieldByName('BEF20104').ASSTRING;
  E_099.TEXT := D.F20.FieldByName('BEF20099').ASSTRING;
  SG99Ini;
  SG99Snd(E_001.TEXT);
  SB_001Click(self);
end;

procedure TF_C06.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'Select * From BEFF05 Where BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
End;

procedure TF_C06.LoadF25;
begin
  D.OpenF25;
  CB_006.Clear;
  While not D.F25.Eof do
  Begin
    CB_006.Items.Add(D.F25.FieldByName('BEF25001').AsString);
    D.F25.Next;
  End;
End;

procedure TF_C06.LoadPro(S1 : String);
var
  SS : String;
begin
  D.OpenF05;
  CB_008.Clear;
  While not D.F05.Eof do
  Begin
    if (length(D.F05.FieldByName('BEF05001').AsString) <> 8) or
              (D.F05.FieldByName('BEF05002').AsString  <> S1) Then
    Begin
      D.F05.Next;
      Continue
    End;
    CB_008.Items.Add(D.F05.FieldByName('BEF05001').AsString+#255+
                     D.F05.FieldByName('BEF05008').AsString);
    D.F05.Next;
  End;
  CB_008.ItemIndex := iif(CB_008.Items.Count=0,-1,0);
  (*
  D.OpenF10S(S1);
  D.F10.First;
  CB_008.Clear;
  While not D.F10.Eof do
  Begin
    SS := D.F10.FieldByName('BEF10002').AsString;
    if (D.F05.Locate('BEF05001',SS, [loCaseInsensitive])) Then
      SS:= SS+#255+D.F05.FieldByName('BEF05008').AsString;
    CB_008.Items.Add(SS);
    D.F10.Next;
  End;
  CB_008.ItemIndex := iif(CB_008.Items.Count=0,-1,0);
  *)
End;

procedure TF_C06.LoadTyp;
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

procedure TF_C06.FormShow(Sender: TObject);
begin
  D.OpenF20;
  LoadF25;
  LoadTyp;
  SG01Ini;
  SG02Ini;
  SG99Ini;
  SG01Snd;
  SG02Snd;
  C_Kind(2);
  UpData;
end;

procedure TF_C06.CB_002Change(Sender: TObject);
begin
  LoadPro(CB_002.Text);
  SB_001Click(Sender);
end;

procedure TF_C06.CB_StatusChange(Sender: TObject);
begin
  SG01Snd;
  SG02Snd;
  C_Kind(2);
  UpData;
end;

procedure TF_C06.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG02Snd;
  UpData;
end;

procedure TF_C06.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd;
  UpData;
end;

procedure TF_C06.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F20.Locate('BEF20001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  D.F20.Delete;
  D.F20.ApplyUpdates(-1);
  D.OpenF20;
  SG01Snd;
  SG02Snd;
  Updata;
End;

procedure TF_C06.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  D.F20.Locate('BEF20001', VarArrayOf([SG01.Cells[1,SG01.Row]]), [loCaseInsensitive]);
  case kind of
    0 : D.F20.Append;
    1 : D.F20.edit;                                       
  end;
  D.F20.FieldByName('BEF20001').ASSTRING :=  E_001.TEXT;
  D.F20.FieldByName('BEF20002').ASSTRING := CB_002.TEXT;
  D.F20.FieldByName('BEF20003').ASSTRING :=  E_003.TEXT;
  D.F20.FieldByName('BEF20004').ASSTRING :=  KC_Data2B(E_004.Date);
  D.F20.FieldByName('BEF20005').ASSTRING :=  KC_Data2B(E_005.Date);
  D.F20.FieldByName('BEF20006').ASSTRING := CB_006.TEXT;
  D.F20.FieldByName('BEF20007').ASSTRING :=  E_007.TEXT;
  D.F20.FieldByName('BEF20008').ASSTRING := KC_GetSubStr(#255,CB_008.TEXT,1);
  D.F20.FieldByName('BEF20102').ASSTRING :=  E_102.TEXT;
  D.F20.FieldByName('BEF20103').ASSTRING :=  E_103.TEXT;
  D.F20.FieldByName('BEF20104').ASSTRING :=  E_104.TEXT;
  D.F20.FieldByName('BEF20099').ASSTRING :=  E_099.TEXT;
  D.F20.ApplyUpdates(-1);
  D.OpenF20;                                                                
  SG01ini;
  SG01Snd;
  SG02Snd;
  Updata;
  C_Kind(2);
End;

procedure TF_C06.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_C06.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C06.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    0 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 99;
          F_V01.PType    := CB_002.Text;
          F_V01.Working  := SG01.Cells[1,SG01.Row];
          F_V01.Running      := SG01.Cells[0,SG01.Row];
          F_V01.BDate    := KC_Data2B(E_004.Date)+'-'+KC_Data2B(E_005.Date);
          F_V01.ShowModal;
          F_V01.Free;
          D.OpenF20;
          SG01Snd;
          SG02Snd;
          Updata;
        End;
  end;
end;

function  TF_C06.Get300(S1 : String) : String;
begin
  Result := '';
  D.F05.First;
  While not D.F05.Eof do
  Begin
    if (POS(KC_GetSubStr(#255,CB_008.Text,1),D.F05.FieldByName('BEF05001').ASSTRING) = 0) or
                 (S1 <> D.F05.FieldByName('BEF05003').ASSTRING ) Then
    Begin
      D.F05.Next;
      Continue;
    End;
    Result := D.F05.FieldByName('BEF05008').ASSTRING+',';
    Break;
  End;
end;

function  TF_C06.PutL102 : String;
var
  i : integer;
begin
  i := 1;
  Result := '';
  OpenF05(CB_002.TEXT);
  While (KC_GetSubStr(',',E_104.Text,i) <> '') do
  Begin
    Result := Result+Get300(KC_GetSubStr(',',E_104.Text,i));
    inc(i);
  end;
  if (E_104.Text <> '') Then Exit;
  Result := Get300('A')+
            Get300('B')+
            Get300('C')+
            Get300('D')+
            Get300('NG');
end;

procedure TF_C06.SB_001Click(Sender: TObject);
begin
  L_102.Caption := PutL102;
end;

procedure TF_C06.CB_008Change(Sender: TObject);
begin
  SB_001Click(Sender);
end;

procedure TF_C06.E_104Exit(Sender: TObject);
begin
  SB_001Click(Sender);
end;

procedure TF_C06.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if ((ARow <> 0) and (ACol = 0)) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.StationToColor(Cells[ACol,ARow]);
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

procedure TF_C06.B_SelectClick(Sender: TObject);
begin
  F_V14 := TF_V14.Create(Application);
  try
    F_V14.E_001.Text := E_001.Text;
    F_V14.E_102.Text := E_102.Text;
    F_V14.E_103.Text := E_103.Text;
    F_V14.E_007.Text := E_007.Text;
    F_V14.E_008.Text :=CB_008.Text;
    F_V14.E_104.Text := L_102.Caption;
    F_V14.ShowModal;
  finally
    F_V14.Free;
  end;
  SG02Snd;
end;

end.


