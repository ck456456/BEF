object F_D0601: TF_D0601
  Left = 113
  Top = 75
  Width = 577
  Height = 357
  Caption = 'UV'#33184#20351#29992#35352#37636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object P_02: TPanel
    Left = 0
    Top = 213
    Width = 569
    Height = 76
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 14
      Width = 32
      Height = 13
      Caption = 'OPID :'
    end
    object Label5: TLabel
      Left = 11
      Top = 43
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label6: TLabel
      Left = 137
      Top = 14
      Width = 57
      Height = 13
      Caption = #21097#39192#32317#37327' : '
    end
    object E_201: TEdit
      Left = 47
      Top = 10
      Width = 75
      Height = 21
      TabOrder = 0
    end
    object E_299: TEdit
      Left = 47
      Top = 39
      Width = 483
      Height = 21
      TabOrder = 1
    end
    object E_202: TEdit
      Left = 208
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 2
      Text = '0'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 213
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object P_04: TPanel
      Left = 2
      Top = 2
      Width = 565
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 133
        Top = 14
        Width = 63
        Height = 13
        Caption = 'Product No : '
      end
      object L_102: TLabel
        Left = 473
        Top = 14
        Width = 6
        Height = 13
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 14
        Width = 32
        Height = 13
        Caption = 'OPID :'
      end
      object Label3: TLabel
        Left = 11
        Top = 43
        Width = 29
        Height = 13
        Caption = 'Note :'
      end
      object Label10: TLabel
        Left = 374
        Top = 14
        Width = 57
        Height = 13
        Caption = #21152#20837#32317#37327' : '
      end
      object CB_005: TComboBox
        Left = 203
        Top = 10
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
      object E_101: TEdit
        Left = 47
        Top = 10
        Width = 75
        Height = 21
        TabOrder = 1
      end
      object E_199: TEdit
        Left = 47
        Top = 39
        Width = 483
        Height = 21
        TabOrder = 2
      end
    end
    object SG02: TStringGrid
      Left = 2
      Top = 73
      Width = 565
      Height = 138
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 16
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 1
      ColWidths = (
        64
        64
        64
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 289
    Width = 569
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      569
      41)
    object B_Save: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = B_SaveClick
    end
    object B_Close: TBitBtn
      Left = 475
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkClose
    end
  end
end
