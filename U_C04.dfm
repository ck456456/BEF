object F_C04: TF_C04
  Left = 0
  Top = 62
  Width = 800
  Height = 444
  Caption = #24235#25151#31449
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
    Top = 203
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
    Caption = #21253#35037#31449
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
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object BitBtn1: TBitBtn
      Left = 701
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_B03: TBitBtn
      Left = 20
      Top = 9
      Width = 75
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
    object B_B04: TButton
      Left = 116
      Top = 10
      Width = 89
      Height = 24
      Caption = #20837#24235#21934'(Excel)'
      TabOrder = 2
      OnClick = B_B04Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 162
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 158
      Align = alClient
      ColCount = 10
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
        64)
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 206
    Width = 792
    Height = 170
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 326
      Top = 0
      Height = 170
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 326
      Height = 170
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object SG02: TStringGrid
        Left = 2
        Top = 37
        Width = 322
        Height = 131
        Align = alClient
        ColCount = 10
        DefaultColWidth = 25
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDrawCell = SG02DrawCell
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
          25)
      end
      object Panel6: TPanel
        Left = 2
        Top = 2
        Width = 322
        Height = 35
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 1
        object Label2: TLabel
          Left = -4
          Top = 11
          Width = 42
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26855#26495' : '
        end
        object Label3: TLabel
          Left = 171
          Top = 11
          Width = 41
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #37325#37327' : '
        end
        object Label4: TLabel
          Left = 106
          Top = 11
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'SN : '
        end
        object E_010T: TEdit
          Left = 39
          Top = 7
          Width = 61
          Height = 21
          TabOrder = 0
          Text = 'E_010T'
        end
        object E_012T: TEdit
          Left = 216
          Top = 7
          Width = 50
          Height = 21
          TabOrder = 1
          Text = 'E_012T'
        end
        object E_011T: TEdit
          Left = 132
          Top = 7
          Width = 39
          Height = 21
          TabOrder = 2
          Text = 'Edit1'
        end
        object B_Save02: TButton
          Left = 272
          Top = 6
          Width = 44
          Height = 24
          Caption = 'Save'
          TabOrder = 3
          OnClick = B_Save02Click
        end
      end
    end
    object Panel4: TPanel
      Left = 329
      Top = 0
      Width = 463
      Height = 170
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 463
        Height = 170
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Splitter3: TSplitter
          Left = 103
          Top = 2
          Height = 166
        end
        object Panel8: TPanel
          Left = 2
          Top = 2
          Width = 101
          Height = 166
          Align = alLeft
          BevelInner = bvLowered
          TabOrder = 0
          object SG04: TStringGrid
            Left = 2
            Top = 2
            Width = 97
            Height = 127
            Align = alClient
            ColCount = 1
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnDblClick = SG02DblClick
            OnDrawCell = SG02DrawCell
            OnKeyUp = SG04KeyUp
            OnMouseUp = SG04MouseUp
          end
          object Panel12: TPanel
            Left = 2
            Top = 129
            Width = 97
            Height = 35
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object B_Excel: TButton
              Left = 20
              Top = 7
              Width = 54
              Height = 23
              Caption = 'Excel'
              TabOrder = 0
              OnClick = B_ExcelClick
            end
          end
        end
        object Panel10: TPanel
          Left = 106
          Top = 2
          Width = 355
          Height = 166
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object SG03: TStringGrid
            Left = 2
            Top = 2
            Width = 351
            Height = 126
            Align = alClient
            ColCount = 11
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
            TabOrder = 0
            OnDblClick = SG02DblClick
            OnDrawCell = SG03DrawCell
            OnKeyUp = SG03KeyUp
            OnMouseUp = SG03MouseUp
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
            Top = 128
            Width = 351
            Height = 36
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 1
            object Label5: TLabel
              Left = 8
              Top = 11
              Width = 42
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #26855#26495' : '
            end
            object Label6: TLabel
              Left = 118
              Top = 11
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'SN : '
            end
            object Label7: TLabel
              Left = 191
              Top = 11
              Width = 41
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #37325#37327' : '
            end
            object E_010: TEdit
              Left = 51
              Top = 7
              Width = 61
              Height = 21
              TabOrder = 0
            end
            object E_011: TEdit
              Left = 144
              Top = 7
              Width = 39
              Height = 21
              TabOrder = 1
            end
            object E_012: TEdit
              Left = 236
              Top = 7
              Width = 50
              Height = 21
              TabOrder = 2
            end
            object B_Save: TButton
              Left = 303
              Top = 6
              Width = 43
              Height = 24
              Caption = 'Save'
              TabOrder = 3
              OnClick = B_SaveClick
            end
          end
        end
      end
    end
  end
end
