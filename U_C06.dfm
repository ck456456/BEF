object F_C06: TF_C06
  Left = 0
  Top = 64
  Width = 800
  Height = 419
  Caption = #20986#36008#25490#31243
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
    Top = 190
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
    Caption = #20986#36008#25490#31243
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object L_Kind: TLabel
      Left = 26
      Top = 8
      Width = 5
      Height = 23
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 149
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label2: TLabel
      Left = 39
      Top = 15
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label5: TLabel
      Left = 30
      Top = 116
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label4: TLabel
      Left = 427
      Top = 48
      Width = 66
      Height = 13
      Caption = #38928#35336#20986#36008#26085' :'
    end
    object Label6: TLabel
      Left = 607
      Top = 48
      Width = 69
      Height = 13
      Caption = #23526#38555#23436#25104#26085' : '
    end
    object Label3: TLabel
      Left = 17
      Top = 48
      Width = 42
      Height = 13
      Caption = #29986#21697#21029' :'
    end
    object Label7: TLabel
      Left = 650
      Top = 15
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#36008'm2 :'
    end
    object Label10: TLabel
      Left = 213
      Top = 15
      Width = 54
      Height = 13
      Caption = #24037#21934#34399#30908' :'
      Visible = False
    end
    object Label11: TLabel
      Left = 460
      Top = 15
      Width = 33
      Height = 13
      Caption = #23458#25142' : '
    end
    object Label9: TLabel
      Left = 237
      Top = 48
      Width = 30
      Height = 13
      Caption = #26009#34399' :'
    end
    object Label1: TLabel
      Left = 219
      Top = 82
      Width = 48
      Height = 13
      Caption = #31561#32026#38480#21046
    end
    object Label12: TLabel
      Left = 8
      Top = 82
      Width = 57
      Height = 13
      Caption = #38263#24230#38480#21046' : '
    end
    object L_102: TLabel
      Left = 432
      Top = 82
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
    object SB_001: TSpeedButton
      Left = 398
      Top = 78
      Width = 23
      Height = 21
      Caption = '...'
      OnClick = SB_001Click
    end
    object E_001: TEdit
      Left = 67
      Top = 11
      Width = 142
      Height = 21
      TabOrder = 0
    end
    object E_099: TEdit
      Left = 67
      Top = 112
      Width = 665
      Height = 21
      TabOrder = 1
      Text = 'E_099'
    end
    object CB_002: TComboBox
      Left = 67
      Top = 44
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'CB_002'
      OnChange = CB_002Change
    end
    object E_007: TEdit
      Left = 696
      Top = 11
      Width = 82
      Height = 21
      TabOrder = 3
    end
    object E_003: TEdit
      Left = 275
      Top = 11
      Width = 142
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object E_004: TDateTimePicker
      Left = 501
      Top = 44
      Width = 87
      Height = 21
      Date = 39420.393580601850000000
      Format = 'yyyyMMdd'
      Time = 39420.393580601850000000
      TabOrder = 5
    end
    object CB_008: TComboBox
      Left = 275
      Top = 44
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = CB_008Change
    end
    object E_104: TEdit
      Left = 275
      Top = 78
      Width = 118
      Height = 21
      TabOrder = 7
      Text = 'E_104'
      OnExit = E_104Exit
    end
    object E_102: TEdit
      Left = 67
      Top = 78
      Width = 69
      Height = 21
      TabOrder = 8
      Text = 'E_102'
    end
    object E_103: TEdit
      Left = 144
      Top = 78
      Width = 69
      Height = 21
      TabOrder = 9
      Text = 'E_103'
    end
    object E_005: TDateTimePicker
      Left = 679
      Top = 44
      Width = 87
      Height = 21
      Date = 39420.393580601850000000
      Format = 'yyyyMMdd'
      Time = 39420.393580601850000000
      TabOrder = 10
    end
    object CB_006: TComboBox
      Left = 500
      Top = 12
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 11
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 351
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
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
    object B_Close: TBitBtn
      Left = 701
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_Delete: TBitBtn
      Left = 266
      Top = 8
      Width = 52
      Height = 25
      Caption = 'Delete'
      TabOrder = 1
      OnClick = SB_InquireClick
    end
    object B_Save: TBitBtn
      Left = 328
      Top = 8
      Width = 52
      Height = 25
      Caption = 'Save'
      TabOrder = 2
      OnClick = SB_InquireClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 193
    Width = 792
    Height = 158
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 521
      Top = 0
      Height = 158
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 521
      Height = 158
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 41
        Width = 521
        Height = 117
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object SG01: TStringGrid
          Left = 2
          Top = 2
          Width = 517
          Height = 113
          Align = alClient
          ColCount = 10
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          TabOrder = 0
          OnDblClick = SG01DblClick
          OnDrawCell = SG01DrawCell
          OnKeyUp = SG01KeyUp
          OnMouseUp = SG01MouseUp
          ColWidths = (
            40
            64
            64
            74
            70
            64
            64
            57
            64
            198)
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 521
        Height = 41
        Align = alTop
        BevelInner = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label8: TLabel
          Left = 13
          Top = 11
          Width = 36
          Height = 13
          Caption = 'Status :'
        end
        object CB_Status: TComboBox
          Left = 58
          Top = 7
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 0
          Text = 'Hold,Running'
          OnChange = CB_StatusChange
          Items.Strings = (
            'all'
            'Hold,Running'
            'Finish'
            'Fail')
        end
        object B_Select: TBitBtn
          Left = 432
          Top = 9
          Width = 75
          Height = 25
          Caption = #20986#36008#36984#25799
          TabOrder = 1
          OnClick = B_SelectClick
        end
      end
    end
    object Panel8: TPanel
      Left = 524
      Top = 0
      Width = 268
      Height = 158
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter3: TSplitter
        Left = 0
        Top = 95
        Width = 268
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object SG99: TStringGrid
        Left = 0
        Top = 0
        Width = 268
        Height = 95
        Align = alTop
        ColCount = 8
        DefaultRowHeight = 16
        RowCount = 4
        TabOrder = 0
      end
      object SG02: TStringGrid
        Left = 0
        Top = 98
        Width = 268
        Height = 60
        Align = alClient
        ColCount = 6
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
        OnDrawCell = SG02DrawCell
      end
    end
  end
end
