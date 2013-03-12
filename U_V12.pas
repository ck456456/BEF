unit U_V12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, CIM_Grid, ExtCtrls, StdCtrls, Buttons;

type
  TF_V12 = class(TForm)
    SG01: TCIM_Grid;
    Panel1: TPanel;
    B_Excel: TBitBtn;
    B_Close: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    V : Variant;
    procedure SG01INI;
    procedure SG01Snd;
  public
    { Public declarations }
    Pno : String;
  end;

var
  F_V12: TF_V12;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V12.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Running';  // BEF16101
  SG01.Cells[01,0] := 'Run';  // BEF16001
  SG01.Cells[02,0] := '倉別'; // BEF16008
  SG01.Cells[03,0] := '級別'; // BEF16308
  SG01.Cells[04,0] := '寬幅'; // BEF16304
  SG01.Cells[05,0] := '使用'; // BEF16302
  SG01.Cells[06,0] := '收料'; // BEF16303
  SG01.Cells[07,0] := '損耗'; // BEF16306
  SG01.Cells[08,0] := '未褙'; // BEF16307
  SG01.Cells[09,0] := '首檢良率'; //
  SG01.Cells[10,0] := '尾檢良率'; //
  SG01.Cells[11,0] := '成型Note'; //
  SG01.Cells[12,0] := 'QANote'; //
  SG01.AutoSize;
end;

procedure TF_V12.SG01Snd;
var
  i : integer;
begin
  i := 1;
  D.F16.First;
  KC_SGClear(1,SG01);
  While not D.F16.Eof do
  Begin
    if (D.F16.FieldByName('BEF16004').ASString <> Pno) Then
    Begin
      D.F16.Next;
      Continue;
    End;
    SG01.Cells[00,i] :=  F.Running01(D.F16.FieldByName('BEF16101').ASString); //  Running
    SG01.Cells[01,i] :=          D.F16.FieldByName('BEF16001').ASString;  //  Run';
    SG01.Cells[02,i] :=          D.F16.FieldByName('BEF16008').ASString;  //  級別';
    SG01.Cells[03,i] :=          D.F16.FieldByName('BEF16308').ASString;  //  使用';
    SG01.Cells[04,i] :=          D.F16.FieldByName('BEF16304').ASString;  //  收料';
    SG01.Cells[05,i] :=          D.F16.FieldByName('BEF16302').ASString;  //  損耗';
    SG01.Cells[06,i] :=          D.F16.FieldByName('BEF16303').ASString;
    SG01.Cells[07,i] :=          D.F16.FieldByName('BEF16306').ASString;
    SG01.Cells[08,i] :=          D.F16.FieldByName('BEF16307').ASString;
    SG01.Cells[09,i] :=          D.F16.FieldByName('BEF16309').ASString;
    SG01.Cells[10,i] :=          D.F16.FieldByName('BEF16310').ASString;
    SG01.Cells[11,i] :=          D.F16.FieldByName('BEF16399').ASString;
    SG01.Cells[12,i] :=          D.F16.FieldByName('BEF16499').ASString;
    D.F16.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_V12.FormShow(Sender: TObject);
begin
  SG01INI;
  SG01Snd;
end;

procedure TF_V12.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j : integer;
begin
  KC_CopyToTemp(F.WorkDir,'V12.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\V12.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  For j:=0 to SG01.RowCount-1 do
  for i:=0 to SG01.ColCount-1 do
    if (SG01.Cells[i,j] <> '') then
      W.Cells[j+1,i+1].Value := SG01.Cells[i,j];
end;

procedure TF_V12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

end.
