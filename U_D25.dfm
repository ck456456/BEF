object F_D25: TF_D25
  Left = 312
  Top = 103
  Width = 544
  Height = 375
  Caption = 'WIP '#22577#34920
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
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'WIP '#22577#34920
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 536
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object E_BDat: TEdit
      Left = 129
      Top = 14
      Width = 126
      Height = 21
      TabOrder = 0
    end
    object E_EDat: TEdit
      Left = 257
      Top = 14
      Width = 126
      Height = 21
      TabOrder = 1
    end
    object CB_000: TComboBox
      Left = 20
      Top = 14
      Width = 101
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'By Date'
      Items.Strings = (
        'By Date'
        'By Run')
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
    object B_Close: TBitBtn
      Left = 445
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_OK: TBitBtn
      Left = 17
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = B_OKClick
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
    object B_Excel: TBitBtn
      Left = 112
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excel'
      Default = True
      TabOrder = 2
      OnClick = B_ExcelClick
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
  end
  object PC01: TPageControl
    Left = 0
    Top = 88
    Width = 536
    Height = 219
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = #25104#22411#31449
      object SG01: TStringGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 191
        Align = alClient
        ColCount = 16
        DefaultColWidth = 32
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = #35097#33180#31449
      ImageIndex = 1
      object SG02: TStringGrid
        Left = 0
        Top = 0
        Width = 528
        Height = 191
        Align = alClient
        ColCount = 12
        DefaultColWidth = 32
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
      end
    end
  end
end
