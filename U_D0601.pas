unit U_D0601;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Grids,
  Buttons, DB;

type
  TF_D0601 = class(TForm)
    P_02: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    E_201: TEdit;
    E_299: TEdit;
    E_202: TEdit;
    Panel1: TPanel;
    P_04: TPanel;
    Label1: TLabel;
    L_102: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    CB_005: TComboBox;
    E_101: TEdit;
    E_199: TEdit;
    SG02: TStringGrid;
    Panel2: TPanel;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_SaveClick(Sender: TObject);
  private
    { Private declarations }
    SL01 : TStringList;
    procedure SG02Ini;
    procedure SG02Snd(TSL : TStringList);
    procedure UpData;
    function  GetMod(S1 : String) : String;
    function  ChkData : boolean;
    procedure Get102;
    procedure LoadSL01;
    procedure SaveF03;
  public
    SS1,SS2 : String;
    { Public declarations }
  end;

var
  F_D0601: TF_D0601;

implementation

uses U_KcPub, U_D;

{$R *.dfm}

procedure TF_D0601.SaveF03;
var
  i : integer;
  SQL : String;
  S1 : String;
Begin
  for i := 1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] =  '')   then Continue;
    SG02.Cells[3,i] := FloatToStr(KC_StrToFloat(GetMod(SG02.Cells[0,i]))-
                                  KC_StrToFloat(SG02.Cells[2,i]));
    if (SG02.Cells[3,i] =  '0' ) then S1 := '2';
    if (SG02.Cells[3,i] <> '0' ) then S1 := '1';
    SQL := 'Update BEFF03 Set BEF03000 = '''+S1+
                        ''' , BEF03103 = '''+SG02.Cells[3,i]+
                    ''' Where BEF03001 = '''+SG02.Cells[0,i]+'''';
    KC_T2ExecSQL(SQL,D.FCmd);
  End;
end;

procedure TF_D0601.LoadSL01;
var
  i : integer;
  f : real;
Begin
  SL01.Clear;

  for i:=1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] = '') then Continue;
    f := KC_StrToFloat(SG02.Cells[1,i])+KC_StrToFloat(SG02.Cells[2,i]);
    SL01.Add(SG02.Cells[0,i]+#255+
             FloatToStr(f)  +#255+
             SG02.Cells[3,i]);
  End;
end;

function  TF_D0601.ChkData : boolean;
begin
  Result := True;
  if Result Then Result := (E_101.Text <> '');
  if Result Then Result := (E_201.Text <> '');
End;

procedure TF_D0601.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[0,0] := 'UV No';
  SG02.Cells[1,0] := '已倒入量';
  SG02.Cells[2,0] := '新倒入量';
  SG02.Cells[3,0] := '剩餘量';
  KC_ColAutoSize(SG02);
end;

function  TF_D0601.GetMod(S1 : String) : String;
begin
  Result := '0';
  if (S1 = '') Then Exit;
  D.OpenF03(S1);
  if not D.F03.Locate('BEF03001',S1, [loCaseInsensitive]) Then Exit;
  if (D.F03.FieldByName('BEF03000').ASSTRING = '1') and
     (D.F03.FieldByName('BEF03103').ASfloat  = 0.0) Then
  Begin
    Result := D.F03.FieldByName('BEF03102').ASSTRING;
    Exit;
  End;
  Result := D.F03.FieldByName('BEF03103').ASSTRING;
end;

procedure TF_D0601.Get102;
var
  i : integer;
  f : Real;
begin
  f := 0;
  for i := 1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i]='') Then Continue;
    f := f+KC_StrToFloat(SG02.Cells[1,i])+KC_StrToFloat(SG02.Cells[2,i]);
  End;
  L_102.Caption := FloatToStr(f);
end;

procedure TF_D0601.SG02Snd(TSL : TStringList);
var
  i  : integer;
  S1 : String;
begin
  KC_SGClear(1,SG02);
  for i:=0 to TSL.Count-1 do
  Begin
    S1 := TSL.Strings[i];
    SG02.Cells[0,i+1] := KC_GetSubStr(#255,S1,1);
    SG02.Cells[1,i+1] := KC_GetSubStr(#255,S1,2);
    SG02.Cells[2,i+1] := '0';
    SG02.Cells[3,i+1] := GetMod(KC_GetSubStr(#255,S1,1));
  End;
  Get102;
  KC_ColAutoSize(SG02);
end;

procedure TF_D0601.UpData;
begin
 CB_005.Text    := D.F18.FieldByName('BEF18005').AsString;
  E_101.Text    := D.F18.FieldByName('BEF18101').AsString;
  L_102.Caption := D.F18.FieldByName('BEF18102').AsString;
  E_199.Text    := D.F18.FieldByName('BEF18199').AsString;
  E_201.Text    := D.F18.FieldByName('BEF18201').AsString;
  E_202.Text    := D.F18.FieldByName('BEF18202').AsString;
  E_299.Text    := D.F18.FieldByName('BEF18299').AsString;
  SL01.Text     := D.F18.FieldByName('BEF18901').AsString;
  SG02Snd(SL01);
end;

procedure TF_D0601.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SG02Ini;
  D.OpenF18(SS1,SS2);
  UpData;
end;

procedure TF_D0601.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
end;

procedure TF_D0601.B_SaveClick(Sender: TObject);
var
  SQL : String;
begin
  if not ChkData Then
  Begin
    ShowMessage('Error ...');
    Exit;
  End;
  Get102;
  LoadSL01;
  SQL := 'Update BEFF18 Set BEF18101 = '''+E_101.Text+
                        ''',BEF18102 = '''+L_102.Caption+
                        ''',BEF18199 = '''+E_199.Text+
                        ''',BEF18201 = '''+E_201.Text+
                        ''',BEF18202 = '''+FloatToStr(KC_StrToFloat(E_202.Text))+
                        ''',BEF18299 = '''+E_299.Text+
                        ''',BEF18901 = '''+SL01.Text+
                        ''',BEF18005 = '''+CB_005.Text+
                  ''' Where BEF18002 = '''+SS1+
                    ''' and BEF18004 = '''+SS2+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  SaveF03;
  SG02Ini;
  D.OpenF18(SS1,SS2);
  UpData;
end;

end.


