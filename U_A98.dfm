object F_A98: TF_A98
  Left = 290
  Top = 117
  Width = 345
  Height = 305
  Caption = 'Change Password'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Change Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 237
    Width = 337
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object B_ok: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = B_okClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object B_Cancel: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 337
    Height = 196
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 64
      Top = 32
      Width = 59
      Height = 13
      Caption = 'User Name :'
    end
    object L_002: TLabel
      Left = 136
      Top = 32
      Width = 385
      Height = 13
      AutoSize = False
      Caption = 'L_002'
    end
    object Label3: TLabel
      Left = 52
      Top = 66
      Width = 71
      Height = 13
      Caption = 'Old Password :'
    end
    object Label4: TLabel
      Left = 46
      Top = 101
      Width = 77
      Height = 13
      Caption = 'New Password :'
    end
    object Label5: TLabel
      Left = 33
      Top = 136
      Width = 90
      Height = 13
      Caption = 'Confirm Password :'
    end
    object E_0031: TEdit
      Left = 136
      Top = 64
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object E_0032: TEdit
      Left = 136
      Top = 96
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object E_0033: TEdit
      Left = 136
      Top = 128
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
  end
end
