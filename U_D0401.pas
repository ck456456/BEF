unit U_D0401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, TeeProcs, Chart, TeeComma, ExtCtrls, ComCtrls,
  TabNotBk;

type
  TF_D0401 = class(TForm)
    TN: TTabbedNotebook;
    Panel1: TPanel;
    TeeCommander2: TTeeCommander;
    Chart2: TChart;
    SOK: TBarSeries;
    SNG: TBarSeries;
    SYd: TLineSeries;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ChartClear;
    procedure AddYield;
  public
    { Public declarations }
  end;

var
  F_D0401: TF_D0401;

implementation

uses U_KcPub, U_D04;

{$R *.dfm}

procedure TF_D0401.ChartClear;
begin
  SOK.Clear;
  SNG.Clear;
  SYd.Clear;
end;

procedure TF_D0401.AddYield;
var
  i,j : integer;
  ok,ng : Real;
  S : String;
  S1 : String;
begin
  j := 1;
  case F_D04.CB_Type.ItemIndex of
    0 : S := copy(F_D04.SG01.Cells[0,1],1,8);            // By Date
    1 : S := F_D04.SG01.Cells[0,1];                      // By Working no
    2 : S := KC_GetSubStr(#255,F_D04.SG01.Cells[0,1],1); // By Run
  end;
  ok := 0;
  ng := 0;
  For i := 1 to F_D04.SG01.RowCount do
  Begin
    case F_D04.CB_Type.ItemIndex of
      0 : S1 := copy(F_D04.SG01.Cells[0,i],1,8);
      1 : S1 := F_D04.SG01.Cells[0,i];
      2 : S1 := KC_GetSubStr(#255,F_D04.SG01.Cells[0,i],1);
    end;
    if (S <> S1) Then
    Begin
      SOK.AddXY(j,ok,S,SOK.SeriesColor);
      SNG.AddXY(j,ng,S,SNG.SeriesColor);
      if ((ok+ng) <> 0) Then
      SYd.AddXY(j,(ok/(ok+ng))*100,S,SYd.SeriesColor);
      case F_D04.CB_Type.ItemIndex of
        0 : S := copy(F_D04.SG01.Cells[0,i],1,8);
        1 : S := F_D04.SG01.Cells[0,i];
        2 : S := KC_GetSubStr(#255,F_D04.SG01.Cells[0,i],1);
      end;
      ok := 0;
      ng := 0;
      inc(j);
    End;
    ok := ok + KC_StrToFloat(F_D04.SG01.Cells[14,i])+
               KC_StrToFloat(F_D04.SG01.Cells[15,i]);
    ng := ng + KC_StrToFloat(F_D04.SG01.Cells[16,i])+
               KC_StrToFloat(F_D04.SG01.Cells[17,i]);
  End;
end;

procedure TF_D0401.FormShow(Sender: TObject);
begin
  ChartClear;
  AddYield;
end;

end.

