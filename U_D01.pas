unit U_D01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Menus;

type
  TF_D01 = class(TForm)
    P_Main: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_OK: TBitBtn;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBType: TComboBox;
    Panel1: TPanel;
    SG01: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    E_BDat: TEdit;
    E_EDat: TEdit;
    Label6: TLabel;
    CB_BLn: TComboBox;
    CB_ELn: TComboBox;
    CB_BWNo: TComboBox;
    CB_EWNo: TComboBox;
    CB_BPNo: TComboBox;
    CB_EPNo: TComboBox;
    CB_BPro: TComboBox;
    CB_EPro: TComboBox;
    PopupMenu: TPopupMenu;
    Delete1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure CBTypeChange(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadLne(S1 : String);
    procedure PTypeLd(CB :TComboBox);
    procedure PWorkLd(CB :TComboBox);
    procedure PPrdtLd(CB :TComboBox);
    procedure PrcssLd(CB :TComboBox);
    procedure OpenF15;
    procedure OpenWF15;
    procedure OpenWF05;
    procedure OpenWF10;
    procedure SG01Ini;
    procedure SG01Snd;
  public
    { Public declarations }
  end;

var
  F_D01: TF_D01;

implementation

uses U_D, U_KcPub, U_F, U_V01;

{$R *.dfm}

procedure TF_D01.SG01Ini;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Working No';  //*BEF15001    A(24)
  SG01.Cells[01,0] := '目標料號';    // BEF15002    A(12)
  SG01.Cells[02,0] := 'Process';     // BEF15004    A(20)
  SG01.Cells[03,0] := 'Line';        // BEF15005
  SG01.Cells[04,0] := 'Running';         // BEF15101    A(01)
  SG01.Cells[05,0] := '成型站';      // BEF15102    A(01)
  SG01.Cells[06,0] := '褙膜站';      // BEF15103    A(01)
  SG01.Cells[07,0] := '庫房站';      // BEF15104    A(01)
  SG01.Cells[08,0] := 'Begin  Date'; // BEF15201    A(08)
  SG01.Cells[09,0] := 'Finish Date'; // BEF15202    A(08)
  SG01.Cells[10,0] := 'Note';        // BEF15099    A(64)
  KC_ColAutoSize(SG01);
end;

procedure TF_D01.SG01Snd;
var
  i : integer;
begin
  KC_SGClear(1,SG01);
  D.F15.First;
  i := 1;
  While not D.F15.Eof do
  Begin
    if (CBType.ItemIndex <> 0) and (D.F15.FieldByName('BEF15002').AsString <> CBType.Text) Then
    Begin
      D.F15.Next;
      Continue;
    End;
    SG01.Cells[00,i] :=       D.F15.FieldByName('BEF15001').AsString;
    SG01.Cells[01,i] :=       D.F15.FieldByName('BEF15002').AsString;
    SG01.Cells[02,i] :=       D.F15.FieldByName('BEF15004').AsString;
    SG01.Cells[03,i] :=       D.F15.FieldByName('BEF15005').AsString;
    SG01.Cells[04,i] := F.Running00(D.F15.FieldByName('BEF15101').ASSTRING);
    SG01.Cells[05,i] := F.Running00(D.F15.FieldByName('BEF15102').ASSTRING);
    SG01.Cells[06,i] := F.Running00(D.F15.FieldByName('BEF15103').ASSTRING);
    SG01.Cells[07,i] := F.Running00(D.F15.FieldByName('BEF15104').ASSTRING);
    SG01.Cells[08,i] :=       D.F15.FieldByName('BEF15201').AsString;
    SG01.Cells[09,i] :=       D.F15.FieldByName('BEF15202').AsString;
    SG01.Cells[10,i] :=       D.F15.FieldByName('BEF15099').AsString;
    inc(i);
    D.F15.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
end;

procedure TF_D01.PrcssLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F10.First;
  While not D.F10.Eof do
  Begin
    CB.Items.Add(D.F10.FieldByName('BEF10002').AsString);
    D.F10.Next;
  End;
end;

procedure TF_D01.PPrdtLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F05.First;
  While not D.F05.Eof do
  Begin
    CB.Items.Add(D.F05.FieldByName('BEF05001').AsString);
    D.F05.Next;
  End;
end;

procedure TF_D01.PWorkLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F15.First;
  While not D.F15.Eof do
  Begin
    CB.Items.Add(D.F15.FieldByName('BEF15001').AsString);
    D.F15.Next;
  End;
end;

procedure TF_D01.PTypeLd(CB :TComboBox);
begin
  D.OpenF01('T');
  CB.Items.Clear;
  CB.Items.Add('all');
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
  CB.ItemIndex := iif(CB.Items.Count=0,-1,0);
end;

procedure TF_D01.OpenWF10;
begin
  KC_T3Close(D.F10,D.SC);
  D.F10.CommandText := 'SELECT BEF10002 FROM BEFF10 Order by BEF10002';
  KC_T3OPEN(D.F10,D.SC);
  D.F10.First;
end;

procedure TF_D01.OpenWF05;
begin
  KC_T3Close(D.F05,D.SC);
  D.F05.CommandText := 'SELECT BEF05001 FROM BEFF05 Where BEF05002='''+CBType.Text+''' Order by BEF05001';
  KC_T3OPEN(D.F05,D.SC);
  D.F05.First;
end;

procedure TF_D01.OpenWF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT BEF15001 FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D01.OpenF15;
var
  SQL : String;
begin
  SQL := 'SELECT * FROM BEFF15 Where BEF15002 >= '''+CB_BPNo.Text+
                             ''' and BEF15002 <= '''+CB_EPNo.Text+
                            'z'' and BEF15004 >= '''+CB_BPro.Text+
                             ''' and BEF15004 <= '''+CB_EPro.Text+
                            'z'' and BEF15005 >= '''+CB_BLn.Text+
                             ''' and BEF15005 <= '''+CB_ELn.Text+
                            'z'' and BEF15201 >= '''+E_BDat.Text+
                             ''' and BEF15201 <= '''+E_EDat.Text+
                            'z'' and BEF15001 >= '''+CB_BWNo.Text+
                             ''' and BEF15001 <= '''+CB_EWNo.Text+
                       'z'' Order by BEF15001';
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := SQL;
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_D01.LoadLne(S1 : String);
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

procedure TF_D01.FormShow(Sender: TObject);
begin
  OpenWF15;   PWorkLd(CB_BWNo);   PWorkLd(CB_EWNo);
  OpenWF10;   PrcssLd(CB_BPro);   PrcssLd(CB_EPro);
  PTypeLd(CBType);
  LoadLne('成型站');
  CBTypeChange(Sender);
  SG01Ini;
end;

procedure TF_D01.B_OKClick(Sender: TObject);
begin
  SG01INI;
  OpenF15;
  SG01Snd;
end;

procedure TF_D01.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := F.RunningToColor(SG01.Cells[ACol,ARow]);
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

procedure TF_D01.SG01DblClick(Sender: TObject);
begin
  if not (SG01.Col in [4,5,6,7,8]) Then Exit;
  F_V01 := TF_V01.Create(Application);
  case SG01.Col of
    4 : F_V01.iStation := 0;
    5 : F_V01.iStation := 1;
    6 : F_V01.iStation := 2;
    7 : F_V01.iStation := 3;
    8 : F_V01.iStation := 4;
  end;
  F_V01.PType    := SG01.Cells[       1,SG01.Row];
  F_V01.Working  := SG01.Cells[       0,SG01.Row];
  F_V01.Running      := SG01.Cells[SG01.Col,SG01.Row];
  F_V01.BDate    := SG01.Cells[       9,SG01.Row]+'-'+
                    SG01.Cells[      10,SG01.Row];
  F_V01.ShowModal;
  F_V01.Free;
  OpenF15;
  SG01Snd;
end;

procedure TF_D01.CBTypeChange(Sender: TObject);
begin
  OpenWF05; PPrdtLd(CB_BPNo); PPrdtLd(CB_EPNo);
end;

procedure TF_D01.Delete1Click(Sender: TObject);
var
  SQL,PassWord : String;
  TSG : TStringGrid;
  ACol, ARow: Integer;
begin
  TSG := TStringGrid(PopupMenu.PopupComponent);
  TSG.MouseToCell(TSG.ScreenToClient(PopupMenu.PopupPoint).X,
                  TSG.ScreenToClient(PopupMenu.PopupPoint).Y,
                  ACol,
                  ARow);
  TSG.Col := ACol;
  TSG.Row := ARow;
  if (PopupMenu.PopupComponent.Name <> 'SG01') Then Exit;
  if not InputQuery('Input Box', 'Prompt', PassWord) then exit;
  if not (PassWord = '890589') Then exit;
  SQL := 'Delete BEFF15 Where BEF15001 = '''+SG01.Cells[0,SG01.Row]+'''';
  KC_T3ExecSQL(SQL,D.SC);
  B_OKClick(Sender);
end;

end.


