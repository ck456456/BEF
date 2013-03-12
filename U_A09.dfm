object F_A09: TF_A09
  Left = 0
  Top = 142
  Width = 800
  Height = 375
  Caption = 'In Line Set'
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
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Line Set'
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
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 108
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label7: TLabel
      Left = 45
      Top = 77
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label9: TLabel
      Left = 211
      Top = 15
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
    object Label10: TLabel
      Left = 54
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
    object Label2: TLabel
      Left = 384
      Top = 16
      Width = 60
      Height = 13
      Caption = 'RunSub no :'
    end
    object Label3: TLabel
      Left = 529
      Top = 14
      Width = 30
      Height = 13
      Caption = #24288#21312' :'
    end
    object Label4: TLabel
      Left = 7
      Top = 48
      Width = 67
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'UV'#33184#26009#34399' : '
    end
    object Label5: TLabel
      Left = 216
      Top = 48
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #21097#39192#33184#37327' : '
    end
    object Label6: TLabel
      Left = 387
      Top = 48
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #30446#21069#33184#26742' : '
    end
    object E_099: TEdit
      Left = 80
      Top = 72
      Width = 673
      Height = 21
      TabOrder = 0
      Text = 'E_099'
    end
    object E_002: TEdit
      Left = 80
      Top = 11
      Width = 120
      Height = 21
      TabOrder = 1
      Text = 'E_002'
    end
    object E_003: TEdit
      Left = 251
      Top = 11
      Width = 120
      Height = 21
      TabOrder = 2
      Text = 'E_003'
    end
    object E_004: TEdit
      Left = 454
      Top = 11
      Width = 29
      Height = 21
      TabOrder = 3
      Text = '01'
    end
    object CB_005: TComboBox
      Left = 572
      Top = 10
      Width = 99
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_006: TComboBox
      Left = 78
      Top = 44
      Width = 123
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'CB_006'
    end
    object E_007: TEdit
      Left = 288
      Top = 44
      Width = 69
      Height = 21
      TabOrder = 6
      Text = 'E_007'
    end
    object E_008: TEdit
      Left = 454
      Top = 44
      Width = 115
      Height = 21
      TabOrder = 7
      Text = 'E_008'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 149
    Width = 792
    Height = 158
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 36
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label11: TLabel
        Left = 16
        Top = 11
        Width = 39
        Height = 13
        Caption = 'Station :'
      end
      object CB_001: TComboBox
        Left = 59
        Top = 7
        Width = 99
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
      Top = 38
      Width = 788
      Height = 118
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 1
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        72
        64
        38
        90
        64
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
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
end
