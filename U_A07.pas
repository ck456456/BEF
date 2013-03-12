unit U_A07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, ComCtrls;

type
  TF_A07 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel2: TPanel;
    SB_Inquire: TSpeedButton;
    SB_Modify: TSpeedButton;
    SB_Append: TSpeedButton;
    B_Delete: TBitBtn;
    B_Save: TBitBtn;
    B_Close: TBitBtn;
    Panel1: TPanel;
    Panel7: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    SG01: TStringGrid;
    Panel4: TPanel;
    SG02: TStringGrid;
    Splitter2: TSplitter;
    Panel5: TPanel;
    Panel8: TPanel;
    Splitter3: TSplitter;
    Panel9: TPanel;
    Splitter4: TSplitter;
    Panel10: TPanel;
    Label2: TLabel;
    E_002: TEdit;
    Label5: TLabel;
    E_101: TEdit;
    SG03: TStringGrid;
    SG04: TStringGrid;
    Label8: TLabel;
    E_099: TEdit;
    Splitter5: TSplitter;
    Panel11: TPanel;
    SG05: TStringGrid;
    Label9: TLabel;
    E_105: TEdit;
    CB_108: TCheckBox;
    CB_004: TCheckBox;
    PC01: TPageControl;
    TS02: TTabSheet;
    Label12: TLabel;
    CB_106: TComboBox;
    L_106: TLabel;
    L_107: TLabel;
    CB_107: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    E_111: TEdit;
    Label16: TLabel;
    E_112: TEdit;
    Label17: TLabel;
    CB_005: TComboBox;
    Label7: TLabel;
    Label10: TLabel;
    Label18: TLabel;
    CB_201: TComboBox;
    Label19: TLabel;
    E_114: TEdit;
    TS01: TTabSheet;
    Label3: TLabel;
    L_102: TLabel;
    L_104: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    L_103: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    CB_102: TComboBox;
    CB_104: TComboBox;
    CB_103: TComboBox;
    E_109: TEdit;
    E_110: TEdit;
    E_113: TEdit;
    E_115: TEdit;
    TS03: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    CB_211: TComboBox;
    CB_221: TComboBox;
    CB_231: TComboBox;
    CB_241: TComboBox;
    E_212: TEdit;
    E_222: TEdit;
    E_232: TEdit;
    E_242: TEdit;
    L_211: TLabel;
    L_221: TLabel;
    L_231: TLabel;
    L_241: TLabel;
    Label26: TLabel;
    E_252: TEdit;
    CB_251: TComboBox;
    L_251: TLabel;
    Label28: TLabel;
    E_262: TEdit;
    CB_261: TComboBox;
    L_261: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_InquireClick(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG04DblClick(Sender: TObject);
    procedure SG05DblClick(Sender: TObject);
    procedure SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG03DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CB_003Change(Sender: TObject);
    procedure CB_102Change(Sender: TObject);
    procedure CB_005Change(Sender: TObject);
  private
    { Private declarations }
    SL01 : TStringList;
    Kind  : Byte;
    SG04Row : Integer;
    procedure CB201Ld;
    function  GetF05(S1 : String) : String;
    procedure C_Kind(CC_Kind : Byte);
    procedure PNoLoad(S1,S2 : String;CB :TComboBox);
    procedure OpenF10;
    procedure OpenF09(S1,S2 : String);
    procedure SG01ini;
    procedure SG02ini;
    procedure SG03ini;
    procedure SG04ini;
    procedure SG05ini;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd;
    procedure SG04Snd(S1 : String);
    procedure SG05Snd(S1,S2 : String);
    procedure UpData;
    procedure F_Del;
    procedure F_Save;
  public
    { Public declarations }
  end;

var
  F_A07: TF_A07;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_A07.PNoLoad(S1,S2 : String;CB :TComboBox);
begin
  CB.Items.Clear;
  CB.Items.Add(S2);
  D.F05.First;
  While not D.F05.Eof do
  Begin
    if (D.F05.FieldByName('BEF05002').AsString <> S1) Then
    Begin
      D.F05.Next;
      Continue;
    End;
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
  CB.ItemIndex := iif(CB.Items.Count=0,-1,0);
End;

procedure TF_A07.SG01ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := '目標料號';
  SG01.Cells[1,0] := 'Count';
  KC_ColAutoSize(SG01);
end;

procedure TF_A07.SG02ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[0,0] := 'Process No';
  SG02.Cells[1,0] := 'Station';
  KC_ColAutoSize(SG02);
end;

procedure TF_A07.SG03ini;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[0,0] := 'Station'  ;
  SG03.Cells[0,1] := '成型站-前';
  SG03.Cells[0,2] := '成型站-中';
  SG03.Cells[0,3] := '成型站-後';
  SG03.Cells[0,4] := '褙膜站'   ;
  SG03.Cells[1,0] := 'Count'    ;
  KC_ColAutoSize(SG03);
end;

procedure TF_A07.SG04ini;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[0,0] := 'T/F';
  SG04.Cells[1,0] := 'Test Group';
  KC_ColAutoSize(SG04);
end;

procedure TF_A07.SG05ini;
begin
  KC_SGClear(0,SG05);
  SG05.Cells[0,0] := 'T/F';
  SG05.Cells[1,0] := 'Spec No';
  KC_ColAutoSize(SG05);
end;

procedure TF_A07.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  // D.F10.CommandText := 'SELECT BEF10001,Count(*) as Cnt FROM BEFF10 '+
  //                                               'With (INDEX(BEFF10_003)) '+
  //                                                     'Where BEF10003 = '''+S1+
  //                                               ''' Group by BEF10001 '+
  //                                                  'Order by BEF10001';
  D.F10.CommandText := 'SELECT BEF10003,Count(*) as Cnt FROM BEFF10 '+
                                                'With (INDEX(BEFF10_003)) '+
                                                   'Group by BEF10003 '+
                                                   'Order by BEF10003';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
End;

procedure TF_A07.SG01Snd;
var
  i : integer;
begin
  OpenF10;
  i := 1;
  KC_SGClear(1,SG01);
  D.F01.First;
  While not D.F01.Eof do
  Begin
    SG01.Cells[0,i] := D.F01.FieldByName('BEF01001').AsString;
    SG01.Cells[1,i] := '0';
    if D.F10.Locate('BEF10003',VarArrayOf([SG01.Cells[0,i]]),[loCaseInsensitive]) Then
      SG01.Cells[1,i] := D.F10.FieldByName('Cnt').ASSTRING;
    inc(i);
    D.F01.Next;
  End;
  (*
  D.F05.First;
  While not D.F05.eof do
  Begin
    SG01.Cells[0,i] := D.F05.FieldByName('BEF05001').ASSTRING;
    SG01.Cells[1,i] := '0';
    if D.F10.Locate('BEF10001',VarArrayOf([SG01.Cells[0,i]]),[loCaseInsensitive]) Then
      SG01.Cells[1,i] := D.F10.FieldByName('Cnt').ASSTRING;
    inc(i);
    D.F05.Next;
  End;
  *)
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_A07.CB201Ld;
var
  i : Integer;
begin
  CB_201.Clear;
  CB_201.Items.Add('all');
  for i:=1 to SG02.RowCount-1 do
  Begin
    if (SG02.Cells[1,i] = '褙膜站') Then Continue;
    CB_201.Items.Add(SG02.Cells[0,i]);
  End;
  CB_201.ItemIndex := 0;
end;

procedure TF_A07.SG02Snd;
var
  i : integer;
begin
  D.OpenF10S(SG01.Cells[0,SG01.Row]);
  i := 1;
  KC_SGClear(1,SG02);
  D.F10.First;
  While not D.F10.eof do
  Begin
    SG02.Cells[0,i] := D.F10.FieldByName('BEF10002').ASSTRING;
    SG02.Cells[1,i] := D.F10.FieldByName('BEF10005').ASSTRING;
    inc(i);
    D.F10.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_A07.SG03Snd;
var
  i,j,k : integer;
begin
  for i:=1 to SG03.RowCount-1 do
  Begin
    k := 0;
    for j:=0 to SL01.Count-1 do
    Begin
      if SG03.Cells[0,i] = KC_GetSubStr(#255,SL01.Strings[j],1) Then
        inc(k);
    End;
    SG03.Cells[1,i] := IntToStr(k);
  End;
  KC_ColAutoSize(SG03);
end;

procedure TF_A07.SG04Snd(S1 : String);
var
  i,j : integer;
  Bool: Boolean;
begin
  i := 1;
  KC_SGClear(1,SG04);
  D.F07.First;
  While not D.F07.Eof do
  Begin
    if (KC_GetSubStr('-',S1,1)<>D.F07.FieldByName('BEF07001').ASSTRING) Then
    Begin
      D.F07.Next;
      Continue;
    End;
    SG04.Cells[1,i] := D.F07.FieldByName('BEF07002').ASSTRING+#255+
                       D.F07.FieldByName('BEF07003').ASSTRING;
    inc(i);
    D.F07.Next;
  End;
  SG04.RowCount := iif(i=1,2,i);

  for i:=1 to SG04.RowCount-1 do
  Begin
    Bool := False;
    for j:=0 to SL01.Count-1 do
    Begin
      if (           SG03.Cells[0,SG03.Row]    = KC_GetSubStr(#255,SL01.Strings[j],1)) and
         (KC_GetSubStr(#255,SG04.Cells[1,i],1) = KC_GetSubStr(#255,SL01.Strings[j],2)) Then
         Bool := True;
    end;
    SG04.Cells[0,i] := iif(Bool,'T','F');
  End;
  KC_ColAutoSize(SG04);
  SG04Row := SG04.Row;
end;

procedure TF_A07.OpenF09(S1,S2 : String);
begin
  KC_T3Close(D.F09,D.SC);
  D.F09.CommandText := 'SELECT BEF09101 FROM BEFF09 '+
                                      'Where BEF09001 = '''+S1+
                                     ''' and BEF09002 = '''+S2+
                                ''' Group by BEF09101 '+
                                   'Order by BEF09101';
  KC_T3OPEN(D.F09,D.SC);
  D.F09.First;
end;

procedure TF_A07.SG05Snd(S1,S2 : String);
var
  i,j : integer;
  Bool: Boolean;
begin
  OpenF09(KC_GetSubStr('-',S1,1),
          KC_GetSubStr(#255,S2,1));
  i := 1;
  KC_SGClear(1,SG05);
  D.F09.First;
  While not D.F09.Eof do
  Begin
    SG05.Cells[1,i] := D.F09.FieldByName('BEF09101').ASSTRING;
    inc(i);
    D.F09.Next;
  End;
  SG05.RowCount := iif(i=1,2,i);

  for i:=1 to SG05.RowCount-1 do
  Begin
    Bool := False;
    for j:=0 to SL01.Count-1 do
    Begin
      if (SG05.Cells[1,i] <> '') and
         (                  SG03.Cells[0,SG03.Row]    = KC_GetSubStr(#255,SL01.Strings[j],1)) and
         (KC_GetSubStr(#255,SG04.Cells[1,SG04.Row],1) = KC_GetSubStr(#255,SL01.Strings[j],2)) and
         (                  SG05.Cells[1,i]           = KC_GetSubStr(#255,SL01.Strings[j],3)) Then
         Bool := True;
    end;
    SG05.Cells[0,i] := iif(Bool,'T','F');
  End;
  KC_ColAutoSize(SG05);
end;

procedure TF_A07.UpData;
begin
  D.F10.Locate('BEF10003;BEF10002',VarArrayOf([SG01.Cells[0,SG01.Row],
                                               SG02.Cells[0,SG02.Row]]),[loCaseInsensitive]);
  E_002.Text := D.F10.FieldByName('BEF10002').ASSTRING;
 CB_004.Checked := (D.F10.FieldByName('BEF10004').ASSTRING = 'T');
 CB_005.Text := D.F10.FieldByName('BEF10005').ASSTRING;
  E_101.Text := D.F10.FieldByName('BEF10101').ASSTRING;
 CB_102.Text := D.F10.FieldByName('BEF10102').ASSTRING;
 CB_103.Text := D.F10.FieldByName('BEF10103').ASSTRING;
 CB_104.Text := D.F10.FieldByName('BEF10104').ASSTRING;
  E_105.Text := D.F10.FieldByName('BEF10105').ASSTRING;
 CB_106.Text := D.F10.FieldByName('BEF10106').ASSTRING;
 CB_107.Text := D.F10.FieldByName('BEF10107').ASSTRING;
 CB_108.Checked := (D.F10.FieldByName('BEF10108').ASSTRING = 'T');
  E_109.Text := D.F10.FieldByName('BEF10109').ASSTRING;
  E_110.Text := D.F10.FieldByName('BEF10110').ASSTRING;
  E_111.Text := D.F10.FieldByName('BEF10111').ASSTRING;
  E_112.Text := D.F10.FieldByName('BEF10112').ASSTRING;
  E_113.Text := D.F10.FieldByName('BEF10113').ASSTRING;
  E_114.Text := D.F10.FieldByName('BEF10114').ASSTRING;
  E_115.Text := D.F10.FieldByName('BEF10115').ASSTRING;
 CB_201.Text := D.F10.FieldByName('BEF10201').ASSTRING;
 CB_211.Text := D.F10.FieldByName('BEF10211').ASSTRING;
  E_212.Text := D.F10.FieldByName('BEF10212').ASSTRING;
 CB_221.Text := D.F10.FieldByName('BEF10221').ASSTRING;
  E_222.Text := D.F10.FieldByName('BEF10222').ASSTRING;
 CB_231.Text := D.F10.FieldByName('BEF10231').ASSTRING;
  E_232.Text := D.F10.FieldByName('BEF10232').ASSTRING;
 CB_241.Text := D.F10.FieldByName('BEF10241').ASSTRING;
  E_242.Text := D.F10.FieldByName('BEF10242').ASSTRING;
 CB_251.Text := D.F10.FieldByName('BEF10251').ASSTRING;
  E_252.Text := D.F10.FieldByName('BEF10252').ASSTRING;
 CB_261.Text := D.F10.FieldByName('BEF10261').ASSTRING;
  E_262.Text := D.F10.FieldByName('BEF10262').ASSTRING;

  E_099.Text := D.F10.FieldByName('BEF10099').ASSTRING;
  TS01.TabVisible := (CB_005.Text <> '褙膜站');
  TS02.TabVisible := (CB_005.Text <> '成型站');
  TS03.TabVisible := (CB_005.Text <> '成型站');
  CB_102Change(Self);
  SL01.Assign(D.F10.FieldByName('BEF10901'));
  SG03Snd;
  SG04Snd(SG03.Cells[0,SG03.Row]);
  SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
end;

procedure TF_A07.C_Kind(CC_Kind : Byte);  // 0: 新增  1: 修改  2:刪除
Begin
  Kind := CC_Kind;
  case Kind of
    0 : Begin
          L_Kind.Caption := 'Append';
          P_Main.color:=$0080FFFF;
          TbStpEdit(True,F_A07,['TEdit','TCheckBox']);
          SB_Append.Down := True;
        End;
    1 : Begin
          L_Kind.Caption := 'Modify';
          P_Main.color:= clBtnFace;
          TbStpEdit(True,F_A07,['TEdit','TCheckBox']);
          SB_Modify.Down := True;
        End;
    2 : Begin
          L_Kind.Caption := 'View';
          P_Main.color:= clBtnFace;
          TbStpEdit(False,F_A07,['TEdit','TCheckBox']);
          SB_Inquire.Down := True;
        End;
    End;
End;

procedure TF_A07.F_Del;
begin
  if (2 <> kind) Then Exit;
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  KC_T3ExecSQL('Delete BEFF10 Where BEF10003 = '''+SG01.Cells[0,SG01.Row]+
                           ''' and  BEF10002 = '''+SG02.Cells[0,SG02.Row]+'''',D.SC);
  SG01Snd;
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
End;

procedure TF_A07.F_Save;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  case kind of
    0 : D.F10.Append;
    1 : D.F10.edit;
  end;

  D.F10.FieldByName('BEF10001').ASSTRING :=  SG01.Cells[0,SG01.Row];
  D.F10.FieldByName('BEF10002').ASSTRING :=  E_002.Text;
  D.F10.FieldByName('BEF10003').ASSTRING :=  SG01.Cells[0,SG01.Row];
  D.F10.FieldByName('BEF10004').ASSTRING := iif(CB_004.Checked,'T','F');
  D.F10.FieldByName('BEF10005').ASSTRING := CB_005.Text;
  D.F10.FieldByName('BEF10101').AsFloat  := KC_StrToFloat(E_101.Text); //
  D.F10.FieldByName('BEF10102').ASSTRING := CB_102.Text;
  D.F10.FieldByName('BEF10103').ASSTRING := CB_103.Text;
  D.F10.FieldByName('BEF10104').ASSTRING := CB_104.Text;
  D.F10.FieldByName('BEF10105').AsFloat  := KC_StrToFloat(E_105.Text); //
  D.F10.FieldByName('BEF10106').ASSTRING := CB_106.Text;
  D.F10.FieldByName('BEF10107').ASSTRING := CB_107.Text;
  D.F10.FieldByName('BEF10108').ASSTRING := iif(CB_108.Checked,'T','F');
  D.F10.FieldByName('BEF10109').AsFloat  := KC_StrToFloat(E_109.Text); //
  D.F10.FieldByName('BEF10110').AsFloat  := KC_StrToFloat(E_110.Text); //
  D.F10.FieldByName('BEF10111').AsFloat  := KC_StrToFloat(E_111.Text); //
  D.F10.FieldByName('BEF10112').AsFloat  := KC_StrToFloat(E_112.Text); //
  D.F10.FieldByName('BEF10113').AsFloat  := KC_StrToFloat(E_113.Text); //
  D.F10.FieldByName('BEF10114').AsFloat  := KC_StrToFloat(E_114.Text); //
  D.F10.FieldByName('BEF10115').AsFloat  := KC_StrToFloat(E_115.Text); //
  D.F10.FieldByName('BEF10201').ASSTRING := CB_201.Text;
  D.F10.FieldByName('BEF10211').ASSTRING := CB_211.Text;
  D.F10.FieldByName('BEF10212').ASSTRING :=  E_212.Text;
  D.F10.FieldByName('BEF10221').ASSTRING := CB_221.Text;
  D.F10.FieldByName('BEF10222').ASSTRING :=  E_222.Text;
  D.F10.FieldByName('BEF10231').ASSTRING := CB_231.Text;
  D.F10.FieldByName('BEF10232').ASSTRING :=  E_232.Text;
  D.F10.FieldByName('BEF10241').ASSTRING := CB_241.Text;
  D.F10.FieldByName('BEF10242').ASSTRING :=  E_242.Text;
  D.F10.FieldByName('BEF10251').ASSTRING := CB_251.Text;
  D.F10.FieldByName('BEF10252').ASSTRING :=  E_252.Text;
  D.F10.FieldByName('BEF10261').ASSTRING := CB_261.Text;
  D.F10.FieldByName('BEF10262').ASSTRING :=  E_262.Text;
  D.F10.FieldByName('BEF10099').ASSTRING :=  E_099.Text;
  D.F10.FieldByName('BEF10901').Assign(SL01);
  D.F10.ApplyUpdates(-1);
  SG01Snd;
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
End;

procedure TF_A07.FormShow(Sender: TObject);
begin
  B_Save.Enabled := (F.Pass_word in [00,01]);
  B_Delete.Enabled := (F.Pass_word in [00,01]);
  SL01 := TStringList.Create;
  D.OpenF00;
  D.OpenF07;
  D.OpenF05;
  D.OpenF01('T');
  PNoLoad(D.F00.FieldByName('BEF00201').ASSTRING,'all',CB_102);
  PNoLoad(D.F00.FieldByName('BEF00202').ASSTRING,'all',CB_103);
  PNoLoad(D.F00.FieldByName('BEF00203').ASSTRING,'all',CB_104);
  PNoLoad(D.F00.FieldByName('BEF00204').ASSTRING,'all',CB_106);
  PNoLoad(D.F00.FieldByName('BEF00205').ASSTRING,'all',CB_107);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_211);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_221);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_231);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_241);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_251);
  PNoLoad(D.F00.FieldByName('BEF00206').ASSTRING,'',CB_261);
  SG01ini;
  SG02ini;
  SG03ini;
  SG04ini;
  SG05ini;
  SG01Snd;
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
end;

procedure TF_A07.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
end;

procedure TF_A07.SB_InquireClick(Sender: TObject);
begin
  if (TControl(Sender).Name = 'SB_Modify' ) Then C_Kind(1);
  if (TControl(Sender).Name = 'SB_Append' ) Then C_Kind(0);
  if (TControl(Sender).Name = 'SB_Inquire') Then C_Kind(2);
  if (TControl(Sender).Name = 'B_Delete'  ) Then F_Del;
  if (TControl(Sender).Name = 'B_Save'    ) Then F_Save;
end;

procedure TF_A07.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
end;

procedure TF_A07.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
end;

procedure TF_A07.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UpData;
  C_Kind(2);
end;

procedure TF_A07.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpData;
  C_Kind(2);
end;

procedure TF_A07.SG03MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG04Snd(SG03.Cells[0,SG03.Row]);
  SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
end;

procedure TF_A07.SG03KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  SG04Snd(SG03.Cells[0,SG03.Row]);
  SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
end;

procedure TF_A07.SG04KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (SG04Row = SG04.Row) Then Exit;
  SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
  SG04Row := SG04.Row;
end;

procedure TF_A07.SG04MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (SG04Row = SG04.Row) Then Exit;
  SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
  SG04Row := SG04.Row;
end;

procedure TF_A07.SG04DblClick(Sender: TObject);
var
  i : integer;
  Bool : Integer;
begin
  if (2 = kind) Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  SG04.Cells[0,SG04.Row] := iif(SG04.Cells[0,SG04.Row]='T','F','T');
  Bool := -1;
  for i:=0 to SL01.Count-1 do
  Begin
    if (                  SG03.Cells[0,SG03.Row]    = KC_GetSubStr(#255,SL01.Strings[i],1)) and
       (KC_GetSubStr(#255,SG04.Cells[1,SG04.Row],1) = KC_GetSubStr(#255,SL01.Strings[i],2)) Then
    Bool := i;
  End;

  if (SG04.Cells[0,SG04.Row] = 'T') and (Bool = -1) Then
  Begin
    SL01.Add(SG03.Cells[0,SG03.Row]+#255+
             KC_GetSubStr(#255,SG04.Cells[1,SG04.Row],1)+#255);
    SG03Snd;
    SG04Snd(SG03.Cells[0,SG03.Row]);
    SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
  End;

  if (SG04.Cells[0,SG04.Row] = 'F') and (Bool <> -1) Then
  Begin
    SL01.Delete(Bool);
    SG03Snd;
    SG04Snd(SG03.Cells[0,SG03.Row]);
    SG05Snd(SG03.Cells[0,SG03.Row],SG04.Cells[1,SG04.Row]);
  End;
end;

procedure TF_A07.SG05DblClick(Sender: TObject);
var
  S : String;
  i : integer;
  Bool : integer;
begin
  if (2 = kind) Then Exit;
  if (SG04.Cells[0,SG04.Row] <> 'T') Then Exit;
  if (MessageDlg('Are you sure ?', mtConfirmation,[mbOk, mbCancel], 0) = mrCancel) then Exit;
  S := SG05.Cells[0,SG05.Row];
  for i:=1 to SG05.RowCount-1 do
    SG05.Cells[0,i] := 'F';
  if (S = 'F') Then
    SG05.Cells[0,SG05.Row] := 'T';

  Bool := -1;
  for i:=0 to SL01.Count-1 do
  Begin
    if (                  SG03.Cells[0,SG03.Row]    = KC_GetSubStr(#255,SL01.Strings[i],1)) and
       (KC_GetSubStr(#255,SG04.Cells[1,SG04.Row],1) = KC_GetSubStr(#255,SL01.Strings[i],2)) Then
    Bool := i;
  End;
  if (Bool = -1) Then Exit;
  SL01.Strings[Bool] := SG03.Cells[0,SG03.Row]+#255+
                        KC_GetSubStr(#255,SG04.Cells[1,SG04.Row],1)+#255+
                        iif(SG05.Cells[0,SG05.Row]='T',SG05.Cells[1,SG05.Row],'');
end;

procedure TF_A07.SG04DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with Sender as TStringGrid do
  begin
    if (ARow  = 0) Then Exit;
    if (ACol <> 0) Then Exit;
    if (Cells[ACol,ARow] <> 'T') Then Exit;

    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := $00DFDFFF;
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

procedure TF_A07.SG03DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with Sender as TStringGrid do
  begin
    if (ARow  = 0) Then Exit;
    if (ACol <> 1) Then Exit;
    if (Cells[ACol,ARow] = '0') Then Exit;

    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := $00FFFFD0;
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

procedure TF_A07.CB_003Change(Sender: TObject);
begin
  SG01Snd;
  SG02Snd;
  CB201Ld;
  UpData;
  C_Kind(2);
end;

function  TF_A07.GetF05(S1 : String) : String;
begin
  Result := '';
  if D.F05.Locate('BEF05001',VarArrayOf([S1]),[loCaseInsensitive]) Then
    Result := D.F05.FieldByName('BEF05099').AsString;
end;

procedure TF_A07.CB_102Change(Sender: TObject);
begin
  L_102.Caption := GetF05(CB_102.Text);
  L_104.Caption := GetF05(CB_104.Text);
  L_103.Caption := GetF05(CB_103.Text);
  L_106.Caption := GetF05(CB_106.Text);
  L_107.Caption := GetF05(CB_107.Text);
  L_211.Caption := GetF05(CB_211.Text);
  L_221.Caption := GetF05(CB_221.Text);
  L_231.Caption := GetF05(CB_231.Text);
  L_241.Caption := GetF05(CB_241.Text);
  L_251.Caption := GetF05(CB_251.Text);
  L_261.Caption := GetF05(CB_261.Text);
end;

procedure TF_A07.CB_005Change(Sender: TObject);
begin
  UpData;
end;

end.




