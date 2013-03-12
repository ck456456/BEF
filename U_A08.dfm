object F_A08: TF_A08
  Left = 0
  Top = 250
  Width = 800
  Height = 375
  Caption = 'Event Set'
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
    Caption = 'Event Set'
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
    Height = 91
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 30
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label2: TLabel
      Left = 671
      Top = 58
      Width = 30
      Height = 13
      Caption = 'Color :'
    end
    object E_001: TEdit
      Left = 41
      Top = 26
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_002: TEdit
      Left = 158
      Top = 26
      Width = 595
      Height = 21
      TabOrder = 1
      Text = 'E_002'
    end
    object CB_102: TComboBox
      Left = 40
      Top = 54
      Width = 106
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        #29986#32218
        #32173#20462#20445#39178
        #20844#29992
        #31995#32113)
    end
    object CB_103: TCheckBox
      Left = 160
      Top = 56
      Width = 71
      Height = 17
      Caption = 'Downtime'
      TabOrder = 3
    end
    object P_104: TPanel
      Left = 706
      Top = 53
      Width = 58
      Height = 22
      BevelInner = bvLowered
      TabOrder = 4
      OnClick = P_104Click
    end
    object CB_105: TCheckBox
      Left = 236
      Top = 56
      Width = 74
      Height = 17
      Caption = #26159#21542#25187#26009
      TabOrder = 5
    end
    object CB_106: TCheckBox
      Left = 308
      Top = 56
      Width = 96
      Height = 17
      Caption = #26159#21542#36899#32080#24037#21934
      TabOrder = 6
    end
    object CB_107: TCheckBox
      Left = 409
      Top = 54
      Width = 124
      Height = 17
      Caption = 'Monitoring '#35686#31034#20449#20214
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
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
  object Panel4: TPanel
    Left = 0
    Top = 167
    Width = 792
    Height = 140
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 136
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        64
        187)
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 131
    Width = 792
    Height = 36
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 4
    object Label11: TLabel
      Left = 16
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object CB_101: TComboBox
      Left = 59
      Top = 7
      Width = 99
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #25104#22411#31449
      OnChange = CB_101Change
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449
        #20998#26781#31449)
    end
  end
  object CDg: TColorDialog
    Left = 8
    Top = 5
  end
end
