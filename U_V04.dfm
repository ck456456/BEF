object F_V04: TF_V04
  Left = 0
  Top = 27
  Width = 800
  Height = 481
  Caption = 'Input Event'
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
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Input Event'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 413
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object B_Cls: TBitBtn
      Left = 700
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_Save: TBitBtn
      Left = 32
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      Default = True
      TabOrder = 1
      OnClick = B_SaveClick
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
  object P_00: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object L_001: TLabel
      Left = 180
      Top = 4
      Width = 29
      Height = 13
      Caption = 'L_001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_002: TLabel
      Left = 180
      Top = 21
      Width = 29
      Height = 13
      Caption = 'L_002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_003: TLabel
      Left = 268
      Top = 22
      Width = 29
      Height = 13
      Caption = 'L_003'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 12
      Top = 4
      Width = 55
      Height = 13
      Caption = #38283#22987#26178#38291' :'
    end
    object Label13: TLabel
      Left = 12
      Top = 23
      Width = 55
      Height = 13
      Caption = #32080#26463#26178#38291' :'
    end
    object L_102: TLabel
      Left = 70
      Top = 4
      Width = 29
      Height = 13
      Caption = 'L_102'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_103: TLabel
      Left = 70
      Top = 23
      Width = 29
      Height = 13
      Caption = 'L_103'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_101: TLabel
      Left = 268
      Top = 4
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_202: TLabel
      Left = 420
      Top = 4
      Width = 29
      Height = 13
      Caption = 'L_202'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object L_Tme: TLabel
      Left = 420
      Top = 20
      Width = 31
      Height = 13
      Caption = 'L_Tme'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object P_01: TPanel
    Left = 0
    Top = 82
    Width = 792
    Height = 58
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label4: TLabel
      Left = 19
      Top = 10
      Width = 32
      Height = 13
      Caption = 'OPID :'
    end
    object Label6: TLabel
      Left = 21
      Top = 36
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object L_104: TLabel
      Left = 152
      Top = 11
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object E_201: TEdit
      Left = 58
      Top = 7
      Width = 75
      Height = 21
      TabOrder = 0
    end
    object E_299: TEdit
      Left = 58
      Top = 32
      Width = 542
      Height = 21
      TabOrder = 1
    end
    object CB_104: TComboBox
      Left = 202
      Top = 7
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object P_02: TPanel
    Left = 0
    Top = 140
    Width = 792
    Height = 65
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 4
    object Label2: TLabel
      Left = 21
      Top = 36
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label1: TLabel
      Left = 19
      Top = 10
      Width = 32
      Height = 13
      Caption = 'OPID :'
    end
    object E_399: TEdit
      Left = 58
      Top = 32
      Width = 542
      Height = 21
      TabOrder = 0
    end
    object E_301: TEdit
      Left = 58
      Top = 7
      Width = 75
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 205
    Width = 792
    Height = 77
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 5
    object Label8: TLabel
      Left = 7
      Top = 16
      Width = 54
      Height = 13
      Caption = #19978#20445#35703#33180' :'
    end
    object L_UPPNo: TLabel
      Left = 276
      Top = 16
      Width = 48
      Height = 13
      Caption = 'L_UPPNo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L_DNPno: TLabel
      Left = 276
      Top = 44
      Width = 47
      Height = 13
      Caption = 'L_DNPno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 44
      Width = 54
      Height = 13
      Caption = #19979#20445#35703#33180' :'
    end
    object CB401: TComboBox
      Left = 69
      Top = 12
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = CB401Change
    end
    object CB402: TComboBox
      Left = 69
      Top = 40
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnChange = CB401Change
    end
    object E_403: TEdit
      Left = 219
      Top = 12
      Width = 46
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object E_404: TEdit
      Left = 220
      Top = 40
      Width = 46
      Height = 21
      TabOrder = 3
      Text = '0'
    end
  end
end
