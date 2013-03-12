object F_D01: TF_D01
  Left = 10
  Top = 103
  Width = 812
  Height = 320
  Caption = 'Working Info'
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
    Width = 804
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Working Info'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 252
    Width = 804
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      804
      41)
    object B_Close: TBitBtn
      Left = 713
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_OK: TBitBtn
      Left = 17
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = B_OKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 804
    Height = 72
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 192
      Top = 39
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label2: TLabel
      Left = 477
      Top = 39
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label3: TLabel
      Left = 175
      Top = 10
      Width = 43
      Height = 13
      Caption = 'Product :'
    end
    object Label4: TLabel
      Left = 6
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object Label5: TLabel
      Left = 7
      Top = 39
      Width = 29
      Height = 13
      Caption = 'Date :'
    end
    object Label6: TLabel
      Left = 479
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object CBType: TComboBox
      Left = 38
      Top = 6
      Width = 127
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBTypeChange
    end
    object E_BDat: TEdit
      Left = 38
      Top = 35
      Width = 62
      Height = 21
      TabOrder = 1
    end
    object E_EDat: TEdit
      Left = 102
      Top = 35
      Width = 62
      Height = 21
      TabOrder = 2
    end
    object CB_BLn: TComboBox
      Left = 222
      Top = 35
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_ELn: TComboBox
      Left = 350
      Top = 35
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_BWNo: TComboBox
      Left = 526
      Top = 35
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object CB_EWNo: TComboBox
      Left = 654
      Top = 35
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
    object CB_BPNo: TComboBox
      Left = 222
      Top = 6
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 7
    end
    object CB_EPNo: TComboBox
      Left = 350
      Top = 6
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 8
    end
    object CB_BPro: TComboBox
      Left = 525
      Top = 6
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 9
    end
    object CB_EPro: TComboBox
      Left = 653
      Top = 6
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 10
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 113
    Width = 804
    Height = 139
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 800
      Height = 135
      Align = alClient
      ColCount = 11
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      PopupMenu = PopupMenu
      TabOrder = 0
      OnDblClick = SG01DblClick
      OnDrawCell = SG01DrawCell
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
        198
        64)
    end
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 7
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
