unit U_D14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, DB;

type
  TF_D14 = class(TForm)
    P_Main: TPanel;
    Panel4: TPanel;
    L_Date: TLabel;
    E_EDT: TEdit;
    E_BDT: TEdit;
    CB_Type: TCheckBox;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel6: TPanel;
    SG01: TStringGrid;
    CB002: TComboBox;
    Label7: TLabel;
    Label1: TLabel;
    CB003: TComboBox;
    Label3: TLabel;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    Label2: TLabel;
    CB_001: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_ExcelClick(Sender: TObject);
    procedure CB_BLnChange(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    procedure LoadLne;
    procedure SG01Ini;
    procedure SG01Snd;
    function  GetJdgF16 : String;
    procedure SL01Snd;
    procedure OpenF16(S1,S2 : String);
    procedure OpenF05(S1 : String);
    procedure CB002Ld;
    procedure CB003Ld;
    function  GetF19(S1 : String) : String;
  public
    { Public declarations }
  end;

var
  F_D14: TF_D14;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D14.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
End;

procedure TF_D14.CB002Ld;
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

procedure TF_D14.CB003Ld;
begin
  CB003.Items.Clear;
  CB003.Items.Add('all');
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB003.Items.Add(D.F05.FieldByName('BEF05001').AsString+#255+
                    D.F05.FieldByName('BEF05099').AsString);
    D.F05.Next;
  End;
  CB003.ItemIndex := 0;
end;

procedure TF_D14.SG01Ini;
var
  i : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '規格';
  SG01.Cells[01,0] := 'PET 廠商';
  SG01.Cells[02,0] := 'PET 寬度';
  SG01.Cells[03,0] := 'PET 厚度';
  SG01.Cells[04,0] := 'PET 處理';
  SG01.Cells[05,0] := '總使用率(%)';
  SG01.Cells[06,0] := '成型使用率(%)';
  SG01.Cells[07,0] := '檢驗寬幅';
  SG01.Cells[08,0] := '成型使用長度(m)';
  SG01.Cells[09,0] := '成型良品長度(m)';
  SG01.Cells[10,0] := '成型未判長度';
  SG01.Cells[11,0] := '成型A';
  SG01.Cells[12,0] := '成型B';
  SG01.Cells[13,0] := '成型C';
  SG01.Cells[14,0] := '成型D';
  SG01.Cells[15,0] := '成型NG';
  SG01.Cells[16,0] := '成型損耗';
  SG01.Cells[17,0] := '褙模使用率(%)';
  SG01.Cells[18,0] := '褙模使用長度(m)';
  SG01.Cells[19,0] := '褙模良品長度(m)';
  SG01.Cells[20,0] := '未褙模長度';
  SG01.Cells[21,0] := '褙模未判長度';
  SG01.Cells[22,0] := '褙模A';
  SG01.Cells[23,0] := '褙模B';
  SG01.Cells[24,0] := '褙模C';
  SG01.Cells[25,0] := '褙模D';
  SG01.Cells[26,0] := '褙模NG';
  SG01.Cells[27,0] := '褙模損耗';
  SG01.Cells[28,0] := '褙模良品長度(m2)';
  SG01.Cells[29,0] := '上保護膜廠商';
  SG01.Cells[30,0] := '上保護膜Type';
  SG01.Cells[31,0] := '上保護膜寬度';
  SG01.Cells[32,0] := '上保護膜厚度';
  SG01.Cells[33,0] := '下保護膜廠商';
  SG01.Cells[34,0] := '下保護膜Type';
  SG01.Cells[35,0] := '下保護膜寬度';
  SG01.Cells[36,0] := '下保護膜厚度';
  SG01.Cells[37,0] := 'UV膠';
  SG01.RowCount := 2;
  KC_ColAutoSize(SG01);
  for i:=29 to 36 do SG01.ColWidths[i] := 0;
end;

procedure TF_D14.LoadLne;
begin
  CB_BLn.Clear;
  CB_ELn.Clear;
  CB_BLn.Items.Add('all');
  D.F21.First;
  While not D.F21.Eof do
  Begin
    CB_BLn.Items.Add('all'#255+D.F21.FieldByName('BEF21001').AsString);
    D.F21.Next;
  End;

  D.F12.First;
  While not D.F12.Eof do
  Begin
    CB_BLn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    CB_ELn.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB_BLn.ItemIndex := iif(CB_BLn.Items.Count=0,-1,0);
  CB_ELn.ItemIndex := iif(CB_ELn.Items.Count=0,-1,0);
End;

procedure TF_D14.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  D.OpenF00;
  D.OpenF01('T');
  D.OpenF21;
  D.OpenF12('成型站');
  OpenF05(D.F00.FieldByName('BEF00201').ASSTRING);
  LoadLne; CB_BLnChange(Sender);
  CB002Ld;
  CB003Ld;
  SG01Ini;
end;

procedure TF_D14.OpenF16(S1,S2 : String);
var
  SQL : String;
begin
  SQL := 'Select * From BEFF16 Where BEF16102 >= '''+E_BDT.Text+
                            ''' and  BEF16102 <= '''+E_EDT.Text+
                           'z'' Order by BEF16202';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

function  TF_D14.GetJdgF16 : String;
var
  i : integer;
  Q : array[0..8] of String;
  Jdg : String;
begin
   for i := Low(Q) to High(Q) do Q[i] := '';
   Jdg := D.F16.FieldByName('BEF16308').AsString;
   Q[0] := '0';                                                       // 良率長度   8
   if (Jdg=''  ) Then Q[1] := D.F16.FieldByName('BEF16303').AsString; // 未判       9
   if (Jdg='A' ) Then Q[2] := D.F16.FieldByName('BEF16303').AsString; // 'A'       10
   if (Jdg='B' ) Then Q[3] := D.F16.FieldByName('BEF16303').AsString; // 'B'       11
   if (Jdg='C' ) Then Q[4] := D.F16.FieldByName('BEF16303').AsString; // 'C'       12
   if (Jdg='D' ) Then Q[5] := D.F16.FieldByName('BEF16303').AsString; // 'D'       13
   if (Jdg='NG') Then Q[6] := D.F16.FieldByName('BEF16303').AsString; // 'NG'      14
   Q[7] := D.F16.FieldByName('BEF16306').AsString;                    // 損耗長度  15
   Q[8] := D.F16.FieldByName('BEF16307').AsString;                    // 未褙膜長度16

   Q[0] := Format('%0.2f',[KC_StrToFloat(Q[2])+   // 'A'
                           KC_StrToFloat(Q[3])+   // 'B'
                           KC_StrToFloat(Q[4])+   // 'C'
                           KC_StrToFloat(Q[5])+   // 'C'
                           KC_StrToFloat(Q[6])]); // 'NG'
   Result := Q[0]+#255+
             Q[1]+#255+
             Q[2]+#255+
             Q[3]+#255+
             Q[4]+#255+
             Q[5]+#255+
             Q[6]+#255+
             Q[7]+#255+
             Q[8]+#255+
             D.F16.FieldByName('BEF16102').AsString+#255+   // 17
             D.F16.FieldByName('BEF16103').AsString;        // 18

end;

procedure TF_D14.SL01Snd;
begin
  SL01.Clear;
  D.F16.First;
  While not D.F16.Eof do
  Begin
    if ((0=POS('all',CB_BLn.Text)) and
       ((CB_BLn.Text > D.F16.FieldByName('BEF16005').AsString) or
        (CB_ELn.Text < D.F16.FieldByName('BEF16005').AsString))) Then
    Begin
      D.F16.Next;
      Continue;
    End;

    if ((0<>POS('all',CB_BLn.Text)) and
       (''<>KC_GetSubStr(#255,CB_BLn.Text,2))) Then
    Begin
      D.F12.Locate('BEF12001;BEF12002',VarArrayOf(['成型站',D.F16.FieldByName('BEF16005').AsString]), [loCaseInsensitive]);
      if (KC_GetSubStr(#255,CB_BLn.Text,2)<> D.F12.FieldByName('BEF12005').AsString) Then
      Begin
        D.F16.Next;
        Continue;
      End;
    End;
    if ((CB002.ItemIndex <> 0) and
        (CB002.Text <> D.F16.FieldByName('BEF16002' ).AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    if ((CB003.ItemIndex <> 0) and
        (KC_GetSubStr(#255,CB003.Text,1) <> D.F02.FieldByName('BEF02002').AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    D.OpenF10(D.F16.FieldByName('BEF16002').AsString,D.F16.FieldByName('BEF16004').AsString);
    if (CB_001.ItemIndex <> 0) Then
    Begin
      case CB_001.ItemIndex of
        1 : if((D.F10.FieldByName('BEF10004').AsString = 'T') or
               (D.F16.FieldByName('BEF16007').AsString = 'Y'))Then
            Begin
              D.F16.Next;
              Continue;
            End;
        2 : if((D.F10.FieldByName('BEF10004').AsString <> 'T') and
               (D.F16.FieldByName('BEF16007').AsString <> 'Y'))Then
            Begin
              D.F16.Next;
              Continue;
            End;
      End;
    End;

    SL01.Add(D.F16.FieldByName('BEF16002').AsString+#255+ // 規格     1
             D.F02.FieldByName('BEF02002').AsString+#255+ // PET規格  2
             D.F10.FieldByName('BEF10103').AsString+#255+ // UV 膠    3
             D.F16.FieldByName('BEF16005').AsString+#255+ // Line     4
             D.F16.FieldByName('BEF16001').AsString+#255+ // Run      5
             D.F16.FieldByName('BEF16304').AsString+#255+ // 檢驗寬幅 6
             D.F16.FieldByName('BEF16302').AsString+#255+ // 使用長度 7
             GetJdgF16);
    D.F16.Next;
  End;
  SL01.Sort;
end;

function  TF_D14.GetF19(S1 : String) : String;
var
  Ret : Real;
begin
  Result := '';
  D.F19.First;
  Ret := 0;
  While not D.F19.Eof do
  Begin
    if (S1 = '使用長度') Then
    Begin
      Ret := Ret + D.F19.FieldByName('BEF19302').Asfloat;
      D.F19.Next;
      Continue;
    End;

    if ((S1 = '') and (D.F19.FieldByName('BEF19003').AsString = '')) Then
    Begin
      Ret := Ret + D.F19.FieldByName('BEF19303').Asfloat;
      D.F19.Next;
      Continue;
    End;

    D.F05.Locate('BEF05001',D.F19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
    if (S1 = #255) Then
      Ret := Ret + D.F19.FieldByName('BEF19306').Asfloat;
    if (S1 = D.F05.FieldByName('BEF05003').AsString) Then
      Ret := Ret + D.F19.FieldByName('BEF19303').Asfloat;
    D.F19.Next;
  End;
  if (Ret <> 0) then Result := Format('%0.2f',[Ret]);
End;

procedure TF_D14.SG01Snd;
var
  S : String;
  i : Integer;
  iRow : integer;
  iCRow : integer;
  ii: integer;
  RNo  : String;
  F1,F2,F3,F4 : Real;
begin
  iRow := 1;
  iCRow := 1;
  RNo := '---';
  KC_SGClear(1,SG01);
  for i:=0 to SL01.Count-1 do
  Begin
    S := KC_GetSubStr(#255,SL01.Strings[i],1)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],2)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],3);
    D.OpenF19(KC_GetSubStr(#255,SL01.Strings[i],05));
    if (RNo <> S) Then
    Begin
      D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],02), [loCaseInsensitive]);
      SG01.Cells[00,iRow] := KC_GetSubStr(#255,SL01.Strings[i],01);
      SG01.Cells[01,iRow] := D.F05.FieldByName('BEF05006').AsString;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05004').AsString;
      SG01.Cells[03,iRow] := D.F05.FieldByName('BEF05005').AsString;
      SG01.Cells[04,iRow] := D.F05.FieldByName('BEF05007').AsString;
      (*
      D.OpenF16(KC_GetSubStr(#255,SL01.Strings[i],05));
      D.OpenF10(D.F16.FieldByName('BEF16002').AsString,D.F16.FieldByName('BEF16004').AsString);
      D.F05.Locate('BEF05001',D.F10.FieldByName('BEF10106').AsString, [loCaseInsensitive]);
      SG01.Cells[29,iRow] := D.F05.FieldByName('BEF05103').AsString;
      SG01.Cells[30,iRow] := D.F05.FieldByName('BEF05104').AsString;
      SG01.Cells[31,iRow] := D.F05.FieldByName('BEF05101').AsString;
      SG01.Cells[32,iRow] := D.F05.FieldByName('BEF05102').AsString;
      D.F05.Locate('BEF05001',D.F10.FieldByName('BEF10107').AsString, [loCaseInsensitive]);
      SG01.Cells[33,iRow] := D.F05.FieldByName('BEF05103').AsString;
      SG01.Cells[34,iRow] := D.F05.FieldByName('BEF05104').AsString;
      SG01.Cells[35,iRow] := D.F05.FieldByName('BEF05101').AsString;
      SG01.Cells[36,iRow] := D.F05.FieldByName('BEF05102').AsString;
      *)
      SG01.Cells[37,iRow] := KC_GetSubStr(#255,SL01.Strings[i],03);
      ii  := 0;
      RNo := S;
      iCRow := iRow;
      inc(iRow);
    End;
    if CB_Type.Checked Then
    Begin
      SG01.Cells[05,iRow] := KC_GetSubStr(#255,SL01.Strings[i],05);
      SG01.Cells[06,iRow] := KC_GetSubStr(#255,SL01.Strings[i],04);
      SG01.Cells[07,iRow] := KC_GetSubStr(#255,SL01.Strings[i],06);
      SG01.Cells[08,iRow] := KC_GetSubStr(#255,SL01.Strings[i],07);
      SG01.Cells[09,iRow] := KC_GetSubStr(#255,SL01.Strings[i],08);
      SG01.Cells[10,iRow] := KC_GetSubStr(#255,SL01.Strings[i],09);
      SG01.Cells[11,iRow] := KC_GetSubStr(#255,SL01.Strings[i],10);
      SG01.Cells[12,iRow] := KC_GetSubStr(#255,SL01.Strings[i],11);
      SG01.Cells[13,iRow] := KC_GetSubStr(#255,SL01.Strings[i],12);
      SG01.Cells[14,iRow] := KC_GetSubStr(#255,SL01.Strings[i],13);
      SG01.Cells[15,iRow] := KC_GetSubStr(#255,SL01.Strings[i],14);
      SG01.Cells[16,iRow] := KC_GetSubStr(#255,SL01.Strings[i],15);
      SG01.Cells[18,iRow] := GetF19('使用長度');
      SG01.Cells[20,iRow] := KC_GetSubStr(#255,SL01.Strings[i],16); // 未褙模長度
      SG01.Cells[21,iRow] := GetF19('');
      SG01.Cells[22,iRow] := GetF19('A');
      SG01.Cells[23,iRow] := GetF19('B');
      SG01.Cells[24,iRow] := GetF19('C');
      SG01.Cells[25,iRow] := GetF19('D');
      SG01.Cells[26,iRow] := GetF19('NG');
      SG01.Cells[27,iRow] := GetF19(#255);
      SG01.Cells[37,iRow] := KC_GetSubStr(#255,SL01.Strings[i],03);
      SG01.Cells[38,iRow] := KC_GetSubStr(#255,SL01.Strings[i],17);
      SG01.Cells[39,iRow] := KC_GetSubStr(#255,SL01.Strings[i],18);
      inc(iRow);
    End;
    SG01.Cells[07,iCRow] := KC_GetSubStr(#255,SL01.Strings[i],06);
    SG01.Cells[08,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[08,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],07))]);
    SG01.Cells[09,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[09,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],08))]);
    SG01.Cells[10,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[10,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],09))]);
    SG01.Cells[11,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[11,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],10))]);
    SG01.Cells[12,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[12,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],11))]);
    SG01.Cells[13,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[13,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],12))]);
    SG01.Cells[14,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[14,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],13))]);
    SG01.Cells[15,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[15,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],14))]);
    SG01.Cells[16,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[16,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],15))]);

    SG01.Cells[18,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[18,iCRow]) + KC_StrToFloat(GetF19('使用長度'))]);
    SG01.Cells[20,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[20,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],16))]);
    SG01.Cells[21,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[21,iCRow]) + KC_StrToFloat(GetF19(''))]);
    SG01.Cells[22,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[22,iCRow]) + KC_StrToFloat(GetF19('A'))]);
    SG01.Cells[23,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[23,iCRow]) + KC_StrToFloat(GetF19('B'))]);
    SG01.Cells[24,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[24,iCRow]) + KC_StrToFloat(GetF19('C'))]);
    SG01.Cells[25,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[25,iCRow]) + KC_StrToFloat(GetF19('D'))]);
    SG01.Cells[26,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[26,iCRow]) + KC_StrToFloat(GetF19('NG'))]);
    SG01.Cells[27,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[27,iCRow]) + KC_StrToFloat(GetF19(#255))]);
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[00,i] = '') then Continue;
    F1 := KC_StrToFloat(SG01.Cells[08,i])-KC_StrToFloat(SG01.Cells[10,i]);
    F2 := KC_StrToFloat(SG01.Cells[09,i]);
    F3 := 0;
    F4 := 0;
    if (F1<>0) Then SG01.Cells[06,i] := format('%0.2f%%',[F2/F1*100]);
    if (F1<>0) Then F3 := F2/F1;
    SG01.Cells[19,i] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[22,i])+
                                        KC_StrToFloat(SG01.Cells[23,i])+
                                        KC_StrToFloat(SG01.Cells[24,i])+
                                        KC_StrToFloat(SG01.Cells[25,i])+
                                        KC_StrToFloat(SG01.Cells[26,i])]);
    SG01.Cells[28,i] := Format('%0.2f',[(KC_StrToFloat(SG01.Cells[07,i])*
                                         KC_StrToFloat(SG01.Cells[19,i]))/1000]);
    F1 := KC_StrToFloat(SG01.Cells[18,i])-KC_StrToFloat(SG01.Cells[21,i]);
    F2 := KC_StrToFloat(SG01.Cells[19,i]);
    if (F1<>0) Then SG01.Cells[17,i] := format('%0.2f%%',[F2/F1*100]);
    if (F1<>0) Then F4 := F2/F1;
    if (F3*F4<>0) Then SG01.Cells[05,i] := format('%0.2f%%',[F3*F4*100]);
  End;
  KC_ColAutoSize(SG01);
  for i:=29 to 36 do SG01.ColWidths[i] := 0;
end;

procedure TF_D14.B_OKClick(Sender: TObject);
var
  D1,D2 : String;
begin
  D1  := E_BDT.Text;
  D2  := KC_Data2B((KC_B2Day(E_EDT.Text)+1));
  D.OpenF05;
  OpenF16(D1,D2);
  SL01Snd;
  SG01Snd;
end;

procedure TF_D14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D14.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow = 0) Then Exit;
  with Sender as TStringGrid do
  begin
    if (Cells[0,ARow] = '') Then Exit;
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := $00E3FEE2;
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

procedure TF_D14.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D14.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D14.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  W.Cells[21,6].Value := '日期 : '+E_BDT.Text+' ~ '+E_EDT.Text+'           '+
                         'Line : '+CB_BLn.Text+iif(CB_ELn.Visible,' ~ '+CB_ELn.Text,'') ;
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

procedure TF_D14.CB_BLnChange(Sender: TObject);
begin
  CB_ELn.Visible := (0=POS('all',CB_BLn.Text));
end;

end.




