unit U_V14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, CIM_Grid, DB;

type
  TF_V14 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    E_102: TEdit;
    E_103: TEdit;
    Label2: TLabel;
    E_104: TEdit;
    E_001: TEdit;
    Label7: TLabel;
    E_007: TEdit;
    SG01: TCIM_Grid;
    Label9: TLabel;
    E_008: TEdit;
    procedure FormShow(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SG01Ini;
    procedure SG01Snd;
    procedure OpenG19;
    function  ChkSpec : boolean;
  public
    { Public declarations }
  end;

var
  F_V14: TF_V14;

implementation

uses U_D, U_KcPub, U_F;

{$R *.dfm}

procedure TF_V14.SG01Ini;
begin
  SG01.Clear;
  SG01.Cells[00,0] := '棧板號';     //
  SG01.Cells[01,0] := '狀態';       //
  SG01.Cells[02,0] := '出貨單號';   //
  SG01.Cells[03,0] := '倉別';       //
  SG01.Cells[04,0] := '產品別';     //
  SG01.Cells[05,0] := '成品料號';   //
  SG01.Cells[06,0] := '成型寬幅';   //
  SG01.Cells[07,0] := '長度m';      //
  SG01.Cells[08,0] := '長度m2';     //
  SG01.Cells[09,0] := '重量(kg)';   //
  SG01.Cells[10,0] := 'Run no';     //
  SG01.AutoSize;
end;

procedure TF_V14.OpenG19;
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19004 = '''+KC_GetSubStr(#255,E_008.Text,1)+
                                          ''' and (BEF19008 = '''+E_001.Text+
                                          '''  or  BEF19101 = '''+'9'+
                                     ''') Order by BEF19010, BEF19011';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V14.SG01Snd;
var
  i : integer;
  f1,f2 : Real;
  S : String;
begin
  KC_SGClear(1,SG01);
  D.G19.First;
  i := 1;
  While not D.G19.Eof do
  Begin
    S := '';
    if (D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive])) Then
      S := D.F05.FieldByName('BEF05008').AsString;
    if (POS(S,E_104.Text)=0) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if ((KC_StrTofloat(D.G19.FieldByName('BEF19501').ASString)+0.000001) <= KC_StrTofloat(E_102.Text)) or
       ((KC_StrTofloat(D.G19.FieldByName('BEF19501').ASString)-0.000001) >= KC_StrTofloat(E_103.Text)) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19501').ASString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19502').ASString);
    SG01.Cells[00,i] := D.G19.FieldByName('BEF19010').ASString; // 棧板
    SG01.Cells[01,i] := F.Station(D.G19.FieldByName('BEF19101').ASString); // 狀態
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19008').ASString; // 出貨單號
    SG01.Cells[03,i] := D.G19.FieldByName('BEF19013').ASString; // 倉別
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19002').ASString; // 產品別
    SG01.Cells[05,i] := S;                                      // 成品料號
    SG01.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString; // 成型寬幅
    SG01.Cells[07,i] := D.G19.FieldByName('BEF19501').ASString; // 長度m
    SG01.Cells[08,i] := format('%0.0f',[f1*f2/1000]);           // m2
    SG01.Cells[09,i] := D.G19.FieldByName('BEF19012').ASString; // 重量(kg)
    SG01.Cells[10,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19500').ASString; // Run no
    D.G19.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_V14.FormShow(Sender: TObject);
begin
  OpenG19;
  SG01Ini;
  SG01Snd;
end;

function  TF_V14.ChkSpec : boolean;
begin
  Result := True;
  if ((KC_StrTofloat(SG01.Cells[07,SG01.Row])+0.000001) <= KC_StrTofloat(E_102.Text)) or
     ((KC_StrTofloat(SG01.Cells[07,SG01.Row])-0.000001) >= KC_StrTofloat(E_103.Text)) Then
  Begin
    ShowMessage('長度不符 .... ');
    Result := false;
  End;
  if (POS(SG01.Cells[05,SG01.Row],E_104.Text)=0) Then
  Begin
    ShowMessage('級別不符 .... ');
    Result := false;
  End;
end;

procedure TF_V14.SG01DblClick(Sender: TObject);
var
  SQL : String;
begin
  if (SG01.Cells[01,SG01.Row]<>'已入庫') Then Exit;
  if (SG01.Cells[02,SG01.Row]<>'') and (SG01.Cells[02,SG01.Row]<>E_001.Text) Then Exit;
  if (SG01.Cells[02,SG01.Row]=E_001.Text) Then
  Begin
    if (MessageDlg('是否註銷保留?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
    SQL := 'UpDate BEFG19 Set BEF19008 = '''' '+
                       'Where BEF19001 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],1)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],2)+
                      ''' and BEF19500 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],3)+
                      '''';
  End;
  if (SG01.Cells[02,SG01.Row]='') Then
  Begin
    if not ChkSpec Then Exit;
    SQL := 'UpDate BEFG19 Set BEF19008 = '''+E_001.Text+''' '+
                       'Where BEF19001 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],1)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],2)+
                      ''' and BEF19500 = '''+KC_GetSubStr(#255,SG01.Cells[10,SG01.Row],3)+
                      '''';
  End;
  KC_T2ExecSQL(SQL,D.FCmd);
  OpenG19;
  SG01Snd;
end;

end.


