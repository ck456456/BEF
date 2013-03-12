unit U_D25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, DB;

type
  TF_D25 = class(TForm)
    P_Main: TPanel;
    Panel6: TPanel;
    E_BDat: TEdit;
    E_EDat: TEdit;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    PC01: TPageControl;
    TabSheet1: TTabSheet;
    SG01: TStringGrid;
    TabSheet2: TTabSheet;
    SG02: TStringGrid;
    CB_000: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OKClick(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
  private
    { Private declarations }
    V : Variant;
    SL01,SL02 : TStringList;
    procedure SG01Ini;
    procedure SG02Ini;
    procedure SL01Snd;
    procedure SL02Snd;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure OpenF16;
    procedure OpenF19;
  public
    { Public declarations }
  end;

var
  F_D25: TF_D25;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_D25.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Working';
  SG01.Cells[01,0] := 'Product';
  SG01.Cells[02,0] := 'Line';
  SG01.Cells[03,0] := 'Process';
  SG01.Cells[04,0] := 'PET';
  SG01.Cells[05,0] := 'RUN NO.';
  SG01.Cells[06,0] := '使用長度';
  SG01.Cells[07,0] := '收料長度';
  SG01.Cells[08,0] := '收料m2';
  SG01.Cells[09,0] := '未褙膜長度';
  SG01.Cells[10,0] := '等級';
  SG01.Cells[11,0] := '褙膜站';
  SG01.Cells[12,0] := '使用長度';
  SG01.Cells[13,0] := '收料長度';
  SG01.Cells[14,0] := '收料m2';
  SG01.Cells[15,0] := '等級';
  KC_ColAutoSize(SG01);
end;

procedure TF_D25.SG02Ini;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Working';
  SG02.Cells[01,0] := 'Product';
  SG02.Cells[02,0] := 'Line';
  SG02.Cells[03,0] := 'Process';
  SG02.Cells[04,0] := 'BEF 料號';
  SG02.Cells[05,0] := '上保料號';
  SG02.Cells[06,0] := '下保料號';
  SG02.Cells[07,0] := 'RUN NO.';
  SG02.Cells[08,0] := '使用長度';
  SG02.Cells[09,0] := '收料長度';
  SG02.Cells[10,0] := '收料m2';
  SG02.Cells[11,0] := '等級';
  KC_ColAutoSize(SG02);
end;

procedure TF_D25.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  E_BDat.Text := FormatDateTime('yyyymmddhhnnss',D1);
  E_EDaT.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  SL02 := TStringList.Create;
  D.OpenF05;
  SG01Ini;
  SG02Ini;
end;

procedure TF_D25.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SL02.Free;
  KC_CloseExcel(V);
end;

procedure TF_D25.OpenF16;
begin
  KC_T3Close(D.F16,D.SC);
  case CB_000.ItemIndex of
    0 : D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16102 >= '''+E_BDat.Text+
                                                 ''' and BEF16102 <= '''+E_EDat.Text+
                                           'z'' Order by BEF16006,BEF16001';
    1 : D.F16.CommandText := 'SELECT * FROM BEFF16 Where BEF16001 >= '''+E_BDat.Text+
                                                 ''' and BEF16001 <= '''+E_EDat.Text+
                                           'z'' Order by BEF16006,BEF16001';
  End;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
End;

procedure TF_D25.OpenF19;
begin
  KC_T3Close(D.F19,D.SC);
  case CB_000.ItemIndex of
    0 : D.F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19102 >= '''+E_BDat.Text+
                                                 ''' and BEF19102 <= '''+E_EDat.Text+
                                           'z'' Order by BEF19006,BEF19001,BEF19007';
    1 : D.F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19001 >= '''+E_BDat.Text+
                                                 ''' and BEF19001 <= '''+E_EDat.Text+
                                           'z'' Order by BEF19006,BEF19001,BEF19007';
  End;
  KC_T3OPEN(D.F19,D.SC);
  D.F19.First;
End;

procedure TF_D25.SL01Snd;
var
  PNo : String;
  S1,S2 : String;
  F1 : Real;
begin
  PNo := 'xoxox';
  S1 := '??';
  S2 := '??';
  SL01.Clear;
  D.F16.First;
  While not D.F16.Eof do
  Begin
    if (PNo<>D.F16.FieldByName('BEF16002').AsString+#255+
             D.F16.FieldByName('BEF16004').AsString) Then
    Begin
      S1 := '??';
      S2 := '??';
      Pno := D.F16.FieldByName('BEF16002').AsString+#255+
             D.F16.FieldByName('BEF16004').AsString;
      D.OpenF10(KC_GetSubStr(#255,Pno,1),KC_GetSubStr(#255,Pno,2));
      While not D.F10.Eof do
      Begin
        if((D.F10.FieldByName('BEF10005').AsString='成型站') or
           (D.F10.FieldByName('BEF10005').AsString='all'))Then
        Begin
          S1 := D.F10.FieldByName('BEF10102').AsString;
          S2 := D.F10.FieldByName('BEF10103').AsString;
        End;
        D.F10.Next;
      End;
    End;
    F1 :=(D.F16.FieldByName('BEF16303').AsFloat)*   // 收料長度
          D.F16.FieldByName('BEF16304').AsFloat/1000; // 檢驗寬幅
    SL01.Add(D.F16.FieldByName('BEF16006').AsString+#255+ // Working;
             D.F16.FieldByName('BEF16002').AsString+#255+ // Product;
             D.F16.FieldByName('BEF16005').AsString+#255+ // Line
             D.F16.FieldByName('BEF16004').AsString+#255+ // Process;
             S1+#255+ // PET 料號;
             D.F16.FieldByName('BEF16001').AsString+#255+ // Run;
             D.F16.FieldByName('BEF16302').AsString+#255+ // 使用長度;
             D.F16.FieldByName('BEF16303').AsString+#255+ // 收料長度;
             format('%0.0f',[F1])+#255+ // 收料m2;
             D.F16.FieldByName('BEF16307').AsString+#255+ // 未褙膜長度;
             D.F16.FieldByName('BEF16308').AsString+#255+ // 等級
             D.F16.FieldByName('BEF16304').AsString); // 檢驗寬幅
    D.F16.Next;
  End;
  SL01.Sort;
End;

procedure TF_D25.SL02Snd;
var
  PNo : String;
  F1 : Real;
  S1,S2,S3,S4 : String;
begin
  SL02.Clear;
  D.F19.First;
  While not D.F19.Eof do
  Begin
    if (PNo<>D.F19.FieldByName('BEF19002').AsString+#255+
             D.F19.FieldByName('BEF19004').AsString) Then
    Begin
      S1 := '??';
      S2 := '??';
      S3 := '??';
      Pno := D.F19.FieldByName('BEF19002').AsString+#255+
             D.F19.FieldByName('BEF19004').AsString;
      D.OpenF10(KC_GetSubStr(#255,Pno,1),KC_GetSubStr(#255,Pno,2));
      While not D.F10.Eof do
      Begin
        if((D.F10.FieldByName('BEF10005').AsString='褙膜站') or
           (D.F10.FieldByName('BEF10005').AsString='all'))Then
        Begin
          S1 := D.F10.FieldByName('BEF10106').AsString;
          S2 := D.F10.FieldByName('BEF10107').AsString;
          S3 := D.F10.FieldByName('BEF10201').AsString;
        End;
        D.F10.Next;
      End;
    End;
    D.OpenF16(D.F19.FieldByName('BEF19001').AsString);
    F1 :=(D.F19.FieldByName('BEF19303').AsFloat)*   // 收料長度
          D.F16.FieldByName('BEF16304').AsFloat/1000; // 檢驗寬幅

    S4 := '--';
    if D.F05.Locate('BEF05002;BEF05001',
                            VarArrayOf([D.F19.FieldByName('BEF19002').AsString,
                                        D.F19.FieldByName('BEF19003').AsString]),[loCaseInsensitive]) Then
      S4 := D.F05.FieldByName('BEF05003').AsString;

    SL02.Add(D.F19.FieldByName('BEF19006').AsString+#255+ // Working;
             D.F19.FieldByName('BEF19002').AsString+#255+ // 'Product';
             D.F19.FieldByName('BEF19005').AsString+#255+ // Line
             D.F19.FieldByName('BEF19004').AsString+#255+ // 'Process';
             S3+#255+ // 'BEF 料號';
             S1+#255+ // '上保料號';
             S2+#255+ // '下保料號';
             D.F19.FieldByName('BEF19001').AsString+'-'+
             D.F19.FieldByName('BEF19007').AsString+#255+ // Run;
             D.F19.FieldByName('BEF19302').AsString+#255+ // '使用長度';
             D.F19.FieldByName('BEF19303').AsString+#255+ // '收料長度';
             format('%0.0f',[F1])+#255+                   // '收料m2';
             S4);                                         // '等級';
    D.F19.Next;
  End;
  SL02.Sort;
End;

procedure TF_D25.SG02Snd;
var
  i : integer;
  iRow : integer;
begin
  KC_SGClear(1,SG02);
  iRow := 1;
  for i:=0 to SL02.Count-1 do
  Begin
    SG02.Cells[00,iRow] := KC_GetSubStr(#255,SL02.Strings[i],1);
    SG02.Cells[01,iRow] := KC_GetSubStr(#255,SL02.Strings[i],2);
    SG02.Cells[02,iRow] := KC_GetSubStr(#255,SL02.Strings[i],3);
    SG02.Cells[03,iRow] := KC_GetSubStr(#255,SL02.Strings[i],4);
    SG02.Cells[04,iRow] := KC_GetSubStr(#255,SL02.Strings[i],5);
    SG02.Cells[05,iRow] := KC_GetSubStr(#255,SL02.Strings[i],6);
    SG02.Cells[06,iRow] := KC_GetSubStr(#255,SL02.Strings[i],7);
    SG02.Cells[07,iRow] := KC_GetSubStr(#255,SL02.Strings[i],8);
    SG02.Cells[08,iRow] := KC_GetSubStr(#255,SL02.Strings[i],9);
    SG02.Cells[09,iRow] := KC_GetSubStr(#255,SL02.Strings[i],10);
    SG02.Cells[10,iRow] := KC_GetSubStr(#255,SL02.Strings[i],11);
    SG02.Cells[11,iRow] := KC_GetSubStr(#255,SL02.Strings[i],12);
    inc(iRow);
  End;
  SG02.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG02);
End;

procedure TF_D25.SG01Snd;
var
  i : integer;
  iRow : integer;
  Bool : Boolean;
  f1,f2 : Real;
  S4 : String;
begin
  KC_SGClear(1,SG01);
  iRow := 1;
  for i:=0 to SL01.Count-1 do
  Begin
    SG01.Cells[00,iRow] := KC_GetSubStr(#255,SL01.Strings[i],1);
    SG01.Cells[01,iRow] := KC_GetSubStr(#255,SL01.Strings[i],2);
    SG01.Cells[02,iRow] := KC_GetSubStr(#255,SL01.Strings[i],3);
    SG01.Cells[03,iRow] := KC_GetSubStr(#255,SL01.Strings[i],4);
    SG01.Cells[04,iRow] := KC_GetSubStr(#255,SL01.Strings[i],5);
    SG01.Cells[05,iRow] := KC_GetSubStr(#255,SL01.Strings[i],6);
    SG01.Cells[06,iRow] := KC_GetSubStr(#255,SL01.Strings[i],7);
    SG01.Cells[07,iRow] := KC_GetSubStr(#255,SL01.Strings[i],8);
    SG01.Cells[08,iRow] := KC_GetSubStr(#255,SL01.Strings[i],9);
    SG01.Cells[09,iRow] := KC_GetSubStr(#255,SL01.Strings[i],10);
    SG01.Cells[10,iRow] := KC_GetSubStr(#255,SL01.Strings[i],11);
    D.OpenF19(KC_GetSubStr(#255,SL01.Strings[i],6));
    Bool := False;
    While not D.F19.Eof do
    Begin
      Bool := True;
      S4 := '--';
      if D.F05.Locate('BEF05002;BEF05001',
                              VarArrayOf([D.F19.FieldByName('BEF19002').AsString,
                                          D.F19.FieldByName('BEF19003').AsString]),[loCaseInsensitive]) Then
        S4 := D.F05.FieldByName('BEF05003').AsString;
      f1 := KC_StrToFloat(D.F19.FieldByName('BEF19303').AsString);
      f2 := KC_StrToFloat(KC_GetSubStr(#255,SL01.Strings[i],12));
      SG01.Cells[11,iRow] := D.F19.FieldByName('BEF19001').AsString+#255+D.F19.FieldByName('BEF19007').AsString;
      SG01.Cells[12,iRow] := D.F19.FieldByName('BEF19302').AsString;
      SG01.Cells[13,iRow] := D.F19.FieldByName('BEF19303').AsString;
      SG01.Cells[14,iRow] := format('%0.0f',[(f1*f2)/1000]);
      SG01.Cells[15,iRow] := S4;
      D.F19.Next;
      inc(iRow);
    End;
    if (not Bool) then inc(iRow);
  End;
  SG01.RowCount := iif(iRow=1,2,iRow);
  KC_ColAutoSize(SG01);
End;

procedure TF_D25.B_OKClick(Sender: TObject);
begin
  OpenF16;
  OpenF19;
  SL01Snd;
  SL02Snd;
  SG01Snd;
  SG02Snd;
end;

procedure TF_D25.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D25.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D25.xls');
  W := V.Workbooks[1].WorkSheets['成型站'];
  W.Cells[1,1].Value := '日期 : '+E_BDat.Text+' ~ '+E_EDat.Text;
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+2,i+1].Value := SG01.Cells[i,j];

  W := V.Workbooks[1].WorkSheets['褙膜站'];
  W.Cells[1,1].Value := '日期 : '+E_BDat.Text+' ~ '+E_EDat.Text;
  For j:=0 to SG02.RowCount-1 do
  for i:=0 to SG02.ColCount-1 do
    if (SG02.Cells[i,j] <> '') then
      W.Cells[j+2,i+1].Value := SG02.Cells[i,j];
end;

end.

