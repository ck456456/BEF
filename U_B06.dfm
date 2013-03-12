object F_B06: TF_B06
  Left = 0
  Top = 159
  Width = 800
  Height = 376
  Caption = #19978'/'#19979'(UV'#33184')'
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
  object Panel2: TPanel
    Left = 0
    Top = 308
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 308
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 251
      Top = 0
      Height = 308
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 251
      Height = 308
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object SG01: TStringGrid
        Left = 2
        Top = 2
        Width = 247
        Height = 304
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnKeyUp = SG01KeyUp
        OnMouseUp = SG01MouseUp
      end
    end
    object Panel4: TPanel
      Left = 254
      Top = 0
      Width = 538
      Height = 308
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 0
        Top = 267
        Width = 538
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 0
        object SB_01: TSpeedButton
          Left = 14
          Top = 8
          Width = 52
          Height = 25
          GroupIndex = 1
          Caption = #28155#21152
          OnClick = SB_01Click
        end
        object SB_02: TSpeedButton
          Left = 75
          Top = 8
          Width = 52
          Height = 25
          GroupIndex = 1
          Down = True
          Caption = #20462#25913
          OnClick = SB_01Click
        end
        object SB_03: TSpeedButton
          Left = 136
          Top = 8
          Width = 52
          Height = 25
          GroupIndex = 1
          Caption = #28165#38500
          OnClick = SB_01Click
        end
        object B_Save: TBitBtn
          Left = 328
          Top = 8
          Width = 52
          Height = 25
          Caption = 'Save'
          TabOrder = 0
          OnClick = B_SaveClick
        end
      end
      object P_01: TPanel
        Left = 0
        Top = 0
        Width = 538
        Height = 191
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 2
          Top = 73
          Width = 534
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel9: TPanel
          Left = 2
          Top = 76
          Width = 534
          Height = 41
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label7: TLabel
            Left = 17
            Top = 14
            Width = 20
            Height = 13
            Caption = 'No :'
          end
          object Label8: TLabel
            Left = 201
            Top = 14
            Width = 42
            Height = 13
            Caption = #21152#20837#37327' :'
          end
          object Label9: TLabel
            Left = 335
            Top = 14
            Width = 42
            Height = 13
            Caption = #21097#39192#37327' :'
          end
          object CB_No0: TComboBox
            Left = 46
            Top = 10
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = CB_No0Change
          end
          object CB_No1: TEdit
            Left = 248
            Top = 10
            Width = 74
            Height = 21
            TabOrder = 1
          end
          object CB_No2: TEdit
            Left = 383
            Top = 10
            Width = 74
            Height = 21
            TabOrder = 2
          end
          object B_01: TButton
            Left = 472
            Top = 8
            Width = 54
            Height = 25
            Caption = #20498#20837
            TabOrder = 3
            OnClick = B_01Click
          end
        end
        object SG02: TStringGrid
          Left = 2
          Top = 117
          Width = 534
          Height = 72
          Align = alClient
          ColCount = 4
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 1
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
          ColWidths = (
            64
            64
            64
            64)
        end
        object P_04: TPanel
          Left = 2
          Top = 2
          Width = 534
          Height = 71
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
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
            OnChange = CB_005Change
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
      end
      object P_02: TPanel
        Left = 0
        Top = 191
        Width = 538
        Height = 76
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 2
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
    end
  end
end
