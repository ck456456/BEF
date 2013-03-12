object F_A13: TF_A13
  Left = -3
  Top = 125
  Width = 803
  Height = 375
  Caption = '('#25613#32791'/'#25910#26009#19981#36275') '#21407#22240
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
    Width = 795
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = '('#25613#32791'/'#25910#26009#19981#36275') '#21407#22240
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
    Width = 795
    Height = 69
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 25
      Top = 46
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label5: TLabel
      Left = 165
      Top = 46
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label11: TLabel
      Left = 6
      Top = 14
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object Label2: TLabel
      Left = 164
      Top = 14
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object E_002: TEdit
      Left = 52
      Top = 42
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_002'
    end
    object E_003: TEdit
      Left = 202
      Top = 42
      Width = 579
      Height = 21
      TabOrder = 1
      Text = 'E_003'
    end
    object CB_001: TComboBox
      Left = 52
      Top = 10
      Width = 107
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449
        #20998#26781#31449)
    end
    object CB_004: TComboBox
      Left = 204
      Top = 10
      Width = 107
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #25613#32791#21407#22240
      Items.Strings = (
        #25613#32791#21407#22240
        #25910#26009#19981#36275#21407#22240)
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 109
    Width = 795
    Height = 198
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 791
      Height = 194
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        133
        74
        64
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 795
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      795
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
      Left = 706
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
end
