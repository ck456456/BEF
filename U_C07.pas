unit U_C07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, CIM_Grid;

type
  TF_C07 = class(TForm)
    P_Main: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    CB_TYPE: TComboBox;
    Panel6: TPanel;
    E_BRun: TEdit;
    E_ERun: TEdit;
    B_Go: TButton;
    SG01: TCIM_Grid;
    procedure CB_TYPEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure B_GoClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SG01INI;
    procedure SG01Snd;
    procedure OpenF16;
  public
    { Public declarations }
  end;

var
  F_C07: TF_C07;

implementation

uses U_KcPub, U_D, U_F, U_V06;

{$R *.dfm}

procedure TF_C07.CB_TYPEChange(Sender: TObject);
begin
  E_BRun.Visible := (CB_TYPE.ItemIndex<>0);
  E_ERun.Visible := (CB_TYPE.ItemIndex<>0);
end;

procedure TF_C07.SG01INI;
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
  SG01.Cells[11,0] := 'QANote'; //
  SG01.AutoSize;
end;

procedure TF_C07.FormShow(Sender: TObject);
begin
  CB_TYPEChange(Sender);
  SG01INI;
end;

procedure TF_C07.OpenF16;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFF16 With (INDEX(BEFF16_101)) Where BEF16101 = ''2'' Order by BEF16001';
  if (CB_TYPE.ItemIndex=1) Then
     SQL := 'SELECT * FROM BEFF16 With (INDEX(PK_BEFF16)) Where BEF16001 >= '''+E_BRun.Text+
                                                         ''' and BEF16001 <= '''+E_ERun.Text+
                                                        'z'' Order by BEF16001';
  KC_T3Close(D.F16,D.SC);
  D.F16.CommandText := SQL;
  KC_T3OPEN(D.F16,D.SC);
  D.F16.First;
end;

procedure TF_C07.SG01Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  While not D.F16.Eof do
  Begin
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
    SG01.Cells[11,i] :=          D.F16.FieldByName('BEF16499').ASString;
    D.F16.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_C07.B_GoClick(Sender: TObject);
begin
  OpenF16;
  SG01Snd;
end;

procedure TF_C07.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.RunningToColor(Cells[ACol,ARow]);
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

procedure TF_C07.SG01DblClick(Sender: TObject);
begin
  F_V06 := TF_V06.Create(Application);
  try
     F_V06.Run := SG01.Cells[01,SG01.Row];
     F_V06.ShowModal;
  finally
     F_V06.Free;
  end;
  OpenF16;
  SG01Snd;
end;

end.


