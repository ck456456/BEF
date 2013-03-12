object F_C03: TF_C03
  Left = 0
  Top = 225
  Width = 800
  Height = 375
  Caption = #35097#33180#31449
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
  object Splitter1: TSplitter
    Left = 0
    Top = 233
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #35097#33180#31449
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
  object Panel9: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 37
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object CB_Lin: TComboBox
      Left = 44
      Top = 7
      Width = 99
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #25276#20986#31449
      OnChange = CB_LinChange
      Items.Strings = (
        #25276#20986#31449
        #25104#22411#31449
        #21360#21047#31449
        #38928#24398#31449
        #32068#31435#31449)
    end
    object E_R02: TEdit
      Left = 615
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object B_Find: TButton
      Left = 696
      Top = 8
      Width = 30
      Height = 21
      Caption = 'Find'
      TabOrder = 2
      OnClick = B_FindClick
    end
    object E_R01: TEdit
      Left = 537
      Top = 8
      Width = 73
      Height = 21
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 236
    Width = 792
    Height = 71
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 90
      Height = 71
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object CB_101: TComboBox
        Left = 6
        Top = 9
        Width = 76
        Height = 21
        Style = csDropDownList
        ImeName = #20013#25991' ('#32321#39636') - '#27880#38899
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '2.Finish '
        Items.Strings = (
          '2.Finish '
          '3.Fail')
      end
      object B_B02: TButton
        Left = 5
        Top = 39
        Width = 75
        Height = 25
        Caption = 'Input && Go'
        TabOrder = 1
        OnClick = B_B02Click
      end
    end
    object Panel14: TPanel
      Left = 90
      Top = 0
      Width = 702
      Height = 71
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object SG03: TStringGrid
        Left = 2
        Top = 2
        Width = 698
        Height = 67
        Align = alClient
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDblClick = SG04DblClick
        ColWidths = (
          64
          174
          64
          64
          64)
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 78
    Width = 792
    Height = 155
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 90
      Height = 155
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object B_B01: TButton
        Left = 5
        Top = 8
        Width = 74
        Height = 25
        Caption = 'Input && Go'
        TabOrder = 0
        OnClick = B_B01Click
      end
    end
    object Panel8: TPanel
      Left = 90
      Top = 0
      Width = 702
      Height = 155
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object PC01: TPageControl
        Left = 2
        Top = 2
        Width = 698
        Height = 151
        ActivePage = TS02
        Align = alClient
        TabOrder = 0
        object TS01: TTabSheet
          Caption = 'Event'
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 690
            Height = 123
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 690
              Height = 123
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 0
              object SG01: TStringGrid
                Left = 2
                Top = 2
                Width = 686
                Height = 119
                Align = alClient
                ColCount = 2
                DefaultRowHeight = 16
                FixedCols = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
                TabOrder = 0
                ColWidths = (
                  64
                  174)
              end
            end
          end
        end
        object TS02: TTabSheet
          Caption = 'Working'
          ImageIndex = 1
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 690
            Height = 123
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 690
              Height = 123
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 0
              object Splitter2: TSplitter
                Left = 427
                Top = 2
                Height = 119
              end
              object SG02: TStringGrid
                Left = 2
                Top = 2
                Width = 425
                Height = 119
                Align = alLeft
                ColCount = 10
                DefaultRowHeight = 16
                FixedCols = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
                TabOrder = 0
                OnDblClick = SG02DblClick
                OnDrawCell = SG02DrawCell
                OnKeyUp = SG02KeyUp
                OnMouseUp = SG02MouseUp
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
              object Panel3: TPanel
                Left = 430
                Top = 2
                Width = 258
                Height = 119
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object Panel4: TPanel
                  Left = 0
                  Top = 0
                  Width = 258
                  Height = 31
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 0
                  object CB000: TComboBox
                    Left = 27
                    Top = 5
                    Width = 145
                    Height = 21
                    Style = csDropDownList
                    ItemHeight = 13
                    ItemIndex = 0
                    TabOrder = 0
                    Text = 'all'
                    OnChange = CB000Change
                    Items.Strings = (
                      'all'
                      'ok'
                      'ng')
                  end
                end
                object SG04: TStringGrid
                  Left = 0
                  Top = 31
                  Width = 258
                  Height = 88
                  Align = alClient
                  ColCount = 7
                  DefaultColWidth = 25
                  DefaultRowHeight = 16
                  FixedCols = 0
                  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
                  TabOrder = 1
                  OnDblClick = SG04DblClick
                  OnDrawCell = SG04DrawCell
                  ColWidths = (
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
      end
    end
  end
end
