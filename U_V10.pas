unit U_V10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TF_V10 = class(TForm)
    Panel2: TPanel;
    L_001: TLabel;
    Label1: TLabel;
    Label21: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    L_101: TLabel;
    E_501: TEdit;
    E_502: TEdit;
    E_012: TEdit;
    CB_101: TComboBox;
    B_101: TButton;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    E_010: TEdit;
    E_011: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    CB_013: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_101Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CB013Ld;
    procedure UpData;
  public
    Run : String;
    { Public declarations }
  end;

var
  F_V10: TF_V10;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V10.UpData;
begin
  L_001.Caption :=           D.G19.FieldByName('BEF19001').AsString+#255+
                             D.G19.FieldByName('BEF19007').AsString+#255+
                             D.G19.FieldByName('BEF19500').AsString;
  L_101.Caption := F.Station(D.G19.FieldByName('BEF19101').ASString);
  E_501.Text    :=           D.G19.FieldByName('BEF19501').AsString;
  E_502.Text    :=           D.G19.FieldByName('BEF19502').AsString;
  E_012.Text    :=           D.G19.FieldByName('BEF19012').AsString;
  E_010.Text    :=           D.G19.FieldByName('BEF19010').AsString;
  E_011.Text    :=           D.G19.FieldByName('BEF19011').AsString;
 CB_013.Text    :=           D.G19.FieldByName('BEF19013').AsString;
end;

procedure TF_V10.CB013Ld;
begin
  CB_013.Clear;
  CB_013.Items.Add('');
  D.F22.First;
  While not D.F22.Eof do
  Begin
    if (D.F22.FieldByName('BEF22002').AsString <> '成品') Then
    Begin
      D.F22.Next;
      Continue;
    End;
    CB_013.Items.Add(D.F22.FieldByName('BEF22001').AsString);
    D.F22.Next;
  End;
end;

procedure TF_V10.FormShow(Sender: TObject);
begin
  CB013Ld;
  D.OpenG19(KC_GetSubStr(#255,Run,1),
            KC_GetSubStr(#255,Run,2),
            KC_GetSubStr(#255,Run,3));
  UpData;
end;

procedure TF_V10.B_101Click(Sender: TObject);
begin
  case CB_101.ItemIndex of
    0 : L_101.Caption := '手動報廢';
    1 : L_101.Caption := F.Station(F.SetRunning02(99,D.G19.FieldByName('BEF19101').AsString,E_501.Text,E_502.Text));
  End;
end;

procedure TF_V10.BitBtn1Click(Sender: TObject);
var
  SQL : String;
begin
  SQL := 'Update BEFG19 Set BEF19101 = '''+F.StationToStr(L_101.Caption)+
                        ''',BEF19501 = '''+E_501.Text+
                        ''',BEF19502 = '''+E_502.Text+
                        ''',BEF19012 = '''+E_012.Text+
                        ''',BEF19010 = '''+E_010.Text+
                        ''',BEF19011 = '''+E_011.Text+  //
                        ''',BEF19013 = '''+CB_013.Text+  //
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,Run,1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,Run,2)+
                    ''' and BEF19500 = '''+KC_GetSubStr(#255,Run,3)+
                    '''';
  KC_T2ExecSQL(SQL,D.FCmd);
End;

end.

