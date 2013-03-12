unit U_C08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, DB, Math;

type
  TF_C08 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    B_B03: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    B_B01: TButton;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel5: TPanel;
    CB_101: TComboBox;
    B_B02: TButton;
    CB_Lin: TComboBox;
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
    Splitter5: TSplitter;
    SG02: TStringGrid;
    Panel17: TPanel;
    SG06: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CB_TypeChange(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_B01Click(Sender: TObject);
    procedure B_B02Click(Sender: TObject);
    procedure SG06DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure OpenF11(S1 : String);
    procedure OpenF15;
    procedure OpenG09(S1 : String);
    procedure LoadLne(S1 : String);
    function  GetRow(TSG : TStringGrid;iRow : integer) : integer;
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG06INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG06Snd;
    Function  ChkIdle(I1 : Integer) : Boolean;
    procedure DelIdle;
    procedure AppIdle;
    Function  GoEvt(I1 : Integer) : Boolean;
    Function  GoRun(I1 : Integer;Run : String) : Boolean;
  public
    { Public declarations }
  end;

var
  F_C08: TF_C08;

implementation

uses U_KcPub, U_D, U_F, U_V04, U_V08;

{$R *.dfm}

procedure TF_C08.OpenF11(S1 : String);
begin
  KC_T3Close(D.F11,D.SC);
  D.F11.CommandText := 'SELECT * FROM BEFF11 Where BEF11101 = '''+S1+''' Order by BEF11001';
  KC_T3OPEN(D.F11,D.SC);
  D.F11.First;
End;

procedure TF_C08.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15101 = ''1'' Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_C08.LoadLne(S1 : String);
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

procedure TF_C08.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'No';
  SG01.Cells[1,0] := 'Events';
  KC_ColAutoSize(SG01);
end;

procedure TF_C08.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Working No';  //*BEF15001    A(24)
  SG02.Cells[01,0] := '目標料號';    // BEF15002    A(12)
  SG02.Cells[02,0] := 'Process';     // BEF15004    A(20)
  SG02.Cells[03,0] := 'Running';         // BEF15101    A(01)
  SG02.Cells[04,0] := '成型站';      // BEF15102    A(01)
  SG02.Cells[05,0] := '褙膜站';      // BEF15103    A(01)
  SG02.Cells[06,0] := '庫房站';      // BEF15104    A(01)
  SG02.Cells[07,0] := 'Begin  Date'; // BEF15201    A(08)
  SG02.Cells[08,0] := 'Finish Date'; // BEF15202    A(08)
  SG02.Cells[09,0] := 'Note';        // BEF15099    A(64)
  KC_ColAutoSize(SG02);
end;

procedure TF_C08.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[0,0] := 'Type';
  SG03.Cells[1,0] := 'No';
  SG03.Cells[2,0] := 'Hr';
  SG03.Cells[3,0] := 'Name';
  SG03.Cells[4,0] := 'Note';
  KC_ColAutoSize(SG03);
end;

procedure TF_C08.SG06INI;
begin
  KC_SGClear(0,SG06);
  SG06.Cells[00,0] := 'Running';      // BEF19101
  SG06.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG06.Cells[02,0] := '規格';     // BEF19002
  SG06.Cells[03,0] := '料號';     // BEF19003
  SG06.Cells[04,0] := 'SN';       // BEF19500
  SG06.Cells[05,0] := '分條長度'; // BEF19501
  SG06.Cells[06,0] := '分條寬幅'; // BEF19502
  SG06.Cells[07,0] := '損耗長度'; // BEF19503
  SG06.Cells[08,0] := '損耗寬幅'; // BEF19504
  SG06.Cells[09,0] := '來源';     // BEF19001+BEF19007+BEF19500
  KC_ColAutoSize(SG06);
end;

procedure TF_C08.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  i := 1;
  D.F11.First;
  While not D.F11.Eof do
  Begin
    if ('9998'= D.F11.FieldByName('BEF11001').ASString) Then
    Begin
      D.F11.Next;
      Continue; 
    End;
    SG01.Cells[0,i] := D.F11.FieldByName('BEF11001').ASString;
    SG01.Cells[1,i] := D.F11.FieldByName('BEF11002').ASString;
    inc(i);
    D.F11.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_C08.SG02Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG02);
  D.F15.First;
  While not D.F15.Eof do
  Begin
    if((D.F15.FieldByName('BEF15006').AsString <> 'all') and
       (D.F15.FieldByName('BEF15006').AsString <> '分條站'))Then
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

procedure TF_C08.SG03Snd;
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
       (D.F17.FieldByName('BEF17001').ASString <> '分條站')) Then
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

procedure TF_C08.OpenG09(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19006 = '''+S1+
                                      ''' Order By BEF19001,BEF19007,BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

function  TF_C08.GetRow(TSG : TStringGrid;iRow : integer) : integer;
var
  i : integer;
begin
  if (TSG.Cells[04,iRow] = '') Then Exit;
  Result := 1;
  While (TSG.Cells[04,Result] <> '') do
    inc(Result);
End;

procedure TF_C08.SG06Snd;
var
  i   : integer;
  SS1 : String;
begin
  i:=1;
  KC_SGClear(1,SG06);
  While not D.G19.Eof do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    SG06.Cells[00,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);//Running';;       // BEF19101
    SG06.Cells[01,i] := SS1;
    SG06.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG06.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG06.Cells[04,i] := D.G19.FieldByName('BEF19500').ASString;
    SG06.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString;
    SG06.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    SG06.Cells[07,i] := D.G19.FieldByName('BEF19503').ASString;
    SG06.Cells[08,i] := D.G19.FieldByName('BEF19504').ASString;
    SG06.Cells[09,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19201').ASString;
    inc(i);
    D.G19.Next;
  End;
  SG06.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG06);
end;

procedure TF_C08.FormShow(Sender: TObject);
begin
  D.OpenF05;
  OpenF11('分條站');
  OpenF15;
  D.ORunningF17('1','1');
  D.ORunningF19('1','1');
  LoadLne('分條站');
  SG01INI;
  SG02INI;
  SG03INI;
  SG06INI;
  SG01Snd; D.OpenF10(SG02.Cells[1,SG02.Row],SG02.Cells[2,SG02.Row]);
  SG02Snd;
  SG03Snd;
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

procedure TF_C08.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C08.CB_TypeChange(Sender: TObject);
begin
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

procedure TF_C08.B_B03Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TF_C08.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

procedure TF_C08.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

Function  TF_C08.ChkIdle(I1 : Integer) : Boolean;
Begin
  Result := True;
  if ((SG03.Cells[1,1] <> '9999') and
      (SG03.Cells[1,1] <> ''))    Then Result := False;
  case I1 of
    0 : if not Result Then ShowMessage('工作進行中 .... ');
    1 : if     Result Then ShowMessage('無工作進行中 .... ');
  End;
End;

procedure TF_C08.DelIdle;
var
  SQLStr : String;
begin
  SQLStr := 'Delete BEFF17 Where BEF17001 = '''+'分條站'+
                         ''' and BEF17002 = '''+CB_Lin.Text+
                         ''' and BEF17003 = ''9999''';
  KC_T3ExecSQL(SQLStr,D.SC);
End;

Function  TF_C08.GoEvt(I1 : Integer) : Boolean;
begin
  F_V04 := TF_V04.Create(Application);
  case I1 of
    0 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '分條站';
          F_V04.L_002.Caption := CB_Lin.Text;
          F_V04.L_003.Caption := SG01.Cells[0,SG01.Row]+#255+
                                 SG01.Cells[1,SG01.Row];
          F_V04.L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V04.L_103.Caption := '-';
          F_V04.ERunning := '1';
        End;
   1,2 : Begin
          F_V04.Kind := I1;
          F_V04.L_001.Caption := '分條站';
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

Function TF_C08.GoRun(I1 : Integer;Run : String) : Boolean;
begin
  D.F12.Locate('BEF12001;BEF12002', VarArrayOf(['分條站',
                                                CB_Lin.Text]), [loCaseInsensitive]);
  F_V08 := TF_V08.Create(Application);
  case I1 of
    0 : Begin
          F_V08.Kind := I1;
          F_V08.ERunning := '1';
          F_V08.CB_Station.ItemIndex := 0;
          F_V08.E_002.Text := SG02.Cells[1,SG02.Row];
          F_V08.E_004.Text := SG02.Cells[2,SG02.Row];
          F_V08.E_005.Text := CB_Lin.Text;
          F_V08.E_006.Text := SG02.Cells[0,SG02.Row];
          F_V08.L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V08.L_103.Caption := '-';
        End;
  1,2 : Begin
          F_V08.Kind := I1;
          F_V08.ERunning := KC_GetSubStr('.',CB_101.Text,1);
          F_V08.CB_Station.ItemIndex := 0;
          F_V08.Run  := Run;
          F_V08.L_102.Caption := copy(SG03.Cells[5,SG03.Row],1,8)+'-'+
                                 copy(SG03.Cells[5,SG03.Row],9,6);
          F_V08.L_103.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
          F_V08.E_005.Text := CB_Lin.Text;
        End;
    3 : Begin
          F_V08.Kind := 3;
          F_V08.CB_Station.ItemIndex := 0;
          F_V08.E_007.Text  := Run;
        End;
  End;
  F_V08.ShowModal;
  Result := F_V08.Ret;
  F_V08.Free;
end;

procedure TF_C08.B_B01Click(Sender: TObject);
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
  SG03Snd;
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

procedure TF_C08.AppIdle;
var
  SQLStr : String;
begin
  SQLStr := 'INSERT INTO BEFF17 (BEF17001,'+
                                'BEF17002,'+
                                'BEF17003,'+
                                'BEF17101,'+
                                'BEF17102)'+
            'VALUES ('''+'分條站'+''','+
                    ''''+CB_Lin.Text+''','+
                    '''9999'','+
                    '''1'','+
                    ''''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+''')';
  KC_T3ExecSQL(SQLStr,D.SC);
End;

procedure TF_C08.B_B02Click(Sender: TObject);
var
  Ret : Boolean;
begin
  Ret :=False;
  B_B03Click(Sender);
  if ChkIdle(1) Then Exit;
  if (SG03.Cells[1,SG03.Row]<>'9998') Then Ret := GoEvt(1);
  if (SG03.Cells[1,SG03.Row] ='9998') Then Ret := GoRun(1,SG03.Cells[1,SG03.Row]);
  if Ret Then AppIdle;
  D.ORunningF17('1','1');
  SG03Snd;
  OpenG09(SG02.Cells[0,SG02.Row]);
  SG06Snd;
end;

procedure TF_C08.SG06DblClick(Sender: TObject);
begin
  GoRun(3,SG06.Cells[9,SG06.Row]);
end;

end.


