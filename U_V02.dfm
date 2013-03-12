object F_V02: TF_V02
  Left = 136
  Top = 161
  Width = 302
  Height = 241
  Caption = 'Status'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 294
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
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 294
    Height = 132
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 50
      Top = 74
      Width = 36
      Height = 13
      Caption = 'Status :'
    end
    object L_No: TLabel
      Left = 94
      Top = 38
      Width = 179
      Height = 13
      AutoSize = False
      Caption = 'L_No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 60
      Top = 38
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object L_SType: TLabel
      Left = 94
      Top = 17
      Width = 179
      Height = 13
      AutoSize = False
      Caption = 'L_SType'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 49
      Top = 17
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object CB_Status: TComboBox
      Left = 95
      Top = 70
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Hold'
        'Running'
        'Finish'
        'Fail'
        'Reject')
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 173
    Width = 294
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      294
      41)
    object B_Cls: TBitBtn
      Left = 194
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
