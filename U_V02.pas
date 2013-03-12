unit U_V02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TF_V02 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    L_No: TLabel;
    Label3: TLabel;
    L_SType: TLabel;
    Label6: TLabel;
    CB_Status: TComboBox;
    Panel1: TPanel;
    B_Cls: TBitBtn;
    B_OK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iType : Integer;
    SType : String;
    No    : String;
    Running   : String;
  end;

var
  F_V02: TF_V02;

implementation

uses U_F, U_D, U_KcPub;

{$R *.dfm}

procedure TF_V02.FormShow(Sender: TObject);
begin
  L_SType.Caption     := SType;
  L_No.Caption        := No;
  CB_Status.ItemIndex := CB_Status.Items.IndexOf(Running);
end;

procedure TF_V02.B_OKClick(Sender: TObject);
var
  S1 : String;
begin
  S1 := 'UPDATE BEFF02 SET BEF02101 = '''+F.RunningToStr(CB_Status.Text)+''''+
                   ' Where BEF02001 = '''+No+'''';
  case iType of
    1 : S1 := 'UPDATE BEFF02 SET BEF02101 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF02001 = '''+No+'''';
    2 : S1 := 'UPDATE BEFF04 SET BEF04101 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF04001 = '''+No+'''';
    3 : S1 := 'UPDATE BEFF06 SET BEF06000 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF06001 = '''+No+'''';
    4 : S1 := 'UPDATE BEFF13 SET BEF13101 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF13001 = '''+No+'''';
    5 : S1 := 'UPDATE BEFF14 SET BEF14101 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF14001 = '''+No+'''';
    6 : S1 := 'UPDATE BEFF03 SET BEF03000 = '''+F.RunningToStr(CB_Status.Text)+''''+
                         ' Where BEF03001 = '''+No+'''';
  End;
  KC_T3ExecSQL(S1,D.SC);
end;

end.
