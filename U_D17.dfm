object F_D17: TF_D17
  Left = 0
  Top = 108
  Width = 800
  Height = 375
  Caption = 'QA'#36028#33180#33391#29575#22577#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
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
    Caption = 'QA'#36028#33180#33391#29575#22577#34920
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 71
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 200
      Top = 39
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label2: TLabel
      Left = 180
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label4: TLabel
      Left = 6
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object Label5: TLabel
      Left = 10
      Top = 39
      Width = 29
      Height = 13
      Caption = 'Date :'
    end
    object Label6: TLabel
      Left = 497
      Top = 10
      Width = 26
      Height = 13
      Caption = 'Run :'
    end
    object CBType: TComboBox
      Left = 38
      Top = 6
      Width = 127
      Height = 21
      ItemHeight = 13
      TabOrder = 0
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
      Left = 229
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
      Left = 357
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
      Left = 229
      Top = 8
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object CB_EWNo: TComboBox
      Left = 357
      Top = 8
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
    object E_BRun: TEdit
      Left = 526
      Top = 6
      Width = 120
      Height = 21
      TabOrder = 7
    end
    object E_ERun: TEdit
      Left = 654
      Top = 6
      Width = 120
      Height = 21
      TabOrder = 8
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 112
    Width = 792
    Height = 195
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 788
      Height = 191
      Align = alClient
      ColCount = 14
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
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
        64
        64
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
    object B_Close: TBitBtn
      Left = 701
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
    object B_Excel: TBitBtn
      Left = 112
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excel'
      Default = True
      TabOrder = 2
      OnClick = B_ExcelClick
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
end
