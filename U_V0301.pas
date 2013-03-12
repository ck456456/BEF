unit U_V0301;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls;

type
  TF_V0301 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    SG01: TStringGrid;
    B_01: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_01Click(Sender: TObject);
  private
    { Private declarations }
    procedure SL01Add;
    procedure SL01Del;
    procedure SG01Ini;
    procedure SG01Snd;
  public
    Tm   : String;
    Grp  : String;
    { Public declarations }
  end;

var
  F_V0301: TF_V0301;

implementation

uses U_KcPub, U_D, U_F, U_V03;

{$R *.dfm}

procedure TF_V0301.SG01Ini;
var
  i : Integer;
begin
  KC_SGClear(0,SG01);
  SG01.Cells[0,0]   := Tm;
  for i:=1 to 20 do
    SG01.Cells[i,0] := KC_IntFillChar(i,2,'0');

  for i:=1 to F_V03.SG04.RowCount do
    SG01.Cells[0,i] := KC_GetSubStr(#255,F_V03.SG04.Cells[0,i],1)+#255+
                       KC_GetSubStr(#255,F_V03.SG04.Cells[0,i],2);

  SG01.RowCount := F_V03.SG04.RowCount;
  KC_ColAutoSize(SG01);
end;

procedure TF_V0301.SG01Snd;
var
  i,j,k : integer;
  S : String;
begin
  for i:=0 to F_V03.SL01.Count-1 do  // ­º§À#Group#Item1#SN#Data
  Begin
    S := F_V03.SL01.Strings[i];
    if (KC_GetSubStr(#255,S,1) <> Tm ) Then Continue;
    if (KC_GetSubStr(#255,S,2) <> Grp) Then Continue;
    for j:=1 to SG01.ColCount-1 do
      for k:=1 to SG01.RowCount-1 do
      Begin
        if (KC_GetSubStr(#255,S,3) <> KC_GetSubStr(#255,SG01.Cells[0,k],1)) Then Continue;
        if (KC_GetSubStr(#255,S,4) <> SG01.Cells[j,0]) Then Continue;
        SG01.Cells[j,k] := KC_GetSubStr(#255,S,5);
      End;
  End;
end;

procedure TF_V0301.FormShow(Sender: TObject);
begin
  SG01Ini;
  SG01Snd;
end;

procedure TF_V0301.SL01Del;
var
  i : integer;
  S : String;
begin
  (*
  for i:=0 to F_V03.SL01.Count-1 do  // ­º§À#Group#Item1#SN#Data
  begin
    S := F_V03.SL01.Strings[i];
    if (KC_GetSubStr(#255,S,1) <> Tm ) Then Continue;
    if (KC_GetSubStr(#255,S,2) <> Grp) Then Continue;
    F_V03.SL01.Delete(i);
  end;
  *)
  i := -1;
  while (i<(F_V03.SL01.Count-1)) do
  Begin
    inc(i);
    S := F_V03.SL01.Strings[i];
    if (KC_GetSubStr(#255,S,1) <> Tm ) Then Continue;
    if (KC_GetSubStr(#255,S,2) <> Grp) Then Continue;
    F_V03.SL01.Delete(i);
    i := -1;
  End;
end;

procedure TF_V0301.SL01Add;
var
  j,k : integer;
  S : String;
begin
    for j:=1 to SG01.ColCount-1 do     // ­º§À#Group#Item1#SN#Data
      for k:=1 to SG01.RowCount-1 do
      Begin
        if (SG01.Cells[j,k] = '') Then Continue;
        S := Tm +#255+
             Grp+#255+
             KC_GetSubStr(#255,SG01.Cells[0,k],1)+#255+
             SG01.Cells[j,0]+#255+
             SG01.Cells[j,k];
        F_V03.SL01.Add(S);
      End;
end;

procedure TF_V0301.B_01Click(Sender: TObject);
begin
  SL01Del;
  SL01Add;
end;

end.


