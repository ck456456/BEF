unit U_D0201;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, StatChar, TeeBoxPlot, TeEngine, TeeFunci,
  Series, TeeProcs, Chart, Math, EditChar, ComCtrls, TabNotBk, TeeSurfa,
  TeeComma, TeeMapSeries;

type
  TF_D0201 = class(TForm)
    TN: TTabbedNotebook;
    Panel2: TPanel;
    Label1: TLabel;
    CB_Type: TComboBox;
    Panel1: TPanel;
    Splitter1: TSplitter;
    P_Left: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Panel5: TPanel;
    OChart: TChart;
    ODt: TPointSeries;
    Panel6: TPanel;
    MRChart: TChart;
    MDt: TLineSeries;
    MMean: TLineSeries;
    M3U: TLineSeries;
    Panel7: TPanel;
    XChart: TChart;
    XSL: TLineSeries;
    XSU: TLineSeries;
    XDt: TLineSeries;
    XMean: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    X3U: TLineSeries;
    X3L: TLineSeries;
    P_Right: TPanel;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Panel8: TPanel;
    BChart: TChart;
    BDt: TBoxSeries;
    Panel3: TPanel;
    HChart: TChart;
    HDt: THistogramSeries;
    Panel4: TPanel;
    Panel9: TPanel;
    Label2: TLabel;
    CB_Item01: TComboBox;
    CB_Item02: TComboBox;
    Panel10: TPanel;
    TN01: TTabbedNotebook;
    Panel11: TPanel;
    CSC: TChart;
    SCP01: TPointSeries;
    SCL01: TLineSeries;
    Panel12: TPanel;
    TeeCommander1: TTeeCommander;
    CH3D: TChart;
    H3D: TTowerSeries;
    Series1: TMapSeries;
    procedure FormShow(Sender: TObject);
    procedure CB_TypeChange(Sender: TObject);
    procedure CB_Item01Change(Sender: TObject);
    procedure CH3DDblClick(Sender: TObject);
    procedure CH3DGetAxisLabel(Sender: TChartAxis; Series: TChartSeries;
      ValueIndex: Integer; var LabelText: String);
  private
    { Private declarations }
    procedure SetCB(TCB:TComboBox);
    procedure SetSeries;
    procedure AddSingleCharts;
    procedure AddDualChart;
    procedure AddCSC;
    procedure AddH3D;
  public
    { Public declarations }
  end;

var
  F_D0201: TF_D0201;

implementation

uses U_KcPub, U_D02;

{$R *.dfm}

procedure TF_D0201.SetCB(TCB:TComboBox);
var
  i : Integer;
begin
  TCB.Clear;
  For i := 8 To (F_D02.SG01.ColCount-1) do
    TCB.Items.Add(F_D02.SG01.Cells[i,0]);
  TCB.ItemIndex := 0;
End;

procedure TF_D0201.SetSeries;
begin
  SCP01.Clear;
  SCL01.Clear;
  H3D.Clear;

  ODt.XValues.DateTime  := True;
  ODt.SeriesColor       := clBlue;
  ODt.LinePen.Color     := clBlue;

  XSL.XValues.DateTime  := False;
  XSL.SeriesColor       := clRed;
  XSL.LinePen.SmallDots := True;
  
  XSU.XValues.DateTime  := False;
  XSU.SeriesColor       := clRed;
  XSU.LinePen.SmallDots := True;
End;

procedure TF_D0201.AddCSC;
var
  i : integer;
  Sxy : real;
  Sx  : real;
  S2x : real;
  Sy  : real;
  n : integer;
  m,b : real;
  Maxx: real;
  Minn: real;
begin
  SCP01.Clear;
  SCL01.Clear;
  CSC.LeftAxis  .Title.Caption := CB_Item01.Text;
  CSC.BottomAxis.Title.Caption := CB_Item02.Text;
  Sxy := 0;
  S2x := 0;
  Sx  := 0;
  Sy  := 0;
  n   := 0;
  Maxx:= -9999999;
  Minn:=  9999999;
  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    SCP01.AddXY(KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]),
                KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]),
                              F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i] ,clBlue);

    Sxy := Sxy+KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i])*
               KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]);
    S2x := S2x+KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i])*
               KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]);
    Sx  := Sx +KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]);
    Sy  := Sy +KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]);

    Maxx:= max(Maxx,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
    Minn:= min(Minn,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
    inc(n);
  End;
  m :=  (n*(Sxy)-Sx*Sy )/((n*S2x)-(Sx*Sx));
  b := (Sy*(S2x)-Sx*Sxy)/((n*S2x)-(Sx*Sx));
  SCL01.AddXY(Maxx,Maxx*m+b,'',clRed);
  SCL01.AddXY(Minn,Minn*m+b,'',clRed);
  CSC.Title.Text.Clear;
  CSC.Title.Text.Add(Format('Scatter Plots(Y = %2.2fX + %2.2f)',[m,b]));
  CSC.LeftAxis  .Title.Caption := CB_Item01.Text;
  CSC.BottomAxis.Title.Caption := CB_Item02.Text;
end;

procedure TF_D0201.AddH3D;
var
  i,j,k : integer;
  A3D : array[0..9,0..9] of Integer;
  XMin,XMax,XAve : Real;
  DMin,DMax,DAve : Real;
  X,D : Real;
begin
  H3D.Clear;
  CH3D.BottomAxis.Title.Caption := CB_Item01.Text;
  CH3D.DepthAxis .Title.Caption := CB_Item02.Text;
  for i:=low(A3D) to High(A3D) do
  for j:=low(A3D[i]) to High(A3D[i]) do
    A3D[i,j] := 0;

  XMax:= -9999999;
  DMax:= -9999999;
  XMin:=  9999999;
  DMin:=  9999999;
  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    XMax := max(XMax,KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]));
    DMax := max(DMax,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
    XMin := min(XMin,KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]));
    DMin := min(DMin,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
  End;
  XMax := XMax+0.00000001;
  DMax := DMax+0.00000001;
  XMin := XMin-0.00000001;
  DMin := DMin-0.00000001;
  XAve := (XMax-XMin)/10;
  DAve := (DMax-DMin)/10;

  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    for j:=low(A3D) to High(A3D) do
    for k:=low(A3D[j]) to High(A3D[j]) do
    Begin
      X := KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]);
      D := KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]);
      if ((X >= (XMin+XAve*j)) and (X <= (XMin+XAve*(j+1))) and
          (D >= (DMin+DAve*k)) and (D <= (DMin+DAve*(k+1))))Then
           inc(A3D[j,k]);
    End;
  End;
  for i:=low(A3D) to High(A3D) do
  for j:=low(A3D[i]) to High(A3D[i]) do
    // if (A3D[j,i]<>0) Then
    // H3D.AddXYZ(XMin+XAve*i,A3D[j,i],DMin+DAve*j,'',H3D.StartColor);
    H3D.AddXYZ(i,A3D[j,i],j);
end;

procedure TF_D0201.AddDualChart;
begin
  AddCSC;
  AddH3D;
End;

procedure TF_D0201.AddSingleCharts;
var
  i,j : Integer;
  DT : TDateTime;
  S1 : String;
  R : Real;
  Mean : Real;
  Subt : Real;
  RDat : array of Double;
  HDat : array[0..9] of Integer;
  HMin : Double;
  HMax : Double;
  HAve : Double;
  LBDt : TStringList;
begin

  LBDt := TStringList.Create;
  LBDt .Clear;

  ODt  .Clear;
  HDt  .Clear;
  BDt  .Clear;

  XDt  .Clear;
  XSU  .Clear;
  XSL  .Clear;
  XMean.Clear;
  X3U  .Clear;
  X3L  .Clear;

  MDt  .Clear;
  MMean.Clear;
  M3U  .Clear;

  for i := low(HDat) to High(HDat) do HDat[i] := 0;
  HMax := KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,6]);
  HMin := KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,7]);
  HAve := (HMax-HMin)/(High(HDat)+1);
  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    For j := low(HDat) to High(HDat) do
      if ((KC_StrToFloat(F_D02.SG01.Cells[CB_Type.ItemIndex+8,i])-0.0000001)<
          (HMin+(j+1)*HAve)) Then
      Begin
        inc(HDat[j]);
        Break;
      End;
    S1 := F_D02.SG01.Cells[01,i];
    DT := KC_B2Day(copy(S1,1,8))+KC_B2Time(copy(S1,9,6));
    ODt .AddXY(DT,KC_StrToFloat (F_D02.SG01.Cells[CB_Type.ItemIndex+8,i]),'',clBlue);
    XDt .AddXY( i,KC_StrToFloat (F_D02.SG01.Cells[CB_Type.ItemIndex+8,i]),'',clBlue);
    R := KC_StrToFloat(F_D02.SG01.Cells[CB_Type.ItemIndex+8,i]);
    LBDt.Add  (KC_FillCharBefore(Format('%1.5f', [R]),50,' '));
    if (i<>1) Then
    Begin
      Subt := abs(KC_StrToFloat(F_D02.SG01.Cells[CB_Type.ItemIndex+8,i]) -
                  KC_StrToFloat(F_D02.SG01.Cells[CB_Type.ItemIndex+8,i-1]));
      SetLength(RDat, i-1);
      RDat[i-2] := Subt;
      MDt  .AddXY( i,Subt,'',clBlue);
    End;
  End;

  Mean := KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,1]);
  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    MMean.AddXY( i,Math.Mean(RDat),'',clBlack);
    M3U  .AddXY( i,Math.Mean(RDat)+3*KC_StdDev(RDat),'',clBlack);

    XSU  .AddXY( i,KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,2]),'',clRed);
    XSL  .AddXY( i,KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,3]),'',clRed);
    XMean.AddXY( i,Mean,'',clRed);

    X3U  .AddXY( i,KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,5])+3*KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,8]),'',clBlack);
    X3L  .AddXY( i,KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,5])-3*KC_StrToFloat(F_D02.SG00.Cells[CB_Type.ItemIndex+8,8]),'',clBlack);
  End;
  For j := low(HDat) to High(HDat) do
      HDt.AddXY( (HMin+(j+1)*HAve),HDat[j],'',clRed);

  LBDt.Sort;
  For i:=LBDt.Count-1 downto 0 do
    if (POS('-',LBDt.Strings[i]) <> 0) Then
      BDt.Add(KC_StrToFloat(Trim(LBDt.Strings[i])),'',clBlue);

  For i:=0 to LBDt.Count-1 do
    if (POS('-',LBDt.Strings[i]) =  0) Then
      BDt.Add(KC_StrToFloat(Trim(LBDt.Strings[i])),'',clBlue);

  LBDt .Free;
end;

procedure TF_D0201.FormShow(Sender: TObject);
begin
  SetCB(CB_Type);
  SetCB(CB_Item01);
  SetCB(CB_Item02);
  SetSeries;
  AddSingleCharts;
  AddDualChart
end;

procedure TF_D0201.CB_TypeChange(Sender: TObject);
begin
  AddSingleCharts;
end;

procedure TF_D0201.CB_Item01Change(Sender: TObject);
begin
  AddDualChart;
end;

procedure TF_D0201.CH3DDblClick(Sender: TObject);
begin
  EditChart(F_D0201,TChart(Sender));
end;

procedure TF_D0201.CH3DGetAxisLabel(Sender: TChartAxis;
  Series: TChartSeries; ValueIndex: Integer; var LabelText: String);
var
  i : integer;
  XMin,XMax,XAve : Real;
  DMin,DMax,DAve : Real;
begin
  XMax:= -9999999;
  DMax:= -9999999;
  XMin:=  9999999;
  DMin:=  9999999;
  For i := 1 To (F_D02.SG01.RowCount-1) do
  Begin
    XMax := max(XMax,KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]));
    DMax := max(DMax,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
    XMin := min(XMin,KC_StrToFloat(F_D02.SG01.Cells[CB_Item01.ItemIndex+8,i]));
    DMin := min(DMin,KC_StrToFloat(F_D02.SG01.Cells[CB_Item02.ItemIndex+8,i]));
  End;
  XAve := (XMax-XMin)/10;
  DAve := (DMax-DMin)/10;
  if (Sender = CH3D.BottomAxis) Then LabelText := format('%2.2f',[(KC_StrToInt(LabelText)*XAve+XMin)]);
  if (Sender = CH3D.DepthAxis ) Then LabelText := format('%2.2f',[(KC_StrToInt(LabelText)*DAve+DMin)]);
end;

end.


