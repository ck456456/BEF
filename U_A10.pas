unit U_A10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB;

type
  TF_A10 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    E_101: TEdit;
    Label4: TLabel;
    E_102: TEdit;
    B_100: TButton;
    B_200: TButton;
    E_204: TEdit;
    E_203: TEdit;
    Label5: TLabel;
    E_202: TEdit;
    E_201: TEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    E_301: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    E_401: TEdit;
    E_402: TEdit;
    B_300: TButton;
    B_400: TButton;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    E_601: TEdit;
    E_602: TEdit;
    E_501: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    E_511: TEdit;
    E_611: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    CB_512: TComboBox;
    CB_612: TComboBox;
    B_500: TButton;
    B_600: TButton;
    B_591: TButton;
    B_691: TButton;
    B_FG19: TBitBtn;
    L_G19: TLabel;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    procedure B_100Click(Sender: TObject);
    procedure B_200Click(Sender: TObject);
    procedure B_300Click(Sender: TObject);
    procedure B_400Click(Sender: TObject);
    procedure B_591Click(Sender: TObject);
    procedure B_691Click(Sender: TObject);
    procedure B_500Click(Sender: TObject);
    procedure B_600Click(Sender: TObject);
    procedure B_FG19Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure OpenF19;
    procedure OpenG19;
    function GetSN(S1,S2 : String) : String;
    function ChkF05(I1 : Integer;S1,S2 : String) : Boolean;
    function ChkF15(I1 : Integer;S1 : String) : Boolean;
    function ChkF16(I1 : Integer;S1 : String) : Boolean;
    function ChkF19(I1 : Integer;S1,S2 : String) : Boolean;
    function ChgStr(var SS : String;S1,S2,S3 : String) : Boolean;
  public
    { Public declarations }
  end;

var
  F_A10: TF_A10;

implementation

uses U_KcPub, U_D;

{$R *.dfm}

function TF_A10.ChkF05(I1 : Integer;S1,S2 : String) : Boolean;
Begin
  if (S1='') Then
  Begin
    ShowMessage('目標料號(工單)為空值');
    Result := False;
    Exit;
  End;
  D.OpenF05(S1,S2);
  Result := True;
  case I1 of
    0 : Begin
          if((S1 = D.F05.FieldByName('BEF05002').ASSTRING) and
             (S2 = D.F05.FieldByName('BEF05003').ASSTRING))Then Exit;
          ShowMessage(S1+'('+S2+') : 判級料號不存在');
          Result := False;
        End;
    1 : Begin
          if((S1 <> D.F05.FieldByName('BEF05002').ASSTRING) and
             (S2 <> D.F05.FieldByName('BEF05003').ASSTRING))Then Exit;
          ShowMessage(S1+'('+S2+') : 判級料號已存在');
          Result := False;
        End;
  End;
End;

function TF_A10.ChkF19(I1 : Integer;S1,S2 : String) : Boolean;
Begin
  if ((S1='') or (S2='')) Then
  Begin
    ShowMessage('褙膜 Run 為空值');
    Result := False;
    Exit;
  End;
  D.OpenF19(S1,S2);
  Result := True;
  case I1 of
    0 : Begin
          if((S1 = D.F19.FieldByName('BEF19001').ASSTRING) and
             (S2 = D.F19.FieldByName('BEF19007').ASSTRING))Then Exit;
          ShowMessage(S1+S2+' : 褙膜 Run 不存在');
          Result := False;
        End;
    1 : Begin
          if((S1 <> D.F19.FieldByName('BEF19001').ASSTRING) and
             (S2 <> D.F19.FieldByName('BEF19007').ASSTRING))Then Exit;
          ShowMessage(S1+S2+' : 褙膜 Run 已存在');
          Result := False;
        End;
  End;
End;

function TF_A10.ChkF15(I1 : Integer;S1 : String) : Boolean;
Begin
  if (S1='') Then
  Begin
    ShowMessage('工單為空值');
    Result := False;
    Exit;
  End;
  D.OpenF15(S1);
  Result := True;
  case I1 of
    0 : Begin
          if (S1 = D.F15.FieldByName('BEF15001').ASSTRING) Then Exit;
          ShowMessage(S1+' : 工單不存在');
          Result := False;
        End;
    1 : Begin
          if (S1 <> D.F15.FieldByName('BEF15001').ASSTRING) Then Exit;
          ShowMessage(S1+' : 工單已存在');
          Result := False;
        End;
  End;
End;

function TF_A10.ChkF16(I1 : Integer;S1 : String) : Boolean;
Begin
  if (S1='') Then
  Begin
    ShowMessage('成型 Run 為空值');
    Result := False;
    Exit;
  End;
  D.OpenF16(S1);
  Result := True;
  case I1 of
    0 : Begin
          if (S1 = D.F16.FieldByName('BEF16001').ASSTRING) Then Exit;
          ShowMessage(S1+' : 成型 Run 不存在');
          Result := False;
        End;
    1 : Begin
          if (S1 <> D.F16.FieldByName('BEF16001').ASSTRING) Then Exit;
          ShowMessage(S1+' : 成型 Run 已存在');
          Result := False;
        End;
  End;
End;

procedure TF_A10.B_100Click(Sender: TObject);
begin
  if not ChkF16(0,E_101.Text) Then Exit;
  if not ChkF16(1,E_102.Text) Then Exit;
  KC_T3ExecSQL('UpDate BEFF16 Set BEF16001 = '''+E_102.Text+
                        ''' Where BEF16001 = '''+E_101.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.B_200Click(Sender: TObject);
begin
  if not ChkF19(0,E_201.Text,E_202.Text) Then Exit;
  if not ChkF19(1,E_203.Text,E_204.Text) Then Exit;
  KC_T3ExecSQL('UpDate BEFF19 Set BEF19001 = '''+E_203.Text+
                             ''', BEF19007 = '''+E_204.Text+
                        ''' Where BEF19001 = '''+E_201.Text+
                        '''   and BEF19007 = '''+E_202.Text+'''',D.SC);
  KC_T3ExecSQL('UpDate BEFG19 Set BEF19001 = '''+E_203.Text+
                             ''', BEF19007 = '''+E_204.Text+
                        ''' Where BEF19001 = '''+E_201.Text+
                        '''   and BEF19007 = '''+E_202.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.B_300Click(Sender: TObject);
begin
  if not ChkF16(0,E_301.Text) Then Exit;
  KC_T3ExecSQL('Delete BEFF16 Where BEF16001 = '''+E_301.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.B_400Click(Sender: TObject);
begin
  if not ChkF19(0,E_401.Text,E_402.Text) Then Exit;
  KC_T3ExecSQL('Delete BEFF19 Where BEF19001 = '''+E_401.Text+
                          '''   and BEF19007 = '''+E_402.Text+'''',D.SC);
  KC_T3ExecSQL('Delete BEFG19 Where BEF19001 = '''+E_401.Text+
                          '''   and BEF19007 = '''+E_402.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.B_591Click(Sender: TObject);
begin
  if not ChkF16(0,E_501.Text) Then Exit;
  E_511.Text := D.F16.FieldByName('BEF16006').ASSTRING;
 CB_512.Text := D.F16.FieldByName('BEF16308').ASSTRING;
end;

procedure TF_A10.B_691Click(Sender: TObject);
begin
  if not ChkF19(0,E_601.Text,E_602.Text) Then Exit;
  E_611.Text := D.F19.FieldByName('BEF19006').ASSTRING;
  D.OpenF05(D.F19.FieldByName('BEF19003').ASSTRING);
 CB_612.Text := D.F05.FieldByName('BEF05003').ASSTRING;
end;

procedure TF_A10.B_500Click(Sender: TObject);
begin
  if not ChkF16(0,E_501.Text) Then Exit;
  if not ChkF15(0,E_511.Text) Then Exit;
  KC_T3ExecSQL('UpDate BEFF16 Set BEF16006 = '''+D.F15.FieldByName('BEF15001').ASSTRING+
                             ''', BEF16002 = '''+D.F15.FieldByName('BEF15002').ASSTRING+
                             ''', BEF16003 = '''+D.F15.FieldByName('BEF15002').ASSTRING+
                             ''', BEF16004 = '''+D.F15.FieldByName('BEF15004').ASSTRING+
                             ''', BEF16308 = '''+CB_512.Text+
                        ''' Where BEF16001 = '''+E_501.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.B_600Click(Sender: TObject);
begin
  if not ChkF19(0,E_601.Text,E_602.Text) Then Exit;
  if not ChkF15(0,E_611.Text) Then Exit;
  if not ChkF05(0,D.F15.FieldByName('BEF15002').ASSTRING,CB_612.Text) Then Exit;
  KC_T3ExecSQL('UpDate BEFF19 Set BEF19006 = '''+D.F15.FieldByName('BEF15001').ASSTRING+
                             ''', BEF19002 = '''+D.F15.FieldByName('BEF15002').ASSTRING+
                             ''', BEF19003 = '''+D.F05.FieldByName('BEF05001').ASSTRING+
                             ''', BEF19004 = '''+D.F15.FieldByName('BEF15004').ASSTRING+
                        ''' Where BEF19001 = '''+E_601.Text+
                        '''   and BEF19007 = '''+E_602.Text+'''',D.SC);
  KC_T3ExecSQL('UpDate BEFG19 Set BEF19002 = '''+D.F15.FieldByName('BEF15002').ASSTRING+
                             ''', BEF19003 = '''+D.F05.FieldByName('BEF05001').ASSTRING+
                             ''', BEF19004 = '''+D.F15.FieldByName('BEF15004').ASSTRING+
                        ''' Where BEF19001 = '''+E_601.Text+
                        '''   and BEF19007 = '''+E_602.Text+'''',D.SC);
  ShowMessage('ok');
end;

procedure TF_A10.OpenF19;
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 Order by BEF19001,BEF19007';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_A10.OpenG19;
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Order by BEF19001,BEF19007,BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

function TF_A10.GetSN(S1,S2 : String) : String;
var
  SQL : String;
  SN : Integer;
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT Count(*) as SN FROM BEFG19 Where BEF19001='''+S1+
                                                        ''' and BEF19007='''+S1+
                                                        ''' Group by BEF19001,BEF19007';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  SN := D.FP1.FieldByName('SN').AsInteger+1;
  Result := KC_IntFillChar(SN,2,'0');
end;

procedure TF_A10.B_FG19Click(Sender: TObject);
var
  SQL : String;
begin
  OpenF19;
  OpenG19;
  While not D.F19.Eof do
  Begin
    if D.G19.Locate('BEF19001;BEF19007',VarArrayOf([D.F19.FieldByName('BEF19001').ASSTRING,
                                                    D.F19.FieldByName('BEF19007').ASSTRING]), [loCaseInsensitive]) Then
    Begin
      // ShowMessage(D.F19.FieldByName('BEF19001').ASSTRING+'-'+
      //             D.F19.FieldByName('BEF19007').ASSTRING);
      D.F19.Next;
      Continue;
    End;
    D.OpenF16(D.F19.FieldByName('BEF19001').ASSTRING);
    SQL := 'INSERT INTO BEFG19 (BEF19001,'+  // Run No.
                               'BEF19002,'+  // 目標料號
                               'BEF19003,'+  // 判級料號
                               'BEF19004,'+  // Process No
                               'BEF19007,'+  // Run SN
                               'BEF19008,'+  // 出貨單號
                               'BEF19010,'+  // 棧板編號
                               'BEF19011,'+  // SN 位置(棧板)
                               'BEF19012,'+  // 重量
                               'BEF19101,'+  // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                               'BEF19500,'+  // 出貨SN
                               'BEF19501,'+  // 出貨長度
                               'BEF19502)'+  // 出貨寬幅
                      'VALUES ('''+D.F19.FieldByName('BEF19001').ASSTRING+''','+   // Run No.
                              ''''+D.F19.FieldByName('BEF19002').ASSTRING+''','+   // 目標料號
                              ''''+D.F19.FieldByName('BEF19003').ASSTRING+''','+   // 判級料號
                              ''''+D.F19.FieldByName('BEF19004').ASSTRING+''','+   // Process No
                              ''''+D.F19.FieldByName('BEF19007').ASSTRING+''','+   // Run SN
                              ''''+D.F19.FieldByName('BEF19008').ASSTRING+''','+   // 出貨單號
                              ''''+D.F19.FieldByName('BEF19010').ASSTRING+''','+   // 棧板編號
                              ''''+D.F19.FieldByName('BEF19011').ASSTRING+''','+   // SN 位置(棧板)
                              ''''+D.F19.FieldByName('BEF19012').ASSTRING+''','+   // 重量
                              ''''+D.F19.FieldByName('BEF19101').ASSTRING+''','+   // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                              ''''+GetSN(D.F19.FieldByName('BEF19001').ASSTRING,D.F19.FieldByName('BEF19007').ASSTRING)+''','+   // 出貨SN
                              ''''+D.F19.FieldByName('BEF19303').ASSTRING+''','+   // 出貨長度
                              ''''+D.F16.FieldByName('BEF16304').ASSTRING+''')';   // 出貨寬幅
    KC_T3ExecSQL(SQL,D.SC);
    L_G19.Caption := D.F19.FieldByName('BEF19001').ASSTRING+'-'+D.F19.FieldByName('BEF19007').ASSTRING;
    Application.ProcessMessages;
    D.F19.Next;
  End;
  ShowMessage('ok');
end;

procedure TF_A10.BitBtn2Click(Sender: TObject);
begin
  OpenF19;
  While not D.F19.Eof do
  Begin
    KC_T3ExecSQL('UpDate BEFG19 Set BEF19002 = '''+D.F19.FieldByName('BEF19002').ASSTRING+
                               ''', BEF19003 = '''+D.F19.FieldByName('BEF19003').ASSTRING+
                          ''' Where BEF19001 = '''+D.F19.FieldByName('BEF19001').ASSTRING+
                          '''   and BEF19007 = '''+D.F19.FieldByName('BEF19007').ASSTRING+'''',D.SC);
    D.F19.Next;
  End;
  ShowMessage('ok....');
end;

procedure TF_A10.Button1Click(Sender: TObject);
begin
  OpenG19;
  While not D.G19.Eof do
  Begin
    KC_T3ExecSQL('UpDate BEFF19 Set BEF19101 = '''+D.G19.FieldByName('BEF19101').ASSTRING+
                          ''' Where BEF19001 = '''+D.G19.FieldByName('BEF19001').ASSTRING+
                          '''   and BEF19007 = '''+D.G19.FieldByName('BEF19007').ASSTRING+'''',D.SC);
    L_G19.Caption := D.G19.FieldByName('BEF19001').ASSTRING+'-'+D.G19.FieldByName('BEF19007').ASSTRING;
    Application.ProcessMessages;
    D.G19.Next;
  End;
  ShowMessage('ok');
end;

function TF_A10.ChgStr(var SS : String;S1,S2,S3 : String) : Boolean;
var
  Ret : String;
begin
  Result := False;
  if (KC_GetSubStr(#255,S1,4) <> S2) Then Exit;
  SS := S1;
  Ret := KC_InsertSubStr(#255,S1,S3,4);
  SS  := Ret;
  Result := True;
end;

procedure TF_A10.Button2Click(Sender: TObject);
var
  SS : String;
  i : integer;
  SL01,SL02 : TStringList;
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  OpenF19;
  While not D.F19.Eof do
  Begin
    SL01.Assign(D.F19.FieldByName('BEF19901'));
    for i:=0 to SL01.Count-1 do
    Begin
      if ChgStr(SS,SL01.Strings[i],'C003','C100') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C004','C110') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C005','C120') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C006','C130') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C007','C140') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C008','C150') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C009','C160') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C011','C200') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C012','C210') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C013','C220') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C014','C230') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C015','C240') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C035','C060') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C036','C070') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C037','C080') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C038','C090') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C045','C180') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C010','C190') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C020','C020') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C030','C050') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C040','C170') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C001','C010') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C025','C030') Then Begin SL01.Strings[i] := SS; Continue; End;
      if ChgStr(SS,SL01.Strings[i],'C002','C040') Then Begin SL01.Strings[i] := SS; Continue; End;
    End;
    (*
    KC_T3ExecSQL('UPDATE BEFF19 SET BEF19901 = '''+SL01.Text+
                   ''' Where BEF19001 = '''+D.F19.FieldByName('BEF19001').AsString+
                     ''' and BEF19007 = '''+D.F19.FieldByName('BEF19007').AsString+
                     '''',D.SC);
    *)
    L_G19.Caption := D.F19.FieldByName('BEF19001').ASSTRING+'-'+D.F19.FieldByName('BEF19007').ASSTRING;
    Application.ProcessMessages;
    // ShowMessage(SL01.Text);
    D.F19.Next;
  End;
  SL01.Free;
  SL02.Free;
end;

end.

