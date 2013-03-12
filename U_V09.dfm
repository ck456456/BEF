object F_V09: TF_V09
  Left = 4
  Top = 152
  Width = 796
  Height = 375
  Caption = #20998#26781#20316#26989
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 35
      Top = 9
      Width = 29
      Height = 13
      Caption = 'Run : '
    end
    object L_Run: TLabel
      Left = 67
      Top = 9
      Width = 385
      Height = 13
      AutoSize = False
      Caption = 'L_Run'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 28
      Width = 49
      Height = 13
      Caption = 'Working : '
    end
    object L_Working: TLabel
      Left = 66
      Top = 28
      Width = 385
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
    object B_Cut: TButton
      Left = 688
      Top = 8
      Width = 75
      Height = 25
      Caption = #20999
      TabOrder = 0
      OnClick = B_CutClick
    end
    object CB_Cut: TComboBox
      Left = 520
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = '2 '#20998#26781
      Items.Strings = (
        '2 '#20998#26781
        '3 '#20998#26781
        '4 '#20998#26781
        '5 '#20998#26781
        '6 '#20998#26781
        '7 '#20998#26781
        '8 '#20998#26781
        '9 '#20998#26781)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 788
    Height = 257
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 784
      Height = 253
      Align = alClient
      ColCount = 9
      DefaultColWidth = 25
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      ColWidths = (
        25
        25
        25
        25
        25
        25
        25
        25
        25)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 307
    Width = 788
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object B_OK: TBitBtn
      Left = 32
      Top = 9
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = B_OKClick
      Kind = bkOK
    end
  end
end
