unit U_D12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, ComCtrls;

type
  TF_D12 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    
    Panel8: TPanel;
    Panel4: TPanel;
    Panel9: TPanel;
    Label5: TLabel;
    CB004: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    SG02: TStringGrid;
    SG01: TStringGrid;
    SG03: TStringGrid;
    B_Excel: TBitBtn;
    Label7: TLabel;
    CB002: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure CB004Change(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
    procedure CB002Change(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    procedure CB002Ld;
    procedure CB004Ld;
    procedure OpenF10;
    procedure OpenF16;
    procedure OpenF19;
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
  public
    { Public declarations }
  end;

var
  F_D12: TF_D12;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D12.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';      // BEF16101
  SG01.Cells[01,0] := '目標料號'; // BEF16002
  SG01.Cells[02,0] := 'Process';  // BEF16004
  SG01.Cells[03,0] := 'Run';      // BEF16001
  SG01.Cells[04,0] := '級別';     // BEF16308
  SG01.Cells[05,0] := '良率';     //
  SG01.Cells[06,0] := '使用 m';   // BEF16302
  SG01.Cells[07,0] := 'm2';       // BEF16302
  SG01.Cells[08,0] := '收料 m';   // BEF16303
  SG01.Cells[09,0] := 'm2';       // BEF16302
  SG01.Cells[10,0] := '損耗 m';   // BEF16306
  SG01.Cells[11,0] := 'm2';       // BEF16302
  SG01.Cells[12,0] := '未褙膜 m'; // BEF16306
  SG01.Cells[13,0] := 'm2';       // BEF16302
  SG01.Cells[14,0] := '檢驗寬幅'; // BEF16304
  KC_ColAutoSize(SG01);
end;

procedure TF_D12.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Running';      // BEF16101
  SG02.Cells[01,0] := '目標料號'; // BEF16002
  SG02.Cells[02,0] := 'Process';  // BEF16004
  SG02.Cells[03,0] := 'Run';      // BEF16001
  SG02.Cells[04,0] := '級別';     // BEF16308
  SG02.Cells[05,0] := '良率';     //
  SG02.Cells[06,0] := '使用m';    // BEF16302
  SG02.Cells[07,0] := 'm2';       // BEF16302
  SG02.Cells[08,0] := '收料m';    // BEF16303
  SG02.Cells[09,0] := 'm2';       // BEF16302
  SG02.Cells[10,0] := '損耗m';    // BEF16306
  SG02.Cells[11,0] := 'm2';       // BEF16302
  SG02.Cells[12,0] := '檢驗寬幅'; // BEF16304
  KC_ColAutoSize(SG02);
end;

procedure TF_D12.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Running';      // BEF16101
  SG03.Cells[01,0] := '目標料號'; // BEF16002
  SG03.Cells[02,0] := 'Process';  // BEF16004
  SG03.Cells[03,0] := 'Run';      // BEF16001
  SG03.Cells[04,0] := '級別';     // BEF16308
  SG03.Cells[05,0] := '良率';     //
  SG03.Cells[06,0] := '使用 m';   // BEF16302
  SG03.Cells[07,0] := 'm2';       // BEF16302
  SG03.Cells[08,0] := '收料 m';   // BEF16303
  SG03.Cells[09,0] := 'm2';       // BEF16302
  SG03.Cells[10,0] := '損耗 m';   // BEF16306
  SG03.Cells[11,0] := 'm2';       // BEF16302
  SG03.Cells[12,0] := '檢驗寬幅'; // BEF16304
  KC_ColAutoSize(SG03);
end;

procedure TF_D12.CB002Ld;
begin
  CB002.Items.Clear;
  CB002.Items.Add('all');
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB002.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB002.ItemIndex := 0;
end;

procedure TF_D12.CB004Ld;
begin
  CB004.Items.Clear;
  CB004.Items.Add('all');
  D.F10.First;
  While not D.F10.Eof do
  Begin
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F10.FieldByName('BEF10003').AsString)) Then
    Begin
      D.F10.Next;
      Continue;
    End;
    CB004.Items.Add(D.F10.FieldByName('BEF10002').AsString);
    D.F10.Next;
  End;
  CB004.ItemIndex := 0;
end;

procedure TF_D12.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D12.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SG01INI;
  SG02INI;
  SG03INI;
  D.OpenF01('T');
  CB002Ld;
  OpenF10;
  CB004Ld;
end;

procedure TF_D12.OpenF16;
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 With (INDEX(BEFF16_101)) Where BEF16101 = ''2'' '+
                                              'Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D12.SG01Snd;
var
  i : integer;
  f01,f02,f03,f04 : Real;
  f11,f12,f13,f14,ff : Real;
  f21,f22,f23,f24 : Real;
begin
  KC_SGClear(1,SG01);
  f01:=0;
  f02:=0;
  f03:=0;
  f04:=0;
  f21:=0;
  f22:=0;
  f23:=0;
  f24:=0;
  i :=1;
  D.F16.First;
  While not D.F16.Eof do
  Begin
    if (CB004.ItemIndex <> 0) and (CB004.Text <> D.F16.FieldByName('BEF16004').AsString) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F16.FieldByName('BEF16002').AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    ff := KC_StrToFloat(D.F16.FieldByName('BEF16304').ASString);
    f11:= KC_StrToFloat(D.F16.FieldByName('BEF16302').ASString);
    f12:= KC_StrToFloat(D.F16.FieldByName('BEF16303').ASString);
    f13:= KC_StrToFloat(D.F16.FieldByName('BEF16306').ASString);
    f14:= KC_StrToFloat(D.F16.FieldByName('BEF16307').ASString);
    SL01.Assign(D.F16.FieldByName('BEF16901'));
    SG01.Cells[00,i] := F.Running01(D.F16.FieldByName('BEF16101').ASString);
    SG01.Cells[01,i] :=       D.F16.FieldByName('BEF16002').ASString;
    SG01.Cells[02,i] :=       D.F16.FieldByName('BEF16004').ASString;
    SG01.Cells[03,i] :=       D.F16.FieldByName('BEF16001').ASString;
    SG01.Cells[04,i] :=       D.F16.FieldByName('BEF16308').ASString;
    SG01.Cells[05,i] := F.Yld(SL01);
    SG01.Cells[06,i] :=       D.F16.FieldByName('BEF16302').ASString;
    SG01.Cells[07,i] :=       FloatToStr(f11*ff/1000);
    SG01.Cells[08,i] :=       D.F16.FieldByName('BEF16303').ASString;
    SG01.Cells[09,i] :=       FloatToStr(f12*ff/1000);
    SG01.Cells[10,i] :=       D.F16.FieldByName('BEF16306').ASString;
    SG01.Cells[11,i] :=       FloatToStr(f13*ff/1000);
    SG01.Cells[12,i] :=       D.F16.FieldByName('BEF16307').ASString;
    SG01.Cells[13,i] :=       FloatToStr(f14*ff/1000);
    SG01.Cells[14,i] :=       D.F16.FieldByName('BEF16304').ASString;
    f01:=f01+f11;
    f02:=f02+f12;
    f03:=f03+f13;
    f04:=f04+f14;
    f21:=f21+f11*ff;
    f22:=f22+f12*ff;
    f23:=f23+f13*ff;
    f24:=f24+f14*ff;
    D.F16.Next;
    inc(i);
  End;
  SG01.Cells[05,i] := '合計';
  SG01.Cells[06,i] := FloatToStr(f01);
  SG01.Cells[07,i] := FloatToStr(f21/1000);
  SG01.Cells[08,i] := FloatToStr(f02);
  SG01.Cells[09,i] := FloatToStr(f22/1000);
  SG01.Cells[10,i] := FloatToStr(f03);
  SG01.Cells[11,i] := FloatToStr(f23/1000);
  SG01.Cells[12,i] := FloatToStr(f04);
  SG01.Cells[13,i] := FloatToStr(f24/1000);
  SG01.RowCount := i+1;
  KC_ColAutoSize(SG01);
end;

procedure TF_D12.OpenF19;
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19101 >= ''2'' and  BEF19101 <= ''3'' Order by BEF19001';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_D12.SG02Snd;
var
  i : integer;
  S1 : String;
  f01,f02,f03 : Real;
  f11,f12,f13,ff : Real;
  f21,f22,f23 : Real;
begin
  KC_SGClear(1,SG02);
  i :=1;
  f01:=0;
  f02:=0;
  f03:=0;
  f21:=0;
  f22:=0;
  f23:=0;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if ('2' <> D.F19.FieldByName('BEF19101').AsString) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    if (CB004.ItemIndex <> 0) and (CB004.Text <> D.F19.FieldByName('BEF19004').AsString) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F19.FieldByName('BEF19002').AsString)) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    S1 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.F19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      S1 := D.F05.FieldByName('BEF05003').ASString;
    D.OpenF16(D.F19.FieldByName('BEF19001').ASString);
    ff := KC_StrToFloat(D.F16.FieldByName('BEF16304').ASString);
    f11:= KC_StrToFloat(D.F19.FieldByName('BEF19302').ASString);
    f12:= KC_StrToFloat(D.F19.FieldByName('BEF19303').ASString);
    f13:= KC_StrToFloat(D.F19.FieldByName('BEF19306').ASString);
    SL01.Assign(D.F16.FieldByName('BEF16901'));
    SG02.Cells[00,i] :=  F.Station(D.F19.FieldByName('BEF19101').ASString);     //  'Running';
    SG02.Cells[01,i] :=            D.F19.FieldByName('BEF19002').ASString;
    SG02.Cells[02,i] :=            D.F19.FieldByName('BEF19004').ASString;
    SG02.Cells[03,i] :=            D.F19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                                   D.F19.FieldByName('BEF19007').ASString;      // 'Run
    SG02.Cells[04,i] :=            S1; //  級別
    SG02.Cells[05,i] :=      F.Yld(SL01);
    SG02.Cells[06,i] :=            D.F19.FieldByName('BEF19302').ASString;
    SG02.Cells[07,i] :=            FloatToStr(f11*ff/1000);
    SG02.Cells[08,i] :=            D.F19.FieldByName('BEF19303').ASString;
    SG02.Cells[09,i] :=            FloatToStr(f12*ff/1000);
    SG02.Cells[10,i] :=            D.F19.FieldByName('BEF19306').ASString;
    SG02.Cells[11,i] :=            FloatToStr(f13*ff/1000);
    SG02.Cells[12,i] :=            D.F16.FieldByName('BEF16304').ASString;
    f01:=f01+f11;
    f02:=f02+f12;
    f03:=f03+f13;
    f21:=f21+f11*ff;
    f22:=f22+f12*ff;
    f23:=f23+f13*ff;
    D.F19.Next;
    inc(i);
  End;
  SG02.Cells[05,i] := '合計';
  SG02.Cells[06,i] := FloatToStr(f01);
  SG02.Cells[07,i] := FloatToStr(f21/1000);
  SG02.Cells[08,i] := FloatToStr(f02);
  SG02.Cells[09,i] := FloatToStr(f22/1000);
  SG02.Cells[10,i] := FloatToStr(f03);
  SG02.Cells[11,i] := FloatToStr(f23/1000);
  SG02.RowCount := i+1;
  KC_ColAutoSize(SG02);
end;

procedure TF_D12.SG03Snd;
var
  i : integer;
  S1 : String;
  f01,f02,f03 : Real;
  f11,f12,f13,ff : Real;
  f21,f22,f23 : Real;
begin
  KC_SGClear(1,SG03);
  i :=1;
  f01:=0;
  f02:=0;
  f03:=0;
  f21:=0;
  f22:=0;
  f23:=0;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if ('3' <> D.F19.FieldByName('BEF19101').AsString) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    if (CB004.ItemIndex <> 0) and (CB004.Text <> D.F19.FieldByName('BEF19004').AsString) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F19.FieldByName('BEF19002').AsString)) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    S1 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.F19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      S1 := D.F05.FieldByName('BEF05003').ASString;
    D.OpenF16(D.F19.FieldByName('BEF19001').ASString);
    SL01.Assign(D.F16.FieldByName('BEF16901'));
    ff := KC_StrToFloat(D.F16.FieldByName('BEF16304').ASString);
    f11:= KC_StrToFloat(D.F19.FieldByName('BEF19302').ASString);
    f12:= KC_StrToFloat(D.F19.FieldByName('BEF19303').ASString);
    f13:= KC_StrToFloat(D.F19.FieldByName('BEF19306').ASString);
    SG03.Cells[00,i] :=  F.Station(D.F19.FieldByName('BEF19101').ASString); //  'Running';
    SG03.Cells[01,i] :=            D.F19.FieldByName('BEF19002').ASString;
    SG03.Cells[02,i] :=            D.F19.FieldByName('BEF19004').ASString;
    SG03.Cells[03,i] :=            D.F19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                                   D.F19.FieldByName('BEF19007').ASString;     // 'Run
    SG03.Cells[04,i] :=            S1; //  級別
    SG03.Cells[05,i] :=      F.Yld(SL01);
    SG03.Cells[06,i] :=            D.F19.FieldByName('BEF19302').ASString;
    SG03.Cells[07,i] :=            FloatToStr(f11*ff/1000);
    SG03.Cells[08,i] :=            D.F19.FieldByName('BEF19303').ASString;
    SG03.Cells[09,i] :=            FloatToStr(f12*ff/1000);
    SG03.Cells[10,i] :=            D.F19.FieldByName('BEF19306').ASString;
    SG03.Cells[11,i] :=            FloatToStr(f13*ff/1000);
    SG03.Cells[12,i] :=            D.F16.FieldByName('BEF16304').ASString;
    f01:=f01+f11;
    f02:=f02+f12;
    f03:=f03+f13;
    f21:=f21+f11*ff;
    f22:=f22+f12*ff;
    f23:=f23+f13*ff;
    D.F19.Next;
    inc(i);
  End;
  SG03.Cells[05,i] := '合計';
  SG03.Cells[06,i] := FloatToStr(f01);
  SG03.Cells[07,i] := FloatToStr(f21/1000);
  SG03.Cells[08,i] := FloatToStr(f02);
  SG03.Cells[09,i] := FloatToStr(f22/1000);
  SG03.Cells[10,i] := FloatToStr(f03);
  SG03.Cells[11,i] := FloatToStr(f23/1000);
  SG03.RowCount := i+1;
  KC_ColAutoSize(SG03);
end;

procedure TF_D12.B_OKClick(Sender: TObject);
begin
  D.OpenF05;
  OpenF16;
  OpenF19;
  SG01Snd;
  SG02Snd;
  SG03Snd;
end;

procedure TF_D12.CB004Change(Sender: TObject);
begin
  if not D.F16.Active Then Exit;
  if not D.F19.Active Then Exit;
  SG01Snd;
  SG02Snd;
  SG03Snd;
end;

procedure TF_D12.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
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

procedure TF_D12.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_D12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D12.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D12.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D12.xls');
  W := V.Workbooks[1].WorkSheets['現場未褙膜'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
  W := V.Workbooks[1].WorkSheets['現場已褙膜'];
  For j:=0 to SG02.RowCount-1 do
  for i:=0 to SG02.ColCount-1 do
    if (SG02.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG02.Cells[i,j];
  W := V.Workbooks[1].WorkSheets['庫房'];
  For j:=0 to SG03.RowCount-1 do
  for i:=0 to SG03.ColCount-1 do
    if (SG03.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG03.Cells[i,j];
end;

procedure TF_D12.CB002Change(Sender: TObject);
begin
  CB004Ld;
end;

end.

