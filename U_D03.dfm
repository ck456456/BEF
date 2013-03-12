object F_D03: TF_D03
  Left = -13
  Top = 121
  Width = 812
  Height = 375
  Caption = 'Defect Report'
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
    Width = 804
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Defect Report'
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
    Top = 307
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
    object B_Chart: TBitBtn
      Left = 200
      Top = 8
      Width = 101
      Height = 25
      Caption = 'Chart'
      Default = True
      TabOrder = 3
      OnClick = B_ChartClick
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
    Width = 804
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label11: TLabel
      Left = 33
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object Label3: TLabel
      Left = 415
      Top = 35
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label5: TLabel
      Left = 37
      Top = 35
      Width = 35
      Height = 13
      Caption = 'Group :'
    end
    object L_Date: TLabel
      Left = 214
      Top = 11
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date :'
    end
    object L_Type: TLabel
      Left = 217
      Top = 35
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Run :'
    end
    object Label2: TLabel
      Left = 395
      Top = 11
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Working :'
    end
    object Label6: TLabel
      Left = 199
      Top = 59
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object CB000: TComboBox
      Left = 77
      Top = 7
      Width = 120
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #25104#22411#31449
      OnChange = CB000Change
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CBGRP: TComboBox
      Left = 77
      Top = 31
      Width = 120
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'CB_003'
      OnChange = CBGRPChange
      Items.Strings = (
        'CB_003')
    end
    object EB102: TEdit
      Left = 250
      Top = 7
      Width = 60
      Height = 21
      TabOrder = 2
      Text = '20040101'
    end
    object EE102: TEdit
      Left = 314
      Top = 7
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '20040101'
    end
    object EB001: TEdit
      Left = 250
      Top = 31
      Width = 60
      Height = 21
      TabOrder = 4
    end
    object EE001: TEdit
      Left = 314
      Top = 31
      Width = 60
      Height = 21
      TabOrder = 5
    end
    object CB004: TComboBox
      Left = 250
      Top = 55
      Width = 126
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      OnChange = CB004Change
      Items.Strings = (
        ''
        'FRESNEL')
    end
    object CB_BLn: TComboBox
      Left = 449
      Top = 31
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_ELn: TComboBox
      Left = 577
      Top = 31
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB006: TComboBox
      Left = 449
      Top = 7
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 9
    end
    object CE006: TComboBox
      Left = 577
      Top = 7
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 10
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 130
    Width = 804
    Height = 177
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 800
      Height = 173
      Align = alClient
      ColCount = 8
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnDblClick = SG01DblClick
      ColWidths = (
        54
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
