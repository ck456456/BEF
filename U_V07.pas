unit U_V07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TF_V07 = class(TForm)
    P_01: TPanel;
    Label1: TLabel;
    L_Run: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    L_16304: TLabel;
    L_303: TLabel;
    L_502: TLabel;
    L_501: TLabel;
    Panel1: TPanel;
    CB_Type: TComboBox;
    L_Go: TLabel;
    E_Go: TEdit;
    B_ok: TBitBtn;
    Label6: TLabel;
    E_010: TEdit;
    Label7: TLabel;
    E_011: TEdit;
    Label8: TLabel;
    E_012: TEdit;
    Label9: TLabel;
    L_No: TLabel;
    procedure FormShow(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
    procedure B_okClick(Sender: TObject);
  private
    function GetG19SN : String;
    function GetG501 : String;
    function GetG502 : String;
    function GetF101 : String;
    function GetF501 : String;
    function GetF502 : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_V07: TF_V07;

implementation

uses U_KcPub, U_D;

{$R *.dfm}

procedure TF_V07.FormShow(Sender: TObject);
begin
  D.OpenF19(KC_GetSubStr(#255,L_Run.Caption,1),
            KC_GetSubStr(#255,L_Run.Caption,2));
  D.OpenF16(KC_GetSubStr(#255,L_Run.Caption,1));
  L_16304.Caption := D.F16.FieldByName('BEF16304').AsString;
  L_303.Caption   := D.F19.FieldByName('BEF19303').AsString;
  L_502.Caption   := D.F19.FieldByName('BEF19502').AsString;
  L_501.Caption   := D.F19.FieldByName('BEF19501').AsString;
  if (L_502.Caption = '') Then L_502.Caption := L_16304.Caption;
  if (L_501.Caption = '') Then L_501.Caption := L_303.Caption;
  CB_TypeChange(Sender);
end;

procedure TF_V07.CB_TypeChange(Sender: TObject);
begin
  case CB_Type.ItemIndex of
    0 : Begin
          L_Go.Visible := False;
          E_Go.Visible := False;
        End;
    1 : Begin
          L_Go.Visible := True;
          E_Go.Visible := True;
          L_Go.Caption := '出貨寬幅 : ';
          E_Go.Text    := L_502.Caption;
        End;
    2 : Begin
          L_Go.Visible := True;
          E_Go.Visible := True;
          L_Go.Caption := '出貨長度 : ';
          E_Go.Text    := L_501.Caption;
        End;
  End;
end;

function TF_V07.GetG19SN : String;
var
  i : integer;
begin
  D.OpenG19(KC_GetSubStr(#255,L_Run.Caption,1),
            KC_GetSubStr(#255,L_Run.Caption,2));
  i := 1;
  While not D.G19.Eof do
  Begin
    if (i <> KC_StrToInt(D.G19.FieldByName('BEF19500').AsString)) Then Break;
    D.G19.Next;
    inc(i);
  End;
  Result := KC_IntFillChar(i,2,'0');
end;

function TF_V07.GetG501 : String;
begin
  Result := L_501.Caption;
  if (CB_Type.ItemIndex = 2) Then Result := E_Go.Text;
end;

function TF_V07.GetG502 : String;
begin
  Result := L_502.Caption;
  if (CB_Type.ItemIndex = 1) Then Result := E_Go.Text;
end;

function TF_V07.GetF101 : String;
var
  i : integer;
begin
  i := KC_StrToInt(GetF501)+KC_StrToInt(GetF502);
  Result := iif(i=0,'4','3');
end;

function TF_V07.GetF501 : String;
begin
  Result := '0';
  case CB_Type.ItemIndex of
    1 : Result := iif(0=(KC_StrToInt(L_501.Caption)-KC_StrToInt(E_Go.Text)),'0',L_501.Caption);
    2 : Result := IntToStr(KC_StrToInt(L_501.Caption)-KC_StrToInt(E_Go.Text));
  End;
end;

function TF_V07.GetF502 : String;
begin
  Result := '0';
  case CB_Type.ItemIndex of
    1 : Result := IntToStr(KC_StrToInt(L_502.Caption)-KC_StrToInt(E_Go.Text));
    2 : Result := iif(0=(KC_StrToInt(L_502.Caption)-KC_StrToInt(E_Go.Text)),'0',L_502.Caption);
  End;
end;

procedure TF_V07.B_okClick(Sender: TObject);
var
  SQL : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  SQL := 'INSERT INTO BEFG19 (BEF19001,'+   // Run No.
                             'BEF19002,'+   // 目標料號
                             'BEF19003,'+   // 判級料號
                             'BEF19004,'+   // Process No
                             'BEF19007,'+   // Run SN
                             'BEF19008,'+   // 出貨單號
                             'BEF19010,'+   // 棧板編號
                             'BEF19011,'+   // SN 位置(棧板)
                             'BEF19012,'+   // 重量
                             'BEF19101,'+   // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                             'BEF19500,'+   // 出貨SN
                             'BEF19501,'+   // 出貨長度
                             'BEF19502)'+   // 出貨寬幅
                     'VALUES ('''+D.F19.FieldByName('BEF19001').AsString+''','+   // Run No.
                             ''''+D.F19.FieldByName('BEF19002').AsString+''','+   // 目標料號
                             ''''+D.F19.FieldByName('BEF19003').AsString+''','+   // 判級料號
                             ''''+D.F19.FieldByName('BEF19004').AsString+''','+   // Process No
                             ''''+D.F19.FieldByName('BEF19007').AsString+''','+   // Run SN
                             ''''+L_No.Caption+''','+   // 出貨單號
                             ''''+E_010.Text+''','+   // 棧板編號
                             ''''+E_011.Text+''','+   // SN 位置(棧板)
                             ''''+E_012.Text+''','+   // 重量
                             ''''+'4'+''','+   // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                             ''''+GetG19SN+''','+   // 出貨SN
                             ''''+GetG501+''','+   // 出貨長度
                             ''''+GetG502+''')';   // 出貨寬幅
  KC_T3ExecSQL(SQL,D.SC);
  SQL := 'UpDate BEFF19 Set BEF19101 = '''+GetF101+
                       ''', BEF19501 = '''+GetF501+
                       ''', BEF19502 = '''+GetF502+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,L_Run.Caption,1)+
                  ''' and   BEF19007 = '''+KC_GetSubStr(#255,L_Run.Caption,2)+'''';
  KC_T3ExecSQL(SQL,D.SC);
end;

end.

