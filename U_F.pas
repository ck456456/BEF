unit U_F;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DateUtils, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdTime, DB;

const
  BEFJdg : array[0..1,0..5] of String =
  (('NG', 'C', 'B','A-', 'A','A+'),
   ('0B','1B','2B','3B','4B','5B'));   // P11

type

  TDayNight = record
    Date : Tdatetime;
    Day  : boolean; // True : Day ;False : Night
    BeginDay   : Tdatetime;
    BeginNight : Tdatetime;
  End;

  TF = class(TForm)
    P01: TPanel;
    L_Date: TLabel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    Panel3: TPanel;
    B_A00: TBitBtn;
    B_A98: TBitBtn;
    B_A99: TBitBtn;
    B_A97: TBitBtn;
    SysTimer: TTimer;
    Panel5: TPanel;
    B_B03: TBitBtn;
    B_B02: TBitBtn;
    B_B01: TBitBtn;
    B_A01: TBitBtn;
    B_A02: TBitBtn;
    B_A04: TBitBtn;
    B_A05: TBitBtn;
    B_A06: TBitBtn;
    B_A07: TBitBtn;
    B_A08: TBitBtn;
    Panel1: TPanel;
    B_C01: TBitBtn;
    B_A09: TBitBtn;
    B_C02: TBitBtn;
    B_C03: TBitBtn;
    B_C04: TBitBtn;
    B_C05: TBitBtn;
    Panel4: TPanel;
    B_B04: TBitBtn;
    B_B05: TBitBtn;
    B_D05: TBitBtn;
    B_D07: TBitBtn;
    IdSMTP: TIdSMTP;
    B_D11: TBitBtn;
    B_A10: TBitBtn;
    B_C06: TBitBtn;
    B_D14: TBitBtn;
    B_A11: TBitBtn;
    B_D15: TBitBtn;
    P_V01: TPanel;
    B_D03: TBitBtn;
    B_D04: TBitBtn;
    B_A03: TBitBtn;
    B_A12: TBitBtn;
    Bevel1: TBevel;
    B_C07: TBitBtn;
    B_A13: TBitBtn;
    B_D16: TBitBtn;
    B_D17: TBitBtn;
    B_D18: TBitBtn;
    IdTime: TIdTime;
    B_D19: TBitBtn;
    B_D20: TBitBtn;
    B_D02: TBitBtn;
    B_D21: TBitBtn;
    B_D12: TBitBtn;
    B_D01: TBitBtn;
    B_D09: TBitBtn;
    B_D13: TBitBtn;
    B_D10: TBitBtn;
    B_D22: TBitBtn;
    B_D23: TBitBtn;
    Bevel2: TBevel;
    B_D24: TBitBtn;
    B_D25: TBitBtn;
    B_D26: TBitBtn;
    B_C09: TBitBtn;
    B_A14: TBitBtn;
    B_B07: TBitBtn;
    B_C08: TBitBtn;
    B_B06: TBitBtn;
    B_B08: TBitBtn;
    B_C10: TBitBtn;
    B_D08: TBitBtn;
    B_D06: TBitBtn;
    B_B09: TBitBtn;
    procedure B_A99Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SysTimerTimer(Sender: TObject);
    procedure B_A00Click(Sender: TObject);
    procedure B_A97Click(Sender: TObject);
    procedure B_A98Click(Sender: TObject);
    procedure B_B01Click(Sender: TObject);
    procedure B_B02Click(Sender: TObject);
    procedure B_A03Click(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure B_A01Click(Sender: TObject);
    procedure B_A02Click(Sender: TObject);
    procedure B_A04Click(Sender: TObject);
    procedure B_A05Click(Sender: TObject);
    procedure B_A06Click(Sender: TObject);
    procedure B_A07Click(Sender: TObject);
    procedure B_A08Click(Sender: TObject);
    procedure B_A09Click(Sender: TObject);
    procedure B_C01Click(Sender: TObject);
    procedure B_B04Click(Sender: TObject);
    procedure B_B05Click(Sender: TObject);
    procedure B_C02Click(Sender: TObject);
    procedure B_B06Click(Sender: TObject);
    procedure B_C03Click(Sender: TObject);
    procedure B_C04Click(Sender: TObject);
    procedure B_C05Click(Sender: TObject);
    procedure B_D01Click(Sender: TObject);
    procedure B_D02Click(Sender: TObject);
    procedure B_D03Click(Sender: TObject);
    procedure B_D04Click(Sender: TObject);
    procedure B_D05Click(Sender: TObject);
    procedure B_D06Click(Sender: TObject);
    procedure B_D07Click(Sender: TObject);
    procedure B_D08Click(Sender: TObject);
    procedure B_D09Click(Sender: TObject);
    procedure B_D10Click(Sender: TObject);
    procedure B_D11Click(Sender: TObject);
    procedure B_A10Click(Sender: TObject);
    procedure B_D12Click(Sender: TObject);
    procedure B_C06Click(Sender: TObject);
    procedure B_D13Click(Sender: TObject);
    procedure B_D14Click(Sender: TObject);
    procedure B_A11Click(Sender: TObject);
    procedure B_D15Click(Sender: TObject);
    procedure B_A12Click(Sender: TObject);
    procedure B_C07Click(Sender: TObject);
    procedure B_A13Click(Sender: TObject);
    procedure B_D16Click(Sender: TObject);
    procedure B_D17Click(Sender: TObject);
    procedure B_D18Click(Sender: TObject);
    procedure B_D19Click(Sender: TObject);
    procedure B_D20Click(Sender: TObject);
    procedure B_C08Click(Sender: TObject);
    procedure B_D21Click(Sender: TObject);
    procedure B_D22Click(Sender: TObject);
    procedure B_D23Click(Sender: TObject);
    procedure B_D24Click(Sender: TObject);
    procedure B_D25Click(Sender: TObject);
    procedure B_D26Click(Sender: TObject);
    procedure B_C09Click(Sender: TObject);
    procedure B_A14Click(Sender: TObject);
    procedure B_B07Click(Sender: TObject);
    procedure B_B08Click(Sender: TObject);
    procedure B_B09Click(Sender: TObject);
    procedure B_C10Click(Sender: TObject);
    procedure P01Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
    function Pass : boolean;
  public
    { Public declarations }
    DayNight      : TDayNight;
    WorkDir : String;
    Pass_word : Integer;
    Pass_Man : String;
    function Group(S1 : String) : String;
    function Yld(SL01 : TStringList) : String;
    function Running00(S1 : String) : String;
    function Running01(S1 : String) : String;
    function SetRunning01(I1 : Integer;S1,S2,S3 : String) : String;
    function SetRunning02(I1 : Integer;S1,S2,S3 : String) : String;
    function Running01ToStr(S1 : String) : String;
    function RunningToColor(S1 : String) : TColor;
    function RunningToStr(S1 : String) : String;
    function Station(S1 : String) : String;
    function Station01(S1 : String) : String;
    function StationToColor(S1 : String) : TColor;
    function StationToStr(S1 : String) : String;
    function Hr(S1 : String) : String; overload;
    function Hr(S1,S2 : String) : String; overload;
    function Hr(D1,D2 : TDateTime) : Real; overload;
    function Minute(S1,S2 : String) : String; overload;
    Function ChgJg(S1 : String; Jg : array of string) :String;
    function KCTime(S1: String;TT : TDateTime) : TDateTime;
    function BEF_Stock(I1 : Integer;S1: String;F1 : Real) : Boolean;
    procedure SaveF13(S1 : String);
    procedure SaveF14(S1 : String);
  end;

var
  F: TF;

implementation

uses U_KcPub, U_D, U_A99, U_V99, U_A00, U_A98, U_B01, U_B02, U_B03,
     U_A01, U_A02, U_A03, U_A04, U_A05, U_A06, U_A07, U_A08, U_A09, U_C01,
     U_B04, U_B05, U_C02, U_B06, U_C03, U_C04, U_C05, U_D01, U_D02,
     U_D03, U_D04, U_D05, U_D06, U_D07, U_D08, U_D09, U_D10, U_D11, U_A10,
     U_D12, U_C06, U_D13, U_D14, U_A11, U_D15, U_A12, U_C07, U_A13, U_D16,
     U_D17, U_D18, U_D19, U_D20, U_C08, U_D21, U_D22, U_D23, U_D24, U_D25,
  U_D26, U_C09, U_A14, U_B07, U_B08, U_C10, U_B09;

{$R *.dfm}

procedure TF.SaveF13(S1 : String);
var
  SQL : String;
  f : Real;
begin
  if (S1='') Then Exit;
  f := 0;

  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF19 Where BEF19202 = '''+S1+'''';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    if ((D.FP1.FieldByName('BEF19101').AsString = '1') or
        (D.FP1.FieldByName('BEF19101').AsString = '0')) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    f := f+D.FP1.FieldByName('BEF19307').AsFloat;
    D.FP1.Next;
  End;

  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF17 Where BEF17401 = '''+S1+'''';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    if ((D.FP1.FieldByName('BEF17101').AsString = '1') or
        (D.FP1.FieldByName('BEF17101').AsString = '0')) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    f := f+KC_StrToFloat(D.FP1.FieldByName('BEF17403').AsString);
    D.FP1.Next;
  End;

  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF29 Where BEF29001 = '''+S1+
                                           ''' and BEF29002 = ''F13''';;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    f := f+KC_StrToFloat(D.FP1.FieldByName('BEF29005').AsString);
    D.FP1.Next;
  End;
  SQL := 'Update BEFF13 Set BEF13103 = '''+format('%0.2f',[f])+
                  ''' Where BEF13001 = '''+S1+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
end;

procedure TF.SaveF14(S1 : String);
var
  SQL : String;
  f : Real;
begin
  if (S1='') Then Exit;
  f := 0;

  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF19 Where BEF19203 = '''+S1+'''';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    if ((D.FP1.FieldByName('BEF19101').AsString = '1') or
        (D.FP1.FieldByName('BEF19101').AsString = '0')) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    f := f+D.FP1.FieldByName('BEF19308').AsFloat;
    D.FP1.Next;
  End;

  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF17 Where BEF17402 = '''+S1+'''';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    if ((D.FP1.FieldByName('BEF17101').AsString = '1') or
        (D.FP1.FieldByName('BEF17101').AsString = '0')) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    f := f+KC_StrToFloat(D.FP1.FieldByName('BEF17404').AsString);
    D.FP1.Next;
  End;
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF29 Where BEF29001 = '''+S1+
                                           ''' and BEF29002 = ''F14''';;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;

  While not D.FP1.Eof do
  Begin
    f := f+KC_StrToFloat(D.FP1.FieldByName('BEF29005').AsString);
    D.FP1.Next;
  End;
  SQL := 'Update BEFF14 Set BEF14103 = '''+format('%0.2f',[f])+
                  ''' Where BEF14001 = '''+S1+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
end;

function TF.BEF_Stock(I1 : Integer;S1: String;F1 : Real) : Boolean;
var
  Qty : Real;
begin
  Result := True;
  KC_T3Close(D.FP2,D.SC);
  D.FP2.CommandText := 'SELECT * FROM BEFF05 Where BEF05001= '''+S1+'''';
  KC_T3OPEN(D.FP2,D.SC);
  D.FP2.First;
  if (D.FP2.FieldByName('BEF05001').AsString = '') Then
  Begin
    ShowMessage('Product not found ...');
    Result := False;
    Exit;
  End;
  Qty := D.FP2.FieldByName('BEF05009').Asfloat+iif(I1<0,(-1)*F1,F1);
  KC_T3ExecSQL('UPDATE BEFF05 SET BEF05009 = '''+FloatToStr(Qty)+
                        ''' Where BEF05001 = '''+S1+'''',D.SC);
end;

function TF.Yld(SL01 : TStringList) : String;
var
  i,n : integer;
  S1  : String;
  R   : Real;
begin
  R := 0;
  n := 0;
  Result := '--%';
  for i := 0 to SL01.Count-1 do
  Begin
    S1 := SL01.Strings[i];
    if (KC_GetSubStr(#255,S1,2) = '') Then Continue;
    if (Pos('成型',KC_GetSubStr(#255,S1,2)) <> 0) Then Continue;
    if ('ZBEF03' <> KC_GetSubStr(#255,S1,4)) Then Continue;
    R := R+KC_StrToFloat(KC_GetSubStr(#255,S1,5));
    inc(n);
  End;
  if (n=0) Then Exit;
  Result := format('%0.2f%%',[R/n]);
End;

function TF.Group(S1 : String) : String;
var
  I1  : Integer;
begin
  I1 := Round(KC_B2Day(S1)-D.F00.FieldByName('BEF00103').AsDateTime);
  I1 := (I1 mod 6);
  Result := 'A;B';
  case I1 of
   -5 : Result := 'A;B';
   -4 : Result := 'A;C';
   -3 : Result := 'A;C';
   -2 : Result := 'B;C';
   -1 : Result := 'B;C';
    0 : Result := 'A;B';
    1 : Result := 'A;B';
    2 : Result := 'A;C';
    3 : Result := 'A;C';
    4 : Result := 'B;C';
    5 : Result := 'B;C';
  End;
End;

Function  TF.ChgJg(S1 : String; Jg : array of string) :String;
var
  B : integer;
  i : integer;
begin
  B := -1;
  for i:=low(Jg) To High(Jg) do
    if (Jg[i]=S1) Then B:=i;

  if (High(Jg) = B) Then
    B:=0
  else
    inc(B);
  Result := Jg[B];
end;

function TF.Station01(S1 : String) : String;
begin
  Result := 'Hold';
  if ('0'=S1) Then Result := 'Hold';
  if ('1'=S1) Then Result := '未褙膜';
  if ('2'=S1) Then Result := '已褙膜';
  if ('3'=S1) Then Result := '已處理';
  if ('4'=S1) Then Result := '已處理';
  if ('5'=S1) Then Result := '已處理';
  if ('6'=S1) Then Result := '已處理';
  if ('7'=S1) Then Result := '自動報廢';
  if ('8'=S1) Then Result := '手動報廢';
  if ('9'=S1) Then Result := '已處理';
  if ('A'=S1) Then Result := '扣留';
end;

function TF.Station(S1 : String) : String;
begin
  Result := 'Hold';
  if ('0'=S1) Then Result := 'Hold';
  if ('1'=S1) Then Result := '未褙膜';
  if ('2'=S1) Then Result := '已褙膜';
  if ('3'=S1) Then Result := '未入庫';
  if ('4'=S1) Then Result := '已出貨';
  if ('5'=S1) Then Result := '已分條';
  if ('6'=S1) Then Result := '被分條';
  if ('7'=S1) Then Result := '自動報廢';
  if ('8'=S1) Then Result := '手動報廢';
  if ('9'=S1) Then Result := '已入庫';
  if ('A'=S1) Then Result := '扣留';
end;

function TF.StationToStr(S1 : String) : String;
begin
  Result := '0';
  if (S1 = 'Hold'  ) Then Result := '0';
  if (S1 = '未褙膜') Then Result := '1';
  if (S1 = '已褙膜') Then Result := '2';
  if (S1 = '未入庫') Then Result := '3';
  if (S1 = '已出貨') Then Result := '4';
  if (S1 = '已分條') Then Result := '5';
  if (S1 = '被分條') Then Result := '6';
  if (S1 = '自動報廢') Then Result := '7';
  if (S1 = '手動報廢') Then Result := '8';
  if (S1 = '已入庫') Then Result := '9';
  if (S1 = '扣留') Then Result := 'A';
End;

function TF.StationToColor(S1 : String) : TColor;
begin

  Result := clWhite;
  if (S1 = 'Hold'  )   Then Result := $00E0E0E0;
  if (S1 = '未褙膜')   Then Result := $00E1FFE1;
  if (S1 = '已褙膜')   Then Result := $00ECEC00;
  if (S1 = '未入庫')   Then Result := $00FFB5B5;
  if (S1 = '已出貨')   Then Result := $000080FF;
  if (S1 = '已分條')   Then Result := $00E1FFE1;
  if (S1 = '被分條')   Then Result := $000080FF;
  if (S1 = '自動報廢') Then Result := clFuchsia;
  if (S1 = '手動報廢') Then Result := clRed;
  if (S1 = '已入庫')   Then Result := clLime;
  if (S1 = '已處理')   Then Result := clLime;
  if (S1 = '扣留')     Then Result := clRed;

  if (S1 = 'Hold'   ) Then Result := $00E0E0E0;
  if (S1 = 'Running') Then Result := $0077FF77;
  if (S1 = 'Finish' ) Then Result := $0091C8C8;
  if (S1 = 'Fail'   ) Then Result := clFuchsia;
  if (S1 = 'Reject' ) Then Result := clRed;
End;

function TF.Running00(S1 : String) : String;
begin
  Result := 'Hold';
  if ('0'=S1) Then Result := 'Hold';
  if ('1'=S1) Then Result := 'Running';
  if ('2'=S1) Then Result := 'Finish';
  if ('3'=S1) Then Result := 'Fail';
  if ('4'=S1) Then Result := 'Reject';
  if ('5'=S1) Then Result := '待處理';
End;

function TF.SetRunning02(I1 : Integer;S1,S2,S3 : String) : String;
begin
  Result := S1;
  if (I1 = 1 ) Then Result := '2';
  if((S1 = '7') and (KC_StrToFloat(S2) <> 0) and (KC_StrToFloat(S3) <> 0)) Then Result := '2';
  if ((KC_StrToFloat(S2) = 0) or (KC_StrToFloat(S3) = 0)) Then
  Begin
    Result := '7';
    Exit;
  End;
End;

function TF.SetRunning01(I1 : Integer;S1,S2,S3 : String) : String;
begin
  Result := '2';
  if (S1='5') Then
  Begin
    Result := S1;
    Exit;
  End;
  if (I1 = 3) and (S1='1')  Then
  Begin
    Result := S1;
    Exit;
  End;
  if (KC_StrToFloat(S2) = 0) Then
  Begin
    Result := '4';
    Exit;
  End;
  if (KC_StrToFloat(S3) = 0) Then
  Begin
    Result := '3';
    Exit;
  End;
End;

function TF.Running01ToStr(S1 : String) : String;
begin
  Result := '0';
  if (S1 = 'Hold'    ) Then Result := '0';
  if (S1 = 'Running' ) Then Result := '1';
  if (S1 = '未褙膜'  ) Then Result := '2';
  if (S1 = '已褙膜'  ) Then Result := '3';
  if (S1 = '自動報廢') Then Result := '4';
  if (S1 = '手動報廢') Then Result := '5';
  if (S1 = '扣留') Then Result := 'A';
End;

function TF.Running01(S1 : String) : String;
begin
  Result := 'Hold';
  if ('0'=S1) Then Result := 'Hold'    ;
  if ('1'=S1) Then Result := 'Running' ;
  if ('2'=S1) Then Result := '未褙膜'  ;
  if ('3'=S1) Then Result := '已褙膜'  ;
  if ('4'=S1) Then Result := '自動報廢';
  if ('5'=S1) Then Result := '手動報廢';
  if ('A'=S1) Then Result := '扣留';
End;

function TF.RunningToStr(S1 : String) : String;
begin
  Result := '0';
  if (S1 = 'Hold'   ) Then Result := '0';
  if (S1 = 'Running') Then Result := '1';
  if (S1 = 'Finish' ) Then Result := '2';
  if (S1 = 'Fail'   ) Then Result := '3';
  if (S1 = 'Reject' ) Then Result := '4';
End;

function TF.RunningToColor(S1 : String) : TColor;
begin
  Result := clWhite;
  if (S1 = 'Hold')     Then Result := $00E0E0E0;
  if (S1 = '已成型')   Then Result := $00E1FFE1;
  if (S1 = '未褙膜')   Then Result := $00E1FFE1;
  if (S1 = '已褙膜')   Then Result := $00ECEC00;
  if (S1 = '已入庫')   Then Result := $00FFB5B5;
  if (S1 = '已出貨')   Then Result := $000080FF;
  if (S1 = '自動報廢') Then Result := clFuchsia;
  if (S1 = '手動報廢') Then Result := clRed;
  if (S1 = '扣留') Then Result := clRed;

  if (S1 = 'Running'   ) Then Result := $0077FF77;
  if (S1 = 'Finish') Then Result := $0091C8C8;
  if (S1 = 'Fail'  ) Then Result := clFuchsia;
  if (S1 = 'Reject') Then Result := clRed;
End;

function TF.KCTime(S1: String;TT : TDateTime) : TDateTime;
begin
  Result := TT;// IdTime.DateTime;
  if (S1 = '') Then Exit;
  Result := EncodeDate(KC_StrToInt(Copy(S1,01,4)), KC_StrToInt(Copy(S1,05,2)), KC_StrToInt(Copy(S1,07,2)))+
            EncodeTime(KC_StrToInt(Copy(S1,09,2)), KC_StrToInt(Copy(S1,11,2)), KC_StrToInt(Copy(S1,13,2)),00);
End;

function TF.Hr(D1,D2 : TDateTime) : Real;
Begin
  Result := (D2-D1)*24;
End;

function TF.Minute(S1,S2 : String) : String;
var
  Ret : Real;
  D1,D2 : TDateTime;
Begin
  Result := '--';// FloatToStr(Ret);
  if ((S1='') or (S2='')) then Exit;
  S1 := KC_GetSubStr('-',S1,1)+KC_GetSubStr('-',S1,2);
  S2 := KC_GetSubStr('-',S2,1)+KC_GetSubStr('-',S2,2);
  D1 := KC_B2Day (copy(S1,1,8))+
        KC_B2Time(copy(S1,9,6));
  D2 := KC_B2Day (copy(S2,1,8))+
        KC_B2Time(copy(S2,9,6));
  Ret := (D2-D1)*24*60;
  Result := Format('%2.2f',[Ret]); // FloatToStr(Ret);
end;

function TF.Hr(S1,S2 : String) : String;
var
  Ret : Real;
  D1,D2 : TDateTime;
Begin
  Result := '--';// FloatToStr(Ret);
  if ((S1='') or (S2='')) then Exit;
  S1 := KC_GetSubStr('-',S1,1)+KC_GetSubStr('-',S1,2);
  S2 := KC_GetSubStr('-',S2,1)+KC_GetSubStr('-',S2,2);
  D1 := KC_B2Day (copy(S1,1,8))+
        KC_B2Time(copy(S1,9,6));
  D2 := KC_B2Day (copy(S2,1,8))+
        KC_B2Time(copy(S2,9,6));
  Ret := (D2-D1)*24;
  Result := Format('%2.2f',[Ret]); // FloatToStr(Ret);
end;

function TF.Hr(S1 : String) : String;
var
  Ret : Real;
  D1,D2 : TDateTime;
Begin
  S1 := KC_GetSubStr('-',S1,1)+KC_GetSubStr('-',S1,2);
  D1 := KC_B2Day (copy(KC_GetSubStr('-',S1,1),1,8))+
        KC_B2Time(copy(KC_GetSubStr('-',S1,1),9,6));
  D2 := IdTime.DateTime;
  Ret := (D2-D1)*24;
  Result := Format('%2.2f',[Ret]); // FloatToStr(Ret);
end;

function TF.Pass : boolean;
begin
  Pass_word := -1;
  F_V99 := TF_V99.Create(Application);
  try
     F_V99.ShowModal;
  finally
     F_V99.Free;
  end;
  Result := False;
  case Pass_word of
    -1 : Begin // Password Error
           ShowMessage('Password Error');
           Result := True;
         End
  else
        Begin
          B_A99.Visible := (Pass_word in [00            ]);
          B_A00.Enabled := (Pass_word in [00,01,02      ]);
          B_A01.Enabled := (Pass_word in [00,01,02      ]);
          B_A02.Enabled := (Pass_word in [00,01,02      ]);
          B_A03.Enabled := (Pass_word in [00,01,02      ]);

          B_B01.Enabled := (Pass_word in [00,01,02      ]);
          B_B02.Enabled := (Pass_word in [00,01,02      ]);
        End;
  End;
End;

procedure TF.B_A99Click(Sender: TObject);
var
  PassWord : String;
begin
  if not InputQuery('Input Box', 'Prompt', PassWord) then exit;
  if not (PassWord = '6797') Then exit;
  F_A99 := TF_A99.Create(Application);
  try
    F_A99.ShowModal;
  finally
    F_A99.Free;
  end;
  D.AllClose;
end;

procedure TF.FormShow(Sender: TObject);
var
  FDate : String;
begin
  WorkDir  := GetCurrentDir;
  FDate := KC_Data2B(FileDateToDateTime(FileAge(Application.ExeName)));
  P01.Caption := 'BEF System '+'('+KC_T3Link(1,'BEFSys('+FDate+')',D.SC)+')';
  // P01.Caption := 'BEF System '+'('+KC_T3Link(100,'BEFSys('+FDate+')',D.SC)+')';
  IdTime.Host := D.SC.Host;
  if Pass Then Close;
  if not ((pos('N:\',WorkDir)<>0) or (Pass_word in [0])) Then Close;
  P_V01.Visible := (Pass_word in [0]);
  SysTimerTimer(Sender);
end;

procedure TF.SysTimerTimer(Sender: TObject);
var
  T1 : TDateTime;
begin
  D.OpenF00;
  T1 := Time;
  DayNight.BeginDay   := D.F00.FieldByName('BEF00101').AsDateTime;
  DayNight.BeginNight := D.F00.FieldByName('BEF00102').AsDateTime;
  DayNight.Day        := ((T1 >= DayNight.BeginDay) and
                          (T1 <  DayNight.BeginNight));
  DayNight.Date       := KC_B2Day(KC_Data2B(F.IdTime.DateTime))-iif(T1<DayNight.BeginDay,1,0);
  L_Date.Caption := FormatDateTime('yyyymmdd' , DayNight.Date)+
                       '-'+iif(DayNight.Day,'D','N');
end;

procedure TF.B_A00Click(Sender: TObject);
begin
  F_A00 := TF_A00.Create(Application);
  try
    F_A00.ShowModal;
  finally
    F_A00.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A97Click(Sender: TObject);
begin
  if Pass Then Close;
end;

procedure TF.B_A98Click(Sender: TObject);
begin
  F_A98 := TF_A98.Create(Application);
  try
    F_A98.ShowModal;
  finally
    F_A98.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B01Click(Sender: TObject);
begin
  F_B01 := TF_B01.Create(Application);
  try
    F_B01.ShowModal;
  finally
    F_B01.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B02Click(Sender: TObject);
begin
  F_B02 := TF_B02.Create(Application);
  try
    F_B02.ShowModal;
  finally
    F_B02.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B03Click(Sender: TObject);
begin
  F_B03 := TF_B03.Create(Application);
  try
    F_B03.ShowModal;
  finally
    F_B03.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A01Click(Sender: TObject);
begin
  F_A01 := TF_A01.Create(Application);
  try
    F_A01.ShowModal;
  finally
    F_A01.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A02Click(Sender: TObject);
begin
  F_A02 := TF_A02.Create(Application);
  try
    F_A02.ShowModal;
  finally
    F_A02.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A03Click(Sender: TObject);
begin
  F_A03 := TF_A03.Create(Application);
  try
    F_A03.ShowModal;
  finally
    F_A03.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A04Click(Sender: TObject);
begin
  F_A04 := TF_A04.Create(Application);
  try
    F_A04.ShowModal;
  finally
    F_A04.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A05Click(Sender: TObject);
begin
  F_A05 := TF_A05.Create(Application);
  try
    F_A05.ShowModal;
  finally
    F_A05.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A06Click(Sender: TObject);
begin
  F_A06 := TF_A06.Create(Application);
  try
    F_A06.ShowModal;
  finally
    F_A06.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A07Click(Sender: TObject);
begin
  F_A07 := TF_A07.Create(Application);
  try
    F_A07.ShowModal;
  finally
    F_A07.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A08Click(Sender: TObject);
begin
  F_A08 := TF_A08.Create(Application);
  try
    F_A08.ShowModal;
  finally
    F_A08.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A09Click(Sender: TObject);
begin
  F_A09 := TF_A09.Create(Application);
  try
    F_A09.ShowModal;
  finally
    F_A09.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B04Click(Sender: TObject);
begin
  F_B04 := TF_B04.Create(Application);
  try
    F_B04.ShowModal;
  finally
    F_B04.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B05Click(Sender: TObject);
begin
  F_B05 := TF_B05.Create(Application);
  try
    F_B05.ShowModal;
  finally
    F_B05.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B06Click(Sender: TObject);
begin
  F_B06 := TF_B06.Create(Application);
  try
    F_B06.ShowModal;
  finally
    F_B06.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C01Click(Sender: TObject);
begin
  F_C01 := TF_C01.Create(Application);
  try
    F_C01.ShowModal;
  finally
    F_C01.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C02Click(Sender: TObject);
begin
  F_C02 := TF_C02.Create(Application);
  try
    F_C02.ShowModal;
  finally
    F_C02.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C03Click(Sender: TObject);
begin
  F_C03 := TF_C03.Create(Application);
  try
    F_C03.ShowModal;
  finally
    F_C03.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C04Click(Sender: TObject);
begin
  F_C04 := TF_C04.Create(Application);
  try
    F_C04.ShowModal;
  finally
    F_C04.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C05Click(Sender: TObject);
var
  PassWord : String;
begin
  if not InputQuery('Input Box', 'Prompt', PassWord) then exit;
  if not (PassWord = 'P456456') Then exit;
  F_C05 := TF_C05.Create(Application);
  try
    F_C05.ShowModal;
  finally
    F_C05.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D01Click(Sender: TObject);
begin
  F_D01 := TF_D01.Create(Application);
  try
    F_D01.ShowModal;
  finally
    F_D01.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D02Click(Sender: TObject);
begin
  F_D02 := TF_D02.Create(Application);
  try
    F_D02.ShowModal;
  finally
    F_D02.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D03Click(Sender: TObject);
begin
  F_D03 := TF_D03.Create(Application);
  try
    F_D03.ShowModal;
  finally
    F_D03.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D04Click(Sender: TObject);
begin
  F_D04 := TF_D04.Create(Application);
  try
    F_D04.ShowModal;
  finally
    F_D04.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D05Click(Sender: TObject);
begin
  F_D05 := TF_D05.Create(Application);
  try
    F_D05.ShowModal;
  finally
    F_D05.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D06Click(Sender: TObject);
begin
  F_D06 := TF_D06.Create(Application);
  try
    F_D06.ShowModal;
  finally
    F_D06.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D07Click(Sender: TObject);
begin
  F_D07 := TF_D07.Create(Application);
  try
    F_D07.ShowModal;
  finally
    F_D07.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D08Click(Sender: TObject);
begin
  F_D08 := TF_D08.Create(Application);
  try
    F_D08.ShowModal;
  finally
    F_D08.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D09Click(Sender: TObject);
begin
  F_D09 := TF_D09.Create(Application);
  try
    F_D09.ShowModal;
  finally
    F_D09.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D10Click(Sender: TObject);
begin
  F_D10 := TF_D10.Create(Application);
  try
    F_D10.ShowModal;
  finally
    F_D10.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D11Click(Sender: TObject);
begin
  F_D11 := TF_D11.Create(Application);
  try
    F_D11.ShowModal;
  finally
    F_D11.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A10Click(Sender: TObject);
begin
  F_A10 := TF_A10.Create(Application);
  try
    F_A10.ShowModal;
  finally
    F_A10.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D12Click(Sender: TObject);
begin
  F_D12 := TF_D12.Create(Application);
  try
    F_D12.ShowModal;
  finally
    F_D12.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C06Click(Sender: TObject);
begin
  F_C06 := TF_C06.Create(Application);
  try
    F_C06.ShowModal;
  finally
    F_C06.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D13Click(Sender: TObject);
begin
  F_D13 := TF_D13.Create(Application);
  try
    F_D13.ShowModal;
  finally
    F_D13.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D14Click(Sender: TObject);
begin
  F_D14 := TF_D14.Create(Application);
  try
    F_D14.ShowModal;
  finally
    F_D14.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A11Click(Sender: TObject);
begin
  F_A11 := TF_A11.Create(Application);
  try
    F_A11.ShowModal;
  finally
    F_A11.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D15Click(Sender: TObject);
begin
  F_D15 := TF_D15.Create(Application);
  try
    F_D15.ShowModal;
  finally
    F_D15.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A12Click(Sender: TObject);
begin
  F_A12 := TF_A12.Create(Application);
  try
    F_A12.ShowModal;
  finally
    F_A12.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C07Click(Sender: TObject);
begin
  F_C07 := TF_C07.Create(Application);
  try
    F_C07.ShowModal;
  finally
    F_C07.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A13Click(Sender: TObject);
begin
  F_A13 := TF_A13.Create(Application);
  try
    F_A13.ShowModal;
  finally
    F_A13.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D16Click(Sender: TObject);
begin
  F_D16 := TF_D16.Create(Application);
  try
    F_D16.ShowModal;
  finally
    F_D16.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D17Click(Sender: TObject);
begin
  F_D17 := TF_D17.Create(Application);
  try
    F_D17.ShowModal;
  finally
    F_D17.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D18Click(Sender: TObject);
begin
  F_D18 := TF_D18.Create(Application);
  try
    F_D18.ShowModal;
  finally
    F_D18.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D19Click(Sender: TObject);
begin
  F_D19 := TF_D19.Create(Application);
  try
    F_D19.ShowModal;
  finally
    F_D19.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D20Click(Sender: TObject);
begin
  F_D20 := TF_D20.Create(Application);
  try
    F_D20.ShowModal;
  finally
    F_D20.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C08Click(Sender: TObject);
begin
  F_C08 := TF_C08.Create(Application);
  try
    F_C08.ShowModal;
  finally
    F_C08.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D21Click(Sender: TObject);
begin
  F_D21 := TF_D21.Create(Application);
  try
    F_D21.ShowModal;
  finally
    F_D21.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D22Click(Sender: TObject);
begin
  F_D22 := TF_D22.Create(Application);
  try
    F_D22.ShowModal;
  finally
    F_D22.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D23Click(Sender: TObject);
begin
  F_D23 := TF_D23.Create(Application);
  try
    F_D23.ShowModal;
  finally
    F_D23.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D24Click(Sender: TObject);
begin
  F_D24 := TF_D24.Create(Application);
  try
    F_D24.ShowModal;
  finally
    F_D24.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D25Click(Sender: TObject);
begin
  F_D25 := TF_D25.Create(Application);
  try
    F_D25.ShowModal;
  finally
    F_D25.Free;
  end;
  D.AllClose;
end;

procedure TF.B_D26Click(Sender: TObject);
begin
  F_D26 := TF_D26.Create(Application);
  try
    F_D26.ShowModal;
  finally
    F_D26.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C09Click(Sender: TObject);
var
  PassWord : String;
begin
  if not InputQuery('Input Box', 'Prompt', PassWord) then exit;
  if not (PassWord = 'P456456') Then exit;
  F_C09 := TF_C09.Create(Application);
  try
    F_C09.ShowModal;
  finally
    F_C09.Free;
  end;
  D.AllClose;
end;

procedure TF.B_A14Click(Sender: TObject);
begin
  F_A14 := TF_A14.Create(Application);
  try
    F_A14.ShowModal;
  finally
    F_A14.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B07Click(Sender: TObject);
begin
  F_B07 := TF_B07.Create(Application);
  try
    F_B07.ShowModal;
  finally
    F_B07.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B08Click(Sender: TObject);
begin
  F_B08 := TF_B08.Create(Application);
  try
    F_B08.ShowModal;
  finally
    F_B08.Free;
  end;
  D.AllClose;
end;

procedure TF.B_B09Click(Sender: TObject);
begin
  F_B09 := TF_B09.Create(Application);
  try
    F_B09.ShowModal;
  finally
    F_B09.Free;
  end;
  D.AllClose;
end;

procedure TF.B_C10Click(Sender: TObject);
var
  PassWord : String;
begin
  if not InputQuery('Input Box', 'Prompt', PassWord) then exit;
  if not (PassWord = 'P456456') Then exit;
  F_C10 := TF_C10.Create(Application);
  try
    F_C10.ShowModal;
  finally
    F_C10.Free;
  end;
  D.AllClose;
end;

procedure TF.P01Click(Sender: TObject);
(*
var
  SQL : String;
  S : array[0..10] of String;
  i : integer;
  W : Variant;
  ff : Real;
  *)
begin
  (*
  KC_CopyToTemp(F.WorkDir,'BB.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\BB.xls');
  W := V.Workbooks[1].WorkSheets['AA'];
  for i:=2 to 189 do
  Begin
    S[0] := W.Cells[i,2].Value;
    S[1] := W.Cells[i,3].Value;
    if (S[0]+S[1])='' then Continue;
    D.OpenG19(S[0],S[1]);
    if (D.G19.FieldByName('BEF19001').AsString = '') then Continue;
    S[2] := W.Cells[i,5].Value;
    S[3] := W.Cells[i,6].Value;
    S[4] := W.Cells[i,7].Value;
    S[5] := '01';
    S[6] := W.Cells[i,8].Value;
    S[7] := W.Cells[i,9].Value;
    S[8] := '9';
    ff := W.Cells[i,10].Value;
    S[09] := format('%0.0f',[ff]);
    S[10] := W.Cells[i,11].Value;
    W.Cells[i,15].Value := S[09];
     SQL := 'INSERT INTO BEFG19 (BEF19002,'+
                                'BEF19003,'+
                                'BEF19010,'+
                                'BEF19011,'+
                                'BEF19012,'+
                                'BEF19013,'+
                                'BEF19101,'+
                                'BEF19501,'+
                                'BEF19502,'+
                                'BEF19500,'+
                                'BEF19001,'+
                                'BEF19007)'+
                       'VALUES ('''+S[2] +''','+
                               ''''+S[3] +''','+
                               ''''+S[4] +''','+
                               ''''+S[5] +''','+
                               ''''+S[6] +''','+
                               ''''+S[7] +''','+
                               ''''+S[8] +''','+
                               ''''+S[9] +''','+
                               ''''+S[10]+''','+
                               ''''+'01' +''','+
                               ''''+S[0] +''','+
                               ''''+S[1] +''')';
    SQL := 'UpDate BEFG19 Set BEF19002 = '''+S[2] +      //  目標料號
                         ''', BEF19003 = '''+S[3] +      //  判級料號
                         ''', BEF19010 = '''+S[4] +      //  棧板編號
                         ''', BEF19011 = '''+S[5] +      //  SN 位置(棧板)
                         ''', BEF19012 = '''+S[6] +      //  重量
                         ''', BEF19013 = '''+S[7] +      //  倉別
                         ''', BEF19101 = '''+S[8] +      //  0.Hold 1.未褙
                         ''', BEF19501 = '''+S[9] +      //  分條長度
                         ''', BEF19502 = '''+S[10]+     //  分條寬幅
                         ''', BEF19500 = '''+'01' +     //  分條寬幅
                    '''Where  BEF19001 = '''+S[0] +
                      ''' and BEF19007 = '''+S[1] +'''';
    KC_T2ExecSQL(SQL,D.FCmd);
  End;
  *)
end;

procedure TF.Panel2Click(Sender: TObject);
// var
  // S : String;
begin
  // D.OpenG19('8114B6A','8117L41');
  // S := KC_GetSQLINSERT(D.G19);
end;

end.


