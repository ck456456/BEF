unit U_C04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Buttons, DB, Math;

type
  TF_C04 = class(TForm)
    P_Main: TPanel;
    Label1: TLabel;
    L_Kind: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    B_B03: TBitBtn;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    SG02: TStringGrid;
    SG01: TStringGrid;
    Panel7: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    E_010T: TEdit;
    E_012T: TEdit;
    E_011T: TEdit;
    Splitter3: TSplitter;
    Panel8: TPanel;
    SG04: TStringGrid;
    Panel10: TPanel;
    SG03: TStringGrid;
    Panel9: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    E_010: TEdit;
    E_011: TEdit;
    E_012: TEdit;
    B_Save: TButton;
    B_Save02: TButton;
    Panel12: TPanel;
    B_Excel: TButton;
    B_B04: TButton;
    procedure FormShow(Sender: TObject);
    procedure B_B03Click(Sender: TObject);
    procedure SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG01DblClick(Sender: TObject);
    procedure SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG02DblClick(Sender: TObject);
    procedure SG01KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG01MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG03KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG04MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SG02KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG02MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure B_SaveClick(Sender: TObject);
    procedure SG03DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure B_Save02Click(Sender: TObject);
    procedure B_ExcelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_B04Click(Sender: TObject);
  private
    { Private declarations }
    V         : Variant;
    procedure OpenF15;
    procedure OpenG19(S1 : String); overload;
    procedure OpnG19B(S1 : String);
    procedure OpenG19(S1,S2 : String); overload;
    procedure SG01INI;
    procedure SG02INI;
    procedure SG03INI;
    procedure SG04INI;
    procedure SG01Snd;
    procedure SG02Snd;
    procedure SG03Snd(TSG : TStringGrid;S1 : String);
    procedure SG04Snd(TSG : TStringGrid;S1 : String);
    procedure SG03UpData;
    procedure SG02UpData;
    function  GetRow(iRow : integer) : integer;
    procedure SaveF05(I1 : Integer;S1,S2,S3 : String);
    procedure SaveF26(I1 : Integer;S1,S2 : String;F1 : Real);
  public
    { Public declarations }
  end;

var
  F_C04: TF_C04;

implementation

uses U_KcPub, U_D, U_F, U_V01, U_V05, U_V13;

{$R *.dfm}

procedure TF_C04.SG02UpData;
var
  S1 : String;
  R1 : Real;
begin
  E_010T.Text := SG04.Cells[0,SG04.Row];
  E_011T.Text := KC_FillCharBefore(IntToStr(GetRow(0)),3,'0');
  D.F05.Locate('BEF05001',VarArrayOf([D.F10.FieldByName('BEF10102').AsString]), [loCaseInsensitive]);
  R1 := KC_StrToFloat(D.F05.FieldByName('BEF05202').AsString)*
        KC_StrToFloat(SG02.Cells[05,SG02.Row])+
        KC_StrToFloat(D.F05.FieldByName('BEF05204').AsString);
  E_012T.Text := Format('%0.2f',[R1]);
end;

procedure TF_C04.SG03UpData;
var
  S1 : String;
begin
  E_010.Text := SG04.Cells[0,SG04.Row];
  E_011.Text := KC_FillCharBefore(IntToStr(SG03.Row),3,'0');
  E_012.Text := '';
  S1 := SG03.Cells[04,SG03.Row];
  if (S1 = '') Then Exit;
  D.G19.Locate('BEF19001;BEF19007',VarArrayOf([KC_GetSubStr(#255,S1,1),KC_GetSubStr(#255,S1,2)]), [loCaseInsensitive]);
  E_012.Text := D.G19.FieldByName('BEF19012').AsString;
end;

procedure TF_C04.OpnG19B(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_010)) Where BEF19010 = '''+S1+''' Order by BEF19010,BEF19011';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C04.OpenG19(S1 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 With (INDEX(BEFG19_005)) Where BEF19005 = '''+S1+''' Order by BEF19010,BEF19011,BEF19001';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C04.OpenF15;
begin
  KC_T3Close(D.F15,D.SC);
  D.F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15101 = ''1'' Order by BEF15001';
  KC_T3OPEN(D.F15,D.SC);
  D.F15.First;
end;

procedure TF_C04.SG01INI;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[00,0] := 'Working No';  //*BEF15001    A(24)
  SG01.Cells[01,0] := '目標料號';    // BEF15002    A(12)
  SG01.Cells[02,0] := 'Process';     // BEF15004    A(20)
  SG01.Cells[03,0] := 'Running';     // BEF15101    A(01)
  SG01.Cells[04,0] := '成型站';      // BEF15102    A(01)
  SG01.Cells[05,0] := '褙膜站';      // BEF15103    A(01)
  SG01.Cells[06,0] := '庫房站';      // BEF15104    A(01)
  SG01.Cells[07,0] := 'Begin  Date'; // BEF15201    A(08)
  SG01.Cells[08,0] := 'Finish Date'; // BEF15202    A(08)
  SG01.Cells[09,0] := 'Note';        // BEF15099    A(64)
  KC_ColAutoSize(SG01);
end;

procedure TF_C04.SG02INI;
begin
  KC_SGClear(0,SG02);
  SG02.Cells[00,0] := 'Running';  // BEF19101
  SG02.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG02.Cells[02,0] := '規格';     // BEF19002
  SG02.Cells[03,0] := '料號';     // BEF19003
  SG02.Cells[04,0] := 'Run';      // BEF19500
  SG02.Cells[05,0] := '分條長度'; // BEF19501
  SG02.Cells[06,0] := '分條寬幅'; // BEF19502
  SG02.Cells[07,0] := '損耗長度'; // BEF19503
  SG02.Cells[08,0] := '損耗寬幅'; // BEF19504
  SG02.Cells[09,0] := '來源';     // BEF19001+BEF19007+BEF19500
  KC_ColAutoSize(SG02);
end;

procedure TF_C04.SG04INI;
begin
  KC_SGClear(0,SG04);
  SG04.Cells[00,0] := 'No';       // BEF19010
  KC_ColAutoSize(SG04);
end;

procedure TF_C04.SG03INI;
begin
  KC_SGClear(0,SG03);
  SG03.Cells[00,0] := 'Running';  // BEF19101
  SG03.Cells[01,0] := '級別';     // BEF19003 目標料號 -> 級別
  SG03.Cells[02,0] := '規格';     // BEF19002
  SG03.Cells[03,0] := '料號';     // BEF19003
  SG03.Cells[04,0] := 'Run';      // BEF19500
  SG03.Cells[05,0] := '分條長度'; // BEF19501
  SG03.Cells[06,0] := '分條寬幅'; // BEF19502
  SG03.Cells[07,0] := '損耗長度'; // BEF19503
  SG03.Cells[08,0] := '損耗寬幅'; // BEF19504
  SG03.Cells[09,0] := '來源';     // BEF19001+BEF19007+BEF19500
  SG03.Cells[10,0] := '工單';     // BEF19005
  KC_ColAutoSize(SG03);
end;

procedure TF_C04.SG01Snd;
var
  i : integer;
begin
  i := 1;
  KC_SGClear(1,SG01);
  D.F15.First;
  While not D.F15.Eof do
  Begin
    if((D.F15.FieldByName('BEF15006').AsString <> 'all') and
       (D.F15.FieldByName('BEF15006').AsString <> '褙膜站'))Then
    Begin
      D.F15.Next;
      Continue;
    End;
    SG01.Cells[00,i] :=         D.F15.FieldByName('BEF15001').AsString;
    SG01.Cells[01,i] :=         D.F15.FieldByName('BEF15002').AsString;
    SG01.Cells[02,i] :=         D.F15.FieldByName('BEF15004').AsString;
    SG01.Cells[03,i] := F.Running00(D.F15.FieldByName('BEF15101').ASSTRING);
    SG01.Cells[04,i] := F.Running00(D.F15.FieldByName('BEF15102').ASSTRING);
    SG01.Cells[05,i] := F.Running00(D.F15.FieldByName('BEF15103').ASSTRING);
    SG01.Cells[06,i] := F.Running00(D.F15.FieldByName('BEF15104').ASSTRING);
    SG01.Cells[07,i] :=         D.F15.FieldByName('BEF15201').AsString;
    SG01.Cells[08,i] :=         D.F15.FieldByName('BEF15202').AsString;
    SG01.Cells[09,i] :=         D.F15.FieldByName('BEF15099').AsString;
    inc(i);
    D.F15.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG01);
End;

function  TF_C04.GetRow(iRow : integer) : integer;
var
  i : integer;
begin
  if (SG03.Cells[04,iRow] = '') Then Exit;
  Result := 1;
  While (SG03.Cells[04,Result] <> '') do
    inc(Result);
End;

procedure TF_C04.SG03Snd(TSG : TStringGrid;S1 : String);
var
  i,i1 : integer;
  f1,f2 : Real;
  SS1,SS2: String;
  CRow : integer;
begin
  if (SG04.Cells[0,SG04.Row] = '') Then
    OpenG19(SG01.Cells[0,SG01.Row])
  else
    OpnG19B(SG04.Cells[0,SG04.Row]);
  i := 1;
  i1 := 1;
  KC_SGClear(1,TSG);
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (S1 <> D.G19.FieldByName('BEF19101').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (SG04.Cells[0,SG04.Row] <> D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS1 := '';
    SS2 := '';
    CRow := max(i,KC_StrToInt(D.G19.FieldByName('BEF19011').ASString));
    i := KC_StrToInt(D.G19.FieldByName('BEF19011').ASString);
    i := GetRow(i);
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    TSG.Cells[00,i] := D.G19.FieldByName('BEF19011').ASString;
    TSG.Cells[01,i] := SS1;
    TSG.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    TSG.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    TSG.Cells[04,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                       D.G19.FieldByName('BEF19007').ASString+#255+
                       D.G19.FieldByName('BEF19500').ASString;
    TSG.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString;
    TSG.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    TSG.Cells[07,i] := D.G19.FieldByName('BEF19503').ASString;
    TSG.Cells[08,i] := D.G19.FieldByName('BEF19504').ASString;
    TSG.Cells[09,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                       D.G19.FieldByName('BEF19007').ASString+#255+
                       D.G19.FieldByName('BEF19201').ASString;
    TSG.Cells[10,i] := D.G19.FieldByName('BEF19005').ASString;
    D.G19.Next;
  End;
  D.F05.Locate('BEF05001',VarArrayOf([D.F10.FieldByName('BEF10102').AsString]), [loCaseInsensitive]);
  CRow := max(2,CRow+1);
  CRow := max(CRow,i+1);
  CRow := max(CRow,KC_StrToInt(D.F05.FieldByName('BEF05203').ASString)+1);
  TSG.RowCount := CRow;
  for i:=1 to CRow-1 do
    if (TSG.Cells[04,i] = '') Then
      TSG.Cells[00,i] := KC_FillCharBefore(IntToStr(i),3,'0');
  KC_ColAutoSize(TSG);
end;

procedure TF_C04.OpenG19(S1,S2 : String);
begin
  KC_T3Close(D.G19,D.SC);
  D.G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19002 = '''+S1+
                                           ''' and BEF19004 = '''+S2+
                                         ''' and ( BEF19101 = ''2'' or BEF19101 = ''5'')'+
                                        ' Order By BEF19001,BEF19007,BEF19500';
  KC_T3OPEN(D.G19,D.SC);
  D.G19.First;
end;

procedure TF_C04.SG02Snd;
var
  i   : integer;
  SS1 : String;
begin
  OpenG19(SG01.Cells[1,SG01.Row],SG01.Cells[2,SG01.Row]);
  i:=1;
  KC_SGClear(1,SG02);
  While not D.G19.Eof do
  Begin
    if D.F05.Locate('BEF05001', VarArrayOf([D.G19.FieldByName('BEF19003').ASString]), [loCaseInsensitive]) Then
      SS1 := D.F05.FieldByName('BEF05003').ASString;
    SG02.Cells[00,i] := F.Station(D.G19.FieldByName('BEF19101').AsString);//Running';;       // BEF19101
    SG02.Cells[01,i] := SS1;
    SG02.Cells[02,i] := D.G19.FieldByName('BEF19002').ASString;
    SG02.Cells[03,i] := D.G19.FieldByName('BEF19003').ASString;
    SG02.Cells[04,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19500').ASString;
    SG02.Cells[05,i] := D.G19.FieldByName('BEF19501').ASString;
    SG02.Cells[06,i] := D.G19.FieldByName('BEF19502').ASString;
    SG02.Cells[07,i] := D.G19.FieldByName('BEF19503').ASString;
    SG02.Cells[08,i] := D.G19.FieldByName('BEF19504').ASString;
    SG02.Cells[09,i] := D.G19.FieldByName('BEF19001').ASString+#255+
                        D.G19.FieldByName('BEF19007').ASString+#255+
                        D.G19.FieldByName('BEF19201').ASString;
    inc(i);
    D.G19.Next;
  End;
  SG02.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(SG02);
end;

procedure TF_C04.SG04Snd(TSG : TStringGrid;S1 : String);
var
  i : integer;
  SS: String;
begin
  i := 1;
  KC_SGClear(1,SG04);
  SS := 'zz';
  D.G19.First;
  While not D.G19.Eof do
  Begin
    if (S1 <> D.G19.FieldByName('BEF19101').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    if (SS=D.G19.FieldByName('BEF19010').ASString) Then
    Begin
      D.G19.Next;
      Continue;
    End;
    SS:=D.G19.FieldByName('BEF19010').ASString;
    TSG.Cells[0,i] :=  SS;     //  'Running';
    D.G19.Next;
    inc(i);
  End;
  TSG.RowCount := iif(i=1,2,i);
  KC_ColAutoSize(TSG);
end;

procedure TF_C04.FormShow(Sender: TObject);
begin
  D.OpenF00;
  D.OpenF05;
  SG01INI;
  SG02INI;
  SG03INI;
  SG04INI;
  OpenF15;
  SG01Snd;
  OpenG19(SG01.Cells[0,SG01.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  SG04Snd(SG04,'3');
  SG02Snd;
  SG03Snd(SG03,'3');
  SG02UpData;
  SG03UpData;
end;

procedure TF_C04.B_B03Click(Sender: TObject);
begin
  FormShow(Sender);
end;

procedure TF_C04.SG01DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C04.SG01DblClick(Sender: TObject);
begin
  case SG01.Col of
    6 : Begin
          F_V01 := TF_V01.Create(Application);
          F_V01.iStation := 3;
          F_V01.PType    := SG01.Cells[01,SG01.Row];
          F_V01.Working  := SG01.Cells[00,SG01.Row];
          F_V01.Running  := SG01.Cells[06,SG01.Row];
          F_V01.BDate    := '-';
          F_V01.ShowModal;
          F_V01.Free;
          OpenF15;
          SG01Snd;
        End;
  end;
end;

procedure TF_C04.SG02DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TF_C04.SG02DblClick(Sender: TObject);
var
  SQL1,SQL2 : String;
  TSG : TStringGrid;
begin
  TSG := TStringGrid(Sender);
  if (TSG.Cells[04,TSG.Row]='') Then Exit;
  (*
  if (KC_GetSubStr(#255,TSG.Cells[TSG.Col,TSG.Row],2)<>'') Then
  Begin
    F_V05 := TF_V05.Create(Application);
    F_V05.Kind := 3;
    F_V05.CB_Station.ItemIndex := 1;
    F_V05.Run  := TSG.Cells[1,TSG.Row];
    if (TSG.Name = 'SG03') Then F_V05.Run  := TSG.Cells[04,TSG.Row];
    F_V05.ShowModal;
    F_V05.Free;
    OpenG19(SG01.Cells[0,SG01.Row]);
    Exit;
  End;
  if (TSG.Name = 'SG02') Then
  Begin
     SQL1 := 'UpDate BEFFG19 Set BEF19101 = ''3' +
                           ''',BEF19010 = '''+E_010T.Text+
                           ''',BEF19011 = '''+E_011T.Text+
                           ''',BEF19012 = '''+E_012T.Text+
                     ''' Where BEF19001 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],1)+
                       ''' and BEF19007 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],2)+
                       ''' and BEF19500 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],3)+'''';
     SQL2 := 'UpDate BEFFF19 Set BEF19101 = ''3' +
                     ''' Where BEF19001 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],1)+
                       ''' and BEF19007 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],2)+'''';
  End;
  *)
  if (TSG.Name = 'SG03') Then
  Begin
     if (SG03.Cells[10,SG03.Row] <> SG01.Cells[00,SG01.Row]) Then
     Begin
       ShowMessage('工單不符 '+SG03.Cells[10,SG03.Row]+'<>'+ SG01.Cells[00,SG01.Row]);
       Exit;
     End;
     SQL1 := 'UpDate BEFG19 Set BEF19101 = ''2'''+
                            ', BEF19010 = '''''+
                            ', BEF19011 = '''''+
                            ', BEF19012 = 0'+
                       ' Where BEF19001 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],1)+
                       ''' and BEF19007 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],2)+
                       ''' and BEF19500 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],3)+'''';
     SQL2 := 'UpDate BEFF19 Set BEF19101 = ''2'''+
                       ' Where BEF19001 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],1)+
                       ''' and BEF19007 = '''+KC_GetSubStr(#255,TSG.Cells[04,TSG.Row],2)+'''';
  End;
  KC_T2ExecSQL(SQL1,D.FCmd);
  KC_T2ExecSQL(SQL2,D.FCmd);
  SaveF05(1,SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row],TSG.Cells[01,TSG.Row]);
  OpenG19(SG01.Cells[0,SG01.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  SG04Snd(SG04,'3');
  SG02Snd;
  SG03Snd(SG03,'3');
  SG02UpData;
  SG03UpData;
end;

procedure TF_C04.SG01KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Key in [VK_UP,VK_DOWN] Then Exit;
  OpenG19(SG01.Cells[0,SG01.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  SG04Snd(SG04,'3');
  SG02Snd;
  SG03Snd(SG03,'3');
  SG02UpData;
  SG03UpData;
end;

procedure TF_C04.SG01MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  OpenG19(SG01.Cells[0,SG01.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  SG04Snd(SG04,'3');
  SG02Snd;
  SG03Snd(SG03,'3');
  SG02UpData;
  SG03UpData;
end;

procedure TF_C04.SG03MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG03UpData;
end;

procedure TF_C04.SG03KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG03UpData;
end;

procedure TF_C04.SG04KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG03Snd(SG03,'3');
  SG03UpData;
end;

procedure TF_C04.SG04MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG03Snd(SG03,'3');
  SG03UpData;
end;

procedure TF_C04.SG02KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SG02UpData;
end;

procedure TF_C04.SG02MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SG02UpData;
end;

procedure TF_C04.B_SaveClick(Sender: TObject);
var
  SQL : String;
begin
  if (SG03.Cells[04,SG03.Row] = '') Then Exit;
  SQL := 'UpDate BEFG19 Set BEF19010 = '''+E_010.Text+
                       ''', BEF19011 = '''+E_011.Text+
                       ''', BEF19012 = '''+E_012.Text+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],2)+
                    ''' and BEF19500 = '''+KC_GetSubStr(#255,SG03.Cells[04,SG03.Row],3)+'''';
  KC_T2ExecSQL(SQL,D.FCmd);
  OpenG19(SG01.Cells[0,SG01.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  SG04Snd(SG04,'3');
  SG03Snd(SG03,'3');
  SG03UpData;
end;

procedure TF_C04.SG03DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CRow : integer;
begin
  CRow := KC_StrToInt(D.F05.FieldByName('BEF05203').ASString);
  if (ARow > CRow) Then
  with Sender as TStringGrid do
  begin
    Canvas.Font .Color := clBlack;
    Canvas.Brush.Color := clBtnFace;
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

procedure TF_C04.SaveF26(I1 : Integer;S1,S2 : String;F1 : Real);
var
  FF : Real;
  SS,Ret : String;
begin
  if (S1 = '') Then Exit;
  D.F15.Locate('BEF15001', VarArrayOf([SG01.Cells[00,SG01.Row]]), [loCaseInsensitive]);
  SS := 'BEF15301';
  if (S2='A')  Then SS := 'BEF15301';
  if (S2='B')  Then SS := 'BEF15302';
  if (S2='C')  Then SS := 'BEF15303';
  if (S2='D')  Then SS := 'BEF15304';
  if (S2='NG') Then SS := 'BEF15305';
  Ret := iif(D.F15.FieldByName(SS).AsString='',SG01.Cells[00,SG01.Row]+S2,
                                               D.F15.FieldByName(SS).AsString);
  D.OpenF26(Ret,S1);
  FF := KC_StrToFloat(D.F26.FieldByName('BEF26005').AsString)+iif(I1<0,(-1)*F1,F1);
  if (D.F26.FieldByName('BEF26002').AsString = '') Then
    D.F26.Append
  else
    D.F26.edit;

  D.F26.FieldByName('BEF26000').AsString := FormatDateTime('yyyymmddhhnnsszzz', F.IdTime.DateTime);
  D.F26.FieldByName('BEF26001').AsString := '03';
  D.F26.FieldByName('BEF26002').AsString := Ret;
  D.F26.FieldByName('BEF26003').AsString := D.F00.FieldByName('BEF00206').ASString;
  D.F26.FieldByName('BEF26004').AsString := S1;
  D.F26.FieldByName('BEF26005').Asfloat  := FF;
  D.F26.FieldByName('BEF26006').AsString := F.Pass_Man;
  D.F26.FieldByName('BEF26007').AsString := FormatDateTime('yyyymmdd', F.IdTime.DateTime);
  if (D.F26.ApplyUpdates(-1) <> 0) Then
  Begin
    ShowMessage('F26 無法存入');
    Exit;
  End;
  F.BEF_Stock(I1,S1,F1);
end;

procedure TF_C04.SaveF05(I1 : Integer;S1,S2,S3 : String);
begin
  D.OpenF10(S1,S2);
  SaveF26(I1,D.F10.FieldByName('BEF10211').AsString,S3,D.F10.FieldByName('BEF10212').Asfloat);
  SaveF26(I1,D.F10.FieldByName('BEF10221').AsString,S3,D.F10.FieldByName('BEF10222').Asfloat);
  SaveF26(I1,D.F10.FieldByName('BEF10231').AsString,S3,D.F10.FieldByName('BEF10232').Asfloat);
  SaveF26(I1,D.F10.FieldByName('BEF10241').AsString,S3,D.F10.FieldByName('BEF10242').Asfloat);
  SaveF26(I1,D.F10.FieldByName('BEF10251').AsString,S3,D.F10.FieldByName('BEF10252').Asfloat);
  SaveF26(I1,D.F10.FieldByName('BEF10261').AsString,S3,D.F10.FieldByName('BEF10262').Asfloat);
end;

procedure TF_C04.B_Save02Click(Sender: TObject);
var
  SQL1,SQL2 : String;
begin
  SQL1 := 'UpDate BEFG19 Set BEF19101 = ''3' +
                    ''',    BEF19010 = '''+E_010T.Text+
                    ''',    BEF19011 = '''+E_011T.Text+
                    ''',    BEF19012 = '''+E_012T.Text+
                    ''',    BEF19005 = '''+SG01.Cells[0,SG01.Row]+
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[04,SG02.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[04,SG02.Row],2)+
                    ''' and BEF19500 = '''+KC_GetSubStr(#255,SG02.Cells[04,SG02.Row],3)+
                    '''';
  SQL2 := 'UpDate BEFF19 Set BEF19101 = ''3' +
                  ''' Where BEF19001 = '''+KC_GetSubStr(#255,SG02.Cells[04,SG02.Row],1)+
                    ''' and BEF19007 = '''+KC_GetSubStr(#255,SG02.Cells[04,SG02.Row],2)+
                    '''';
  KC_T2ExecSQL(SQL1,D.FCmd);
  KC_T2ExecSQL(SQL2,D.FCmd);
  SaveF05(-1,SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row],SG02.Cells[01,SG02.Row]);
  D.OpenF10(SG01.Cells[01,SG01.Row],SG01.Cells[02,SG01.Row]);
  OpenG19(SG01.Cells[0,SG01.Row]);
  SG04Snd(SG04,'3');
  SG02Snd;
  SG03Snd(SG03,'3');
  SG02UpData;
  SG03UpData;
end;

procedure TF_C04.B_ExcelClick(Sender: TObject);
var
  W1,W2 : Variant;
  iPg   : Integer;
  i,j,k : integer;
begin
  KC_CopyToTemp(F.WorkDir,'C04.xls');
  KC_OpenExcel(V,True);
  V.Workbooks.Open(KC_GetTempDir+'\C04.xls');
  W1 := V.Workbooks[1].WorkSheets['Base'];
  W1.Activate; W1.Range['A2:M11'].Copy;
  W2 := V.Workbooks[1].WorkSheets['Data'];
  iPg := 2;
  For i:=1 to SG04.RowCount-1 do
  Begin
    W2.Activate; W2.Range['A'+IntToStr(iPg)].Select; W2.Paste;
    SG04.Row := i; SG03Snd(SG03,'3');   SG03UpData;
    W2.Cells[iPg+1,1].Value := SG04.Cells[0,i];
    W2.Cells[iPg+1,2].Value := FormatDateTime('yyyy/mm/dd', Date);
    W2.Cells[iPg+1,3].Value := '=Sum(E'+IntToStr(iPg+5)+':M'+IntToStr(iPg+5)+')';
    For k:=1 to SG03.RowCount-1 do
      For j:=1 to 9 do
      Begin
        if (SG03.Cells[j,k] = '') then Continue;
        W2.Cells[iPg+j,k+4].Value := SG03.Cells[j,k];
      End;
    inc(iPg,11);
  End;
end;

procedure TF_C04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KC_CloseExcel(V);
end;

procedure TF_C04.B_B04Click(Sender: TObject);
begin
  F_V13 := TF_V13.Create(Application);
  try
    F_V13.ShowModal;
  finally
    F_V13.Free;
  end;
end;

end.

