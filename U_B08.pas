unit U_B08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, Math;

type
  TF_B08 = class(TForm)
    Panel1: TPanel;
    L_Kind: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    Splitter1: TSplitter;
    SG01: TStringGrid;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel4: TPanel;
    Panel6: TPanel;
    E_BDaT: TEdit;
    E_EDaT: TEdit;
    Panel7: TPanel;
    SG02: TStringGrid;
    Splitter2: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    E_001: TEdit;
    Label2: TLabel;
    CB_003: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    L_004: TLabel;
    L_005: TLabel;
    E_006: TEdit;
    Label6: TLabel;
    B_001: TButton;
    Panel12: TPanel;
    Panel11: TPanel;
    Label7: TLabel;
    E_ERun: TEdit;
    E_BRun: TEdit;
    Splitter3: TSplitter;
    SG03: TStringGrid;
    Panel13: TPanel;
    Panel14: TPanel;
    SG04: TStringGrid;
    B_002: TButton;
    B_003: TButton;
    procedure FormShow(Sender: TObject);
    procedure B_001Click(Sender: TObject);
    procedure SB_InquireClick(Sender: TObject);
    procedure B_002Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG04DblClick(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03DblClick(Sender: TObject);
    procedure B_003Click(Sender: TObject);
  private
    { Private declarations }
    SL01 : TStringList;
    Kind : Integer;
    procedure C_Kind(CC_Kind : Byte);
    procedure OpenF03;
    procedure OpenF28;
    procedure OpenF16;
    procedure OpenF05(S1 : String);
    procedure CB003Lad;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG03Ini;
    procedure SG04Ini;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG04Snd;
    procedure Updata;
    procedure DelF28;
    procedure SveF28;
    function  GetNo : String;
  public
    { Public declarations }
  end;

var
  F_B08: TF_B08;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_B08.SG04Ini;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[00,00] := '狀態';     //
  SG04.Cells[01,00] := 'No';       //
  SG04.Cells[02,00] := '使用膠量'; //
  SG04.Cells[03,00] := '總膠量';   //
  SG04.Cells[04,00] := '料號';     //
  SG04.Cells[05,00] := 'B/M/E';    //
  KC_ColAutoSize(SG04);
end;

procedure TF_B08.SG03Ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,00] := 'Run';       // BEF16001
  SG03.Cells[01,00] := '上下膠 No'; // BEF16402
  SG03.Cells[02,00] := 'UV膠使用';  // BEF16401
  SG03.Cells[03,00] := '使用長度';  // BEF16302
  KC_ColAutoSize(SG03);
end;

procedure TF_B08.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,00] := 'No';       // BEF28001
  SG02.Cells[01,00] := '料號';     // BEF28003
  SG02.Cells[02,00] := '期初膠量'; // BEF28004
  SG02.Cells[03,00] := '使用合計'; // BEF28005
  SG02.Cells[04,00] := '剩餘膠量'; // BEF28006
  KC_ColAutoSize(SG02);
end;

procedure TF_B08.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,00] := 'Line';     // BEF12002
  SG01.Cells[01,00] := 'UV膠料號'; // BEF12006
  SG01.Cells[02,00] := '剩餘膠量'; // BEF12007
  SG01.Cells[03,00] := '目前膠桶'; // BEF12008
  SG01.Cells[04,00] := 'Sub';      // BEF12004
  KC_ColAutoSize(SG01);
end;

procedure TF_B08.OpenF28;
begin
  KC_T3Close(D.F28,D.SC);
  D.F28.CommandText := 'SELECT * FROM BEFF28 Where BEF28001 >= '''+E_BDaT.Text+
                                           ''' and BEF28001 <= '''+E_EDaT.Text+
                                     'z'' Order by BEF28001';
  KC_T3OPEN(D.F28,D.SC);
  D.F28.First;
end;

procedure TF_B08.SG01Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  D.F12.First;
  While not D.F12.eof do
  Begin
    SG01.Cells[00,i] := D.F12.FieldByName('BEF12002').AsString;
    SG01.Cells[01,i] := D.F12.FieldByName('BEF12006').AsString;
    SG01.Cells[02,i] := D.F12.FieldByName('BEF12007').AsString;
    SG01.Cells[03,i] := D.F12.FieldByName('BEF12008').AsString;
    SG01.Cells[04,i] := D.F12.FieldByName('BEF12004').AsString;
    inc(i);
    D.F12.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B08.OpenF16;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF16 With (INDEX(BEFF16_402)) '+
                        'Where BEF16402 = '''+SG02.Cells[00,SG02.Row]+''' Order by BEF16001';
  case Kind of
    0 : SQL := 'Select * From BEFF16 With (INDEX(PK_BEFF16)) '+
                        'Where BEF16001 >= '''+E_BRun.Text+
                      ''' and  BEF16001 <= '''+E_ERun.Text+
                 'z'' Order by BEF16001';
    else if (SG02.Cells[00,SG02.Row]='') Then Exit;
  End;
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_B08.OpenF03;
begin
  KC_T3Close(D.F03,D.SC);
  D.F03.CommandText := 'SELECT * FROM BEFF03 Where BEF03000 >= ''0'' and BEF03000 <= ''1'' Order by  BEF03001';
  KC_T3OPEN(D.F03,D.SC);
  D.F03.First;
end;

procedure TF_B08.Updata;
begin
  E_006.Text    := SG01.Cells[02,SG01.Row];
  L_004.Caption := SG01.Cells[02,SG01.Row];
  if (Kind = 0) Then Exit;
  if (SG02.Cells[0,SG02.Row] = '') Then Exit;
  if D.F28.Locate('BEF28001',SG02.Cells[0,SG02.Row], [loCaseInsensitive]) Then
  Begin
     E_001.Text    := D.F28.FieldByName('BEF28001').AsString;
    CB_003.Text    := D.F28.FieldByName('BEF28003').AsString;
     E_006.Text    := D.F28.FieldByName('BEF28006').AsString;
     L_004.Caption := D.F28.FieldByName('BEF28004').AsString;
     L_005.Caption := D.F28.FieldByName('BEF28005').AsString;
  End;
end;

procedure TF_B08.SG04Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG04);
  case Kind of
    0 : Begin
          SG04.Cells[02,00] := '剩餘膠量'; //
          OpenF03;
          i := 1;
          D.F03.First;
          While not D.F03.eof do
          Begin
            if (CB_003.Text <> D.F03.FieldByName('BEF03002').AsString) Then
            Begin
              D.F03.Next;
              Continue;
            End;
            SG04.Cells[00,i] := F.Running00(D.F03.FieldByName('BEF03000').AsString);
            SG04.Cells[01,i] := D.F03.FieldByName('BEF03001').AsString;
            SG04.Cells[02,i] := D.F03.FieldByName('BEF03103').AsString;
            SG04.Cells[03,i] := D.F03.FieldByName('BEF03102').AsString;
            SG04.Cells[04,i] := D.F03.FieldByName('BEF03002').AsString;
            if ((SG04.Cells[00,i] = 'Running') or
                (SG04.Cells[00,i] = 'Hold')) and
                (D.F03.FieldByName('BEF03103').ASFloat = 0) Then
            SG04.Cells[02,i] := D.F03.FieldByName('BEF03102').AsString;
            SG04.Cells[05,i] := '';
            if ((SG01.Cells[3,SG01.Row] <> '') and (SG01.Cells[3,SG01.Row]=SG04.Cells[01,i])) Then
              SG04.Cells[05,i] := 'B';
            inc(i);
            D.F03.Next;
          End;
          SG04.RowCount := iif(i<=1,2,i);
          B_003Click(Self);
        End;
  else  if D.F28.Locate('BEF28001',SG02.Cells[0,SG02.Row], [loCaseInsensitive]) Then
        Begin
          SG04.Cells[02,00] := '使用膠量'; //
          SL01.Assign(D.F28.FieldByName('BEF28999'));
          for i:=0 to SL01.Count-1 do
          Begin
            D.OpenF03(KC_GetSubStr(#255,SL01.Strings[i],1));
            SG04.Cells[00,i+1] := F.Running00(D.F03.FieldByName('BEF03000').AsString);
            SG04.Cells[01,i+1] := KC_GetSubStr(#255,SL01.Strings[i],1);
            SG04.Cells[02,i+1] := KC_GetSubStr(#255,SL01.Strings[i],2);
            SG04.Cells[03,i+1] := D.F03.FieldByName('BEF03102').AsString;
            SG04.Cells[04,i+1] := D.F03.FieldByName('BEF03002').AsString;
            SG04.Cells[05,i+1] := KC_GetSubStr(#255,SL01.Strings[i],3);
          End;
          SG04.RowCount := iif(SL01.Count=0,2,SL01.Count+1);
        End;
  End;
  KC_ColAutoSize(SG04);
end;

procedure TF_B08.SG03Snd;
var
  i : integer;
begin
  OpenF16;
  i := 1;
  KC_SGClear(1,SG03);
  SG03.RowCount := 2;
  if ((Kind<>0) and (SG02.Cells[00,SG02.Row]='')) Then Exit;
  D.F16.First;
  While not D.F16.eof do
  Begin
    if (SG01.Cells[00,SG01.Row]<>D.F16.FieldByName('BEF16005').AsString) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SG03.Cells[00,i] := D.F16.FieldByName('BEF16001').AsString;
    SG03.Cells[01,i] := D.F16.FieldByName('BEF16402').AsString;
    SG03.Cells[02,i] := D.F16.FieldByName('BEF16401').AsString;
    SG03.Cells[03,i] := D.F16.FieldByName('BEF16302').AsString;
    inc(i);
    D.F16.Next;
  End;
  SG03.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG03);
end;

procedure TF_B08.SG02Snd;
var
  i : integer;
begin
  OpenF28;
  i := 1;
  KC_SGClear(1,SG02);
  D.F28.First;
  While not D.F28.eof do
  Begin
    if (D.F28.FieldByName('BEF28002').AsString <> SG01.Cells[0,SG01.Row]) then
    Begin
      D.F28.Next;
      Continue;
    End;
    SG02.Cells[00,i] := D.F28.FieldByName('BEF28001').AsString;
    SG02.Cells[01,i] := D.F28.FieldByName('BEF28003').AsString;
    SG02.Cells[02,i] := D.F28.FieldByName('BEF28004').AsString;
    SG02.Cells[03,i] := D.F28.FieldByName('BEF28005').AsString;
    SG02.Cells[04,i] := D.F28.FieldByName('BEF28006').AsString;
    inc(i);
    D.F28.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_B08.OpenF05(S1 : String);
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

procedure TF_B08.CB003Lad;
begin
  OpenF05(D.F00.FieldByName('BEF00202').ASString);
  CB_003.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB_003.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

function TF_B08.GetNo : String;
var
  i,SN : integer;
Begin
  Result := FormatDateTime('yyyymmdd',F.IdTime.DateTime)+SG01.Cells[04,SG01.Row];
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF28 Where BEF28001 >= '''+Result+
                                           ''' and BEF28001 <= '''+Result+
                                     'z'' Order by BEF28001';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  SN := 1;
  while not D.FP1.Eof do
  Begin
    i  := KC_StrToInt(KC_GetSubStr('-',D.FP1.FieldByName('BEF28001').AsString,2));
    SN := max(i+1,SN);
    D.FP1.Next;
  End;
  Result := Result+'-'+KC_IntFillChar(SN,2,'0');
end;

procedure TF_B08.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          panel1.color:=$0080FFFF;
          CB_003.Text := SG01.Cells[01,SG01.Row];
          E_001 .Text := GetNo;
          TbStpEdit(True,F_B08,['TEdit']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          panel1.color:= clBtnFace;
          TbStpEdit(True,F_B08,['TEdit']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'Inquire';
          panel1.color:= clBtnFace;
          TbStpEdit(False,F_B08,['TEdit']);
          SB_Inquire.Down := True;
        End;
    End;
    E_BDaT.Enabled := True;
    E_EDaT.Enabled := True;
    E_BRun.Enabled := True;
    E_ERun.Enabled := True;
    SG03Snd;
    SG04Snd;
    Updata;
End;

procedure TF_B08.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  SL01 := TStringList.Create;
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))-30;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime));
  E_BDaT.Text := FormatDateTime('yyyymmdd',D1);
  E_EDaT.Text := FormatDateTime('yyyymmdd',D2);
  E_BRun.Text := KC_GetDayDSP(D1);
  E_ERun.Text := KC_GetDayDSP(D2);
  D.OpenF00;
  D.OpenF12('成型站');
  CB003Lad;
  SG01Ini;
  SG02Ini;
  SG03Ini;
  SG04Ini;
  SG01Snd;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_B08.B_001Click(Sender: TObject);
begin
  SG02Snd;
end;

procedure TF_B08.DelF28;
var
  i : integer;
  SQL : String;
begin
  if not (2 = kind) Then Exit;
  if (SG02.Cells[0,SG02.Row] = '') Then Exit;
  if not D.F28.Locate('BEF28001',SG02.Cells[0,SG02.Row], [loCaseInsensitive]) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.F28.Delete;
  D.F28.ApplyUpdates(-1);
  SQL := 'UpDate BEFF16 Set BEF16401 = 0 , BEF16402 = '''' Where BEF16402 = '''+SG02.Cells[0,SG02.Row]+'''';
  KC_T3ExecSQL(SQL,D.SC);
  for i:=1 to SG04.RowCount-1 do
  Begin
    SQL := 'UpDate BEFF03 Set BEF03000 = '''+iif(SG04.Cells[01,i]=SG01.Cells[03,i],'1','0')+''' Where BEF03001 = '''+SG04.Cells[01,i]+'''';
    KC_T3ExecSQL(SQL,D.SC);
  End;
  D.OpenF12('成型站');
  SG01Snd;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_B08.SveF28;
var
  i : integer;
  SQL : String;
  ENo : String;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  SL01.Clear;
  for i:=1 to SG04.RowCount-1 do
  Begin
    if (SG04.Cells[05,i] = '') Then Continue;
    SL01.Add(SG04.Cells[01,i]+#255+
             SG04.Cells[02,i]+#255+
             SG04.Cells[05,i])
  End;
  case kind of
   0 : D.F28.Append;
   1 : D.F28.edit;
  End;
  D.F28.FieldByName('BEF28001').AsString := E_001.Text;
  D.F28.FieldByName('BEF28002').AsString :=SG01.Cells[0,SG01.Row];
  D.F28.FieldByName('BEF28003').AsString :=CB_003.Text;
  D.F28.FieldByName('BEF28004').AsString := L_004.Caption;
  D.F28.FieldByName('BEF28005').AsString := L_005.Caption;
  D.F28.FieldByName('BEF28006').AsString := E_006.Text;
  D.F28.FieldByName('BEF28999').AsString := SL01.Text;
  D.F28.ApplyUpdates(-1);
  for i:=1 to SG03.RowCount-1 do
  if (SG03.Cells[01,i] = E_001.Text) and  (SG03.Cells[01,i]<>'') Then
  Begin
    SQL := 'UpDate BEFF16 Set BEF16401 = '  +SG03.Cells[02,i]+
                           ', BEF16402 = '''+SG03.Cells[01,i]+
                    ''' Where BEF16001 = '''+SG03.Cells[00,i]+'''';
    KC_T3ExecSQL(SQL,D.SC);
  End;
  ENo := '';
  for i:=1 to SG04.RowCount-1 do
  Begin
    if (SG04.Cells[05,i] = '') Then Continue;
    SQL := 'UpDate BEFF03 Set BEF03000 = '''+iif(SG04.Cells[05,i]='E','1','2')+
                    ''' Where BEF03001 = '''+SG04.Cells[01,i]+'''';
    KC_T3ExecSQL(SQL,D.SC);
    if (SG04.Cells[05,i]='E') Then ENo := SG04.Cells[01,i];
  End;
  if (kind = 0) Then
  Begin
    SQL := 'UpDate BEFF12 Set BEF12006 = '''+CB_003.Text+
                         ''', BEF12007 = '''+ E_006.Text+
                         ''', BEF12008 = '''+ ENo+
                    ''' Where BEF12001 = ''成型站'' and BEF12002 = '''+SG01.Cells[00,SG01.Row]+'''';
    KC_T3ExecSQL(SQL,D.SC);
  End;
  D.OpenF12('成型站');
  SG01Snd;
  SG02Snd;
  C_Kind(2);
end;

procedure TF_B08.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then DelF28;
  if (TControl(Sender).Name = 'B_Save'    ) Then SveF28;
end;

procedure TF_B08.B_002Click(Sender: TObject);
begin
  SG03Snd;
end;

procedure TF_B08.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
end;

procedure TF_B08.SG04DblClick(Sender: TObject);
var
  B : Boolean;
  i : integer;
begin
  if (SG04.Cells[00,SG04.Row] = '')  Then Exit;
  if (SG04.Cells[05,SG04.Row] = 'B') Then Exit;
  if (SG04.Cells[05,SG04.Row] = 'E') Then Begin SG04.Cells[05,SG04.Row] := '';  B_003Click(Sender); Exit; End;
  if (SG04.Cells[05,SG04.Row] = '' ) Then Begin SG04.Cells[05,SG04.Row] := 'M'; B_003Click(Sender); Exit; End;
  B := False;
  if (SG04.Cells[05,SG04.Row] = 'M') Then
    for i:=1 to SG04.RowCount-1 do
      if (SG04.Cells[05,i] = 'E') Then B := True;
  SG04.Cells[05,SG04.Row] := iif(B,'','E');
  B_003Click(Sender);
end;

procedure TF_B08.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd;
  SG03Snd;
  SG04Snd;
  Updata;
  B_003Click(Sender);
end;

procedure TF_B08.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG02Snd;
  SG03Snd;
  SG04Snd;
  Updata;
  B_003Click(Sender);
end;

procedure TF_B08.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG03Snd;
  SG04Snd;
  Updata;
  B_003Click(Sender);
end;

procedure TF_B08.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG03Snd;
  SG04Snd;
  Updata;
  B_003Click(Sender);
end;

procedure TF_B08.SG03DblClick(Sender: TObject);
begin
  if (SG03.Cells[00,SG03.Row] = '') Then Exit;
  if((SG03.Cells[01,SG03.Row] <> '') and
     (SG03.Cells[01,SG03.Row] <> E_001.Text))Then Exit;
  SG03.Cells[01,SG03.Row] := iif(SG03.Cells[01,SG03.Row]='',E_001.Text,'');
  KC_ColAutoSize(SG03);
  B_003Click(Sender);
end;

procedure TF_B08.B_003Click(Sender: TObject);
var
  Sum : Real;
  SLen : Real;
  i : integer;
begin
  Sum := KC_StrToFloat(L_004.Caption);
  Sum := Sum-KC_StrToFloat(E_006.Text);
  for i:=1 to SG04.RowCount-1 do
  Begin
    if (SG04.Cells[01,i]=SG01.Cells[3,SG01.Row]) Then Continue;
    if (SG04.Cells[05,i]='') Then Continue;
    Sum := Sum+KC_StrToFloat(SG04.Cells[02,i]);
    (*
    if (SG04.Cells[05,i] = 'E') Then
      Sum := Sum+(KC_StrToFloat(SG04.Cells[02,i])-KC_StrToFloat(E_006.Text));
    *)
  End;
  L_005.Caption := format('%0.2f',[Sum]);
  SLen := 0;
  for i:=1 to SG03.RowCount-1 do
  Begin
    if (SG03.Cells[01,i] = E_001.Text) and  (SG03.Cells[01,i]<>'') Then
      SLen := SLen+KC_StrToFloat(SG03.Cells[03,i]);
  End;
  if (SLen=0) Then Exit;
  for i:=1 to SG03.RowCount-1 do
  Begin
    SG03.Cells[02,i] := '';
    if (SG03.Cells[01,i] = E_001.Text) and  (SG03.Cells[01,i]<>'') Then
      SG03.Cells[02,i] := format('%0.2f',[Sum*KC_StrToFloat(SG03.Cells[03,i])/SLen]);
  End;
end;
end.

