unit U_C03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, DB;

type
  TF_C03 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel9: TPanel;
    Label3: TLabel;
    CB_Lin: TComboBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    B_B03: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    CB_101: TComboBox;
    B_B02: TButton;
    Splitter1: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    B_B01: TButton;
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
    CB000: TComboBox;
    SG04: TStringGrid;
    Panel14: TPanel;
    SG03: TStringGrid;
    E_R02: TEdit;
    B_Find: TButton;
    E_R01: TEdit;
    procedure FormShow(Sender: TObject);
    procedure B_B01Click(Sender: TObject);
    procedure B_B02Click(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG02DblClick(Sender: TObject);
    procedure SG04DblClick(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CB000Change(Sender: TObject);
    procedure CB_LinChange(Sender: TObject);
    procedure B_FindClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenF11(S1 : String);
    procedure OpenF15;
    procedure OpenF19(S1 : String);
    procedure LoadLne(S1 : String);
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG04INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG04Snd;
    Function  ChkIdle(I1 : Integer) : Boolean;
    procedure AppIdle;
    procedure DelIdle;
    Function  GoEvt(I1 : Integer) : Boolean;
    Function  GoRun(I1 : Integer;Run : String) : Boolean;
  public
    { Public declarations }
  end;

var
  F_C03: TF_C03;

implementation

uses U_KcPub, U_D, U_F, U_V04, U_V05, U_V01;

{$R *.dfm}

procedure TF_C03.OpenF19(S1 : String);
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 With (INDEX(BEFF19_006)) Where BEF19006 = '''+S1+''' Order by BEF19001';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_C03.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15101 = ''1'' Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_C03.OpenF11(S1 : String);
begin
  KC_T3Close(D.F11,D.SC);
  D.F11.CommandText := 'SELECT * FROM BEFF11 Where BEF11101 = '''+S1+''' Order by BEF11001';
  KC_T3OPEN(D.F11,D.SC);
  D.F11.First;
End;

procedure TF_C03.LoadLne(S1 : String);
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

procedure TF_C03.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No';
  SG01.Cells[1,0] := 'Events';
  KC_ColAutoSize(SG01);
end;

procedure TF_C03.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Working No';  //*BEF15001 A(24)
  SG02.Cells[01,0] := '目標料號';    // BEF15002 A(12)
  SG02.Cells[02,0] := 'Process';     // BEF15004 A(20)
  SG02.Cells[03,0] := 'Running';         // BEF15101 A(01)
  SG02.Cells[04,0] := '成型站';      // BEF15102 A(01)
  SG02.Cells[05,0] := '褙膜站';      // BEF15103 A(01)
  SG02.Cells[06,0] := '庫房站';      // BEF15104 A(01)
  SG02.Cells[07,0] := 'Begin  Date'; // BEF15201 A(08)
  SG02.Cells[08,0] := 'Finish Date'; // BEF15202 A(08)
  SG02.Cells[09,0] := 'Note';        // BEF15099 A(64)
  KC_ColAutoSize(SG02);
end;

procedure TF_C03.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[0,0] := 'Type';
  SG03.Cells[1,0] := 'No';
  SG03.Cells[2,0] := 'Hr';
  SG03.Cells[3,0] := 'Name';
  SG03.Cells[4,0] := 'Note';
  KC_ColAutoSize(SG03);
end;

procedure TF_C03.SG04INI;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[0,0] := 'Running';  // BEF19101
  SG04.Cells[1,0] := 'Run';  // BEF19001
  SG04.Cells[2,0] := '級別'; // BEF19002 目標料號 -> 級別
  SG04.Cells[3,0] := '使用'; // BEF19302
  SG04.Cells[4,0] := '收料'; // BEF19303
  SG04.Cells[5,0] := '損耗'; // BEF19306
  SG04.Cells[6,0] := 'QA';   // BEF19499
  KC_ColAutoSize(SG04);
end;

procedure TF_C03.SG01Snd;
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

procedure TF_C03.SG02Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG02);
  D.F15.First;
  While not D.F15.Eof do
  Begin
    if((D.F15.FieldByName('BEF15006').AsString <> 'all') and
       (D.F15.FieldByName('BEF15006').AsString <> '褙膜站'))Then
    Begin
      D.F15.Next;
      Continue;
    End;
    SG02.Cells[00,i] :=         D.F15.FieldByName('BEF15001').AsString;
    SG02.Cells[01,i] :=         D.F15.FieldByName('BEF15002').AsString;
    SG02.Cells[02,i] :=         D.F15.FieldByName('BEF15004').AsString;
    SG02.Cells[03,i] := F.Running00(D.F15.FieldByName('BEF15101').ASSTRING);
    SG02.Cells[04,i] := F.Running00(D.F15.FieldByName('BEF15102').ASSTRING);
    SG02.Cells[05,i] := F.Running00(D.F15.FieldByName('BEF15103').ASSTRING);
    SG02.Cells[06,i] := F.Running00(D.F15.FieldByName('BEF15104').ASSTRING);
    SG02.Cells[07,i] :=         D.F15.FieldByName('BEF15201').AsString;
    SG02.Cells[08,i] :=         D.F15.FieldByName('BEF15202').AsString;
    SG02.Cells[09,i] :=         D.F15.FieldByName('BEF15099').AsString;
    inc(i);
    D.F15.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_C03.SG03Snd;
var
  i : integer;
begin                                  
  i := 1;
  KC_SGClear(1,SG03);
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if (D.F19.FieldByName('BEF19005').ASString <> CB_Lin.Text) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    SG03.Cells[0,i] :=      'Run';    // 'Type';
    SG03.Cells[1,i] :=      D.F19.FieldByName('BEF19001').ASString+#255+
                            D.F19.FieldByName('BEF19007').ASString;      // 'Run
    SG03.Cells[2,i] := F.Hr(D.F19.FieldByName('BEF19102').ASString);     // 'Hr
    SG03.Cells[3,i] :=      D.F19.FieldByName('BEF19002').ASString+#255+
                            D.F19.FieldByName('BEF19003').ASString;      // 'Product';
    SG03.Cells[4,i] :=      D.F19.FieldByName('BEF19299').ASString;      // 'Note';
    SG03.Cells[5,i] :=      D.F19.FieldByName('BEF19102').ASString;      // BeginTime;
    inc(i);
    D.F19.Next;
  End;                                          

  D.F17.First;
  While not D.F17.Eof do
  Begin
    if((D.F17.FieldByName('BEF17002').ASString <> CB_Lin.Text) or
       (D.F17.FieldByName('BEF17001').ASString <> '褙膜站')) Then
    Begin
      D.F17.Next;
      Continue;
    End;
    D.F11.Locate('BEF11001', VarArrayOf([D.F17.FieldByName('BEF17003').ASString]), [loCaseInsensitive]);
    SG03.Cells[0,i] :=      'Event';    // Type
    SG03.Cells[1,i] :=      D.F17.FieldByName('BEF17003').ASString;  // Run/Event
    SG03.Cells[2,i] := F.Hr(D.F17.FieldByName('BEF17102').ASString); // Hr
    SG03.Cells[3,i] :=      D.F11.FieldByName('BEF11002').ASString;  // Name
    SG03.Cells[4,i] :=      D.F17.FieldByName('BEF17299').ASString;  // Note
    SG03.Cells[5,i] :=      D.F17.FieldByName('BEF17102').ASString;  // BeginTime
    if (SG03.Cells[1,i] = '9999') Then SG03.Cells[3,i] := 'Idle';
    inc(i);
    D.F17.Next;
  End;
  SG03.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG03);
end;

procedure TF_C03.SG04Snd;
var
  S1 : String;
  i : integer;
  FF : Real;
begin
  i := 1;
  D.OpenF05;
  KC_SGClear(1,SG04);
  OpenF19(SG02.Cells[0,SG02.Row]);
  While not D.F19.Eof do
  Begin
    FF := KC_StrToFloat(D.F19.FieldByName('BEF19303').ASString)+
          KC_StrToFloat(D.F19.FieldByName('BEF19304').ASString);
    case CB000.ItemIndex of
      0 : ;
      1 : if (FF = 0) then
          Begin
            D.F19.Next;
            Continue;
          End;
      2 : if (FF <> 0) then
          Begin
            D.F19.Next;
            Continue;
          End;
    end;
    S1 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.F19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      S1 := D.F05.FieldByName('BEF05003').ASString;
    SG04.Cells[0,i] := F.Station01(D.F19.FieldByName('BEF19101').ASString);
    SG04.Cells[1,i] := D.F19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                       D.F19.FieldByName('BEF19007').ASString;     // 'Run
    SG04.Cells[2,i] := S1; //  級別
    SG04.Cells[3,i] := D.F19.FieldByName('BEF19302').ASString; //  使用
    SG04.Cells[4,i] := D.F19.FieldByName('BEF19303').ASString; //  收料
    SG04.Cells[5,i] := D.F19.FieldByName('BEF19306').ASString; //  損耗
    SG04.Cells[6,i] := D.F19.FieldByName('BEF19499').ASString; //  QA Note
    D.F19.Next;
    inc(i);
  End;
  SG04.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG04);
end;

Function  TF_C03.ChkIdle(I1 : Integer) : Boolean;
Begin
  Result := True;
  if ((SG03.Cells[1,1] <> '9999') and
      (SG03.Cells[1,1] <> ''))    Then Result := False;
  case I1 of
    0 : if not Result Then ShowMessage('工作進行中 .... ');
    1 : if     Result Then ShowMessage('無工作進行中 .... ');
  End;
End;

procedure TF_C03.AppIdle;
var
  SQLStr : String;
begin
  SQLStr := 'INSERT INTO BEFF17 (BEF17001,'+
                                'BEF17002,'+
                                'BEF17003,'+
                                'BEF17101,'+
                                'BEF17102)'+
            'VALUES ('''+'褙膜站'+''','+
                    ''''+CB_Lin.Text+''','+
                    '''9999'','+
                    '''1'','+
                    ''''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+''')';
  KC_T3ExecSQL(SQLStr,D.SC);
End;

procedure TF_C03.DelIdle;
var
  SQLStr : String;
begin
  SQLStr := 'Delete BEFF17 Where BEF17001 = '''+'褙膜站'+
                         ''' and BEF17002 = '''+CB_Lin.Text+
                         ''' and BEF17003 = ''9999''';
  KC_T3ExecSQL(SQLStr,D.SC);
End;

procedure TF_C03.FormShow(Sender: TObject);
begin
  D.OpenF05;
  OpenF11('褙膜站');
  OpenF15;
  D.ORunningF17('1','1');
  D.ORunningF19('1','1');
  LoadLne('褙膜站');
  SG01INI;
  SG02INI;
  SG03INI;
  SG04INI;
  SG01Snd;
  SG02Snd;
  SG03Snd;
  SG04Snd;
end;

Function  TF_C03.GoEvt(I1 : Integer) : Boolean;
begin
  F_V04 := TF_V04.Create(Application);
  case I1 of
    0 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '褙膜站';
          F_V04.L_002.Caption := CB_Lin.Text;
          F_V04.L_003.Caption := SG01.Cells[0,SG01.Row]+#255+
                                 SG01.Cells[1,SG01.Row];
          F_V04.L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V04.L_103.Caption := '-';
          F_V04.ERunning := '1';
        End;
   1,2 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '褙膜站';
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

Function TF_C03.GoRun(I1 : Integer;Run : String) : Boolean;
begin
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf(['褙膜站',
                                                CB_Lin.Text]), [loCaseInsensitive]);
  F_V05 := TF_V05.Create(Application);
  case I1 of
    0 : Begin
          F_V05.Kind := I1;
          F_V05.ERunning := '1';
          F_V05.CB_Station.ItemIndex := 0;
          F_V05.E_002.Text := SG02.Cells[1,SG02.Row];
          F_V05.E_004.Text := SG02.Cells[2,SG02.Row];
          F_V05.E_005.Text := CB_Lin.Text;
          F_V05.E_006.Text := SG02.Cells[0,SG02.Row];
        End;
  1,2 : Begin
          F_V05.Kind := I1;
          F_V05.ERunning := KC_GetSubStr('.',CB_101.Text,1);
          F_V05.CB_Station.ItemIndex := 0;
          F_V05.Run  := Run;
        End;
    3 : Begin
          F_V05.Kind := I1;
          F_V05.CB_Station.ItemIndex := 0;
          F_V05.Run  := Run;
        End;
  End;
  F_V05.ShowModal;
  Result := F_V05.Ret;
  F_V05.Free;
end;

procedure TF_C03.B_B01Click(Sender: TObject);
var
  Ret : Boolean;
begin
  Ret :=False;
  B_B03Click(Sender);
  if not ChkIdle(0) Then Exit;
  case PC01.TabIndex of
    0 : Ret := GoEvt(0);
    1 : Ret := GoRun(0,'');
  End;
  if Ret Then DelIdle;
  D.ORunningF17('1','1');
  D.ORunningF19('1','1');
  SG03Snd;
  SG04Snd;
end;

procedure TF_C03.B_B02Click(Sender: TObject);
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
  D.ORunningF19('1','1');
  SG03Snd;
  SG04Snd;
end;

procedure TF_C03.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C03.SG02DblClick(Sender: TObject);
begin
  case SG02.Col of
    5 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 2;
          F_V01.PType    := SG02.Cells[01,SG02.Row];
          F_V01.Working  := SG02.Cells[00,SG02.Row];
          F_V01.Running      := SG02.Cells[05,SG02.Row];
          F_V01.BDate    := '-';
          F_V01.ShowModal;
          F_V01.Free;
          OpenF15;
          SG02Snd;
        End;
  end;
end;

procedure TF_C03.SG04DblClick(Sender: TObject);
begin
  if((TStringGrid(Sender).Name = 'SG03') and
     (SG03.Cells[0,SG03.Row]<>'Run')) Then Exit;
  if (TStringGrid(Sender).Name = 'SG03') Then GoRun(3,SG03.Cells[1,SG03.Row]);
  if (TStringGrid(Sender).Name = 'SG04') Then GoRun(3,SG04.Cells[1,SG04.Row]);
end;

procedure TF_C03.B_B03Click(Sender: TObject);
begin
  OpenF15;
  D.ORunningF17('1','1');
  D.ORunningF19('1','1');
  SG02Snd;
  SG03Snd;
  SG04Snd;
end;

procedure TF_C03.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG04Snd;
end;

procedure TF_C03.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG04Snd;
end;

procedure TF_C03.SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C03.CB000Change(Sender: TObject);
begin
  SG04Snd;
end;

procedure TF_C03.CB_LinChange(Sender: TObject);
begin
  B_B03Click(Sender);
end;

procedure TF_C03.B_FindClick(Sender: TObject);
var
  i,Ret : integer;
begin
  D.OpenF19(E_R01.Text,E_R02.Text);
  if (D.F19.FieldByName('BEF19001').ASString = '') Then
  Begin
    ShowMessage('Run 不存在');
    Exit;
  End;
  Ret := -1;
  for i:=1 to SG02.RowCount-1 do
    if (SG02.Cells[0,i]=D.F19.FieldByName('BEF19006').ASString) Then Ret := i;
  if (Ret = -1) Then
  Begin
    ShowMessage('工單不存在');
    Exit;
  End;
  SG02.Row := Ret;
  SG04Snd;
  Ret := -1;
  for i:=1 to SG04.RowCount-1 do
    if (SG04.Cells[1,i]=(E_R01.Text+#255+E_R02.Text)) Then
      Ret := i;
  if (Ret = -1) Then
  Begin
    ShowMessage('Run不在此工單');
    Exit;
  End;
  SG04.Row := Ret;
end;

end.


