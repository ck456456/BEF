unit U_D04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TF_D04 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    B_Chart: TBitBtn;
    Panel4: TPanel;
    Label11: TLabel;
    Label3: TLabel;
    L_Date: TLabel;
    L_Type: TLabel;
    Label2: TLabel;
    CB000: TComboBox;
    EB102: TEdit;
    EE102: TEdit;
    EB001: TEdit;
    EE001: TEdit;
    Panel6: TPanel;
    SG01: TStringGrid;
    CB_Type: TComboBox;
    Label6: TLabel;
    CB004: TComboBox;
    Label5: TLabel;
    CE006: TComboBox;
    CB006: TComboBox;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ChartClick(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
    procedure CB002Change(Sender: TObject);
    procedure CB000Change(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01      : TStringList;
    SL02      : TStringList;
    SL03      : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure OpenFP1;
    procedure OpenF10;
    procedure CB004Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure UV01Snd;
    procedure OpenF18(S1,S2 : String);
    procedure OpenF16(S1,S2 : String);
    function  GetUV(S1 : String) : String; overload;
    function  GetUV(SUV,Run : String) : Real; overload;
    procedure LoadLne(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D04: TF_D04;
                                                      
implementation

uses U_KcPub, U_D, U_F, U_D0401, U_V03, U_V05;

{$R *.dfm}

procedure TF_D04.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D04.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D04.SG01Ini;
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
  SG01.Cells[09,0] := 'PET No';
  SG01.Cells[10,0] := 'ROLLER No';
  SG01.Cells[11,0] := '上保 No';
  SG01.Cells[12,0] := '下保 No';
  SG01.Cells[13,0] := '使用長度';
  SG01.Cells[14,0] := 'A 級長度';
  SG01.Cells[15,0] := 'B 級長度';
  SG01.Cells[16,0] := 'NG級長度';
  SG01.Cells[17,0] := '損耗長度';
  SG01.Cells[18,0] := '未褙膜長度';
  SG01.Cells[19,0] := 'UV 耗用量';
  SG01.Cells[20,0] := 'UV No';
  SG01.Cells[21,0] := 'Start OPID';
  SG01.Cells[22,0] := 'Start Note';
  SG01.Cells[23,0] := 'Finish OPID';
  SG01.Cells[24,0] := 'Finish Note';
  SG01.Cells[25,0] := 'Begin  DateTime';
  SG01.Cells[26,0] := 'Finish DateTime';
  KC_ColAutoSize(SG01);
end;

procedure TF_D04.OpenFP1;
var
  S1  : String;
  SQL : String;
begin
  case CB000.ItemIndex of
    0 : case CB_Type.ItemIndex of
          0 : S1 := 'BEF16102';
          1 : S1 := 'BEF16006,BEF16001';
          2 : S1 := 'BEF16001';
        End;
    1 : case CB_Type.ItemIndex of
          0 : S1 := 'BEF19102';
          1 : S1 := 'BEF19006,BEF19001,BEF19007';
          2 : S1 := 'BEF19001,BEF19007';
        End;
  End;

  SQL := 'Select * From BEFF19 Where BEF19001 >= '''+EB001.Text+
                            ''' and  BEF19001 <= '''+EE001.Text+
                           'z'' and  BEF19005 >= '''+CB_BLn.Text+
                            ''' and  BEF19005 <= '''+CB_ELn.Text+
                           'z'' and  BEF19006 >= '''+CB006.Text+
                            ''' and  BEF19006 <= '''+CE006.Text+
                           'z'' and  BEF19102 >= '''+EB102.Text+
                            ''' and  BEF19102 <= '''+EE102.Text+
                           'z'' Order by '+S1;
  if (CB000.ItemIndex=0) Then
    SQL := 'Select * From BEFF16 Where BEF16001 >= '''+EB001.Text+
                              ''' and  BEF16001 <= '''+EE001.Text+
                             'z'' and  BEF16005 >= '''+CB_BLn.Text+
                              ''' and  BEF16005 <= '''+CB_ELn.Text+
                             'z'' and  BEF16006 >= '''+CB006.Text+
                              ''' and  BEF16006 <= '''+CE006.Text+
                             'z'' and  BEF16102 >= '''+EB102.Text+
                              ''' and  BEF16102 <= '''+EE102.Text+
                             'z'' Order by '+S1;
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_D04.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 <= '''+S2+
                                          'z'' and BEF18003 >= '''+S1+
                                           ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TF_D04.OpenF16(S1,S2 : String);
begin
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 <= '''+S2+
                                          'z'' and BEF16103 >= '''+S1+
                                           ''' Order by BEF16005,BEF16102';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D04.UV01Snd;
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

function  TF_D04.GetUV(S1 : String) : String;
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

function  TF_D04.GetUV(SUV,Run : String) : Real;
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

procedure TF_D04.SG01Snd;
var
  S1 : String;
  S3 : String;
  iRow : integer;
begin
  iRow := 1;
  KC_SGClear(1,SG01);
  S3 := iif(CB000.ItemIndex<>0,'BEF19004','BEF16004');
  While not D.FP1.Eof do
  Begin
    if ((CB004.Text <> 'all') and
        (CB004.Text <> D.FP1.FieldByName(S3).AsString)) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    case CB000.ItemIndex of
      0 : Begin
            case CB_Type.ItemIndex of
              0 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF16102').AsString; //Date;
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF16006').AsString; //Working No';
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF16001').AsString; //Run No.';
                  End;
              1 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF16006').AsString; //Working No';
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF16001').AsString; //Run No.';
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF16102').AsString; //Date';
                  End;
              2 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF16001').AsString; //Run No.';
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF16006').AsString; //Working No';
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF16102').AsString; //Date';
                  End;
            End;
            SG01.Cells[03,iRow] := D.FP1.FieldByName('BEF16005').AsString; //Line No ';
            SG01.Cells[04,iRow] := F.Running01(D.FP1.FieldByName('BEF16101').AsString);//Running';
            SG01.Cells[05,iRow] := F.Hr (D.FP1.FieldByName('BEF16102').AsString,
                                         D.FP1.FieldByName('BEF16103').AsString);//Hr';
            SG01.Cells[06,iRow] := D.FP1.FieldByName('BEF16002').AsString; //Product Type';
            SG01.Cells[07,iRow] := D.FP1.FieldByName('BEF16003').AsString; //Product No';
            SG01.Cells[08,iRow] := D.FP1.FieldByName('BEF16004').AsString; //Process No';
            SG01.Cells[09,iRow] := D.FP1.FieldByName('BEF16202').AsString; //PET No';
            SG01.Cells[10,iRow] := D.FP1.FieldByName('BEF16204').AsString; //ROLLER No';
            SG01.Cells[11,iRow] := ''; //上保 No';
            SG01.Cells[12,iRow] := ''; //下保 No';
            SG01.Cells[13,iRow] := D.FP1.FieldByName('BEF16302').AsString; //使用長度';
            SG01.Cells[14,iRow] := D.FP1.FieldByName('BEF16303').AsString; //A 級長度';
            SG01.Cells[15,iRow] := D.FP1.FieldByName('BEF16304').AsString; //B 級長度';
            SG01.Cells[16,iRow] := D.FP1.FieldByName('BEF16305').AsString; //NG級長度';
            SG01.Cells[17,iRow] := D.FP1.FieldByName('BEF16306').AsString; //損耗長度';
            SG01.Cells[18,iRow] := D.FP1.FieldByName('BEF16307').AsString; //未褙膜長度';
            S1 := GetUV(D.F16.FieldByName('BEF16001').AsString);
            SG01.Cells[19,iRow] := KC_GetSubStr(#255,S1,1);
            SG01.Cells[20,iRow] := KC_GetSubStr(#255,S1,2);
            SG01.Cells[21,iRow] := D.FP1.FieldByName('BEF16201').AsString; //Start OPID';
            SG01.Cells[22,iRow] := D.FP1.FieldByName('BEF16299').AsString; //Start Note';
            SG01.Cells[23,iRow] := D.FP1.FieldByName('BEF16301').AsString; //Finish OPID';
            SG01.Cells[24,iRow] := D.FP1.FieldByName('BEF16399').AsString; //Finish Note';
            SG01.Cells[25,iRow] := D.FP1.FieldByName('BEF16102').AsString; //Begin  DateTime
            SG01.Cells[26,iRow] := D.FP1.FieldByName('BEF16103').AsString; //Finish DateTime
          End;
      1 : Begin
            D.OpenF16(D.FP1.FieldByName('BEF19001').AsString);
            case CB_Type.ItemIndex of
              0 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF19102').AsString; //Date;
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF19006').AsString; //Working No';
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF19001').AsString+#255+
                                           D.FP1.FieldByName('BEF19007').AsString;
                  End;
              1 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF19006').AsString; //Working No';
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF19001').AsString+#255+
                                           D.FP1.FieldByName('BEF19007').AsString;
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF19102').AsString; //Date';
                  End;
              2 : Begin
                    SG01.Cells[00,iRow] := D.FP1.FieldByName('BEF19001').AsString+#255+
                                           D.FP1.FieldByName('BEF19007').AsString;
                    SG01.Cells[01,iRow] := D.FP1.FieldByName('BEF19006').AsString; //Working No';
                    SG01.Cells[02,iRow] := D.FP1.FieldByName('BEF19102').AsString; //Date';
                  End;
            End;
            SG01.Cells[03,iRow] := D.FP1.FieldByName('BEF19005').AsString; //Line No ';
            SG01.Cells[04,iRow] := F.Station(D.FP1.FieldByName('BEF19101').AsString);//Running';
            SG01.Cells[05,iRow] := F.Hr (D.FP1.FieldByName('BEF19102').AsString,
                                         D.FP1.FieldByName('BEF19103').AsString);//Hr';
            SG01.Cells[06,iRow] := D.FP1.FieldByName('BEF19002').AsString; //Product Type';
            SG01.Cells[07,iRow] := D.FP1.FieldByName('BEF19003').AsString; //Product No';
            SG01.Cells[08,iRow] := D.FP1.FieldByName('BEF19004').AsString; //Process No';
            SG01.Cells[09,iRow] := D.F16.FieldByName('BEF16202').AsString; //PET No';
            SG01.Cells[10,iRow] := D.F16.FieldByName('BEF16204').AsString; //ROLLER No';
            SG01.Cells[11,iRow] := D.FP1.FieldByName('BEF19202').AsString; //上保 No';
            SG01.Cells[12,iRow] := D.FP1.FieldByName('BEF19203').AsString; //下保 No';
            SG01.Cells[13,iRow] := D.FP1.FieldByName('BEF19302').AsString; //使用長度';
            SG01.Cells[14,iRow] := D.FP1.FieldByName('BEF19303').AsString; //A 級長度';
            SG01.Cells[15,iRow] := D.FP1.FieldByName('BEF19304').AsString; //B 級長度';
            SG01.Cells[16,iRow] := D.FP1.FieldByName('BEF19305').AsString; //NG級長度';
            SG01.Cells[17,iRow] := D.FP1.FieldByName('BEF19306').AsString; //損耗長度';
            SG01.Cells[18,iRow] := D.F16.FieldByName('BEF16307').AsString; //未褙膜長度';
            S1 := GetUV(D.F16.FieldByName('BEF19001').AsString);
            SG01.Cells[19,iRow] := KC_GetSubStr(#255,S1,1);
            SG01.Cells[20,iRow] := KC_GetSubStr(#255,S1,2);
            SG01.Cells[21,iRow] := D.FP1.FieldByName('BEF19201').AsString; //Start OPID';
            SG01.Cells[22,iRow] := D.FP1.FieldByName('BEF19299').AsString; //Start Note';
            SG01.Cells[23,iRow] := D.FP1.FieldByName('BEF19301').AsString; //Finish OPID';
            SG01.Cells[24,iRow] := D.FP1.FieldByName('BEF19399').AsString; //Finish Note';
            SG01.Cells[25,iRow] := D.FP1.FieldByName('BEF19102').AsString; //Begin  DateTime
            SG01.Cells[26,iRow] := D.FP1.FieldByName('BEF19103').AsString; //Finish DateTime
          End;
    End;
    inc(iRow);
    D.FP1.Next;
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
end;

procedure TF_D04.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D04.CB004Ld;
begin
  CB004.Items.Clear;
  CB004.Items.Add('all');
  D.F10.First;
  While not D.F10.Eof do
  Begin
    CB004.Items.Add(D.F10.FieldByName('BEF10002').AsString);
    D.F10.Next;
  End;
  CB004.ItemIndex := 0;
end;

procedure TF_D04.LoadLne(S1 : String);
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

procedure TF_D04.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  EB102.Text := KC_Data2B(F.IdTime.DateTime-7);
  EE102.Text := KC_Data2B(F.IdTime.DateTime);
  OpenF10;
  CB004Ld;
  OpenWF15;   PWorkLd(CB006);   PWorkLd(CE006);
  LoadLne(CB000.Text);
  SG01Ini;
end;

procedure TF_D04.B_OKClick(Sender: TObject);
begin
  UV01Snd;
  OpenFP1;
  SG01Ini;
  SG01Snd;
end;

procedure TF_D04.CB_TypeChange(Sender: TObject);
begin
  SG01Ini;
end;

procedure TF_D04.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.StationToColor(Cells[ACol,ARow]);
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left , Rect.Top + 2, Cells[ACol,ARow]);
    if (gdSelected in State) then
    Begin
       Canvas.Brush.Color := clBlack;
       Canvas.FrameRect(Rect);
       Canvas.DrawFocusRect(Rect);
    End;
  End;
end;

procedure TF_D04.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D04.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D04.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

procedure TF_D04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  KC_CloseExcel(V);
end;

procedure TF_D04.B_ChartClick(Sender: TObject);
begin
  F_D0401 := TF_D0401.Create(Application);
  try
    F_D0401.ShowModal;
  finally
    F_D0401.Free;
  end;
end;

procedure TF_D04.SG01DblClick(Sender: TObject);
begin
  if (SG01.Cells[0,SG01.Row] = '') Then Exit;
  if (CB000.Text = '成型站' ) Then
  Begin
    F_V03 := TF_V03.Create(Application);
    F_V03.Kind := 3;
    F_V03.iStation := 10;
    case CB_Type.ItemIndex of
      0 : F_V03.E_10001.Text  := SG01.Cells[2,SG01.Row];
      1 : F_V03.E_10001.Text  := SG01.Cells[1,SG01.Row];
      2 : F_V03.E_10001.Text  := SG01.Cells[0,SG01.Row];
    End;
    F_V03.ShowModal;
    F_V03.Free;
  End;
  if (CB000.Text <> '成型站' ) Then
  Begin
    F_V05 := TF_V05.Create(Application);
    F_V05.Kind := 3;
    F_V05.CB_Station.ItemIndex := 0;
    case CB_Type.ItemIndex of
      0 : F_V05.Run  := SG01.Cells[2,SG01.Row];
      1 : F_V05.Run  := SG01.Cells[1,SG01.Row];
      2 : F_V05.Run  := SG01.Cells[0,SG01.Row];
    End;
    F_V05.ShowModal;
    F_V05.Free;
  End;
end;

procedure TF_D04.CB002Change(Sender: TObject);
begin
  CB004Ld;
end;

procedure TF_D04.CB000Change(Sender: TObject);
begin
  LoadLne(CB000.Text);
end;

end.


