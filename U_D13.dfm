object F_D13: TF_D13
  Left = 1
  Top = 132
  Width = 797
  Height = 287
  Caption = 'Pet '#20351#29992#29575
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
    Width = 789
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Pet '#20351#29992#29575
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
    Top = 219
    Width = 789
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      789
      41)
    object B_Close: TBitBtn
      Left = 698
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
      Top = 8
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
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 789
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label4: TLabel
      Left = 12
      Top = 12
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'No :'
    end
    object L_Date: TLabel
      Left = 350
      Top = 12
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date :'
    end
    object CB_BNo: TComboBox
      Left = 39
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'CB_BNo'
    end
    object CB_ENo: TComboBox
      Left = 191
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'CB_ENo'
    end
    object E_EDT: TEdit
      Left = 450
      Top = 8
      Width = 60
      Height = 21
      TabOrder = 2
      Text = 'Z'
    end
    object E_BDT: TEdit
      Left = 386
      Top = 8
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '20040101'
    end
    object CB_Type: TCheckBox
      Left = 552
      Top = 10
      Width = 48
      Height = 17
      Caption = #32048#31680
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 82
    Width = 789
    Height = 137
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 785
      Height = 133
      Align = alClient
      ColCount = 16
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnDrawCell = SG01DrawCell
      ColWidths = (
        54
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
        64
        64
        64
        64
        64)
    end
  end
end
