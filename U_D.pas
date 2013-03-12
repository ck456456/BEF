unit U_D;

interface

uses
  SysUtils, Classes, DBClient, ADODB, DB, MConnect, SConnect, DBTables;

type
  TD = class(TDataModule)
    SC: TSocketConnection;
    FCmd: TADOCommand;
    F00: TClientDataSet;
    PSW: TClientDataSet;
    F01: TClientDataSet;
    F02: TClientDataSet;
    F04: TClientDataSet;
    F05: TClientDataSet;
    F06: TClientDataSet;
    F03: TClientDataSet;
    F07: TClientDataSet;
    F08: TClientDataSet;
    F09: TClientDataSet;
    F10: TClientDataSet;
    F11: TClientDataSet;
    F12: TClientDataSet;
    F13: TClientDataSet;
    F14: TClientDataSet;
    F15: TClientDataSet;
    F16: TClientDataSet;
    F17: TClientDataSet;
    FP1: TClientDataSet;
    F18: TClientDataSet;
    F19: TClientDataSet;
    F20: TClientDataSet;
    F21: TClientDataSet;
    F22: TClientDataSet;
    F23: TClientDataSet;
    F24: TClientDataSet;
    G19: TClientDataSet;
    F25: TClientDataSet;
    F26: TClientDataSet;
    FP2: TClientDataSet;
    F27: TClientDataSet;
    F28: TClientDataSet;
    F29: TClientDataSet;
    H001: TADOQuery;
    A_HR: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AllClose;
    procedure OpenF00;
    procedure OpenF01; overload;
    procedure OpenF01(S1 : String); overload;
    procedure OpenF02; overload;
    procedure OpenF02(S1 : String); overload;
    procedure ORunningF02(S1 : String);
    procedure OpenF03(S1 : String);
    procedure OpenF04; overload;
    procedure OpenF04(S1 : String); overload;
    procedure ORunningF04(S1 : String); overload;
    procedure OpenF05; overload;
    procedure OpenF05(S1 : String); overload;
    procedure OpenF05(S1,S2 : String); overload;
    procedure OpenF06;
    procedure OpenF07; overload;
    procedure OpenF07(S1 : String); overload;
    procedure OpenF07(S1,S2 : String); overload;
    procedure OpenF08; overload;
    procedure OpenF08(S1,S2 : String); overload;
    procedure OpenF08(S1,S2,S3 : String); overload;
    procedure OpenF09(S1,S2,S3 : String); overload;
    procedure OpenF09(S1,S2,S3,S4 : String); overload;
    procedure OpenF10S(S1 : String);
    procedure OpenF10(S1 : String); overload;
    procedure OpenF10(S1,S2 : String); overload;
    procedure OpenF11; overload;
    procedure OpenF11(S1 : String); overload;
    procedure OpenF12; overload;
    procedure OpenF12(S1 : String); overload;
    procedure ORunningF13(S1 : String);
    procedure OpenF13(S1 : String);
    procedure ORunningF14(S1 : String);
    procedure OpenF14(S1 : String);
    procedure OpenF15; overload;
    procedure OpenF15(S1 : String); overload;
    procedure OpenF16(S1 : String);
    procedure ORunningF16(S1,S2 : String);
    procedure ORunningF17(S1,S2 : String);
    procedure OpenF17(S1,S2,S3 : String);
    procedure OpenF18(S1 : String); overload;
    procedure OpenF18(S1,S2 : String); overload;
    procedure OpenF19(S1 : String); overload;
    procedure OpenF19(S1,S2 : String); overload;
    procedure ORunningF19(S1,S2 : String);
    procedure OpenG19(S1,S2 : String); overload;
    procedure OpenG19(S1,S2,S3 : String); overload;
    procedure OpenF20; overload;
    procedure OpenF20(S1 : String); overload;
    procedure OpenF21;
    procedure OpenF22;
    procedure OpenF23;
    procedure OpenF24(S1 : String);
    procedure OpenF25;
    procedure OpenF26; overload;
    procedure OpenF26(S1,S2 : String); overload;
    procedure OpenF27(S1 : String);
    procedure OpenF29(S1,S2 : String);
    procedure OpenPSW; overload;
    procedure OpenPSW(S1 : String); overload;
    procedure OpenH001;
  end;

var
  D: TD;

implementation

uses U_KcPub;

{$R *.dfm}

procedure TD.OpenH001;
Begin
  D.H001.Close;
  D.H001.SQL.Clear;
  D.H001.SQL.Add('Select EMPID, HECNAME From EHR_EFBS_V Order by EMPID');
  D.H001.Open;
  D.H001.First;
end;

procedure TD.OpenPSW(S1 : String);
begin
  KC_T3Close(PSW,SC);
  D.PSW.CommandText := 'SELECT * FROM EFPSW Where BEFPW002 = '''+S1+'''';
  KC_T3OPEN(PSW,SC);
  D.PSW.First;
end;

procedure TD.OpenPSW;
begin
  KC_T3Close(PSW,SC);
  D.PSW.CommandText := 'SELECT * FROM EFPSW Order by BEFPW002';
  KC_T3OPEN(PSW,SC);
  D.PSW.First;
end;

procedure TD.OpenF00;
begin
  KC_T3Close(F00,SC);
  F00.CommandText := 'SELECT * FROM BEFF00';
  KC_T3OPEN(F00,SC);
  F00.First;
End;

procedure TD.OpenF01;
begin
  KC_T3Close(F01,SC);
  F01.CommandText := 'SELECT * FROM BEFF01 Order by BEF01001';
  KC_T3OPEN(F01,SC);
  F01.First;
End;

procedure TD.OpenF01(S1 : String);
begin
  KC_T3Close(F01,SC);
  F01.CommandText := 'SELECT * FROM BEFF01 Where BEF01002 = '''+S1+''' Order by BEF01001';
  KC_T3OPEN(F01,SC);
  F01.First;
End;

procedure TD.OpenF02;
begin
  KC_T3Close(D.F02,D.SC);
  D.F02.CommandText := 'Select * From BEFF02 Order By BEF02001';
  KC_T3OPEN(D.F02,D.SC);
  D.F02.First;
End;

procedure TD.OpenF02(S1 : String);
begin
  KC_T3Close(D.F02,D.SC);
  D.F02.CommandText := 'Select * From BEFF02 Where BEF02001 = '''+S1+'''';
  KC_T3OPEN(D.F02,D.SC);
  D.F02.First;
End;

procedure TD.ORunningF02(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF02 With (INDEX(BEFF02_101)) Where'+
            ' BEF02101 = '''+S1+''' Order by BEF02001';
  KC_T3Close(D.F02,D.SC);
  D.F02.CommandText := SQLStr;
  KC_T3OPEN(D.F02,D.SC);
  D.F02.First;
End;

procedure TD.OpenF03(S1 : String);
begin
  KC_T3Close(D.F03,D.SC);
  D.F03.CommandText := 'SELECT * FROM BEFF03 Where  BEF03001 = '''+S1+'''';
  KC_T3OPEN(D.F03,D.SC);
  D.F03.First;
End;

procedure TD.OpenF04;
begin
  KC_T3Close(F04,SC);
  F04.CommandText := 'SELECT * FROM BEFF04 Order by BEF04001';
  KC_T3OPEN(F04,SC);
  F04.First;
End;

procedure TD.ORunningF04(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF04 With (INDEX(BEFF04_101)) Where'+
                                            ' BEF04101 = '''+S1+
                                 ''' Order by BEF04001';
  KC_T3Close(D.F04,D.SC);
  D.F04.CommandText := SQLStr;
  KC_T3OPEN(D.F04,D.SC);
  D.F04.First;
End;

procedure TD.OpenF04(S1 : String);
begin
  KC_T3Close(D.F04,D.SC);
  D.F04.CommandText := 'Select * From BEFF04 Where BEF04001 = '''+S1+'''';
  KC_T3OPEN(D.F04,D.SC);
  D.F04.First;
End;

procedure TD.OpenF05(S1,S2 : String);
begin
  KC_T3Close(F05,SC);
  F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05002= '''+S1+
                                         ''' and BEF05003= '''+S2+'''';
  KC_T3OPEN(F05,SC);
  F05.First;
End;

procedure TD.OpenF05(S1 : String);
begin
  KC_T3Close(F05,SC);
  F05.CommandText := 'SELECT * FROM BEFF05 Where BEF05001= '''+S1+'''';
  KC_T3OPEN(F05,SC);
  F05.First;
End;

procedure TD.OpenF05;
begin
  KC_T3Close(F05,SC);
  F05.CommandText := 'SELECT * FROM BEFF05 Order by BEF05002,BEF05001';
  KC_T3OPEN(F05,SC);
  F05.First;
End;

procedure TD.OpenF06;
begin
  KC_T3Close(F06,SC);
  F06.CommandText := 'SELECT * FROM BEFF06 Order by BEF06001,BEF06002';
  KC_T3OPEN(F06,SC);
  F06.First;
End;

procedure TD.OpenF07(S1,S2 : String);
begin
  KC_T3Close(F07,SC);
  F07.CommandText := 'SELECT * FROM BEFF07 Where BEF07001 = '''+S1+
                                         ''' and BEF07002 = '''+S2+'''';
  KC_T3OPEN(F07,SC);
  F07.First;
End;

procedure TD.OpenF07(S1 : String);
begin
  KC_T3Close(F07,SC);
  F07.CommandText := 'SELECT * FROM BEFF07 Where BEF07001 = '''+S1+
                                    ''' Order by BEF07002';
  KC_T3OPEN(F07,SC);
  F07.First;
End;

procedure TD.OpenF07;
begin
  KC_T3Close(F07,SC);
  F07.CommandText := 'SELECT * FROM BEFF07 Order by BEF07001,BEF07002';
  KC_T3OPEN(F07,SC);
  F07.First;
End;

procedure TD.OpenF08(S1,S2 : String);
begin
  KC_T3Close(F08,SC);
  F08.CommandText := 'SELECT * FROM BEFF08 Where BEF08001 = '''+S1+
                                         ''' And BEF08002 = '''+S2+
                                    ''' Order by BEF08101';
  KC_T3OPEN(F08,SC);
  F08.First;
End;

procedure TD.OpenF08(S1,S2,S3 : String);
begin
  KC_T3Close(F08,SC);
  F08.CommandText := 'SELECT * FROM BEFF08 Where BEF08001 = '''+S1+
                                         ''' And BEF08002 = '''+S2+
                                         ''' And BEF08101 = '''+S3+'''';
  KC_T3OPEN(F08,SC);
  F08.First;
End;

procedure TD.OpenF08;
begin
  KC_T3Close(F08,SC);
  F08.CommandText := 'SELECT * FROM BEFF08 Order by BEF08001,BEF08002,BEF08101';
  KC_T3OPEN(F08,SC);
  F08.First;
End;

procedure TD.OpenF09(S1,S2,S3,S4 : String);
begin
  KC_T3Close(F09,SC);
  F09.CommandText := 'SELECT * FROM BEFF09 Where BEF09001 = '''+S1+
                                         ''' and BEF09002 = '''+S2+
                                         ''' and BEF09101 = '''+S3+
                                         ''' and BEF09102 = '''+S4+'''';
  KC_T3OPEN(F09,SC);
  F09.First;
End;

procedure TD.OpenF09(S1,S2,S3 : String);
begin
  KC_T3Close(F09,SC);
  F09.CommandText := 'SELECT * FROM BEFF09 Where BEF09001 = '''+S1+
                                         ''' and BEF09002 = '''+S2+
                                         ''' and BEF09101 = '''+S3+
                                    ''' Order by BEF09102';
  KC_T3OPEN(F09,SC);
  F09.First;
End;

procedure TD.OpenF10(S1 : String);
begin
  KC_T3Close(F10,SC);
  F10.CommandText := 'SELECT * FROM BEFF10 Where BEF10001 = '''+S1+
                                    ''' Order by BEF10002';
  KC_T3OPEN(F10,SC);
  F10.First;
End;

procedure TD.OpenF10S(S1 : String);
begin
  KC_T3Close(F10,SC);
  F10.CommandText := 'SELECT * FROM BEFF10 Where BEF10003 = '''+S1+
                                    ''' Order by BEF10002';
  KC_T3OPEN(F10,SC);
  F10.First;
End;

procedure TD.OpenF10(S1,S2 : String);
begin
  KC_T3Close(F10,SC);
  F10.CommandText := 'SELECT * FROM BEFF10 Where BEF10001 = '''+S1+
                                         ''' and BEF10002 = '''+S2+'''';
  KC_T3OPEN(F10,SC);
  F10.First;
End;

procedure TD.OpenF11(S1 : String);
begin
  KC_T3Close(F11,SC);
  F11.CommandText := 'SELECT * FROM BEFF11 Where BEF11001 = '''+S1+'''';
  KC_T3OPEN(F11,SC);
  F11.First;
End;

procedure TD.OpenF11;
begin
  KC_T3Close(F11,SC);
  F11.CommandText := 'SELECT * FROM BEFF11 Order by BEF11001';
  KC_T3OPEN(F11,SC);
  F11.First;
End;

procedure TD.OpenF12(S1 : String);
begin
  KC_T3Close(F12,SC);
  F12.CommandText := 'SELECT * FROM BEFF12 Where BEF12001 = '''+S1+''' Order by BEF12002';
  KC_T3OPEN(F12,SC);
  F12.First;
End;

procedure TD.OpenF12;
begin
  KC_T3Close(F12,SC);
  F12.CommandText := 'SELECT * FROM BEFF12 Order by BEF12001,BEF12002';
  KC_T3OPEN(F12,SC);
  F12.First;
End;

procedure TD.OpenF13(S1 : String);
begin
  KC_T3Close(F13,SC);
  F13.CommandText := 'SELECT * FROM BEFF13 Where BEF13001 = '''+S1+'''';
  KC_T3OPEN(F13,SC);
  F13.First;
End;

procedure TD.ORunningF13(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF13 With (INDEX(BEFF13_101)) Where'+
                                            ' BEF13101 = '''+S1+
                                 ''' Order by BEF13001';
  KC_T3Close(D.F13,D.SC);
  D.F13.CommandText := SQLStr;
  KC_T3OPEN(D.F13,D.SC);
  D.F13.First;
End;

procedure TD.OpenF14(S1 : String);
begin
  KC_T3Close(F14,SC);
  F14.CommandText := 'SELECT * FROM BEFF14 Where BEF14001 = '''+S1+'''';
  KC_T3OPEN(F14,SC);
  F14.First;
End;

procedure TD.ORunningF14(S1 : String);
var
  SQLStr : String;
begin
  SQLStr := 'Select * From BEFF14 With (INDEX(BEFF14_101)) Where'+
                                            ' BEF14101 = '''+S1+
                                 ''' Order by BEF14001';
  KC_T3Close(D.F14,D.SC);
  D.F14.CommandText := SQLStr;
  KC_T3OPEN(D.F14,D.SC);
  D.F14.First;
End;

procedure TD.OpenF15;
begin
  KC_T3Close(F15,SC);
  F15.CommandText := 'SELECT * FROM BEFF15 Order by BEF15001';
  KC_T3OPEN(F15,SC);
  F15.First;
End;

procedure TD.OpenF15(S1 : String);
begin
  KC_T3Close(F15,SC);
  F15.CommandText := 'SELECT * FROM BEFF15 Where BEF15001 = '''+S1+'''';
  KC_T3OPEN(F15,SC);
  F15.First;
End;

procedure TD.OpenF16(S1 : String);
begin
  KC_T3Close(F16,SC);
  F16.CommandText := 'SELECT * FROM BEFF16 With (INDEX(PK_BEFF16)) Where BEF16001 = '''+S1+'''';
  KC_T3OPEN(F16,SC);
  F16.First;
End;

procedure TD.ORunningF16(S1,S2 : String);
begin
  KC_T3Close(F16,SC);
  F16.CommandText := 'Select * From BEFF16 With (INDEX(BEFF16_101)) Where'+
                                                     ' BEF16101 >= '''+S1+
                                               ''' and BEF16101 <= '''+S2+
                                          ''' Order by BEF16001';
  KC_T3OPEN(F16,SC);
  F16.First;
End;

procedure TD.ORunningF17(S1,S2 : String);
begin
  KC_T3Close(F17,SC);
  F17.CommandText := 'SELECT * FROM BEFF17 Where BEF17101 >= '''+S1+
                                         ''' and BEF17101 <= '''+S2+
                                    ''' Order by BEF17003';
  KC_T3OPEN(F17,SC);
  F17.First;
End;

procedure TD.OpenF17(S1,S2,S3 : String);
begin
  KC_T3Close(F17,SC);
  F17.CommandText := 'SELECT * FROM BEFF17 Where BEF17001 = '''+S1+
                                         ''' and BEF17002 = '''+S2+
                                         ''' and BEF17102 = '''+S3+'''';
  KC_T3OPEN(F17,SC);
  F17.First;
End;

procedure TD.OpenF18(S1 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 With (INDEX(BEFF18_001)) Where BEF18001 = '''+S1+
                                                      ''' Order by BEF18004,BEF18002';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TD.OpenF18(S1,S2 : String);
begin
  KC_T3Close(D.F18,D.SC);
  D.F18.CommandText := 'SELECT * FROM BEFF18 Where BEF18002 = '''+S1+
                                           ''' and BEF18004 = '''+S2+'''';
  KC_T3OPEN(D.F18,D.SC);
  D.F18.First;
end;

procedure TD.OpenG19(S1,S2,S3 : String);
begin
  KC_T3Close(G19,SC);
  G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+S1+
                                         ''' and BEF19007 = '''+S2+
                                         ''' and BEF19500 = '''+S3+'''';
  KC_T3OPEN(G19,SC);
  G19.First;
end;

procedure TD.OpenG19(S1,S2 : String);
begin
  KC_T3Close(G19,SC);
  G19.CommandText := 'SELECT * FROM BEFG19 Where BEF19001 = '''+S1+
                                         ''' and BEF19007 = '''+S2+
                                   ''' Order by  BEF19500';
  KC_T3OPEN(G19,SC);
  G19.First;
End;

procedure TD.OpenF19(S1 : String);
begin
  KC_T3Close(F19,SC);
  F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19001 = '''+S1+
                                   ''' Order by  BEF19007';
  KC_T3OPEN(F19,SC);
  F19.First;
End;

procedure TD.OpenF19(S1,S2 : String);
begin
  KC_T3Close(F19,SC);
  F19.CommandText := 'SELECT * FROM BEFF19 Where BEF19001 = '''+S1+
                                         ''' and BEF19007 = '''+S2+'''';
  KC_T3OPEN(F19,SC);
  F19.First;
End;

procedure TD.ORunningF19(S1,S2 : String);
begin
  KC_T3Close(F19,SC);
  F19.CommandText := 'Select * From BEFF19 With (INDEX(BEFF19_101)) Where'+
                                                     ' BEF19101 >= '''+S1+
                                               ''' and BEF19101 <= '''+S2+
                                          ''' Order by BEF19001';
  KC_T3OPEN(F19,SC);
  F19.First;
End;

procedure TD.OpenF20(S1 : String);
begin
  KC_T3Close(F20,SC);
  F20.CommandText := 'SELECT * FROM BEFF20 Where BEF20001 = '''+S1+'''';
  KC_T3OPEN(F20,SC);
  F20.First;
End;

procedure TD.OpenF20;
begin
  KC_T3Close(F20,SC);
  F20.CommandText := 'SELECT * FROM BEFF20 Order by BEF20001';
  KC_T3OPEN(F20,SC);
  F20.First;
End;

procedure TD.OpenF21;
begin
  KC_T3Close(F21,SC);
  F21.CommandText := 'SELECT * FROM BEFF21 Order by BEF21001';
  KC_T3OPEN(F21,SC);
  F21.First;
End;

procedure TD.OpenF22;
begin
  KC_T3Close(F22,SC);
  F22.CommandText := 'SELECT * FROM BEFF22 Order by BEF22002,BEF22001';
  KC_T3OPEN(F22,SC);
  F22.First;
End;

procedure TD.OpenF23;
begin
  KC_T3Close(F23,SC);
  F23.CommandText := 'SELECT * FROM BEFF23 Order by BEF23001,BEF23004,BEF23002';
  KC_T3OPEN(F23,SC);
  F23.First;
End;

procedure TD.OpenF24(S1 : String);
begin
  KC_T3Close(F24,SC);
  F24.CommandText := 'SELECT * FROM BEFF24 Where BEF24001 = '''+S1+'''';
  KC_T3OPEN(F24,SC);
  F24.First;
End;

procedure TD.OpenF25;
begin
  KC_T3Close(F25,SC);
  F25.CommandText := 'SELECT * FROM BEFF25 Order by BEF25001';
  KC_T3OPEN(F25,SC);
  F25.First;
End;

procedure TD.OpenF26(S1,S2 : String);
begin
  KC_T3Close(F26,SC);
  F26.CommandText := 'SELECT * FROM BEFF26 Where BEF26002 = '''+S1+
                                         ''' and BEF26004 = '''+S2+'''';
  KC_T3OPEN(F26,SC);
  F26.First;
End;

procedure TD.OpenF26;
begin
  KC_T3Close(F26,SC);
  F26.CommandText := 'SELECT * FROM BEFF26 Order by BEF26001';
  KC_T3OPEN(F26,SC);
  F26.First;
End;

procedure TD.OpenF27(S1 : String);
begin
  KC_T3Close(D.F27,D.SC);
  D.F27.CommandText := 'SELECT * FROM BEFF27 Where BEF27001 = '''+S1+''' Order By BEF27002';
  KC_T3OPEN(D.F27,D.SC);
  D.F27.First;
End;

procedure TD.OpenF29(S1,S2 : String);
begin
  KC_T3Close(D.F29,D.SC);
  D.F29.CommandText := 'SELECT * FROM BEFF29 Where BEF29003 = '''+S1+
                                           ''' and BEF29004 = '''+S2+'''';
  KC_T3OPEN(D.F29,D.SC);
  D.F29.First;
End;

procedure TD.AllClose;
var
  I: Integer;
begin
  for I := 0 to ComponentCount -1 do begin
     if Components[I] is TClientDataSet then
        KC_T3Close(TClientDataSet(Components[I]),SC);

     if Components[I] is TTable then
        TTable(Components[I]).Active := False;

     if Components[I] is TDataSource then
        TDataSource(Components[I]).OnDataChange := nil;

     if Components[I] is TQuery then
        TQuery(Components[I]).Active := False;
  end;
end;

end.




46158038
46114476

46157562


