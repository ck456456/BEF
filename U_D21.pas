unit U_D21;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D21 = class(TForm)
    P_Main: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    E_BRun: TEdit;
    E_ERun: TEdit;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel1: TPanel;
    SG01: TStringGrid;
    CB_Type: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
  private
    { Private declarations }
    V : Variant;
    procedure OpenF16;
    procedure SG01INI;
    procedure SG01Snd;
    function  GetRun(I1 : Integer) : String;
  public
    { Public declarations }
  end;

var
  F_D21: TF_D21;

implementation

uses U_D, U_KcPub, U_F, U_V03, U_V05, U_V08;

{$R *.dfm}

procedure TF_D21.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '成型站';           // BEF16001
  SG01.Cells[01,0] := 'Running';              // BEF16101
  SG01.Cells[02,0] := 'Working No.';      // BEF16006
  SG01.Cells[03,0] := 'Line';             // BEF16005
  SG01.Cells[04,0] := '級別';             // BEF16308
  SG01.Cells[05,0] := '目標料號';         // BEF16002
  SG01.Cells[06,0] := 'Process No';       // BEF16004
  SG01.Cells[07,0] := '實驗';             // BEF16007
  SG01.Cells[08,0] := '倉別';             // BEF16008
  SG01.Cells[09,0] := '寬幅(mm)';         // BEF16304
  SG01.Cells[10,0] := 'm*m';              // BEF16304
  SG01.Cells[11,0] := '使用長度';         // BEF16302
  SG01.Cells[12,0] := '收料長度';         // BEF16303
  SG01.Cells[13,0] := '檢驗寬幅';         // BEF16304
  SG01.Cells[14,0] := 'QA檢驗';           // BEF16305
  SG01.Cells[15,0] := '管底料';           // BEF16313
  SG01.Cells[16,0] := '損耗長度';         // BEF16306
  SG01.Cells[17,0] := '未褙膜長度';       // BEF16307
  SG01.Cells[18,0] := '首檢良率';         // BEF16309
  SG01.Cells[19,0] := '尾檢良率';         // BEF16310
  SG01.Cells[20,0] := '是否首捲';         // BEF16311
  SG01.Cells[21,0] := '異常原因';         // BEF16312
  SG01.Cells[22,0] := 'PET No';           // BEF16202
  SG01.Cells[23,0] := '上架長度(PET)';    // BEF16203
  SG01.Cells[24,0] := 'ROLLER No';        // BEF16204
  SG01.Cells[25,0] := 'UV燈照度';         // BEF16205
  SG01.Cells[26,0] := 'Start OPID';       // BEF16201
  SG01.Cells[27,0] := 'Start Note';       // BEF16299
  SG01.Cells[28,0] := 'Finish OPID';      // BEF16301
  SG01.Cells[29,0] := 'Finish Note';      // BEF16399
  SG01.Cells[30,0] := 'QANote';           // BEF16499
  SG01.Cells[31,0] := 'Begin Date time';  // BEF16102
  SG01.Cells[32,0] := 'Finish date Time'; // BEF16103
  SG01.Cells[33,0] := '褙膜站';           // BEF19007
  SG01.Cells[34,0] := 'Running';              // BEF19101
  SG01.Cells[35,0] := '目標料號';         // BEF19002
  SG01.Cells[36,0] := '判級料號';         // BEF19003
  SG01.Cells[37,0] := 'Process No';       // BEF19004
  SG01.Cells[38,0] := 'Line';             // BEF19005
  SG01.Cells[39,0] := 'Working No';       // BEF19006
  SG01.Cells[40,0] := '實驗';             // BEF19009
  SG01.Cells[41,0] := '上保 No';          // BEF19202
  SG01.Cells[42,0] := '下保 No';          // BEF19203
  SG01.Cells[43,0] := 'm*m';              // BEF16304
  SG01.Cells[44,0] := '使用長度';         // BEF19302
  SG01.Cells[45,0] := '收料長度';         // BEF19303
  SG01.Cells[46,0] := '餘料長度';         // BEF19304
  SG01.Cells[47,0] := '損耗';             // BEF19306
  SG01.Cells[48,0] := '上保損耗';         // BEF19307
  SG01.Cells[49,0] := '下保損耗';         // BEF19308
  SG01.Cells[50,0] := '是否首捲';         // BEF19309
  SG01.Cells[51,0] := '異常原因分析';     // BEF19310
  SG01.Cells[52,0] := '主檢驗員';         // BEF19401
  SG01.Cells[53,0] := '副檢驗員';         // BEF19402
  SG01.Cells[54,0] := 'Start OPID';       // BEF19201
  SG01.Cells[55,0] := 'Start Note';       // BEF19299
  SG01.Cells[56,0] := 'Finish OPID';      // BEF19301
  SG01.Cells[57,0] := 'Finish Note';      // BEF19399
  SG01.Cells[58,0] := 'QANote';           // BEF19499
  SG01.Cells[59,0] := 'Begin  DateTime';  // BEF19102
  SG01.Cells[60,0] := 'Finish DateTime';  // BEF19103
  SG01.Cells[61,0] := '分條站';           // BEF19500
  SG01.Cells[62,0] := 'Running';              // BEF19101
  SG01.Cells[63,0] := '入庫單號';         // BEF19005
  SG01.Cells[64,0] := '分條單號';         // BEF19006
  SG01.Cells[65,0] := '出貨單號';         // BEF19008
  SG01.Cells[66,0] := '棧板編號';         // BEF19010
  SG01.Cells[67,0] := 'SN 位置(棧板)';    // BEF19011
  SG01.Cells[68,0] := '重量';             // BEF19012
  SG01.Cells[69,0] := '分條SN(來源)';     // BEF19201
  SG01.Cells[70,0] := '分條長度';         // BEF19501
  SG01.Cells[71,0] := '分條寬幅';         // BEF19502
  SG01.Cells[72,0] := '損耗長度';         // BEF19503
  SG01.Cells[73,0] := '損耗寬幅';         // BEF19504
  KC_ColAutoSize(SG01);
end;

procedure TF_D21.OpenF16;
var
  S1,S2 : String;
begin
  S1 := E_BRun.Text;
  S2 := iif(E_ERun.Visible,E_ERun.Text,E_BRun.Text);
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16001 >= '''+S1+
                                           ''' and BEF16001 <= '''+S2+
                                     'z'' Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

procedure TF_D21.SG01Snd;
var
  i : integer;
  B19,G19 : Boolean;
  f1,f2 : Real;
begin
  KC_SGClear(1,SG01);
  D.F16.First;
  i := 1;
  While not D.F16.Eof do
  Begin
    f1 := KC_StrToFloat(D.F16.FieldByName('BEF16304').ASString);
    f2 := KC_StrToFloat(D.F16.FieldByName('BEF16303').ASString);
    SG01.Cells[00,i] := D.F16.FieldByName('BEF16001').AsString;
    SG01.Cells[01,i] := F.Running01(D.F16.FieldByName('BEF16101').AsString);
    SG01.Cells[02,i] := D.F16.FieldByName('BEF16006').AsString;
    SG01.Cells[03,i] := D.F16.FieldByName('BEF16005').AsString;
    SG01.Cells[04,i] := D.F16.FieldByName('BEF16308').AsString;
    SG01.Cells[05,i] := D.F16.FieldByName('BEF16002').AsString;
    SG01.Cells[06,i] := D.F16.FieldByName('BEF16004').AsString;
    SG01.Cells[07,i] := D.F16.FieldByName('BEF16007').AsString;
    SG01.Cells[08,i] := D.F16.FieldByName('BEF16008').AsString;
    SG01.Cells[09,i] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[10,i] := format('%0.0f',[f1*f2/1000]);
    SG01.Cells[11,i] := D.F16.FieldByName('BEF16302').AsString;
    SG01.Cells[12,i] := D.F16.FieldByName('BEF16303').AsString;
    SG01.Cells[13,i] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[14,i] := D.F16.FieldByName('BEF16305').AsString;
    SG01.Cells[15,i] := D.F16.FieldByName('BEF16313').AsString;
    SG01.Cells[16,i] := D.F16.FieldByName('BEF16306').AsString;
    SG01.Cells[17,i] := D.F16.FieldByName('BEF16307').AsString;
    SG01.Cells[18,i] := D.F16.FieldByName('BEF16309').AsString;
    SG01.Cells[19,i] := D.F16.FieldByName('BEF16310').AsString;
    SG01.Cells[20,i] := D.F16.FieldByName('BEF16311').AsString;
    SG01.Cells[21,i] := D.F16.FieldByName('BEF16312').AsString;
    SG01.Cells[22,i] := D.F16.FieldByName('BEF16202').AsString;
    SG01.Cells[23,i] := D.F16.FieldByName('BEF16203').AsString;
    SG01.Cells[24,i] := D.F16.FieldByName('BEF16204').AsString;
    SG01.Cells[25,i] := D.F16.FieldByName('BEF16205').AsString;
    SG01.Cells[26,i] := D.F16.FieldByName('BEF16201').AsString;
    SG01.Cells[27,i] := D.F16.FieldByName('BEF16299').AsString;
    SG01.Cells[28,i] := D.F16.FieldByName('BEF16301').AsString;
    SG01.Cells[29,i] := D.F16.FieldByName('BEF16399').AsString;
    SG01.Cells[30,i] := D.F16.FieldByName('BEF16499').AsString;
    SG01.Cells[31,i] := D.F16.FieldByName('BEF16102').AsString;
    SG01.Cells[32,i] := D.F16.FieldByName('BEF16103').AsString;
    B19 := False;
    D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
    While not D.F19.Eof do
    Begin
      B19 := True;
      f1 := KC_StrToFloat(D.F16.FieldByName('BEF16304').ASString);
      f2 := KC_StrToFloat(D.F19.FieldByName('BEF19303').ASString);
      SG01.Cells[33,i] := D.F19.FieldByName('BEF19007').AsString;
      SG01.Cells[34,i] := F.Station(D.F19.FieldByName('BEF19101').ASString);
      SG01.Cells[35,i] := D.F19.FieldByName('BEF19002').AsString;
      SG01.Cells[36,i] := D.F19.FieldByName('BEF19003').AsString;
      SG01.Cells[37,i] := D.F19.FieldByName('BEF19004').AsString;
      SG01.Cells[38,i] := D.F19.FieldByName('BEF19005').AsString;
      SG01.Cells[39,i] := D.F19.FieldByName('BEF19006').AsString;
      SG01.Cells[40,i] := D.F19.FieldByName('BEF19009').AsString;
      SG01.Cells[41,i] := D.F19.FieldByName('BEF19202').AsString;
      SG01.Cells[42,i] := D.F19.FieldByName('BEF19203').AsString;
      SG01.Cells[43,i] := format('%0.0f',[f1*f2/1000]);
      SG01.Cells[44,i] := D.F19.FieldByName('BEF19302').AsString;
      SG01.Cells[45,i] := D.F19.FieldByName('BEF19303').AsString;
      SG01.Cells[46,i] := D.F19.FieldByName('BEF19304').AsString;
      SG01.Cells[47,i] := D.F19.FieldByName('BEF19306').AsString;
      SG01.Cells[48,i] := D.F19.FieldByName('BEF19307').AsString;
      SG01.Cells[49,i] := D.F19.FieldByName('BEF19308').AsString;
      SG01.Cells[50,i] := D.F19.FieldByName('BEF19309').AsString;
      SG01.Cells[51,i] := D.F19.FieldByName('BEF19310').AsString;
      SG01.Cells[52,i] := D.F19.FieldByName('BEF19401').AsString;
      SG01.Cells[53,i] := D.F19.FieldByName('BEF19402').AsString;
      SG01.Cells[54,i] := D.F19.FieldByName('BEF19201').AsString;
      SG01.Cells[55,i] := D.F19.FieldByName('BEF19299').AsString;
      SG01.Cells[56,i] := D.F19.FieldByName('BEF19301').AsString;
      SG01.Cells[57,i] := D.F19.FieldByName('BEF19399').AsString;
      SG01.Cells[58,i] := D.F19.FieldByName('BEF19499').AsString;
      SG01.Cells[59,i] := D.F19.FieldByName('BEF19102').AsString;
      SG01.Cells[60,i] := D.F19.FieldByName('BEF19103').AsString;
      G19 := False;
      D.OpenG19(D.F19.FieldByName('BEF19001').AsString,D.F19.FieldByName('BEF19007').AsString);
      While not D.G19.Eof do
      Begin
        G19 := True;
        SG01.Cells[61,i] := D.G19.FieldByName('BEF19500').AsString;
        SG01.Cells[62,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);
        SG01.Cells[63,i] := D.G19.FieldByName('BEF19005').AsString;
        SG01.Cells[64,i] := D.G19.FieldByName('BEF19006').AsString;
        SG01.Cells[65,i] := D.G19.FieldByName('BEF19008').AsString;
        SG01.Cells[66,i] := D.G19.FieldByName('BEF19010').AsString;
        SG01.Cells[67,i] := D.G19.FieldByName('BEF19011').AsString;
        SG01.Cells[68,i] := D.G19.FieldByName('BEF19012').AsString;
        SG01.Cells[69,i] := D.G19.FieldByName('BEF19201').AsString;
        SG01.Cells[70,i] := D.G19.FieldByName('BEF19501').AsString;
        SG01.Cells[71,i] := D.G19.FieldByName('BEF19502').AsString;
        SG01.Cells[72,i] := D.G19.FieldByName('BEF19503').AsString;
        SG01.Cells[73,i] := D.G19.FieldByName('BEF19504').AsString;
        D.G19.Next;
        inc(i);
      End;
      D.F19.Next;
      if (not G19) Then inc(i);
    End;
    if (not B19) Then inc(i);
    D.F16.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
End;

procedure TF_D21.B_OKClick(Sender: TObject);
begin
  OpenF16;
  SG01Snd;
end;

procedure TF_D21.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D21.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D21.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

procedure TF_D21.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_D21.FormShow(Sender: TObject);
begin
  D.OpenF05;
  E_BRun.Text := KC_GetDayDSP(KC_B2Day(FormatDateTime('yyyymmdd', F.IdTime.DateTime))-1);
  E_ERun.Text := KC_GetDayDSP(KC_B2Day(FormatDateTime('yyyymmdd', F.IdTime.DateTime)));
  CB_TypeChange(Sender);
  SG01INI;
end;

procedure TF_D21.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

function  TF_D21.GetRun(I1 : Integer) : String;
var
  i     : integer;
  S1,S2,S3 : String;
begin
  Result := '';
  case I1 of
    0 : Begin
          S1 := SG01.Cells[00,SG01.Row];
          S2 := SG01.Cells[30,SG01.Row];
          i  := SG01.Row;
          While (i>0) and (S1='') do
          Begin
            Dec(i);
            S1 := SG01.Cells[00,i];
          End;
          Result := S1+#255+S2;
        End;
    1 : Begin
          S1 := SG01.Cells[00,SG01.Row];
          S2 := SG01.Cells[30,SG01.Row];
          S3 := SG01.Cells[56,SG01.Row];
          i  := SG01.Row;
          While (i>0) and (S1='') do
          Begin
            Dec(i);
            S1 := SG01.Cells[00,i];
          End;
          i  := SG01.Row;
          While (i>0) and (S2='') do
          Begin
            Dec(i);
            S2 := SG01.Cells[30,i];
          End;
          Result := S1+#255+S2+#255+S3;
        End;
  End;
end;

procedure TF_D21.SG01DblClick(Sender: TObject);
begin
  if (SG01.Cells[SG01.Col,SG01.Row] = '') Then Exit;
  case SG01.Col of
     0..29 : Begin
               F_V03 := TF_V03.Create(Application);
               F_V03.Kind := 3;
               F_V03.iStation := 10;
               F_V03.E_10001.Text  := SG01.Cells[0,SG01.Row];
               F_V03.ShowModal;
               F_V03.Free;
             End;
    30..55 : Begin
               if (SG01.Cells[30,SG01.Row] = '') Then Exit;
               F_V05 := TF_V05.Create(Application);
               F_V05.Kind := 3;
               F_V05.CB_Station.ItemIndex := 0;
               F_V05.Run  := GetRun(0);
               F_V05.ShowModal;
               F_V05.Free;
             End;
    56..68 : Begin
               if (SG01.Cells[56,SG01.Row] = '') Then Exit;
               F_V08 := TF_V08.Create(Application);
               F_V08.Kind := 3;
               F_V08.CB_Station.ItemIndex := 0;
               F_V08.E_007.Text := GetRun(1);
               F_V08.ShowModal;
               F_V08.Free;
             End;
  End;
end;

procedure TF_D21.CB_TypeChange(Sender: TObject);
begin
  E_ERun.Visible := (CB_Type.ItemIndex <> 0);
end;

end.



