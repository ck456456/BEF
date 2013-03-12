Unit U_V03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, Grids, IdMessage, math;

type
  TF_V03 = class(TForm)
    Panel2: TPanel;
    B_Cls: TBitBtn;
    Panel1: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    E_006: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    E_002: TEdit;
    E_003: TEdit;
    Label9: TLabel;
    E_005: TEdit;
    Label7: TLabel;
    E_004: TEdit;
    PC01: TPageControl;
    TS0101: TTabSheet;
    Panel3: TPanel;
    Label4: TLabel;
    L_902: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    L_TUV: TLabel;
    L_PetPNo: TLabel;
    L_ROLPno: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label31: TLabel;
    E_S01: TEdit;
    E_S02: TEdit;
    E_S03: TEdit;
    B_1001: TButton;
    E_10001: TEdit;
    CB10202: TComboBox;
    E_10203: TEdit;
    CB10204: TComboBox;
    E_10201: TEdit;
    E_10299: TEdit;
    E_10205: TEdit;
    Panel4: TPanel;
    Panel7: TPanel;
    Label16: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    E_10301: TEdit;
    E_10399: TEdit;
    E_10302: TEdit;
    E_10303: TEdit;
    E_10306: TEdit;
    B_1002: TButton;
    E_10307: TEdit;
    Panel6: TPanel;
    B_Save1001: TBitBtn;
    TS0102: TTabSheet;
    Splitter4: TSplitter;
    Panel9: TPanel;
    B_Save1002: TBitBtn;
    B_Dele1002: TBitBtn;
    Panel10: TPanel;
    SG02: TStringGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    E_Z03: TEdit;
    CB_Z01: TComboBox;
    CB_Z02: TComboBox;
    E_Z04: TEdit;
    E_Z05: TEdit;
    E_Z06: TEdit;
    E_Z07: TEdit;
    Panel13: TPanel;
    Splitter5: TSplitter;
    Panel14: TPanel;
    SG03: TStringGrid;
    Panel15: TPanel;
    SG04: TStringGrid;
    Label18: TLabel;
    CB_Z09: TComboBox;
    Label19: TLabel;
    E_Z08: TEdit;
    Label32: TLabel;
    CB_Z10: TComboBox;
    B000: TButton;
    Label34: TLabel;
    E_10304: TEdit;
    Label33: TLabel;
    CB_10308: TComboBox;
    CB_007: TCheckBox;
    Label35: TLabel;
    E_10309: TEdit;
    Label36: TLabel;
    E_10499: TEdit;
    Label37: TLabel;
    E_10310: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    E_Time: TEdit;
    CB_311: TCheckBox;
    CB_312: TComboBox;
    Label40: TLabel;
    Label41: TLabel;
    E_10305: TEdit;
    Label42: TLabel;
    E_10313: TEdit;
    Label43: TLabel;
    CB_314: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure B_1001Click(Sender: TObject);
    procedure CB10202Change(Sender: TObject);
    procedure CB10204Change(Sender: TObject);
    procedure B_Save1001Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_1002Click(Sender: TObject);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04Exit(Sender: TObject);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_Dele1002Click(Sender: TObject);
    procedure SG04DblClick(Sender: TObject);
    procedure SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B000Click(Sender: TObject);
    procedure SG03DblClick(Sender: TObject);
  private
    { Private declarations }
    SL02 : TStringList;  // JudgeType
    SL03 : TStringList;  // Data
    SL04 : TStringList;  // Mail
    function  GetColor(S1,S2 : String) : String;
    procedure SL03Mil;
    procedure SL03Add(S1,S2 : String);
    procedure SL03Del(S1 : String);
    function  GetNte(S1 : String;CB: TComboBox) : Integer;
    procedure LoadNte(S1:String;CB: TComboBox);
    procedure LoadPet(CB: TComboBox);
    procedure LoadROL(CB: TComboBox);
    procedure IniSet(i1 : integer);
    function  GetS03 : String;
    function  GetRealUV(S1 : String) : String;
    function  Chk10 : Boolean;
    function  ChkNte(I1:Integer): Boolean;
    procedure F16UpData(Run : String);
    procedure F10UpData;
    procedure SG02Ini;
    procedure SG03Ini;
    procedure SG04Ini;
    procedure SG04Hdr;
    procedure SG02Snd(TSL :TStringList);
    procedure SG03Snd(TSL :TStringList);
    procedure SG04Snd(TSL :TStringList);
    procedure SL01ToSG04;
    function  Judge(TSG : TStringGrid;iRow : integer) : String;
    procedure OpenF16(S1 : String);
    procedure SaveF02(S1 : String);
    function  GetHR(S1 : String) : String;
  public
    iStation : Integer;  // 00:all  10:成型站 20:褙膜站 30:庫房站 40:QA站
                         //  1:Base 11:成型站 21:褙膜站 31:庫房站 41:QA站
                         //  2:Data 12:成型站 22:褙膜站 32:庫房站 42:QA站
    Kind : Integer;      //  0:Append 1.Modify  2.View
    ERunning : String;   //  0.Hold 1.Running 2.Finish 3.Fail
    Ret  : Boolean;
    SL01 : TStringList;  // 外觀細節
    { Public declarations }
  end;

var
  F_V03: TF_V03;

implementation

uses U_KcPub, U_D, U_F, U_V0301;

{$R *.dfm}

procedure TF_V03.OpenF16(S1 : String);
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFF16 Where BEF16202 = '''+S1+'''';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_V03.SaveF02(S1 : String);
var
  SQL : String;
  f : Real;
begin
  if (S1='') Then Exit;
  f := 0;
  OpenF16(S1);
  While not D.FP1.Eof do
  Begin
    if ((D.FP1.FieldByName('BEF16101').AsString = '1') or
        (D.FP1.FieldByName('BEF16101').AsString = '0')) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    f := f+D.FP1.FieldByName('BEF16302').AsFloat;
    D.FP1.Next;
  End;
  SQL := 'Update BEFF02 Set BEF02103 = '''+format('%0.2f',[f])+
                  ''' Where BEF02001 = '''+S1+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
end;

procedure TF_V03.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Time';
  SG02.Cells[00,1] := '成型站-前';
  SG02.Cells[00,2] := '成型站-後';
  KC_ColAutoSize(SG02);
end;

procedure TF_V03.SG03Ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Group';
  KC_ColAutoSize(SG03);
end;

procedure TF_V03.SG04Ini;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[00,00] := 'Item Type';
  SG04.Cells[01,00] := 'Judge';
  SG04.Cells[02,00] := 'Value';
  SG04.Cells[03,00] := 'Low(A+)';
  SG04.Cells[04,00] := 'Up (A+)';
  SG04.Cells[05,00] := 'Low(A)';
  SG04.Cells[06,00] := 'Up (A)';
  SG04.Cells[07,00] := 'Low(A-)';
  SG04.Cells[08,00] := 'Up (A-)';
  SG04.Cells[09,00] := 'Low(B)';
  SG04.Cells[10,00] := 'Up (B)';
  SG04.Cells[11,00] := 'Low(C)';
  SG04.Cells[12,00] := 'Up (C)';
  SG04.Cells[13,00] := 'Low(CPK)';
  SG04.Cells[14,00] := 'Up (CPK)';
  KC_ColAutoSize(SG04);
end;

function  TF_V03.GetS03 : String;
var
  S1 : String;
  i  : integer;
begin
  S1 := KC_GetDayDSP(KC_B2Day(E_S01.Text))+E_S02.Text;
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT BEF16001 FROM BEFF16 Where BEF16001 >= '''+S1+
                                                  ''' and BEF16001 <= '''+S1+'z'' Order by BEF16001';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  Result := '--';
  for i:=1 to 9 do
  Begin
    S1 := D.F12.FieldByName('BEF12004').AsString;
    S1 := copy(S1,7,1);
    if (i<>KC_StrToInt(S1)) Then
    Begin
      Result := KC_IntFillChar(i,1,'0');
      Exit;
    End;
    D.F12.Next;
  End;
end;

procedure TF_V03.LoadROL(CB: TComboBox);
begin
  D.ORunningF04('1');
  CB.Clear;
  While not D.F04.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10104').AsString <> 'all') and
        (D.F10.FieldByName('BEF10104').AsString <> D.F04.FieldByName('BEF04002').AsString)) Then
    Begin
      D.F04.Next;
      Continue;
    End;
    CB.Items.Add(D.F04.FieldByName('BEF04001').AsString);
    D.F04.Next;
  End;
end;

procedure TF_V03.LoadNte(S1:String;CB: TComboBox);
begin
  D.OpenF23;
  CB.Clear;
  CB.Items.Add('');
  While not D.F23.Eof do
  Begin
    if((D.F23.FieldByName('BEF23001').AsString <> '成型站') or
       (D.F23.FieldByName('BEF23004').AsString <> S1)) Then
    Begin
      D.F23.Next;
      Continue;
    End;
    CB.Items.Add(D.F23.FieldByName('BEF23002').AsString+#255+
                 D.F23.FieldByName('BEF23003').AsString);
    D.F23.Next;
  End;
end;

procedure TF_V03.LoadPet(CB: TComboBox);
begin
  D.ORunningF02('1');
  CB.Clear;
  While not D.F02.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10102').AsString <> 'all') and
        (D.F10.FieldByName('BEF10102').AsString <> D.F02.FieldByName('BEF02002').AsString)) Then
    Begin
      D.F02.Next;
      Continue;
    End;
    CB.Items.Add(D.F02.FieldByName('BEF02001').AsString);
    D.F02.Next;
  End;
end;

function  TF_V03.GetRealUV(S1 : String) : String;
begin
  Result := '??';
  if not D.F12.Locate('BEF12001;BEF12002',VarArrayOf(['成型站',S1]), [loCaseInsensitive]) Then Exit;
  Result := D.F12.FieldByName('BEF12006').AsString;
  (*
  D.OpenF18('1');
  Result := '??';
  if not D.F18.Locate('BEF18004',S1, [loCaseInsensitive]) Then Exit;
  Result := D.F18.FieldByName('BEF18005').AsString+#255+
            D.F18.FieldByName('BEF18002').AsString+#255+
            F.Hr(D.F18.FieldByName('BEF18002').AsString)+' Hr';
  *)
end;

function  TF_V03.ChkNte(I1:Integer): Boolean;
var
  F1 : Real;
begin
  Result := True;
  case I1 of
    0 : F1 := iif(CB_311.Checked,D.F10.FieldByName('BEF10109').AsFloat,
                                 D.F10.FieldByName('BEF10110').AsFloat);
    1 : F1 := D.F10.FieldByName('BEF10113').AsFloat;
  End;
  if (PC01.ActivePageIndex=1) Then Exit;
  if (D.F10.FieldByName('BEF10004').AsString = 'T') Then Exit;
  if CB_007.Checked Then Exit;
  if (F1 = 0) Then Exit;
  case I1 of
    0 : if (KC_StrToFloat(E_10306.Text) > F1) and
           (CB_312.Text = '') Then
        Begin
          ShowMessage('請輸入異常損耗原因 !!');
          Result := False;
        End;
    1 : if (KC_StrToFloat(E_10303.Text) < F1) and
           (CB_314.Text = '') Then
        Begin
          ShowMessage('請輸入收料不足原因 !!');
          Result := False;
        End;
  End;
end;

function  TF_V03.Chk10 : Boolean;
begin
  Result := True;
  case Kind of
    0 : Begin
          if (L_PetPNo.Caption                   <> D.F10.FieldByName('BEF10102').AsString) Then Result := False;  // A(20)     PNo PET
          if (KC_GetSubStr(#255,L_TUV.Caption,1) <> D.F10.FieldByName('BEF10103').AsString) Then Result := False;  // A(20)     PNo UV
          if (L_ROLPNo.Caption                   <> D.F10.FieldByName('BEF10104').AsString) Then Result := False;  // A(20)     PNo PET
          if (E_10001.Text = '') Then Result := False;
          if (E_10201.Text = '') Then Result := False;
        End;
    1 : Begin
          if (E_10301.Text = '') Then Result := False;
        End
  End;
end;

procedure TF_V03.SG02Snd(TSL :TStringList);
var
  i,j : Integer;
  S : String;
  Ret : Boolean;
begin
  SL03.Sort;
  For i:=0 To SL03.Count-1 do
  Begin
    S := SL03.Strings[i];
    if ('成型站'<>KC_GetSubStr(#255,S,1)) Then Continue;

    Ret := False;
    for j:=1 to SG02.RowCount-1 do
      if (SG02.Cells[0,j]=KC_GetSubStr(#255,S,2)) Then Ret := True;

    if not Ret Then
      for j:=1 to SG02.RowCount-1 do
        if (SG02.Cells[0,j] = '') Then
        Begin
          SG02.Cells[0,j]:=KC_GetSubStr(#255,S,2);
          Break;
        End;
  End;
  E_Time.Text := SG02.Cells[0,SG02.Row];
  KC_ColAutoSize(SG02);
end;

procedure TF_V03.SG04Snd(TSL :TStringList);
var
  i,j : Integer;
  S : String;
begin
 CB_Z01.Text := '';
 CB_Z02.Text := '';
 CB_Z09.Text := '';
  E_Z03.Text := '';
  for j:=1 to SG04.RowCount-1 do SG04.Cells[2,j] := '0';
  For i:=0 To SL03.Count-1 do
  Begin
    S := SL03.Strings[i];
    for j:=1 to SG04.RowCount-1 do
    Begin
      if (                                      ''   = KC_GetSubStr(#255,S,1)) Then Continue;
      if (                                      ''   = KC_GetSubStr(#255,S,2)) Then Continue;
      if (                                      ''   = KC_GetSubStr(#255,S,3)) Then Continue;
      if (                                '成型站'   <>KC_GetSubStr(#255,S,1)) Then Continue;
      if (                  SG02.Cells[0,SG02.Row]   <>KC_GetSubStr(#255,S,2)) Then Continue;
      if (KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)<>KC_GetSubStr(#255,S,3)) Then Continue;
      if ('ZBEF01'=KC_GetSubStr(#255,S,4)) Then CB_Z01.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF02'=KC_GetSubStr(#255,S,4)) Then CB_Z02.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF03'=KC_GetSubStr(#255,S,4)) Then  E_Z03.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF04'=KC_GetSubStr(#255,S,4)) Then  E_Z04.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF05'=KC_GetSubStr(#255,S,4)) Then  E_Z05.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF06'=KC_GetSubStr(#255,S,4)) Then  E_Z06.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF07'=KC_GetSubStr(#255,S,4)) Then  E_Z07.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF08'=KC_GetSubStr(#255,S,4)) Then  E_Z08.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF09'=KC_GetSubStr(#255,S,4)) Then  CB_Z09.Text := KC_GetSubStr(#255,S,5);
      if ('ZBEF10'=KC_GetSubStr(#255,S,4)) Then CB_Z10.Text := KC_GetSubStr(#255,S,5);
      if (KC_GetSubStr(#255,SG04.Cells[0,       j],1)<>KC_GetSubStr(#255,S,4)) Then Continue;
      SG04.Cells[1,j] := KC_GetSubStr(#255,S,5);
      SG04.Cells[2,j] := KC_GetSubStr(#255,S,6);
      if (SG04.Cells[2,j] = '') Then SG04.Cells[2,j] := '0';
    End;
  End;
  KC_ColAutoSize(SG04);
end;

function  TF_V03.GetNte(S1 : String;CB: TComboBox) : Integer;
var
  i : integer;
begin
  Result := 0;
  for i:=1 to CB.Items.Count-1 do
    if (S1=KC_GetSubStr(#255,CB.Items.Strings[i],1)) Then
      Result := i;
end;

procedure TF_V03.F16UpData(Run : String);
begin
  D.OpenF16(Run);
      E_S01.Text := KC_GetDateDSP(copy(Run,1,4));
      E_S02.Text := copy(Run,5,2);
      E_S03.Text := copy(Run,7,2);

      E_002.Text := D.F16.FieldByName('BEF16002').AsString;
      E_003.Text := D.F16.FieldByName('BEF16003').AsString;
      E_004.Text := D.F16.FieldByName('BEF16004').AsString;
      E_005.Text := D.F16.FieldByName('BEF16005').AsString;
      E_006.Text := D.F16.FieldByName('BEF16006').AsString;
  CB_007.Checked := (D.F16.FieldByName('BEF16007').AsString='Y');

  E_10201.Text := D.F16.FieldByName('BEF16201').AsString;
  CB10202.Text := D.F16.FieldByName('BEF16202').AsString;
  E_10203.Text := D.F16.FieldByName('BEF16203').AsString;
  CB10204.Text := D.F16.FieldByName('BEF16204').AsString;
  E_10205.Text := D.F16.FieldByName('BEF16205').AsString;
  E_10299.Text := D.F16.FieldByName('BEF16299').AsString;

  E_10301.Text := D.F16.FieldByName('BEF16301').AsString;
  E_10302.Text := D.F16.FieldByName('BEF16302').AsString;
  E_10303.Text := D.F16.FieldByName('BEF16303').AsString;
  E_10304.Text := D.F16.FieldByName('BEF16304').AsString;
  E_10305.Text := D.F16.FieldByName('BEF16305').AsString;
  E_10306.Text := D.F16.FieldByName('BEF16306').AsString;
  E_10307.Text := D.F16.FieldByName('BEF16307').AsString;
 CB_10308.Text := D.F16.FieldByName('BEF16308').AsString;
  E_10309.Text := D.F16.FieldByName('BEF16309').AsString;
  E_10310.Text := D.F16.FieldByName('BEF16310').AsString;
  CB_311.Checked := (D.F16.FieldByName('BEF16311').AsString='Y');
  CB_312.ItemIndex  := GetNte(D.F16.FieldByName('BEF16312').AsString,CB_312);
  CB_314.ItemIndex  := GetNte(D.F16.FieldByName('BEF16314').AsString,CB_314);
  E_10313.Text := D.F16.FieldByName('BEF16313').AsString;
  E_10399.Text := D.F16.FieldByName('BEF16399').AsString;
  E_10499.Text := D.F16.FieldByName('BEF16499').AsString;

  SL01.Assign(D.F16.FieldByName('BEF16902'));
  SL03.Assign(D.F16.FieldByName('BEF16901'));

  SG02Snd(SL03);
  SG04Snd(SL03);
end;

procedure TF_V03.SG03Snd(TSL :TStringList);
var
  S1 : String;
  i,iRow : integer;
begin
  iRow := 1;
  SL02.Sort;
  for i:=0 to SL02.Count - 1 do
  Begin
    S1 := SL02.Strings[i];
    if((SG02.Cells[0,SG02.Row] = '成型站-前') or
       (SG02.Cells[0,SG02.Row] = '成型站-後')) Then
    Begin
      if (KC_GetSubStr(#255,S1,1)<>SG02.Cells[0,SG02.Row]) Then Continue;
    End
    else
    Begin
      if (KC_GetSubStr(#255,S1,1) <> '成型站-中') Then Continue;
    End;
    SG03.Cells[0,iRow] := KC_GetSubStr(#255,S1,2)+#255+
                          KC_GetSubStr(#255,S1,3);
    inc(iRow);
  End;
  SG03.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG03);
end;

procedure TF_V03.SG04Hdr;
var
  i : integer;
begin
  i := 1;
  D.OpenF08('成型站',KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1));
  D.OpenF07('成型站',KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1));
  While not D.F08.Eof do
  Begin
    SG04.Cells[0,i] := D.F08.FieldByName('BEF08101').AsString+#255+
                       D.F08.FieldByName('BEF08102').AsString+#255+
                       D.F08.FieldByName('BEF08103').AsString+#255+
                       D.F08.FieldByName('BEF08104').AsString+#255+
                       D.F08.FieldByName('BEF08105').AsString;
    D.F08.Next;
    inc(i);
  End;
  SG04.RowCount := iif(i=1,2,i);
  D.OpenF09('成型站',KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1),
                     KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],2));
  While not D.F09.Eof do
  Begin
    for i:=0 to SG04.RowCount-1 do
    Begin
      if (KC_GetSubStr(#255,SG04.Cells[0,i],1) <> D.F09.FieldByName('BEF09102').AsString) Then Continue;
      SG04.Cells[03,i] := D.F09.FieldByName('BEF09203').AsString;
      SG04.Cells[04,i] := D.F09.FieldByName('BEF09204').AsString;
      SG04.Cells[05,i] := D.F09.FieldByName('BEF09205').AsString;
      SG04.Cells[06,i] := D.F09.FieldByName('BEF09206').AsString;
      SG04.Cells[07,i] := D.F09.FieldByName('BEF09207').AsString;
      SG04.Cells[08,i] := D.F09.FieldByName('BEF09208').AsString;
      SG04.Cells[09,i] := D.F09.FieldByName('BEF09209').AsString;
      SG04.Cells[10,i] := D.F09.FieldByName('BEF09210').AsString;
      SG04.Cells[11,i] := D.F09.FieldByName('BEF09211').AsString;
      SG04.Cells[12,i] := D.F09.FieldByName('BEF09212').AsString;
      SG04.Cells[13,i] := D.F09.FieldByName('BEF09213').AsString;
      SG04.Cells[14,i] := D.F09.FieldByName('BEF09214').AsString;
    End;
    D.F09.Next;
  End;
  KC_ColAutoSize(SG04);
end;

procedure TF_V03.F10UpData;
begin
  D.OpenF10(E_003.Text,E_004.Text);
  L_PetPNo.Caption := D.F10.FieldByName('BEF10102').AsString;
  L_TUV   .Caption := D.F10.FieldByName('BEF10103').AsString;
  L_ROLPno.Caption := D.F10.FieldByName('BEF10104').AsString;
  SL02.Assign(D.F10.FieldByName('BEF10901'));
  SG03Snd(SL02);
  SG04Hdr;
end;

procedure TF_V03.IniSet(i1 : integer);
begin
  D.OpenF10(E_003.Text,E_004.Text);
  CB_Z01.Items.Assign(D.F00.FieldByName('BEF00303'));
  CB_Z02.Items.Assign(D.F00.FieldByName('BEF00303'));
  CB_Z09.Items.Assign(D.F00.FieldByName('BEF00303'));
  LoadNte('0',CB_312);
  LoadNte('1',CB_314);
  SG02Ini;
  SG03Ini;
  SG04Ini;
  case i1 of
    10 : Begin
           case Kind of
             0 : Begin
                   LoadPet(CB10202);
                   LoadROL(CB10204);
                   L_TUV.Caption := GetRealUV(E_005.Text);
                   E_S01.Text := KC_Data2B(F.IdTime.DateTime);
                   E_S03.Text := GetS03;
                   PC01.Pages[1].TabVisible := False;
                 End;
             1 : Begin
                   F16UpData(E_10001.Text);
                   F10UpData;
                   SG02Snd(SL03);
                   SG04Snd(SL03);
                   PC01.ActivePageIndex := 0;
                 End;
             3 : Begin
                   F16UpData(E_10001.Text);
                   F10UpData;
                   SG02Snd(SL03);
                   SG04Snd(SL03);
                   PC01.ActivePageIndex := 1;
                 End;
           End;
         End;
  End;
end;

procedure TF_V03.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  SL04 := TStringList.Create;
  D.OpenF00;
  // D.OpenH001;
  IniSet(iStation);
end;

procedure TF_V03.B_1001Click(Sender: TObject);
begin
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  E_10001.Text := KC_GetDayDSP(KC_B2Day(E_S01.Text))+E_S02.Text+E_S03.Text;
end;

procedure TF_V03.CB10202Change(Sender: TObject);
begin
  E_10203.Text :=  '';
  L_PetPNo.Caption :=  '';
  D.OpenF02(CB10202.Text);
  L_PetPNo.Caption :=  D.F02.FieldByName('BEF02002').AsString;
  E_10203.Text :=  FloatToStr(D.F02.FieldByName('BEF02102').Asfloat-
                              D.F02.FieldByName('BEF02103').Asfloat);
end;

procedure TF_V03.CB10204Change(Sender: TObject);
begin
  L_ROLPno.Caption :=  '';
  D.OpenF04(CB10204.Text);
  L_ROLPno.Caption :=  D.F04.FieldByName('BEF04002').AsString;
end;

function  TF_V03.GetColor(S1,S2 : String) : String;
var
  SS : String;
begin
  SS := S2;
  if((S1 = '0B') or
     (S1 = '1B') or
     (S1 = '2B') or
     (S1 = '3B') or
     (S1 = '4B') or
     (S1 = '5B')) Then SS := S1;
  Result := '';
  if((S1 = 'NG') or
     (S1 = '0B') or
     (S1 = '1B') or
     (S1 = '2B') or
     (S1 = '3B')) Then Result := '<FONT color=#ff0000><b>';
  Result := Result+SS;
end;

function  TF_V03.GetHR(S1 : String) : String;
begin
  Result := S1;
  (*
  if D.H001.Locate('EMPID', S1, [loCaseInsensitive]) Then
    Result := D.H001.FieldByName('EMPID').AsString+'('+
              D.H001.FieldByName('HECNAME').AsString+')';
   *)           
end;

procedure TF_V03.SL03Mil;
var
  i,j,k : integer;
  B : integer;
  S0,S1,S2,S9 : String;
  B1,B2,B3 : String;
  AMsg: TIdMessage;
begin
  if (D.F00.FieldByName('BEF00302').AsString = '') Then Exit;
  S1 := '';
  S2 := '';
  SL04.Clear;
  for i:=0 to SL03.Count-1 do
  Begin
    S0 := SL03.Strings[i];
    if (KC_GetSubStr(#255,S0,1)<>'成型站') Then Continue;
    if (POS('成型站',KC_GetSubStr(#255,S0,2)) =0) Then Continue;
    // if (KC_GetSubStr(#255,S0,3)<>D.F00.FieldByName('BEF00300').AsString) Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF01') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF02') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF03') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF04') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF05') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF06') Then Continue;
    if (KC_GetSubStr(#255,S0,4) ='ZBEF07') Then Continue;
    B := -1;
    j := 1;
    While KC_GetSubStr(#255,S2,j)<>'' do
    Begin
      if (KC_GetSubStr(#255,S0,4) = KC_GetSubStr(#255,S2,j)) Then B:=j;
      inc(j);
    End;
    if (B<>-1) Then Continue;
    D.OpenF08('成型站',KC_GetSubStr(#255,S0,3),KC_GetSubStr(#255,S0,4));
    if (D.F08.FieldByName('BEF08102').AsString = '') Then Continue;
    S1 := S1+D.F08.FieldByName('BEF08102').AsString+#255;
    S2 := S2+KC_GetSubStr(#255,S0,4)+#255;
  End;
  SL04.Add('Item '#255+S1);
  S9  := '';
  for i:=0 to SL03.Count-1 do
  Begin
    S0 := SL03.Strings[i];
    if (KC_GetSubStr(#255,S0,1)<>'成型站')    Then Continue;
    if (POS('成型站',KC_GetSubStr(#255,S0,2)) =0) Then Continue;
    if (KC_GetSubStr(#255,S0,2) = S9) Then Continue;
    // if (KC_GetSubStr(#255,S0,3)<>D.F00.FieldByName('BEF00300').AsString) Then Continue;
    B:=-1;
    for j:=1 to SL04.Count-1 do
      if (KC_GetSubStr(#255,S0,2) = KC_EmpSubStr(SL04.Strings[j],1)) Then B:=1;
    if (B <> -1) Then Continue;
    S9 := KC_GetSubStr(#255,S0,2);
    if (S9 = '') Then Continue;
    B1 := '--';
    B2 := '--';
    B3 := '--';
    S1 := S9+#255;
    if (S9='成型站-前') Then S1 := '首檢'#255;
    if (S9='成型站-後') Then S1 := '尾檢'#255;
    j:=1;
    while KC_GetSubStr(#255,S2,j) <> '' do
    Begin
      B := -1;
      for k:=0 to SL03.Count-1 do
      Begin
        S0 := SL03.Strings[k];
        if (KC_GetSubStr(#255,S0,1)<>'成型站')    Then Continue;
        if (POS('成型站',KC_GetSubStr(#255,S0,2)) =0) Then Continue;
        // if (KC_GetSubStr(#255,S0,3)<>D.F00.FieldByName('BEF00300').AsString) Then Continue;
        if (KC_GetSubStr(#255,S0,2) <> S9) Then Continue;
        if (KC_GetSubStr(#255,S0,4) = KC_GetSubStr(#255,S2,j)) Then B := k;
      End;
      if (B =-1) Then S1 := S1+'--'#255;
      if (B<>-1) Then S1 := S1+GetColor(KC_GetSubStr(#255,SL03.Strings[B],5),KC_GetSubStr(#255,SL03.Strings[B],6))+#255;
      inc(j);
    End;
    SL04.Add(S1);
  End;
  if (SL04.Count <= 1) Then Exit;
  if (MessageDlg('是否發送警示郵件 ? ', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  AMsg := TIdMessage.Create(nil);
  AMsg.Body.Clear;
  AMsg.Body.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
  AMsg.Body.Add('<HTML><HEAD><TITLE></TITLE>');
  AMsg.Body.Add('<META http-equiv=Content-Type content="text/html; charset=big5">');
  AMsg.Body.Add('<META content="MSHTML 6.00.2800.1555" name=GENERATOR></HEAD>');
  AMsg.Body.Add('<BODY>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>產品編號 : '+E_004.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>ROLLER   : '+CB10204.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>機台類別 : '+E_005.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>檢驗寬幅 : '+E_10304.Text+'(mm)&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>首檢良率 : '+E_10309.Text+'%&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>尾檢良率 : '+iif((KC_StrToFloat(E_10310.Text)=0),'N/A',E_10310.Text+'%')+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>使用長度 : '+E_10302.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>收料長度 : '+E_10303.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>損耗異常 : '+CB_312.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>收料不足 : '+CB_314.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>存入時間 : '+FormatDateTime('yyyy-mm-dd hh:nn:ss'  , F.IdTime.DateTime)+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>發出電腦名稱-使用人 : '+KC_GetComputerName+' - '+GetHR(KC_GetUserName)+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT color=#0000ff size=2>');
  AMsg.Body.Add('<TABLE id=dgrdByItem');
  AMsg.Body.Add('style="BORDER-RIGHT: #dedfde 1px; BORDER-TOP: #dedfde 1px; FONT-SIZE: 10pt; BORDER-LEFT: #dedfde 1px; WIDTH: 100%; COLOR: black; BORDER-BOTTOM: #dedfde 1px; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: white"');
  AMsg.Body.Add('borderColor=#dedfde cellSpacing=0 cellPadding=4 rules=all border=1>');
  AMsg.Body.Add('<TBODY>');
  for i:=0 to SL04.Count-1 do
  Begin
    if ((i mod 2) =  0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de">');
    if ((i mod 2) <> 0) Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">');
    if  (i  = 0)        Then AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #6b696b; FONT-WEIGHT: bold; COLOR: white">');
    S0 := SL04.Strings[i];
    for j:=1 to KC_SCount(#255,S0) do
      AMsg.Body.Add('<TD>'+KC_GetSubStr(#255,S0,j)+'</TD>');
    AMsg.Body.Add('</TR>');
  End;
  AMsg.Body.Add('</TBODY></TABLE></FONT></DIV>');
  AMsg.Body.Add('<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=細明體 color=#008000');
  AMsg.Body.Add('size=2></FONT>&nbsp;</DIV></BODY></HTML>');
  AMsg.Subject := E_006.Text+'-'+E_10001.Text+'('+E_002.Text+'-'+E_003.Text+')';
  AMsg.ContentType :='text/html';
  AMsg.From.Address := 'BEF_Alert@prodisc.com.tw';
  AMsg.Sender.Address := 'BEF_Alert';
  AMsg.Recipients.EMailAddresses := D.F00.FieldByName('BEF00302').AsString;
  if (F.Pass_Man = 'kc') Then AMsg.Recipients.EMailAddresses := '86407@prodisc.com.tw';
  F.IdSMTP.Host := 'TWN-EXC-1';
  F.IdSMTP.Connect;
  F.IdSMTP.Send(AMsg);
  F.IdSMTP.Disconnect;
  AMsg.Free;                                  
end;

procedure TF_V03.B_Save1001Click(Sender: TObject);
var
  S1,S2 : String;
  SQL : String;
begin
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  case Kind of
     0 : Begin
           Ret := Chk10;
           if not Ret Then
           Begin
             ShowMessage('Error !!');
             Exit;
           End;
           D.OpenF16(E_10001.Text);
           S1 := D.F16.FieldByName('BEF16202').AsString;
           S2 := CB10202.Text;
           if (D.F10.FieldByName('BEF10004').AsString = 'T') Then CB_007.Checked := True;
           SQL := 'Update BEFF16 Set BEF16001 = '''+E_10001.Text+  // Run No.
                                 ''',BEF16002 = '''+E_002.Text+  // Product Type
                                 ''',BEF16003 = '''+E_003.Text+  // Product No
                                 ''',BEF16004 = '''+E_004.Text+  // Process No
                                 ''',BEF16005 = '''+E_005.Text+  // Line No (成型站)
                                 ''',BEF16006 = '''+E_006.Text+  // Working No
                                 ''',BEF16007 = '''+iif(CB_007.Checked,'Y','N')+  // 實驗用
                                 ''',BEF16101 = '''+'1'+  // 0.Hold 1.Running 2.Finish 3.Fail
                                 ''',BEF16201 = '''+E_10201.Text+  // Start OPID
                                 ''',BEF16202 = '''+CB10202.Text+  // PET No
                                 ''',BEF16203 = '''+E_10203.Text+  // 上架長度(PET)
                                 ''',BEF16204 = '''+CB10204.Text+  // ROLLER No
                                 ''',BEF16205 = '''+E_10205.Text+  // 上架長度(PET)
                                 ''',BEF16304 = '''+E_10304.Text+
                                 ''',BEF16299 = '''+E_10299.Text+  // Start Note
                           ''' Where BEF16001 = '''+E_10001.Text+'''';
           if not D.F16.Locate('BEF16001',E_10001.Text, [loCaseInsensitive]) Then
           Begin
             SQL := 'INSERT INTO BEFF16 (BEF16001,BEF16002,BEF16003,BEF16004,BEF16005,BEF16006,BEF16007,BEF16101,BEF16102,BEF16201,BEF16202,BEF16203,BEF16204,BEF16205,BEF16304,BEF16299)'+
                               ' VALUES ('''+E_10001.Text+  // Run No.
                                     ''','''+E_002.Text+  // Product Type
                                     ''','''+E_003.Text+  // Product No
                                     ''','''+E_004.Text+  // Process No
                                     ''','''+E_005.Text+  // Line No (成型站)
                                     ''','''+E_006.Text+  // Working No
                                     ''','''+iif(CB_007.Checked,'Y','N')+  // 實驗用
                                     ''','''+'1'+  // 0.Hold 1.Running 2.Finish 3.Fail
                                     ''','''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+  // Begin  DateTime
                                     ''','''+E_10201.Text+  // Start OPID
                                     ''','''+CB10202.Text+  // PET No
                                     ''','''+E_10203.Text+  // 上架長度(PET)
                                     ''','''+CB10204.Text+  // ROLLER No
                                     ''','''+E_10205.Text+  // 上架長度(PET)
                                     ''','''+E_10304.Text+
                                     ''','''+E_10299.Text+  // Start Note
                                     ''')';
           End;
           KC_T2ExecSQL(SQL,D.FCmd);
           SaveF02(S1);
           SaveF02(S2);
           Ret := True;
           Close;
         End;
     1 : Begin
           if not ChkNte(0) Then Exit;
           if not ChkNte(1) Then Exit;
           Ret := Chk10;
           if not Ret Then
           Begin
             ShowMessage('Error !!');
             Exit;
           End;
           D.OpenF16(E_10001.Text);
           S1 := D.F16.FieldByName('BEF16202').AsString;
           S2 := CB10202.Text;
           B_1002Click(Sender);
           SG04Exit(Sender);
           SQL := 'Update BEFF16 Set BEF16101 = '''+F.SetRunning01(Kind,
                                                               D.F16.FieldByName('BEF16101').AsString,
                                                               E_10303.Text,
                                                               E_10307.Text)+
                                 ''',BEF16103 = '''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+  // Begin  DateTime
                                 ''',BEF16301 = '''+E_10301.Text+  //
                                 ''',BEF16302 = '''+E_10302.Text+  //
                                 ''',BEF16303 = '''+E_10303.Text+  //
                                 ''',BEF16304 = '''+E_10304.Text+  //
                                 ''',BEF16305 = '''+E_10305.Text+  //
                                 ''',BEF16306 = '''+E_10306.Text+  //
                                 ''',BEF16307 = '''+E_10307.Text+  //
                                 ''',BEF16308 = '''+CB_10308.Text+  //
                                 ''',BEF16309 = '''+E_10309.Text+  //
                                 ''',BEF16310 = '''+E_10310.Text+  //
                                 ''',BEF16311 = '''+iif(CB_311.Checked,'Y','N')+
                                 ''',BEF16312 = '''+KC_GetSubStr(#255,CB_312.Text,1)+  //
                                 ''',BEF16313 = '''+E_10313.Text+  //
                                 ''',BEF16314 = '''+KC_GetSubStr(#255,CB_314.Text,1)+  //
                                 ''',BEF16399 = '''+KC_GetSubStr(#255,E_10399.Text,1)+  //
                                 ''',BEF16499 = '''+E_10499.Text+  //
                                 ''',BEF16901 = '''+SL03.Text+  //
                                 ''',BEF16902 = '''+SL01.Text+  //
                           ''' Where BEF16001 = '''+E_10001.Text+'''';
           KC_T2ExecSQL(SQL,D.FCmd);
           SaveF02(S1);
           SaveF02(S2);
           Ret := True;
           Close;
         End;
     3 : Begin
           if not ChkNte(0) Then Exit;
           if not ChkNte(1) Then Exit;
           Ret := Chk10;
           if not Ret Then
           Begin
             ShowMessage('Error !!');
             Exit;
           End;
           D.OpenF16(E_10001.Text);
           S1 := D.F16.FieldByName('BEF16202').AsString;
           S2 := CB10202.Text;
           B_1002Click(Sender);
           SG04Exit(Sender);
           SQL := 'Update BEFF16 Set BEF16001 = '''+E_10001.Text+  // Run No.
                                 ''',BEF16002 = '''+E_002.Text+  // Product Type
                                 ''',BEF16003 = '''+E_003.Text+  // Product No
                                 ''',BEF16004 = '''+E_004.Text+  // Process No
                                 ''',BEF16005 = '''+E_005.Text+  // Line No (成型站)
                                 ''',BEF16006 = '''+E_006.Text+  // Working No
                                 ''',BEF16007 = '''+iif(CB_007.Checked,'Y','N')+  // 實驗用
                                 ''',BEF16101 = '''+F.SetRunning01(Kind,
                                                               D.F16.FieldByName('BEF16101').AsString,
                                                               E_10303.Text,
                                                               E_10307.Text)+
                                 ''',BEF16201 = '''+E_10201.Text+  // Start OPID
                                 ''',BEF16202 = '''+CB10202.Text+  // PET No
                                 ''',BEF16203 = '''+E_10203.Text+  // 上架長度(PET)
                                 ''',BEF16204 = '''+CB10204.Text+  // ROLLER No
                                 ''',BEF16205 = '''+E_10205.Text+  // 上架長度(PET)
                                 ''',BEF16299 = '''+E_10299.Text+  // Start Note
                                 ''',BEF16301 = '''+E_10301.Text+  //
                                 ''',BEF16302 = '''+E_10302.Text+  //
                                 ''',BEF16303 = '''+E_10303.Text+  //
                                 ''',BEF16304 = '''+E_10304.Text+  //
                                 ''',BEF16305 = '''+E_10305.Text+  //
                                 ''',BEF16306 = '''+E_10306.Text+  //
                                 ''',BEF16307 = '''+E_10307.Text+  //
                                 ''',BEF16308 = '''+CB_10308.Text+  //
                                 ''',BEF16309 = '''+E_10309.Text+  //
                                 ''',BEF16310 = '''+E_10310.Text+  //
                                 ''',BEF16311 = '''+iif(CB_311.Checked,'Y','N')+
                                 ''',BEF16312 = '''+KC_GetSubStr(#255,CB_312.Text,1)+  //
                                 ''',BEF16313 = '''+E_10313.Text+  //
                                 ''',BEF16314 = '''+KC_GetSubStr(#255,CB_314.Text,1)+  //
                                 ''',BEF16399 = '''+KC_GetSubStr(#255,E_10399.Text,1)+  //
                                 ''',BEF16499 = '''+E_10499.Text+  //
                                 ''',BEF16901 = '''+SL03.Text+  //
                                 ''',BEF16902 = '''+SL01.Text+  //
                           ''' Where BEF16001 = '''+E_10001.Text+'''';
           KC_T2ExecSQL(SQL,D.FCmd);
           SaveF02(S1);
           SaveF02(S2);
           Ret := True;
           Close;
         End;
  End;
  if((Kind in [1,3]) and
     (TBitBtn(Sender).Name='B_Save1002'))Then SL03Mil;
end;

procedure TF_V03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  SL04.Free;
end;

procedure TF_V03.B_1002Click(Sender: TObject);
begin
  if (KC_StrToFloat(E_10302.Text) = 0) Then E_10302.Text := E_10203.Text;
  E_10303.Text := format('%0.2f',[KC_StrToFloat(E_10302.Text)-
                                  KC_StrToFloat(E_10305.Text)-
                                  KC_StrToFloat(E_10306.Text)-
                                  KC_StrToFloat(E_10313.Text)]);
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT Sum(BEF19302) as Tot FROM BEFF19 '+
                                      'Where BEF19001 = '''+E_10001.Text+
                                ''' Group by BEF19001';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  E_10307.Text := format('%0.2f',[KC_StrToFloat(E_10302.Text)-
                                  KC_StrToFloat(E_10305.Text)-
                                  KC_StrToFloat(E_10306.Text)-
                                  KC_StrToFloat(E_10313.Text)-
                                  D.FP1.FieldByName('Tot').AsFloat]);
end;

procedure TF_V03.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  E_Time.Text := SG02.Cells[0,SG02.Row];
  SG03Ini;
  SG03Snd(SL02);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V03.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  E_Time.Text := SG02.Cells[0,SG02.Row];
  SG03Ini;
  SG03Snd(SL02);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

function  TF_V03.Judge(TSG : TStringGrid;iRow : integer) : String;
var
  Flt : Double;
  i   : integer;
begin
  Result := TSG.Cells[1,iRow];
  if (KC_GetSubStr(#255,TSG.Cells[00,iRow],3)<>'0') Then Exit;
  if not KC_ChkFloat(TSG.Cells[2,iRow]) Then Exit;
  Flt := KC_StrToFloat(TSG.Cells[2,iRow]);
  i   := KC_StrToInt(KC_GetSubStr(#255,TSG.Cells[00,iRow],5));
  Result := BEFJdg[i,0];
  if ((Flt<=KC_StrToFloat(TSG.Cells[12,iRow])+0.00000001)  and
      (Flt>=KC_StrToFloat(TSG.Cells[11,iRow])-0.00000001)) Then  Result := BEFJdg[i,1];
  if ((Flt<=KC_StrToFloat(TSG.Cells[10,iRow])+0.00000001)  and
      (Flt>=KC_StrToFloat(TSG.Cells[09,iRow])-0.00000001)) Then  Result := BEFJdg[i,2];
  if ((Flt<=KC_StrToFloat(TSG.Cells[08,iRow])+0.00000001)  and
      (Flt>=KC_StrToFloat(TSG.Cells[07,iRow])-0.00000001)) Then  Result := BEFJdg[i,3];
  if ((Flt<=KC_StrToFloat(TSG.Cells[06,iRow])+0.00000001)  and
      (Flt>=KC_StrToFloat(TSG.Cells[05,iRow])-0.00000001)) Then  Result := BEFJdg[i,4];
  if ((Flt<=KC_StrToFloat(TSG.Cells[04,iRow])+0.00000001)  and
      (Flt>=KC_StrToFloat(TSG.Cells[03,iRow])-0.00000001)) Then  Result := BEFJdg[i,5];
end;

procedure TF_V03.SL03Add(S1,S2 : String);
var
  j : Integer;
  S : String;
  B : integer;
begin
  if (S2='') Then Exit;
  B := -1;
  for j:=0 to SL03.Count-1 do
  Begin
    S := SL03.Strings[j];
    if (KC_GetSubStr(#255,S,1) =                   '成型站'      ) and
       (KC_GetSubStr(#255,S,2) =                   E_Time.Text   ) and
       (KC_GetSubStr(#255,S,3) = KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) and
       (KC_GetSubStr(#255,S,4) = S1) Then
    Begin
      B := j;
      Break;
    End;
  End;
  S := '成型站'+#255+
       E_Time.Text+#255+
       KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)+#255+
       S1+#255+
       S2;
  if (B = -1) Then SL03.Add(S);
  if (B <>-1) Then SL03.Strings[B] := S;
end;

procedure TF_V03.SG04Exit(Sender: TObject);
var
  i,j : Integer;
  S : String;
  B : integer;
begin
  for i:=1 to SG04.RowCount-1 do
  Begin
    B := -1;
    for j:=0 to SL03.Count-1 do
    Begin
      S := SL03.Strings[j];
      if (KC_GetSubStr(#255,S,1) =                   '成型站'      ) and
         (KC_GetSubStr(#255,S,2) =                   E_Time.Text   ) and
         (KC_GetSubStr(#255,S,3) = KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) and
         (KC_GetSubStr(#255,S,4) = KC_GetSubStr(#255,SG04.Cells[0,i]       ,1)) Then
      Begin
        B := j;
        Break;
      End;
    End;
    S := '成型站'+#255+
         E_Time.Text+#255+
         KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)+#255+
         KC_GetSubStr(#255,SG04.Cells[0,i],1)+#255+
         Judge(SG04,i)+#255+
         SG04.Cells[2,i];
    if (B = -1) Then SL03.Add(S);
    if (B <>-1) Then SL03.Strings[B] := S;
  End;
  SL03Add('ZBEF01',CB_Z01.Text);
  SL03Add('ZBEF02',CB_Z02.Text);
  SL03Add('ZBEF03',E_Z03.Text);
  SL03Add('ZBEF04',E_Z04.Text);
  SL03Add('ZBEF05',E_Z05.Text);
  SL03Add('ZBEF06',E_Z06.Text);
  SL03Add('ZBEF07',E_Z07.Text);
  SL03Add('ZBEF08',E_Z08.Text);
  SL03Add('ZBEF09',CB_Z09.Text);
  SL03Add('ZBEF10',CB_Z10.Text);
  SG02Ini;
  SG02Snd(SL03);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V03.SG03MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V03.SG03KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V03.SL03Del(S1 : String);
var
  j : Integer;
  S : String;
  B : integer;
begin
  B := -1;
  for j:=0 to SL03.Count-1 do
  Begin
    S := SL03.Strings[j];
    if (KC_GetSubStr(#255,S,1) =                   '成型站'      ) and
       (KC_GetSubStr(#255,S,2) =                   E_Time.Text   ) and
       (KC_GetSubStr(#255,S,3) = KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) and
       (KC_GetSubStr(#255,S,4) = S1) Then
    Begin
      B := j;
      Break;
    End;
  End;
  if (B <>-1) Then SL03.Delete(B);
end;

procedure TF_V03.B_Dele1002Click(Sender: TObject);
var
  i,j : integer;
  B : integer;
  S : String;
begin
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  for i:=1 to SG04.RowCount-1 do
  Begin
    B := -1;
    for j:=0 to SL03.Count-1 do
    Begin
      S := SL03.Strings[j];
      if (KC_GetSubStr(#255,S,1) =                   '成型站'      ) and
         (KC_GetSubStr(#255,S,2) =                   E_Time.Text   ) and
         (KC_GetSubStr(#255,S,3) = KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) and
         (KC_GetSubStr(#255,S,4) = KC_GetSubStr(#255,SG04.Cells[0,i]       ,1)) Then
      Begin
        B := j;
        Break;
      End;
    End;
    if (B <>-1) Then SL03.Delete(B);
  End;
  SL03Del('ZBEF01');
  SL03Del('ZBEF02');
  SL03Del('ZBEF03');
  SL03Del('ZBEF04');
  SL03Del('ZBEF05');
  SL03Del('ZBEF06');
  SL03Del('ZBEF07');
  SL03Del('ZBEF08');
  SL03Del('ZBEF09');
  SL03Del('ZBEF10');
  SG02Ini;
  SG02Snd(SL03);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V03.SG04DblClick(Sender: TObject);
begin
  if (KC_GetSubStr(#255,SG04.Cells[00,SG04.Row],3)='0') Then Exit;
  SG04.Cells[02,SG04.Row] := F.ChgJg(SG04.Cells[02,SG04.Row],['A+','B','NG','']);;
  SG04.Cells[01,SG04.Row] := SG04.Cells[02,SG04.Row];
end;

procedure TF_V03.SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow  = 0) Then Exit;
  if (ACol <> 1) Then Exit;
  with Sender as TStringGrid do
  begin
    if (Cells[ACol,ARow]<>'NG') Then Exit;
    Canvas.Brush.Color := clRed;
    Canvas.Font .Color := clBlack;
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

procedure TF_V03.B000Click(Sender: TObject);
var
  i,i1 : integer;
  Ans : Real;
  F0 : Real;
  F1 : Real;
  F2 : Real;
  F3 : Real;
  FF : Real;
begin
  if (KC_StrToFloat(E_Z04.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z05.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z06.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z07.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z08.Text)=0) Then Exit;
  if (D.F00.FieldByName('BEF00300').AsString<>KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) Then Exit;
  if (MessageDlg('你要更新"預估良率嗎 ?', mtConfirmation,[mbOk, mbCancel],0) <> mrOk) then Exit;
  F0 := 0;
  F1 := KC_StrToFloat(E_Z05.Text);
  F2 := KC_StrToFloat(E_Z06.Text);
  F3 := KC_StrToFloat(E_Z07.Text);
  for i:=1 to SG04.RowCount-1 do
  Begin
    i1 := KC_StrToInt(KC_GetSubStr(#255,SG04.Cells[0,i],4));
    if (i1 = 0) Then Continue;
    FF := KC_StrToFloat(SG04.Cells[2,i]);
    case i1 of
      1 : F0 := F0+ (FF/F2);                          // 1.缺點數/預計分條數
      2 : F0 := F0+  FF/((F1/F3)*F2);                 // 2.缺點數/((總檢查長度/裁切品長)*預計分條數)
      3 : F0 := F0+((FF*F1)/(200*3.14))/((F1/F3)*F2); // 3.((缺點數*總檢查長度)/(Roller 直徑*3.14)) / ((總檢查長度/裁切品長) *預計分條數)
    end;
  End;
  Ans := (1-F0)*100;
  E_Z03.Text := format('%0.2f',[Ans]);
  (*
  if (KC_StrToFloat(E_Z05.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z07.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z08.Text)=0) Then Exit;
  if (KC_StrToFloat(E_Z06.Text)=0) Then Exit;
  if (D.F10.FieldByName('BEF10108').ASSTRING = 'F') Then Exit;
  F0 := 0;
  for i:=1 to SG04.RowCount-1 do
    F0 := F0 + KC_StrToFloat(SG04.Cells[2,i]);
  F1 := KC_StrToFloat(E_Z05.Text);
  F2 := KC_StrToFloat(E_Z07.Text);
  F3 := KC_StrToFloat(E_Z06.Text);
  Ans := (1-F0/((F1/F2)*F3))*D.F00.FieldByName('BEF00304').AsFloat*100;
  if (E_Z03.Text <> '') and (E_Z03.Text <> format('%0.2f',[Ans])) Then
    if (MessageDlg(format('你要更新"預估良率為 %0.2f" 嗎 ?',[Ans]), mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  E_Z03.Text := format('%0.2f',[Ans]);
  *)
end;

procedure TF_V03.SL01ToSG04;
var
  i,j : integer;
  Sum : integer;
  S : String;

begin
  for i:=1 to SG04.RowCount-1 do
  Begin
    Sum := 0;
    for j:=0 to SL01.Count-1 do // 首尾#Group#Item1#SN#Data    外觀細節
    Begin
      S := SL01.Strings[j];
      if (KC_GetSubStr(#255,S,1) <> SG02.Cells[0,SG02.Row]) Then Continue;
      if (KC_GetSubStr(#255,S,2) <> KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) Then Continue;
      if (KC_GetSubStr(#255,S,3) <> KC_GetSubStr(#255,SG04.Cells[0,       i],1)) Then Continue;
      Sum := Sum + KC_StrToInt(KC_GetSubStr(#255,S,5));
    End;
    SG04.Cells[02,i] := IntToStr(Sum);
  End;
end;

procedure TF_V03.SG03DblClick(Sender: TObject);
begin
  if (KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1) <>D.F00.FieldByName('BEF00305').AsString) Then Exit;
  F_V0301 := TF_V0301.Create(Application);
  try
    F_V0301.Tm  := SG02.Cells[0,SG02.Row];
    F_V0301.Grp := KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1);
    F_V0301.ShowModal;
    SL01ToSG04;
    SG04Exit(Sender);
  finally
    F_V0301.Free;
  end;
end;

end.


