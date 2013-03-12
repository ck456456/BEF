unit U_B06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB;

type
  TF_B06 = class(TForm)
    Panel2: TPanel;
    B_Close: TBitBtn;
    Panel1: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    SG01: TStringGrid;
    Panel5: TPanel;
    P_01: TPanel;
    SB_01: TSpeedButton;
    SB_02: TSpeedButton;
    SB_03: TSpeedButton;
    Splitter2: TSplitter;
    B_Save: TBitBtn;
    Panel9: TPanel;
    Label7: TLabel;
    CB_No0: TComboBox;
    Label8: TLabel;
    CB_No1: TEdit;
    Label9: TLabel;
    CB_No2: TEdit;
    B_01: TButton;
    SG02: TStringGrid;
    B_B03: TBitBtn;
    P_04: TPanel;
    Label1: TLabel;
    L_102: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    CB_005: TComboBox;
    E_101: TEdit;
    E_199: TEdit;
    P_02: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    E_201: TEdit;
    E_299: TEdit;
    E_202: TEdit;
    procedure FormShow(Sender: TObject);
    procedure CB_005Change(Sender: TObject);
    procedure CB_No0Change(Sender: TObject);
    procedure B_01Click(Sender: TObject);
    procedure B_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_01Click(Sender: TObject);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_B03Click(Sender: TObject);
  private
    { Private declarations }
    SL01 : TStringList;
    procedure Get102;
    procedure LoadNo0;
    function  GetMod(S1 : String) : String;
    procedure PNoLoad(CB :TComboBox);
    procedure OpenF05(S1 : String);
    procedure OpenF03(S1 : String);
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SG01Snd;
    procedure SG02Snd(TSL : TStringList);
    function  SG02Fnd(S1 : String) : boolean;
    function  ChkData : boolean;
    procedure SaveF18(i1 : integer);
    procedure SaveF03;
    procedure LoadSL01;
    procedure UpData01;
    procedure UpData02;
  public
    { Public declarations }
  end;

var
  F_B06: TF_B06;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

function  TF_B06.GetMod(S1 : String) : String;
begin
  Result := '0';
  if (S1 = '') Then Exit;
  D.OpenF03(S1);
  if not D.F03.Locate('BEF03001',S1, [loCaseInsensitive]) Then Exit;
  if (D.F03.FieldByName('BEF03000').ASSTRING = '1') and
     (D.F03.FieldByName('BEF03103').ASfloat  = 0.0) Then
  Begin
    Result := D.F03.FieldByName('BEF03102').ASSTRING;
    Exit;
  End;
  Result := D.F03.FieldByName('BEF03103').ASSTRING;
end;

procedure TF_B06.SG01Ini;
var
  i : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Line';
  SG01.Cells[1,0] := 'Start';
  SG01.Cells[2,0] := 'Hr';
  SG01.Cells[3,0] := '倒入量';

  i := 1;
  D.OpenF12('成型站');
  D.F12.First;
  While not D.F12.Eof do
  Begin
    SG01.Cells[0,i] := D.F12.FieldByName('BEF12002').ASSTRING;
    D.F12.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_B06.OpenF03(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF03 With (INDEX(BEFF03_000)) Where'+
            ' BEF03000 = '''+S1+''' Order by BEF03001';
  KC_T3Close(D.F03,D.SC);
  D.F03.CommandText := SQLStr;
  KC_T3OPEN(D.F03,D.SC);
  D.F03.First;
End;

procedure TF_B06.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[0,0] := 'UV No';
  SG02.Cells[1,0] := '已倒入量';
  SG02.Cells[2,0] := '新倒入量';
  SG02.Cells[3,0] := '剩餘量';
  KC_ColAutoSize(SG02);
end;

procedure TF_B06.SG01Snd;
var
  i : integer;
begin
  D.OpenF18('1');
  While not D.F18.Eof do
  Begin
    for i:=1 to SG01.RowCount do
    Begin
      if (SG01.Cells[0,i] = D.F18.FieldByName('BEF18004').ASSTRING) Then
      Begin
        SG01.Cells[0,i] := D.F18.FieldByName('BEF18004').ASSTRING;
        SG01.Cells[1,i] := D.F18.FieldByName('BEF18002').ASSTRING;
        SG01.Cells[2,i] := F.Hr(SG01.Cells[1,i]);
        SG01.Cells[3,i] := D.F18.FieldByName('BEF18102').ASSTRING;
      End;
    End;
    D.F18.Next;
  End;
  KC_ColAutoSize(SG01);
end;

procedure TF_B06.LoadNo0;
begin
  OpenF03('1');
  CB_No0.Clear;
  D.F03.First;
  While not D.F03.eof do
  Begin
    if (CB_005.Text <> D.F03.FieldByName('BEF03002').ASSTRING) Then
    Begin
      D.F03.Next;
      Continue;
    End;
    CB_No0.Items.Add(D.F03.FieldByName('BEF03001').ASSTRING);
    D.F03.Next;
  End;
  CB_No0.ItemIndex := -1;
end;

procedure TF_B06.PNoLoad(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_B06.OpenF05(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF05 With (INDEX(BEFF05_002)) Where'+
            ' BEF05002 = '''+S1+''' Order by BEF05001';
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := SQLStr;
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

procedure TF_B06.SG02Snd(TSL : TStringList);
var
  i  : integer;
  S1 : String;
begin
  KC_SGClear(1,SG02);
  for i:=0 to TSL.Count-1 do
  Begin
    S1 := TSL.Strings[i];
    SG02.Cells[0,i+1] := KC_GetSubStr(#255,S1,1);
    SG02.Cells[1,i+1] := KC_GetSubStr(#255,S1,2);
    SG02.Cells[2,i+1] := '0';
    SG02.Cells[3,i+1] := GetMod(KC_GetSubStr(#255,S1,1));
  End;
  Get102;
  KC_ColAutoSize(SG02);
end;

procedure TF_B06.UpData02;
begin
  CB_No0.Text := SG02.Cells[0,SG02.Row];
  CB_No1.Text := GetMod(CB_No0.Text);
  CB_No2.Text := CB_No1.Text;
end;

procedure TF_B06.UpData01;
begin
  E_101.Text    := '';
  L_102.Caption := '0';
  E_199.Text    := '';
 CB_005.Text    := '';
  SL01.Text     := '';
  if SB_01.Down Then Exit;
  if D.F18.Locate('BEF18002;BEF18004', VarArrayOf([SG01.Cells[1,SG01.Row],
                                                   SG01.Cells[0,SG01.Row]]), [loCaseInsensitive]) Then
  Begin
    E_101.Text    := D.F18.FieldByName('BEF18101').AsString;
    L_102.Caption := D.F18.FieldByName('BEF18102').AsString;
    E_199.Text    := D.F18.FieldByName('BEF18199').AsString;
   CB_005.Text    := D.F18.FieldByName('BEF18005').AsString;
    SL01.Text     := D.F18.FieldByName('BEF18901').AsString;
  End;
  CB_005Change(Self);
   SG02Snd(SL01);
   UpData02;
end;

procedure TF_B06.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  D.OpenF00;
  OpenF05(D.F00.FieldByName('BEF00202').ASString);
  PNoLoad(CB_005);
  SG01Ini;
  SG02Ini;
  SG01Snd;
  UpData01;
  SB_01Click(Sender);
end;

function  TF_B06.SG02Fnd(S1 : String) : boolean;
var
  i : Integer;
begin
  Result := False;
  for i:=1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] = '') Then Continue;
    if (SG02.Cells[0,i] <> S1) Then Continue;
    CB_No0.Text := SG02.Cells[0,i];
    CB_No1.Text := SG02.Cells[2,i];
    CB_No2.Text := SG02.Cells[3,i];
    Result := True;
  End;
end;

procedure TF_B06.CB_005Change(Sender: TObject);
begin
  LoadNo0;
  if SG02Fnd(CB_No0.Text) Then Exit;
  CB_No1.Text := GetMod(CB_No0.Text);
  CB_No2.Text := '0';
end;

procedure TF_B06.CB_No0Change(Sender: TObject);
begin
  if SG02Fnd(CB_No0.Text) Then Exit;
  CB_No1.Text := GetMod(CB_No0.Text);
  CB_No2.Text := '0';
end;

procedure TF_B06.Get102;
var
  i : integer;
  f : Real;
begin
  f := 0;
  for i := 1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i]='') Then Continue;
    f := f+KC_StrToFloat(SG02.Cells[1,i])+KC_StrToFloat(SG02.Cells[2,i]);
  End;
  L_102.Caption := FloatToStr(f);
end;

procedure TF_B06.B_01Click(Sender: TObject);
var
  i : integer;
  B : integer;
begin
  B := -1;
  for i := 1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] = CB_No0.Text) Then
    Begin
       SG02.Cells[0,i] := CB_No0.Text;
       SG02.Cells[2,i] := CB_No1.Text;
       SG02.Cells[3,i] := FloatToStr(KC_StrToFloat(GetMod(CB_No0.Text))-
                                     KC_StrToFloat(CB_No1.Text));
       CB_No2.Text := SG02.Cells[3,i];
       KC_ColAutoSize(SG02);
       Get102;
       Exit;
    End;
    if (B = -1) and (SG02.Cells[0,i]='') Then B := i;
  End;
  if (B = -1) Then
  Begin
    ShowMessage('Error !!');
    Exit;
  End;
  SG02.Cells[0,B] := CB_No0.Text;
  SG02.Cells[2,B] := CB_No1.Text;
  SG02.Cells[3,B] := FloatToStr(KC_StrToFloat(GetMod(CB_No0.Text))-
                                KC_StrToFloat(CB_No1.Text));
  CB_No2.Text := SG02.Cells[3,B];
  Get102;
  KC_ColAutoSize(SG02);
end;

procedure TF_B06.LoadSL01;
var
  i : integer;
  f : real;
Begin
  SL01.Clear;

  for i:=1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] = '') then Continue;
    f := KC_StrToFloat(SG02.Cells[1,i])+KC_StrToFloat(SG02.Cells[2,i]);
    SL01.Add(SG02.Cells[0,i]+#255+
             FloatToStr(f)  +#255+
             SG02.Cells[3,i]);
  End;
end;

procedure TF_B06.SaveF03;
var
  i : integer;
  SQL : String;
  S1 : String;
Begin
  for i := 1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[0,i] =  '')   then Continue;
    if (SG02.Cells[3,i] =  '0' ) then S1 := '2';
    if (SG02.Cells[3,i] <> '0' ) then S1 := '1';
    SQL := 'Update BEFF03 Set BEF03000 = '''+S1+
                        ''' , BEF03103 = '''+SG02.Cells[3,i]+
                    ''' Where BEF03001 = '''+SG02.Cells[0,i]+'''';
    KC_T2ExecSQL(SQL,D.FCmd);
  End;
end;

procedure TF_B06.SaveF18(i1 : integer);
var
  SQL : String;
Begin
  LoadSL01;
  case i1 of
    0 : Begin
          SQL := 'Update BEFF18 Set BEF18201 = '''+E_201.Text+
                                ''',BEF18202 = '''+FloatToStr(KC_StrToFloat(E_202.Text))+
                                ''',BEF18299 = '''+E_299.Text+
                                ''',BEF18003 = '''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+
                                ''',BEF18001 = '''+'2'+
                          ''' Where BEF18002 = '''+SG01.Cells[1,SG01.Row]+
                            ''' and BEF18004 = '''+SG01.Cells[0,SG01.Row]+'''';
           KC_T2ExecSQL(SQL,D.FCmd);
           SQL := 'INSERT INTO BEFF18 (BEF18001,BEF18002,BEF18004,BEF18005,BEF18101,BEF18102,BEF18199,BEF18901)'+
                             ' VALUES ('''+'1'+
                                   ''','''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+
                                   ''','''+SG01.Cells[0,SG01.Row]+
                                   ''','''+CB_005.Text+
                                   ''','''+E_101.Text+
                                   ''','''+L_102.Caption+
                                   ''','''+E_199.Text+
                                   ''','''+SL01.Text+
                                   ''')';
           KC_T2ExecSQL(SQL,D.FCmd);
           SaveF03;
        End;
    1 : Begin
          SQL := 'Update BEFF18 Set BEF18101 = '''+E_101.Text+
                                ''',BEF18102 = '''+L_102.Caption+
                                ''',BEF18199 = '''+E_199.Text+
                                ''',BEF18901 = '''+SL01.Text+
                          ''' Where BEF18002 = '''+SG01.Cells[1,SG01.Row]+
                            ''' and BEF18004 = '''+SG01.Cells[0,SG01.Row]+'''';
           KC_T2ExecSQL(SQL,D.FCmd);
           SaveF03;
        End;
    2 : Begin
          SQL := 'Update BEFF18 Set BEF18201 = '''+E_201.Text+
                                ''',BEF18202 = '''+FloatToStr(KC_StrToFloat(E_202.Text))+
                                ''',BEF18299 = '''+E_299.Text+
                                ''',BEF18003 = '''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+
                                ''',BEF18001 = '''+'2'+
                          ''' Where BEF18002 = '''+SG01.Cells[1,SG01.Row]+
                            ''' and BEF18004 = '''+SG01.Cells[0,SG01.Row]+'''';
           KC_T2ExecSQL(SQL,D.FCmd);
        End;
  End;
End;

function  TF_B06.ChkData : boolean;
begin
  Result := True;
  if (SB_01.Down) or (SB_01.Down) Then Result := (E_101.Text <> '');
  if (SB_03.Down)                 Then Result := (E_201.Text <>  '');
End;

procedure TF_B06.B_SaveClick(Sender: TObject);
begin
  if not ChkData Then
  Begin
    ShowMessage('Error ...');
    Exit;
  End;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  if (SB_01.Down) Then SaveF18(0);
  if (SB_02.Down) Then SaveF18(1);
  if (SB_03.Down) Then SaveF18(2);
  SB_02.Down := True;
  SG01Ini;
  SG01Snd;
  UpData01;
end;

procedure TF_B06.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
end;

procedure TF_B06.SB_01Click(Sender: TObject);
var
  i : Integer;
begin
  i := 0;
  if (SB_01.Down) Then SG02Ini;
  if (SB_01.Down) Then i := 0;
  if (SB_02.Down) Then i := 1;
  if (SB_03.Down) Then i := 2;
  CB_005.Enabled := i in [0];
  P_01.Enabled   := i in [0,1];
  P_02.Enabled   := i in [0,2];
  SG01Ini;
  SG01Snd;
  UpData01;
end;

procedure TF_B06.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData02;
end;

procedure TF_B06.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData02;
end;

procedure TF_B06.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData01;
end;

procedure TF_B06.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData01;
end;

procedure TF_B06.B_B03Click(Sender: TObject);
begin
  SB_02.Down := True;
  SG01Ini;
  SG01Snd;
  UpData01;
end;

end.


