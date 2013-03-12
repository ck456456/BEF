unit U_D15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB, DateUtils;

type
  TF_D15 = class(TForm)
    P_Main: TPanel;
    Panel4: TPanel;
    L_Date: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    E_EDT: TEdit;
    E_BDT: TEdit;
    CB_Type: TCheckBox;
    CB002: TComboBox;
    CB003: TComboBox;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Label2: TLabel;
    CB_001: TComboBox;
    CB_002: TComboBox;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB_BLnChange(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    SL02 : TStringList;
    procedure OpenF05(S1 : String);
    procedure OpenF19(S1,S2 : String);
    procedure OpenF16;
    procedure LoadLne;
    procedure CB002Ld;
    procedure CB003Ld;
    procedure SG01Ini;
    procedure SG01Snd;
    procedure SL01Snd;
    procedure SL0101Snd;
    procedure SL0102Snd;
    function  GetJdgF19 : String;
    procedure SaveF24;
  public
    { Public declarations }
  end;

var
  F_D15: TF_D15;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D15.LoadLne;
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

procedure TF_D15.CB002Ld;
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

procedure TF_D15.CB003Ld;
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

procedure TF_D15.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '規格';
  SG01.Cells[01,0] := 'PET 廠商';
  SG01.Cells[02,0] := 'PET 寬度';
  SG01.Cells[03,0] := 'PET 厚度';
  SG01.Cells[04,0] := 'PET 處理';
  SG01.Cells[05,0] := '未褙模-上期';
  SG01.Cells[06,0] := '未褙模-當月';
  SG01.Cells[07,0] := '褙模使用率(%)';
  SG01.Cells[08,0] := '褙模使用長度(m)';
  SG01.Cells[09,0] := '褙模良品長度(m)';
  SG01.Cells[10,0] := '褙模未判長度';
  SG01.Cells[11,0] := '褙模A';
  SG01.Cells[12,0] := '褙模B';
  SG01.Cells[13,0] := '褙模C';
  SG01.Cells[14,0] := '褙模D';
  SG01.Cells[15,0] := '褙模NG';
  SG01.Cells[16,0] := '褙模損耗';
  SG01.Cells[17,0] := '上保護膜廠商';
  SG01.Cells[18,0] := '上保護膜Type';
  SG01.Cells[19,0] := '上保護膜寬度';
  SG01.Cells[20,0] := '上保護膜厚度';
  SG01.Cells[21,0] := '下保護膜廠商';
  SG01.Cells[22,0] := '下保護膜Type';
  SG01.Cells[23,0] := '下保護膜寬度';
  SG01.Cells[24,0] := '下保護膜厚度';
  SG01.Cells[25,0] := '檢驗寬幅';
  SG01.RowCount := 2;
  KC_ColAutoSize(SG01);
end;

procedure TF_D15.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
End;

procedure TF_D15.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDT.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  D.OpenF00;
  D.OpenF01('T');
  D.OpenF21;
  D.OpenF12('褙膜站');
  OpenF05(D.F00.FieldByName('BEF00201').ASSTRING);
  LoadLne; CB_BLnChange(Sender);
  CB002Ld;
  CB003Ld;
  SG01Ini;
end;

procedure TF_D15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  KC_CloseExcel(V);
end;

procedure TF_D15.CB_BLnChange(Sender: TObject);
begin
  CB_ELn.Visible := (0=POS('all',CB_BLn.Text));
end;

procedure TF_D15.OpenF19(S1,S2 : String);
var
  SQL : String;
begin
  SQL := 'Select * From BEFF19 Where BEF19102 >= '''+E_BDT.Text+
                            ''' and  BEF19102 <= '''+E_EDT.Text+
                       'z'' Order by BEF19202';
  KC_T3Close(D.F19,D.SC);
  D.F19.CommandText := SQL;
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
end;

function  TF_D15.GetJdgF19 : String;
var
  i : integer;
  Q : array[0..8] of String;
  Jdg : String;
begin
   for i := Low(Q) to High(Q) do Q[i] := '';
   D.F05.Locate('BEF05001',D.F19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
   Jdg := D.F05.FieldByName('BEF05003').AsString;
   Q[0] := '0';                                                       // 良率長度  10
   if (Jdg=''  ) Then Q[1] := D.F19.FieldByName('BEF19303').AsString; // 未判      11
   if (Jdg='A' ) Then Q[2] := D.F19.FieldByName('BEF19303').AsString; // 'A'       12
   if (Jdg='B' ) Then Q[3] := D.F19.FieldByName('BEF19303').AsString; // 'B'       13
   if (Jdg='C' ) Then Q[4] := D.F19.FieldByName('BEF19303').AsString; // 'C'       14
   if (Jdg='D' ) Then Q[5] := D.F19.FieldByName('BEF19303').AsString; // 'D'       15
   if (Jdg='NG') Then Q[6] := D.F19.FieldByName('BEF19303').AsString; // 'NG'      16
   Q[7] := D.F19.FieldByName('BEF19306').AsString;                    // 損耗長度  17
   Q[8] := '';                                                        // 未褙膜    18
   Q[0] := Format('%0.2f',[KC_StrToFloat(Q[2])+   // 'A'
                           KC_StrToFloat(Q[3])+   // 'B'
                           KC_StrToFloat(Q[4])+   // 'C'
                           KC_StrToFloat(Q[5])+
                           KC_StrToFloat(Q[6])]); // 'D'
   Result := Q[0]+#255+
             Q[1]+#255+
             Q[2]+#255+
             Q[3]+#255+
             Q[4]+#255+
             Q[5]+#255+
             Q[6]+#255+
             Q[7]+#255+
             Q[8]+#255+
             D.F16.FieldByName('BEF16304').AsString+#255+             // 檢驗寬幅    19
             D.F19.FieldByName('BEF19004').AsString;                  // Process No  20
end;

procedure TF_D15.OpenF16;
var
  SQL : String;
begin
  SQL := 'SELECT BEF16001,BEF16002,BEF16004,BEF16007,BEF16202,BEF16304,BEF16307,BEF16102 FROM BEFF16 With (INDEX(BEFF16_101)) Where BEF16101 = ''2'' '+
                                                                             'Order by BEF16001';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D15.SL0102Snd;
var
  SSB,SSE : String;
  S1,S2 : String;
  i : integer;
begin
  D.OpenF24(copy(E_EDT.Text,1,8));
  if D.F24.Eof Then
  Begin
    ShowMessage('無未褙膜歷史資料 , 使用目前未褙膜數字 !!');
    SL0101Snd;
    Exit;
  End;
  SL02.Assign(D.F24.FieldByName('BEF24099'));
  for i := 0 to SL02.Count-1 do
  Begin
    S1  := SL02.Strings[i];
    SSB := copy(S1,                 0,KC_NPos(#255,S1,2)-1);
    SSE := copy(S1,KC_NPos(#255,S1,2),length(S1)-KC_NPos(#255,S1,2)+1);
    SL01.Add(SSB+#255#255#255+SSE);
  End;
  SL01.Sort;
  for i := 1 to (SL01.Count-1) do
  Begin
    if (KC_GetSubStr(#255,SL01.Strings[i],6) <> 'zzz') Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],1) <> KC_GetSubStr(#255,SL01.Strings[i-1],1)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],2) <> KC_GetSubStr(#255,SL01.Strings[i-1],2)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],3) <> KC_GetSubStr(#255,SL01.Strings[i-1],3)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],4) <> '') Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],5) <> '') Then continue;
    S1 := KC_GetSubStr(#255,SL01.Strings[i-1],4);
    S2 := KC_GetSubStr(#255,SL01.Strings[i-1],5);
    SL01.Strings[i] := KC_InsertSubStr(#255,SL01.Strings[i],S1,4);
    SL01.Strings[i] := KC_InsertSubStr(#255,SL01.Strings[i],S2,5);
  End;
  SL01.Sort;
end;

procedure TF_D15.SL0101Snd;
var
  i : integer;
  S1,S2,S3 : String;
  Sum1,Sum2: Real;
  DD : TDateTime;
begin
  SL02.Clear;
  OpenF16;
  While not D.F16.Eof do
  Begin
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
    D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    SL02.Add(D.F16.FieldByName('BEF16002').AsString+#255+
             D.F02.FieldByName('BEF02002').AsString+#255+
             D.F10.FieldByName('BEF10103').AsString+#255+ // UV 膠
             #255+ // 上保Type 3
             #255+ // 下保Type 4
             D.F16.FieldByName('BEF16307').AsString+#255+
             D.F16.FieldByName('BEF16001').AsString+#255+
             D.F16.FieldByName('BEF16304').AsString+#255+
             D.F16.FieldByName('BEF16102').AsString+#255+
             D.F16.FieldByName('BEF16004').AsString);
             // +StringOfChar(#255,08)+
             // D.F16.FieldByName('BEF16304').AsString+#255+              // 檢驗寬幅  16
             // D.F16.FieldByName('BEF16004').AsString);                  // Process No  17
    D.F16.Next;
  End;
  SL02.Sort;
  DD := KC_B2Day(copy(E_EDT.Text,1,8));
  DD := EncodeDate(YearOf(DD),MonthOf(DD),1)+F.DayNight.BeginDay;
  S1 := #255;
  S2 := #255;
  S3 := #255;
  if (SL02.Count <> 0) Then S2 := KC_GetSubStr(#255,SL02.Strings[0],01)+#255+
                                  KC_GetSubStr(#255,SL02.Strings[0],02)+#255+
                                  KC_GetSubStr(#255,SL02.Strings[0],03)+#255+
                                  KC_GetSubStr(#255,SL02.Strings[0],04)+#255+
                                  KC_GetSubStr(#255,SL02.Strings[0],05);
  if (SL02.Count <> 0) Then S3 := KC_GetSubStr(#255,SL02.Strings[0],08)+#255+
                                  KC_GetSubStr(#255,SL02.Strings[0],10);
  Sum1 := 0;
  Sum2 := 0;
  for i:=0 to SL02.Count-1 do
  Begin
    S1 := KC_GetSubStr(#255,SL02.Strings[i],1)+#255+
          KC_GetSubStr(#255,SL02.Strings[i],2)+#255+
          KC_GetSubStr(#255,SL02.Strings[i],3)+#255+
          KC_GetSubStr(#255,SL02.Strings[i],4)+#255+
          KC_GetSubStr(#255,SL02.Strings[i],5);
    if (S1<>S2) Then
    Begin
      SL01.Add(S2+#255'zzz'+StringOfChar(#255,12)+format('%0.2f',[Sum1])+#255+S3+#255+format('%0.2f',[Sum2]));
      S3 := KC_GetSubStr(#255,SL02.Strings[0],8)+#255+
            KC_GetSubStr(#255,SL02.Strings[0],10);
      S2 := S1;
      Sum1 := 0;
      Sum2 := 0;
    End;
    if (DD > KC_B2DateTime(KC_GetSubStr(#255,SL02.Strings[i],9))) Then
      Sum1 := Sum1 + KC_StrToFloat(KC_GetSubStr(#255,SL02.Strings[i],6))
    else
      Sum2 := Sum2 + KC_StrToFloat(KC_GetSubStr(#255,SL02.Strings[i],6));
  End;
  if (S1<>'') Then SL01.Add(S1+#255'zzz'+StringOfChar(#255,12)+format('%0.2f',[Sum1])+#255+S3+#255+format('%0.2f',[Sum2]));
  SL01.Sort;
  for i := 1 to (SL01.Count-1) do
  Begin
    if (KC_GetSubStr(#255,SL01.Strings[i],6) <> 'zzz') Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],1) <> KC_GetSubStr(#255,SL01.Strings[i-1],1)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],2) <> KC_GetSubStr(#255,SL01.Strings[i-1],2)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],3) <> KC_GetSubStr(#255,SL01.Strings[i-1],3)) Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],4) <> '') Then continue;
    if (KC_GetSubStr(#255,SL01.Strings[i],5) <> '') Then continue;
    S1 := KC_GetSubStr(#255,SL01.Strings[i-1],4);
    S2 := KC_GetSubStr(#255,SL01.Strings[i-1],5);
    SL01.Strings[i] := KC_InsertSubStr(#255,SL01.Strings[i],S1,4);
    SL01.Strings[i] := KC_InsertSubStr(#255,SL01.Strings[i],S2,5);
  End;
  SL01.Sort;
end;

procedure TF_D15.SL01Snd;
begin
  SL01.Clear;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if ((0=POS('all',CB_BLn.Text)) and
       ((CB_BLn.Text > D.F19.FieldByName('BEF19005').AsString) or
        (CB_ELn.Text < D.F19.FieldByName('BEF19005').AsString))) Then
    Begin
      D.F19.Next;
      Continue;
    End;

    if ((0<>POS('all',CB_BLn.Text)) and
       (''<>KC_GetSubStr(#255,CB_BLn.Text,2))) Then
    Begin
      D.F12.Locate('BEF12001;BEF12002',VarArrayOf(['褙膜站',D.F19.FieldByName('BEF19005').AsString]), [loCaseInsensitive]);
      if (KC_GetSubStr(#255,CB_BLn.Text,2)<> D.F12.FieldByName('BEF12005').AsString) Then
      Begin
        D.F19.Next;
        Continue;
      End;
    End;
    if ((CB002.ItemIndex <> 0) and
        (CB002.Text <> D.F19.FieldByName('BEF19002').AsString)) Then
    Begin
      D.F19.Next;
      Continue;
    End;

    if ('1' = D.F19.FieldByName('BEF19101').AsString) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    if (CB_001.ItemIndex <> 0) Then
    Begin
      D.OpenF10(D.F19.FieldByName('BEF19002').AsString,D.F19.FieldByName('BEF19004').AsString);
      D.OpenF16(D.F19.FieldByName('BEF19001').AsString);
      case CB_001.ItemIndex of
        1 : if((D.F10.FieldByName('BEF10004').AsString = 'T') or
               (D.F19.FieldByName('BEF19009').AsString = 'Y') or
               (D.F16.FieldByName('BEF16007').AsString = 'Y'))Then
            Begin
              D.F19.Next;
              Continue;
            End;
        2 : if((D.F10.FieldByName('BEF10004').AsString <> 'T') and
               (D.F19.FieldByName('BEF19009').AsString  = 'Y') or
               (D.F16.FieldByName('BEF16007').AsString <> 'Y'))Then
            Begin
              D.F19.Next;
              Continue;
            End;
      End;
    End;
    D.OpenF13(D.F19.FieldByName('BEF19202').AsString);
    D.OpenF14(D.F19.FieldByName('BEF19203').AsString);
    D.OpenF16(D.F19.FieldByName('BEF19001').AsString);
    D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    D.OpenF10(D.F16.FieldByName('BEF16002').AsString,D.F16.FieldByName('BEF16004').AsString);
    if ((CB003.ItemIndex <> 0) and
        (KC_GetSubStr(#255,CB003.Text,1) <> D.F02.FieldByName('BEF02002').AsString)) Then
    Begin
      D.F19.Next;
      Continue;
    End;
    SL01.Add(D.F19.FieldByName('BEF19002').AsString+#255+ // 規格     1 目標料號
             D.F02.FieldByName('BEF02002').AsString+#255+ // PET規格  2
             D.F10.FieldByName('BEF10103').AsString+#255+ // UV 膠    3
             D.F13.FieldByName('BEF13002').AsString+#255+ // 上保Type 4
             D.F14.FieldByName('BEF14002').AsString+#255+ // 下保Type 5
             D.F19.FieldByName('BEF19005').AsString+#255+ // Line     6
             D.F19.FieldByName('BEF19001').AsString+#255+ // Run      7
             D.F19.FieldByName('BEF19007').AsString+#255+ // Run SN   8
             D.F19.FieldByName('BEF19302').AsString+#255+ // 使用長度 9
             GetJdgF19);
    D.F19.Next;
  End;
  SL01.Sort;
end;

procedure TF_D15.SG01Snd;
var
  S,TTS : String;
  i : Integer;
  iRow : integer;
  iCRow : integer;
  RNo  : String;
  F1,F2 : Real;
begin
  iRow := 1;
  iCRow := 1;
  RNo := '---';
  KC_SGClear(1,SG01);
  for i:=0 to SL01.Count-1 do
  Begin
    S := KC_GetSubStr(#255,SL01.Strings[i],1)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],2)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],3)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],4)+#255+
         KC_GetSubStr(#255,SL01.Strings[i],5);
    if((CB002.ItemIndex <> 0) and
       (KC_GetSubStr(#255,S,1) <> CB002.Text)) Then continue;
    if((CB003.ItemIndex <> 0) and
       (KC_GetSubStr(#255,S,2) <> KC_GetSubStr(#255,CB003.Text,1))) Then continue;
    if (RNo <> S) Then
    Begin
      D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],02), [loCaseInsensitive]);
      SG01.Cells[00,iRow] := KC_GetSubStr(#255,SL01.Strings[i],01);
      SG01.Cells[01,iRow] := D.F05.FieldByName('BEF05006').AsString;
      SG01.Cells[02,iRow] := D.F05.FieldByName('BEF05004').AsString;
      SG01.Cells[03,iRow] := D.F05.FieldByName('BEF05005').AsString;
      SG01.Cells[04,iRow] := D.F05.FieldByName('BEF05007').AsString;
      SG01.Cells[05,iRow] := KC_GetSubStr(#255,SL01.Strings[i],18);
      SG01.Cells[06,iRow] := KC_GetSubStr(#255,SL01.Strings[i],18);
      SG01.Cells[25,iRow] := D.F05.FieldByName('BEF05201').AsString;
      TTS := KC_GetSubStr(#255,SL01.Strings[i],01)+#255+KC_GetSubStr(#255,SL01.Strings[i],20);
      // D.OpenF10(KC_GetSubStr(#255,SL01.Strings[i],01),KC_GetSubStr(#255,SL01.Strings[i],19));
      // if D.F05.Locate('BEF05001',D.F10.FieldByName('BEF10106').AsString, [loCaseInsensitive]) Then
      if D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],04), [loCaseInsensitive]) Then
      Begin
        SG01.Cells[17,iRow] := D.F05.FieldByName('BEF05103').AsString;
        SG01.Cells[18,iRow] := D.F05.FieldByName('BEF05104').AsString;
        SG01.Cells[19,iRow] := D.F05.FieldByName('BEF05101').AsString;
        SG01.Cells[20,iRow] := D.F05.FieldByName('BEF05102').AsString;
      End;
      // if D.F05.Locate('BEF05001',D.F10.FieldByName('BEF10107').AsString, [loCaseInsensitive]) Then
      if D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],05), [loCaseInsensitive]) Then
      Begin
        SG01.Cells[21,iRow] := D.F05.FieldByName('BEF05103').AsString;
        SG01.Cells[22,iRow] := D.F05.FieldByName('BEF05104').AsString;
        SG01.Cells[23,iRow] := D.F05.FieldByName('BEF05101').AsString;
        SG01.Cells[24,iRow] := D.F05.FieldByName('BEF05102').AsString;
      End;

      SG01.Cells[26,iRow] := KC_GetSubStr(#255,SL01.Strings[i],1);
      SG01.Cells[27,iRow] := KC_GetSubStr(#255,SL01.Strings[i],2);
      SG01.Cells[28,iRow] := KC_GetSubStr(#255,SL01.Strings[i],3);
      SG01.Cells[29,iRow] := KC_GetSubStr(#255,SL01.Strings[i],4);
      SG01.Cells[30,iRow] := KC_GetSubStr(#255,SL01.Strings[i],5);

      RNo := S;
      iCRow := iRow;
      inc(iRow);
    End;
    if ((CB_Type.Checked) and
        (KC_GetSubStr(#255,SL01.Strings[i],06) <> 'zzz'))Then
    Begin
      SG01.Cells[06,iRow] := KC_GetSubStr(#255,SL01.Strings[i],07)+'-'+KC_GetSubStr(#255,SL01.Strings[i],08);
      SG01.Cells[07,iRow] := KC_GetSubStr(#255,SL01.Strings[i],06);
      SG01.Cells[08,iRow] := KC_GetSubStr(#255,SL01.Strings[i],09);
      SG01.Cells[09,iRow] := KC_GetSubStr(#255,SL01.Strings[i],10);
      SG01.Cells[10,iRow] := KC_GetSubStr(#255,SL01.Strings[i],11);
      SG01.Cells[11,iRow] := KC_GetSubStr(#255,SL01.Strings[i],12);
      SG01.Cells[12,iRow] := KC_GetSubStr(#255,SL01.Strings[i],13);
      SG01.Cells[13,iRow] := KC_GetSubStr(#255,SL01.Strings[i],14);
      SG01.Cells[14,iRow] := KC_GetSubStr(#255,SL01.Strings[i],15);
      SG01.Cells[15,iRow] := KC_GetSubStr(#255,SL01.Strings[i],16);
      SG01.Cells[16,iRow] := KC_GetSubStr(#255,SL01.Strings[i],17);
      D.OpenF10(KC_GetSubStr(#255,SL01.Strings[i],01),KC_GetSubStr(#255,SL01.Strings[i],20));
      if D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],04), [loCaseInsensitive]) Then
      Begin
        SG01.Cells[17,iRow] := D.F05.FieldByName('BEF05103').AsString;
        SG01.Cells[18,iRow] := D.F05.FieldByName('BEF05104').AsString;
        SG01.Cells[19,iRow] := D.F05.FieldByName('BEF05101').AsString;
        SG01.Cells[20,iRow] := D.F05.FieldByName('BEF05102').AsString;
      End;

      if D.F05.Locate('BEF05001',KC_GetSubStr(#255,SL01.Strings[i],05), [loCaseInsensitive]) Then
      Begin
        SG01.Cells[21,iRow] := D.F05.FieldByName('BEF05103').AsString;
        SG01.Cells[22,iRow] := D.F05.FieldByName('BEF05104').AsString;
        SG01.Cells[23,iRow] := D.F05.FieldByName('BEF05101').AsString;
        SG01.Cells[24,iRow] := D.F05.FieldByName('BEF05102').AsString;
      End;

      SG01.Cells[25,iRow] := KC_GetSubStr(#255,SL01.Strings[i],19);

      SG01.Cells[26,iRow] := KC_GetSubStr(#255,SL01.Strings[i],1);
      SG01.Cells[27,iRow] := KC_GetSubStr(#255,SL01.Strings[i],2);
      SG01.Cells[28,iRow] := KC_GetSubStr(#255,SL01.Strings[i],3);
      SG01.Cells[29,iRow] := KC_GetSubStr(#255,SL01.Strings[i],4);
      SG01.Cells[30,iRow] := KC_GetSubStr(#255,SL01.Strings[i],5);
      inc(iRow);
    End;
    if (KC_GetSubStr(#255,SL01.Strings[i],06) = 'zzz') Then
    Begin
       TTS := KC_GetSubStr(#255,SL01.Strings[i],01)+#255+KC_GetSubStr(#255,SL01.Strings[i],20);
       SG01.Cells[05,iCRow] := KC_GetSubStr(#255,SL01.Strings[i],18);
       SG01.Cells[06,iCRow] := KC_GetSubStr(#255,SL01.Strings[i],21);
    End;
    SG01.Cells[08,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[08,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],09))]);
    SG01.Cells[09,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[09,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],10))]);
    SG01.Cells[10,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[10,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],11))]);
    SG01.Cells[11,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[11,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],12))]);
    SG01.Cells[12,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[12,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],13))]);
    SG01.Cells[13,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[13,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],14))]);
    SG01.Cells[14,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[14,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],15))]);
    SG01.Cells[15,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[15,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],16))]);
    SG01.Cells[16,iCRow] := Format('%0.2f',[KC_StrToFloat(SG01.Cells[16,iCRow]) + KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],17))]);
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[00,i] = '') then Continue;
    F1 := KC_StrToFloat(SG01.Cells[08,i])-KC_StrToFloat(SG01.Cells[10,i]);
    F2 := KC_StrToFloat(SG01.Cells[09,i]);
    if (F1<>0) Then SG01.Cells[07,i] := format('%0.0f%%',[F2/F1*100]);
  End;
  KC_ColAutoSize(SG01);
end;

procedure TF_D15.SaveF24;
var
  i : integer;
  S1,SSB,SSE : String;
begin
  if (CB_002.ItemIndex <> 0) Then Exit;
  if (copy(E_EDT.Text,1,8) <> KC_Data2B(F.IdTime.DateTime)) Then Exit;
  D.OpenF24(copy(E_EDT.Text,1,8));
  if not D.F24.Eof Then
  if (MessageDlg('是否重新儲存未褙膜歷史記錄 ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  SL02.Clear;
  for i:=0 to SL01.Count-1 do
    if (KC_GetSubStr(#255,SL01.Strings[i],06) = 'zzz') Then
    Begin
      S1  := SL01.Strings[i];
      SSB := copy(S1,                 0,KC_NPos(#255,S1,2)-1);
      SSE := copy(S1,KC_NPos(#255,S1,5),length(S1)-KC_NPos(#255,S1,1)+1);
      SL02.Add(SSB+SSE);
    End;
  if not D.F24.Eof Then
    D.F24.Edit
  else
    D.F24.Append;
  D.F24.FieldByName('BEF24001').AsString := copy(E_EDT.Text,1,8);
  D.F24.FieldByName('BEF24002').AsString := FormatDateTime('yyyymmddhhnnss',F.IdTime.DateTime);
  D.F24.FieldByName('BEF24099').AsString := SL02.Text;
  D.F24.ApplyUpdates(-1);
end;

procedure TF_D15.B_OKClick(Sender: TObject);
var
  D1,D2 : String;
begin
  D1  := E_BDT.Text;
  D2  := KC_Data2B((KC_B2Day(E_EDT.Text)+1));
  D.OpenF05;
  OpenF19(D1,D2);
  SL01Snd;
  case CB_002.ItemIndex of
    0 : SL0101Snd;
    1 : SL0102Snd;
  End;
  SG01Snd;
  SaveF24;
end;

procedure TF_D15.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D15.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D15.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  W.Cells[21,6].Value := '日期 : '+E_BDT.Text+' ~ '+E_EDT.Text+'           '+
                         'Line : '+CB_BLn.Text+iif(CB_ELn.Visible,' ~ '+CB_ELn.Text,'') ;
  For j:=1 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := SG01.Cells[i,j];
end;

procedure TF_D15.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

end.


