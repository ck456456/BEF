unit U_V99;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TF_V99 = class(TForm)
    Label1: TLabel;
    E_002: TEdit;
    E_003: TEdit;
    Label2: TLabel;
    B_OK: TBitBtn;
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_V99: TF_V99;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V99.B_OKClick(Sender: TObject);
var
  SQLStr     : String;
begin
  SQLStr := 'SELECT * FROM BEFPSW WHERE ((BEFPW002 = '''+TRIM(E_002.Text)+''') and '+
                                       ' (BEFPW003 = '''+TRIM(E_003.Text)+'''))';
  KC_T3Close(D.PSW,D.SC);
  D.PSW.CommandText := SQLStr;
  KC_T3OPEN(D.PSW,D.SC);
  D.PSW.First;
  F.Pass_word := -1;
  F.Pass_Man  := E_002.Text;
  if (('' <> E_002.Text) and
      (D.PSW.FieldByName('BEFPW002').AsString = E_002.Text) and
      (D.PSW.FieldByName('BEFPW003').AsString = E_003.Text)) Then
     F.Pass_word := StrToInt(D.PSW.FieldByName('BEFPW001').AsString);
  Close;
end;

end.


