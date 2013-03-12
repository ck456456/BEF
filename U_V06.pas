unit U_V06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_V06 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    L_001: TLabel;
    Label1: TLabel;
    Label21: TLabel;
    E_10302: TEdit;
    Label17: TLabel;
    E_10303: TEdit;
    Label20: TLabel;
    E_10306: TEdit;
    Label23: TLabel;
    E_10307: TEdit;
    B_1002: TButton;
    CB_008: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    L_101: TLabel;
    CB_101: TComboBox;
    B_101: TButton;
    procedure FormShow(Sender: TObject);
    procedure B_1002Click(Sender: TObject);
    procedure B_101Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure UpData;
    procedure Load008;
  public
    Run : String;
    { Public declarations }
  end;

var
  F_V06: TF_V06;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V06.UpData;
begin
  L_001  .Caption :=         D.F16.FieldByName('BEF16001').AsString;
  L_101  .Caption := F.Running01(D.F16.FieldByName('BEF16101').ASString);
  CB_008 .Text    :=         D.F16.FieldByName('BEF16008').AsString;
  E_10302.Text    :=         D.F16.FieldByName('BEF16302').AsString;
  E_10303.Text    :=         D.F16.FieldByName('BEF16303').AsString;
  E_10306.Text    :=         D.F16.FieldByName('BEF16306').AsString;
  E_10307.Text    :=         D.F16.FieldByName('BEF16307').AsString;
End;

procedure TF_V06.Load008;
begin
  CB_008.Clear;
  D.F22.First;
  While not D.F22.Eof do
  Begin
    CB_008.Items.Add(D.F22.FieldByName('BEF22001').AsString);
    D.F22.Next;
  End;
End;

procedure TF_V06.FormShow(Sender: TObject);
begin
  D.OpenF22;
  D.OpenF16(Run);
  Load008;
  UpData;
end;

procedure TF_V06.B_1002Click(Sender: TObject);
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT Sum(BEF19302) as Tot FROM BEFF19 '+
                                      'Where BEF19001 = '''+Run+
                                ''' Group by BEF19001';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  E_10307.Text := format('%0.2f',[KC_StrToFloat(E_10302.Text)-
                                  KC_StrToFloat(E_10306.Text)-
                                  D.FP1.FieldByName('Tot').AsFloat]);
end;

procedure TF_V06.B_101Click(Sender: TObject);
begin
  case CB_101.ItemIndex of
    0 : L_101.Caption := '手動報廢';
    1 : L_101.Caption := F.Running01(F.SetRunning01(3,'2',E_10303.Text,E_10307.Text));
  End;
end;
procedure TF_V06.BitBtn1Click(Sender: TObject);
var
  SQL : String;
begin
  SQL := 'Update BEFF16 Set BEF16008 = '''+CB_008.Text+  // 倉別
                        ''',BEF16101 = '''+F.Running01ToStr(L_101.Caption)+
                        ''',BEF16307 = '''+E_10307.Text+  //
                  ''' Where BEF16001 = '''+Run+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
end;

end.

