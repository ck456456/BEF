unit U_D10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D10 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    Panel4: TPanel;
    L_Date: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    EB102: TEdit;
    EE102: TEdit;
    CB004: TComboBox;
    Panel6: TPanel;
    SG01: TStringGrid;
    L_Type: TLabel;
    EB001: TEdit;
    EE001: TEdit;
    Label3: TLabel;
    CB006: TComboBox;
    CE006: TComboBox;
    CB_ELn: TComboBox;
    CB_BLn: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SL01 : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure SG01Ini;
    procedure SG01Snd;
    procedure SL01Snd;
    procedure OpenF16;
    procedure OpenF10;
    procedure CB004Ld;
    procedure LoadLne(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D10: TF_D10;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_D10.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D10.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D10.SG01Ini;
var
  i : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Date';
  SG01.Cells[01,0] := '日';

  SG01.Cells[01,1] := 'A班';
  SG01.Cells[01,2] := '良率';
  SG01.Cells[02,2] := 'OK';
  SG01.Cells[03,2] := 'NG';

  SG01.Cells[04,1] := 'B班';
  SG01.Cells[04,2] := '良率';
  SG01.Cells[05,2] := 'OK';
  SG01.Cells[06,2] := 'NG';

  SG01.Cells[07,1] := 'C班';
  SG01.Cells[07,2] := '良率';
  SG01.Cells[08,2] := 'OK';
  SG01.Cells[09,2] := 'NG';

  SG01.Cells[10,0] := '夜';

  SG01.Cells[10,1] := 'A班';
  SG01.Cells[10,2] := '良率';
  SG01.Cells[11,2] := 'OK';
  SG01.Cells[12,2] := 'NG';

  SG01.Cells[13,1] := 'B班';
  SG01.Cells[13,2] := '良率';
  SG01.Cells[14,2] := 'OK';
  SG01.Cells[15,2] := 'NG';

  SG01.Cells[16,1] := 'C班';
  SG01.Cells[16,2] := '良率';
  SG01.Cells[17,2] := 'OK';
  SG01.Cells[18,2] := 'NG';
  i:=0;
  While (KC_B2Day(EB102.Text)+i) <= KC_B2Day(EE102.Text) do
  Begin
    SG01.Cells[00,i+3] := FormatDateTime('yyyymmdd',(KC_B2Day(EB102.Text)+i));
    inc(i);
  End;
  SG01.Cells[00,i+3] := '合計 : ';
  SG01.RowCount := i+4;
  KC_ColAutoSize(SG01);
end;

procedure TF_D10.CB004Ld;
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

procedure TF_D10.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D10.LoadLne(S1 : String);
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

procedure TF_D10.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  EB102.Text := KC_Data2B(F.IdTime.DateTime-7);
  EE102.Text := KC_Data2B(F.IdTime.DateTime);
  D.OpenF00;
  OpenF10;
  CB004Ld;
  LoadLne('成型站');
  OpenWF15; PWorkLd(CB006); PWorkLd(CE006);
  SG01Ini;
end;

procedure TF_D10.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S1 : String;
begin
  if (ARow in [0,1,2]) Then Exit;
  if (ACol in [0]) Then Exit;
  with Sender as TStringGrid do
  begin
    if not KC_ChkVal(Cells[0,ARow]) Then Exit;
    S1 := F.Group(Cells[0,ARow]);
    if (Pos('A',S1) <> 0) and (ACol in [1,2,3,10,11,12]) Then Exit;
    if (Pos('B',S1) <> 0) and (ACol in [4,5,6,13,14,15]) Then Exit;
    if (Pos('C',S1) <> 0) and (ACol in [7,8,9,16,17,18]) Then Exit;
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := clSilver;
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

procedure TF_D10.OpenF16;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF16 Where BEF16001 >= '''+EB001.Text+
                            ''' and  BEF16001 <= '''+EE001.Text+
                           'z'' and  BEF16005 >= '''+CB_BLn.Text+
                            ''' and  BEF16005 <= '''+CB_ELn.Text+
                           'z'' and  BEF16006 >= '''+CB006.Text+
                            ''' and  BEF16006 <= '''+CE006.Text+
                           'z'' and  BEF16103 >= '''+EB102.Text+
                            ''' and  BEF16102 <= '''+EE102.Text+
                           'z'' Order by BEF16102';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_D10.SL01Snd;
var
  ok : real;
begin
  D.F16.First;
  SL01.Clear;
  While not D.F16.Eof do
  Begin
    if ((CB004.Text <> 'all') and
        (CB004.Text <> D.F16.FieldByName('BEF16004').AsString)) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    ok := D.F16.FieldByName('BEF16303').AsFloat+ // A 級長度
          D.F16.FieldByName('BEF16304').AsFloat; // B 級長度
    SL01.Add(D.F16.FieldByName('BEF16102').AsString+#255+ // Begin  DateTime
             D.F16.FieldByName('BEF16103').AsString+#255+ // Finish DateTime
             D.F16.FieldByName('BEF16302').AsString+#255+ // 使用長度
             FloatToStr(ok));
    D.F16.Next;
  End;
end;

procedure TF_D10.SG01Snd;
var
  i,j     : integer;
  Dok,Dsm : Real;
  Nok,Nsm : Real;
  DB0,DE0 : TDateTime;
  DB1,DE1 : TDateTime;
  DD ,NN  : TDateTime;
  S1      : String;
begin
  for i:=3 to SG01.RowCount-2 do
  Begin
    Dok := 0;
    Dsm := 0;
    Nok := 0;
    Nsm := 0;
    DB0 := KC_B2Day(SG01.Cells[0,i])+F.DayNight.BeginDay  ;
    DE0 := KC_B2Day(SG01.Cells[0,i])+F.DayNight.BeginNight;
    for j:=0 to SL01.Count-1 do
    Begin
      S1 := SL01.Strings[j];
      if (KC_GetSubStr(#255,S1,1) = '') or (KC_GetSubStr(#255,S1,1) = '') Then Continue;
      DB1 := KC_B2DateTime(KC_GetSubStr(#255,S1,1));
      DE1 := KC_B2DateTime(KC_GetSubStr(#255,S1,2));
      DD  := 0;
      if (DB0 > DE1) then Continue;
      if (DE0 < DB1) then Continue;
      if (DB1 <= DB0) and (DE1 <= DE0  ) Then DD := DE1-DB0;
      if (DB1 <= DB0) and (DE1 >  DE0  ) Then DD := DE0-DB0;
      if (DB1 >  DB0) and (DE1 <= DE0  ) Then DD := DE1-DB1;
      if (DB1 <  DB0) and (DE1 >  DE0  ) Then DD := DE0-DB1;
      Dok := Dok+KC_StrToFloat(KC_GetSubStr(#255,S1,4))*DD/(DE1-DB1);
      Dsm := Dsm+KC_StrToFloat(KC_GetSubStr(#255,S1,3))*DD/(DE1-DB1);
    End;
    for j:=0 to SL01.Count-1 do
    Begin
      S1 := SL01.Strings[j];
      if (KC_GetSubStr(#255,S1,1) = '') or (KC_GetSubStr(#255,S1,1) = '') Then Continue;
      DB1 := KC_B2DateTime(KC_GetSubStr(#255,S1,1));
      DE1 := KC_B2DateTime(KC_GetSubStr(#255,S1,2));
      NN  := 0;                                                  
      if (DE0   > DE1) then Continue;
      if (DB0+1 < DB1) then Continue;
      if (DB1 <= DE0) and (DE1 <= (DB0+1)) Then NN := DE1-DE0;
      if (DB1 <= DE0) and (DE1 >  (DB0+1)) Then NN := (DB0+1)-DE0;
      if (DB1 >  DE0) and (DE1 <= (DB0+1)) Then NN := DE1-DB1;
      if (DB1 <  DE0) and (DE1 >  (DB0+1)) Then NN := (DB0+1)-DB1;
      Nok := Nok+KC_StrToFloat(KC_GetSubStr(#255,S1,4))*NN/(DE1-DB1);
      Nsm := Nsm+KC_StrToFloat(KC_GetSubStr(#255,S1,3))*NN/(DE1-DB1);
    End;
    if not KC_ChkVal(SG01.Cells[0,i]) Then Continue;
    S1 := F.Group(SG01.Cells[0,i]);
    if (Pos('A',S1) <> 0) Then
    Begin
      SG01.Cells[ 2,i] := format('%0.2f',[Dok/2]);
      SG01.Cells[ 3,i] := format('%0.2f',[(Dsm-Dok)/2]);
      if (Dsm <> 0) Then  SG01.Cells[ 1,i] := format('%0.2f%%',[(Dok/Dsm)*100]);
      SG01.Cells[11,i] := format('%0.2f',[Nok/2]);
      SG01.Cells[12,i] := format('%0.2f',[(Nsm-Nok)/2]);
      if (Nsm <> 0) Then  SG01.Cells[10,i] := format('%0.2f%%',[(Nok/Nsm)*100]);
    End;
    if (Pos('B',S1) <> 0) Then
    Begin
      SG01.Cells[ 5,i] := format('%0.2f',[Dok/2]);
      SG01.Cells[ 6,i] := format('%0.2f',[(Dsm-Dok)/2]);
      if (Dsm <> 0) Then  SG01.Cells[ 4,i] := format('%0.2f%%',[(Dok/Dsm)*100]);
      SG01.Cells[14,i] := format('%0.2f',[Nok/2]);
      SG01.Cells[15,i] := format('%0.2f',[(Nsm-Nok)/2]);
      if (Nsm <> 0) Then  SG01.Cells[13,i] := format('%0.2f%%',[(Nok/Nsm)*100]);
    End;
    if (Pos('C',S1) <> 0)  Then
    Begin
      SG01.Cells[ 8,i] := format('%0.2f',[Dok/2]);
      SG01.Cells[ 9,i] := format('%0.2f',[(Dsm-Dok)/2]);
      if (Dsm <> 0) Then  SG01.Cells[ 7,i] := format('%0.2f%%',[(Dok/Dsm)*100]);
      SG01.Cells[17,i] := format('%0.2f',[Nok/2]);
      SG01.Cells[18,i] := format('%0.2f',[(Nsm-Nok)/2]);
      if (Nsm <> 0) Then  SG01.Cells[16,i] := format('%0.2f%%',[(Nok/Nsm)*100]);
    End;
  End;

  for i:=1 to SG01.ColCount-1 do
  Begin
    if i in [1,4,7,10,13,16] Then Continue;
    Dsm := 0;
    for j:=3 to SG01.RowCount-2 do Dsm := Dsm + KC_StrToFloat(SG01.Cells[i,j]);
    SG01.Cells[i,SG01.RowCount-1] := format('%0.2f',[Dsm]);
  End;
  for i:=1 to 6 do
  Begin
    Dok := KC_StrToFloat(SG01.Cells[(i-1)*3+2,SG01.RowCount-1]);
    Dsm := KC_StrToFloat(SG01.Cells[(i-1)*3+3,SG01.RowCount-1]);
    if ((Dok+Dsm)=0) Then Continue;
    SG01.Cells[(i-1)*3+1,SG01.RowCount-1] := format('%0.2f%%',[Dok/(Dok+Dsm)*100])
  End;
  KC_ColAutoSize(SG01);
end;

procedure TF_D10.B_OKClick(Sender: TObject);
begin
  OpenF16;
  SL01Snd;
  SG01Ini;
  SG01Snd;
end;

procedure TF_D10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
end;

end.


