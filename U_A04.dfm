object F_A04: TF_A04
  Left = 90
  Top = 162
  Width = 804
  Height = 375
  Caption = 'Test Group'
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
    Top = 114
    Width = 796
    Height = 2
    Cursor = crVSplit
    Align = alTop
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 796
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Test Group'
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
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 796
    Height = 73
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 46
      Top = 15
      Width = 20
      Height = 13
      Caption = 'No :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 237
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Name :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 35
      Top = 47
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object E_002: TEdit
      Left = 72
      Top = 13
      Width = 120
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'E_002'
    end
    object E_003: TEdit
      Left = 280
      Top = 12
      Width = 120
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = 'E_003'
    end
    object E_099: TEdit
      Left = 70
      Top = 42
      Width = 617
      Height = 21
      TabOrder = 2
      Text = 'E_099'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 116
    Width = 796
    Height = 191
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 792
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label11: TLabel
        Left = 21
        Top = 12
        Width = 39
        Height = 13
        Caption = 'Station :'
      end
      object CB_001: TComboBox
        Left = 67
        Top = 8
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #25104#22411#31449
        OnChange = CB_001Change
        Items.Strings = (
          #25104#22411#31449
          #35097#33180#31449
          #20998#26781#31449)
      end
    end
    object SG01: TStringGrid
      Left = 2
      Top = 43
      Width = 792
      Height = 146
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 1
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        72
        64
        64
        77)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 796
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      796
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
      Left = 959
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
    object BitBtn1: TBitBtn
      Left = 704
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 3
      Kind = bkClose
    end
  end
end
