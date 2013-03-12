object F_B03: TF_B03
  Left = -6
  Top = 182
  Width = 1033
  Height = 402
  Caption = 'UV'#33184#35373#23450
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1025
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = 'UV'#33184#35373#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object L_Kind: TLabel
      Left = 700
      Top = 10
      Width = 27
      Height = 23
      Caption = '123'
      Visible = False
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 40
    Width = 1025
    Height = 122
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 23
      Top = 14
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label2: TLabel
      Left = 493
      Top = 16
      Width = 78
      Height = 13
      Caption = #21407#29289#26009#32232#34399' :    '
    end
    object Label5: TLabel
      Left = 14
      Top = 93
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label4: TLabel
      Left = 226
      Top = 66
      Width = 42
      Height = 13
      Caption = #40655#24230' :    '
    end
    object Label6: TLabel
      Left = 226
      Top = 40
      Width = 42
      Height = 13
      Caption = #26085#26399' :    '
    end
    object Label7: TLabel
      Left = 426
      Top = 66
      Width = 42
      Height = 13
      Caption = #32317#37325' :    '
    end
    object Label8: TLabel
      Left = 10
      Top = 40
      Width = 33
      Height = 13
      Caption = #26742#34399' : '
    end
    object Label9: TLabel
      Left = 599
      Top = 66
      Width = 51
      Height = 13
      Caption = #22238#25910#37327' :   '
    end
    object Label10: TLabel
      Left = 8
      Top = 66
      Width = 42
      Height = 13
      Caption = #33184#31278' :    '
    end
    object Label11: TLabel
      Left = 217
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Product : '
    end
    object E_001: TEdit
      Left = 55
      Top = 10
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_006: TEdit
      Left = 575
      Top = 12
      Width = 95
      Height = 21
      TabOrder = 1
      Text = 'E_006'
    end
    object E_099: TEdit
      Left = 55
      Top = 89
      Width = 726
      Height = 21
      TabOrder = 2
      Text = 'E_099'
    end
    object E_101: TEdit
      Left = 269
      Top = 62
      Width = 145
      Height = 21
      TabOrder = 3
      Text = 'E_101'
    end
    object E_004: TEdit
      Left = 269
      Top = 36
      Width = 145
      Height = 21
      TabOrder = 4
      Text = 'E_004'
    end
    object E_102: TEdit
      Left = 468
      Top = 62
      Width = 121
      Height = 21
      TabOrder = 5
      Text = 'E_102'
    end
    object CB_003: TComboBox
      Left = 55
      Top = 36
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = 'CB_003'
    end
    object E_103: TEdit
      Left = 650
      Top = 62
      Width = 121
      Height = 21
      TabOrder = 7
      Text = 'E_103'
    end
    object E_005: TEdit
      Left = 55
      Top = 62
      Width = 145
      Height = 21
      TabOrder = 8
      Text = 'E_005'
    end
    object E_007: TEdit
      Left = 675
      Top = 12
      Width = 95
      Height = 21
      TabOrder = 9
      Text = 'E_007'
    end
    object CB_002: TComboBox
      Left = 269
      Top = 12
      Width = 219
      Height = 21
      ItemHeight = 13
      TabOrder = 10
      Text = 'CB_002'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 162
    Width = 1025
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 13
      Width = 30
      Height = 13
      Caption = #29376#24907' :'
    end
    object CB_000: TComboBox
      Left = 59
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = '0.Hold '
      OnChange = CB_000Change
      Items.Strings = (
        '0.Hold '
        '1.Running'
        '2.Finish '
        '3.Fail'
        '4.Reject')
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 203
    Width = 1025
    Height = 131
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 1021
      Height = 127
      Align = alClient
      ColCount = 13
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnDblClick = SG01DblClick
      OnDrawCell = SG01DrawCell
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        133
        74
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 334
    Width = 1025
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 4
    DesignSize = (
      1025
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
      Left = 936
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
end
