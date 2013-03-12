unit U_C02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, DB;

type
  TF_C02 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel9: TPanel;
    Label3: TLabel;
    CB_Lin: TComboBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    B_B03: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    B_B01: TButton;
    Panel5: TPanel;
    CB_101: TComboBox;
    B_B02: TButton;
    Panel14: TPanel;
    SG03: TStringGrid;
    Panel8: TPanel;
    PC01: TPageControl;
    TS01: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    SG01: TStringGrid;
    TS02: TTabSheet;
    Panel12: TPanel;
    Panel13: TPanel;
    Splitter2: TSplitter;
    SG02: TStringGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    SG04: TStringGrid;
    CB000: TComboBox;
    E_Run: TEdit;
    B_Find: TButton;
    procedure FormShow(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_B01Click(Sender: TObject);
    procedure B_B02Click(Sender: TObject);
    procedure SG04DblClick(Sender: TObject);
    procedure SG02DblClick(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CB000Change(Sender: TObject);
    procedure CB_LinChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_FindClick(Sender: TObject);
  private
    { Private declarations }
    SL03 : TStringList;  // Data
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG04INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG04Snd;
    procedure OpenF11(S1 : String);
    procedure OpenF15;
    procedure OpenF16(S1 : String);
    procedure LoadLne(S1 : String);
    Function  GoEvt(I1 : Integer) : Boolean;
    Function  GoRun(I1 : Integer;Run : String) : Boolean;
    Function  ChkIdle(I1 : Integer) : Boolean;
    procedure AppIdle;
    procedure DelIdle;
  public
    { Public declarations }
  end;

var
  F_C02: TF_C02;

implementation

uses U_D, U_KcPub, U_F, U_V01, U_V04, U_V03;

{$R *.dfm}

procedure TF_C02.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No';
  SG01.Cells[1,0] := 'Events';
  KC_ColAutoSize(SG01);
end;

procedure TF_C02.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Working No';  //*BEF15001    A(24)
  SG02.Cells[01,0] := '目標料號';    // BEF15002    A(12)
  SG02.Cells[02,0] := 'Process';     // BEF15004    A(20)
  SG02.Cells[03,0] := 'Running';     // BEF15101    A(01)
  SG02.Cells[04,0] := '成型站';      // BEF15102    A(01)
  SG02.Cells[05,0] := '褙膜站';      // BEF15103    A(01)
  SG02.Cells[06,0] := '庫房站';      // BEF15104    A(01)
  SG02.Cells[07,0] := 'Begin  Date'; // BEF15201    A(08)
  SG02.Cells[08,0] := 'Finish Date'; // BEF15202    A(08)
  SG02.Cells[09,0] := 'Note';        // BEF15099    A(64)
  KC_ColAutoSize(SG02);
end;

procedure TF_C02.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[0,0] := 'Type';
  SG03.Cells[1,0] := 'No';
  SG03.Cells[2,0] := 'Hr';
  SG03.Cells[3,0] := 'Name';
  SG03.Cells[4,0] := 'Note';
  KC_ColAutoSize(SG03);
end;

procedure TF_C02.SG04INI;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[00,0] := 'Running';  // BEF16101
  SG04.Cells[01,0] := 'Run';  // BEF16001
  SG04.Cells[02,0] := '級別'; // BEF16308
  SG04.Cells[03,0] := '寬幅'; // BEF16304
  SG04.Cells[04,0] := '使用'; // BEF16302
  SG04.Cells[05,0] := '收料'; // BEF16303
  SG04.Cells[06,0] := '損耗'; // BEF16306
  SG04.Cells[07,0] := '未褙'; // BEF16306
  SG04.Cells[08,0] := '首檢良率'; //
  SG04.Cells[09,0] := '尾檢良率'; //
  SG04.Cells[10,0] := 'QANot'; //
  KC_ColAutoSize(SG04);
end;

procedure TF_C02.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F11.First;
  While not D.F11.Eof do
  Begin
    SG01.Cells[0,i] := D.F11.FieldByName('BEF11001').ASString;
    SG01.Cells[1,i] := D.F11.FieldByName('BEF11002').ASString;
    inc(i);
    D.F11.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_C02.LoadLne(S1 : String);
begin
  D.OpenF12(S1);
  D.F12.First;
  CB_Lin.Clear;
  While not D.F12.Eof do
  Begin
    CB_Lin.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB_Lin.ItemIndex := iif(CB_Lin.Items.Count=0,-1,0);
end;

procedure TF_C02.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15101 = ''1'' Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_C02.SG02Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG02);
  D.F15.First;
  While not D.F15.Eof do
  Begin
    if((D.F15.FieldByName('BEF15006').AsString <> 'all') and
       (D.F15.FieldByName('BEF15006').AsString <> '成型站'))Then
    Begin
      D.F15.Next;
      Continue;
    End;

    SG02.Cells[00,i] :=             D.F15.FieldByName('BEF15001').AsString;
    SG02.Cells[01,i] :=             D.F15.FieldByName('BEF15002').AsString;
    SG02.Cells[02,i] :=             D.F15.FieldByName('BEF15004').AsString;
    SG02.Cells[03,i] := F.Running00(D.F15.FieldByName('BEF15101').ASSTRING);
    SG02.Cells[04,i] := F.Running00(D.F15.FieldByName('BEF15102').ASSTRING);
    SG02.Cells[05,i] := F.Running00(D.F15.FieldByName('BEF15103').ASSTRING);
    SG02.Cells[06,i] := F.Running00(D.F15.FieldByName('BEF15104').ASSTRING);
    SG02.Cells[07,i] :=             D.F15.FieldByName('BEF15201').AsString;
    SG02.Cells[08,i] :=             D.F15.FieldByName('BEF15202').AsString;
    SG02.Cells[09,i] :=             D.F15.FieldByName('BEF15099').AsString;
    inc(i);
    D.F15.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_C02.AppIdle;
var
  SQLStr : String;
begin
  SQLStr := 'INSERT INTO BEFF17 (BEF17001,'+
                                'BEF17002,'+
                                'BEF17003,'+
                                'BEF17101,'+
                                'BEF17102)'+
                       'VALUES (''成型站'','+
                               ''''+CB_Lin.Text+''','+
                               '''9999'','+
                               '''1'','+
                               ''''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+''')';
  KC_T3ExecSQL(SQLStr,D.SC);
End;


procedure TF_C02.DelIdle;
var
  SQLStr : String;
begin
  SQLStr := 'Delete BEFF17 Where BEF17001 = '''+'成型站'+
                         ''' and BEF17002 = '''+CB_Lin.Text+
                         ''' and BEF17003 = ''9999''';
  KC_T3ExecSQL(SQLStr,D.SC);
End;

Function  TF_C02.ChkIdle(I1 : Integer) : Boolean;
Begin
  Result := True;
  if ((SG03.Cells[1,SG03.Row] <> '9999') and
      (SG03.Cells[1,SG03.Row] <> ''))    Then Result := False;
  case I1 of
    0 : if not Result Then ShowMessage('工作進行中 .... ');
    1 : if     Result Then ShowMessage('無工作進行中 .... ');
  End;
End;

procedure TF_C02.OpenF11(S1 : String);
begin
  KC_T3Close(D.F11,D.SC);
  D.F11.CommandText := 'SELECT * FROM BEFF11 Where BEF11101 = '''+S1+''' Order by BEF11001';
  KC_T3OPEN(D.F11,D.SC);
  D.F11.First;
End;

procedure TF_C02.SG03Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG03);
  D.F16.First;
  While not D.F16.Eof do
  Begin
    if (D.F16.FieldByName('BEF16005').ASString <> CB_Lin.Text) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    if not ((D.F16.FieldByName('BEF16101').AsString = '1') or
            (D.F16.FieldByName('BEF16101').AsString = '0')) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SG03.Cells[0,i] :=      'Run';    // Type
    SG03.Cells[1,i] :=      D.F16.FieldByName('BEF16001').ASString;      // Run
    SG03.Cells[2,i] := F.Hr(D.F16.FieldByName('BEF16102').ASString);     // Hr
    SG03.Cells[3,i] :=      D.F16.FieldByName('BEF16002').ASString+#255+
                            D.F16.FieldByName('BEF16003').ASString;      // Product
    SG03.Cells[4,i] :=      D.F16.FieldByName('BEF16299').ASString;      // Note
    SG03.Cells[5,i] :=      D.F16.FieldByName('BEF16102').ASString;      // BeginTime;
    inc(i);
    D.F16.Next;
  End;

  D.F17.First;
  While not D.F17.Eof do
  Begin
    if((D.F17.FieldByName('BEF17002').ASString <> CB_Lin.Text) or
       (D.F17.FieldByName('BEF17001').ASString <> '成型站')) Then
    Begin
      D.F17.Next;
      Continue;
    End;
    D.F11.Locate('BEF11001', VarArrayOf([D.F17.FieldByName('BEF17003').ASString]), [loCaseInsensitive]);
    SG03.Cells[0,i] :=      'Event';    // Type
    SG03.Cells[1,i] :=      D.F17.FieldByName('BEF17003').ASString;      // Run/Event
    SG03.Cells[2,i] := F.Hr(D.F17.FieldByName('BEF17102').ASString);     // Hr
    SG03.Cells[3,i] :=      D.F11.FieldByName('BEF11002').ASString;      // Name
    SG03.Cells[4,i] :=      D.F17.FieldByName('BEF17299').ASString;      // Note
    SG03.Cells[5,i] :=      D.F17.FieldByName('BEF17102').ASString;      // BeginTime
    if (SG03.Cells[1,i] = '9999') Then SG03.Cells[3,i] := 'Idle';
    inc(i);
    D.F17.Next;
  End;
  SG03.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG03);
end;

procedure TF_C02.OpenF16(S1 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 With (INDEX(BEFF16_006)) Where BEF16006 = '''+S1+''' Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_C02.SG04Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG04);
  OpenF16(SG02.Cells[0,SG02.Row]);
  While not D.F16.Eof do
  Begin
    SG04.Cells[00,i] :=  F.Running01(D.F16.FieldByName('BEF16101').ASString); //  Running
    SG04.Cells[01,i] :=              D.F16.FieldByName('BEF16001').ASString;  //  Run';
    SG04.Cells[02,i] :=              D.F16.FieldByName('BEF16308').ASString;  //  級別';
    SG04.Cells[03,i] :=              D.F16.FieldByName('BEF16304').ASString;  //  級別';
    SG04.Cells[04,i] :=              D.F16.FieldByName('BEF16302').ASString;  //  使用';
    SG04.Cells[05,i] :=              D.F16.FieldByName('BEF16303').ASString;  //  收料';
    SG04.Cells[06,i] :=              D.F16.FieldByName('BEF16306').ASString;  //  損耗';
    SG04.Cells[07,i] :=              D.F16.FieldByName('BEF16307').ASString;
    SG04.Cells[08,i] :=              D.F16.FieldByName('BEF16309').ASString;
    SG04.Cells[09,i] :=              D.F16.FieldByName('BEF16310').ASString;
    SG04.Cells[10,i] :=              D.F16.FieldByName('BEF16499').ASString;
    D.F16.Next;
    inc(i);
  End;
  SG04.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG04);
end;

procedure TF_C02.FormShow(Sender: TObject);
begin
  SL03 := TStringList.Create;  // Data
  D.OpenF00;
  OpenF11('成型站');
  OpenF15;
  D.ORunningF17('1','1');
  D.ORunningF16('1','1');
  LoadLne('成型站');
  SG01INI;
  SG02INI;
  SG03INI;
  SG04INI;
  SG01Snd;
  SG02Snd;
  SG03Snd;
  SG04Snd;
end;

procedure TF_C02.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.RunningToColor(Cells[ACol,ARow]);
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

Function  TF_C02.GoEvt(I1 : Integer) : Boolean;
begin
  F_V04 := TF_V04.Create(Application);
  case I1 of
    0 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '成型站';
          F_V04.L_002.Caption := CB_Lin.Text;
          F_V04.L_003.Caption := SG01.Cells[0,SG01.Row]+#255+
                                 SG01.Cells[1,SG01.Row];
          F_V04.L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V04.L_103.Caption := '-';
          F_V04.ERunning := '1';
        End;
  1,2 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '成型站';
          F_V04.L_002.Caption := CB_Lin.Text;
          F_V04.L_003.Caption := SG03.Cells[1,SG03.Row]+#255+SG03.Cells[3,SG03.Row];
          F_V04.L_102.Caption := copy(SG03.Cells[5,SG03.Row],1,8)+'-'+
                                 copy(SG03.Cells[5,SG03.Row],9,6);
          F_V04.L_103.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V04.ERunning := KC_GetSubStr('.',CB_101.Text,1);
        End;
  End;
  F_V04.ShowModal;
  Result := F_V04.Ret;
  F_V04.Free;
end;

Function TF_C02.GoRun(I1 : Integer;Run : String) : Boolean;
begin
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf(['成型站',
                                                CB_Lin.Text]), [loCaseInsensitive]);
  F_V03 := TF_V03.Create(Application);
  case I1 of
    0 : Begin
          F_V03.Kind := I1;
          F_V03.ERunning := '1';
          F_V03.iStation := 10;
          F_V03.E_S02.Text := D.F12.FieldByName('BEF12004').AsString;
          F_V03.E_002.Text := SG02.Cells[1,SG02.Row];
          F_V03.E_003.Text := SG02.Cells[1,SG02.Row];
          F_V03.E_004.Text := SG02.Cells[2,SG02.Row];
          F_V03.E_005.Text := CB_Lin.Text;
          F_V03.E_006.Text := SG02.Cells[0,SG02.Row];
        End;
  1,2 : Begin
          F_V03.Kind := I1;
          F_V03.ERunning := '2';
          F_V03.iStation := 10;
          F_V03.E_10001.Text  := Run;
        End;
    3 : Begin
          F_V03.Kind := I1;
          F_V03.iStation := 10;
          F_V03.E_10001.Text  := Run;
        End;
  End;
  F_V03.ShowModal;
  Result := F_V03.Ret;
  F_V03.Free;
end;

procedure TF_C02.B_B01Click(Sender: TObject);
var
  Ret : Boolean;
begin
  Ret :=False;
  B_B03Click(Sender);
  if not ChkIdle(0) Then Exit;
  case PC01.TabIndex of
    0 : Ret := GoEvt(0);     // F_V04
    1 : Ret := GoRun(0,'');  // F_V03
  End;
  if Ret Then DelIdle;
  D.ORunningF17('1','1');
  D.ORunningF16('1','1');
  SG03Snd;
  SG04Snd;
end;

procedure TF_C02.B_B02Click(Sender: TObject);
var
  Ret : Boolean;
begin
  Ret :=False;
  B_B03Click(Sender);
  if ChkIdle(1) Then Exit;
  if (SG03.Cells[0,SG03.Row]='Event') Then Ret := GoEvt(1);
  if (SG03.Cells[0,SG03.Row]='Run')   Then Ret := GoRun(1,SG03.Cells[1,SG03.Row]);
  if Ret Then AppIdle;
  D.ORunningF17('1','1');
  D.ORunningF16('1','1');
  SG03Snd;
  SG04Snd;
end;

procedure TF_C02.SG04DblClick(Sender: TObject);
begin
  if (TStringGrid(Sender).Cells[1,TStringGrid(Sender).Row] = '') Then Exit;
  if((TStringGrid(Sender).Name = 'SG03') and
     (SG03.Cells[0,SG03.Row]<>'Run')) Then Exit;
  if (TStringGrid(Sender).Name = 'SG03') Then GoRun(3,SG03.Cells[1,SG03.Row]);
  if (TStringGrid(Sender).Name = 'SG04') Then GoRun(3,SG04.Cells[1,SG04.Row]);
  B_B03Click(Sender);
end;

procedure TF_C02.SG02DblClick(Sender: TObject);
begin
  case SG02.Col of
    3 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 0;
          F_V01.PType    := SG02.Cells[01,SG02.Row];
          F_V01.Working  := SG02.Cells[00,SG02.Row];
          F_V01.Running      := SG02.Cells[03,SG02.Row];
          F_V01.BDate    := '-';
          F_V01.ShowModal;
          F_V01.Free;
          OpenF15;
          SG02Snd;
        End;
    4 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 1;
          F_V01.PType    := SG02.Cells[01,SG02.Row];
          F_V01.Working  := SG02.Cells[00,SG02.Row];
          F_V01.Running      := SG02.Cells[04,SG02.Row];
          F_V01.BDate    := '-';
          F_V01.ShowModal;
          F_V01.Free;
          OpenF15;
          SG02Snd;
        End;
  end;
end;

procedure TF_C02.B_B03Click(Sender: TObject);
begin
  OpenF15;
  D.ORunningF17('1','1');
  D.ORunningF16('1','1');
  SG02Snd;
  SG03Snd;
  SG04Snd;
end;

procedure TF_C02.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG04Snd;
end;

procedure TF_C02.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG04Snd;
end;

procedure TF_C02.CB000Change(Sender: TObject);
begin
  SG04Snd;
end;

procedure TF_C02.CB_LinChange(Sender: TObject);
begin
  B_B03Click(Sender);
end;

procedure TF_C02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL03.Free;
end;

procedure TF_C02.B_FindClick(Sender: TObject);
var
  i,Ret : integer;
begin
  D.OpenF16(E_Run.Text);
  if (D.F16.FieldByName('BEF16001').ASString = '') Then
  Begin
    ShowMessage('Run 不存在');
    Exit;
  End;
  Ret := -1;
  for i:=1 to SG02.RowCount-1 do
    if (SG02.Cells[0,i]=D.F16.FieldByName('BEF16006').ASString) Then Ret := i;
  if (Ret = -1) Then
  Begin
    ShowMessage('工單不存在');
    Exit;
  End;
  SG02.Row := Ret;
  SG04Snd;
  Ret := -1;
  for i:=1 to SG04.RowCount-1 do
    if (SG04.Cells[1,i]=E_Run.Text) Then
      Ret := i;
  if (Ret = -1) Then
  Begin
    ShowMessage('Run不在此工單');
    Exit;
  End;
  SG04.Row := Ret;
End;

end.


