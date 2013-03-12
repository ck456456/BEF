object F_A07: TF_A07
  Left = 188
  Top = 137
  Width = 800
  Height = 512
  Caption = 'Process Set'
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
  object Splitter2: TSplitter
    Left = 280
    Top = 41
    Height = 403
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Process Set'
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
    Top = 444
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object SB_Inquire: TSpeedButton
      Left = 14
      Top = 8
      Width = 52
      Height = 25
      GroupIndex = 1
      Down = True
      Caption = 'View'
      OnClick = SB_InquireClick
    end
    object SB_Modify: TSpeedButton
      Left = 75
      Top = 8
      Width = 52
      Height = 25
      GroupIndex = 1
      Caption = 'Modify'
      OnClick = SB_InquireClick
    end
    object SB_Append: TSpeedButton
      Left = 136
      Top = 8
      Width = 52
      Height = 25
      GroupIndex = 1
      Caption = 'Append'
      OnClick = SB_InquireClick
    end
    object B_Delete: TBitBtn
      Left = 266
      Top = 8
      Width = 52
      Height = 25
      Caption = 'Delete'
      TabOrder = 0
      OnClick = SB_InquireClick
    end
    object B_Save: TBitBtn
      Left = 328
      Top = 8
      Width = 52
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = SB_InquireClick
    end
    object B_Close: TBitBtn
      Left = 701
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 280
    Height = 403
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 280
      Height = 403
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 147
        Top = 0
        Height = 403
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 147
        Height = 403
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 0
        object SG01: TStringGrid
          Left = 2
          Top = 2
          Width = 143
          Height = 399
          Align = alClient
          ColCount = 2
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = SG03DrawCell
          OnKeyUp = SG01KeyUp
          OnMouseUp = SG01MouseUp
          ColWidths = (
            99
            17)
        end
      end
      object Panel4: TPanel
        Left = 150
        Top = 0
        Width = 130
        Height = 403
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object SG02: TStringGrid
          Left = 2
          Top = 2
          Width = 126
          Height = 399
          Align = alClient
          ColCount = 2
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
          ColWidths = (
            99
            64)
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 283
    Top = 41
    Width = 509
    Height = 403
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter3: TSplitter
      Left = 0
      Top = 268
      Width = 509
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter4: TSplitter
      Left = 141
      Top = 271
      Height = 132
    end
    object Splitter5: TSplitter
      Left = 326
      Top = 271
      Height = 132
    end
    object Panel8: TPanel
      Left = 0
      Top = 0
      Width = 509
      Height = 268
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 25
        Top = 16
        Width = 20
        Height = 13
        Caption = 'No :'
      end
      object Label5: TLabel
        Left = 200
        Top = 43
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #29087#25104#26178#38291' : '
      end
      object Label8: TLabel
        Left = 16
        Top = 72
        Width = 29
        Height = 13
        Caption = 'Note :'
      end
      object Label9: TLabel
        Left = 341
        Top = 43
        Width = 83
        Height = 13
        AutoSize = False
        Caption = #25104#22411#27298#28204#38291#38548' : '
      end
      object Label17: TLabel
        Left = 6
        Top = 43
        Width = 39
        Height = 13
        Caption = 'Station :'
      end
      object Label7: TLabel
        Left = 321
        Top = 43
        Width = 11
        Height = 13
        Caption = 'Hr'
      end
      object Label10: TLabel
        Left = 478
        Top = 43
        Width = 11
        Height = 13
        Caption = 'Hr'
      end
      object E_002: TEdit
        Left = 48
        Top = 12
        Width = 134
        Height = 21
        TabOrder = 0
        Text = 'E_002'
      end
      object E_101: TEdit
        Left = 270
        Top = 39
        Width = 44
        Height = 21
        TabOrder = 1
        Text = 'E_101'
      end
      object E_099: TEdit
        Left = 48
        Top = 68
        Width = 451
        Height = 21
        TabOrder = 2
        Text = 'E_099'
      end
      object E_105: TEdit
        Left = 427
        Top = 39
        Width = 44
        Height = 21
        TabOrder = 3
        Text = 'E_105'
      end
      object CB_108: TCheckBox
        Left = 200
        Top = 14
        Width = 97
        Height = 17
        Caption = #35336#31639#33258#21205#33391#29575
        TabOrder = 4
      end
      object CB_004: TCheckBox
        Left = 329
        Top = 14
        Width = 48
        Height = 17
        Caption = #23526#39511
        TabOrder = 5
      end
      object PC01: TPageControl
        Left = 2
        Top = 91
        Width = 505
        Height = 175
        ActivePage = TS02
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        object TS01: TTabSheet
          Caption = #25104#22411
          object Label3: TLabel
            Left = 26
            Top = 59
            Width = 27
            Height = 13
            Caption = 'PET :'
          end
          object L_102: TLabel
            Left = 203
            Top = 59
            Width = 30
            Height = 13
            Caption = 'L_102'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object L_104: TLabel
            Left = 203
            Top = 82
            Width = 30
            Height = 13
            Caption = 'L_104'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 4
            Top = 83
            Width = 49
            Height = 13
            Caption = 'ROLLER :'
          end
          object Label4: TLabel
            Left = 32
            Top = 106
            Width = 21
            Height = 13
            Caption = 'UV :'
          end
          object L_103: TLabel
            Left = 203
            Top = 105
            Width = 30
            Height = 13
            Caption = 'L_103'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 20
            Top = 33
            Width = 96
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #39318#25458#25613#32791#35686#31034' :'
          end
          object Label13: TLabel
            Left = 191
            Top = 33
            Width = 96
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #19968#33324#25613#32791#35686#31034' : '
          end
          object Label20: TLabel
            Left = 350
            Top = 34
            Width = 94
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25910#26009#19981#36275#35686#31034' : '
          end
          object Label21: TLabel
            Left = 19
            Top = 8
            Width = 96
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'UV'#33184#21934#20301#29992#37327' :'
          end
          object CB_102: TComboBox
            Left = 57
            Top = 55
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 0
            Text = 'CB_102'
            OnChange = CB_102Change
          end
          object CB_104: TComboBox
            Left = 57
            Top = 78
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 1
            Text = 'CB_104'
            OnChange = CB_102Change
          end
          object CB_103: TComboBox
            Left = 57
            Top = 101
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 2
            Text = 'CB_103'
            OnChange = CB_102Change
          end
          object E_109: TEdit
            Left = 129
            Top = 29
            Width = 55
            Height = 21
            TabOrder = 3
            Text = 'E_109'
          end
          object E_110: TEdit
            Left = 290
            Top = 29
            Width = 51
            Height = 21
            TabOrder = 4
            Text = 'E_110'
          end
          object E_113: TEdit
            Left = 443
            Top = 30
            Width = 51
            Height = 21
            TabOrder = 5
            Text = 'E_113'
          end
          object E_115: TEdit
            Left = 128
            Top = 4
            Width = 55
            Height = 21
            TabOrder = 6
            Text = 'E_115'
          end
        end
        object TS02: TTabSheet
          Caption = #35097#33180
          ImageIndex = 1
          object Label12: TLabel
            Left = 8
            Top = 80
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #19978#20445#35703#33180' :'
          end
          object L_106: TLabel
            Left = 215
            Top = 80
            Width = 30
            Height = 13
            Caption = 'L_106'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object L_107: TLabel
            Left = 215
            Top = 103
            Width = 30
            Height = 13
            Caption = 'L_107'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 9
            Top = 103
            Width = 56
            Height = 13
            AutoSize = False
            Caption = #19979#20445#35703#33180' :'
          end
          object Label15: TLabel
            Left = 28
            Top = 39
            Width = 95
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #39318#25458#25613#32791#35686#31034' :'
          end
          object Label16: TLabel
            Left = 200
            Top = 39
            Width = 94
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #19968#33324#25613#32791#35686#31034' : '
          end
          object Label18: TLabel
            Left = 21
            Top = 16
            Width = 102
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #36899#32080#25104#22411#31243#24207' : '
          end
          object Label19: TLabel
            Left = 350
            Top = 40
            Width = 94
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = #25910#26009#19981#36275#35686#31034' : '
          end
          object CB_106: TComboBox
            Left = 69
            Top = 76
            Width = 141
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'CB_106'
            OnChange = CB_102Change
          end
          object CB_107: TComboBox
            Left = 69
            Top = 99
            Width = 141
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            Text = 'CB_107'
            OnChange = CB_102Change
          end
          object E_111: TEdit
            Left = 129
            Top = 35
            Width = 55
            Height = 21
            TabOrder = 2
            Text = 'E_111'
          end
          object E_112: TEdit
            Left = 293
            Top = 35
            Width = 51
            Height = 21
            TabOrder = 3
            Text = 'E_112'
          end
          object CB_201: TComboBox
            Left = 129
            Top = 11
            Width = 103
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = 'all'
            Items.Strings = (
              'all'
              #25104#22411#31449
              #35097#33180#31449)
          end
          object E_114: TEdit
            Left = 443
            Top = 36
            Width = 51
            Height = 21
            TabOrder = 5
            Text = 'E_114'
          end
        end
        object TS03: TTabSheet
          Caption = #21253#35037
          ImageIndex = 2
          object Label22: TLabel
            Left = 16
            Top = 13
            Width = 42
            Height = 13
            Caption = #21253#26448' 1 : '
          end
          object Label23: TLabel
            Left = 16
            Top = 36
            Width = 42
            Height = 13
            Caption = #21253#26448' 2 : '
          end
          object Label24: TLabel
            Left = 16
            Top = 59
            Width = 42
            Height = 13
            Caption = #21253#26448' 3 : '
          end
          object Label25: TLabel
            Left = 16
            Top = 83
            Width = 42
            Height = 13
            Caption = #21253#26448' 4 : '
          end
          object L_211: TLabel
            Left = 257
            Top = 13
            Width = 30
            Height = 13
            Caption = 'L_211'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object L_221: TLabel
            Left = 257
            Top = 36
            Width = 30
            Height = 13
            Caption = 'L_221'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object L_231: TLabel
            Left = 257
            Top = 59
            Width = 30
            Height = 13
            Caption = 'L_231'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object L_241: TLabel
            Left = 257
            Top = 83
            Width = 30
            Height = 13
            Caption = 'L_241'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label26: TLabel
            Left = 16
            Top = 106
            Width = 42
            Height = 13
            Caption = #21253#26448' 5 : '
          end
          object L_251: TLabel
            Left = 257
            Top = 106
            Width = 30
            Height = 13
            Caption = 'L_251'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label28: TLabel
            Left = 16
            Top = 130
            Width = 42
            Height = 13
            Caption = #21253#26448' 6 : '
          end
          object L_261: TLabel
            Left = 258
            Top = 130
            Width = 30
            Height = 13
            Caption = 'L_261'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object CB_211: TComboBox
            Left = 110
            Top = 9
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 0
            Text = 'CB_211'
            OnChange = CB_102Change
          end
          object CB_221: TComboBox
            Left = 110
            Top = 32
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 1
            Text = 'CB_221'
            OnChange = CB_102Change
          end
          object CB_231: TComboBox
            Left = 110
            Top = 55
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 2
            Text = 'CB_231'
            OnChange = CB_102Change
          end
          object CB_241: TComboBox
            Left = 110
            Top = 79
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 3
            Text = 'CB_241'
            OnChange = CB_102Change
          end
          object E_212: TEdit
            Left = 61
            Top = 9
            Width = 45
            Height = 21
            TabOrder = 4
            Text = 'E_212'
          end
          object E_222: TEdit
            Left = 61
            Top = 32
            Width = 45
            Height = 21
            TabOrder = 5
            Text = 'E_222'
          end
          object E_232: TEdit
            Left = 61
            Top = 55
            Width = 45
            Height = 21
            TabOrder = 6
            Text = 'E_232'
          end
          object E_242: TEdit
            Left = 61
            Top = 79
            Width = 45
            Height = 21
            TabOrder = 7
            Text = 'E_242'
          end
          object E_252: TEdit
            Left = 61
            Top = 102
            Width = 45
            Height = 21
            TabOrder = 8
            Text = 'E_252'
          end
          object CB_251: TComboBox
            Left = 110
            Top = 102
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 9
            Text = 'CB_251'
            OnChange = CB_102Change
          end
          object E_262: TEdit
            Left = 61
            Top = 126
            Width = 45
            Height = 21
            TabOrder = 10
            Text = 'E_262'
          end
          object CB_261: TComboBox
            Left = 110
            Top = 126
            Width = 141
            Height = 21
            ItemHeight = 0
            TabOrder = 11
            Text = 'CB_261'
            OnChange = CB_102Change
          end
        end
      end
      object CB_005: TComboBox
        Left = 48
        Top = 39
        Width = 135
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 7
        Text = 'all'
        OnChange = CB_005Change
        Items.Strings = (
          'all'
          #25104#22411#31449
          #35097#33180#31449)
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 271
      Width = 141
      Height = 132
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 1
      object SG03: TStringGrid
        Left = 2
        Top = 2
        Width = 137
        Height = 128
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDrawCell = SG03DrawCell
        OnKeyUp = SG03KeyUp
        OnMouseUp = SG03MouseUp
        ColWidths = (
          60
          37)
      end
    end
    object Panel10: TPanel
      Left = 144
      Top = 271
      Width = 182
      Height = 132
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 2
      object SG04: TStringGrid
        Left = 2
        Top = 2
        Width = 178
        Height = 128
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDblClick = SG04DblClick
        OnDrawCell = SG04DrawCell
        OnKeyUp = SG04KeyUp
        OnMouseUp = SG04MouseUp
        ColWidths = (
          20
          127)
      end
    end
    object Panel11: TPanel
      Left = 329
      Top = 271
      Width = 180
      Height = 132
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 3
      object SG05: TStringGrid
        Left = 2
        Top = 2
        Width = 176
        Height = 128
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDblClick = SG05DblClick
        OnDrawCell = SG04DrawCell
        ColWidths = (
          23
          131)
      end
    end
  end
end
