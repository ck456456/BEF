object F_V05: TF_V05
  Left = 308
  Top = 39
  Width = 798
  Height = 576
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 782
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
    Width = 782
    Height = 469
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
        Top = 154
        Width = 774
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 154
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter1: TSplitter
          Left = 185
          Top = 0
          Height = 154
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 154
          Align = alLeft
          BevelInner = bvLowered
          TabOrder = 0
          object SG00: TStringGrid
            Left = 2
            Top = 2
            Width = 181
            Height = 150
            Align = alClient
            ColCount = 6
            DefaultRowHeight = 16
            FixedCols = 0
            RowCount = 50
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            TabOrder = 0
            OnKeyUp = SG00KeyUp
            OnMouseUp = SG00MouseUp
            ColWidths = (
              64
              66
              61
              64
              64
              64)
          end
        end
        object Panel2: TPanel
          Left = 188
          Top = 0
          Width = 586
          Height = 154
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object Label8: TLabel
            Left = 7
            Top = 40
            Width = 54
            Height = 13
            Caption = #19978#20445#35703#33180' :'
          end
          object Label11: TLabel
            Left = 7
            Top = 68
            Width = 54
            Height = 13
            Caption = #19979#20445#35703#33180' :'
          end
          object Label13: TLabel
            Left = 29
            Top = 101
            Width = 32
            Height = 13
            Caption = 'OPID :'
          end
          object Label14: TLabel
            Left = 32
            Top = 133
            Width = 29
            Height = 13
            Caption = 'Note :'
          end
          object L_DNPno: TLabel
            Left = 226
            Top = 68
            Width = 47
            Height = 13
            Caption = 'L_DNPno'
          end
          object L_UPPNo: TLabel
            Left = 225
            Top = 40
            Width = 48
            Height = 13
            Caption = 'L_UPPNo'
          end
          object Label18: TLabel
            Left = 32
            Top = 12
            Width = 29
            Height = 13
            Caption = 'Date :'
          end
          object L_902: TLabel
            Left = 144
            Top = 12
            Width = 29
            Height = 13
            Caption = 'Line : '
          end
          object Label19: TLabel
            Left = 227
            Top = 12
            Width = 24
            Height = 13
            Caption = 'SN : '
          end
          object Label23: TLabel
            Left = 355
            Top = 12
            Width = 29
            Height = 13
            Caption = 'Run : '
          end
          object CB202: TComboBox
            Left = 69
            Top = 36
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 0
          end
          object CB203: TComboBox
            Left = 69
            Top = 64
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 1
          end
          object E_201: TEdit
            Left = 69
            Top = 97
            Width = 75
            Height = 21
            TabOrder = 2
          end
          object E_299: TEdit
            Left = 69
            Top = 129
            Width = 491
            Height = 21
            TabOrder = 3
          end
          object E_S01: TEdit
            Left = 69
            Top = 8
            Width = 58
            Height = 21
            TabOrder = 4
            Text = '20050216'
          end
          object E_S02: TEdit
            Left = 175
            Top = 8
            Width = 25
            Height = 21
            MaxLength = 2
            TabOrder = 5
            Text = '01'
          end
          object E_S03: TEdit
            Left = 254
            Top = 8
            Width = 25
            Height = 21
            MaxLength = 2
            TabOrder = 6
            Text = '1'
          end
          object B_1001: TButton
            Left = 297
            Top = 6
            Width = 34
            Height = 25
            Caption = 'Go'
            TabOrder = 7
            OnClick = B_1001Click
          end
          object E_007: TEdit
            Left = 384
            Top = 8
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object CB_009: TCheckBox
            Left = 497
            Top = 10
            Width = 97
            Height = 17
            Caption = #23526#39511#29992
            TabOrder = 9
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 400
        Width = 774
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        DesignSize = (
          774
          41)
        object B_Save1001: TBitBtn
          Left = 32
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Save'
          Default = True
          TabOrder = 0
          OnClick = B_Save1001Click
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
        object B_Cls: TBitBtn
          Left = 910
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 1
          Kind = bkClose
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 157
        Width = 774
        Height = 243
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 2
        object Panel7: TPanel
          Left = 2
          Top = 2
          Width = 770
          Height = 134
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label16: TLabel
            Left = 32
            Top = 10
            Width = 32
            Height = 13
            Caption = 'OPID :'
          end
          object Label15: TLabel
            Left = 155
            Top = 10
            Width = 29
            Height = 13
            Caption = 'Note :'
          end
          object Label5: TLabel
            Left = 252
            Top = 40
            Width = 30
            Height = 13
            Caption = #39192#26009' :'
          end
          object Label17: TLabel
            Left = 154
            Top = 40
            Width = 30
            Height = 13
            Caption = #25910#26009' :'
          end
          object Label21: TLabel
            Left = 34
            Top = 40
            Width = 30
            Height = 13
            Caption = #20351#29992' :'
          end
          object Label40: TLabel
            Left = 154
            Top = 74
            Width = 79
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25613#32791#21407#22240' : '
          end
          object Label43: TLabel
            Left = 130
            Top = 106
            Width = 103
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25910#26009#19981#36275#21407#22240' : '
          end
          object Label20: TLabel
            Left = 340
            Top = 40
            Width = 30
            Height = 13
            Caption = #32791#25613' :'
          end
          object Label6: TLabel
            Left = 486
            Top = 40
            Width = 54
            Height = 13
            Caption = #19978#20445#32791#25613' :'
          end
          object Label10: TLabel
            Left = 599
            Top = 40
            Width = 54
            Height = 13
            Caption = #19979#20445#32791#25613' :'
          end
          object E_301: TEdit
            Left = 73
            Top = 6
            Width = 75
            Height = 21
            TabOrder = 0
          end
          object E_399: TEdit
            Left = 193
            Top = 6
            Width = 542
            Height = 21
            TabOrder = 1
          end
          object E_303: TEdit
            Left = 193
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object E_304: TEdit
            Left = 286
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 3
            Text = '0'
          end
          object E_302: TEdit
            Left = 72
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 4
            Text = '0'
          end
          object CB_309: TCheckBox
            Left = 47
            Top = 70
            Width = 71
            Height = 22
            Caption = #26159#21542#39318#25458
            TabOrder = 5
          end
          object CB_311: TComboBox
            Left = 240
            Top = 102
            Width = 497
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 6
          end
          object CB_310: TComboBox
            Left = 240
            Top = 71
            Width = 497
            Height = 21
            ItemHeight = 13
            TabOrder = 7
            Text = 'CB_310'
          end
          object E_306: TEdit
            Left = 374
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 8
            Text = '0'
          end
          object B_1002: TButton
            Left = 429
            Top = 36
            Width = 21
            Height = 20
            Caption = '....'
            TabOrder = 9
            OnClick = B_1002Click
          end
          object E_307: TEdit
            Left = 547
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 10
            Text = '0'
          end
          object E_308: TEdit
            Left = 656
            Top = 36
            Width = 46
            Height = 21
            TabOrder = 11
            Text = '0'
          end
        end
        object Panel17: TPanel
          Left = 379
          Top = 136
          Width = 393
          Height = 105
          Align = alClient
          TabOrder = 1
          object SG06: TCIM_Grid
            Left = 1
            Top = 1
            Width = 391
            Height = 103
            Align = alClient
            ColCount = 2
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            CIMOptions = [goSorting]
          end
        end
        object Panel16: TPanel
          Left = 2
          Top = 136
          Width = 377
          Height = 105
          Align = alLeft
          TabOrder = 2
          object SG05: TCIM_Grid
            Left = 1
            Top = 1
            Width = 375
            Height = 103
            Align = alClient
            ColCount = 2
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 1
            FixedRows = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            CIMOptions = [goSorting]
          end
        end
      end
    end
    object TS0102: TTabSheet
      Caption = 'Data'
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 141
        Top = 0
        Height = 400
      end
      object Panel9: TPanel
        Left = 0
        Top = 400
        Width = 774
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 0
        DesignSize = (
          774
          41)
        object B_Save1002: TBitBtn
          Left = 14
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Save'
          Default = True
          TabOrder = 0
          OnClick = B_Save1001Click
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
          OnClick = B_Dele1002Click
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
          Left = 914
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
        Height = 400
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 1
        object SG02: TStringGrid
          Left = 2
          Top = 2
          Width = 137
          Height = 396
          Align = alClient
          ColCount = 1
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
          ColWidths = (
            60)
        end
      end
      object Panel11: TPanel
        Left = 144
        Top = 0
        Width = 630
        Height = 400
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 630
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
            Text = #35097#33180#31449
            OnChange = CB_StationChange
            Items.Strings = (
              #35097#33180#31449
              #21253#35037#31449
              'QA'#31449)
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
            OnChange = CB_StationChange
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
            ItemHeight = 13
            TabOrder = 4
          end
          object CB402: TComboBox
            Left = 371
            Top = 43
            Width = 96
            Height = 21
            ItemHeight = 13
            TabOrder = 5
          end
          object B_Excel: TButton
            Left = 553
            Top = 11
            Width = 41
            Height = 21
            Caption = 'Excel'
            TabOrder = 6
            OnClick = B_ExcelClick
          end
        end
        object Panel13: TPanel
          Left = 0
          Top = 123
          Width = 630
          Height = 277
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter5: TSplitter
            Left = 182
            Top = 0
            Height = 277
          end
          object Panel14: TPanel
            Left = 0
            Top = 0
            Width = 182
            Height = 277
            Align = alLeft
            BevelInner = bvLowered
            TabOrder = 0
            object SG03: TStringGrid
              Left = 2
              Top = 2
              Width = 178
              Height = 273
              Align = alClient
              ColCount = 1
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              TabOrder = 0
              OnKeyUp = SG03KeyUp
              OnMouseUp = SG03MouseUp
              ColWidths = (
                20)
            end
          end
          object Panel15: TPanel
            Left = 185
            Top = 0
            Width = 445
            Height = 277
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object SG04: TStringGrid
              Left = 2
              Top = 2
              Width = 441
              Height = 273
              Align = alClient
              ColCount = 15
              DefaultRowHeight = 16
              FixedCols = 0
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
              OnDblClick = SG04DblClick
              OnDrawCell = SG04DrawCell
              OnExit = SG04Exit
            end
          end
        end
      end
    end
  end
end
