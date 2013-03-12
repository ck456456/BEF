unit U_V13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, CIM_Grid, ExtCtrls, DB;

type
  TF_V13 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    B_Excel: TButton;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel4: TPanel;
    SG01: TCIM_Grid;
    SG02: TCIM_Grid;
    L_010: TLabel;
    Label2: TLabel;
    CB_013: TComboBox;
    B_Save: TButton;
    procedure FormShow(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_SaveClick(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    procedure CB013Ld;
    procedure SG01INI;
    procedure SG02INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure OpenG19;
    procedure UPData(TSG : TCIM_Grid);
  public
    { Public declarations }
  end;

var
  F_V13: TF_V13;

implementation

uses U_KcPub, U_D, U_F;

{$R *.dfm}

procedure TF_V13.OpenG19;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_101)) Where BEF19101 = ''3'' Order by BEF19010,BEF19011';
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := SQL;
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_V13.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := '棧板號';    //
  SG02.Cells[01,0] := '倉別';      //
  SG02.AutoSize;
end;

procedure TF_V13.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := '棧板號';     //
  SG01.Cells[01,0] := '倉別';       //
  SG01.Cells[02,0] := '產品別';     //
  SG01.Cells[03,0] := '成品料號';   //
  SG01.Cells[04,0] := 'Run no';     //
  SG01.Cells[05,0] := '等級';       //
  SG01.Cells[06,0] := 'PET寬幅';    //
  SG01.Cells[07,0] := '成型寬幅';   //
  SG01.Cells[08,0] := '長度m';      //
  SG01.Cells[09,0] := '長度m2';     //
  SG01.Cells[10,0] := '重量(kg)';   //
  SG01.Cells[11,0] := '備註';       //
  SG01.AutoSize;
end;

procedure TF_V13.CB013Ld;
begin
  CB_013.Clear;
  CB_013.Items.Add('');
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
end;

procedure TF_V13.SG01Snd;
var
  i : integer;
  f1,f2 : Real;
begin
  i := 1;
  D.G19.First;
  KC_SGClear(1,SG01);
  While not D.G19.Eof do
  Begin
    D.OpenF16(D.G19.FieldByName('BEF19001').AsString);
    D.OpenF02(D.F16.FieldByName('BEF16202').AsString);
    D.F05.Locate('BEF05001',D.G19.FieldByName('BEF19003').AsString, [loCaseInsensitive]);
    f1 := KC_StrToFloat(D.G19.FieldByName('BEF19502').AsString);
    f2 := KC_StrToFloat(D.G19.FieldByName('BEF19501').AsString);
    SG01.Cells[00,i] := D.G19.FieldByName('BEF19010').AsString; // '棧板號';
    SG01.Cells[01,i] := D.G19.FieldByName('BEF19013').AsString; // '倉別';
    SG01.Cells[02,i] := D.G19.FieldByName('BEF19002').AsString; // '產品別';
    SG01.Cells[03,i] := D.F05.FieldByName('BEF05008').AsString; // '成品料號';
    SG01.Cells[04,i] := D.G19.FieldByName('BEF19001').AsString+
                        D.G19.FieldByName('BEF19007').AsString; // 'Run no';
    SG01.Cells[05,i] := D.F05.FieldByName('BEF05003').AsString; // '等級';

    SG01.Cells[06,i] := D.F02.FieldByName('BEF02003').AsString; // 'PET寬幅';

    SG01.Cells[07,i] := D.G19.FieldByName('BEF19502').AsString; // '成型寬幅';
    SG01.Cells[08,i] := D.G19.FieldByName('BEF19501').AsString; // '長度m';
    SG01.Cells[09,i] := format('%0.0f',[f1*f2/1000]);           // '長度m2';
    SG01.Cells[10,i] := D.G19.FieldByName('BEF19012').AsString; // '重量(kg)';
    // SG01.Cells[10,i] := D.G19.FieldByName('').AsString;      // '備註';
    SG01.Cells[12,i] := D.G19.FieldByName('BEF19003').AsString; // '產品別';
    SG01.Cells[13,i] := D.F05.FieldByName('BEF05001').AsString; // '產品別';
    SG01.Cells[14,i] := D.G19.FieldByName('BEF19001').AsString+#255+
                        D.G19.FieldByName('BEF19007').AsString+#255+
                        D.G19.FieldByName('BEF19500').AsString;
    D.G19.Next;
    inc(i);
  End;
  SG01.RowCount := iif(i=1,2,i);
  SG01.AutoSize;
end;

procedure TF_V13.SG02Snd;
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

procedure TF_V13.UPData(TSG : TCIM_Grid);
begin
  L_010.Caption := TSG.Cells[00,TSG.Row];
 CB_013.Text    := TSG.Cells[01,TSG.Row];
end;

procedure TF_V13.B_ExcelClick(Sender: TObject);
var
  W : Variant;
  i,j,k : integer;
begin
  KC_CopyToTemp(F.WorkDir,'V13.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\V13.xls');
  W := V.Workbooks[1].WorkSheets['Data'];
  k := 1;
  For j:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[1,j] =  '') then Continue;
    for i:=0 to SG01.ColCount-1 do
    Begin
      if (SG01.Cells[i,j] <> '') then
        W.Cells[k+1,i+1].Value := SG01.Cells[i,j];
    End;
    inc(k);
  End;
end;

procedure TF_V13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_V13.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UPData(TCIM_Grid(Sender));
end;

procedure TF_V13.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  UPData(TCIM_Grid(Sender));
end;

procedure TF_V13.B_SaveClick(Sender: TObject);
var
  i : integer;
  S,SQL : String;
begin
  if (MessageDlg('Are You Right?', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  for i:=1 to SG01.RowCount-1 do
  Begin
    if (SG01.Cells[0,i]='') Then Continue;
    if (SG01.Cells[0,i]<>L_010.Caption) Then Continue;
    S := SG01.Cells[14,i];
    SQL := 'Update BEFG19 Set BEF19013 = '''+CB_013.Text+
                    ''' Where BEF19001 = '''+KC_GetSubStr(#255,S,1)+
                      ''' and BEF19007 = '''+KC_GetSubStr(#255,S,2)+
                      ''' and BEF19500 = '''+KC_GetSubStr(#255,S,3)+'''';
    KC_T2ExecSQL(SQL,D.FCmd);
  End;
  OpenG19;
  SG01Snd;
  SG02Snd;
end;

procedure TF_V13.FormShow(Sender: TObject);
begin
  D.OpenF22;
  OpenG19;
  CB013Ld;
  SG01INI;
  SG02INI;
  SG01Snd;
  SG02Snd;
  UPData(SG02);
end;

end.

