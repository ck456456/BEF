unit U_D05;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, DB;

type
  TF_D05 = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    SG01: TStringGrid;
    Panel2: TPanel;
    B_Cls: TBitBtn;
    B_Refresh: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_RefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure SG01Ini;
    procedure SG01F17;
    procedure SG01F16;
    procedure SG01F19;
  public
    { Public declarations }
  end;

var
  F_D05: TF_D05;

implementation

uses U_KcPub,U_D, U_F;

{$R *.dfm}

procedure TF_D05.SG01Ini;
var
  i,j : integer;
begin
  For i:=1 to SG01.RowCount-1 do
  For j:=1 to SG01.ColCount-1 do
    SG01.Cells[j,i] := '';
  SG01.Cells[00,00] := 'Station';
  SG01.Cells[01,00] := 'Line';
  SG01.Cells[02,00] := 'Run/Events';
  SG01.Cells[03,00] := 'hr';
  SG01.Cells[04,00] := 'Time';
  SG01.Cells[05,00] := 'Note';
  i := 1;
  While not D.F12.eof do
  Begin
    SG01.Cells[00,i] := D.F12.FieldByName('BEF12001').ASSTRING;
    SG01.Cells[01,i] := D.F12.FieldByName('BEF12002').ASSTRING;
    inc(i);
    D.F12.Next;
  End;
  SG01.RowCount := iif(i=1,2,i);
End;

procedure TF_D05.SG01F17;
var
  i : integer;
begin
  While not D.F17.eof do
  Begin
    For i := 1 to SG01.RowCount-1 do
    Begin
      if ((SG01.Cells[0,i] <> D.F17.FieldByName('BEF17001').ASSTRING) or
          (SG01.Cells[1,i] <> D.F17.FieldByName('BEF17002').ASSTRING)) Then
      Continue;

      D.F11.Locate('BEF11101;BEF11001', VarArrayOf([D.F17.FieldByName('BEF17001').ASSTRING,
                                                    D.F17.FieldByName('BEF17003').ASSTRING]), [loCaseInsensitive]);
      SG01.Cells[02,i] := D.F17.FieldByName('BEF17003').ASSTRING+#255+
                          D.F11.FieldByName('BEF11002').ASSTRING;
      SG01.Cells[03,i] := F.Hr(D.F17.FieldByName('BEF17102').ASSTRING);
      SG01.Cells[04,i] := copy(D.F17.FieldByName('BEF17102').ASSTRING,1,8)+'-'+
                          copy(D.F17.FieldByName('BEF17102').ASSTRING,9,6);
      SG01.Cells[05,i] := D.F17.FieldByName('BEF17299').ASSTRING;
    End;
    D.F17.Next;
  End;
End;

procedure TF_D05.SG01F16;
var
  i : integer;
begin
  While not D.F16.eof do
  Begin
    For i := 1 to SG01.RowCount-1 do
      if ((SG01.Cells[0,i] = '成型站') and
          (SG01.Cells[1,i] = D.F16.FieldByName('BEF16005').ASSTRING)) Then
      Begin
        SG01.Cells[02,i] := D.F16.FieldByName('BEF16001').ASSTRING+#255+
                            D.F16.FieldByName('BEF16002').ASSTRING+#255+
                            D.F16.FieldByName('BEF16006').ASSTRING;
        SG01.Cells[03,i] := F.Hr(D.F16.FieldByName('BEF16102').ASSTRING);
        SG01.Cells[04,i] := copy(D.F16.FieldByName('BEF16102').ASSTRING,1,8)+'-'+
                            copy(D.F16.FieldByName('BEF16102').ASSTRING,9,6);
        SG01.Cells[05,i] := D.F16.FieldByName('BEF16299').ASSTRING;
      End;
    D.F16.Next;
  End;
End;

procedure TF_D05.SG01F19;
var
  i : integer;
begin
  While not D.F19.eof do
  Begin
    For i := 1 to SG01.RowCount-1 do
      if ((SG01.Cells[0,i] = '褙膜站') and
          (SG01.Cells[1,i] = D.F19.FieldByName('BEF19005').ASSTRING)) Then
      Begin
        SG01.Cells[02,i] := D.F19.FieldByName('BEF19001').ASSTRING+'-'+
                            D.F19.FieldByName('BEF19007').ASSTRING+#255+
                            D.F19.FieldByName('BEF19002').ASSTRING+#255+
                            D.F19.FieldByName('BEF19006').ASSTRING;
        SG01.Cells[03,i] := F.Hr(D.F19.FieldByName('BEF19102').ASSTRING);
        SG01.Cells[04,i] := copy(D.F19.FieldByName('BEF19102').ASSTRING,1,8)+'-'+
                            copy(D.F19.FieldByName('BEF19102').ASSTRING,9,6);
        SG01.Cells[05,i] := D.F19.FieldByName('BEF19299').ASSTRING;
      End;
    D.F19.Next;
  End;
End;

procedure TF_D05.FormShow(Sender: TObject);
begin
  D.OpenF12;
  D.OpenF11;
  D.ORunningF17('1','1');
  D.ORunningF16('1','1');
  D.ORunningF19('1','1');
  SG01Ini;
  SG01F17;
  SG01F16;
  SG01F19;
  KC_ColAutoSize(SG01);
end;

procedure TF_D05.B_RefreshClick(Sender: TObject);
begin
  FormShow(Sender);
end;

end.

