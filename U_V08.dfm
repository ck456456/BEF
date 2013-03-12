object F_V08: TF_V08
  Left = -4
  Top = -4
  Width = 808
  Height = 608
  Caption = #20998#26781#31449
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
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 69
    Align = alTop
    BevelInner = bvLowered
    Enabled = False
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label1: TLabel
      Left = 10
      Top = 43
      Width = 54
      Height = 13
      Caption = #30446#27161#26009#34399' :'
    end
    object Label9: TLabel
      Left = 235
      Top = 15
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label7: TLabel
      Left = 221
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object L_102: TLabel
      Left = 494
      Top = 15
      Width = 29
      Height = 13
      Caption = 'L_102'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 436
      Top = 15
      Width = 54
      Height = 13
      Caption = #38283#22987#26178#38291' :'
    end
    object Label6: TLabel
      Left = 436
      Top = 43
      Width = 54
      Height = 13
      Caption = #32080#26463#26178#38291' :'
    end
    object L_103: TLabel
      Left = 494
      Top = 43
      Width = 29
      Height = 13
      Caption = 'L_103'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object E_006: TEdit
      Left = 69
      Top = 11
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object E_002: TEdit
      Left = 69
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object E_005: TEdit
      Left = 272
      Top = 11
      Width = 145
      Height = 21
      TabOrder = 2
    end
    object E_004: TEdit
      Left = 272
      Top = 39
      Width = 145
      Height = 21
      TabOrder = 3
    end
  end
  object PC01: TPageControl
    Left = 0
    Top = 69
    Width = 800
    Height = 512
    ActivePage = TS0101
    Align = alClient
    BiDiMode = bdLeftToRight
    MultiLine = True
    ParentBiDiMode = False
    TabOrder = 1
    object TS0101: TTabSheet
      Caption = 'Base'
      object Splitter2: TSplitter
        Left = 0
        Top = 72
        Width = 792
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel3: TPanel
        Left = 0
        Top = 75
        Width = 792
        Height = 368
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 371
          Top = 68
          Height = 300
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 792
          Height = 68
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label16: TLabel
            Left = 8
            Top = 10
            Width = 32
            Height = 13
            Caption = 'OPID :'
          end
          object Label15: TLabel
            Left = 11
            Top = 39
            Width = 29
            Height = 13
            Caption = 'Note :'
          end
          object Label23: TLabel
            Left = 135
            Top = 11
            Width = 29
            Height = 13
            Caption = 'Run : '
          end
          object E_301: TEdit
            Left = 48
            Top = 6
            Width = 75
            Height = 21
            TabOrder = 0
          end
          object E_399: TEdit
            Left = 48
            Top = 35
            Width = 641
            Height = 21
            TabOrder = 1
          end
          object E_007: TEdit
            Left = 166
            Top = 7
            Width = 216
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object P_001: TPanel
          Left = 0
          Top = 68
          Width = 371
          Height = 300
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 371
            Height = 33
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object CB_Type: TComboBox
              Left = 8
              Top = 8
              Width = 94
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 0
              Text = #36028#33180#31449
              OnChange = CB_TypeChange
              Items.Strings = (
                #36028#33180#31449
                #24235#25151#31449)
            end
          end
          object Panel16: TPanel
            Left = 0
            Top = 33
            Width = 371
            Height = 267
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Splitter3: TSplitter
              Left = 66
              Top = 2
              Height = 263
            end
            object SG05: TStringGrid
              Left = 69
              Top = 2
              Width = 300
              Height = 263
              Align = alClient
              ColCount = 11
              DefaultColWidth = 25
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              TabOrder = 0
              OnDblClick = SG05DblClick
              OnKeyUp = SG05KeyUp
              OnMouseUp = SG05MouseUp
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
            object SG07: TStringGrid
              Left = 2
              Top = 2
              Width = 64
              Height = 263
              Align = alLeft
              ColCount = 1
              DefaultColWidth = 25
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              TabOrder = 1
              OnKeyUp = SG07KeyUp
              OnMouseUp = SG07MouseUp
              ColWidths = (
                25)
            end
          end
        end
        object Panel17: TPanel
          Left = 374
          Top = 68
          Width = 418
          Height = 300
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 418
            Height = 34
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object B_Cut: TButton
              Left = 324
              Top = 6
              Width = 72
              Height = 23
              Caption = #20999
              TabOrder = 0
              OnClick = B_CutClick
            end
            object CB_Cut: TComboBox
              Left = 167
              Top = 7
              Width = 145
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 1
              Text = '1 '#20998#26781
              Items.Strings = (
                '1 '#20998#26781
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
          object SG01: TStringGrid
            Left = 0
            Top = 34
            Width = 418
            Height = 266
            Align = alClient
            ColCount = 9
            DefaultColWidth = 25
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            TabOrder = 1
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
      end
      object Panel6: TPanel
        Left = 0
        Top = 443
        Width = 792
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        DesignSize = (
          792
          41)
        object B_Save1001: TBitBtn
          Left = 32
          Top = 8
          Width = 75
          Height = 25
          TabOrder = 0
          OnClick = B_Save1001Click
          Kind = bkOK
        end
        object B_Cls: TBitBtn
          Left = 928
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 1
          Kind = bkClose
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 72
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 2
        object Label13: TLabel
          Left = 12
          Top = 16
          Width = 32
          Height = 13
          Caption = 'OPID :'
        end
        object Label14: TLabel
          Left = 12
          Top = 41
          Width = 29
          Height = 13
          Caption = 'Note :'
        end
        object E_201: TEdit
          Left = 49
          Top = 12
          Width = 75
          Height = 21
          TabOrder = 0
        end
        object E_299: TEdit
          Left = 49
          Top = 37
          Width = 699
          Height = 21
          TabOrder = 1
        end
      end
    end
    object TS0102: TTabSheet
      Caption = 'Data'
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 141
        Top = 0
        Height = 443
      end
      object Panel9: TPanel
        Left = 0
        Top = 443
        Width = 792
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          792
          41)
        object B_Save1002: TBitBtn
          Left = 14
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Save'
          Default = True
          TabOrder = 0
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
        object B_Dele1002: TBitBtn
          Left = 118
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Delete'
          Default = True
          TabOrder = 1
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
        object BitBtn1: TBitBtn
          Left = 924
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 2
          Kind = bkClose
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 141
        Height = 443
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 1
        object SG02: TStringGrid
          Left = 2
          Top = 2
          Width = 137
          Height = 206
          Align = alClient
          ColCount = 1
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          ColWidths = (
            60)
        end
      end
      object Panel11: TPanel
        Left = 144
        Top = 0
        Width = 648
        Height = 443
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 648
          Height = 123
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label22: TLabel
            Left = 152
            Top = 16
            Width = 32
            Height = 13
            Caption = 'Time : '
          end
          object Label4: TLabel
            Left = 18
            Top = 16
            Width = 39
            Height = 13
            Caption = 'Station :'
          end
          object Label12: TLabel
            Left = 325
            Top = 16
            Width = 33
            Height = 13
            Caption = #32026#21029' : '
          end
          object Label3: TLabel
            Left = 9
            Top = 78
            Width = 47
            Height = 13
            Caption = 'QANote : '
          end
          object Label24: TLabel
            Left = 130
            Top = 47
            Width = 54
            Height = 13
            Caption = #20027#27298#39511#21729' :'
          end
          object Label25: TLabel
            Left = 304
            Top = 47
            Width = 54
            Height = 13
            Caption = #21103#27298#39511#21729' :'
          end
          object E_Time: TEdit
            Left = 187
            Top = 12
            Width = 94
            Height = 21
            TabOrder = 0
            Text = 'E_Time'
          end
          object CB_Station: TComboBox
            Left = 62
            Top = 12
            Width = 83
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 1
            Text = #20998#26781#31449
            Items.Strings = (
              #20998#26781#31449)
          end
          object CB_003: TComboBox
            Left = 371
            Top = 12
            Width = 177
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = #35097#33180#31449
            Items.Strings = (
              #35097#33180#31449
              #21253#35037#31449
              'QA'#31449)
          end
          object E_499: TEdit
            Left = 59
            Top = 74
            Width = 510
            Height = 21
            TabOrder = 3
          end
          object CB401: TComboBox
            Left = 187
            Top = 43
            Width = 96
            Height = 21
            ItemHeight = 0
            TabOrder = 4
          end
          object CB402: TComboBox
            Left = 371
            Top = 43
            Width = 96
            Height = 21
            ItemHeight = 0
            TabOrder = 5
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 123
          Width = 648
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter5: TSplitter
            Left = 182
            Top = 0
            Height = 87
          end
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 182
            Height = 87
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object SG03: TStringGrid
              Left = 2
              Top = 2
              Width = 178
              Height = 83
              Align = alClient
              ColCount = 1
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              TabOrder = 0
              ColWidths = (
                20)
            end
          end
          object Panel15: TPanel
            Left = 185
            Top = 0
            Width = 451
            Height = 87
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object SG04: TStringGrid
              Left = 2
              Top = 2
              Width = 447
              Height = 83
              Align = alClient
              ColCount = 15
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
            end
          end
        end
      end
    end
  end
end
