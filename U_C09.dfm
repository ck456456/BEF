object F_C09: TF_C09
  Left = 256
  Top = 79
  Width = 544
  Height = 375
  Caption = #22577#24290'/'#20837#20489#20316#26989' ('#35097#33180')'
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
  object Splitter1: TSplitter
    Left = 185
    Top = 91
    Height = 257
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #22577#24290'/'#20837#20489#20316#26989' ('#35097#33180')'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 536
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 17
      Top = 17
      Width = 30
      Height = 13
      Caption = #20489#21029' :'
    end
    object CB_013: TComboBox
      Left = 58
      Top = 13
      Width = 102
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = CB_013Change
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 91
    Width = 185
    Height = 257
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object SG02: TCIM_Grid
      Left = 2
      Top = 2
      Width = 181
      Height = 253
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      CIMOptions = [goSorting]
    end
  end
  object Panel1: TPanel
    Left = 188
    Top = 91
    Width = 348
    Height = 257
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 344
      Height = 253
      Align = alClient
      ColCount = 11
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      OnDblClick = SG01DblClick
      CIMOptions = [goSorting]
    end
  end
end
