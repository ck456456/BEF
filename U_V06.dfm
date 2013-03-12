object F_V06: TF_V06
  Left = 152
  Top = 215
  Width = 482
  Height = 235
  Caption = #22577#24290'/'#20837#20489#20316#26989' ('#25104#22411')'
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
    Top = 167
    Width = 474
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 474
    Height = 167
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object L_001: TLabel
      Left = 56
      Top = 24
      Width = 30
      Height = 13
      Caption = 'L_001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 29
      Height = 13
      Caption = 'Run : '
    end
    object Label21: TLabel
      Left = 18
      Top = 52
      Width = 30
      Height = 13
      Caption = #20351#29992' :'
    end
    object Label17: TLabel
      Left = 128
      Top = 52
      Width = 30
      Height = 13
      Caption = #25910#26009' :'
    end
    object Label20: TLabel
      Left = 229
      Top = 52
      Width = 30
      Height = 13
      Caption = #25613#32791' :'
    end
    object Label23: TLabel
      Left = 326
      Top = 52
      Width = 42
      Height = 13
      Caption = #26410#35097#33180' :'
    end
    object Label2: TLabel
      Left = 18
      Top = 83
      Width = 30
      Height = 13
      Caption = #20489#21029' :'
    end
    object Label3: TLabel
      Left = 18
      Top = 117
      Width = 30
      Height = 13
      Caption = #29376#24907' :'
    end
    object L_101: TLabel
      Left = 56
      Top = 117
      Width = 30
      Height = 13
      Caption = 'L_101'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object E_10302: TEdit
      Left = 56
      Top = 48
      Width = 46
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = '0'
    end
    object E_10303: TEdit
      Left = 167
      Top = 48
      Width = 46
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = '0'
    end
    object E_10306: TEdit
      Left = 263
      Top = 48
      Width = 46
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = '0'
    end
    object E_10307: TEdit
      Left = 376
      Top = 48
      Width = 46
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = '0'
    end
    object B_1002: TButton
      Left = 432
      Top = 49
      Width = 24
      Height = 20
      Caption = '....'
      TabOrder = 4
      OnClick = B_1002Click
    end
    object CB_008: TComboBox
      Left = 56
      Top = 79
      Width = 159
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object CB_101: TComboBox
      Left = 106
      Top = 113
      Width = 77
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = #25163#21205#22577#24290
      Items.Strings = (
        #25163#21205#22577#24290
        #33258#21205#36984#25799)
    end
    object B_101: TButton
      Left = 192
      Top = 113
      Width = 24
      Height = 20
      Caption = '....'
      TabOrder = 7
      OnClick = B_101Click
    end
  end
end
