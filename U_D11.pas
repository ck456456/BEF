unit U_D11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D11 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel4: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    SG01: TStringGrid;
    CB_BNo: TComboBox;
    CB_ENo: TComboBox;
    L_Date: TLabel;
    E_BDT: TEdit;
    E_EDT: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V    : Variant;
    SL01 : TStringList;
    SL02 : TStringList;
    SL03 : TStringList;
    SL04 : TStringList;
    procedure OpenF16; overload;
    procedure OpenF16(S1,S2 : String); overload;
    procedure OpenF18(S1,S2 : String);
    procedure GetSL04;
    procedure RollerLd;
    function  GetF19(S1,S2 : String) : String; overload;
    function  GetF19(S1 : String) : String; overload;
    function  GetUV(S1 : String) : String; overload;
    function  GetUV(SUV,Run : String) : Real; overload;
    procedure UV01Snd;
    procedure SG01Ini;
    procedure SG01Snd;
  public
    { Public declarations }
  end;

var
  F_D11: TF_D11;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D11.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Roller No';
  SG01.Cells[01,0] := 'Run No.';
  SG01.Cells[02,0] := '目標料號';
  SG01.Cells[03,0] := 'Process No';
  SG01.Cells[04,0] := '級別'; // BEF16308
  SG01.Cells[05,0] := '使用'; // BEF16302
  SG01.Cells[06,0] := '收料'; // BEF16303
  SG01.Cells[07,0] := '損耗'; // BEF16306
  SG01.Cells[08,0] := '已褙膜';
  SG01.Cells[09,0] := '已褙膜不足量';
  SG01.Cells[10,0] := '未褙膜';
  SG01.Cells[11,0] := '褙膜損耗';
  SG01.Cells[12,0] := 'UV(g)耗用量';
  SG01.Cells[13,0] := '倉庫庫存';
  SG01.Cells[14,0] := '已出貨';
  SG01.Cells[15,0] := '備註';
  SG01.RowCount := 2;
  KC_ColAutoSize(SG01);
end;

procedure TF_D11.RollerLd;
begin
  CB_BNo.Clear;
  CB_ENo.Clear;
  D.F04.First;
  While not D.F04.Eof do
  Begin
    CB_BNo.Items.Add(D.F04.FieldByName('BEF04001').AsString);
    CB_ENo.Items.Add(D.F04.FieldByName('BEF04001').AsString);
    D.F04.Next;
  End;
  CB_BNo.ItemIndex := 0;
  CB_ENo.ItemIndex := 0;// CB_ENo.Items.Count-1;
end;

procedure TF_D11.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  SL04 := TStringList.Create;
  D.OpenF04;
  RollerLd;
  SG01Ini;
end;

procedure TF_D11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  SL04.Free;
  KC_CloseExcel(V);
end;

procedure TF_D11.OpenF16;
var
  SQL : String;
Begin
  SQL := 'Select * From BEFF16 Where BEF16204 >= '''+CB_BNo.Text+
                            ''' and  BEF16204 <= '''+CB_ENo.Text+
                           'z'' Order by BEF16204';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

procedure TF_D11.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 <= '''+S2+
                                          'z'' and BEF18003 >= '''+S1+
                                      ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TF_D11.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                      ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D11.UV01Snd;
var
  i : integer;
  S1 : String;
  BDt,EDt : String;
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'Select * From BEFF16 Where BEF16204 >= '''+CB_BNo.Text+
                                          ''' and  BEF16204 <= '''+CB_ENo.Text+
                                         'z'' Order by BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;  BDt := D.F16.FieldByName('BEF16102').AsString;
  D.F16.Last;   EDt := D.F16.FieldByName('BEF16103').AsString;
  OpenF18(BDt,EDt);
  SL01.Clear;
  While not D.F18.Eof do
  Begin
    S1 := '';
    SL03.Assign(D.F18.FieldByName('BEF18901'));
    for i := 0 to SL03.Count-1 do
      S1:=S1+KC_GetSubStr(#255,SL03.Strings[i],1)+';';
    SL01.Add(D.F18.FieldByName('BEF18004').AsString+#255+  // Line
             D.F18.FieldByName('BEF18002').AsString+#255+  // Begin  DateTime
             D.F18.FieldByName('BEF18003').AsString+#255+  // Finish DateTime
             D.F18.FieldByName('BEF18102').AsString+#255+  // 加入總量
             D.F18.FieldByName('BEF18202').AsString+#255+  // 剩餘總量
             S1);
    D.F18.Next;
  End;
  OpenF16(BDt,EDt);
  SL02.Clear;
  While not D.F16.Eof do
  Begin
    SL02.Add(D.F16.FieldByName('BEF16005').AsString+#255+  // Line
             D.F16.FieldByName('BEF16102').AsString+#255+  // Begin  DateTime
             D.F16.FieldByName('BEF16103').AsString+#255+  // Finish DateTime
             D.F16.FieldByName('BEF16001').AsString+#255+  // Run
             D.F16.FieldByName('BEF16302').AsString);      // 使用長度
    D.F16.Next;
  End;
end;

function  TF_D11.GetF19(S1,S2 : String) : String;
var
  Ret : Real;
begin
  Ret := 0;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    Ret := Ret+D.F19.FieldByName(S1).AsFloat+
               D.F19.FieldByName(S2).AsFloat;
    D.F19.Next;
  End;
  Result := Format('%0.2f',[Ret]);
end;

function  TF_D11.GetF19(S1 : String) : String;
var
  Ret : Real;
begin
  Ret := 0;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if (S1 <> D.F19.FieldByName('BEF19101').AsString) then
    Begin
      D.F19.Next;
      Continue;
    End;
    Ret := Ret+D.F19.FieldByName('BEF19303').AsFloat+
               D.F19.FieldByName('BEF19304').AsFloat;
    D.F19.Next;
  End;
  Result := Format('%0.2f',[Ret]);
end;

function  TF_D11.GetUV(S1 : String) : String;
var
  i : integer;
  Ret : Real;
  S0,SS : String;
begin
  Ret := 0;
  SS  := '';
  S0  := '';
  Result := '--';
  for i:=0 to SL02.Count-1 do
  Begin
    if (KC_GetSubStr(#255,SL02.Strings[i],4) = S1) Then
    Begin
      SS := SL02.Strings[i];
      Break;
    End;
  End;
  if (SS = '') Then Exit;
  for i:=0 to SL01.Count-1 do
  Begin
    if (KC_GetSubStr(#255,SL01.Strings[i],1) <> KC_GetSubStr(#255,SS,1)) Then Continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],2)  > KC_GetSubStr(#255,SS,3)) Then Continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],3)  < KC_GetSubStr(#255,SS,2)) Then Continue;
    if((KC_GetSubStr(#255,SL01.Strings[i],2) >= KC_GetSubStr(#255,SS,2)) and
       (KC_GetSubStr(#255,SL01.Strings[i],3) <= KC_GetSubStr(#255,SS,3))) Then
    Begin
      Ret := (KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],4)) -
              KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],5)))+
              Ret;
      S0  := KC_GetSubStr(#255,SL01.Strings[i],6);
      Continue;
    End;
    Ret := Ret+GetUV(SL01.Strings[i],SS);
    S0  := S0+KC_GetSubStr(#255,SL01.Strings[i],6);
  End;
  Result := Format('%0.2f',[Ret])+#255+copy(S0,1,length(S0)-1);
end;

function  TF_D11.GetUV(SUV,Run : String) : Real;
var
  i : integer;
  D1,D2,D3,D4 : TDateTime;
  DD          :  Double;
  T1,T2       : TDateTime;
  Q2 : Real;
begin
  Result := 0;
  D1 := KC_B2DateTime(KC_GetSubStr(#255,Run,2));
  D2 := KC_B2DateTime(KC_GetSubStr(#255,Run,3));
  D3 := KC_B2DateTime(KC_GetSubStr(#255,SUV,2));
  D4 := KC_B2DateTime(KC_GetSubStr(#255,SUV,3));
  Q2 := KC_StrToFloat(KC_GetSubStr(#255,SUV,4)) -
        KC_StrToFloat(KC_GetSubStr(#255,SUV,5));
  DD := 0;
  for i:=0 to SL02.Count-1 do
  Begin
    if (KC_GetSubStr(#255,SL02.Strings[i],1) <> KC_GetSubStr(#255,SUV,1)) Then Continue;
    T1 := KC_B2DateTime(KC_GetSubStr(#255,SL02.Strings[i],2));
    T2 := KC_B2DateTime(KC_GetSubStr(#255,SL02.Strings[i],3));
    if D3 > T2 Then Continue;
    if D4 < T1 Then Continue;
    if (D3 <= T1) and (D4 >= T2) Then DD := DD + (T2-T1);
    if (D3 >  T1) and (D4 >= T2) Then DD := DD + (T2-D3);
    if (D3 >  T1) and (D4 <  T2) Then DD := DD + (D4-D3);
    if (D3 <= T1) and (D4 <  T2) Then DD := DD + (D4-T1);
  End;
  if (D3 <= D1) and (D4 >= D2) Then Result := (D2-D1)/(DD)*Q2;
  if (D3 >  D1) and (D4 >= D2) Then Result := (D2-D3)/(DD)*Q2;
  if (D3 >  D1) and (D4 <  D2) Then Result := (D4-D3)/(DD)*Q2;
  if (D3 <= D1) and (D4 <  D2) Then Result := (D4-D1)/(DD)*Q2;
end;

procedure TF_D11.SG01Snd;
var
  iRow : integer;
  i,j  : integer;
  Ret  : Real;
  S1   : String;
  RNo  : String;
  B    : Boolean;
begin
  KC_SGClear(1,SG01);
  iRow := 1;
  RNo := '---';
  While not D.F16.Eof do
  Begin
    B := False;
    for i:=0 to SL04.Count-1 do
      if (D.F16.FieldByName('BEF16204').AsString = SL04.Strings[i]) Then B := True;
    if (not B) Then
    Begin
      D.F16.Next;
      Continue;
    End;

    D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
    if (RNo <> D.F16.FieldByName('BEF16204').AsString) Then
    Begin
      SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16204').AsString;
      RNo := D.F16.FieldByName('BEF16204').AsString;
    End;
    SG01.Cells[01,iRow] := D.F16.FieldByName('BEF16001').AsString;
    SG01.Cells[02,iRow] := D.F16.FieldByName('BEF16002').AsString;
    SG01.Cells[03,iRow] := D.F16.FieldByName('BEF16004').AsString;
    SG01.Cells[04,iRow] := D.F16.FieldByName('BEF16308').AsString;
    SG01.Cells[05,iRow] := D.F16.FieldByName('BEF16302').AsString;
    SG01.Cells[06,iRow] := D.F16.FieldByName('BEF16303').AsString;
    SG01.Cells[07,iRow] := D.F16.FieldByName('BEF16306').AsString;
    SG01.Cells[08,iRow] := GetF19('BEF19303','BEF19304');
    SG01.Cells[09,iRow] := GetF19('2');
    SG01.Cells[10,iRow] := D.F16.FieldByName('BEF16307').AsString;
    SG01.Cells[11,iRow] := GetF19('BEF19305','BEF19306');
    S1 := GetUV(D.F16.FieldByName('BEF16001').AsString);
    SG01.Cells[12,iRow] := KC_GetSubStr(#255,S1,1);
    SG01.Cells[13,iRow] := GetF19('3');
    SG01.Cells[14,iRow] := GetF19('4');
    SG01.Cells[15,iRow] := D.F16.FieldByName('BEF16399').AsString;
    D.F16.Next;
    inc(iRow);
  End;
  SG01.Cells[02,iRow] := '總計 :';
  for i:=3 to 16 do
  Begin
    Ret := 0;
    for j:=1 to iRow-1 do Ret := Ret + KC_StrToFloat(SG01.Cells[i,j]);
    SG01.Cells[i,iRow] := iif(Ret=0,'',format('%0.2f',[Ret]));
  End;
  inc(iRow);
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
end;

procedure TF_D11.GetSL04;
var
  i : integer;
  B : Boolean;
begin
  OpenF16(E_BDT.Text,E_EDT.Text);
  SL04.Clear;
  While not D.F16.Eof do
  Begin
    B := False;
    for i:=0 to SL04.Count-1 do
      if (D.F16.FieldByName('BEF16204').AsString = SL04.Strings[i]) Then B := True;
    if not B Then SL04.Add(D.F16.FieldByName('BEF16204').AsString);
    D.F16.Next;
  End;
  SL04.Sort;
end;

procedure TF_D11.B_OKClick(Sender: TObject);
begin
  GetSL04;
  UV01Snd;
  OpenF16;
  SG01Snd;
end;

procedure TF_D11.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D11.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D11.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

end.
  
