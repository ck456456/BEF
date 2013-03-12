unit U_B09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, DB, IdMessage;

type
  TF_B09 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    E_H001: TEdit;
    E_C001: TEdit;
    E_H002: TEdit;
    E_C002: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    CB_Type: TComboBox;
    SG01: TStringGrid;
    Splitter1: TSplitter;
    SG02: TStringGrid;
    SG03: TStringGrid;
    Splitter2: TSplitter;
    SG04: TStringGrid;
    B_Save: TBitBtn;
    L_000: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SL01,SL02 : TStringList;
    AMsg : TIdMessage;
    procedure SG01Ini(TSG : TStringGrid);
    procedure SG02Ini(TSG : TStringGrid);
    procedure SG01Snd(S1 : String;TSG : TStringGrid);
    procedure SG02Snd(S1 : String;TSG : TStringGrid);
    procedure OpenF16(S1 : String);
    procedure OpenG19(S1 : String);
    procedure UpData(TSG: TStringGrid);
    function  ChkData(S1 : String) : Boolean;
    procedure AlertMail;
  public
    { Public declarations }
  end;

var
  F_B09: TF_B09;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_B09.AlertMail;
var
  S0,S1 : String;
  i,j : integer;
begin
  if (D.F00.FieldByName('BEF00307').AsString<>'T') then Exit;

  S1 := '';
  SL01.Clear;
  for j:=0 to SG03.ColCount-1 do S1 := S1 + SG03.Cells[j,0] + #9;
  SL01.Add(S1);
  for i:=1 to SG03.RowCount-1 do
  Begin
    if (SG03.Cells[00,i] = '') Then Continue;
    S1 := '';
    for j:=0 to SG03.ColCount-1 do S1 := S1 + SG03.Cells[j,i] + #9;
    SL01.Add(S1);
  End;

  S1 := '';
  SL02.Clear;
  for j:=0 to SG04.ColCount-1 do S1 := S1 + SG04.Cells[j,0] + #9;
  SL02.Add(S1);
  for i:=1 to SG04.RowCount-1 do
  Begin
    if (SG04.Cells[00,i] = '') Then Continue;
    S1 := '';
    for j:=0 to SG04.ColCount-1 do S1 := S1 + SG04.Cells[j,i] + #9;
    SL02.Add(S1);
  End;
  if ((SL01.Count=1) and (SL02.Count=1)) then Exit;
  AMsg.Body.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
  AMsg.Body.Add('<HTML><HEAD><TITLE></TITLE>');
  AMsg.Body.Add('<META http-equiv=Content-Type content="text/html; charset=big5">');
  AMsg.Body.Add('<META content="MSHTML 6.00.2800.1555" name=GENERATOR></HEAD>');
  AMsg.Body.Add('<BODY>');
  AMsg.Body.Add('<TABLE id=dgrdByItem');
  AMsg.Body.Add('style="BORDER-RIGHT: #dedfde 1px; BORDER-TOP: #dedfde 1px; FONT-SIZE: 10pt; BORDER-LEFT: #dedfde 1px; WIDTH: 100%; COLOR: black; BORDER-BOTTOM: #dedfde 1px; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: white"');
  AMsg.Body.Add('borderColor=#dedfde cellSpacing=0 cellPadding=4 rules=all border=1>');
  AMsg.Body.Add('<TBODY>');
  for i:=0 to SL01.Count-1 do
  Begin
    if ((i mod 2) =  0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de">');
    if ((i mod 2) <> 0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">');
    if  (i  = 0)        Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #6b696b; FONT-WEIGHT: bold; COLOR: white">');
    S0 := SL01.Strings[i];
    for j:=1 to KC_SCount(#9,S0) do
      AMsg.Body.Add('<TD>'+KC_GetSubStr(#9,S0,j)+'</TD>');
    AMsg.Body.Add('</TR>');
  End;
  AMsg.Body.Add('</TBODY></TABLE></FONT></DIV>');

  AMsg.Body.Add('<TABLE id=dgrdByItem');
  AMsg.Body.Add('style="BORDER-RIGHT: #dedfde 1px; BORDER-TOP: #dedfde 1px; FONT-SIZE: 10pt; BORDER-LEFT: #dedfde 1px; WIDTH: 100%; COLOR: black; BORDER-BOTTOM: #dedfde 1px; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: white"');
  AMsg.Body.Add('borderColor=#dedfde cellSpacing=0 cellPadding=4 rules=all border=1>');
  AMsg.Body.Add('<TBODY>');
  for i:=0 to SL02.Count-1 do
  Begin
    if ((i mod 2) =  0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de">');
    if ((i mod 2) <> 0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">');
    if  (i  = 0)        Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #6b696b; FONT-WEIGHT: bold; COLOR: white">');
    S0 := SL02.Strings[i];
    for j:=1 to KC_SCount(#9,S0) do
      AMsg.Body.Add('<TD>'+KC_GetSubStr(#9,S0,j)+'</TD>');
    AMsg.Body.Add('</TR>');
  End;
  AMsg.Body.Add('</TBODY></TABLE></FONT></DIV>');
  AMsg.Body.Add('<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=細明體 color=#008000');
  AMsg.Body.Add('size=2></FONT>&nbsp;</DIV></BODY></HTML>');
  AMsg.Subject := '扣留警示信件';
  AMsg.ContentType :='text/html';
  AMsg.From.Address := 'BEF_Alert@prodisc.com.tw';
  AMsg.Sender.Address := 'BEF_Alert';
  AMsg.Recipients.EMailAddresses := D.F00.FieldByName('BEF00302').AsString;
  // AMsg.Recipients.EMailAddresses := '86407@prodisc.com.tw';
  F.IdSMTP.Host := 'TWN-EXC-1';
  F.IdSMTP.Connect;
  try
    F.IdSMTP.Send(AMsg);
  except
    On E:Exception Do
    Begin
      // ShowMessage('例外發生:'+E.Message);
    End;
  end;
  F.IdSMTP.Disconnect;
  //
End;

procedure TF_B09.SG01Ini(TSG : TStringGrid);
Begin
  KC_SGClear(0,TSG);
  TSG.Cells[00,0] := '成型站';   // BEF16101
  TSG.Cells[01,0] := 'Run';      // BEF16001
  TSG.Cells[02,0] := '產品別';   // BEF16002
  TSG.Cells[03,0] := '料號';     // BEF16003
  TSG.Cells[04,0] := '級別';     // BEF16308
  TSG.Cells[05,0] := '寬幅';     // BEF16304
  TSG.Cells[06,0] := '收料';     // BEF16303
  TSG.Cells[07,0] := '未褙';     // BEF16306
  TSG.Cells[08,0] := '扣留人員'; // BEF16403
  TSG.Cells[09,0] := '扣留原因'; // BEF16404
  TSG.Cells[10,0] := '取消人員'; // BEF16405
  TSG.Cells[11,0] := '取消原因'; // BEF16406
  TSG.Cells[12,0] := 'QANot';    // BEF16499
  KC_ColAutoSize(TSG);
End;

procedure TF_B09.SG02Ini(TSG : TStringGrid);
Begin
  KC_SGClear(0,TSG);
  TSG.Cells[00,0] := '褙膜站';   // BEF19101
  TSG.Cells[01,0] := 'Run';      // BEF19001+BEF19007+BEF19500
  TSG.Cells[02,0] := '產品別';   // BEF19002
  TSG.Cells[03,0] := '料號';     // BEF19003
  TSG.Cells[04,0] := '成品';     // BEF19002 目標料號 -> 級別
  TSG.Cells[05,0] := '長度';     // BEF19501
  TSG.Cells[06,0] := '寬幅';     // BEF19502
  TSG.Cells[07,0] := 'm2';       // BEF19306
  TSG.Cells[08,0] := '扣留人員'; // BEF19601
  TSG.Cells[09,0] := '扣留原因'; // BEF19602
  TSG.Cells[10,0] := '取消人員'; // BEF19603
  TSG.Cells[11,0] := '取消原因'; // BEF19604
  KC_ColAutoSize(TSG);
End;

procedure TF_B09.OpenF16(S1 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 With (INDEX(BEFF16_101)) Where BEF16101 = '''+S1+
                                       ''' Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

procedure TF_B09.SG01Snd(S1 : String;TSG : TStringGrid);
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,TSG);
  OpenF16(S1);
  While not D.F16.Eof do
  Begin
    TSG.Cells[00,i] :=  F.Running01(D.F16.FieldByName('BEF16101').ASString); //  Running
    TSG.Cells[01,i] :=          D.F16.FieldByName('BEF16001').ASString;  //  Run';
    TSG.Cells[02,i] :=          D.F16.FieldByName('BEF16002').ASString;  //  Run';
    TSG.Cells[03,i] :=          D.F16.FieldByName('BEF16003').ASString;  //  Run';
    TSG.Cells[04,i] :=          D.F16.FieldByName('BEF16308').ASString;  //  級別';
    TSG.Cells[05,i] :=          D.F16.FieldByName('BEF16304').ASString;  //  級別';
    TSG.Cells[06,i] :=          D.F16.FieldByName('BEF16303').ASString;  //  使用';
    TSG.Cells[07,i] :=          D.F16.FieldByName('BEF16306').ASString;  //  收料';
    TSG.Cells[08,i] :=          D.F16.FieldByName('BEF16403').ASString;
    TSG.Cells[09,i] :=          D.F16.FieldByName('BEF16404').ASString;
    TSG.Cells[10,i] :=          D.F16.FieldByName('BEF16405').ASString;
    TSG.Cells[11,i] :=          D.F16.FieldByName('BEF16406').ASString;
    TSG.Cells[12,i] :=          D.F16.FieldByName('BEF16499').ASString;  //  損耗';
    D.F16.Next;
    inc(i);
  End;
  TSG.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(TSG);
End;

procedure TF_B09.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_101)) Where BEF19101 = '''+S1+
                                       ''' Order by BEF19001,BEF19007,BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
End;

procedure TF_B09.SG02Snd(S1 : String;TSG : TStringGrid);
var
  SS : String;
  i  : integer;
  FF : Real;
begin
  i := 1;
  KC_SGClear(1,TSG);
  OpenG19(S1);
  While not D.G19.Eof do
  Begin
    SS := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS := D.F05.FieldByName('BEF05008').ASString;
    FF :=(D.G19.FieldByName('BEF19501').ASFloat*
          D.G19.FieldByName('BEF19502').ASFloat)/1000;
    TSG.Cells[00,i] := F.Station01(D.G19.FieldByName('BEF19101').ASString);
    TSG.Cells[01,i] := D.G19.FieldByName('BEF19001').ASString+#255+ //  'Run';
                       D.G19.FieldByName('BEF19007').ASString+#255+     // 'Run
                       D.G19.FieldByName('BEF19500').ASString;
    TSG.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    TSG.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    TSG.Cells[04,i] := SS; //  成品料號
    TSG.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString; // 長度
    TSG.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString; // 寬幅
    TSG.Cells[07,i] := format('%0.0f',[FF]); //  QA Note
    TSG.Cells[08,i] := D.G19.FieldByName('BEF19601').ASString; // 扣留人員
    TSG.Cells[09,i] := D.G19.FieldByName('BEF19602').ASString; // 扣留原因
    TSG.Cells[10,i] := D.G19.FieldByName('BEF19603').ASString; // 取消人員
    TSG.Cells[11,i] := D.G19.FieldByName('BEF19604').ASString; // 取消原因
    D.G19.Next;
    inc(i);
  End;
  TSG.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(TSG);
End;

procedure TF_B09.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  AMsg := TIdMessage.Create(nil);
  D.OpenF05;
  SG01Ini(SG01);
  SG02Ini(SG02);
  SG01Ini(SG03);
  SG02Ini(SG04);
  SG01Snd('2',SG01);
  SG02Snd('2',SG02);
  SG01Snd('A',SG03);
  SG02Snd('A',SG04);
  UpData(SG01);
end;

procedure TF_B09.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.StationToColor(Cells[ACol,ARow]);
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left , Rect.Top + 2, Cells[ACol,ARow]);
    if (gdFocused in State) then
    Begin
       Canvas.Brush.Color := clLime;
       Canvas.FillRect(Rect);
       Canvas.TextOut(Rect.Left , Rect.Top + 2, Cells[ACol,ARow]);
    End;
  End;
end;

procedure TF_B09.UpData(TSG: TStringGrid);
var
  S : String;
begin
  if ((TSG.Name = 'SG01') or (TSG.Name = 'SG03')) Then
  Begin
    D.OpenF16(TSG.Cells[01,TSG.Row]);
    L_000.Caption := '(成型)'+#255+TSG.Cells[01,TSG.Row];
    CB_Type.ItemIndex := 1;
    if (TSG.Name = 'SG03') Then CB_Type.ItemIndex := 0;
    E_H001.Text := D.F16.FieldByName('BEF16403').ASString;
    E_H002.Text := D.F16.FieldByName('BEF16404').ASString;
    E_C001.Text := D.F16.FieldByName('BEF16405').ASString;
    E_C002.Text := D.F16.FieldByName('BEF16406').ASString;
  End;
  if ((TSG.Name = 'SG02') or (TSG.Name = 'SG04')) Then
  Begin
    S := TSG.Cells[01,TSG.Row];
    D.OpenG19(KC_GetSubStr(#255,S,1),
              KC_GetSubStr(#255,S,2),
              KC_GetSubStr(#255,S,3));
    L_000.Caption := '(褙膜)'+#255+TSG.Cells[01,TSG.Row];
    CB_Type.ItemIndex := 1;
    if (TSG.Name = 'SG04') Then CB_Type.ItemIndex := 0;
    E_H001.Text := D.G19.FieldByName('BEF19601').ASString; // 扣留人員
    E_H002.Text := D.G19.FieldByName('BEF19602').ASString; // 扣留原因
    E_C001.Text := D.G19.FieldByName('BEF19603').ASString; // 取消人員
    E_C002.Text := D.G19.FieldByName('BEF19604').ASString; // 取消原因
  End;
end;

procedure TF_B09.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData(TStringGrid(Sender));
end;

procedure TF_B09.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData(TStringGrid(Sender));
end;

function  TF_B09.ChkData(S1 : String) : Boolean;
begin
  Result := True;
  if (CB_Type.ItemIndex = 0) and (E_H001.Text = '') Then Begin ShowMessage('請輸入扣留人員'); Result := False; Exit; End;
  if (CB_Type.ItemIndex = 0) and (E_H002.Text = '') Then Begin ShowMessage('請輸入扣留原因'); Result := False; Exit; End;
  if (CB_Type.ItemIndex = 1) and (E_C001.Text = '') Then Begin ShowMessage('請輸入取消人員'); Result := False; Exit; End;
  if (CB_Type.ItemIndex = 1) and (E_C002.Text = '') Then Begin ShowMessage('請輸入取消原因'); Result := False; Exit; End;
end;

procedure TF_B09.B_SaveClick(Sender: TObject);
var
  S,SQL : String;
begin
  if not ChkData(KC_GetSubStr(#9,L_000.Caption,2)) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  S := L_000.Caption;
  if (KC_GetSubStr(#255,S,1) = '(成型)') Then
    SQL := 'Update BEFF16 Set BEF16101 = '''+iif(CB_Type.ItemIndex = 0,'A','2')+
                          ''',BEF16403 = '''+E_H001.Text+
                          ''',BEF16404 = '''+E_H002.Text+
                          ''',BEF16405 = '''+E_C001.Text+
                          ''',BEF16406 = '''+E_C002.Text+
                    ''' Where BEF16001 = '''+KC_GetSubStr(#255,S,2)+'''';
  if (KC_GetSubStr(#255,S,1) = '(褙膜)') Then
    SQL := 'Update BEFG19 Set BEF19101 = '''+iif(CB_Type.ItemIndex = 0,'A','2')+
                          ''',BEF19601 = '''+E_H001.Text+
                          ''',BEF19602 = '''+E_H002.Text+
                          ''',BEF19603 = '''+E_C001.Text+
                          ''',BEF19604 = '''+E_C002.Text+
                    ''' Where BEF19001 = '''+KC_GetSubStr(#255,S,2)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,S,3)+
                      ''' and BEF19500 = '''+KC_GetSubStr(#255,S,4)+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  SG01Snd('2',SG01);
  SG02Snd('2',SG02);
  SG01Snd('A',SG03);
  SG02Snd('A',SG04);
  AlertMail;
end;

procedure TF_B09.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  AMsg.Free;
end;

end.


