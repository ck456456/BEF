unit U_V11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, CIM_Grid;

type
  TF_V11 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    CB_Type: TComboBox;
    SG01: TCIM_Grid;
    L_01: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SG01INI;
    procedure SG01Snd;
    procedure OpenG19;
  public
    PALLET : String;
    { Public declarations }
  end;

var
  F_V11: TF_V11;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V11.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running'; // BEF19101
  SG01.Cells[01,0] := 'Run';     // BEF19001+BEF19007+BEF19500
  SG01.Cells[02,0] := '產品別';  // BEF19002
  SG01.Cells[03,0] := '料號';    // BEF19003
  SG01.Cells[04,0] := '棧板編號';// BEF19010+BEF19011
  SG01.Cells[05,0] := '寬幅';    // BEF19502
  SG01.Cells[06,0] := '長度';    // BEF19501
  SG01.Cells[07,0] := '重量';    // BEF19012
  SG01.AutoSize;
end;

procedure TF_V11.OpenG19;
var
  S   : String;
  SQL : String;
begin
  S   := iif(CB_Type.ItemIndex=0,'3','9');
  SQL := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_101)) '+
                        'Where BEF19101 = '''+S+
                      ''' and  BEF19010 = '''+PALLET+
                      ''' Order by BEF19011';
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := SQL;
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V11.SG01Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  While not D.G19.Eof do
  Begin
    SG01.Cells[00,i] :=  F.Station(D.G19.FieldByName('BEF19101').ASString); // Running';
    SG01.Cells[01,i] :=            D.G19.FieldByName('BEF19001').ASString+#255+// Run';
                                   D.G19.FieldByName('BEF19007').ASString+#255+
                                   D.G19.FieldByName('BEF19500').ASString;
    SG01.Cells[02,i] :=            D.G19.FieldByName('BEF19002').ASString;  // 產品別';
    SG01.Cells[03,i] :=            D.G19.FieldByName('BEF19003').ASString;  // 料號';
    SG01.Cells[04,i] :=            D.G19.FieldByName('BEF19010').ASString+#255+// 棧板編號';
                                   D.G19.FieldByName('BEF19011').ASString;
    SG01.Cells[05,i] :=            D.G19.FieldByName('BEF19502').ASString;  // 寬幅';
    SG01.Cells[06,i] :=            D.G19.FieldByName('BEF19501').ASString;  // 長度';
    SG01.Cells[07,i] :=            D.G19.FieldByName('BEF19012').ASString;  // 重量';
    D.G19.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_V11.FormShow(Sender: TObject);
begin
  L_01.Caption := PALLET;
  OpenG19;
  SG01INI;
  SG01Snd;
end;

procedure TF_V11.BitBtn1Click(Sender: TObject);
var
  i : integer;
  SQL,S1,S2 : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  S1   := iif(CB_Type.ItemIndex=0,'9','3');
  S2   := iif(CB_Type.ItemIndex=0,'3','9');
  SQL := 'Update BEFG19 Set BEF19101 = '''+S1+
                  ''' Where BEF19101 = '''+S2+
                   ''' and  BEF19010 = '''+PALLET+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  for i:=1 to SG01.RowCount-1 do
  Begin
    SQL := 'Update BEFF19 Set BEF19101 = '''+S1+
                    ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG01.Cells[1,i],1)+
                     ''' and  BEF19007 = '''+KC_GetSubStr(#255,SG01.Cells[1,i],2)+'''';

    KC_T2ExecSQL(SQL,D.FCmd);
  End;
end;

end.



