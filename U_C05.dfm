object F_C05: TF_C05
  Left = 0
  Top = 22
  Width = 800
  Height = 564
  Caption = #20986#36008#31449
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
  object Splitter1: TSplitter
    Left = 0
    Top = 270
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #20986#36008#31449
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
    Top = 41
    Width = 792
    Height = 229
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 148
      Align = alClient
      ColCount = 13
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnDblClick = SG01DblClick
      OnDrawCell = SG01DrawCell
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        64
        66
        61
        149
        240
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object Panel13: TPanel
      Left = 2
      Top = 150
      Width = 788
      Height = 77
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object Splitter5: TSplitter
        Left = 187
        Top = 2
        Height = 73
      end
      object SG99: TStringGrid
        Left = 190
        Top = 2
        Width = 596
        Height = 73
        Align = alClient
        ColCount = 8
        DefaultRowHeight = 16
        RowCount = 4
        TabOrder = 0
      end
      object Panel14: TPanel
        Left = 2
        Top = 2
        Width = 185
        Height = 73
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object CB_Type: TComboBox
          Left = 22
          Top = 25
          Width = 145
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = #26989#21209#25351#23450
          OnChange = CB_TypeChange
          Items.Strings = (
            'all'
            #26989#21209#25351#23450)
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 496
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    DesignSize = (
      792
      41)
    object BitBtn1: TBitBtn
      Left = 710
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_B03: TBitBtn
      Left = 8
      Top = 9
      Width = 76
      Height = 25
      Caption = 'Refresh'
      TabOrder = 1
      OnClick = B_B03Click
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
    object B_Pass: TButton
      Left = 327
      Top = 9
      Width = 60
      Height = 24
      Caption = 'Allpass ->'
      TabOrder = 2
      OnClick = B_PassClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 273
    Width = 792
    Height = 223
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 392
      Top = 0
      Height = 223
    end
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 392
      Height = 223
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 67
        Top = 2
        Height = 219
      end
      object Panel8: TPanel
        Left = 2
        Top = 2
        Width = 65
        Height = 219
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object SG04: TStringGrid
          Left = 2
          Top = 2
          Width = 61
          Height = 215
          Align = alClient
          ColCount = 1
          DefaultColWidth = 25
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = SG02DrawCell
          OnKeyUp = SG04KeyUp
          OnMouseUp = SG04MouseUp
        end
      end
      object Panel10: TPanel
        Left = 70
        Top = 2
        Width = 320
        Height = 219
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object SG02: TStringGrid
          Left = 2
          Top = 38
          Width = 316
          Height = 143
          Align = alClient
          ColCount = 11
          DefaultColWidth = 25
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDblClick = SG02DblClick
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
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
            25)
        end
        object Panel9: TPanel
          Left = 2
          Top = 2
          Width = 316
          Height = 36
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 1
          object Label5: TLabel
            Left = 4
            Top = 11
            Width = 36
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #26855#26495' : '
          end
          object Label6: TLabel
            Left = 104
            Top = 11
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'SN : '
          end
          object Label7: TLabel
            Left = 171
            Top = 11
            Width = 36
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37325#37327' : '
          end
          object E_010: TEdit
            Left = 39
            Top = 7
            Width = 61
            Height = 21
            TabOrder = 0
          end
          object E_011: TEdit
            Left = 130
            Top = 7
            Width = 39
            Height = 21
            TabOrder = 1
          end
          object E_012: TEdit
            Left = 211
            Top = 7
            Width = 50
            Height = 21
            TabOrder = 2
          end
          object B_Save: TButton
            Left = 271
            Top = 8
            Width = 38
            Height = 21
            Caption = 'Save'
            TabOrder = 3
            OnClick = B_SaveClick
          end
        end
        object Panel11: TPanel
          Left = 2
          Top = 181
          Width = 316
          Height = 36
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 2
          object Label2: TLabel
            Left = 4
            Top = 11
            Width = 36
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #26855#26495' : '
          end
          object Label3: TLabel
            Left = 104
            Top = 11
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'SN : '
          end
          object Label4: TLabel
            Left = 172
            Top = 11
            Width = 41
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #37325#37327' : '
          end
          object E_010T: TEdit
            Left = 40
            Top = 7
            Width = 61
            Height = 21
            TabOrder = 0
          end
          object E_011T: TEdit
            Left = 130
            Top = 7
            Width = 39
            Height = 21
            TabOrder = 1
          end
          object E_012T: TEdit
            Left = 217
            Top = 7
            Width = 50
            Height = 21
            TabOrder = 2
          end
          object B_SaveT: TButton
            Left = 276
            Top = 6
            Width = 39
            Height = 24
            Caption = 'Save'
            TabOrder = 3
            OnClick = B_SaveTClick
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 395
      Top = 0
      Width = 397
      Height = 223
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Splitter4: TSplitter
        Left = 67
        Top = 2
        Height = 219
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 65
        Height = 219
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object SG05: TStringGrid
          Left = 2
          Top = 2
          Width = 61
          Height = 180
          Align = alClient
          ColCount = 1
          DefaultColWidth = 25
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = SG02DrawCell
          OnKeyUp = SG05KeyUp
          OnMouseUp = SG05MouseUp
        end
        object Panel12: TPanel
          Left = 2
          Top = 182
          Width = 61
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object B_Excel: TButton
            Left = 4
            Top = 7
            Width = 54
            Height = 23
            Caption = 'Excel'
            TabOrder = 0
            OnClick = B_ExcelClick
          end
        end
      end
      object Panel6: TPanel
        Left = 70
        Top = 2
        Width = 325
        Height = 219
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object SG03: TStringGrid
          Left = 2
          Top = 2
          Width = 321
          Height = 215
          Align = alClient
          ColCount = 11
          DefaultColWidth = 25
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDblClick = SG03DblClick
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
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
            25)
        end
      end
    end
  end
end
