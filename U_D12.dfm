object F_D12: TF_D12
  Left = 0
  Top = 158
  Width = 800
  Height = 375
  Caption = #29694#22580#20489
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
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #29694#22580#20489
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object B_Close: TBitBtn
      Left = 701
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
      Top = 8
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
  object Panel8: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 266
    Align = alClient
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Panel4: TPanel
      Left = 2
      Top = 43
      Width = 788
      Height = 221
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 788
        Height = 221
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #29694#22580#26410#35097#33180
          object SG01: TStringGrid
            Left = 0
            Top = 0
            Width = 780
            Height = 193
            Align = alClient
            ColCount = 15
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnDrawCell = SG01DrawCell
            ColWidths = (
              25
              25
              25
              25
              25
              25
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
        object TabSheet2: TTabSheet
          Caption = #29694#22580#24050#35097#33180
          ImageIndex = 1
          object SG02: TStringGrid
            Left = 0
            Top = 0
            Width = 782
            Height = 193
            Align = alClient
            ColCount = 13
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnDrawCell = SG02DrawCell
            ColWidths = (
              25
              25
              25
              25
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
        object TabSheet3: TTabSheet
          Caption = #24235#25151
          ImageIndex = 2
          object SG03: TStringGrid
            Left = 0
            Top = 0
            Width = 782
            Height = 193
            Align = alClient
            ColCount = 13
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnDrawCell = SG02DrawCell
            ColWidths = (
              25
              25
              25
              25
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
      end
    end
    object Panel9: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label5: TLabel
        Left = 207
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Process :'
      end
      object Label7: TLabel
        Left = 10
        Top = 16
        Width = 54
        Height = 13
        Caption = #30446#27161#26009#34399' :'
      end
      object CB004: TComboBox
        Left = 258
        Top = 12
        Width = 126
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        OnChange = CB004Change
        Items.Strings = (
          ''
          'FRESNEL')
      end
      object CB002: TComboBox
        Left = 69
        Top = 12
        Width = 126
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        OnChange = CB002Change
        Items.Strings = (
          ''
          'FRESNEL')
      end
    end
  end
end
