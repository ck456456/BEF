object F_V01: TF_V01
  Left = 380
  Top = 271
  Width = 283
  Height = 234
  Caption = 'Status'
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
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 275
    Height = 125
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 50
      Top = 92
      Width = 36
      Height = 13
      Caption = 'Status :'
    end
    object L_Station: TLabel
      Left = 94
      Top = 14
      Width = 171
      Height = 13
      AutoSize = False
      Caption = 'L_Station'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L_Working: TLabel
      Left = 94
      Top = 56
      Width = 179
      Height = 13
      AutoSize = False
      Caption = 'L_Working'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 47
      Top = 14
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object Label3: TLabel
      Left = 23
      Top = 56
      Width = 63
      Height = 13
      Caption = 'Working No :'
    end
    object Label6: TLabel
      Left = 49
      Top = 35
      Width = 37
      Height = 13
      Caption = 'Parent :'
    end
    object L_Parent: TLabel
      Left = 94
      Top = 35
      Width = 179
      Height = 13
      AutoSize = False
      Caption = 'L_Parent'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CB_Status: TComboBox
      Left = 95
      Top = 88
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Hold'
        'Running'
        'Finish'
        'Fail')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 275
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Status'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 166
    Width = 275
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      275
      41)
    object B_Cls: TBitBtn
      Left = 175
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_OK: TBitBtn
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = B_OKClick
      Kind = bkOK
    end
  end
end
