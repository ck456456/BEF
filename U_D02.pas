unit U_D02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Buttons, U_KCSPC, DB;

type
  TF_D02 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    B_Chart: TBitBtn;
    Panel4: TPanel;
    Label11: TLabel;
    L_005: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    CB000: TComboBox;
    CB005: TComboBox;
    EB102: TEdit;
    EE102: TEdit;
    CB004: TComboBox;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    SG00: TStringGrid;
    Panel6: TPanel;
    SG01: TStringGrid;
    Label7: TLabel;
    CB0041: TComboBox;
    Label3: TLabel;
    CB006: TComboBox;
    CE006: TComboBox;
    procedure CB000Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB004Change(Sender: TObject);
    procedure SG00TopLeftChanged(Sender: TObject);
    procedure SG01TopLeftChanged(Sender: TObject);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_OKClick(Sender: TObject);
    procedure CB0041Change(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure B_ChartClick(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SPC : TKCSPC;
    SL01 : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure CB0041Ld;
    procedure CB004Ld;
    procedure CB005Ld;
    procedure SG00INI;
    procedure SG00Snd;
    procedure SG01INI;
    procedure SG01Snd;
    procedure OpenFP1;
    function  GetCol(var iCol : Integer;S1: String) : Boolean;
    function  GetRow(S1,S2 : String) : Integer;
    procedure OpenWF10;
  public
    { Public declarations }
  end;

var
  F_D02: TF_D02;

implementation

uses U_KcPub, U_F, U_D, U_V03, U_V05, U_D0201;

{$R *.dfm}

procedure TF_D02.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D02.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

function TF_D02.GetRow(S1,S2 : String) : Integer;
var
  i : integer;
Begin
  Result := -1;
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[0,i] = '') Then Result := i;
    if (Result <> -1) Then Break;
    if (SG01.Cells[0,i]<>S2) Then Continue;
    if (SG01.Cells[7,i]<>KC_GetSubStr(#255,S1,2)) Then Continue;
    Result := i

  End;
  if (Result<>-1) Then Exit;
  Result := SG01.RowCount;
  SG01.RowCount := Result+1;
End;

function TF_D02.GetCol(var iCol : Integer;S1: String) : Boolean;
var
  i : integer;
begin
  Result := False;
  iCol := -1;
  for i:=8 to SG01.ColCount-1 do
  Begin
    if KC_GetSubStr(#255,S1,4)<>KC_GetSubStr(#255,SG01.Cells[i,0],1) Then Continue;
    Result := True;
    iCol := i;
    Break;
  End;
End;

procedure TF_D02.SG01Snd;
var
  S1,S2 : String;
  i,iRow,iCol : Integer;
begin
  KC_SGClear(1,SG01);
  SG01.RowCount := 2;
  While not D.FP1.Eof do
  Begin
    S1 := iif(CB000.ItemIndex<>0,'BEF19901','BEF16901');
    SL01.Assign(D.FP1.FieldByName(S1));
    if (CB000.ItemIndex<>0) Then S2 := D.FP1.FieldByName('BEF19001').AsString+'-'+
                                       D.FP1.FieldByName('BEF19007').AsString;
    if (CB000.ItemIndex =0) Then S2 := D.FP1.FieldByName('BEF16001').AsString;
    for i:=0 to SL01.Count-1 do
    Begin
      S1 := SL01.Strings[i];
      if CB000.Text <> KC_GetSubStr(#255,S1,1) Then Continue;
      if((KC_GetSubStr(#255,CB0041.Text,1) = '成型站-前') or
         (KC_GetSubStr(#255,CB0041.Text,1) = '成型站-後')) and
         (KC_GetSubStr(#255,CB0041.Text,1) <> KC_GetSubStr(#255,S1,2)) Then Continue;
      if (KC_GetSubStr(#255,CB0041.Text,2) <> KC_GetSubStr(#255,S1,3)) Then Continue;
      if not GetCol(iCol,S1) Then Continue;
      iRow := GetRow(S1,S2);
      SG01.Cells[iCol,iRow] := KC_GetSubStr(#255,S1,6);
      if (iRow <> (SG01.RowCount-1)) Then Continue;
      if (CB000.ItemIndex=0) Then
      Begin
        SG01.Cells[0,iRow] := S2;
        SG01.Cells[1,iRow] := D.FP1.FieldByName('BEF16102').AsString;
        SG01.Cells[2,iRow] := D.FP1.FieldByName('BEF16002').AsString+'-'+
                              D.FP1.FieldByName('BEF16003').AsString;
        SG01.Cells[3,iRow] := D.FP1.FieldByName('BEF16004').AsString;
        SG01.Cells[4,iRow] := D.FP1.FieldByName('BEF16005').AsString;
        SG01.Cells[5,iRow] := D.FP1.FieldByName('BEF16006').AsString;
        SG01.Cells[6,iRow] := KC_GetSubStr(#255,S1,1);
        SG01.Cells[7,iRow] := KC_GetSubStr(#255,S1,2);
      End;
      if (CB000.ItemIndex<>0) Then
      Begin
        SG01.Cells[0,iRow] := S2;
        SG01.Cells[1,iRow] := D.FP1.FieldByName('BEF19102').AsString;
        SG01.Cells[2,iRow] := D.FP1.FieldByName('BEF19002').AsString+'-'+
                              D.FP1.FieldByName('BEF19003').AsString;
        SG01.Cells[3,iRow] := D.FP1.FieldByName('BEF19004').AsString;
        SG01.Cells[4,iRow] := D.FP1.FieldByName('BEF19005').AsString;
        SG01.Cells[5,iRow] := D.FP1.FieldByName('BEF19006').AsString;
        SG01.Cells[6,iRow] := KC_GetSubStr(#255,S1,1);
        SG01.Cells[7,iRow] := KC_GetSubStr(#255,S1,2);
      End;
    End;
    D.FP1.Next;
  End;
  KC_ColAutoSize(SG01);
  For i := 0 to SG01.ColCount-1 do SG00.ColWidths[i] := SG01.ColWidths[i];
End;

procedure TF_D02.OpenFP1;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF19 Where BEF19004  = '''+KC_GetSubStr(#255,CB004.Text,1)+
     iif(CB005.ItemIndex<>0,''' and  BEF19005  = '''+CB005.Text,'')+
                            ''' and  BEF19006 >= '''+CB006.Text+
                            ''' and  BEF19006 <= '''+CE006.Text+
                           'z'' and  BEF19102 >= '''+EB102.Text+
                            ''' and  BEF19102 <= '''+EE102.Text+
                           'z'' Order by BEF19102';
  if (CB000.ItemIndex=0) Then
    SQL := 'Select * From BEFF16 Where BEF16004  = '''+KC_GetSubStr(#255,CB004.Text,1)+
       iif(CB005.ItemIndex<>0,''' and  BEF16005  = '''+CB005.Text,'')+
                              ''' and  BEF16006 >= '''+CB006.Text+
                              ''' and  BEF16006 <= '''+CE006.Text+
                             'z'' and  BEF16102 >= '''+EB102.Text+
                              ''' and  BEF16102 <= '''+EE102.Text+
                             'z'' Order by BEF16102';
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
End;

procedure TF_D02.SG01INI;
var
  i : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Run No.';         // BEF19001-BEF19007
  SG01.Cells[1,0] := 'Begin';           // BEF19102
  SG01.Cells[2,0] := 'Product Type-No'; // BEF19002-BEF19003
  SG01.Cells[3,0] := 'Process No';      // BEF19004
  SG01.Cells[4,0] := 'Line No ';        // BEF19005
  SG01.Cells[5,0] := 'Working No';      // BEF19006
  SG01.Cells[6,0] := 'Station';
  SG01.Cells[7,0] := 'Time';
  KC_ColAutoSize(SG01);
  For i := 0 to SG01.ColCount-1 do SG00.ColWidths[i] := SG01.ColWidths[i];
End;

procedure TF_D02.SG00INI;
var
  S1 : String;
  i : integer;
begin
  KC_SGClear(0,SG00);
  SG00.Cells[00,00] := 'Type';
  SG00.Cells[00,01] := 'Target';
  SG00.Cells[00,02] := 'SU';
  SG00.Cells[00,03] := 'SL';
  SG00.Cells[00,04] := 'Count';
  SG00.Cells[00,05] := 'Average';
  SG00.Cells[00,06] := 'Max';
  SG00.Cells[00,07] := 'Min';
  SG00.Cells[00,08] := 'StdDev';
  SG00.Cells[00,09] := 'CP(U/L)';
  SG00.Cells[00,10] := 'Ca';
  SG00.Cells[00,11] := 'CPK';
  D.OpenF08(CB000.Text,KC_GetSubStr(#255,CB0041.Text,2));
  D.OpenF09(CB000.Text,KC_GetSubStr(#255,CB0041.Text,2),KC_GetSubStr(#255,CB0041.Text,3));
  i := 8;
  While not D.F09.Eof do
  Begin
    S1 := D.F09.FieldByName('BEF09102').AsString;
    if D.F08.Locate('BEF08101', VarArrayOf([S1]), [loCaseInsensitive]) Then
      S1 := D.F08.FieldByName('BEF08101').AsString+#255+
            D.F08.FieldByName('BEF08102').AsString;
    SG01.Cells[i,0] := S1;
    SG00.Cells[i,0] := S1;
    SG00.Cells[i,1] := D.F09.FieldByName('BEF09202').AsString;
    SG00.Cells[i,2] := D.F09.FieldByName('BEF09214').AsString;
    SG00.Cells[i,3] := D.F09.FieldByName('BEF09213').AsString;
    D.F09.Next;
    inc(i);
  End;
  SG00.ColCount := i;
  SG01.ColCount := i;
  KC_ColAutoSize(SG01);
  For i := 0 to SG01.ColCount-1 do SG00.ColWidths[i] := SG01.ColWidths[i];
End;

procedure TF_D02.CB005Ld;
var
  S1 : String;
begin
  S1 := iif(CB000.ItemIndex=0,'成型站','褙膜站');
  D.OpenF12(S1);
  CB005.Clear;
  CB005.Items.Add('all');
  While not D.F12.Eof do
  Begin
    CB005.Items.Add(D.F12.FieldByName('BEF12002').AsString);
    D.F12.Next;
  End;
  CB005.ItemIndex := 0;
End;

procedure TF_D02.OpenWF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10001,BEF10002 FROM BEFF10 Order by BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D02.CB004Ld;
begin
  CB004.Clear;
  While not D.F10.Eof do
  Begin
    CB004.Items.Add(D.F10.FieldByName('BEF10002').AsString+#255+
                    D.F10.FieldByName('BEF10001').AsString);
    D.F10.Next;
  End;
  CB004.ItemIndex := iif(CB004.Items.Count=0,-1,0);
End;

procedure TF_D02.CB0041Ld;
var
  S1 : String;
  i : Integer;
begin
  S1 := CB004.Text;
  D.OpenF10(KC_GetSubStr(#255,S1,2),KC_GetSubStr(#255,S1,1));
  CB0041.Clear;
  SL01.Assign(D.F10.FieldByName('BEF10901'));
  SL01.Sort;
  for i:=0 to SL01.Count-1 do
  Begin
    S1 := SL01.Strings[i];
    if Pos(CB000.Text,KC_GetSubStr(#255,S1,1))=0  then Continue;
    if KC_GetSubStr(#255,S1,3)='' then Continue;
    CB0041.Items.Add(S1);
  End;
  CB0041.ItemIndex := iif(CB0041.Items.Count=0,-1,0);
End;

procedure TF_D02.FormShow(Sender: TObject);
var
  D1,D2 : TDateTime;
begin
  D1 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay-1;
  D2 := KC_B2Day(KC_Data2B(F.IdTime.DateTime))+F.DayNight.BeginDay;
  EB102.Text := FormatDateTime('yyyymmddhhnnss',D1);
  EE102.Text := FormatDateTime('yyyymmddhhnnss',D2);
  SL01 := TStringList.Create;
  SPC := TKCSPC.Create;
  OpenWF15;   PWorkLd(CB006);   PWorkLd(CE006);
  OpenWF10;   CB004Ld;          CB0041Ld;
  CB005Ld;
  SG01INI;
  SG00INI;
end;

procedure TF_D02.CB000Change(Sender: TObject);
begin
  CB005Ld;
  SG00INI;
end;

procedure TF_D02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  SPC.Free;
  KC_CloseExcel(V);
end;

procedure TF_D02.CB004Change(Sender: TObject);
begin
  CB0041Ld;
  SG00INI;
end;

procedure TF_D02.SG00TopLeftChanged(Sender: TObject);
begin
  SG01.LeftCol := SG00.LeftCol;
end;

procedure TF_D02.SG01TopLeftChanged(Sender: TObject);
begin
  SG00.LeftCol := SG01.LeftCol;
end;

procedure TF_D02.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i : integer;
begin
  For i := 0 to SG01.ColCount-1 do SG00.ColWidths[i] := SG01.ColWidths[i];
end;

procedure TF_D02.SG00Snd;
var
  i,j : Integer;
begin
  For i := 1 to SG00.ColCount-1 do
  For j := 4 to SG00.RowCount-1 do
    SG00.Cells[i,j] := '';
  For i := 8 to SG01.ColCount-1 do
  Begin
    SPC.Clear;
    SPC.SLU   := KC_StrToInt(KC_GetSubStr('.',SG00.Cells[i,00],1));
    SPC.Target:= KC_StrToFloat(SG00.Cells[i,01]);
    SPC.SU    := KC_StrToFloat(SG00.Cells[i,02]);
    SPC.SL    := KC_StrToFloat(SG00.Cells[i,03]);
    For j := 1 to SG01.RowCount-1 do
      SPC.Add(KC_StrToFloat(SG01.Cells[i,j]));
    SG00.Cells[i,04] := Format('%d'   , [SPC.Count  ]);
    SG00.Cells[i,05] := Format('%2.2f', [SPC.Average]);
    SG00.Cells[i,06] := Format('%2.2f', [SPC.Max    ]);
    SG00.Cells[i,07] := Format('%2.2f', [SPC.Min    ]);
    SG00.Cells[i,08] := Format('%2.2f', [SPC.StdDev ]);
    SG00.Cells[i,09] := Format('%2.2f', [SPC.CPUL   ]);
    SG00.Cells[i,10] := Format('%2.2f', [SPC.Ca     ]);
    SG00.Cells[i,11] := Format('%2.2f', [SPC.CPK    ]);
  End;
end;

procedure TF_D02.B_OKClick(Sender: TObject);
begin
  OpenFP1;
  SG01Snd;
  SG00Snd;
end;

procedure TF_D02.CB0041Change(Sender: TObject);
begin
  SG00INI;
end;

procedure TF_D02.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D02.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D02.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG00.RowCount-1 do
  for i:=0 to SG00.ColCount-1 do
    if (SG00.Cells[i,j] <> '') then
      W.Cells[j+13   ,i+6].Value := iif(KC_GetSubStr(#255,SG00.Cells[i,j],2)='',
                                        SG00.Cells[i,j],
                                        KC_GetSubStr(#255,SG00.Cells[i,j],2));

  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := iif(KC_GetSubStr(#255,SG01.Cells[i,j],2)='',
                                        SG01.Cells[i,j],
                                        KC_GetSubStr(#255,SG01.Cells[i,j],2))
end;

procedure TF_D02.B_ChartClick(Sender: TObject);
begin
  F_D0201 := TF_D0201.Create(Application);
  try
    F_D0201.ShowModal;
  finally
    F_D0201.Free;
  end;
end;

procedure TF_D02.SG01DblClick(Sender: TObject);
begin
  if (SG01.Cells[0,SG01.Row] = '') Then Exit;
  if (SG01.Cells[6,SG01.Row] = '成型站' ) Then
  Begin
    F_V03 := TF_V03.Create(Application);
    F_V03.Kind := 3;
    F_V03.iStation := 10;
    F_V03.E_10001.Text  := SG01.Cells[0,SG01.Row];
    F_V03.ShowModal;
    F_V03.Free;
  End;
  if (SG01.Cells[6,SG01.Row] <> '成型站' ) Then
  Begin
    F_V05 := TF_V05.Create(Application);
    F_V05.Kind := 3;
    F_V05.CB_Station.ItemIndex := 0;
    F_V05.Run  := SG01.Cells[0,SG01.Row];
    F_V05.ShowModal;
    F_V05.Free;
  End;
end;

end.




