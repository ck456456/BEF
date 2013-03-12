unit U_V08;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, ExtCtrls, ComCtrls, DB, Math;

type
  TF_V08 = class(TForm)
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
    Splitter2: TSplitter;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel6: TPanel;
    B_Save1001: TBitBtn;
    B_Cls: TBitBtn;
    TS0102: TTabSheet;
    Splitter4: TSplitter;
    Panel9: TPanel;
    B_Save1002: TBitBtn;
    B_Dele1002: TBitBtn;
    BitBtn1: TBitBtn;
    Panel10: TPanel;
    SG02: TStringGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    Label22: TLabel;
    Label4: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    E_Time: TEdit;
    CB_Station: TComboBox;
    CB_003: TComboBox;
    E_499: TEdit;
    CB401: TComboBox;
    CB402: TComboBox;
    Panel13: TPanel;
    Splitter5: TSplitter;
    Panel14: TPanel;
    SG03: TStringGrid;
    Panel15: TPanel;
    SG04: TStringGrid;
    P_001: TPanel;
    Panel8: TPanel;
    CB_Type: TComboBox;
    Panel7: TPanel;
    Label13: TLabel;
    E_201: TEdit;
    E_299: TEdit;
    Label14: TLabel;
    E_301: TEdit;
    Label16: TLabel;
    Label15: TLabel;
    E_399: TEdit;
    Label23: TLabel;
    E_007: TEdit;
    L_102: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    L_103: TLabel;
    Panel16: TPanel;
    Splitter3: TSplitter;
    SG05: TStringGrid;
    SG07: TStringGrid;
    Panel17: TPanel;
    Panel1: TPanel;
    B_Cut: TButton;
    CB_Cut: TComboBox;
    SG01: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB_TypeChange(Sender: TObject);
    procedure B_Save1001Click(Sender: TObject);
    procedure SG07KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG07MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG05MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG05KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG05DblClick(Sender: TObject);
    procedure B_CutClick(Sender: TObject);
  private
    { Private declarations }
    SL01 : TStringList;  // Base
    SL02 : TStringList;  // JudgeType
    SL03 : TStringList;  // Data
    SL04 : TStringList;  // Mail
    Function  ChkFld : Boolean;
    procedure IniSet;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG03Ini;
    procedure SG04Ini;
    procedure SG04Hdr;
    procedure SG05INI;
    procedure SG07INI;
    procedure SG01Snd;
    procedure SG03Snd(TSL :TStringList);
    procedure SG05Snd;
    procedure SG07Snd;
    procedure F10UpData;
    procedure F17UpData;
    function  GetRow(TSG : TStringGrid;iRow : integer) : integer;
    procedure OpenF17(S1,S2,S3 : STring);
    procedure OpenG19; overload;
    procedure OpenG19(S1 : String); overload;
    procedure OpenG19(S1,S2 : String); overload;
    Function  AppendSave : Boolean;
    Function  ModifySave : Boolean;
    Function  AllModSave : Boolean;
    function  GetSN(I1 : Integer) : Integer;
  public
    { Public declarations }
    Kind : Integer;      // 0:Append 1.Modify  2.View
    ERunning : String;       // 0.Hold 1.Running 2.Finish 3.Fail
    Run  : String;       // 0.Hold 1.Running 2.Finish 3.Fail
    Ret  : Boolean;
  end;

var
  F_V08: TF_V08;

implementation

uses U_KcPub, U_D, U_F, U_V09;

{$R *.dfm}

function  TF_V08.GetRow(TSG : TStringGrid;iRow : integer) : integer;
var
  i : integer;
begin
  if (TSG.Cells[04,iRow] = '') Then Exit;
  Result := 1;
  While (TSG.Cells[04,Result] <> '') do
    inc(Result);
End;

procedure TF_V08.SG05Snd;
var
  i,i1 : integer;
  f1,f2 : Real;
  SS1,SS2: String;
  CRow : integer;
begin
  i := 1;
  i1 := 1;
  KC_SGClear(1,SG05);
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SG07.Cells[0,SG07.Row] <> D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS1 := '';
    SS2 := '';
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
    Begin
      SS1 := D.F05.FieldByName('BEF05003').ASString;
      SS2 := D.F05.FieldByName('BEF05004').ASString;
    End;
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19501').ASString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19502').ASString);
    CRow := max(i,KC_StrToInt(D.G19.FieldByName('BEF19011').ASString));
    i := KC_StrToInt(D.G19.FieldByName('BEF19011').ASString);
    i := GetRow(SG05,i);
    SG05.Cells[00,i] := D.G19.FieldByName('BEF19011').ASString;      // BEF19011
    SG05.Cells[01,i] := SS1;
    SG05.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;      // BEF19002
    SG05.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;      // BEF19003
    SG05.Cells[04,i] := D.G19.FieldByName('BEF19001').ASString+#255+ // Run
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19500').ASString;      // Run
    SG05.Cells[05,i] := format('%0.0f',[f1*f2/1000]);
    SG05.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;      // 檢驗寬幅
    SG05.Cells[07,i] := SS2;
    SG05.Cells[08,i] := D.G19.FieldByName('BEF19501').ASString;      // BEF19303
    SG05.Cells[09,i] := D.G19.FieldByName('BEF19012').ASString;      // BEF19012
    SG05.Cells[10,i] := D.G19.FieldByName('BEF19004').ASString;      // BEF19004
    inc(i1);
    D.G19.Next;
  End;
  D.F05.Locate('BEF05001',VarArrayOf([D.F10.FieldByName('BEF10102').AsString]), [loCaseInsensitive]);
  CRow := max(2,CRow+1);
  CRow := max(CRow,i1+1);
  CRow := max(CRow,KC_StrToInt(D.F05.FieldByName('BEF05203').ASString));
  SG05.RowCount := CRow;
  for i:=1 to CRow-1 do
    if (SG05.Cells[04,i] = '') Then
      SG05.Cells[00,i] := KC_FillCharBefore(IntToStr(i),3,'0');
  KC_ColAutoSize(SG05);
end;

procedure TF_V08.SG07Snd;
var
  i : integer;
  SS: String;
begin
  KC_SGClear(1,SG07);
  i := 1;
  SS := 'zz';
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (SS=D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS:=D.G19.FieldByName('BEF19010').ASString;
    SG07.Cells[0,i] :=  SS;      // Running
    D.G19.Next;
    inc(i);
  End;
  SG07.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG07);
end;

procedure TF_V08.SG05INI;
begin
  KC_SGClear(0,SG05);
  SG05.Cells[00,0] := 'Running';  // BEF19101
  SG05.Cells[01,0] := '級別';     // BEF19002 目標料號 -> 級別
  SG05.Cells[02,0] := '規格';     // BEF19002
  SG05.Cells[03,0] := '料號';     // BEF19003
  SG05.Cells[04,0] := 'Run';      // BEF19001
  SG05.Cells[05,0] := 'm2';       // BEF19001
  SG05.Cells[06,0] := '剩餘寬幅'; // BEF16304
  SG05.Cells[07,0] := 'PET寬幅';  // BEF05004
  SG05.Cells[08,0] := 'm';        // BEF19303
  SG05.Cells[09,0] := '重量';     // BEF19012
  SG05.Cells[10,0] := 'Process';  // BEF19004
  KC_ColAutoSize(SG05);
end;

procedure TF_V08.SG07INI;
begin
  KC_SGClear(0,SG07);
  SG07.Cells[00,0] := 'No';       // BEF19011
  KC_ColAutoSize(SG07);
end;

procedure TF_V08.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';  // BEF19101
  SG01.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG01.Cells[02,0] := '規格';     // BEF19002
  SG01.Cells[03,0] := '料號';     // BEF19003
  SG01.Cells[04,0] := 'SN';       // BEF19500
  SG01.Cells[05,0] := '分條長度'; // BEF19501
  SG01.Cells[06,0] := '分條寬幅'; // BEF19502
  SG01.Cells[07,0] := '損耗長度'; // BEF19503
  SG01.Cells[08,0] := '損耗寬幅'; // BEF19504
  KC_ColAutoSize(SG01);
end;

procedure TF_V08.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Time';
  SG02.Cells[00,1] := '首檢';
  SG02.Cells[00,2] := '尾檢';
  KC_ColAutoSize(SG02);
end;

procedure TF_V08.SG03Ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Group';
  KC_ColAutoSize(SG03);
end;

procedure TF_V08.SG04Ini;
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

procedure TF_V08.SG04Hdr;
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

procedure TF_V08.SG01Snd;
var
  i   : integer;
  SS1 : String;
begin
  i:=1;
  KC_SGClear(1,SG01);
  OpenG19(E_007.Text);
  While not D.G19.Eof do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    SG01.Cells[00,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);//Running';;       // BEF19101
    SG01.Cells[01,i] := SS1;
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG01.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19500').ASString;
    SG01.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString;
    SG01.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    SG01.Cells[07,i] := D.G19.FieldByName('BEF19503').ASString;
    SG01.Cells[08,i] := D.G19.FieldByName('BEF19504').ASString;
    inc(i);
    D.G19.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_V08.SG03Snd(TSL :TStringList);
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

procedure TF_V08.F10UpData;
begin
  // D.OpenF10(KC_GetSubStr(#255,CB_003.Text,1),E_004.Text);
  D.OpenF10(E_002.Text,E_004.Text);
  SL02.Assign(D.F10.FieldByName('BEF10901'));
  SG03Snd(SL02);
  SG04Hdr;
end;

procedure TF_V08.OpenF17(S1,S2,S3 : String);
begin
  KC_T3Close(D.F17,D.SC);
  D.F17.CommandText := 'SELECT * FROM BEFF17 Where BEF17004 = '''+S1+
                                           ''' and BEF17005 = '''+S2+
                                           ''' and BEF17006 = '''+S3+'''';
  KC_T3OPEN(D.F17,D.SC);
  D.F17.First;
End;

procedure TF_V08.F17UpData;
begin
  D.OpenF11('9998');
  case Kind of
    3 :  OpenF17(KC_GetSubStr(#255,E_007.Text,1),
                 KC_GetSubStr(#255,E_007.Text,2),
                 KC_GetSubStr(#255,E_007.Text,3));
  else   D.OpenF17('分條站',
                   E_005.Text,
                   KC_GetSubStr('-',L_102.Caption,1)+KC_GetSubStr('-',L_102.Caption,2));
  End;
  D.OpenF15(D.F17.FieldByName('BEF17104').ASSTRING);
  D.OpenF11(D.F17.FieldByName('BEF17003').ASString);
  L_102.Caption := copy(D.F17.FieldByName('BEF17102').ASSTRING,1,8)+'-'+
                   copy(D.F17.FieldByName('BEF17102').ASSTRING,9,6);
  L_103.Caption := copy(D.F17.FieldByName('BEF17103').ASSTRING,1,8)+'-'+
                   copy(D.F17.FieldByName('BEF17103').ASSTRING,9,6);
  E_006.Text := D.F17.FieldByName('BEF17104').ASSTRING;
  E_201.Text := D.F17.FieldByName('BEF17201').ASSTRING;
  E_299.Text := D.F17.FieldByName('BEF17299').ASSTRING;
  E_301.Text := D.F17.FieldByName('BEF17301').ASSTRING;
  E_399.Text := D.F17.FieldByName('BEF17399').ASSTRING;
  E_002.Text := D.F15.FieldByName('BEF15002').ASSTRING;
  E_004.Text := D.F15.FieldByName('BEF15004').ASSTRING;
  E_007.Text := D.F17.FieldByName('BEF17004').ASSTRING+#255+
                D.F17.FieldByName('BEF17005').ASSTRING+#255+
                D.F17.FieldByName('BEF17006').ASSTRING;
end;

procedure TF_V08.OpenG19(S1,S2 : String);
begin
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+S1+
                                           ''' and BEF19007 = '''+S2+
                                      ''' Order By BEF19500';
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_V08.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+KC_GetSubStr(#255,S1,1)+
                                           ''' and BEF19007 = '''+KC_GetSubStr(#255,S1,2)+
                                           ''' and BEF19201 = '''+KC_GetSubStr(#255,S1,3)+
                                      ''' Order By BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V08.OpenG19;
var
  SQL : String;
begin
  case CB_Type.ItemIndex of
    0 : SQL := 'SELECT * FROM BEFG19 Where BEF19101 = ''2'+
                                   ''' and BEF19002 = '''+E_002.Text+
                              ''' Order By BEF19010,BEF19011,BEF19001,BEF19007';
    1 : SQL := 'SELECT * FROM BEFG19 Where BEF19101 = ''3'+
                                   ''' and BEF19002 = '''+E_002.Text+
                              ''' Order By BEF19010,BEF19011,BEF19001,BEF19007';
  End;
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := SQL;
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V08.IniSet;
begin
  D.OpenF00;
  CB401.Items.Assign(D.F00.FieldByName('BEF00303'));
  CB402.Items.Assign(D.F00.FieldByName('BEF00303'));
  case Kind of
    0 : Begin
          F10UpData;
          OpenG19;
          SG07Snd;
          SG05Snd;
          SG01Snd;
          PC01.Pages[1].TabVisible := False;
          Panel3.Enabled := False;
        End;
    1 : Begin
          F17UpData;
          F10UpData;
          OpenG19;
          SG07Snd;
          SG05Snd;
          SG01Snd;
          PC01.Pages[1].TabVisible := False;
          E_007.Text := SG05.Cells[04,SG05.Row];
          Panel3.Enabled := True;
        End;
    3 : Begin
          F17UpData;
          F10UpData;
          OpenG19;
          SG07Snd;
          SG05Snd;
          SG01Snd;
          SG05.Enabled := False;
          PC01.Pages[1].TabVisible := False;
        End;
  End;
end;

procedure TF_V08.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  SL03 := TStringList.Create;
  SL04 := TStringList.Create;
  SG01INI;
  SG02Ini;
  SG03Ini;
  SG04Ini;
  SG05INI;
  SG07INI;
  IniSet;
end;

procedure TF_V08.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  SL03.Free;
  SL04.Free;
end;

procedure TF_V08.CB_TypeChange(Sender: TObject);
begin
  OpenG19;
  SG07Snd;
  SG05Snd;
end;

Function  TF_V08.ChkFld : Boolean;
begin
  Result := True;
  case Kind of
    0 : Begin
          if (Trim(E_201.Text) = '')     Then Result := False;
          if Result Then L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
        End;
    1 : Begin
          if (Trim(E_301.Text) = '')     Then Result := False;
        End;
    3 : Begin
          if (Trim(E_201.Text) = '')     Then Result := False;
          if (Trim(E_301.Text) = '')     Then Result := False;
        End;
  End;
  if not Result Then ShowMessage('keyin Error ....');
end;

Function TF_V08.AppendSave : Boolean;
var
  iBool : integer;
  S1 : String;
begin
  Result := True;
  if not ChkFld Then
  Begin
    Result := False;
    Exit;
  End;
  S1 := E_005.Text;
  D.F17.Append;
  D.F17.FieldByName('BEF17001').ASSTRING := '分條站';
  D.F17.FieldByName('BEF17002').ASSTRING := S1;
  D.F17.FieldByName('BEF17003').ASSTRING := '9998';
  D.F17.FieldByName('BEF17101').ASSTRING := ERunning;
  D.F17.FieldByName('BEF17102').ASSTRING := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime); //    Begin  DateTime
  D.F17.FieldByName('BEF17104').ASSTRING := E_006.TEXT; // Working no
  D.F17.FieldByName('BEF17201').ASSTRING := E_201.TEXT;    // OPID
  D.F17.FieldByName('BEF17299').ASSTRING := E_299.TEXT;    // Start Note
  iBool := D.F17.ApplyUpdates(-1);
  if (iBool<>0) Then
  Begin
    Result := False;
    ShowMessage('Save Error!!('+IntToStr(iBool)+')');
  End;
end;

Function  TF_V08.AllModSave : Boolean;
var
  iBool : integer;
begin
  Result := True;
  if not ChkFld Then
  Begin
    Result := False;
    Exit;
  End;
  D.F17.Edit;
  D.F17.FieldByName('BEF17201').ASSTRING := E_201.TEXT;    // OPID
  D.F17.FieldByName('BEF17299').ASSTRING := E_299.TEXT;    // Start Note
  D.F17.FieldByName('BEF17301').ASSTRING := E_301.TEXT;    // OPID
  D.F17.FieldByName('BEF17399').ASSTRING := E_399.TEXT;    // Start Note
  iBool := D.F17.ApplyUpdates(-1);
  if (iBool<>0) Then
  Begin
    Result := False;
    ShowMessage('Save Error!!('+IntToStr(iBool)+')');
    Exit;
  End;
end;

Function  TF_V08.ModifySave : Boolean;
var
  iBool : integer;
  i : integer;
  SQL : STring;
begin
  Result := True;
  if not ChkFld Then
  Begin
    Result := False;
    Exit;
  End;
  D.F17.Edit;
  D.F17.FieldByName('BEF17101').ASSTRING := ERunning;
  D.F17.FieldByName('BEF17103').ASSTRING := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime); //    Begin  DateTime
  D.F17.FieldByName('BEF17201').ASSTRING := E_201.TEXT; // OPID
  D.F17.FieldByName('BEF17299').ASSTRING := E_299.TEXT; // Start Note
  D.F17.FieldByName('BEF17301').ASSTRING := E_301.TEXT; // OPID
  D.F17.FieldByName('BEF17399').ASSTRING := E_399.TEXT; // Start Note
  D.F17.FieldByName('BEF17004').ASSTRING := KC_GetSubStr(#255,E_007.TEXT,1);
  D.F17.FieldByName('BEF17005').ASSTRING := KC_GetSubStr(#255,E_007.TEXT,2);
  D.F17.FieldByName('BEF17006').ASSTRING := KC_GetSubStr(#255,E_007.TEXT,3);
  iBool := D.F17.ApplyUpdates(-1);
  if (iBool<>0) Then
  Begin
    Result := False;
    ShowMessage('Save Error!!('+IntToStr(iBool)+')');
    Exit;
  End;

  D.OpenF19(KC_GetSubStr(#255,E_007.TEXT,1),
            KC_GetSubStr(#255,E_007.TEXT,2));
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[00,i] = '') Then Continue;
    SQL := 'INSERT INTO BEFG19 (BEF19001,'+  // Run No.
                               'BEF19002,'+  // 目標料號
                               'BEF19003,'+  // 判級料號
                               'BEF19004,'+  // Process No
                               'BEF19006,'+  // 分條單號
                               'BEF19007,'+  // Run SN
                               'BEF19008,'+  // 出貨單號
                               'BEF19010,'+  // 棧板編號
                               'BEF19011,'+  // SN 位置(棧板)
                               'BEF19012,'+  // 重量
                               'BEF19101,'+  // 0.Hold 1.未褙膜 2.已褙膜 3.庫房 4.出貨
                               'BEF19201,'+  // 分條SN  <- 來源
                               'BEF19500,'+  // 分條SN
                               'BEF19501,'+  // 分條長度
                               'BEF19502,'+  // 分條寬幅
                               'BEF19503,'+  // 損耗長度
                               'BEF19504)'+  // 損耗寬幅
                      'VALUES ('''+D.F19.FieldByName('BEF19001').ASSTRING+''','+   // Run No.
                              ''''+D.F19.FieldByName('BEF19002').ASSTRING+''','+   // 目標料號
                              ''''+D.F19.FieldByName('BEF19003').ASSTRING+''','+   // 判級料號
                              ''''+D.F19.FieldByName('BEF19004').ASSTRING+''','+   // Process No
                              ''''+E_006.Text+''','+   // 分條單號
                              ''''+D.F19.FieldByName('BEF19007').ASSTRING+''','+   // Run SN
                              ''''','+   // 出貨單號
                              ''''','+   // 棧板編號
                              ''''','+   // SN 位置(棧板)
                              ''''','+   // 重量
                              ''''+F.SetRunning02(Kind,D.F19.FieldByName('BEF19101').AsString,SG01.Cells[05,i],SG01.Cells[06,i])+''','+  // 0.Hold 1.未褙膜 2.已褙膜 3.庫房未確認 4.出貨 5.已分條 6.被分條 7.自動報廢 8.手動報廢 9.庫房已確認
                              ''''+KC_GetSubStr(#255,E_007.Text,3)+''','+   // 分條SN  <- 來源
                              ''''+SG01.Cells[04,i]+''','+   // 分條SN
                              ''''+SG01.Cells[05,i]+''','+   // 分條長度
                              ''''+SG01.Cells[06,i]+''','+   // 分條寬幅
                              ''''+SG01.Cells[07,i]+''','+   // 損耗長度
                              ''''+SG01.Cells[08,i]+''')';   // 損耗寬幅
    KC_T3ExecSQL(SQL,D.SC);
  End;
  SQL := 'UpDate BEFG19 Set BEF19101 = ''6'' Where BEF19001 = '''+KC_GetSubStr(#255,E_007.Text,1)+
                                           ''' and BEF19007 = '''+KC_GetSubStr(#255,E_007.Text,2)+
                                           ''' and BEF19500 = '''+KC_GetSubStr(#255,E_007.Text,3)+'''';
  KC_T3ExecSQL(SQL,D.SC);
  SQL := 'UpDate BEFF19 Set BEF19101 = ''6'' Where BEF19001 = '''+KC_GetSubStr(#255,E_007.Text,1)+
                                           ''' and BEF19007 = '''+KC_GetSubStr(#255,E_007.Text,2)+'''';
  KC_T3ExecSQL(SQL,D.SC);
end;

procedure TF_V08.B_Save1001Click(Sender: TObject);
begin
   case Kind of // 0:Append 1.Modify  2.View
     0 : if not AppendSave then Exit; // Append
     1 : if not ModifySave then Exit; // Modify
     3 : if not AllModSave then Exit; // Modify
   End;
   Ret := True;
   Close;
end;

procedure TF_V08.SG07KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG05Snd;
end;

procedure TF_V08.SG07MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG05Snd;
End;

procedure TF_V08.SG05MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Kind<>1) Then Exit;
  if (E_007.Text = SG05.Cells[04,SG05.Row]) Then Exit;
  E_007.Text := SG05.Cells[04,SG05.Row];
  SG01Ini;
end;

procedure TF_V08.SG05KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Kind<>1) Then Exit;
  if (E_007.Text = SG05.Cells[04,SG05.Row]) Then Exit;
  E_007.Text := SG05.Cells[04,SG05.Row];
  SG01Ini;
end;

procedure TF_V08.SG05DblClick(Sender: TObject);
begin
  F_V09 := TF_V09.Create(Application);
  F_V09.L_Run.Caption := E_007.Text;
  F_V09.L_Working.Caption := E_006.Text;
  F_V09.ShowModal;
  F_V09.Free;
end;

function  TF_V08.GetSN(I1 : Integer) : Integer;
begin
  inc(I1);
  D.FP1.First;
  While not D.FP1.Eof do
  Begin
    if (I1 > D.G19.FieldByName('BEF19500').ASInteger) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    if (I1 < D.G19.FieldByName('BEF19500').ASInteger) Then
    Begin
      Break;
    End;
    inc(I1);
    D.FP1.Next;
  End;
  Result := I1;
end;

procedure TF_V08.B_CutClick(Sender: TObject);
var
  f1,f2 : Real;
  i,SN : integer;
  SS1 : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  KC_SGClear(1,SG01);
  D.OpenG19(KC_GetSubStr(#255,E_007.Text,1),
            KC_GetSubStr(#255,E_007.Text,2),
            KC_GetSubStr(#255,E_007.Text,3));
  OpenG19(KC_GetSubStr(#255,E_007.Text,1),
          KC_GetSubStr(#255,E_007.Text,2));
  f1 := D.G19.FieldByName('BEF19502').ASfloat;
  f2 := D.G19.FieldByName('BEF19501').ASfloat;
  SN := 0;
  for i:=1 to CB_Cut.ItemIndex+1 do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
    Begin
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    End;
    SN:=GetSN(SN);
    SG01.Cells[00,i] := F.Station('5');
    SG01.Cells[01,i] := SS1;
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG01.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG01.Cells[04,i] := KC_IntFillChar(SN,2,'0');
    SG01.Cells[05,i] := format('%0.2f',[f2]);
    SG01.Cells[06,i] := format('%0.2f',[f1/(CB_Cut.ItemIndex+1)]);
    SG01.Cells[07,i] := '0';
    SG01.Cells[08,i] := '0';
  End;
  SG01.RowCount := CB_Cut.ItemIndex+2;
  KC_ColAutoSize(SG01);
end;

end.


