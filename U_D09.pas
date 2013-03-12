unit U_D09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Series, TeEngine, TeeProcs,
  Chart, TeeComma, ComCtrls;

type
  TF_D09 = class(TForm)
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
    L004: TLabel;
    EB102: TEdit;
    EE102: TEdit;
    EB001: TEdit;
    EE001: TEdit;
    CB_Type: TComboBox;
    CB004: TComboBox;
    Panel6: TPanel;
    CB006: TComboBox;
    CE006: TComboBox;
    CB_ELn: TComboBox;
    CB_BLn: TComboBox;
    PC: TPageControl;
    TS01: TTabSheet;
    TS02: TTabSheet;
    SG01: TStringGrid;
    TeeCommander1: TTeeCommander;
    Chart1: TChart;
    T00: TBarSeries;
    T01: TLineSeries;
    Label1: TLabel;
    EB003: TEdit;
    EE003: TEdit;
    Label4: TLabel;
    EB004: TEdit;
    EE004: TEdit;
    Label7: TLabel;
    CB002: TComboBox;
    CB_DD: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure CB002Change(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01      : TStringList;
    SL02      : TStringList;
    SL03      : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure OpenF10;
    procedure OpenF16; overload;
    procedure OpenF16(S1,S2 : String); overload;
    procedure CB002Ld;
    procedure CB004Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure ChrtSnd;
    procedure ChartClear;
    procedure LoadLne(S1 : String);
    procedure OpenF18(S1,S2 : String);
    procedure UV01Snd;
    function  GetUV(S1 : String) : String; overload;
    function  GetUV(SUV,Run : String) : Real; overload;
    procedure AddSLTPar;
    procedure AddTPar;
  public
    { Public declarations }
  end;

var
  F_D09: TF_D09;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D09.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D09.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D09.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D09.SG01Ini;
var
  iCol : integer;
begin
  KC_SGClear(0,SG01);
  case CB_Type.ItemIndex of
    0 : Begin
          SG01.Cells[00,0] := 'Date';
          SG01.Cells[01,0] := 'Working No';
          SG01.Cells[02,0] := 'Run No.';
        End;
    1 : Begin
          SG01.Cells[00,0] := 'Working No';
          SG01.Cells[01,0] := 'Run No.';
          SG01.Cells[02,0] := 'Date';
        End;
    2 : Begin
          SG01.Cells[00,0] := 'Run No.';
          SG01.Cells[01,0] := 'Working No';
          SG01.Cells[02,0] := 'Date';
        End;
  End;
  SG01.Cells[03,0] := 'Line No ';
  SG01.Cells[04,0] := 'Running';
  SG01.Cells[05,0] := 'Hr';
  SG01.Cells[06,0] := 'Product Type';
  SG01.Cells[07,0] := 'Product No';
  SG01.Cells[08,0] := 'Process No';
  SG01.Cells[09,0] := '收料長度';
  SG01.Cells[10,0] := 'uv膠種';
  SG01.Cells[11,0] := 'uv膠耗用量';
  SG01.Cells[12,0] := 'uv照度';
  SG01.Cells[13,0] := 'PET No';
  SG01.Cells[14,0] := 'PET 寬幅';
  SG01.Cells[15,0] := 'PET 厚度';
  SG01.Cells[16,0] := 'ROLLER No';
  SG01.Cells[17,0] := 'Start OPID';
  SG01.Cells[18,0] := 'Start Note';
  SG01.Cells[19,0] := 'Finish OPID';
  SG01.Cells[20,0] := 'Finish Note';
  SG01.Cells[21,0] := 'Begin  DateTime';
  SG01.Cells[22,0] := 'Finish DateTime';
  SG01.Cells[23,0] := '級數';
  SG01.Cells[24,0] := '預估良率';
  iCol := 25;
  if CB_DD.Checked then
  Begin
    SG01.Cells[25,0] := 'Item';
    SG01.Cells[26,0] := 'OP';
    SG01.Cells[27,0] := 'RD';
    SG01.Cells[28,0] := '缺陷數';
    SG01.Cells[29,0] := '檢驗寬幅(mm)';
    SG01.Cells[30,0] := '檢驗長度(mm)';
    SG01.Cells[31,0] := '分條數';
    SG01.Cells[32,0] := '裁切品長(mm)';
    D.OpenF08('成型站',D.F00.FieldByName('BEF00300').AsString);
    iCol := 33;
    While not D.F08.Eof do
    Begin
      SG01.Cells[iCol,0] := D.F08.FieldByName('BEF08101').AsString+#255+
                            D.F08.FieldByName('BEF08102').AsString;
      inc(iCol);
      D.F08.Next;
    End;
  End;
  SG01.ColCount := iCol;
  KC_ColAutoSize(SG01);
end;

procedure TF_D09.CB002Ld;
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

procedure TF_D09.CB004Ld;
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
  CB004.Visible := (CB004.Items.Count > 1);
   L004.Visible := (CB004.Items.Count > 1);
end;

procedure TF_D09.LoadLne(S1 : String);
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

procedure TF_D09.FormShow(Sender: TObject);
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
  D.OpenF00;
  OpenF10;
  D.OpenF01('T');
  CB002Ld;
  CB004Ld;
  LoadLne('成型站');
  OpenWF15; PWorkLd(CB006); PWorkLd(CE006);
  SG01Ini;
end;

procedure TF_D09.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  KC_CloseExcel(V);
end;

procedure TF_D09.CB002Change(Sender: TObject);
begin
  CB004Ld;
end;

procedure TF_D09.OpenF16;
var
  S1  : String;
  SQL : String;
begin
  case CB_Type.ItemIndex of
    0 : S1 := 'BEF16102';
    1 : S1 := 'BEF16006,BEF16001';
    2 : S1 := 'BEF16001';
  End;

    SQL := 'Select * From BEFF16 Where BEF16001 >= '''+EB001.Text+
                              ''' and  BEF16001 <= '''+EE001.Text+
                             'z'' and  BEF16005 >= '''+CB_BLn.Text+
                              ''' and  BEF16005 <= '''+CB_ELn.Text+
                             'z'' and  BEF16006 >= '''+CB006.Text+
                              ''' and  BEF16006 <= '''+CE006.Text+
                             'z'' and  BEF16102 >= '''+EB102.Text+
                              ''' and  BEF16102 <= '''+EE102.Text+
                             'z'' Order by '+S1;
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D09.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 <= '''+S2+
                                          'z'' and BEF18003 >= '''+S1+
                                           ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TF_D09.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                           ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D09.UV01Snd;
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

function  TF_D09.GetUV(S1 : String) : String;
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

function  TF_D09.GetUV(SUV,Run : String) : Real;
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

procedure TF_D09.SG01Snd;
var
  S1,S2 : String;
  Item : String;
  Qty : integer;
  i,j,k,iRow : integer;
  fEB003 : Real;
  fEE003 : Real;
  fEB004 : Real;
  fEE004 : Real;
begin
  iRow := 1;
  KC_SGClear(1,SG01);
  fEB003 := StrToFloatDef(EB003.Text,0);
  fEE003 := StrToFloatDef(EE003.Text,99999);
  fEB004 := StrToFloatDef(EB004.Text,0);
  fEE004 := StrToFloatDef(EE004.Text,99999);
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
    D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    if(D.F02.FieldByName('BEF02003').Asfloat < fEB003) or
      (D.F02.FieldByName('BEF02003').Asfloat > fEE003) or
      (D.F02.FieldByName('BEF02004').Asfloat < fEB004) or
      (D.F02.FieldByName('BEF02004').Asfloat > fEE004)Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SL03.Assign(D.F16.FieldByName('BEF16901'));
    case CB_Type.ItemIndex of
      0 : Begin
            SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16102').AsString; //Date;
            SG01.Cells[01,iRow] := D.F16.FieldByName('BEF16006').AsString; //Working No';
            SG01.Cells[02,iRow] := D.F16.FieldByName('BEF16001').AsString; //Run No.';
          End;
      1 : Begin
            SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16006').AsString; //Working No';
            SG01.Cells[01,iRow] := D.F16.FieldByName('BEF16001').AsString; //Run No.';
            SG01.Cells[02,iRow] := D.F16.FieldByName('BEF16102').AsString; //Date';
          End;
      2 : Begin
            SG01.Cells[00,iRow] := D.F16.FieldByName('BEF16001').AsString; //Run No.';
            SG01.Cells[01,iRow] := D.F16.FieldByName('BEF16006').AsString; //Working No';
            SG01.Cells[02,iRow] := D.F16.FieldByName('BEF16102').AsString; //Date';
          End;
    End;
    SG01.Cells[03,iRow] := D.F16.FieldByName('BEF16005').AsString; //Line No ';
    SG01.Cells[04,iRow] := F.Running01(D.F16.FieldByName('BEF16101').AsString);//Running';
    SG01.Cells[05,iRow] := F.Hr (D.F16.FieldByName('BEF16102').AsString,
                                 D.F16.FieldByName('BEF16103').AsString);//Hr';
    SG01.Cells[06,iRow] := D.F16.FieldByName('BEF16002').AsString; //Product Type';
    SG01.Cells[07,iRow] := D.F16.FieldByName('BEF16003').AsString; //Product No';
    SG01.Cells[08,iRow] := D.F16.FieldByName('BEF16004').AsString; //Process No';
    SG01.Cells[09,iRow] := D.F16.FieldByName('BEF16303').AsString; //'收料長度';
    S1 := GetUV(D.F16.FieldByName('BEF16001').AsString);
    SG01.Cells[10,iRow] := KC_GetSubStr(#255,S1,2); //'uv膠種';
    SG01.Cells[11,iRow] := KC_GetSubStr(#255,S1,1); //'uv膠耗用量';
    SG01.Cells[12,iRow] := D.F16.FieldByName('BEF16205').AsString; //uv照度
    SG01.Cells[13,iRow] := D.F16.FieldByName('BEF16202').AsString; //PET No';
    SG01.Cells[14,iRow] := D.F02.FieldByName('BEF02003').AsString;
    SG01.Cells[15,iRow] := D.F02.FieldByName('BEF02004').AsString;

    SG01.Cells[16,iRow] := D.F16.FieldByName('BEF16204').AsString; //ROLLER No';
    SG01.Cells[17,iRow] := D.F16.FieldByName('BEF16201').AsString; //Start OPID';
    SG01.Cells[18,iRow] := D.F16.FieldByName('BEF16299').AsString; //Start Note';
    SG01.Cells[19,iRow] := D.F16.FieldByName('BEF16301').AsString; //Finish OPID';
    SG01.Cells[20,iRow] := D.F16.FieldByName('BEF16399').AsString; //Finish Note';
    SG01.Cells[21,iRow] := D.F16.FieldByName('BEF16102').AsString; //Begin  DateTime
    SG01.Cells[22,iRow] := D.F16.FieldByName('BEF16103').AsString; //Finish DateTime
    SG01.Cells[23,iRow] := D.F16.FieldByName('BEF16308').AsString;
    SG01.Cells[24,iRow] := F.Yld(SL03);
    if CB_DD.Checked then
    Begin
      Item := #255;
      for i := 0 to SL03.Count-1 do
      Begin
        S1 := SL03.Strings[i];
        if (KC_GetSubStr(#255,S1,2) = '') Then Continue;
        if (Pos('成型',KC_GetSubStr(#255,S1,2)) <> 0) Then Continue;
        if (Item <> KC_GetSubStr(#255,S1,2)) Then
        Begin
          Item := KC_GetSubStr(#255,S1,2);
          inc(iRow);
          SG01.Cells[25,iRow] := KC_GetSubStr(#255,S1,2);
          Qty := 0;
          for j:=0 to SL03.Count-1 do
          Begin
            S2 := SL03.Strings[j];
            if (KC_GetSubStr(#255,S2,2)<>Item) Then Continue;
            if (KC_GetSubStr(#255,S2,3)<>D.F00.FieldByName('BEF00300').AsString) Then Continue;
            Qty := KC_StrToInt(KC_GetSubStr(#255,S2,6))+Qty;
            for k:=33 to SG01.ColCount-1 do
              if (KC_GetSubStr(#255,S2,4)=KC_GetSubStr(#255,SG01.Cells[k,0],1)) Then
                SG01.Cells[k,iRow] := KC_GetSubStr(#255,S2,6);
          End;
          SG01.Cells[28,iRow] := IntToStr(Qty);
        End;
        if ('ZBEF01' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[26,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF02' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[27,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF03' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[24,iRow] := KC_GetSubStr(#255,S1,5)+'%';
        if ('ZBEF04' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[29,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF05' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[30,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF06' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[31,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF07' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[32,iRow] := KC_GetSubStr(#255,S1,5);
        if ('ZBEF10' = KC_GetSubStr(#255,S1,4)) Then SG01.Cells[23,iRow] := KC_GetSubStr(#255,S1,5);
      End;
    End;
    D.F16.Next;
    inc(iRow);
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
end;

procedure TF_D09.ChartClear;
begin
  T00.Clear;
  T01.Clear;
end;

procedure TF_D09.AddSLTPar;
var
  i,j : integer;
  Qty : integer;
begin
  SL01.Clear;
  For i := 33 to SG01.ColCount-1 do
  Begin
    Qty := 0;
    For j := 1 to SG01.RowCount-1 do Qty := Qty + KC_StrToInt(SG01.Cells[i,j]);
    if (Qty = 0) Then Continue;
    SL01.Add(KC_IntFillChar(Qty,10,'0')+#255+SG01.Cells[i,0]);
  End;
  SL01.Sort;
End;

procedure TF_D09.AddTPar;
var
  i,m,Sum : Integer;
begin
  Sum := 0;
  m := 0;
  For i := (SL01.Count-1) downto 0 do
    Sum := Sum+KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1));

  For i := (SL01.Count-1) downto 0 do
  Begin
    m := m + KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1));
    T00.AddXY((SL01.Count-1)-i,KC_StrToInt(KC_GetSubStr(#255,SL01.Strings[i],1)),KC_GetSubStr(#255,SL01.Strings[i],3),T00.SeriesColor);
    T01.AddXY((SL01.Count-1)-i,                                      (m/Sum)*100,KC_GetSubStr(#255,SL01.Strings[i],3),T01.SeriesColor);
  End;
end;

procedure TF_D09.ChrtSnd;
begin
  ChartClear;
  AddSLTPar;
  AddTPar;
end;

procedure TF_D09.B_OKClick(Sender: TObject);
begin
  UV01Snd;
  OpenF16;
  SG01Ini;
  SG01Snd;
  ChrtSnd;
end;

procedure TF_D09.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D09.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D09.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

end.



