object F_V99: TF_V99
  Left = 124
  Top = 164
  Width = 249
  Height = 145
  Caption = 'BEF System'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 14
    Width = 41
    Height = 18
    Caption = 'Name :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 38
    Width = 65
    Height = 18
    Caption = 'Password :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object E_002: TEdit
    Left = 87
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object E_003: TEdit
    Left = 87
    Top = 37
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object B_OK: TBitBtn
    Left = 134
    Top = 75
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = B_OKClick
    Kind = bkOK
  end
end
