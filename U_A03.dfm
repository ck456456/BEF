object F_A03: TF_A03
  Left = 243
  Top = 159
  Width = 800
  Height = 375
  Caption = 'UV'#33184#26742#34399#35373#23450
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
    Caption = 'UV'#33184#26742#34399#35373#23450
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
    Height = 69
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
    object Label2: TLabel
      Left = 168
      Top = 14
      Width = 30
      Height = 13
      Caption = #23481#37327' :'
    end
    object Label5: TLabel
      Left = 8
      Top = 42
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object E_001: TEdit
      Left = 44
      Top = 10
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_002: TEdit
      Left = 232
      Top = 10
      Width = 106
      Height = 21
      TabOrder = 1
      Text = 'E_002'
    end
    object E_099: TEdit
      Left = 44
      Top = 38
      Width = 685
      Height = 21
      TabOrder = 2
      Text = 'E_099'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 109
    Width = 792
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
      ImeName = #20013#25991' ('#32321#39636') - '#26032#27880#38899
      ItemHeight = 13
      TabOrder = 0
      Text = '0.Hold '
      OnChange = CB_000Change
      Items.Strings = (
        'all'
        '0.Hold '
        '1.WIP '
        '2.Finish '
        '3.Fail'
        '4.Reject')
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 150
    Width = 792
    Height = 157
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 153
      Align = alClient
      ColCount = 4
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
    TabOrder = 4
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
