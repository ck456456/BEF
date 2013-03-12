unit U_V04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TF_V04 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    B_Cls: TBitBtn;
    B_Save: TBitBtn;
    P_00: TPanel;
    L_001: TLabel;
    L_002: TLabel;
    L_003: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    L_102: TLabel;
    L_103: TLabel;
    L_101: TLabel;
    L_202: TLabel;
    L_Tme: TLabel;
    P_01: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    L_104: TLabel;
    E_201: TEdit;
    E_299: TEdit;
    CB_104: TComboBox;
    P_02: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    E_399: TEdit;
    E_301: TEdit;
    Panel3: TPanel;
    Label8: TLabel;
    CB401: TComboBox;
    L_UPPNo: TLabel;
    L_DNPno: TLabel;
    CB402: TComboBox;
    Label11: TLabel;
    E_403: TEdit;
    E_404: TEdit;
    procedure FormShow(Sender: TObject);
    procedure B_SaveClick(Sender: TObject);
    procedure CB401Change(Sender: TObject);
  private
    { Private declarations }
    procedure OpenF15;
    procedure Load104;
    procedure SetEnab;
    procedure Updata;
    procedure LoadUpP(TCB : TComboBox);
    procedure LoadDnP(TCB : TComboBox);
    Function  AppendSave : Boolean;
    Function  ModifySave : Boolean;
    Function  AllModSave : Boolean;
    Function  ChkFld : Boolean;
  public
    { Public declarations }
    Kind : Integer;  // 0:Append 1.Modify  2.View 3. Save
    ERunning : String;
    Ret : Boolean;
  end;

var
  F_V04: TF_V04;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V04.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15101 = ''1'' Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_V04.Load104;
begin
  OpenF15;
  CB_104.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    if(D.F15.FieldByName('BEF15005').ASString <> L_002.Caption) Then
    Begin
      D.F15.Next;
      Continue;
    End;
    CB_104.Items.Add(D.F15.FieldByName('BEF15001').ASString);
    D.F15.Next;
  End;
end;

procedure TF_V04.LoadUpP(TCB : TComboBox);
begin
  D.ORunningF13('1');
  TCB.Clear;
  While not D.F13.Eof do
  Begin
    TCB.Items.Add(D.F13.FieldByName('BEF13001').AsString);
    D.F13.Next;
  End;
end;

procedure TF_V04.LoadDnP(TCB : TComboBox);
begin
  D.ORunningF14('1');
  TCB.Clear;
  While not D.F14.Eof do
  Begin
    TCB.Items.Add(D.F14.FieldByName('BEF14001').AsString);
    D.F14.Next;
  End;
end;

procedure TF_V04.SetEnab;
var
  TCr,FCr  : TColor;
begin
  TCr := clBlack;
  FCr := clGray;
  P_01  .Enabled := (Kind in [0,3]); P_01.Font.Color := iif(P_01.Enabled ,TCr,FCr);
  P_02  .Enabled := (Kind in [1,3]); P_02.Font.Color := iif(P_02.Enabled ,TCr,FCr);
  B_Save.Enabled := (Kind in [0,1,3]);
end;

procedure TF_V04.Updata;
begin
  D.OpenF11(KC_GetSubStr(#255,L_003.Caption,1));
   L_104.Visible := (D.F11.FieldByName('BEF11106').ASSTRING = 'T');
  CB_104.Visible := (D.F11.FieldByName('BEF11106').ASSTRING = 'T');
  Panel3.Visible :=((D.F11.FieldByName('BEF11105').ASSTRING = 'T') and (Kind in [1,3]));
  if (Kind = 0) Then Exit;
  if Panel3.Visible Then
  Begin
    LoadUpP(CB401);
    LoadDnP(CB402);
  End;
  D.OpenF17(L_001.Caption,
            L_002.Caption,
            KC_GetSubStr('-',L_102.Caption,1)+KC_GetSubStr('-',L_102.Caption,2));

  D.OpenF11(D.F17.FieldByName('BEF17003').ASString);
  L_001.Caption := D.F17.FieldByName('BEF17001').ASSTRING;
  L_002.Caption := D.F17.FieldByName('BEF17002').ASSTRING;
  L_003.Caption := D.F17.FieldByName('BEF17003').ASSTRING+#255+D.F11.FieldByName('BEF11002').ASString;
  L_101.Caption := F.Running00(D.F17.FieldByName('BEF17101').ASSTRING);
  L_102.Caption := copy(D.F17.FieldByName('BEF17102').ASSTRING,1,8)+'-'+
                   copy(D.F17.FieldByName('BEF17102').ASSTRING,9,6);
  L_103.Caption := copy(D.F17.FieldByName('BEF17103').ASSTRING,1,8)+'-'+
                   copy(D.F17.FieldByName('BEF17103').ASSTRING,9,6);
 CB_104.Text := D.F17.FieldByName('BEF17104').ASSTRING;
  E_201.Text := D.F17.FieldByName('BEF17201').ASSTRING;
  E_299.Text := D.F17.FieldByName('BEF17299').ASSTRING;
  E_301.Text := D.F17.FieldByName('BEF17301').ASSTRING;
  E_399.Text := D.F17.FieldByName('BEF17399').ASSTRING;
  CB401.Text := D.F17.FieldByName('BEF17401').ASSTRING;
  CB402.Text := D.F17.FieldByName('BEF17402').ASSTRING;
  E_403.Text := D.F17.FieldByName('BEF17403').ASSTRING;
  E_404.Text := D.F17.FieldByName('BEF17404').ASSTRING;

  L_104.Visible := (D.F11.FieldByName('BEF11106').ASSTRING = 'T');
 CB_104.Visible := (D.F11.FieldByName('BEF11106').ASSTRING = 'T');
 Panel3.Visible :=((D.F11.FieldByName('BEF11105').ASSTRING = 'T') and (Kind in [1,3]));
 CB401Change(Self);
end;

procedure TF_V04.FormShow(Sender: TObject);
begin
  Ret := False;
  Load104;
  SetEnab;
  Updata;
end;

Function  TF_V04.ChkFld : Boolean;
begin
  Result := True;
  case Kind of
    0 : Begin
          if (Trim(E_201.Text) = '')     Then Result := False;
          if (CB_104.Visible) and (Trim(CB_104.Text) = '') Then Result := False;
          if Result Then L_102.Caption := FormatDateTime('yyyymmdd-hhnnss', F.IdTime.DateTime);
        End;
    1 : Begin
          if (Trim(E_301.Text) = '')     Then Result := False;
          if (CB_104.Visible) and (Trim(CB_104.Text) = '') Then Result := False;
        End;
    3 : Begin
          if (Trim(E_201.Text) = '')     Then Result := False;
          if (Trim(E_301.Text) = '')     Then Result := False;
          if (CB_104.Visible) and (Trim(CB_104.Text) = '') Then Result := False;
        End;
  End;
  if not Result Then ShowMessage('keyin Error ....');
end;

Function TF_V04.AppendSave : Boolean;
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
  S1 := L_002.Caption;
  D.F17.Append;
  D.F17.FieldByName('BEF17001').ASSTRING := L_001.Caption;
  D.F17.FieldByName('BEF17002').ASSTRING := S1;
  D.F17.FieldByName('BEF17003').ASSTRING := KC_GetSubStr(#255,L_003.Caption,1);
  D.F17.FieldByName('BEF17101').ASSTRING := ERunning;
  D.F17.FieldByName('BEF17102').ASSTRING := FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime); //    Begin  DateTime
  D.F17.FieldByName('BEF17104').ASSTRING := CB_104.TEXT; // Working no
  D.F17.FieldByName('BEF17201').ASSTRING := E_201.TEXT;  // OPID
  D.F17.FieldByName('BEF17299').ASSTRING := E_299.TEXT;  // Start Note
  iBool := D.F17.ApplyUpdates(-1);
  if (iBool<>0) Then
  Begin
    Result := False;
    ShowMessage('Save Error!!('+IntToStr(iBool)+')');
  End;
end;

Function  TF_V04.ModifySave : Boolean;
var
  S1 : String;
  iBool : integer;
begin
  Result := True;
  if not ChkFld Then
  Begin
    Result := False;
    Exit;
  End;
  S1 := 'UpDate BEFF17 Set BEF17101='''+ERunning+
                       ''',BEF17103='''+FormatDateTime('yyyymmddhhnnss', F.IdTime.DateTime)+
                       ''',BEF17201='''+E_201.TEXT+
                       ''',BEF17299='''+E_299.TEXT+
                       ''',BEF17301='''+E_301.TEXT+
                       ''',BEF17399='''+E_399.TEXT+
                       ''',BEF17401='''+CB401.TEXT+
                       ''',BEF17402='''+CB402.TEXT+
                       ''',BEF17403='''+E_403.TEXT+
                       ''',BEF17404='''+E_404.TEXT+
                 ''' Where BEF17001 = '''+L_001.Caption+
                   ''' and BEF17002 = '''+L_002.Caption+
                   ''' and BEF17102 = '''+KC_GetSubStr('-',L_102.Caption,1)+KC_GetSubStr('-',L_102.Caption,2)+'''';
  KC_T3ExecSQL(S1,D.SC);
end;

Function  TF_V04.AllModSave : Boolean;
var
  S1 : String;
  iBool : integer;
begin
  Result := True;
  if not ChkFld Then
  Begin
    Result := False;
    Exit;
  End;
  S1 := 'UpDate BEFF17 Set BEF17201='''+E_201.TEXT+
                       ''',BEF17299='''+E_299.TEXT+
                       ''',BEF17301='''+E_301.TEXT+
                       ''',BEF17399='''+E_399.TEXT+
                       ''',BEF17104='''+CB_104.TEXT+
                       ''',BEF17401='''+CB401.TEXT+
                       ''',BEF17402='''+CB402.TEXT+
                       ''',BEF17403='''+E_403.TEXT+
                       ''',BEF17404='''+E_404.TEXT+
                       ''' Where BEF17001 = '''+L_001.Caption+
                         ''' and BEF17002 = '''+L_002.Caption+
                         ''' and BEF17102 = '''+KC_GetSubStr('-',L_102.Caption,1)+KC_GetSubStr('-',L_102.Caption,2)+'''';
  KC_T3ExecSQL(S1,D.SC);
end;

procedure TF_V04.B_SaveClick(Sender: TObject);
var
  P1,P2 : array[0..1] of String;
begin
  D.OpenF17(L_001.Caption,
            L_002.Caption,
            KC_GetSubStr('-',L_102.Caption,1)+KC_GetSubStr('-',L_102.Caption,2));
  P1[0] := CB401.Text; P2[0] := D.F17.FieldByName('BEF17401').AsString;
  P1[1] := CB402.Text; P2[1] := D.F17.FieldByName('BEF17402').AsString;
  case Kind of // 0:Append 1.Modify  2.View
    0 : if not AppendSave then Exit; // Append
    1 : if not ModifySave then Exit; // Modify
    3 : if not AllModSave then Exit; // Modify
  End;
  F.SaveF13(P1[0]);F.SaveF13(P2[0]);
  F.SaveF14(P1[1]);F.SaveF14(P2[1]);
  Ret := True;
  Close;
end;

procedure TF_V04.CB401Change(Sender: TObject);
begin
  D.OpenF13(CB401.Text);
  D.OpenF05(D.F13.FieldByName('BEF13002').AsString);
  L_UPPNo.Caption := D.F05.FieldByName('BEF05001').AsString+' : '+
                     D.F05.FieldByName('BEF05099').AsString;
  D.OpenF14(CB402.Text);
  D.OpenF05(D.F14.FieldByName('BEF14002').AsString);
  L_DNPNo.Caption := D.F05.FieldByName('BEF05001').AsString+' : '+
                     D.F05.FieldByName('BEF05099').AsString;
end;

end.

