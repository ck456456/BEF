object F_V0301: TF_V0301
  Left = 1
  Top = 82
  Width = 797
  Height = 375
  Caption = 'F_V0301'
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
    Top = 307
    Width = 789
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object B_01: TBitBtn
      Left = 40
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = B_01Click
      Kind = bkOK
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 307
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 785
      Height = 303
      Align = alClient
      ColCount = 21
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 21
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
    end
  end
end
