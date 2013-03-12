unit U_D0301;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, TeeProcs, Chart, TeeComma, ExtCtrls, ComCtrls,
  TabNotBk;

type
  TF_D0301 = class(TForm)
    TN: TTabbedNotebook;
    Panel5: TPanel;
    TeeCommander1: TTeeCommander;
    Chart1: TChart;
    T00: TBarSeries;
    T01: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SL : TStringList;
    procedure ChartClear;
    procedure AddSLTPar;
    procedure AddTPar;
  public
    { Public declarations }
  end;

var
  F_D0301: TF_D0301;

implementation

uses U_KcPub,U_D03;

{$R *.dfm}

procedure TF_D0301.ChartClear;
begin
  T00.Clear;
  T01.Clear;
end;

procedure TF_D0301.AddSLTPar;
var
  i,j : integer;
  Qty : integer;
begin
  SL.Clear;
  For i := 8 to F_D03.SG01.ColCount-1 do
  Begin
    Qty := 0;
    For j := 1 to F_D03.SG01.RowCount-1 do
      if (F_D03.SG01.Cells[i,j]='NG') Then inc(Qty);
    if (Qty = 0) Then Continue;
    SL.Add(KC_IntFillChar(Qty,10,'0')+#255+F_D03.SG01.Cells[i,0]);
  End;
  SL.Sort;
End;

procedure TF_D0301.AddTPar;
var
  i,m,Sum : Integer;
begin
  Sum := 0;
  m := 0;
  For i := (SL.Count-1) downto 0 do
    Sum := Sum+KC_StrToInt(KC_GetSubStr(#255,SL.Strings[i],1));

  For i := (SL.Count-1) downto 0 do
  Begin
    m := m + KC_StrToInt(KC_GetSubStr(#255,SL.Strings[i],1));
    T00.AddXY((SL.Count-1)-i,KC_StrToInt(KC_GetSubStr(#255,SL.Strings[i],1)),KC_GetSubStr(#255,SL.Strings[i],3),T00.SeriesColor);
    T01.AddXY((SL.Count-1)-i,                                    (m/Sum)*100,KC_GetSubStr(#255,SL.Strings[i],3),T01.SeriesColor);
  End;
end;

procedure TF_D0301.FormShow(Sender: TObject);
begin
  SL := TStringList.Create;
  ChartClear;
  AddSLTPar;
  AddTPar;
end;

procedure TF_D0301.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SL.Free;
end;

end.

