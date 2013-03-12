unit U_V09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DB, Buttons;

type
  TF_V09 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    L_Run: TLabel;
    SG01: TStringGrid;
    B_Cut: TButton;
    CB_Cut: TComboBox;
    B_OK: TBitBtn;
    Label2: TLabel;
    L_Working: TLabel;
    procedure FormShow(Sender: TObject);
    procedure B_CutClick(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
    procedure SG01INI;
    procedure SG01Snd;
    procedure OpenG19; overload;
    procedure OpenG19(S1,S2 : String); overload;
    function  GetSN(I1 : Integer) : Integer;
  public
    { Public declarations }
  end;

var
  F_V09: TF_V09;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V09.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';      // BEF19101
  SG01.Cells[01,0] := '�ŧO';     // BEF19003 �ؼЮƸ� -> �ŧO
  SG01.Cells[02,0] := '�W��';     // BEF19002
  SG01.Cells[03,0] := '�Ƹ�';     // BEF19003
  SG01.Cells[04,0] := 'SN';       // BEF19500
  SG01.Cells[05,0] := '��������'; // BEF19501
  SG01.Cells[06,0] := '�����e�T'; // BEF19502
  SG01.Cells[07,0] := '�l�Ӫ���'; // BEF19503
  SG01.Cells[08,0] := '�l�Ӽe�T'; // BEF19504
  KC_ColAutoSize(SG01);
end;

procedure TF_V09.OpenG19(S1,S2 : String);
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+S1+
                                           ''' and BEF19007 = '''+S2+
                                      ''' Order By BEF19500';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_V09.OpenG19;
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+KC_GetSubStr(#255,L_Run.Caption,1)+
                                           ''' and BEF19007 = '''+KC_GetSubStr(#255,L_Run.Caption,2)+
                                           ''' and BEF19201 = '''+KC_GetSubStr(#255,L_Run.Caption,3)+
                                      ''' Order By BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V09.SG01Snd;
var
  i   : integer;
  SS1 : String;
begin
  i:=1;
  KC_SGClear(1,SG01);
  OpenG19;
  While not D.G19.Eof do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    SG01.Cells[00,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);//Running';;       // BEF19101
    SG01.Cells[01,i] := SS1;
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG01.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19500').ASString;
    SG01.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString;
    SG01.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    SG01.Cells[07,i] := D.G19.FieldByName('BEF19503').ASString;
    SG01.Cells[08,i] := D.G19.FieldByName('BEF19504').ASString;
    inc(i);
    D.G19.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_V09.FormShow(Sender: TObject);
begin
  SG01INI;
  SG01Snd;
end;

function  TF_V09.GetSN(I1 : Integer) : Integer;
begin
  inc(I1);
  D.FP1.First;
  While not D.FP1.Eof do
  Begin
    if (I1 > D.G19.FieldByName('BEF19500').ASInteger) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    if (I1 < D.G19.FieldByName('BEF19500').ASInteger) Then
    Begin
      Break;
    End;
    inc(I1);
    D.FP1.Next;
  End;
  Result := I1;
end;

procedure TF_V09.B_CutClick(Sender: TObject);
var
  f1,f2 : Real;
  i,SN : integer;
  SS1 : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  KC_SGClear(1,SG01);
  D.OpenG19(KC_GetSubStr(#255,L_Run.Caption,1),
            KC_GetSubStr(#255,L_Run.Caption,2),
            KC_GetSubStr(#255,L_Run.Caption,3));
  OpenG19(KC_GetSubStr(#255,L_Run.Caption,1),
          KC_GetSubStr(#255,L_Run.Caption,2));
  f1 := D.G19.FieldByName('BEF19502').ASfloat;
  f2 := D.G19.FieldByName('BEF19501').ASfloat;
  SN := 0;
  for i:=1 to CB_Cut.ItemIndex+2 do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
    Begin
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    End;
    SN:=GetSN(SN);
    SG01.Cells[00,i] := F.Station('5');
    SG01.Cells[01,i] := SS1;
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG01.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG01.Cells[04,i] := KC_IntFillChar(SN,2,'0');
    SG01.Cells[05,i] := format('%0.2f',[f2]);
    SG01.Cells[06,i] := format('%0.2f',[f1/(CB_Cut.ItemIndex+2)]);
    SG01.Cells[07,i] := '0';
    SG01.Cells[08,i] := '0';
  End;
  SG01.RowCount := CB_Cut.ItemIndex+3;
  KC_ColAutoSize(SG01);
end;

procedure TF_V09.B_OKClick(Sender: TObject);
var
  i : Integer;
  SQL : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.OpenG19(KC_GetSubStr(#255,L_Run.Caption,1),
            KC_GetSubStr(#255,L_Run.Caption,2),
            KC_GetSubStr(#255,L_Run.Caption,3));
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[00,i] = '') Then Continue;
    SQL := 'INSERT INTO BEFG19 (BEF19001,'+  // Run No.
                               'BEF19002,'+  // �ؼЮƸ�
                               'BEF19003,'+  // �P�ŮƸ�
                               'BEF19004,'+  // Process No
                               'BEF19006,'+  // �����渹
                               'BEF19007,'+  // Run SN
                               'BEF19008,'+  // �X�f�渹
                               'BEF19010,'+  // �̪O�s��
                               'BEF19011,'+  // SN ��m(�̪O)
                               'BEF19012,'+  // ���q
                               'BEF19101,'+  // 0.Hold 1.���Ƚ� 2.�w�Ƚ� 3.�w�� 4.�X�f
                               'BEF19201,'+  // ����SN  <- �ӷ�
                               'BEF19500,'+  // ����SN
                               'BEF19501,'+  // ��������
                               'BEF19502,'+  // �����e�T
                               'BEF19503,'+  // �l�Ӫ���
                               'BEF19504)'+  // �l�Ӽe�T
                      'VALUES ('''+D.F19.FieldByName('BEF19001').ASSTRING+''','+   // Run No.
                              ''''+D.F19.FieldByName('BEF19002').ASSTRING+''','+   // �ؼЮƸ�
                              ''''+D.F19.FieldByName('BEF19003').ASSTRING+''','+   // �P�ŮƸ�
                              ''''+D.F19.FieldByName('BEF19004').ASSTRING+''','+   // Process No
                              ''''+L_Working.Caption+''','+   // �����渹
                              ''''+D.F19.FieldByName('BEF19007').ASSTRING+''','+   // Run SN
                              ''''','+   // �X�f�渹
                              ''''+D.F19.FieldByName('BEF19010').ASSTRING+''','+   // �̪O�s��
                              ''''+D.F19.FieldByName('BEF19011').ASSTRING+''','+   // SN ��m(�̪O)
                              ''''+D.F19.FieldByName('BEF19012').ASSTRING+''','+   // ���q
                              ''''+'5'+''','+   // 0.Hold 1.���Ƚ� 2.�w�Ƚ� 3.�w�� 4.�X�f
                              ''''+KC_GetSubStr(#255,L_Run.Caption,3)+''','+   // ����SN  <- �ӷ�
                              ''''+SG01.Cells[04,i]+''','+   // ����SN
                              ''''+SG01.Cells[05,i]+''','+   // ��������
                              ''''+SG01.Cells[06,i]+''','+   // �����e�T
                              ''''+SG01.Cells[07,i]+''','+   // �l�Ӫ���
                              ''''+SG01.Cells[08,i]+''')';   // �l�Ӽe�T
    KC_T3ExecSQL(SQL,D.SC);
  End;
  SQL := 'UpDate BEFG19 Set BEF19101 = ''6'' Where BEF19001 = '''+KC_GetSubStr(#255,L_Run.Caption,1)+
                                           ''' and BEF19007 = '''+KC_GetSubStr(#255,L_Run.Caption,2)+
                                           ''' and BEF19500 = '''+KC_GetSubStr(#255,L_Run.Caption,3)+'''';
  KC_T3ExecSQL(SQL,D.SC);
end;

end.


