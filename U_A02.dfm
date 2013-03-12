object F_A02: TF_A02
  Left = 0
  Top = 95
  Width = 800
  Height = 367
  Caption = 'Product Set'
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
    Width = 792
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #29983#29986#21028#32026#26009#34399
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
    Width = 792
    Height = 166
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label5: TLabel
      Left = 8
      Top = 136
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label2: TLabel
      Left = 170
      Top = 14
      Width = 54
      Height = 13
      Caption = #30446#27161#26009#34399' :'
    end
    object Label3: TLabel
      Left = 393
      Top = 14
      Width = 30
      Height = 13
      Caption = #32026#21029' :'
    end
    object Label4: TLabel
      Left = 192
      Top = 46
      Width = 57
      Height = 13
      Caption = 'PET '#23532#24133' : '
    end
    object Label6: TLabel
      Left = 363
      Top = 46
      Width = 54
      Height = 13
      Caption = 'PET '#21402#24230' :'
    end
    object Label7: TLabel
      Left = 28
      Top = 46
      Width = 57
      Height = 13
      Caption = 'PET '#24288#21830' : '
    end
    object Label8: TLabel
      Left = 509
      Top = 46
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PET '#34389#29702' :'
    end
    object Label9: TLabel
      Left = 10
      Top = 74
      Width = 69
      Height = 13
      Caption = #20445#35703#33180#24288#21830' : '
    end
    object Label10: TLabel
      Left = 174
      Top = 74
      Width = 69
      Height = 13
      Caption = #20445#35703#33180#23532#24133' : '
    end
    object Label11: TLabel
      Left = 351
      Top = 74
      Width = 66
      Height = 13
      Caption = #20445#35703#33180#21402#24230' :'
    end
    object Label12: TLabel
      Left = 497
      Top = 74
      Width = 78
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20445#35703#33180'Type :'
    end
    object Label13: TLabel
      Left = 21
      Top = 103
      Width = 66
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27298#39511#23532#24133' :'
    end
    object Label14: TLabel
      Left = 155
      Top = 103
      Width = 94
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #27599#31859#27161#28310#37325#37327' :'
    end
    object Label15: TLabel
      Left = 344
      Top = 103
      Width = 73
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #31665#25976'('#26855#26495') :'
    end
    object Label16: TLabel
      Left = 510
      Top = 103
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #21253#26448#37325#37327' :'
    end
    object Label17: TLabel
      Left = 508
      Top = 14
      Width = 67
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25104#21697#26009#34399' :'
    end
    object E_001: TEdit
      Left = 44
      Top = 10
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_099: TEdit
      Left = 44
      Top = 132
      Width = 708
      Height = 21
      TabOrder = 1
      Text = 'E_099'
    end
    object CB_002: TComboBox
      Left = 234
      Top = 10
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'CB_002'
    end
    object E_003: TEdit
      Left = 427
      Top = 10
      Width = 45
      Height = 21
      TabOrder = 3
      Text = 'E_003'
    end
    object E_004: TEdit
      Left = 252
      Top = 42
      Width = 68
      Height = 21
      TabOrder = 4
      Text = 'E_004'
    end
    object E_005: TEdit
      Left = 424
      Top = 42
      Width = 68
      Height = 21
      TabOrder = 5
      Text = 'E_005'
    end
    object E_006: TEdit
      Left = 92
      Top = 42
      Width = 68
      Height = 21
      TabOrder = 6
      Text = 'E_006'
    end
    object CB_007: TComboBox
      Left = 584
      Top = 42
      Width = 68
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = #21934#38754
      Items.Strings = (
        #21934#38754
        #38617#38754)
    end
    object E_103: TEdit
      Left = 92
      Top = 70
      Width = 68
      Height = 21
      TabOrder = 8
      Text = 'E_103'
    end
    object E_101: TEdit
      Left = 252
      Top = 70
      Width = 68
      Height = 21
      TabOrder = 9
      Text = 'E_101'
    end
    object E_102: TEdit
      Left = 424
      Top = 70
      Width = 68
      Height = 21
      TabOrder = 10
      Text = 'E_102'
    end
    object E_104: TEdit
      Left = 584
      Top = 70
      Width = 68
      Height = 21
      TabOrder = 11
      Text = 'E_104'
    end
    object E_201: TEdit
      Left = 91
      Top = 99
      Width = 56
      Height = 21
      TabOrder = 12
      Text = 'E_201'
    end
    object E_202: TEdit
      Left = 252
      Top = 99
      Width = 68
      Height = 21
      TabOrder = 13
      Text = 'E_202'
    end
    object E_203: TEdit
      Left = 423
      Top = 99
      Width = 68
      Height = 21
      TabOrder = 14
      Text = 'E_203'
    end
    object E_204: TEdit
      Left = 584
      Top = 99
      Width = 68
      Height = 21
      TabOrder = 15
      Text = 'E_204'
    end
    object E_008: TEdit
      Left = 584
      Top = 10
      Width = 144
      Height = 21
      TabOrder = 16
      Text = 'E_008'
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 206
    Width = 792
    Height = 93
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 89
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 16
      FixedCols = 0
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
    Top = 299
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
      Left = 703
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
end
