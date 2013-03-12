object F_A10: TF_A10
  Left = 0
  Top = 121
  Width = 800
  Height = 454
  Caption = #20195#34399#20462#25913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #20195#34399#20462#25913
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 5
      Height = 23
    end
    object L_Kind: TLabel
      Left = 26
      Top = 8
      Width = 5
      Height = 23
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 386
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object B_Close: TBitBtn
      Left = 955
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object BitBtn1: TBitBtn
      Left = 700
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 345
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object L_G19: TLabel
      Left = 464
      Top = 16
      Width = 32
      Height = 13
      Caption = 'L_G19'
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 424
      Height = 94
      Caption = #20462#25913' Run'
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 71
        Height = 13
        Caption = #25104#22411#31449'  Run : '
      end
      object Label4: TLabel
        Left = 224
        Top = 24
        Width = 9
        Height = 13
        Caption = '->'
      end
      object Label5: TLabel
        Left = 223
        Top = 54
        Width = 9
        Height = 13
        Caption = '->'
      end
      object Label3: TLabel
        Left = 15
        Top = 53
        Width = 71
        Height = 13
        Caption = #35097#33180#31449'  Run : '
      end
      object E_101: TEdit
        Left = 92
        Top = 20
        Width = 126
        Height = 21
        TabOrder = 0
      end
      object E_102: TEdit
        Left = 241
        Top = 20
        Width = 126
        Height = 21
        TabOrder = 1
      end
      object B_100: TButton
        Left = 384
        Top = 18
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 2
        OnClick = B_100Click
      end
      object B_200: TButton
        Left = 384
        Top = 47
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 3
        OnClick = B_200Click
      end
      object E_204: TEdit
        Left = 304
        Top = 50
        Width = 63
        Height = 21
        TabOrder = 4
      end
      object E_203: TEdit
        Left = 240
        Top = 50
        Width = 59
        Height = 21
        TabOrder = 5
      end
      object E_202: TEdit
        Left = 157
        Top = 50
        Width = 61
        Height = 21
        TabOrder = 6
      end
      object E_201: TEdit
        Left = 91
        Top = 50
        Width = 63
        Height = 21
        TabOrder = 7
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 112
      Width = 424
      Height = 94
      Caption = #21034#38500' Run'
      TabOrder = 1
      object Label6: TLabel
        Left = 16
        Top = 26
        Width = 71
        Height = 13
        Caption = #25104#22411#31449'  Run : '
      end
      object Label7: TLabel
        Left = 15
        Top = 55
        Width = 71
        Height = 13
        Caption = #35097#33180#31449'  Run : '
      end
      object E_301: TEdit
        Left = 93
        Top = 22
        Width = 126
        Height = 21
        TabOrder = 0
      end
      object E_401: TEdit
        Left = 92
        Top = 52
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object E_402: TEdit
        Left = 160
        Top = 52
        Width = 59
        Height = 21
        TabOrder = 2
      end
      object B_300: TButton
        Left = 229
        Top = 21
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 3
        OnClick = B_300Click
      end
      object B_400: TButton
        Left = 229
        Top = 50
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 4
        OnClick = B_400Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 16
      Top = 216
      Width = 649
      Height = 97
      Caption = #20462#25913#24037#21934#26009#34399
      TabOrder = 2
      object Label8: TLabel
        Left = 16
        Top = 26
        Width = 71
        Height = 13
        Caption = #25104#22411#31449'  Run : '
      end
      object Label9: TLabel
        Left = 15
        Top = 55
        Width = 71
        Height = 13
        Caption = #35097#33180#31449'  Run : '
      end
      object Label10: TLabel
        Left = 258
        Top = 26
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #24037#21934
      end
      object Label11: TLabel
        Left = 258
        Top = 56
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #24037#21934
      end
      object Label12: TLabel
        Left = 434
        Top = 26
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #32026#21029
      end
      object Label13: TLabel
        Left = 434
        Top = 56
        Width = 31
        Height = 13
        AutoSize = False
        Caption = #32026#21029
      end
      object E_601: TEdit
        Left = 92
        Top = 52
        Width = 66
        Height = 21
        TabOrder = 0
      end
      object E_602: TEdit
        Left = 161
        Top = 52
        Width = 59
        Height = 21
        TabOrder = 1
      end
      object E_501: TEdit
        Left = 93
        Top = 22
        Width = 126
        Height = 21
        TabOrder = 2
      end
      object E_511: TEdit
        Left = 295
        Top = 22
        Width = 126
        Height = 21
        TabOrder = 3
      end
      object E_611: TEdit
        Left = 295
        Top = 52
        Width = 126
        Height = 21
        TabOrder = 4
      end
      object CB_512: TComboBox
        Left = 474
        Top = 22
        Width = 90
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 5
        Items.Strings = (
          ''
          'A'
          'B'
          'C'
          'D'
          'NG')
      end
      object CB_612: TComboBox
        Left = 474
        Top = 52
        Width = 90
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 6
        Items.Strings = (
          ''
          'A'
          'B'
          'C'
          'D'
          'NG')
      end
      object B_500: TButton
        Left = 575
        Top = 21
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 7
        OnClick = B_500Click
      end
      object B_600: TButton
        Left = 575
        Top = 50
        Width = 28
        Height = 25
        Caption = 'Go'
        TabOrder = 8
        OnClick = B_600Click
      end
      object B_591: TButton
        Left = 225
        Top = 22
        Width = 26
        Height = 22
        Caption = '..'
        TabOrder = 9
        OnClick = B_591Click
      end
      object B_691: TButton
        Left = 225
        Top = 51
        Width = 26
        Height = 22
        Caption = '..'
        TabOrder = 10
        OnClick = B_691Click
      end
    end
    object B_FG19: TBitBtn
      Left = 464
      Top = 40
      Width = 75
      Height = 25
      Caption = 'F19->G19'
      TabOrder = 3
      OnClick = B_FG19Click
    end
    object BitBtn2: TBitBtn
      Left = 464
      Top = 73
      Width = 75
      Height = 25
      Caption = 'F19->G19'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object Button1: TButton
      Left = 560
      Top = 40
      Width = 75
      Height = 25
      Caption = 'G19->F19'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 561
      Top = 71
      Width = 75
      Height = 25
      Caption = 'F19(Item)'
      TabOrder = 6
      Visible = False
      OnClick = Button2Click
    end
  end
end
