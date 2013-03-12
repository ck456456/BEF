unit U_C09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, CIM_Grid, StdCtrls, ExtCtrls, Menus, DB;

type
  TF_C09 = class(TForm)
    P_Main: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    CB_013: TComboBox;
    Panel3: TPanel;
    SG02: TCIM_Grid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    SG01: TCIM_Grid;
    procedure FormShow(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CB_013Change(Sender: TObject);
    procedure SG01DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CB013Ld;
    procedure SG01INI;
    procedure SG02INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure OpenG19;
  public
    { Public declarations }
  end;

var
  F_C09: TF_C09;

implementation

uses U_D, U_KcPub, U_F, U_V10, U_V11;

{$R *.dfm}

procedure TF_C09.OpenG19;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_101)) Where BEF19101 = ''9'' Order by BEF19010,BEF19011';
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := SQL;
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C09.SG01Snd;
var
  i : integer;
  f1,f2 : Real;
begin
  i := 1;
  KC_SGClear(1,SG01);
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if((CB_013.ItemIndex <> 0) and
       (CB_013.Text<>D.G19.FieldByName('BEF19013').AsString)) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19502').AsString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19501').AsString);
    SG01.Cells[00,i] := D.G19.FieldByName('BEF19010').AsString; // '棧板號';
    SG01.Cells[01,i] := D.G19.FieldByName('BEF19013').AsString; // 倉別
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').AsString; // '產品別';
    SG01.Cells[03,i] := D.F05.FieldByName('BEF05008').AsString; // '成品料號';
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19001').AsString+
                        D.G19.FieldByName('BEF19007').AsString; // 'Run no';
    SG01.Cells[05,i] := D.F05.FieldByName('BEF05003').AsString; // '等級';

    SG01.Cells[06,i] := D.G19.FieldByName('BEF19502').AsString; // '成型寬幅';
    SG01.Cells[07,i] := D.G19.FieldByName('BEF19501').AsString; // '長度m';
    SG01.Cells[08,i] := format('%0.0f',[f1*f2/1000]); // '長度m2';
    SG01.Cells[09,i] := D.G19.FieldByName('BEF19012').AsString; // '重量(kg)';
    //SG01.Cells[10,i] := D.G19.FieldByName('').AsString; // '備註';
    SG01.Cells[11,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);//Running';;       // BEF19101
    SG01.Cells[12,i] := D.G19.FieldByName('BEF19001').AsString+#255+
                        D.G19.FieldByName('BEF19007').AsString+#255+
                        D.G19.FieldByName('BEF19500').AsString; // 'Run no';
    SG01.Cells[13,i] := D.F05.FieldByName('BEF05001').AsString; // '產品別';
    SG01.Cells[14,i] := D.F05.FieldByName('BEF05001').AsString; // '產品別';
    D.G19.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_C09.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := '棧板號';    //
  SG02.Cells[01,0] := '倉別';      //
  SG02.AutoSize;
end;

procedure TF_C09.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '棧板號';     //
  SG01.Cells[01,0] := '倉別';       //
  SG01.Cells[02,0] := '產品別';     //
  SG01.Cells[03,0] := '成品料號';   //
  SG01.Cells[04,0] := 'Run no';     //
  SG01.Cells[05,0] := '等級';       //
  SG01.Cells[06,0] := '成型寬幅';   //
  SG01.Cells[07,0] := '長度m';      //
  SG01.Cells[08,0] := '長度m2';     //
  SG01.Cells[09,0] := '重量(kg)';   //
  SG01.Cells[10,0] := '備註';       //
  SG01.AutoSize;
end;

procedure TF_C09.CB013Ld;
begin
  CB_013.Clear;
  CB_013.Items.Add('all');
  D.F22.First;
  While not D.F22.Eof do
  Begin
    if (D.F22.FieldByName('BEF22002').AsString <> '成品') Then
    Begin
      D.F22.Next;
      Continue;
    End;
    CB_013.Items.Add(D.F22.FieldByName('BEF22001').AsString);
    D.F22.Next;
  End;
  CB_013.ItemIndex := 0;
end;

procedure TF_C09.SG02Snd;
var
  S1,Pno : String;
  i : integer;
begin
  i := 1;
  D.G19.First;
  Pno := '@.@';
  KC_SGClear(1,SG02);
  While not D.G19.Eof do
  Begin
    if((CB_013.ItemIndex <> 0) and
       (CB_013.Text<>D.G19.FieldByName('BEF19013').AsString)) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    S1 := D.G19.FieldByName('BEF19010').AsString+#255+D.G19.FieldByName('BEF19013').AsString;
    if (Pno=S1) then
    Begin
      D.G19.Next;
      Continue;
    End;
    SG02.Cells[00,i] := D.G19.FieldByName('BEF19010').AsString; // '棧板號';
    SG02.Cells[01,i] := D.G19.FieldByName('BEF19013').AsString; // '倉別';
    Pno := S1;
    D.G19.Next;
    inc(i);
  End;
  SG02.RowCount := iif(i=1,2,i);
  SG02.AutoSize;
end;

procedure TF_C09.FormShow(Sender: TObject);
begin
  D.OpenF05;
  D.OpenF22;
  OpenG19;
  CB013Ld;
  SG01INI;
  SG02INI;
  SG01Snd;
  SG02Snd;
end;

procedure TF_C09.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.StationToColor(Cells[ACol,ARow]);
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

procedure TF_C09.CB_013Change(Sender: TObject);
begin
  SG01Snd;
  SG02Snd;
end;

procedure TF_C09.SG01DblClick(Sender: TObject);
begin
  F_V10 := TF_V10.Create(Application);
  try
     F_V10.Run := SG01.Cells[12,SG01.Row];
     F_V10.ShowModal;
  finally
     F_V10.Free;
  end;
  OpenG19;
  SG01Snd;
  SG02Snd;
end;

end.



