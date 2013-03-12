unit U_D03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids;

type
  TF_D03 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    B_Excel: TBitBtn;
    B_Chart: TBitBtn;
    Panel4: TPanel;
    Label11: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    L_Date: TLabel;
    L_Type: TLabel;
    CB000: TComboBox;
    CBGRP: TComboBox;
    EB102: TEdit;
    EE102: TEdit;
    EB001: TEdit;
    EE001: TEdit;
    Panel6: TPanel;
    SG01: TStringGrid;
    Label2: TLabel;
    Label6: TLabel;
    CB004: TComboBox;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    CB006: TComboBox;
    CE006: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure CB000Change(Sender: TObject);
    procedure CBGRPChange(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExcelClick(Sender: TObject);
    procedure B_ChartClick(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
    procedure CB002Change(Sender: TObject);
    procedure CB004Change(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    SL01 : TStringList;
    procedure OpenWF15;
    procedure PWorkLd(CB :TComboBox);
    procedure CB004Ld;
    procedure CBGRPLd;
    procedure OpenFP1;
    procedure OpenF10;
    procedure SG01Ini;
    procedure SG01Snd;
    function  GetCol(var iCol : Integer;S1: String) : Boolean;
    function  GetRow(S1,S2 : String) : Integer;
    procedure LoadLne(S1 : String);
  public
    { Public declarations }
  end;

var
  F_D03: TF_D03;

implementation

uses U_KcPub, U_D, U_F, U_D0301, U_V03, U_V05;

{$R *.dfm}

procedure TF_D03.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D03.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

function TF_D03.GetRow(S1,S2 : String) : Integer;
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

function TF_D03.GetCol(var iCol : Integer;S1: String) : Boolean;
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

procedure TF_D03.CB004Ld;
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

procedure TF_D03.CBGRPLd;
begin
  D.OpenF07(CB000.Text);
  CBGRP.Clear;
  While not D.F07.Eof do
  Begin
    CBGRP.Items.Add(D.F07.FieldByName('BEF07002').AsString);
    D.F07.Next;
  End;
  CBGRP.ItemIndex := 0;
end;

procedure TF_D03.SG01Ini;
var
  iCol : integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0] := 'Run No.';                 // BEF19001-BEF19007
  SG01.Cells[1,0] := 'Begin';                   // BEF19102
  SG01.Cells[2,0] := 'Product Type-No';         // BEF19002-BEF19003
  SG01.Cells[3,0] := 'Process No';              // BEF19004
  SG01.Cells[4,0] := 'Line No ';                // BEF19005
  SG01.Cells[5,0] := 'Working No';              // BEF19006
  SG01.Cells[6,0] := 'Station';
  SG01.Cells[7,0] := 'Time';
  iCol := 8;
  D.OpenF08(CB000.Text,CBGRP.Text);
  While not D.F08.Eof do
  Begin
    if (D.F08.FieldByName('BEF08103').AsString = '0') Then
    Begin
      D.F08.Next;
      Continue;
    End;
    SG01.Cells[iCol,0] := D.F08.FieldByName('BEF08101').AsString+#255+
                          D.F08.FieldByName('BEF08102').AsString;
    inc(iCol);
    D.F08.Next;
  End;
  SG01.RowCount := 2;
  SG01.ColCount := iCol;
  KC_ColAutoSize(SG01);
end;

procedure TF_D03.OpenFP1;
var
  SQL : String;
begin
  SQL := 'Select * From BEFF19 Where BEF19001 >= '''+EB001.Text+
                            ''' and  BEF19001 <= '''+EE001.Text+
                           'z'' and  BEF19005 >= '''+CB_BLn.Text+
                            ''' and  BEF19005 <= '''+CB_ELn.Text+
                           'z'' and  BEF19006 >= '''+CB006.Text+
                            ''' and  BEF19006 <= '''+CE006.Text+
                           'z'' and  BEF19102 >= '''+EB102.Text+
                            ''' and  BEF19102 <= '''+EE102.Text+
                           'z'' Order by BEF19102';
  if (CB000.ItemIndex=0) Then
    SQL := 'Select * From BEFF16 Where BEF16001 >= '''+EB001.Text+
                              ''' and  BEF16001 <= '''+EE001.Text+
                             'z'' and  BEF16005 >= '''+CB_BLn.Text+
                              ''' and  BEF16005 <= '''+CB_ELn.Text+
                             'z'' and  BEF16006 >= '''+CB006.Text+
                              ''' and  BEF16006 <= '''+CE006.Text+
                             'z'' and  BEF16102 >= '''+EB102.Text+
                              ''' and  BEF16102 <= '''+EE102.Text+
                             'z'' Order by BEF16102';
  KC_T3Close(D.FP1,D.SC);
  D.FP1.CommandText := SQL;
  KC_T3OPEN(D.FP1,D.SC);
  D.FP1.First;
end;

procedure TF_D03.SG01Snd;
var
  S1,S2,S3 : String;
  i,iRow,iCol : Integer;
begin
  KC_SGClear(1,SG01);
  SG01.RowCount := 2;
  While not D.FP1.Eof do
  Begin
    S1 := iif(CB000.ItemIndex<>0,'BEF19901','BEF16901');
    S3 := iif(CB000.ItemIndex<>0,'BEF19004','BEF16004');
    SL01.Assign(D.FP1.FieldByName(S1));
    if (CB000.ItemIndex<>0) Then S2 := D.FP1.FieldByName('BEF19001').AsString+'-'+
                                       D.FP1.FieldByName('BEF19007').AsString;
    if (CB000.ItemIndex =0) Then S2 := D.FP1.FieldByName('BEF16001').AsString;
    if ((CB004.Text <> 'all') and
        (CB004.Text <> D.FP1.FieldByName(S3).AsString)) Then
    Begin
      D.FP1.Next;
      Continue;
    End;
    for i:=0 to SL01.Count-1 do
    Begin
      S1 := SL01.Strings[i];
      if CB000.Text <> KC_GetSubStr(#255,S1,1) Then Continue;
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
end;

procedure TF_D03.OpenF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002,BEF10003 FROM BEFF10 Group by BEF10003,BEF10002 Order by BEF10003,BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D03.LoadLne(S1 : String);
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

procedure TF_D03.FormShow(Sender: TObject);
begin
  SL01 := TStringList.Create;
  EB102.Text := KC_Data2B(F.IdTime.DateTime-7);
  EE102.Text := KC_Data2B(F.IdTime.DateTime);
  OpenF10;
  CBGRPLd;
  CB004Ld;
  OpenWF15;   PWorkLd(CB006);   PWorkLd(CE006);
  LoadLne(CB000.Text);
  SG01Ini;
end;

procedure TF_D03.CB000Change(Sender: TObject);
begin
  CBGRPLd;
  LoadLne(CB000.Text);
  SG01Ini;
end;

procedure TF_D03.CBGRPChange(Sender: TObject);
begin
  SG01Ini;
end;

procedure TF_D03.B_OKClick(Sender: TObject);
begin
  OpenFP1;
  SG01Snd;
end;

procedure TF_D03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL01.Free;
  KC_CloseExcel(V);
end;

procedure TF_D03.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'D03.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\D03.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+13+12,i+6].Value := iif(KC_GetSubStr(#255,SG01.Cells[i,j],2)='',
                                        SG01.Cells[i,j],
                                        KC_GetSubStr(#255,SG01.Cells[i,j],2))
end;

procedure TF_D03.B_ChartClick(Sender: TObject);
begin
  F_D0301 := TF_D0301.Create(Application);
  try
    F_D0301.ShowModal;
  finally
    F_D0301.Free;
  end;
end;

procedure TF_D03.SG01DblClick(Sender: TObject);
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

procedure TF_D03.CB002Change(Sender: TObject);
begin
  CB004Ld;
end;

procedure TF_D03.CB004Change(Sender: TObject);
begin
//
end;

end.


