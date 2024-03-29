unit U_D08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D08 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel4: TPanel;
    Label3: TLabel;
    L_Date: TLabel;
    L_Type: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    EB102: TEdit;
    EE102: TEdit;
    EB001: TEdit;
    EE001: TEdit;
    CB004: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    CB006: TComboBox;
    CE006: TComboBox;
    CB_ELn: TComboBox;
    CB_BLn: TComboBox;
    Label7: TLabel;
    CB002: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB002Change(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    SL02 : TStringList;
    SL03 : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure OpenF10;
    procedure OpenF16; overload;
    procedure OpenF16(S1,S2 : String); overload;
    procedure OpenF18(S1,S2 : String);
    procedure CB002Ld;
    procedure CB004Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    function  GetF19(I1 : Integer) : String; overload;
    function  GetF19(S1,S2 : String) : String; overload;
    function  GetF19(S1 : String) : String; overload;
    function  GetUV(S1 : String) : String; overload;
    function  GetUV(SUV,Run : String) : Real; overload;
    procedure UV01Snd;
    procedure LoadLne(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D08: TF_D08;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D08.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D08.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D08.OpenF16;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF16 Where BEF16001 >= '''+EB001.Text+
                            ''' and  BEF16001 <= '''+EE001.Text+
                           'z'' and  BEF16005 >= '''+CB_BLn.Text+
                            ''' and  BEF16005 <= '''+CB_ELn.Text+
                           'z'' and  BEF16006 >= '''+CB006.Text+
                            ''' and  BEF16006 <= '''+CE006.Text+
                           'z'' and  BEF16102 >= '''+EB102.Text+
                            ''' and  BEF16102 <= '''+EE102.Text+
                           'z'' Order by BEF16102';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D08.CB004Ld;
begin
  CB004.Items.Clear;
  CB004.Items.Add('all');
  D.F10.First;
  While not D.F10.Eof do
  Begin
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F10.FieldByName('BEF10003').AsString)) Then
    Begin
      D.F10.Next;
      Continue;
    End;
    CB004.Items.Add(D.F10.FieldByName('BEF10002').AsString);
    D.F10.Next;
  End;
  CB004.ItemIndex := 0;
end;

procedure TF_D08.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D08.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Run No.';
  SG01.Cells[01,0] := 'Process No';
  SG01.Cells[02,0] := '使用長度';
  SG01.Cells[03,0] := 'A 級';
  SG01.Cells[04,0] := 'B 級';
  SG01.Cells[05,0] := 'NG級';
  SG01.Cells[06,0] := '損耗';
  SG01.Cells[07,0] := '已褙膜';
  SG01.Cells[08,0] := '已褙膜不足量';
  SG01.Cells[09,0] := '未褙膜';
  SG01.Cells[10,0] := '褙膜損耗';
  SG01.Cells[11,0] := '上保使用';
  SG01.Cells[12,0] := '下保使用';
  SG01.Cells[13,0] := 'UV(g)耗用量';
  SG01.Cells[14,0] := 'UV No';
  SG01.Cells[15,0] := '倉庫庫存';
  SG01.Cells[16,0] := '已出貨';
  SG01.Cells[17,0] := '備註';
  SG01.RowCount := 2;
  KC_ColAutoSize(SG01);
end;

procedure TF_D08.LoadLne(S1 : String);
begin
  D.OpenF12(S1);
  D.F12.First;
  CB_BLn.Clear;
  CB_ELn.Clear;
  While not D.F12.Eof do
  Begin
    CB_BLn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    CB_ELn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB_BLn.ItemIndex := iif(CB_BLn.Items.Count=0,-1,0);
  CB_ELn.ItemIndex := CB_ELn.Items.Count-1;
End;

procedure TF_D08.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  EB102.Text := FormatDateTime('yyyymmddhhnnss',D1);
  EE102.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  OpenF10;
  CB004Ld;
  D.OpenF01('T');
  CB002Ld;
  LoadLne('成型站');
  OpenWF15; PWorkLd(CB006); PWorkLd(CE006);
  SG01Ini;
end;

procedure TF_D08.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  KC_CloseExcel(V);
end;

procedure TF_D08.CB002Ld;
begin
  CB002.Items.Clear;
  CB002.Items.Add('all');
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB002.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB002.ItemIndex := 0;
end;

procedure TF_D08.CB002Change(Sender: TObject);
begin
  CB004Ld;
end;

function TF_D08.GetF19(I1 : Integer) : String;
var
  Ret : Real;
begin
  Ret := D.F19.FieldByName('BEF19302').AsFloat;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    case I1 of
      0 : Ret := Ret+D.F19.FieldByName('BEF19307').AsFloat;
      1 : Ret := Ret+D.F19.FieldByName('BEF19308').AsFloat;
    End;
    D.F19.Next;
  End;
  Result := Format('%0.2f',[Ret]);
end;

function  TF_D08.GetF19(S1,S2 : String) : String;
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

function  TF_D08.GetF19(S1 : String) : String;
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

procedure TF_D08.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 <= '''+S2+
                                          'z'' and BEF18003 >= '''+S1+
                                      ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TF_D08.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                      ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D08.UV01Snd;
var
  i : integer;
  S1 : String;
begin
  OpenF18(EB102.Text,EE102.Text);
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
  OpenF16(EB102.Text,EE102.Text);
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

function  TF_D08.GetUV(S1 : String) : String;
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

function  TF_D08.GetUV(SUV,Run : String) : Real;
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

procedure TF_D08.SG01Snd;
var
  iRow : integer;
  i,j  : integer;
  Ret  : Real;
  S1   : String;
begin
  KC_SGClear(1,SG01);
  iRow := 1;
  While not D.F16.Eof do
  Begin
    if ((CB004.Text <> 'all') and
        (CB004.Text <> D.F16.FieldByName('BEF16004').AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    if ((CB002.Text <> 'all') and
        (CB002.Text <> D.F16.FieldByName('BEF16002').AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    D.OpenF19(D.F16.FieldByName('BEF16001').AsString);
    SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16001').AsString;
    SG01.Cells[01,iRow] := D.F16.FieldByName('BEF16004').AsString;
    SG01.Cells[02,iRow] := D.F16.FieldByName('BEF16302').AsString;
    SG01.Cells[03,iRow] := D.F16.FieldByName('BEF16303').AsString;
    SG01.Cells[04,iRow] := D.F16.FieldByName('BEF16304').AsString;
    SG01.Cells[05,iRow] := D.F16.FieldByName('BEF16305').AsString;
    SG01.Cells[06,iRow] := D.F16.FieldByName('BEF16306').AsString;
    SG01.Cells[07,iRow] := GetF19('BEF19303','BEF19304');
    SG01.Cells[08,iRow] := GetF19('2');
    SG01.Cells[09,iRow] := D.F16.FieldByName('BEF16307').AsString;
    SG01.Cells[10,iRow] := GetF19('BEF19305','BEF19306');
    SG01.Cells[11,iRow] := GetF19(0);
    SG01.Cells[12,iRow] := GetF19(1);
    S1 := GetUV(D.F16.FieldByName('BEF16001').AsString);
    SG01.Cells[13,iRow] := KC_GetSubStr(#255,S1,1);
    SG01.Cells[14,iRow] := KC_GetSubStr(#255,S1,2);
    SG01.Cells[15,iRow] := GetF19('3');
    SG01.Cells[16,iRow] := GetF19('4');
    SG01.Cells[17,iRow] := D.F16.FieldByName('BEF16399').AsString;
    D.F16.Next;
    inc(iRow);
  End;
  SG01.Cells[01,iRow] := '總計 :';
  for i:=2 to 16 do
  Begin
    Ret := 0;
    for j:=1 to iRow-1 do Ret := Ret + KC_StrToFloat(SG01.Cells[i,j]);
    SG01.Cells[i,iRow] := iif(Ret=0,'',format('%0.2f',[Ret]));
  End;
  inc(iRow);
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
end;

procedure TF_D08.B_OKClick(Sender: TObject);
begin
  UV01Snd;
  OpenF16;
  SG01Snd;
end;

procedure TF_D08.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D08.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D08.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

end.


