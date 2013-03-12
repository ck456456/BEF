unit U_V05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, StdCtrls, ComCtrls, DB, IdMessage,
  CIM_Grid;

type
  TF_V05 = class(TForm)
    Panel5: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    E_006: TEdit;
    E_002: TEdit;
    E_005: TEdit;
    E_004: TEdit;
    PC01: TPageControl;
    TS0101: TTabSheet;
    Panel3: TPanel;
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
    E_Time: TEdit;
    Panel13: TPanel;
    Splitter5: TSplitter;
    Panel14: TPanel;
    SG03: TStringGrid;
    Panel15: TPanel;
    SG04: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Label8: TLabel;
    CB202: TComboBox;
    CB203: TComboBox;
    Label11: TLabel;
    E_201: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    E_299: TEdit;
    L_DNPno: TLabel;
    L_UPPNo: TLabel;
    SG00: TStringGrid;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    CB_Station: TComboBox;
    BitBtn1: TBitBtn;
    B_Cls: TBitBtn;
    Label12: TLabel;
    CB_003: TComboBox;
    Label3: TLabel;
    E_499: TEdit;
    Label24: TLabel;
    CB401: TComboBox;
    CB402: TComboBox;
    Label25: TLabel;
    Label18: TLabel;
    E_S01: TEdit;
    L_902: TLabel;
    E_S02: TEdit;
    Label19: TLabel;
    E_S03: TEdit;
    B_1001: TButton;
    Label23: TLabel;
    E_007: TEdit;
    CB_009: TCheckBox;
    B_Excel: TButton;
    Label16: TLabel;
    E_301: TEdit;
    Label15: TLabel;
    E_399: TEdit;
    E_303: TEdit;
    E_304: TEdit;
    Label5: TLabel;
    Label17: TLabel;
    E_302: TEdit;
    Label21: TLabel;
    CB_309: TCheckBox;
    Label40: TLabel;
    Label43: TLabel;
    CB_311: TComboBox;
    CB_310: TComboBox;
    Label20: TLabel;
    E_306: TEdit;
    B_1002: TButton;
    Label6: TLabel;
    E_307: TEdit;
    Label10: TLabel;
    E_308: TEdit;
    Panel17: TPanel;
    Panel16: TPanel;
    SG05: TCIM_Grid;
    SG06: TCIM_Grid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Save1001Click(Sender: TObject);
    procedure B_1002Click(Sender: TObject);
    procedure SG04Exit(Sender: TObject);
    procedure SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG04DblClick(Sender: TObject);
    procedure SG03KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG03MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CB_StationChange(Sender: TObject);
    procedure B_Dele1002Click(Sender: TObject);
    procedure B_1001Click(Sender: TObject);
    procedure SG00MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG00KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V : Variant;
    SL01 : TStringList;  // Base
    SL02 : TStringList;  // JudgeType
    SL03 : TStringList;  // Data
    SL04 : TStringList;  // Mail
    procedure OpenG19(S1,S2 : String);
    function  GetColor(S1 : String) : String;
    function  Chk20 : Boolean;
    function  GetSpec(I1:Integer;S1,S2,S3,S4 : String) : String;
    procedure OpenF16(S1 : String); // overload;
    procedure IniSet;
    function  GetS03 : String;
    procedure OpenF05(S1 : String);
    function  GetF05(S1 : String) : String;
    procedure LoadF05(TCB : TComboBox;S1 : String);
    function  ChkNte(I1:Integer): Boolean;
    function  GetNte(S1 : String;CB: TComboBox) : Integer;
    procedure LoadNte(S1 : String;CB: TComboBox);
    procedure LoadUpP(TCB : TComboBox);
    procedure LoadDnP(TCB : TComboBox);
    procedure F10UpData;
    procedure F19UpData;
    procedure SG00Ini;
    procedure SG02Ini;
    procedure SG03Ini;
    procedure SG04Ini;
    procedure SG04Hdr;
    procedure SG05Ini;
    procedure SG06Ini;
    procedure SG00Snd;
    procedure SG02Snd(TSL :TStringList);
    procedure SG03Snd(TSL :TStringList);
    procedure SG04Snd(TSL :TStringList);
    procedure SG05Snd;
    procedure SG06Snd;
    function  Judge(TSG : TStringGrid;iRow : integer) : String;
    procedure SaveF16;
    procedure SaveF19;
    procedure SL03Mil;
    function  GetHR(S1 : String) : String;
  public
    { Public declarations }
    Kind : Integer;      // 0:Append 1.Modify  2.View
    ERunning : String;       // 0.Hold 1.Running 2.Finish 3.Fail
    Run  : String;       // 0.Hold 1.Running 2.Finish 3.Fail
    Ret  : Boolean;
  end;

var
  F_V05: TF_V05;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V05.SG00Ini;
begin
  KC_SGClear(0,SG00);
  SG00.Cells[00,0] := 'Run';
  SG00.Cells[01,0] := '未褙膜';
  SG00.Cells[02,0] := '熟成';
  SG00.Cells[03,0] := '級別';
  SG00.Cells[04,0] := '預計熟成';
  SG00.Cells[05,0] := '成型工單';
  KC_ColAutoSize(SG00);
end;

procedure TF_V05.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Time';
  SG02.Cells[00,1] := '首檢';
  SG02.Cells[00,2] := '尾檢';
  KC_ColAutoSize(SG02);
end;

procedure TF_V05.SG03Ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Group';
  KC_ColAutoSize(SG03);
end;

procedure TF_V05.SG04Ini;
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

procedure TF_V05.SG05Ini;
var
  S : String;
  CCO : TCIMColOption;
begin
  CCO.Editor := cimCombobox;
  D.ORunningF13('1');
  S := '';
  While not D.F13.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10106').AsString <> 'all') and
        (D.F10.FieldByName('BEF10106').AsString <> D.F13.FieldByName('BEF13002').AsString)) Then
    Begin
      D.F13.Next;
      Continue;
    End;
    S := S+D.F13.FieldByName('BEF13001').AsString+';';
    D.F13.Next;
  End;
  SG05.Items.Clear;
  SG05.Items.Add(S);

  SG05.Clear;
  SG05.Cells[00,00] := '其他上保編號';  SG05.CIMColOption[0] := CCO;
  SG05.Cells[01,00] := '上保損耗';
  SG05.AutoSize;
end;

procedure TF_V05.SG06Ini;
var
  S : String;
  CCO : TCIMColOption;
begin
  CCO.Editor := cimCombobox;
  D.ORunningF14('1');
  S := '';
  While not D.F14.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10107').AsString <> 'all') and
        (D.F10.FieldByName('BEF10107').AsString <> D.F14.FieldByName('BEF14002').AsString)) Then
    Begin
      D.F14.Next;
      Continue;
    End;
    S := S+D.F14.FieldByName('BEF14001').AsString+';';
    D.F14.Next;
  End;
  SG06.Items.Clear;
  SG06.Items.Add(S);

  SG06.Clear;
  SG06.Cells[00,00] := '其他下保編號'; SG06.CIMColOption[0] := CCO;
  SG06.Cells[01,00] := '下保損耗';
  SG06.AutoSize;
end;

procedure TF_V05.LoadNte(S1 : String;CB: TComboBox);
begin
  D.OpenF23;
  CB.Clear;
  CB.Items.Add('');
  While not D.F23.Eof do
  Begin
    if((D.F23.FieldByName('BEF23001').AsString <> '褙膜站') or
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

procedure TF_V05.LoadUpP(TCB : TComboBox);
begin
  D.ORunningF13('1');
  TCB.Clear;
  While not D.F13.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10106').AsString <> 'all') and
        (D.F10.FieldByName('BEF10106').AsString <> D.F13.FieldByName('BEF13002').AsString)) Then
    Begin
      D.F13.Next;
      Continue;
    End;
    TCB.Items.Add(D.F13.FieldByName('BEF13001').AsString);
    D.F13.Next;
  End;
end;

procedure TF_V05.LoadDnP(TCB : TComboBox);
begin
  D.ORunningF14('1');
  TCB.Clear;
  While not D.F14.Eof do
  Begin
    if ((D.F10.FieldByName('BEF10107').AsString <> 'all') and
        (D.F10.FieldByName('BEF10107').AsString <> D.F14.FieldByName('BEF14002').AsString)) Then
    Begin
      D.F14.Next;
      Continue;
    End;
    TCB.Items.Add(D.F14.FieldByName('BEF14001').AsString);
    D.F14.Next;
  End;
end;

procedure TF_V05.SG03Snd(TSL :TStringList);
var
  S1 : String;
  i,iRow : integer;
begin
  iRow := 1;
  for i:=0 to SL02.Count - 1 do
  Begin
    S1 := SL02.Strings[i];
    if (KC_GetSubStr(#255,S1,1) <> CB_Station.Text) Then Continue;
    SG03.Cells[0,iRow] := KC_GetSubStr(#255,S1,2)+#255+
                          KC_GetSubStr(#255,S1,3);
    inc(iRow);
  End;
  SG03.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG03);
end;

procedure TF_V05.SG04Hdr;
var
  i : integer;
begin
  i := 1;
  D.OpenF08(CB_Station.Text,KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1));
  D.OpenF07(CB_Station.Text,KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1));
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
  D.OpenF09(CB_Station.Text,KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1),
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

procedure TF_V05.OpenF05(S1 : String);
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05002= '''+S1+'''';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
End;

procedure TF_V05.LoadF05(TCB : TComboBox;S1 : String);
begin
  OpenF05(S1);
  D.F05.First;
  TCB.Clear;
  TCB.Items.Add('');
  While not D.F05.Eof do
  Begin
    TCB.Items.Add(D.F05.FieldByName('BEF05003').AsString+#255+
                  D.F05.FieldByName('BEF05001').AsString+#255+
                  D.F05.FieldByName('BEF05008').AsString);
    D.F05.Next;
  End;
end;

function TF_V05.GetF05(S1 : String) : String;
var
  i : integer;
  SS : String;
begin
  Result := S1;
  for i:=0 to CB_003.Items.Count-1 do
  Begin
    SS := CB_003.Items.Strings[i];
    if S1 = KC_GetSubStr(#255,SS,2) Then
      Result := SS;
  End;
end;

function  TF_V05.GetNte(S1 : String;CB: TComboBox) : Integer;
var
  i : integer;
begin
  Result := 0;
  for i:=1 to CB.Items.Count-1 do
    if (S1=KC_GetSubStr(#255,CB.Items.Strings[i],1)) Then
      Result := i;
end;

procedure TF_V05.F19UpData;
begin
  D.OpenF19(KC_GetSubStr(#255,Run,1),
            KC_GetSubStr(#255,Run,2));

   LoadF05(CB_003,D.F19.FieldByName('BEF19002').AsString);
   E_002.Text := D.F19.FieldByName('BEF19002').AsString;
   CB_003.Text := GetF05(D.F19.FieldByName('BEF19003').AsString);
   E_004.Text := D.F19.FieldByName('BEF19004').AsString;
   E_005.Text := D.F19.FieldByName('BEF19005').AsString;
   E_006.Text := D.F19.FieldByName('BEF19006').AsString;
   E_007.Text := D.F19.FieldByName('BEF19007').AsString;
   E_S01.Text := KC_GetDateDSP(copy(E_007.Text,1,4));
   E_S02.Text := copy(E_007.Text,5,2);
   E_S03.Text := copy(E_007.Text,7,2);

  CB_009.Checked := (D.F19.FieldByName('BEF19009').AsString='Y');

   E_201.Text := D.F19.FieldByName('BEF19201').AsString;
   CB202.Text := D.F19.FieldByName('BEF19202').AsString;
   CB203.Text := D.F19.FieldByName('BEF19203').AsString;
   E_299.Text := D.F19.FieldByName('BEF19299').AsString;

   E_301.Text := D.F19.FieldByName('BEF19301').AsString;
   E_302.Text := D.F19.FieldByName('BEF19302').AsString;
   E_303.Text := D.F19.FieldByName('BEF19303').AsString;
   E_304.Text := D.F19.FieldByName('BEF19304').AsString;
   E_306.Text := D.F19.FieldByName('BEF19306').AsString;
   E_307.Text := D.F19.FieldByName('BEF19307').AsString;
   E_308.Text := D.F19.FieldByName('BEF19308').AsString;
   CB_309.Checked :=       (D.F19.FieldByName('BEF19309').AsString='Y');
   CB_310.ItemIndex    := GetNte(D.F19.FieldByName('BEF19310').AsString,CB_310);
   CB_311.ItemIndex    := GetNte(D.F19.FieldByName('BEF19311').AsString,CB_311);
   E_399.Text := D.F19.FieldByName('BEF19399').AsString;
   CB401.Text := D.F19.FieldByName('BEF19401').AsString;
   CB402.Text := D.F19.FieldByName('BEF19402').AsString;
   E_499.Text := D.F19.FieldByName('BEF19499').AsString;

   SL01.Assign(D.F19.FieldByName('BEF19902'));
   SL03.Assign(D.F19.FieldByName('BEF19901'));
   SG02Snd(SL03);
   SG04Snd(SL03);
end;

procedure TF_V05.F10UpData;
begin
  // D.OpenF10(KC_GetSubStr(#255,CB_003.Text,1),E_004.Text);
  D.OpenF10(E_002.Text,E_004.Text);
  D.OpenF05(D.F10.FieldByName('BEF10106').AsString);
  L_UPPNo.Caption := D.F05.FieldByName('BEF05001').AsString+' : '+
                     D.F05.FieldByName('BEF05099').AsString;
  D.OpenF05(D.F10.FieldByName('BEF10107').AsString);
  L_DNPNo.Caption := D.F05.FieldByName('BEF05001').AsString+' : '+
                     D.F05.FieldByName('BEF05099').AsString;
  SL02.Assign(D.F10.FieldByName('BEF10901'));
  SG03Snd(SL02);
  SG04Hdr;
end;

procedure TF_V05.OpenF16(S1 : String);
var
  SRun : String;
begin
  SRun := 'With (INDEX(BEFF16_101)) Where  BEF16101 = ''2'' and BEF16002 = '''+S1+'''';
  if (F_V05.Kind<>0) Then SRun := ' Where  BEF16001 = '''+KC_GetSubStr(#255,Run,1)+'''';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := 'SELECT * FROM BEFF16 '+SRun+' Order by BEF16001';
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_V05.SG00Snd;
var
  i,B : integer;
begin
  i := 1;
  KC_SGClear(1,SG00);
  OpenF16(E_002.Text);
  While not D.F16.Eof do
  Begin
    if (F_V05.Kind = 0) and
       (D.F10.FieldByName('BEF10201').ASString <> 'all') and
       (D.F10.FieldByName('BEF10201').ASString <> D.F16.FieldByName('BEF16004').ASString) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SG00.Cells[0,i] :=      D.F16.FieldByName('BEF16001').ASString;
    SG00.Cells[1,i] :=      D.F16.FieldByName('BEF16307').ASString;
    SG00.Cells[2,i] := F.Hr(D.F16.FieldByName('BEF16103').ASString);
    SG00.Cells[3,i] :=      D.F16.FieldByName('BEF16308').ASString;
    SG00.Cells[4,i] :=      D.F10.FieldByName('BEF10101').ASString;
    SG00.Cells[5,i] :=      D.F16.FieldByName('BEF16006').ASString;
    SG00.Cells[2,i] := iif(KC_StrToFloat(SG00.Cells[2,i])>=KC_StrToFloat(SG00.Cells[4,i]),'ok',SG00.Cells[2,i]);
    D.F16.Next;
    inc(i);
  End;
  SG00.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG00);

  if (Kind = 0) Then Exit;
  B := -1;
  for i:=1 to SG00.RowCount-1 do
    if (SG00.Cells[0,i] = KC_GetSubStr(#255,Run,1)) Then B := i;
  if (B = -1) Then
  Begin
    ShowMessage('成型 Run 不存在 !!');
    Exit;
  End;
  SG00.Row := B;
end;

procedure TF_V05.SG02Snd(TSL :TStringList);
var
  i,j : Integer;
  S : String;
  Ret : Boolean;
begin
  SL03.Sort;
  For i:=0 To SL03.Count-1 do
  Begin
    S := SL03.Strings[i];
    if (CB_Station.Text<>KC_GetSubStr(#255,S,1)) Then Continue;

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

procedure TF_V05.SG05Snd;
var
  i : Integer;
begin
  D.OpenF29(KC_GetSubStr(#255,Run,1),
            KC_GetSubStr(#255,Run,2));
  KC_SGClear(1,SG05);
  i:=1;
  While not D.F29.Eof do
  Begin
    if (D.F29.FieldByName('BEF29002').AsString <> 'F13') Then
    Begin
      D.F29.Next;
      Continue;
    End;
    SG05.Cells[0,i] := D.F29.FieldByName('BEF29001').AsString;
    SG05.Cells[1,i] := D.F29.FieldByName('BEF29005').AsString;
    D.F29.Next;
    inc(i);
  End;
  SG05.AutoSize;
end;

procedure TF_V05.SG06Snd;
var
  i : Integer;
begin
  D.OpenF29(KC_GetSubStr(#255,Run,1),
            KC_GetSubStr(#255,Run,2));
  KC_SGClear(1,SG06);
  i:=1;
  While not D.F29.Eof do
  Begin
    if (D.F29.FieldByName('BEF29002').AsString <> 'F14') Then
    Begin
      D.F29.Next;
      Continue;
    End;
    SG06.Cells[0,i] := D.F29.FieldByName('BEF29001').AsString;
    SG06.Cells[1,i] := D.F29.FieldByName('BEF29005').AsString;
    D.F29.Next;
    inc(i);
  End;
  SG06.AutoSize;
end;

procedure TF_V05.SG04Snd(TSL :TStringList);
var
  i,j : Integer;
  S : String;
begin
  For i:=0 To SL03.Count-1 do
  Begin
    S := SL03.Strings[i];
    for j:=1 to SG04.RowCount-1 do
    Begin
      if (                  CB_Station.Text          <>KC_GetSubStr(#255,S,1)) Then Continue;
      if (                  SG02.Cells[0,SG02.Row]   <>KC_GetSubStr(#255,S,2)) Then Continue;
      if (KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)<>KC_GetSubStr(#255,S,3)) Then Continue;
      if (KC_GetSubStr(#255,SG04.Cells[0,       j],1)<>KC_GetSubStr(#255,S,4)) Then Continue;
      SG04.Cells[1,j] := KC_GetSubStr(#255,S,5);
      SG04.Cells[2,j] := KC_GetSubStr(#255,S,6);
    End;
  End;
  KC_ColAutoSize(SG04);
end;

function  TF_V05.GetS03 : String;
var
  S1 : String;
  i  : integer;
begin
  S1 := KC_GetDayDSP(KC_B2Day(E_S01.Text))+E_S02.Text;
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT BEF19001,BEF19007 FROM BEFF19 Where BEF19001 =  '''+SG00.Cells[0,SG00.Row]+
                                                           ''' and BEF19007 >= '''+S1+
                                                           ''' and BEF19007 <= '''+S1+'z'' Order by BEF19007';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  Result := '-';
  for i:=1 to 9 do
  Begin
    S1 := D.F19.FieldByName('BEF19007').AsString;
    S1 := copy(S1,7,1);
    if (i<>KC_StrToInt(S1)) Then
    Begin
      Result := KC_IntFillChar(i,1,'0');
      Exit;
    End;
    D.F12.Next;
  End;
end;

procedure TF_V05.IniSet;
begin
  D.OpenF00;
  CB401.Items.Assign(D.F00.FieldByName('BEF00303'));
  CB402.Items.Assign(D.F00.FieldByName('BEF00303'));
  LoadNte('0',CB_310);
  LoadNte('1',CB_311);
  case Kind of
    0 : Begin
          F10UpData;
          SG00Snd;
          LoadUpP(CB202);
          LoadDnP(CB203);
          SG05Ini;
          SG06Ini;
          SG05Snd;
          SG06Snd;
          SG00.Enabled   := True;
          E_007.Enabled  := True;
          B_1001.Enabled := True;
          PC01.Pages[1].TabVisible := False;
          E_S01.Text := KC_Data2B(F.IdTime.DateTime);
          E_S02.Text := D.F12.FieldByName('BEF12004').AsString;
          E_S03.Text := GetS03;
          B_Excel.Visible := False;
        End;
    1 : Begin
          F19UpData;
          F10UpData;
          SG00Snd;
          SG02Snd(SL03);
          SG04Snd(SL03);
          SG05Ini;
          SG06Ini;
          SG05Snd;
          SG06Snd;
          SG00.Enabled   := False;
          E_007.Enabled  := False;
          B_1001.Enabled := False;
          PC01.ActivePageIndex := 0;
        End;
    3 : Begin
          F19UpData;
          F10UpData;
          SG00Snd;
          SG02Snd(SL03);
          SG04Snd(SL03);
          SG05Ini;
          SG06Ini;
          SG05Snd;
          SG06Snd;
          SG00.Enabled   := False;
          E_007.Enabled  := False;
          B_1001.Enabled := False;
          PC01.ActivePageIndex := 1;
        End;
  End;
end;

procedure TF_V05.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  SL04 := TStringList.Create;
  // D.OpenH001;
  SG00Ini;
  SG02Ini;
  SG03Ini;
  SG04Ini;
  IniSet;
end;

procedure TF_V05.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
  SL01.Free;
  SL02.Free;
  SL03.Free;
  SL04.Free;
end;

function  TF_V05.Chk20 : Boolean;
begin
  Result := True;
  case Kind of
    0 : Begin
          if (E_007.Text = '') Then Result := False;
          if (CB202.Text = '') Then Result := False;
          // if (CB203.Text = '') Then Result := False;
          if (SG00.Cells[2,SG00.Row] <> 'ok') Then Result := False;
          if (SG00.Cells[3,SG00.Row]  = '') Then Result := False;
        End;
    1 : Begin
          if (E_301.Text = '') Then Result := False;
        End
  End;
end;

procedure TF_V05.SaveF16;
var
  SQL : String;
  ff : Real;
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT Sum(BEF19302) as Tot FROM BEFF19 '+
                                      'Where BEF19001 = '''+SG00.Cells[0,SG00.Row]+
                                ''' Group by BEF19001';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
  D.OpenF16(KC_GetSubStr(#255,Run,1));
  if not D.F16.Locate('BEF16001',VarArrayOf([SG00.Cells[0,SG00.Row]]), [loCaseInsensitive]) Then Exit;
  ff := D.F16.FieldByName('BEF16303').AsFloat -
        D.FP1.FieldByName('Tot').AsFloat;
  SQL := 'Update BEFF16 Set BEF16307 = '''+format('%0.4f',[ff])+
                        ''',BEF16101 = '''+F.SetRunning01(3,
                                                      D.F16.FieldByName('BEF16101').AsString,
                                                      D.F16.FieldByName('BEF16303').AsString,
                                                      format('%0.4f',[ff]))+
                  ''' Where BEF16001 = '''+SG00.Cells[0,SG00.Row]+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
end;

function  TF_V05.ChkNte(I1:Integer): Boolean;
var
   F1 : Real;
begin
  Result := True;
  case I1 of
    0 : F1 := iif(CB_309.Checked,D.F10.FieldByName('BEF10111').AsFloat,
                                 D.F10.FieldByName('BEF10112').AsFloat);
    1 : F1 := D.F10.FieldByName('BEF10114').AsFloat;
  End;
  if (PC01.ActivePageIndex=1) Then Exit;
  if (D.F10.FieldByName('BEF10004').AsString = 'T') Then Exit;
  if CB_009.Checked Then Exit;
  if (F1 = 0) Then Exit;
  case I1 of
    0 : if (KC_StrToFloat(E_306.Text) > F1) and
           (CB_310.Text = '') Then
        Begin
          ShowMessage('請輸入異常損耗原因 !!');
          Result := False;
        End;
    1 : if (KC_StrToFloat(E_303.Text) < F1) and
           (CB_311.Text = '') Then
        Begin
          ShowMessage('請輸入收料不足原因 !!');
          Result := False;
        End;
  End;
end;

function  TF_V05.GetColor(S1 : String) : String;
begin
  Result := '';
  if (S1 = 'NG') Then Result := '<FONT color=#ff0000><b>';
end;

function  TF_V05.GetHR(S1 : String) : String;
begin
  Result := S1;
  (*
  if D.H001.Locate('EMPID', S1, [loCaseInsensitive]) Then
    Result := D.H001.FieldByName('EMPID').AsString+'('+
              D.H001.FieldByName('HECNAME').AsString+')';
              *)
end;

procedure TF_V05.SL03Mil;
var
  i,j,k,B : integer;
  S0,S1,S2,S9 : String;
  B1,B2,B3 : String;
  AMsg: TIdMessage;
begin
  if (MessageDlg('是否發送警示郵件 ? ', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  S1 := '';
  S2 := '';
  SL04.Clear;
  for i:=0 to SL03.Count-1 do
  Begin
    S0 := SL03.Strings[i];
    if  (KC_GetSubStr(#255,S0,1) <>'褙膜站') Then Continue;
    if ((KC_GetSubStr(#255,S0,2) <>  '首檢')  and
        (KC_GetSubStr(#255,S0,2) <>  '尾檢')) Then Continue;
    // if  (KC_GetSubStr(#255,S0,3)<>D.F00.FieldByName('BEF00400').AsString) Then Continue;
    B := -1;
    j := 1;
    While KC_GetSubStr(#255,S2,j)<>'' do
    Begin
      if (KC_GetSubStr(#255,S0,4) = KC_GetSubStr(#255,S2,j)) Then B:=j;
      inc(j);
    End;
    if (B<>-1) Then Continue;
    D.OpenF08('褙膜站',KC_GetSubStr(#255,S0,3),KC_GetSubStr(#255,S0,4));
    if (D.F08.FieldByName('BEF08102').AsString = '') Then Continue;
    S1 := S1+D.F08.FieldByName('BEF08102').AsString+#255;
    S2 := S2+KC_GetSubStr(#255,S0,4)+#255;
  End;
  SL04.Add('Item '#255+S1);
  S9  := '';
  for i:=0 to SL03.Count-1 do
  Begin
    S0 := SL03.Strings[i];
    if  (KC_GetSubStr(#255,S0,2) = S9)        Then Continue;
    if  (KC_GetSubStr(#255,S0,1) <>'褙膜站')  Then Continue;
    if ((KC_GetSubStr(#255,S0,2) <>  '首檢')  and
        (KC_GetSubStr(#255,S0,2) <>  '尾檢')) Then Continue;;
    // if  (KC_GetSubStr(#255,S0,3)<>D.F00.FieldByName('BEF00400').AsString) Then Continue;
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
    j:=1;
    while KC_GetSubStr(#255,S2,j) <> '' do
    Begin
      B := -1;
      for k:=0 to SL03.Count-1 do
      Begin
        S0 := SL03.Strings[k];
        if  (KC_GetSubStr(#255,S0,1) <>'褙膜站') Then Continue;
        if  (KC_GetSubStr(#255,S0,2) <> S9) Then Continue;
        // if  (KC_GetSubStr(#255,S0,3) <>D.F00.FieldByName('BEF00400').AsString) Then Continue;
        if  (KC_GetSubStr(#255,S0,4) = KC_GetSubStr(#255,S2,j)) Then B := k;
      End;
      if (B =-1) Then S1 := S1+'--'#255;
      if (B<>-1) Then S1 := S1+GetColor(KC_GetSubStr(#255,SL03.Strings[B],5))+KC_GetSubStr(#255,SL03.Strings[B],6)+#255;
      inc(j);
    End;
    SL04.Add(S1);
  End;
  if (SL04.Count <= 1) Then Exit;
  if (SL04.Count >= 3) Then
    if (KC_GetSubStr(#255,SL04.Strings[1],1) = '尾檢') Then SL04.Exchange(1,2);
  D.OpenF16(SG00.Cells[00,SG00.Row]);
  AMsg := TIdMessage.Create(nil);
  AMsg.Body.Clear;
  AMsg.Body.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
  AMsg.Body.Add('<HTML><HEAD><TITLE></TITLE>');
  AMsg.Body.Add('<META http-equiv=Content-Type content="text/html; charset=big5">');
  AMsg.Body.Add('<META content="MSHTML 6.00.2800.1555" name=GENERATOR></HEAD>');
  AMsg.Body.Add('<BODY>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>產品編號 : '+E_004.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>上保     : '+CB202.Text+'   '+L_UPPNo.Caption+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>下保     : '+CB203.Text+'   '+L_DNPno.Caption+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>機台類別 : '+E_005.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>檢驗寬幅 : '+D.F16.FieldByName('BEF16304').AsString+'(mm)&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>使用長度 : '+E_302.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>收料長度 : '+E_303.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>損耗異常 : '+CB_310.Text+'&nbsp;</DIV>');
  AMsg.Body.Add('<DIV><FONT size=3 face=新細明體 color=#0000ff>收料不足 : '+CB_311.Text+'&nbsp;</DIV>');
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
  AMsg.Subject := SG00.Cells[00,SG00.Row]+'-'+E_007.Text+'('+E_002.Text+':'+KC_GetSubStr(#255,CB_003.Text,2)+' - '+KC_GetSubStr(#255,CB_003.Text,1)+')';
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

procedure TF_V05.OpenG19(S1,S2 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT Count(*) as CntG19 FROM BEFG19 Where BEF19001 = '''+S1+
                                                            ''' and BEF19007 = '''+S2+'''';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V05.SaveF19;
var
  i : integer;
  SF13,SF14 : String;
  SQL : String;
begin
  SF13 := '';
  SF14 := '';
  D.OpenF29(SG00.Cells[0,SG00.Row],E_007.Text);
  While not D.F29.Eof do
  Begin
    if ('F13'=D.F29.FieldByName('BEF29002').AsString) Then
      SF13 := SF13+D.F29.FieldByName('BEF29001').AsString+#255;
    if ('F14'=D.F29.FieldByName('BEF29002').AsString) Then
      SF14 := SF14+D.F29.FieldByName('BEF29001').AsString+#255;
    D.F29.Next;
  End;
  SQL := 'Delete BEFF29 Where BEF29003 = '''+SG00.Cells[0,SG00.Row]+
                      ''' and BEF29004 = '''+E_007.Text+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  i := 1;
  While (KC_GetSubStr(#255,SF13,i) <>'') do
  Begin
    F.SaveF13(KC_GetSubStr(#255,SF13,i));
    inc(i);
  End;
  i := 1;
  While (KC_GetSubStr(#255,SF14,i) <>'') do
  Begin
    F.SaveF14(KC_GetSubStr(#255,SF14,i));
    inc(i);
  End;

  for i:=1 to SG05.RowCount-1 do
  Begin
    if (SG05.Cells[0,i] = '') Then Continue;
    SQL := 'INSERT INTO BEFF29 (BEF29001,BEF29002,BEF29003,BEF29004,BEF29005)'+
                      ' VALUES ('''+SG05.Cells[0,i]+         //上下保 No
                            ''','''+'F13'+                   //F13.上保 F14.下保
                            ''','''+SG00.Cells[0,SG00.Row]+  //褙膜Run No.
                            ''','''+E_007.Text+              //褙膜Run SN
                            ''','''+SG05.Cells[1,i]+         //上下保損耗
                            ''')';
    KC_T2ExecSQL(SQL,D.FCmd);
    F.SaveF13(SG05.Cells[0,i]);
  End;
  for i:=1 to SG06.RowCount-1 do
  Begin
    if (SG06.Cells[0,i] = '') Then Continue;
    SQL := 'INSERT INTO BEFF29 (BEF29001,BEF29002,BEF29003,BEF29004,BEF29005)'+
                      ' VALUES ('''+SG06.Cells[0,i]+         //上下保 No
                            ''','''+'F14'+                   //F13.上保 F14.下保
                            ''','''+SG00.Cells[0,SG00.Row]+  //褙膜Run No.
                            ''','''+E_007.Text+              //褙膜Run SN
                            ''','''+SG06.Cells[1,i]+         //上下保損耗
                            ''')';
    KC_T2ExecSQL(SQL,D.FCmd);
    F.SaveF14(SG06.Cells[0,i]);
  End;
end;

procedure TF_V05.B_Save1001Click(Sender: TObject);
var
  S1,S2 : array[0..1] of String;
  SQL : String;
begin
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  Case Kind of
    0 : Begin
          Ret := Chk20;
          if not Ret Then
          Begin
            ShowMessage('Error !!');
            Exit;
          End;
          D.OpenF19(SG00.Cells[0,SG00.Row],E_007.Text);
          SQL := 'Update BEFF19 Set BEF19001 = '''+SG00.Cells[0,SG00.Row]+  // Run No.
                                ''',BEF19002 = '''+E_002.Text+  // Product Type
                                ''',BEF19003 = '''+KC_GetSubStr(#255,CB_003.Text,2)+  // Product No
                                ''',BEF19004 = '''+E_004.Text+  // Process No
                                ''',BEF19005 = '''+E_005.Text+  // Line No
                                ''',BEF19006 = '''+E_006.Text+  // Working No
                                ''',BEF19007 = '''+E_007.Text+  // Working No
                                ''',BEF19009 = '''+iif(CB_009.Checked,'Y','N')+  // 實驗用
                                ''',BEF19101 = '''+'1'+  // 0.Hold 1.Running 2.Finish 3.Fail
                                ''',BEF19201 = '''+E_201.Text+  // Start OPID
                                ''',BEF19202 = '''+CB202.Text+  // 上保 No
                                ''',BEF19203 = '''+CB203.Text+  // 下保 No
                                ''',BEF19299 = '''+E_299.Text+  // Start Note
                          ''' Where BEF19001 = '''+SG00.Cells[0,SG00.Row]+
                            ''' and BEF19007 = '''+E_007.Text+'''';
          if not D.F19.Locate('BEF19001;BEF19007',VarArrayOf([SG00.Cells[0,SG00.Row],E_007.Text]), [loCaseInsensitive]) Then
          Begin
            SQL := 'INSERT INTO BEFF19 (BEF19001,BEF19002,BEF19003,BEF19004,BEF19005,BEF19006,BEF19007,BEF19009,BEF19101,BEF19102,BEF19201,BEF19202,BEF19203,BEF19299)'+
                              ' VALUES ('''+SG00.Cells[0,SG00.Row]+  // Run No.
                                    ''','''+E_002.Text+  // Product Type
                                    ''','''+KC_GetSubStr(#255,CB_003.Text,2)+  // Product No
                                    ''','''+E_004.Text+  // Process No
                                    ''','''+E_005.Text+  // Line No
                                    ''','''+E_006.Text+  // Working No
                                    ''','''+E_007.Text+  // Working No
                                    ''','''+iif(CB_009.Checked,'Y','N')+  // 實驗用
                                    ''','''+'1'+  // 0.Hold 1.Running 2.Finish 3.Fail
                                    ''','''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+  // 0.Hold 1.Running 2.Finish 3.Fail
                                    ''','''+E_201.Text+  // Start OPID
                                    ''','''+CB202.Text+  // 上保 No
                                    ''','''+CB203.Text+  // 下保 No
                                    ''','''+E_299.Text+  // Start Note
                                    ''')';
          End;
          KC_T2ExecSQL(SQL,D.FCmd);
          D.OpenF19(SG00.Cells[0,SG00.Row],E_007.Text);
          S1[0] := CB202.Text; S2[0] := D.F19.FieldByName('BEF19202').AsString;
          S1[1] := CB203.Text; S2[1] := D.F19.FieldByName('BEF19203').AsString;
          F.SaveF13(S1[0]);F.SaveF13(S2[0]);
          F.SaveF14(S1[1]);F.SaveF14(S2[1]);
          SaveF19;
          SaveF16;
          Ret := True;
          Close;
        End;
    1 : Begin
          if not ChkNte(0) Then Exit;
          if not ChkNte(1) Then Exit;
          Ret := Chk20;
          if not Ret Then
          Begin
            ShowMessage('Error !!');
            Exit;
          End;
          B_1002Click(Sender);
          SG04Exit(Sender);
          D.OpenF19(SG00.Cells[0,SG00.Row],E_007.Text);
          S1[0] := CB202.Text; S2[0] := D.F19.FieldByName('BEF19202').AsString;
          S1[1] := CB203.Text; S2[1] := D.F19.FieldByName('BEF19203').AsString;
          SQL := 'Update BEFF19 Set BEF19101 = '''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,E_303.Text,'99')+  // 0.Hold 1.Running 2.Finish 3.Fail
                                ''',BEF19103 = '''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+  // Begin  DateTime
                                ''',BEF19301 = '''+E_301.Text+
                                ''',BEF19302 = '''+E_302.Text+
                                ''',BEF19303 = '''+E_303.Text+
                                ''',BEF19304 = '''+E_304.Text+
                                ''',BEF19306 = '''+E_306.Text+
                                ''',BEF19307 = '''+E_307.Text+
                                ''',BEF19308 = '''+E_308.Text+
                                ''',BEF19309 = '''+iif(CB_309.Checked,'Y','N')+
                                ''',BEF19310 = '''+KC_GetSubStr(#255,CB_310.Text,1)+  //
                                ''',BEF19311 = '''+KC_GetSubStr(#255,CB_311.Text,1)+  //
                                ''',BEF19399 = '''+KC_GetSubStr(#255,E_399.Text,1)+
                                ''',BEF19401 = '''+CB401.Text+
                                ''',BEF19402 = '''+CB402.Text+
                                ''',BEF19499 = '''+E_499.Text+
                                ''',BEF19901 = '''+SL03.Text+
                                ''',BEF19902 = '''+SL01.Text+
                          ''' Where BEF19001 = '''+KC_GetSubStr(#255,Run,1)+
                            ''' and BEF19007 = '''+KC_GetSubStr(#255,Run,2)+'''';
          KC_T2ExecSQL(SQL,D.FCmd);
          OpenG19(KC_GetSubStr(#255,Run,1),KC_GetSubStr(#255,Run,2));
          SQL := 'Update BEFG19 Set BEF19501 = '''+E_303.Text+
                                ''',BEF19502 = '''+D.F16.FieldByName('BEF16304').ASSTRING+
                                ''',BEF19002 = '''+E_002.Text+  // Product Type
                                ''',BEF19003 = '''+KC_GetSubStr(#255,CB_003.Text,2)+  // Product No
                          ''' Where BEF19001 = '''+KC_GetSubStr(#255,Run,1)+
                            ''' and BEF19007 = '''+KC_GetSubStr(#255,Run,2)+
                            ''' and BEF19500 = ''01''';
          if (D.G19.FieldByName('CntG19').AsInteger = 0) Then
          Begin
            D.OpenF16(SG00.Cells[00,SG00.Row]);
            SQL := 'INSERT INTO BEFG19 (BEF19001,'+  // Run No.
                                       'BEF19002,'+  // 目標料號
                                       'BEF19003,'+  // 判級料號
                                       'BEF19004,'+  // Process No
                                       'BEF19007,'+  // Run SN
                                       'BEF19008,'+  // 出貨單號
                                       'BEF19010,'+  // 棧板編號
                                       'BEF19011,'+  // SN 位置(棧板)
                                       'BEF19012,'+  // 重量
                                       'BEF19101,'+  // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                                       'BEF19500,'+  // 出貨SN
                                       'BEF19501,'+  // 出貨長度
                                       'BEF19502)'+  // 出貨寬幅
                              'VALUES ('''+SG00.Cells[0,SG00.Row]+''','+   // Run No.
                                      ''''+E_002.Text+''','+   // 目標料號
                                      ''''+KC_GetSubStr(#255,CB_003.Text,2)+''','+   // 判級料號
                                      ''''+E_004.Text+''','+   // Process No
                                      ''''+E_007.Text+''','+   // Run SN
                                      ''''+''+''','+   // 出貨單號
                                      ''''+''+''','+   // 棧板編號
                                      ''''+''+''','+   // SN 位置(棧板)
                                      ''''+''+''','+   // 重量
                                      ''''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,E_303.Text,'99')+''','+   // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                                      ''''+'01'+''','+   // 出貨SN
                                      ''''+E_303.Text+''','+   // 出貨長度
                                      ''''+D.F16.FieldByName('BEF16304').ASSTRING+''')';   // 出貨寬幅
          End;
          if (D.G19.FieldByName('CntG19').AsInteger in [0,1]) Then
            KC_T3ExecSQL(SQL,D.SC)
          else
            if (MessageDlg('分條資料已建立 , 是否重新變動分條資料 ? ', mtConfirmation,[mbOk, mbCancel], 0) = mrOk) then
                KC_T3ExecSQL(SQL,D.SC);
          F.SaveF13(S1[0]);F.SaveF13(S2[0]);
          F.SaveF14(S1[1]);F.SaveF14(S2[1]);
          SaveF19;
          SaveF16;
          Ret := True;
          Close;
        End;
    3 : Begin
          if not ChkNte(0) Then Exit;
          if not ChkNte(1) Then Exit;
          Ret := Chk20;
          if not Ret Then
          Begin
            ShowMessage('Error !!');
            Exit;
          End;
          B_1002Click(Sender);
          SG04Exit(Sender);
          D.OpenF19(SG00.Cells[0,SG00.Row],E_007.Text);
          S1[0] := CB202.Text; S2[0] := D.F19.FieldByName('BEF19202').AsString;
          S1[1] := CB203.Text; S2[1] := D.F19.FieldByName('BEF19203').AsString;
          SQL := 'Update BEFF19 Set BEF19001 = '''+KC_GetSubStr(#255,Run,1)+  // Run No.
                                ''',BEF19002 = '''+E_002.Text+  // Product Type
                                ''',BEF19003 = '''+KC_GetSubStr(#255,CB_003.Text,2)+  // Product No
                                ''',BEF19004 = '''+E_004.Text+  // Process No
                                ''',BEF19005 = '''+E_005.Text+  // Line No (成型站)
                                ''',BEF19006 = '''+E_006.Text+  // Working No
                                ''',BEF19007 = '''+KC_GetSubStr(#255,Run,2)+  // Working No
                                ''',BEF19009 = '''+iif(CB_009.Checked,'Y','N')+  // 實驗用
                                ''',BEF19101 = '''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,E_303.Text,'99')+  // 0.Hold 1.Running 2.Finish 3.Fail
                                ''',BEF19201 = '''+E_201.Text+  // Start OPID
                                ''',BEF19202 = '''+CB202.Text+  // 上保 No
                                ''',BEF19203 = '''+CB203.Text+  // 下保 No
                                ''',BEF19299 = '''+E_299.Text+  // Start Note
                                ''',BEF19301 = '''+E_301.Text+
                                ''',BEF19302 = '''+E_302.Text+
                                ''',BEF19303 = '''+E_303.Text+
                                ''',BEF19304 = '''+E_304.Text+
                                ''',BEF19306 = '''+E_306.Text+
                                ''',BEF19307 = '''+E_307.Text+
                                ''',BEF19308 = '''+E_308.Text+
                                ''',BEF19309 = '''+iif(CB_309.Checked,'Y','N')+
                                ''',BEF19310 = '''+KC_GetSubStr(#255,CB_310.Text,1)+  //
                                ''',BEF19311 = '''+KC_GetSubStr(#255,CB_311.Text,1)+  //
                                ''',BEF19399 = '''+KC_GetSubStr(#255,E_399.Text,1)+
                                ''',BEF19401 = '''+CB401.Text+
                                ''',BEF19402 = '''+CB402.Text+
                                ''',BEF19499 = '''+E_499.Text+
                                ''',BEF19901 = '''+SL03.Text+
                                ''',BEF19902 = '''+SL01.Text+
                          ''' Where BEF19001 = '''+KC_GetSubStr(#255,Run,1)+
                            ''' and BEF19007 = '''+KC_GetSubStr(#255,Run,2)+'''';
          KC_T2ExecSQL(SQL,D.FCmd);

          OpenG19(KC_GetSubStr(#255,Run,1),KC_GetSubStr(#255,Run,2));
          SQL := 'Update BEFG19 Set BEF19501 = '''+E_303.Text+
                                ''',BEF19502 = '''+D.F16.FieldByName('BEF16304').ASSTRING+
                                ''',BEF19101 = '''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,E_303.Text,'99')+  // 0.Hold 1.Running 2.Finish 3.Fail
                                ''',BEF19002 = '''+E_002.Text+  // Product Type
                                ''',BEF19003 = '''+KC_GetSubStr(#255,CB_003.Text,2)+  // Product No
                          ''' Where BEF19001 = '''+KC_GetSubStr(#255,Run,1)+
                            ''' and BEF19007 = '''+KC_GetSubStr(#255,Run,2)+
                            ''' and BEF19500 = ''01''';
          if (D.G19.FieldByName('CntG19').AsInteger = 0) Then
          Begin
            D.OpenF16(SG00.Cells[00,SG00.Row]);
            SQL := 'INSERT INTO BEFG19 (BEF19001,'+  // Run No.
                                       'BEF19002,'+  // 目標料號
                                       'BEF19003,'+  // 判級料號
                                       'BEF19004,'+  // Process No
                                       'BEF19007,'+  // Run SN
                                       'BEF19008,'+  // 出貨單號
                                       'BEF19010,'+  // 棧板編號
                                       'BEF19011,'+  // SN 位置(棧板)
                                       'BEF19012,'+  // 重量
                                       'BEF19101,'+  // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                                       'BEF19500,'+  // 出貨SN
                                       'BEF19501,'+  // 出貨長度
                                       'BEF19502)'+  // 出貨寬幅
                              'VALUES ('''+SG00.Cells[0,SG00.Row]+''','+   // Run No.
                                      ''''+E_002.Text+''','+   // 目標料號
                                      ''''+KC_GetSubStr(#255,CB_003.Text,2)+''','+   // 判級料號
                                      ''''+E_004.Text+''','+   // Process No
                                      ''''+E_007.Text+''','+   // Run SN
                                      ''''+''+''','+   // 出貨單號
                                      ''''+''+''','+   // 棧板編號
                                      ''''+''+''','+   // SN 位置(棧板)
                                      ''''+''+''','+   // 重量
                                      ''''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,E_303.Text,'99')+''','+   // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                                      ''''+'01'+''','+   // 出貨SN
                                      ''''+E_303.Text+''','+   // 出貨長度
                                      ''''+D.F16.FieldByName('BEF16304').ASSTRING+''')';   // 出貨寬幅
          End;
          if (D.G19.FieldByName('CntG19').AsInteger in [0,1]) Then
            KC_T3ExecSQL(SQL,D.SC)
          else
            if (MessageDlg('分條資料已建立 , 是否重新變動分條資料 ? ', mtConfirmation,[mbOk, mbCancel], 0) = mrOk) then
                KC_T3ExecSQL(SQL,D.SC);
          F.SaveF13(S1[0]);F.SaveF13(S2[0]);
          F.SaveF14(S1[1]);F.SaveF14(S2[1]);
          SaveF19;
          SaveF16;
          Ret := True;
          Close;
        End;
  End;
  if((Kind in [1,3]) and
     (TBitBtn(Sender).Name='B_Save1002'))Then SL03Mil;
end;

procedure TF_V05.B_1002Click(Sender: TObject);
begin
  SL01.Clear;
  if (KC_StrToFloat(E_302.Text) = 0) Then E_302.Text := SG00.Cells[1,SG00.Row];
  E_303.Text := FloatToStr(KC_StrToFloat(E_302.Text)-
                           KC_StrToFloat(E_304.Text)-
                           KC_StrToFloat(E_306.Text));
end;

function  TF_V05.Judge(TSG : TStringGrid;iRow : integer) : String;
var
  Flt : Double;
  i   : integer;
begin
  Result := TSG.Cells[1,iRow];
  if (KC_GetSubStr(#255,TSG.Cells[00,iRow],3)<>'0') Then Exit;
  if not KC_ChkFloat(TSG.Cells[2,iRow]) Then Exit;
  Flt := KC_StrToFloat(TSG.Cells[2,iRow]);
  i   := KC_StrToInt(KC_GetSubStr(#255,TSG.Cells[00,iRow],5));
  // i   := D.F07.FieldByName('BEF07004').ASInteger;
  Result := BEFJdg[i,0];
  if ((Flt<=KC_StrToFloat(TSG.Cells[12,iRow]))  and
      (Flt>=KC_StrToFloat(TSG.Cells[11,iRow]))) Then  Result := BEFJdg[i,1];
  if ((Flt<=KC_StrToFloat(TSG.Cells[10,iRow]))  and
      (Flt>=KC_StrToFloat(TSG.Cells[09,iRow]))) Then  Result := BEFJdg[i,2];
  if ((Flt<=KC_StrToFloat(TSG.Cells[08,iRow]))  and
      (Flt>=KC_StrToFloat(TSG.Cells[07,iRow]))) Then  Result := BEFJdg[i,3];
  if ((Flt<=KC_StrToFloat(TSG.Cells[06,iRow]))  and
      (Flt>=KC_StrToFloat(TSG.Cells[05,iRow]))) Then  Result := BEFJdg[i,4];
  if ((Flt<=KC_StrToFloat(TSG.Cells[04,iRow]))  and
      (Flt>=KC_StrToFloat(TSG.Cells[03,iRow]))) Then  Result := BEFJdg[i,5];
end;

procedure TF_V05.SG04Exit(Sender: TObject);
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
      if (KC_GetSubStr(#255,S,1) =             CB_Station.Text) and
         (KC_GetSubStr(#255,S,2) =                 E_Time.Text) and
         (KC_GetSubStr(#255,S,3) = KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)) and
         (KC_GetSubStr(#255,S,4) = KC_GetSubStr(#255,SG04.Cells[0,i]       ,1)) Then
      Begin
        B := j;
        Break;
      End;
    End;
    S := CB_Station.Text+#255+
         E_Time.Text+#255+
         KC_GetSubStr(#255,SG03.Cells[0,SG03.Row],1)+#255+
         KC_GetSubStr(#255,SG04.Cells[0,i],1)+#255+
         Judge(SG04,i)+#255+
         SG04.Cells[2,i];
    if (B = -1) Then SL03.Add(S);
    if (B <>-1) Then SL03.Strings[B] := S;
  End;
  SG02Ini;
  SG02Snd(SL03);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_V05.SG04DblClick(Sender: TObject);
begin
  if (KC_GetSubStr(#255,SG04.Cells[00,SG04.Row],3)='0') Then Exit;
  SG04.Cells[02,SG04.Row] := F.ChgJg(SG04.Cells[02,SG04.Row],['A+','B','NG','']);;
  SG04.Cells[01,SG04.Row] := SG04.Cells[02,SG04.Row];
end;

procedure TF_V05.SG03KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.SG03MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  E_Time.Text := SG02.Cells[0,SG02.Row];
  SG03Ini;
  SG03Snd(SL02);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.SG02KeyUp(Sender: TObject; var Key: Word;
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

procedure TF_V05.CB_StationChange(Sender: TObject);
begin
  SG02Ini;
  SG02Snd(SL03);
  SG03Ini;
  SG03Snd(SL02);
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.B_Dele1002Click(Sender: TObject);
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
      if (KC_GetSubStr(#255,S,1) =               CB_Station.Text   ) and
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
  SG04Ini;
  SG04Hdr;
  SG04Snd(SL03);
end;

procedure TF_V05.B_1001Click(Sender: TObject);
begin
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  E_007.Text := KC_GetDayDSP(KC_B2Day(E_S01.Text))+E_S02.Text+E_S03.Text;
end;

procedure TF_V05.SG00MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Kind = 0) Then E_S03.Text := GetS03;
end;

procedure TF_V05.SG00KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Kind = 0) Then E_S03.Text := GetS03;
end;

function  TF_V05.GetSpec(I1:Integer;S1,S2,S3,S4 : String) : String;
var
  S : String;
  Bool : Boolean;
  i : integer;
begin
  D.OpenF10(E_002.Text,S2);
  Result := '';
  Bool := false;
  While not D.F10.Eof do
  Begin
    if((D.F10.FieldByName('BEF10005').AsString = 'all') or
       (D.F10.FieldByName('BEF10005').AsString = S1)) Then
    Begin
      Bool := True;
      Break;
    End;
    D.F10.Next;
  End;
  if not Bool Then Exit;
  SL02.Assign(D.F10.FieldByName('BEF10901'));
  for i:=0 to SL02.Count-1 do
  Begin
    S := SL02.Strings[i];
    if (POS(S1,KC_GetSubStr(#255,S,1))=0) Then Continue;
    if (S3<>KC_GetSubStr(#255,S,2)) Then Continue;
    D.OpenF09(S1,S3,KC_GetSubStr(#255,S,3),S4);
    Result := D.F09.FieldByName('BEF09203').AsString+'~'+
              D.F09.FieldByName('BEF09204').AsString;
    case I1 of
      1 : Result := D.F09.FieldByName('BEF09204').AsString;
    End;
  End;
end;

procedure TF_V05.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  f1,f2 : Real;
  DD : TDateTime;
begin
  KC_CopyToTemp(F.WorkDir,'V05.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\V05.xls');
  f1 := KC_StrTofloat(D.F16.FieldByName('BEF16304').AsString);
  f2 := KC_StrTofloat(D.F19.FieldByName('BEF19303').AsString);
  DD := KC_B2Day(D.F19.FieldByName('BEF19103').AsString);
  W := V.Workbooks[1].WorkSheets['Report'];
  W.Cells[ 4, 3].Value := E_002.Text;
  W.Cells[ 6, 3].Value := KC_GetSubStr(#255,CB_003.Text,3);
  W.Cells[ 7, 3].Value := KC_GetSubStr(#255,Run,1)+'-'+KC_GetSubStr(#255,Run,2);
  W.Cells[ 4,12].Value := format('%0.0f',[f1*f2/1000]);
  W.Cells[ 6,10].Value := FormatDateTime('yyyy/mm/dd', DD);
  W.Cells[10, 5].Value := D.F19.FieldByName('BEF19303').AsString+'m';
  W.Cells[11, 5].Value := D.F16.FieldByName('BEF16304').AsString+'mm';
  W.Cells[12, 5].Value :=      GetSpec(0,
                                       '成型站',
                                       D.F16.FieldByName('BEF16004').AsString,
                                       'A01',
                                       'A027')+'um';
  W.Cells[13, 5].Value := '≦'+GetSpec(1,
                                       '褙膜站',
                                       D.F19.FieldByName('BEF19004').AsString,
                                        'C01',
                                       'C040')+'mm';
  W.Cells[15, 5].Value :=      GetSpec(0,
                                       '成型站',
                                       D.F16.FieldByName('BEF16004').AsString,
                                       'A01',
                                       'A030')+'%';
  W.Cells[18, 5].Value := D.F16.FieldByName('BEF16499').AsString;
  W.Cells[19, 5].Value := D.F19.FieldByName('BEF19499').AsString;
end;

end.


