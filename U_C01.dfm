object F_C01: TF_C01
  Left = 122
  Top = 171
  Width = 800
  Height = 375
  Caption = 'Working Set'
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
  object Splitter2: TSplitter
    Left = 0
    Top = 161
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
    Caption = 'Working Set'
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
  object Panel2: TPanel
    Left = 0
    Top = 307
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
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 120
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 15
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label5: TLabel
      Left = 33
      Top = 90
      Width = 23
      Height = 13
      Caption = 'Not :'
    end
    object Label4: TLabel
      Left = 23
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Begin :'
    end
    object Label6: TLabel
      Left = 179
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Finish :'
    end
    object Label7: TLabel
      Left = 169
      Top = 15
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object L_301: TLabel
      Left = 610
      Top = 10
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'A :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object L_302: TLabel
      Left = 610
      Top = 31
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'B :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object L_303: TLabel
      Left = 610
      Top = 53
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'C :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object L_304: TLabel
      Left = 610
      Top = 74
      Width = 24
      Height = 16
      Alignment = taRightJustify
      Caption = 'D :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object L_305: TLabel
      Left = 602
      Top = 96
      Width = 32
      Height = 16
      Alignment = taRightJustify
      Caption = 'NG :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object E_001: TEdit
      Left = 59
      Top = 11
      Width = 107
      Height = 21
      TabOrder = 0
    end
    object E_099: TEdit
      Left = 59
      Top = 86
      Width = 423
      Height = 21
      TabOrder = 1
      Text = 'E_099'
    end
    object E_201: TEdit
      Left = 59
      Top = 48
      Width = 107
      Height = 21
      TabOrder = 2
      Text = 'E_201'
    end
    object E_202: TEdit
      Left = 215
      Top = 48
      Width = 107
      Height = 21
      TabOrder = 3
      Text = 'E_202'
    end
    object CB_004: TComboBox
      Left = 216
      Top = 11
      Width = 107
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'CB_004'
      OnChange = CB_004Change
    end
    object E_301: TEdit
      Left = 639
      Top = 6
      Width = 145
      Height = 21
      TabOrder = 5
      Text = 'E_301'
    end
    object E_302: TEdit
      Left = 639
      Top = 27
      Width = 145
      Height = 21
      TabOrder = 6
      Text = 'E_302'
    end
    object E_303: TEdit
      Left = 639
      Top = 49
      Width = 145
      Height = 21
      TabOrder = 7
      Text = 'E_303'
    end
    object E_304: TEdit
      Left = 639
      Top = 70
      Width = 145
      Height = 21
      TabOrder = 8
      Text = 'E_304'
    end
    object E_305: TEdit
      Left = 639
      Top = 92
      Width = 145
      Height = 21
      TabOrder = 9
      Text = 'E_305'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 164
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label8: TLabel
      Left = 137
      Top = 11
      Width = 36
      Height = 13
      Caption = 'Status :'
    end
    object Label1: TLabel
      Left = 309
      Top = 13
      Width = 78
      Height = 13
      Caption = #29983#29986#30446#27161#26009#34399' :'
    end
    object Label9: TLabel
      Left = 596
      Top = 13
      Width = 26
      Height = 13
      Caption = 'Line :'
      Visible = False
    end
    object Label3: TLabel
      Left = 13
      Top = 11
      Width = 30
      Height = 13
      Caption = #31449#21029' :'
    end
    object CB_Status: TComboBox
      Left = 182
      Top = 7
      Width = 108
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
    object CB_002: TComboBox
      Left = 399
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'CB_002'
      OnChange = CB_002Change
    end
    object CB_005: TComboBox
      Left = 629
      Top = 9
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'CB_005'
      Visible = False
      OnChange = CB_StatusChange
    end
    object CB_006: TComboBox
      Left = 58
      Top = 7
      Width = 70
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'all'
      OnChange = CB_StatusChange
      Items.Strings = (
        'all'
        #25104#22411#31449
        #35097#33180#31449
        #20998#26781#31449)
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 205
    Width = 792
    Height = 102
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 4
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 98
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
end
