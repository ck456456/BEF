object F_B05: TF_B05
  Left = 236
  Top = 110
  Width = 544
  Height = 375
  Caption = #19979#20445#35703#33180' Set'
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
    Width = 536
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #19979#20445#35703#33180' Set'
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
    Width = 536
    Height = 108
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 12
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label6: TLabel
      Left = 188
      Top = 12
      Width = 27
      Height = 13
      Caption = 'PNo :'
    end
    object Label4: TLabel
      Left = 364
      Top = 12
      Width = 54
      Height = 13
      Caption = #21407#22987#23610#23544' :'
    end
    object Label3: TLabel
      Left = 556
      Top = 12
      Width = 66
      Height = 13
      Caption = #24050#20351#29992#23610#23544' :'
    end
    object E_201: TEdit
      Left = 88
      Top = 39
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_201'
    end
    object E_203: TEdit
      Left = 202
      Top = 39
      Width = 550
      Height = 21
      TabOrder = 1
      Text = 'E_203'
    end
    object CB_002: TComboBox
      Left = 225
      Top = 8
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object E_001: TEdit
      Left = 40
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'E_001'
    end
    object E_202: TEdit
      Left = 88
      Top = 71
      Width = 106
      Height = 21
      TabOrder = 4
      Text = 'E_202'
    end
    object E_204: TEdit
      Left = 202
      Top = 71
      Width = 550
      Height = 21
      TabOrder = 5
      Text = 'E_204'
    end
    object B_201: TButton
      Left = 10
      Top = 39
      Width = 66
      Height = 25
      Caption = #20837#20489#26178#38291
      TabOrder = 6
      OnClick = B_201Click
    end
    object B_202: TButton
      Left = 10
      Top = 70
      Width = 66
      Height = 25
      Caption = #38626#20489#26178#38291
      TabOrder = 7
      OnClick = B_201Click
    end
    object E_102: TEdit
      Left = 424
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 8
      Text = 'E_102'
    end
    object E_103: TEdit
      Left = 629
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 9
      Text = 'E_103'
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 148
    Width = 536
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 13
      Width = 30
      Height = 13
      Caption = #29376#24907' :'
    end
    object CB_101: TComboBox
      Left = 59
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = '0.Hold '
      OnChange = CB_101Change
      Items.Strings = (
        'all'
        '0.Hold '
        '1.Running'
        '2.Finish '
        '3.Fail'
        '4.Reject')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 536
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      536
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
      Left = 447
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 189
    Width = 536
    Height = 118
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 4
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 532
      Height = 114
      Align = alClient
      ColCount = 10
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnDblClick = SG01DblClick
      OnDrawCell = SG01DrawCell
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        64
        114
        64
        103
        112
        179
        151
        64
        64
        64)
    end
  end
end
