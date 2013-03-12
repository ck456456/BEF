unit U_V01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IdMessage;

type
  TF_V01 = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    L_Station: TLabel;
    L_Working: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    L_Parent: TLabel;
    CB_Status: TComboBox;
    Panel2: TPanel;
    Panel1: TPanel;
    B_Cls: TBitBtn;
    B_OK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure B_OKClick(Sender: TObject);
  private
    { Private declarations }
    function GetStation(i1 : integer) : String;
    procedure MailSend;
  public
    { Public declarations }
    iStation: Integer;
    PType   : String;
    Working : String;
    Running     : String;
    BDate   : String;
  end;

var
  F_V01: TF_V01;

implementation

uses U_F, U_KcPub, U_D;

{$R *.dfm}

function TF_V01.GetStation(i1 : integer) : String;
begin
  Result := '生管';
  case i1 of
    0 : Result := 'Running';
    1 : Result := '成型站';
    2 : Result := '褙膜站';
    3 : Result := '庫房站';
    4 : Result := 'QA站  ';
   99 : Result := '出貨';
  end;
end;

procedure TF_V01.FormShow(Sender: TObject);
begin
  D.OpenF00;
  L_Station.Caption := GetStation(iStation);
  L_Parent.Caption  := PType;
  L_Working.Caption := Working;
  CB_Status.ItemIndex := CB_Status.Items.IndexOf(Running);
end;

procedure TF_V01.MailSend;
var
  AMsg: TIdMessage;
begin
  if (MessageDlg('是否發送公告郵件 ? ', mtConfirmation,[mbOk, mbCancel], 0) <> mrOk) then Exit;
  D.OpenF20(Working);
  D.OpenF05(D.F20.FieldByName('BEF20008').AsString);
  AMsg := TIdMessage.Create(nil);
  AMsg.Body.Clear;
  AMsg.Body.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
  AMsg.Body.Add('<HTML><HEAD><TITLE></TITLE>');
  AMsg.Body.Add('<META http-equiv=Content-Type content="text/html; charset=big5">');
  AMsg.Body.Add('<META content="MSHTML 6.00.2800.1555" name=GENERATOR></HEAD>');
  AMsg.Body.Add('<BODY>');
  AMsg.Body.Add('<TABLE id=dgrdByItem');
  AMsg.Body.Add('style="BORDER-RIGHT: #dedfde 1px; BORDER-TOP: #dedfde 1px; FONT-SIZE: 10pt; BORDER-LEFT: #dedfde 1px; WIDTH: 100%; COLOR: black; BORDER-BOTTOM: #dedfde 1px; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: white"');
  AMsg.Body.Add('borderColor=#dedfde cellSpacing=0 cellPadding=4 rules=all border=1>');
  AMsg.Body.Add('<TBODY>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de"><TD>單號<TD>'      +D.F20.FieldByName('BEF20001').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">  <TD>產品別<TD>'    +D.F20.FieldByName('BEF20002').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de"><TD>料號<TD>'      +D.F05.FieldByName('BEF05008').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">  <TD>數量<TD>'      +D.F20.FieldByName('BEF20007').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de"><TD>客戶<TD>'      +D.F20.FieldByName('BEF20006').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">  <TD>預計出貨日<TD>'+D.F20.FieldByName('BEF20004').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de"><TD>實際完成日<TD>'+D.F20.FieldByName('BEF20005').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">  <TD>長度限制<TD>'  +D.F20.FieldByName('BEF20102').AsString+'~'+D.F20.FieldByName('BEF20103').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: #f7f7de"><TD>等級限制<TD>'  +D.F20.FieldByName('BEF20104').AsString+'</TD></TR>');
  AMsg.Body.Add('<TR style="BACKGROUND-COLOR: white">  <TD>Note<TD>'      +D.F20.FieldByName('BEF20099').AsString+'</TD></TR>');
  AMsg.Body.Add('</TBODY></TABLE></FONT></DIV>');
  AMsg.Body.Add('<DIV class=OutlookMessageHeader dir=ltr align=left><FONT face=細明體 color=#008000');
  AMsg.Body.Add('size=2></FONT>&nbsp;</DIV></BODY></HTML>');
  AMsg.Subject := '出貨執行 : '+D.F20.FieldByName('BEF20001').AsString+'-'+
                                D.F20.FieldByName('BEF20002').AsString+'-'+
                                D.F05.FieldByName('BEF05008').AsString;
  AMsg.ContentType :='text/html';
  AMsg.From.Address := 'BEF_Alert@prodisc.com.tw';
  AMsg.Sender.Address := 'BEF_Alert';
  AMsg.Recipients.EMailAddresses := D.F00.FieldByName('BEF00302').AsString;
  if (F.Pass_Man = 'kc') Then AMsg.Recipients.EMailAddresses := '86407@prodisc.com.tw';
  F.IdSMTP.Host := 'TWN-EXC-1';
  F.IdSMTP.Connect;
  F.IdSMTP.Send(AMsg);
  F.IdSMTP.Disconnect;
  AMsg.Free;
end;

procedure TF_V01.B_OKClick(Sender: TObject);
var
  S1,S2,S3 : String;
begin
  S1 := '';
  case iStation of
    0 : Begin
          S3 := '';
          if (CB_Status.Text = 'Running')    and (KC_GetSubStr('-',BDate,1) = '') Then  S3 := ',BEF15201='''+KC_Data2B(F.IdTime.DateTime)+'''';
          if (CB_Status.Text = 'Finish') and (KC_GetSubStr('-',BDate,2) = '') Then  S3 := ',BEF15202='''+KC_Data2B(F.IdTime.DateTime)+'''';
          if (CB_Status.Text = 'Fail')   and (KC_GetSubStr('-',BDate,2) = '') Then  S3 := ',BEF15202='''+KC_Data2B(F.IdTime.DateTime)+'''';
          S2 := 'BEF15101 = '''+F.RunningToStr(CB_Status.Text)+''''+S3;
        End;
    1 : S2 := 'BEF15102 = '''+F.RunningToStr(CB_Status.Text)+'''';
    2 : S2 := 'BEF15103 = '''+F.RunningToStr(CB_Status.Text)+'''';
    3 : S2 := 'BEF15104 = '''+F.RunningToStr(CB_Status.Text)+'''';
    4 : S2 := 'BEF15105 = '''+F.RunningToStr(CB_Status.Text)+'''';
  end;
  S1 := 'UPDATE BEFF15 SET '+S2+' Where BEF15001 = '''+Working+'''';

  if (iStation=99) Then
  Begin
    S1 := 'UPDATE BEFF20 SET BEF20101 = '''+F.RunningToStr(CB_Status.Text)+
                   ''' Where BEF20001 = '''+Working+'''';
    if (CB_Status.Text = 'Running') Then MailSend;
  End;
  KC_T3ExecSQL(S1,D.SC);
end;

end.


