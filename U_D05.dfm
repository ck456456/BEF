object F_D05: TF_D05
  Left = 128
  Top = 150
  Width = 544
  Height = 375
  Caption = 'Monitoring'
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
    Width = 536
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Monitoring'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 536
    Height = 266
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 532
      Height = 262
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      ColWidths = (
        60
        84
        159
        36
        92
        400)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 536
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      536
      41)
    object B_Cls: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_Refresh: TBitBtn
      Left = 25
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Refresh'
      TabOrder = 1
      OnClick = B_RefreshClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
end
