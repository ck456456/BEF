object F_D22: TF_D22
  Left = 84
  Top = 160
  Width = 879
  Height = 375
  Caption = #24235#23384#26126#32048#22577#34920
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
    Width = 871
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #24235#23384#26126#32048#22577#34920
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
    Width = 871
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      871
      41)
    object B_Close: TBitBtn
      Left = 780
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
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 871
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 448
      Top = 15
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #38263#24230#19979#38480' : '
    end
    object Label2: TLabel
      Left = 16
      Top = 15
      Width = 71
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #29986#21697#21029' : '
    end
    object Label3: TLabel
      Left = 259
      Top = 16
      Width = 30
      Height = 13
      Caption = #20489#21029' :'
    end
    object Label4: TLabel
      Left = 664
      Top = 15
      Width = 26
      Height = 13
      Caption = 'Run :'
    end
    object CB_Type: TComboBox
      Left = 95
      Top = 11
      Width = 154
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'all'
      OnChange = CB_TypeChange
      Items.Strings = (
        'all')
    end
    object E_LEN: TEdit
      Left = 528
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object CB_013: TComboBox
      Left = 297
      Top = 12
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'CB_013'
      OnChange = CB_TypeChange
    end
    object E_Run: TEdit
      Left = 701
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 871
    Height = 219
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 867
      Height = 215
      Align = alClient
      ColCount = 12
      DefaultColWidth = 32
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDrawCell = SG01DrawCell
      CIMOptions = [goSorting]
    end
  end
end
