unit U_A98;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_A98 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    B_ok: TBitBtn;
    B_Cancel: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    L_002: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    E_0031: TEdit;
    E_0032: TEdit;
    E_0033: TEdit;
    procedure FormShow(Sender: TObject);
    procedure B_okClick(Sender: TObject);
  private
    { Private declarations }
    function PasNote(S1 : String) : String;
  public
    { Public declarations }
  end;

var
  F_A98: TF_A98;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

function TF_A98.PasNote(S1 : String) : String;
var
  i : integer;
begin
  i := KC_StrToInt(S1);
  Result := '(????)';
  case i of
    00 : Result := '  (MIS)';
    01 : Result := '  (SA全開--開放修改權限)';
    02 : Result := '  (SA全開--僅供查詢(無法修改))';
    10 : Result := '  (OP)';
    99 : Result := '  (報表查詢)';
  end;
end;

procedure TF_A98.FormShow(Sender: TObject);
begin
  D.OpenPSW(F.Pass_Man);
  if (F.Pass_Man <> D.PSW.FieldByName('BEFPW002').AsString) Then ShowMessage('Password Error !!');
  L_002.Caption := F.Pass_Man+PasNote(D.PSW.FieldByName('BEFPW001').AsString);
end;

procedure TF_A98.B_okClick(Sender: TObject);
var
  i : integer;
begin
  i := 0;
  if (Trim(E_0032.Text) = '') Then i:=3;
  if (E_0032.Text <> E_0033.Text) Then i:=2;
  if (D.PSW.FieldByName('BEFPW003').AsString <> E_0031.Text) Then i:=1;
  case i of
    0 : Begin
          D.PSW.Edit;
          D.PSW.FieldByName('BEFPW003').AsString := E_0032.Text;
          D.PSW.ApplyUpdates(-1);
          ShowMessage('OK .....');
          Close;
        End;
    1 : ShowMessage('Old Password Error !!');
    2 : ShowMessage('New Password <> Confirm Password');
    3 : ShowMessage('New Password is Empty');
  end;
end;

end.
