unit U_A00;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_A00 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    B_Close: TBitBtn;
    B_Save: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    E_001: TEdit;
    E_101: TEdit;
    E_102: TEdit;
    CB_201: TComboBox;
    CB_202: TComboBox;
    CB_203: TComboBox;
    CB_204: TComboBox;
    CB_205: TComboBox;
    Label10: TLabel;
    E_302: TEdit;
    Label11: TLabel;
    E_300: TEdit;
    M_303: TMemo;
    Label12: TLabel;
    Label13: TLabel;
    E_304: TEdit;
    Label14: TLabel;
    E_103: TEdit;
    Label15: TLabel;
    E_400: TEdit;
    Label16: TLabel;
    E_305: TEdit;
    CB_306: TCheckBox;
    Label9: TLabel;
    CB_206: TComboBox;
    CB_307: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure B_SaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpData;
    procedure PTypeLd(CB :TComboBox);
  public
    { Public declarations }
  end;

var
  F_A00: TF_A00;

implementation

uses U_KcPub, U_F, U_D;

{$R *.dfm}

procedure TF_A00.UpData;
begin
  E_001.TEXT := D.F00.FieldByName('BEF00001').ASSTRING;
  E_101.TEXT := FormatDateTime('hhnn',D.F00.FieldByName('BEF00101').AsDateTime);
  E_102.TEXT := FormatDateTime('hhnn',D.F00.FieldByName('BEF00102').AsDateTime);
  E_103.TEXT := FormatDateTime('yyyymmdd',D.F00.FieldByName('BEF00103').AsDateTime);
  CB_201.Text:= D.F00.FieldByName('BEF00201').ASSTRING;
  CB_202.Text:= D.F00.FieldByName('BEF00202').ASSTRING;
  CB_203.Text:= D.F00.FieldByName('BEF00203').ASSTRING;
  CB_204.Text:= D.F00.FieldByName('BEF00204').ASSTRING;
  CB_205.Text:= D.F00.FieldByName('BEF00205').ASSTRING;
  CB_206.Text:= D.F00.FieldByName('BEF00206').ASSTRING;
  E_300.TEXT := D.F00.FieldByName('BEF00300').ASSTRING;
  E_302.TEXT := D.F00.FieldByName('BEF00302').ASSTRING;
  M_303.Lines.Assign(D.F00.FieldByName('BEF00303'));
  E_304.TEXT := D.F00.FieldByName('BEF00304').ASSTRING;
  E_305.TEXT := D.F00.FieldByName('BEF00305').ASSTRING;
  CB_306.Checked := (D.F00.FieldByName('BEF00306').ASSTRING='T');
  CB_307.Checked := (D.F00.FieldByName('BEF00307').ASSTRING='T');
  E_400.TEXT := D.F00.FieldByName('BEF00400').ASSTRING;
end;

procedure TF_A00.PTypeLd(CB :TComboBox);
begin
  CB.Items.Clear;
  D.F01.First;
  While not D.F01.Eof do
  Begin
    CB.Items.Add(D.F01.FieldByName('BEF01001').AsString);
    D.F01.Next;
  End;
end;

procedure TF_A00.FormShow(Sender: TObject);
begin
  B_Save.Enabled := (F.Pass_word in [00,01]);
  D.OpenF00;
  D.OpenF01('F');
  PTypeLd(CB_201);
  PTypeLd(CB_202);
  PTypeLd(CB_203);
  PTypeLd(CB_204);
  PTypeLd(CB_205);
  PTypeLd(CB_206);
  UpData;
end;

procedure TF_A00.B_SaveClick(Sender: TObject);
begin
  D.F00.edit;
  D.F00.FieldByName('BEF00001').ASSTRING :=  E_001.Text;
  D.F00.FieldByName('BEF00101').AsDateTime := EncodeTime(StrToInt(Copy(E_101.Text,1,2)),
                                                         StrToInt(Copy(E_101.Text,3,2)),
                                                         00,
                                                         00);
  D.F00.FieldByName('BEF00102').AsDateTime := EncodeTime(StrToInt(Copy(E_102.Text,1,2)),
                                                         StrToInt(Copy(E_102.Text,3,2)),
                                                         00,
                                                         00);
  D.F00.FieldByName('BEF00103').AsDateTime := EncodeDate(StrToInt(Copy(E_103.Text,1,4)),
                                                         StrToInt(Copy(E_103.Text,5,2)),
                                                         StrToInt(Copy(E_103.Text,7,2)));
  D.F00.FieldByName('BEF00201').ASSTRING :=  CB_201.Text;
  D.F00.FieldByName('BEF00202').ASSTRING :=  CB_202.Text;
  D.F00.FieldByName('BEF00203').ASSTRING :=  CB_203.Text;
  D.F00.FieldByName('BEF00204').ASSTRING :=  CB_204.Text;
  D.F00.FieldByName('BEF00205').ASSTRING :=  CB_205.Text;
  D.F00.FieldByName('BEF00206').ASSTRING :=  CB_206.Text;
  D.F00.FieldByName('BEF00300').ASSTRING :=  E_300.Text;
  D.F00.FieldByName('BEF00302').ASSTRING :=  E_302.Text;
  D.F00.FieldByName('BEF00303').Assign(M_303.Lines);
  D.F00.FieldByName('BEF00304').ASSTRING :=  E_304.Text;
  D.F00.FieldByName('BEF00305').ASSTRING :=  E_305.Text;
  D.F00.FieldByName('BEF00306').ASSTRING :=  iif(CB_306.Checked,'T','F');
  D.F00.FieldByName('BEF00307').ASSTRING :=  iif(CB_307.Checked,'T','F');
  D.F00.FieldByName('BEF00400').ASSTRING :=  E_400.Text;
  D.F00.ApplyUpdates(-1);
  D.OpenF00;
  UpData;
end;

end.


