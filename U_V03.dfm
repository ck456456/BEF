object F_V03: TF_V03
  Left = 346
  Top = 5
  Width = 798
  Height = 598
  Caption = #25104#22411#31449
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
    Top = 519
    Width = 782
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      782
      41)
    object B_Cls: TBitBtn
      Left = 698
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
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
        Left = 10
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Working :'
      end
      object Label1: TLabel
        Left = 26
        Top = 42
        Width = 30
        Height = 13
        Caption = 'Type :'
      end
      object Label3: TLabel
        Left = 208
        Top = 42
        Width = 43
        Height = 13
        Caption = 'Product :'
      end
      object Label9: TLabel
        Left = 222
        Top = 15
        Width = 26
        Height = 13
        Caption = 'Line :'
      end
      object Label7: TLabel
        Left = 413
        Top = 42
        Width = 44
        Height = 13
        Caption = 'Process :'
      end
      object E_006: TEdit
        Left = 59
        Top = 11
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object E_002: TEdit
        Left = 59
        Top = 39
        Width = 145
        Height = 21
        TabOrder = 1
      end
      object E_003: TEdit
        Left = 259
        Top = 39
        Width = 145
        Height = 21
        TabOrder = 2
      end
      object E_005: TEdit
        Left = 259
        Top = 10
        Width = 145
        Height = 21
        TabOrder = 3
      end
      object E_004: TEdit
        Left = 464
        Top = 39
        Width = 145
        Height = 21
        TabOrder = 4
      end
    end
    object PC01: TPageControl
      Left = 0
      Top = 69
      Width = 782
      Height = 450
      ActivePage = TS0102
      Align = alClient
      BiDiMode = bdLeftToRight
      MultiLine = True
      ParentBiDiMode = False
      TabOrder = 1
      object TS0101: TTabSheet
        Caption = 'Base'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 154
          Align = alTop
          BevelInner = bvLowered
          TabOrder = 0
          object Label4: TLabel
            Left = 35
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
          object Label5: TLabel
            Left = 227
            Top = 12
            Width = 24
            Height = 13
            Caption = 'SN : '
          end
          object Label6: TLabel
            Left = 355
            Top = 12
            Width = 29
            Height = 13
            Caption = 'Run : '
          end
          object Label8: TLabel
            Left = 37
            Top = 40
            Width = 27
            Height = 13
            Caption = 'PET :'
          end
          object Label10: TLabel
            Left = 232
            Top = 40
            Width = 57
            Height = 13
            Caption = #19978#26550#38263#24230' : '
          end
          object Label11: TLabel
            Left = 15
            Top = 68
            Width = 49
            Height = 13
            Caption = 'ROLLER :'
          end
          object Label12: TLabel
            Left = 25
            Top = 93
            Width = 39
            Height = 13
            Caption = 'UV '#33184' : '
          end
          object L_TUV: TLabel
            Left = 73
            Top = 93
            Width = 34
            Height = 13
            Caption = 'L_TUV'
          end
          object L_PetPNo: TLabel
            Left = 401
            Top = 40
            Width = 49
            Height = 13
            Caption = 'L_PetPNo'
          end
          object L_ROLPno: TLabel
            Left = 234
            Top = 68
            Width = 53
            Height = 13
            Caption = 'L_ROLPno'
          end
          object Label13: TLabel
            Left = 32
            Top = 125
            Width = 32
            Height = 13
            Caption = 'OPID :'
          end
          object Label14: TLabel
            Left = 155
            Top = 125
            Width = 29
            Height = 13
            Caption = 'Note :'
          end
          object Label31: TLabel
            Left = 232
            Top = 96
            Width = 62
            Height = 13
            AutoSize = False
            Caption = 'UV'#29128#29031#24230' '
          end
          object Label34: TLabel
            Left = 408
            Top = 96
            Width = 75
            Height = 14
            AutoSize = False
            Caption = #27298#39511#23532#24133'  '
          end
          object E_S01: TEdit
            Left = 73
            Top = 8
            Width = 58
            Height = 21
            TabOrder = 0
            Text = '20050216'
          end
          object E_S02: TEdit
            Left = 175
            Top = 8
            Width = 25
            Height = 21
            MaxLength = 2
            TabOrder = 1
            Text = '01'
          end
          object E_S03: TEdit
            Left = 254
            Top = 8
            Width = 25
            Height = 21
            MaxLength = 2
            TabOrder = 2
            Text = '1'
          end
          object B_1001: TButton
            Left = 297
            Top = 6
            Width = 34
            Height = 25
            Caption = 'Go'
            TabOrder = 3
            OnClick = B_1001Click
          end
          object E_10001: TEdit
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
            TabOrder = 4
          end
          object CB10202: TComboBox
            Left = 73
            Top = 36
            Width = 145
            Height = 21
            ItemHeight = 0
            TabOrder = 5
            OnChange = CB10202Change
          end
          object E_10203: TEdit
            Left = 299
            Top = 36
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object CB10204: TComboBox
            Left = 73
            Top = 64
            Width = 145
            Height = 21
            ItemHeight = 0
            TabOrder = 7
            OnChange = CB10204Change
          end
          object E_10201: TEdit
            Left = 73
            Top = 121
            Width = 75
            Height = 21
            TabOrder = 8
          end
          object E_10299: TEdit
            Left = 193
            Top = 121
            Width = 542
            Height = 21
            TabOrder = 9
          end
          object E_10205: TEdit
            Left = 299
            Top = 92
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object E_10304: TEdit
            Left = 490
            Top = 92
            Width = 90
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object CB_007: TCheckBox
            Left = 504
            Top = 10
            Width = 97
            Height = 17
            Caption = #23526#39511#29992
            TabOrder = 12
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 154
          Width = 774
          Height = 227
          Align = alClient
          BevelInner = bvLowered
          TabOrder = 1
          object Panel7: TPanel
            Left = 2
            Top = 2
            Width = 778
            Height = 137
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
            object Label17: TLabel
              Left = 154
              Top = 40
              Width = 30
              Height = 13
              Caption = #25910#26009' :'
            end
            object Label20: TLabel
              Left = 262
              Top = 40
              Width = 30
              Height = 13
              Caption = #25613#32791' :'
            end
            object Label21: TLabel
              Left = 34
              Top = 40
              Width = 30
              Height = 13
              Caption = #20351#29992' :'
            end
            object Label23: TLabel
              Left = 574
              Top = 40
              Width = 42
              Height = 13
              Caption = #26410#35097#33180' :'
            end
            object Label40: TLabel
              Left = 155
              Top = 75
              Width = 75
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #25613#32791#21407#22240' : '
            end
            object Label41: TLabel
              Left = 373
              Top = 40
              Width = 21
              Height = 13
              Caption = 'QA :'
            end
            object Label42: TLabel
              Left = 465
              Top = 40
              Width = 42
              Height = 13
              Caption = #31649#24213#26009' :'
            end
            object Label43: TLabel
              Left = 127
              Top = 106
              Width = 103
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = #25910#26009#19981#36275#21407#22240' : '
            end
            object E_10301: TEdit
              Left = 73
              Top = 6
              Width = 75
              Height = 21
              TabOrder = 0
            end
            object E_10399: TEdit
              Left = 193
              Top = 6
              Width = 542
              Height = 21
              TabOrder = 1
            end
            object E_10302: TEdit
              Left = 72
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 2
              Text = '0'
            end
            object E_10303: TEdit
              Left = 193
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 3
              Text = '0'
            end
            object E_10306: TEdit
              Left = 296
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 4
              Text = '0'
            end
            object B_1002: TButton
              Left = 680
              Top = 34
              Width = 29
              Height = 25
              Caption = '....'
              TabOrder = 5
              OnClick = B_1002Click
            end
            object E_10307: TEdit
              Left = 624
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 6
              Text = '0'
            end
            object CB_311: TCheckBox
              Left = 47
              Top = 70
              Width = 71
              Height = 22
              Caption = #26159#21542#39318#25458
              TabOrder = 7
            end
            object CB_312: TComboBox
              Left = 240
              Top = 71
              Width = 497
              Height = 21
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 8
            end
            object E_10305: TEdit
              Left = 400
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 9
              Text = '0'
            end
            object E_10313: TEdit
              Left = 512
              Top = 36
              Width = 46
              Height = 21
              TabOrder = 10
              Text = '0'
            end
            object CB_314: TComboBox
              Left = 240
              Top = 102
              Width = 497
              Height = 21
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 11
            end
          end
        end
        object Panel6: TPanel
          Left = 0
          Top = 381
          Width = 774
          Height = 41
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 2
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
        end
      end
      object TS0102: TTabSheet
        Caption = 'Data'
        ImageIndex = 1
        object Splitter4: TSplitter
          Left = 141
          Top = 0
          Height = 381
        end
        object Panel9: TPanel
          Left = 0
          Top = 381
          Width = 774
          Height = 41
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 0
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
        end
        object Panel10: TPanel
          Left = 0
          Top = 0
          Width = 141
          Height = 381
          Align = alLeft
          BevelInner = bvLowered
          TabOrder = 1
          object SG02: TStringGrid
            Left = 2
            Top = 2
            Width = 137
            Height = 377
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
          Height = 381
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 630
            Height = 137
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label22: TLabel
              Left = 36
              Top = 16
              Width = 32
              Height = 13
              Caption = 'Time : '
            end
            object Label24: TLabel
              Left = 185
              Top = 16
              Width = 54
              Height = 13
              Caption = #20027#27298#39511#21729' :'
            end
            object Label25: TLabel
              Left = 185
              Top = 48
              Width = 54
              Height = 13
              Caption = #21103#27298#39511#21729' :'
            end
            object Label26: TLabel
              Left = 515
              Top = 8
              Width = 54
              Height = 13
              Caption = #38928#20272#33391#29575' :'
              Visible = False
            end
            object Label27: TLabel
              Left = 472
              Top = 47
              Width = 54
              Height = 13
              Caption = #27298#39511#23532#24133' :'
              Visible = False
            end
            object Label28: TLabel
              Left = 472
              Top = 79
              Width = 54
              Height = 13
              Caption = #27298#39511#38263#24230' :'
              Visible = False
            end
            object Label29: TLabel
              Left = 566
              Top = 106
              Width = 42
              Height = 13
              Caption = #20998#26781#25976' :'
              Visible = False
            end
            object Label30: TLabel
              Left = 560
              Top = 48
              Width = 54
              Height = 13
              Caption = #35009#20999#21697#38263' :'
              Visible = False
            end
            object Label18: TLabel
              Left = 209
              Top = 78
              Width = 30
              Height = 13
              Caption = #20854#20182' :'
            end
            object Label19: TLabel
              Left = 561
              Top = 77
              Width = 54
              Height = 13
              Caption = #35009#20999#21697#23532' :'
              Visible = False
            end
            object Label32: TLabel
              Left = 38
              Top = 48
              Width = 30
              Height = 13
              Caption = #32026#21029' :'
              Visible = False
            end
            object Label33: TLabel
              Left = 26
              Top = 78
              Width = 42
              Height = 13
              Caption = #32317#32026#21029' :'
            end
            object Label35: TLabel
              Left = 355
              Top = 16
              Width = 54
              Height = 13
              Caption = #39318#27298#33391#29575' :'
            end
            object Label36: TLabel
              Left = 24
              Top = 110
              Width = 44
              Height = 13
              Caption = 'QANote :'
            end
            object Label37: TLabel
              Left = 355
              Top = 44
              Width = 54
              Height = 13
              Caption = #23614#27298#33391#29575' :'
            end
            object Label38: TLabel
              Left = 462
              Top = 16
              Width = 8
              Height = 13
              Caption = '%'
            end
            object Label39: TLabel
              Left = 462
              Top = 44
              Width = 8
              Height = 13
              Caption = '%'
            end
            object E_Z03: TEdit
              Left = 575
              Top = 4
              Width = 27
              Height = 21
              TabOrder = 0
              Text = 'E_Z03'
              Visible = False
            end
            object CB_Z01: TComboBox
              Left = 249
              Top = 12
              Width = 96
              Height = 21
              ItemHeight = 13
              TabOrder = 1
            end
            object CB_Z02: TComboBox
              Left = 249
              Top = 43
              Width = 96
              Height = 21
              ItemHeight = 13
              TabOrder = 2
            end
            object E_Z04: TEdit
              Left = 532
              Top = 43
              Width = 27
              Height = 21
              TabOrder = 3
              Text = '420'
              Visible = False
            end
            object E_Z05: TEdit
              Left = 532
              Top = 75
              Width = 27
              Height = 21
              TabOrder = 4
              Text = '5000'
              Visible = False
            end
            object E_Z06: TEdit
              Left = 613
              Top = 102
              Width = 21
              Height = 21
              TabOrder = 5
              Text = '4'
              Visible = False
            end
            object E_Z07: TEdit
              Left = 612
              Top = 44
              Width = 21
              Height = 21
              TabOrder = 6
              Text = '65'
              Visible = False
            end
            object CB_Z09: TComboBox
              Left = 249
              Top = 74
              Width = 96
              Height = 21
              ItemHeight = 13
              TabOrder = 7
            end
            object E_Z08: TEdit
              Left = 613
              Top = 73
              Width = 21
              Height = 21
              TabOrder = 8
              Text = '0'
              Visible = False
            end
            object CB_Z10: TComboBox
              Left = 75
              Top = 44
              Width = 96
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 9
              Visible = False
              Items.Strings = (
                ''
                'A'
                'B'
                'C'
                'D'
                'NG'
                #20854#20182)
            end
            object B000: TButton
              Left = 609
              Top = 5
              Width = 20
              Height = 21
              Caption = '...'
              TabOrder = 10
              Visible = False
              OnClick = B000Click
            end
            object CB_10308: TComboBox
              Left = 75
              Top = 74
              Width = 96
              Height = 21
              ItemHeight = 13
              ItemIndex = 0
              TabOrder = 11
              Items.Strings = (
                ''
                'A'
                'B'
                'C'
                'D'
                'NG'
                'Hold')
            end
            object E_10309: TEdit
              Left = 414
              Top = 12
              Width = 43
              Height = 21
              TabOrder = 12
            end
            object E_10499: TEdit
              Left = 75
              Top = 106
              Width = 446
              Height = 21
              TabOrder = 13
              Text = '4'
            end
            object E_10310: TEdit
              Left = 414
              Top = 40
              Width = 43
              Height = 21
              TabOrder = 14
            end
            object E_Time: TEdit
              Left = 75
              Top = 12
              Width = 96
              Height = 21
              TabOrder = 15
              Text = 'E_Time'
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 137
            Width = 630
            Height = 244
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter5: TSplitter
              Left = 182
              Top = 0
              Height = 244
            end
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 182
              Height = 244
              Align = alLeft
              BevelInner = bvLowered
              TabOrder = 0
              object SG03: TStringGrid
                Left = 2
                Top = 2
                Width = 178
                Height = 240
                Align = alClient
                ColCount = 1
                DefaultRowHeight = 16
                FixedCols = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
                TabOrder = 0
                OnDblClick = SG03DblClick
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
              Height = 244
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 1
              object SG04: TStringGrid
                Left = 2
                Top = 2
                Width = 441
                Height = 240
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
end
