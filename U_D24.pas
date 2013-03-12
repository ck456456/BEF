unit U_D24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D24 = class(TForm)
    P_Main: TPanel;
    Panel6: TPanel;
    E_BDat: TEdit;
    E_EDat: TEdit;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    PC01: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SG01: TStringGrid;
    SG02: TStringGrid;
    CB_Type: TCheckBox;
    CB_000: TComboBox;
    TabSheet3: TTabSheet;
    SG03: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V : Variant;
    SL01,SL02,SL03 : TStringList;
    UV01,UV02,UV03 : TStringList;
    function  SumSL(TSL : TStringList;Wno : String;I1 : Integer) : String;
    function  GetPck(I1 : integer;S1 : String) :Real;
    procedure SL01Snd;
    procedure SL02Snd;
    procedure SL03Snd;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG03Ini;
    function  GetUV(S1 : String) : String; overload;
    function  GetUV(SUV,Run : String) : Real; overload;
    procedure OpenF15;
    procedure OpenF16(S1 : String); overload;
    procedure OpenF16(S1,S2 : String); overload;
    procedure OpenF19(S1 : String);
    procedure OpenF19S(S1 : String);
    procedure OpenF27(S1,S2 : String);
    procedure GetF16Date(var D1,D2 : String);
    procedure OpenF18(S1,S2 : String);
    procedure SL03Add(S1,S2 : String;Cnt : Integer);
  public
    { Public declarations }
  end;

var
  F_D24: TF_D24;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_D24.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Working';
  SG01.Cells[01,0] := 'Product';
  SG01.Cells[02,0] := 'Process';
  SG01.Cells[03,0] := 'PET 料號';
  SG01.Cells[04,0] := 'PET 使用長度';
  SG01.Cells[05,0] := 'UV膠 料號';
  SG01.Cells[06,0] := 'UV膠 使用量(實際)';
  SG01.Cells[07,0] := 'UV膠 使用量(BOM)';
  KC_ColAutoSize(SG01);
end;

procedure TF_D24.SG03Ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Working';
  SG03.Cells[01,0] := 'Product';
  SG03.Cells[02,0] := 'Process';
  SG03.Cells[03,0] := 'Count';
  SG03.Cells[04,0] := '包材料號';
  SG03.Cells[05,0] := '包材使用量';
  SG03.Cells[06,0] := '褙膜';
  KC_ColAutoSize(SG03);
end;

procedure TF_D24.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Working';
  SG02.Cells[01,0] := 'Product';
  SG02.Cells[02,0] := 'Process';
  SG02.Cells[03,0] := 'BEF 料號';
  SG02.Cells[04,0] := 'BEF 使用長度';
  SG02.Cells[05,0] := '上保料號';
  SG02.Cells[06,0] := '上保使用量';
  SG02.Cells[07,0] := '下保料號';
  SG02.Cells[08,0] := '下保使用量';
  SG02.Cells[09,0] := 'Count';
  SG02.Cells[10,0] := '包材1';
  SG02.Cells[11,0] := '包材2';
  SG02.Cells[12,0] := '包材3';
  SG02.Cells[13,0] := '包材4';
  SG02.Cells[14,0] := '包材5';
  SG02.Cells[15,0] := '包材6';
  KC_ColAutoSize(SG02);
end;

procedure TF_D24.FormShow(Sender: TObject);
var
  D1 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDaT.Text := FormatDateTime('yyyymm',D1);
  E_EDaT.Text := FormatDateTime('yyyymm',D1);
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  UV01 := TStringList.Create;
  UV02 := TStringList.Create;
  UV03 := TStringList.Create;
  SG01Ini;
  SG02Ini;
  SG03Ini;
end;

procedure TF_D24.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  case CB_000.ItemIndex of
    0 : D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15001 >= '''+E_BDat.Text+
                                                 ''' and BEF15001 <= '''+E_EDat.Text+
                                           'z'' Order by BEF15001';
    1 : D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15202 >= '''+E_BDat.Text+
                                                 ''' and BEF15202 <= '''+E_EDat.Text+
                                           'z'' Order by BEF15001';
  End;
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D24.OpenF16(S1 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16006 = '''+S1+
                                      ''' Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

procedure TF_D24.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                      ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D24.OpenF19S(S1 : String);
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT count(*) as Cnt FROM BEFF19 Where BEF19006 = '''+S1+
                                      ''' Group by BEF19006';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

procedure TF_D24.OpenF19(S1 : String);
begin
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19006 = '''+S1+
                                      ''' Order by BEF19001,BEF19007';
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
End;

function  TF_D24.GetUV(S1 : String) : String;
var
  i : integer;
  Ret : Real;
  S0,SS : String;
begin
  Ret := 0;
  SS  := '';
  S0  := '';
  Result := '--';
  for i:=0 to UV02.Count-1 do
  Begin
    if (KC_GetSubStr(#255,UV02.Strings[i],4) = S1) Then
    Begin
      SS := UV02.Strings[i];
      Break;
    End;
  End;
  if (SS = '') Then Exit;
  for i:=0 to UV01.Count-1 do
  Begin
    if (KC_GetSubStr(#255,UV01.Strings[i],1) <> KC_GetSubStr(#255,SS,1)) Then Continue;
    if (KC_GetSubStr(#255,UV01.Strings[i],2)  > KC_GetSubStr(#255,SS,3)) Then Continue;
    if (KC_GetSubStr(#255,UV01.Strings[i],3)  < KC_GetSubStr(#255,SS,2)) Then Continue;
    if((KC_GetSubStr(#255,UV01.Strings[i],2) >= KC_GetSubStr(#255,SS,2)) and
       (KC_GetSubStr(#255,UV01.Strings[i],3) <= KC_GetSubStr(#255,SS,3))) Then
    Begin
      Ret := (KC_StrToFloat(KC_GetSubStr(#255,UV01.Strings[i],4)) -
              KC_StrToFloat(KC_GetSubStr(#255,UV01.Strings[i],5)))+
              Ret;
      S0  := KC_GetSubStr(#255,UV01.Strings[i],6);
      Continue;
    End;
    Ret := Ret+GetUV(UV01.Strings[i],SS);
    S0  := S0+KC_GetSubStr(#255,UV01.Strings[i],6);
  End;
  Result := Format('%0.2f',[Ret])+#255+copy(S0,1,length(S0)-1);
end;

function  TF_D24.GetUV(SUV,Run : String) : Real;
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
  for i:=0 to UV02.Count-1 do
  Begin
    if (KC_GetSubStr(#255,UV02.Strings[i],1) <> KC_GetSubStr(#255,SUV,1)) Then Continue;
    T1 := KC_B2DateTime(KC_GetSubStr(#255,UV02.Strings[i],2));
    T2 := KC_B2DateTime(KC_GetSubStr(#255,UV02.Strings[i],3));
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

procedure TF_D24.SL01Snd;
var
  PNo : String;
  S1,S2 : String;
  F1,F2 : Real;
begin
  PNo := 'xoxox';
  S1 := '??';
  S2 := '??';
  SL01.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    OpenF16(D.F15.FieldByName('BEF15001').AsString);
    While not D.F16.Eof do
    Begin
      if (PNo<>D.F16.FieldByName('BEF16002').AsString+#255+
               D.F16.FieldByName('BEF16004').AsString) Then
      Begin
        S1 := '??';
        S2 := '??';
        Pno := D.F16.FieldByName('BEF16002').AsString+#255+
               D.F16.FieldByName('BEF16004').AsString;
        D.OpenF10(KC_GetSubStr(#255,Pno,1),KC_GetSubStr(#255,Pno,2));
        While not D.F10.Eof do
        Begin
          if((D.F10.FieldByName('BEF10005').AsString='成型站') or
             (D.F10.FieldByName('BEF10005').AsString='all'))Then
          Begin
            S1 := D.F10.FieldByName('BEF10102').AsString;
            S2 := D.F10.FieldByName('BEF10103').AsString;
            F1 := D.F10.FieldByName('BEF10115').AsFloat;
          End;
          D.F10.Next;
        End;
      End;
      F2 :=(D.F16.FieldByName('BEF16303').AsFloat+   // 收料長度
            D.F16.FieldByName('BEF16305').AsFloat+   // QA  長度
            D.F16.FieldByName('BEF16306').AsFloat)*  // 損耗長度
            D.F16.FieldByName('BEF16304').AsFloat/1000; // 檢驗寬幅
      SL01.Add(D.F16.FieldByName('BEF16006').AsString+#255+ // Working;        1
               D.F16.FieldByName('BEF16001').AsString+#255+ // Run;            2
               D.F16.FieldByName('BEF16002').AsString+#255+ // Product;        3
               D.F16.FieldByName('BEF16004').AsString+#255+ // Process;        4
               S1+#255+ // PET 料號;                                           5
               D.F16.FieldByName('BEF16302').AsString+#255+ // PET 使用長度;   6
               S2+#255+ // UV膠 料號;                                          7
               format('%0.0f',[F1*F2])+#255+ // UV膠 使用量(BOM)               8
               D.F16.FieldByName('BEF16102').AsString+#255+ // Begin  DateTime 9
               D.F16.FieldByName('BEF16103').AsString+#255+ // Finish DateTime 10
               D.F16.FieldByName('BEF16401').AsString);     // UV膠耗用        11
      D.F16.Next;
    End;
    D.F15.Next;
  End;
  SL01.Sort;
End;

procedure TF_D24.OpenF27(S1,S2 : String);
begin
  KC_T3Close(D.F27,D.SC);
  D.F27.CommandText := 'SELECT * FROM BEFF27 Where BEF27002 >= '''+E_BDat.Text+
                                           ''' and BEF27002 <= '''+E_EDat.Text+
                                     'z'' Order by BEF27002';
  KC_T3OPEN(D.F27,D.SC);
  D.F15.First;
End;

procedure TF_D24.SL03Snd;
var
  BOM : Real;
begin
  if (CB_000.ItemIndex = 1) Then Exit;
  SL03.Clear;
  OpenF27(E_BDat.Text,E_EDat.Text);
  While not D.F27.Eof do
  Begin
    D.OpenF15(D.F27.FieldByName('BEF27001').AsString);
    OpenF19S(D.F27.FieldByName('BEF27001').AsString);
    D.OpenF10(D.F15.FieldByName('BEF15002').AsString,D.F15.FieldByName('BEF15004').AsString);
    BOM := 0;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10211').AsString) Then BOM := D.F10.FieldByName('BEF10212').AsFloat;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10221').AsString) Then BOM := D.F10.FieldByName('BEF10222').AsFloat;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10231').AsString) Then BOM := D.F10.FieldByName('BEF10232').AsFloat;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10241').AsString) Then BOM := D.F10.FieldByName('BEF10242').AsFloat;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10251').AsString) Then BOM := D.F10.FieldByName('BEF10252').AsFloat;
    if (D.F27.FieldByName('BEF27003').AsString=D.F10.FieldByName('BEF10261').AsString) Then BOM := D.F10.FieldByName('BEF10262').AsFloat;
    SL03.Add(D.F27.FieldByName('BEF27002').AsString+#255+        // 'Working';
             D.F15.FieldByName('BEF15002').AsString+#255+         // 'Product';
             D.F15.FieldByName('BEF15004').AsString+#255+         // 'Process';
             D.F19.FieldByName('Cnt').AsString+#255+              // 'Count';
             D.F27.FieldByName('BEF27003').AsString+#255+                             // '包材料號';
             D.F19.FieldByName('Cnt').AsString+#255+
             FloatToStr(D.F19.FieldByName('Cnt').AsInteger*BOM)+#255+  // '包材使用量';
             D.F27.FieldByName('BEF27001').AsString);             // '褙膜';
    D.F27.Next;
  End;
  SL03.Sort;
End;

procedure TF_D24.SL03Add(S1,S2 : String;Cnt : Integer);
begin
  if (S1 = '') Then Exit;
  if (KC_EmpSubStr(S2,1) = '') Then Exit;
  SL03.Add(S1+#255+                                             // 'Working';
           D.F15.FieldByName('BEF15002').AsString+#255+         // 'Product';
           D.F15.FieldByName('BEF15004').AsString+#255+         // 'Process';
           IntToStr(Cnt)+#255+                                  // 'Count';
           KC_EmpSubStr(S2,1)+#255+                             // '包材料號';
           IntToStr(Cnt*KC_StrToInt(KC_EmpSubStr(S2,2)))+#255+  // '包材使用量';
           D.F15.FieldByName('BEF15001').AsString);             // '褙膜';
End;

procedure TF_D24.SL02Snd;
var
  i : integer;
  PNo : String;
  S1,S2,S3 : String;
  P   :  array[1..6] of String;
  Cnt : integer;
begin
  SL02.Clear;
  SL03.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    Cnt := 0;
    OpenF19(D.F15.FieldByName('BEF15001').AsString);
    While not D.F19.Eof do
    Begin
      if (PNo<>D.F19.FieldByName('BEF19002').AsString+#255+
               D.F19.FieldByName('BEF19004').AsString) Then
      Begin
        S1 := '??';
        S2 := '??';
        S3 := '??';
        for i:=low(P) to High(P) do P[i] := '';
        Pno := D.F19.FieldByName('BEF19002').AsString+#255+
               D.F19.FieldByName('BEF19004').AsString;
        D.OpenF10(KC_GetSubStr(#255,Pno,1),KC_GetSubStr(#255,Pno,2));
        While not D.F10.Eof do
        Begin
          if((D.F10.FieldByName('BEF10005').AsString='褙膜站') or
             (D.F10.FieldByName('BEF10005').AsString='all'))Then
          Begin
            S1 := D.F10.FieldByName('BEF10106').AsString;
            S2 := D.F10.FieldByName('BEF10107').AsString;
            S3 := D.F10.FieldByName('BEF10201').AsString;
            P[1] := D.F10.FieldByName('BEF10211').AsString+' '+D.F10.FieldByName('BEF10212').AsString;
            P[2] := D.F10.FieldByName('BEF10221').AsString+' '+D.F10.FieldByName('BEF10222').AsString;
            P[3] := D.F10.FieldByName('BEF10231').AsString+' '+D.F10.FieldByName('BEF10232').AsString;
            P[4] := D.F10.FieldByName('BEF10241').AsString+' '+D.F10.FieldByName('BEF10242').AsString;
            P[5] := D.F10.FieldByName('BEF10251').AsString+' '+D.F10.FieldByName('BEF10252').AsString;
            P[6] := D.F10.FieldByName('BEF10261').AsString+' '+D.F10.FieldByName('BEF10262').AsString;
          End;
          D.F10.Next;
        End;
      End;
      inc(Cnt);
      SL02.Add(D.F19.FieldByName('BEF19006').AsString+#255+ // Working;
               D.F19.FieldByName('BEF19001').AsString+'-'+
               D.F19.FieldByName('BEF19007').AsString+#255+ // Run;
               D.F19.FieldByName('BEF19002').AsString+#255+ // 'Product';
               D.F19.FieldByName('BEF19004').AsString+#255+ // 'Process';
               S3+#255+ // 'BEF 料號';
               D.F19.FieldByName('BEF19302').AsString+#255+ // 'BEF 使用長度';
               S1+#255+ // '上保料號';
               D.F19.FieldByName('BEF19307').AsString+#255+ // '上保使用量';
               S2+#255+ // '下保料號';
               D.F19.FieldByName('BEF19308').AsString+#255+// '下保使用量';
               P[1]+#255+ // 包材 1
               P[2]+#255+ // 包材 2
               P[3]+#255+ // 包材 3
               P[4]+#255+ // 包材 4
               P[5]+#255+ // 包材 5
               P[6]);     // 包材 6
      D.F19.Next;
    End;
    if (CB_000.ItemIndex = 1) then SL03Add(D.F15.FieldByName('BEF15301').AsString,P[1],Cnt);
    if (CB_000.ItemIndex = 1) then SL03Add(D.F15.FieldByName('BEF15302').AsString,P[2],Cnt);
    if (CB_000.ItemIndex = 1) then SL03Add(D.F15.FieldByName('BEF15303').AsString,P[3],Cnt);
    if (CB_000.ItemIndex = 1) then SL03Add(D.F15.FieldByName('BEF15304').AsString,P[4],Cnt);
    if (CB_000.ItemIndex = 1) then SL03Add(D.F15.FieldByName('BEF15305').AsString,P[5],Cnt);
    D.F15.Next;
  End;
  SL02.Sort;
  SL03.Sort;
End;

function  TF_D24.SumSL(TSL : TStringList;Wno : String;I1 : Integer) : String;
var
  Ret : Real;
  i : integer;
begin
  Ret := 0.0;
  for i:=0 to TSL.Count-1 do
  Begin
    if (Wno <> KC_GetSubStr(#255,TSL.Strings[i],1)) Then Continue;
    if (I1=99) Then
    begin
      Ret := Ret+1;
      Continue;
    End;
    Ret := Ret+KC_StrToFloat(KC_GetSubStr(#255,TSL.Strings[i],I1));
  End;
  Result := format('%0.0f',[Ret]);
End;

function  TF_D24.GetPck(I1 : integer;S1 : String) :Real;
var
  SS : String;
Begin
  SS := KC_GetSubStr(#255,S1,I1);
  SS := KC_EmpSubStr(SS,2);
  Result := KC_StrToFloat(SS);
End;

procedure TF_D24.SG03Snd;
var
  i : Integer;
begin
  KC_SGClear(1,SG03);
  for i:=0 to SL03.Count-1 do
  Begin
    SG03.Cells[00,i+1] := KC_GetSubStr(#255,SL03.Strings[i],1);
    SG03.Cells[01,i+1] := KC_GetSubStr(#255,SL03.Strings[i],2);
    SG03.Cells[02,i+1] := KC_GetSubStr(#255,SL03.Strings[i],3);
    SG03.Cells[03,i+1] := KC_GetSubStr(#255,SL03.Strings[i],4);
    SG03.Cells[04,i+1] := KC_GetSubStr(#255,SL03.Strings[i],5);
    SG03.Cells[05,i+1] := KC_GetSubStr(#255,SL03.Strings[i],6);
    SG03.Cells[06,i+1] := KC_GetSubStr(#255,SL03.Strings[i],7);
  End;
  SG03.RowCount := SL03.Count+1;
  KC_ColAutoSize(SG03);
End;

procedure TF_D24.SG02Snd;
var
  Wno : String;
  i : integer;
  iRow : integer;
  Cnt : integer;
begin
  KC_SGClear(1,SG02);
  Wno := 'xoxox';
  iRow := 1;
  for i:=0 to SL02.Count-1 do
  Begin
    if (Wno<>KC_GetSubStr(#255,SL02.Strings[i],1)) Then
    Begin
      SG02.Cells[10,iRow] := KC_GetSubStr(#255,SL02.Strings[i],11);
      SG02.Cells[11,iRow] := KC_GetSubStr(#255,SL02.Strings[i],12);
      SG02.Cells[12,iRow] := KC_GetSubStr(#255,SL02.Strings[i],13);
      SG02.Cells[13,iRow] := KC_GetSubStr(#255,SL02.Strings[i],14);
      SG02.Cells[14,iRow] := KC_GetSubStr(#255,SL02.Strings[i],15);
      SG02.Cells[15,iRow] := KC_GetSubStr(#255,SL02.Strings[i],16);
      inc(iRow);
      Wno := KC_GetSubStr(#255,SL02.Strings[i],1);
      SG02.Cells[00,iRow] := KC_GetSubStr(#255,SL02.Strings[i],1);
      SG02.Cells[01,iRow] := KC_GetSubStr(#255,SL02.Strings[i],3);
      SG02.Cells[02,iRow] := KC_GetSubStr(#255,SL02.Strings[i],4);
      SG02.Cells[03,iRow] := KC_GetSubStr(#255,SL02.Strings[i],5);
      SG02.Cells[04,iRow] := SumSL(SL02,Wno,6);
      SG02.Cells[05,iRow] := KC_GetSubStr(#255,SL02.Strings[i],7);
      SG02.Cells[06,iRow] := SumSL(SL02,Wno,8);
      SG02.Cells[07,iRow] := KC_GetSubStr(#255,SL02.Strings[i],9);
      SG02.Cells[08,iRow] := SumSL(SL02,Wno,10);
      SG02.Cells[09,iRow] := SumSL(SL02,Wno,99);
      Cnt := KC_StrToInt(SG02.Cells[09,iRow]);
      SG02.Cells[10,iRow] := format('%0.0f',[Cnt*GetPck(11,SL02.Strings[i])]);
      SG02.Cells[11,iRow] := format('%0.0f',[Cnt*GetPck(12,SL02.Strings[i])]);
      SG02.Cells[12,iRow] := format('%0.0f',[Cnt*GetPck(13,SL02.Strings[i])]);
      SG02.Cells[13,iRow] := format('%0.0f',[Cnt*GetPck(14,SL02.Strings[i])]);
      SG02.Cells[14,iRow] := format('%0.0f',[Cnt*GetPck(15,SL02.Strings[i])]);
      SG02.Cells[15,iRow] := format('%0.0f',[Cnt*GetPck(16,SL02.Strings[i])]);
      inc(iRow)
    End;
    if (CB_Type.Checked) Then
    Begin
      SG02.Cells[02,iRow] := KC_GetSubStr(#255,SL02.Strings[i],2);
      SG02.Cells[03,iRow] := KC_GetSubStr(#255,SL02.Strings[i],5);
      SG02.Cells[04,iRow] := KC_GetSubStr(#255,SL02.Strings[i],6);
      SG02.Cells[05,iRow] := KC_GetSubStr(#255,SL02.Strings[i],7);
      SG02.Cells[06,iRow] := KC_GetSubStr(#255,SL02.Strings[i],8);
      SG02.Cells[07,iRow] := KC_GetSubStr(#255,SL02.Strings[i],9);
      SG02.Cells[08,iRow] := KC_GetSubStr(#255,SL02.Strings[i],10);
      inc(iRow);
    End;
  End;
  SG02.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG02);
End;

procedure TF_D24.SG01Snd;
var
  Wno : String;
  i : integer;
  iRow : integer;
begin
  KC_SGClear(1,SG01);
  Wno := 'xoxox';
  iRow := 1;
  for i:=0 to SL01.Count-1 do
  Begin
    if (Wno<>KC_GetSubStr(#255,SL01.Strings[i],1)) Then
    Begin
      Wno := KC_GetSubStr(#255,SL01.Strings[i],1);
      SG01.Cells[00,iRow] := KC_GetSubStr(#255,SL01.Strings[i],1);
      SG01.Cells[01,iRow] := KC_GetSubStr(#255,SL01.Strings[i],3);
      SG01.Cells[02,iRow] := KC_GetSubStr(#255,SL01.Strings[i],4);
      SG01.Cells[03,iRow] := KC_GetSubStr(#255,SL01.Strings[i],5);
      SG01.Cells[04,iRow] := SumSL(SL01,Wno,6);
      SG01.Cells[05,iRow] := KC_GetSubStr(#255,SL01.Strings[i],7);
      SG01.Cells[06,iRow] := SumSL(SL01,Wno,11);
      SG01.Cells[07,iRow] := SumSL(SL01,Wno,8);
      inc(iRow)
    End;
    if (CB_Type.Checked) Then
    Begin
      SG01.Cells[02,iRow] := KC_GetSubStr(#255,SL01.Strings[i],2);
      SG01.Cells[03,iRow] := KC_GetSubStr(#255,SL01.Strings[i],5);
      SG01.Cells[04,iRow] := KC_GetSubStr(#255,SL01.Strings[i],6);
      SG01.Cells[05,iRow] := KC_GetSubStr(#255,SL01.Strings[i],7);
      SG01.Cells[06,iRow] := KC_GetSubStr(#255,SL01.Strings[i],11);
      SG01.Cells[07,iRow] := KC_GetSubStr(#255,SL01.Strings[i],8);
      SG01.Cells[08,iRow] := KC_GetSubStr(#255,SL01.Strings[i],9);
      SG01.Cells[09,iRow] := KC_GetSubStr(#255,SL01.Strings[i],10);
      inc(iRow);
    End;
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
End;

procedure TF_D24.GetF16Date(var D1,D2 : String);
var
  S : String;
  i : integer;
begin
  D1 := 'zzzzzzzzzzzzzz';
  D2 := '';
  for i:=0 to SL01.Count-1 do
  Begin
    S := SL01.Strings[i];
    if (KC_GetSubStr(#255,S, 9) = '') Then Continue;
    if (KC_GetSubStr(#255,S,10) = '') Then Continue;
    D1 := iif(D1>KC_GetSubStr(#255,S, 9),KC_GetSubStr(#255,S, 9),D1);
    D2 := iif(D2<KC_GetSubStr(#255,S,10),KC_GetSubStr(#255,S,10),D2);
  End;
End;

procedure TF_D24.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 <= '''+S2+
                                          'z'' and BEF18003 >= '''+S1+
                                      ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TF_D24.B_OKClick(Sender: TObject);
begin
  OpenF15;
  SL01Snd;
  SL02Snd;
  SL03Snd;
  SG01Snd;
  SG02Snd;
  SG03Snd;
end;

procedure TF_D24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  UV01.Free;
  UV02.Free;
  UV03.Free;
  KC_CloseExcel(V);
end;

procedure TF_D24.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D24.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D24.xls');
  W := V.Workbooks[1].WorkSheets['成型站'];
  W.Cells[21,6].Value := '日期 : '+E_BDat.Text+' ~ '+E_EDat.Text;
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];

  W := V.Workbooks[1].WorkSheets['褙膜站'];
  W.Cells[21,6].Value := '日期 : '+E_BDat.Text+' ~ '+E_EDat.Text;
  For j:=0 to SG02.RowCount-1 do
  for i:=0 to SG02.ColCount-1 do
    if (SG02.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG02.Cells[i,j];
end;

end.


