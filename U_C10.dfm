object F_C10: TF_C10
  Left = 50
  Top = 184
  Width = 800
  Height = 375
  Caption = #24235#25151#31449
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
    Top = 89
    Height = 259
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #24235#25151#31449
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
    Top = 41
    Width = 792
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object L_010: TLabel
      Left = 97
      Top = 18
      Width = 30
      Height = 13
      Caption = 'L_010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 152
      Top = 18
      Width = 30
      Height = 13
      Caption = #20489#21029' :'
    end
    object CB_013: TComboBox
      Left = 190
      Top = 14
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'CB_013'
    end
    object B_Save: TButton
      Left = 351
      Top = 12
      Width = 58
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = B_SaveClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 89
    Width = 185
    Height = 259
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object SG02: TCIM_Grid
      Left = 2
      Top = 2
      Width = 181
      Height = 255
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      OnKeyUp = SG02KeyUp
      OnMouseUp = SG02MouseUp
      CIMOptions = [goSorting]
    end
  end
  object Panel4: TPanel
    Left = 188
    Top = 89
    Width = 604
    Height = 259
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 600
      Height = 255
      Align = alClient
      ColCount = 13
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      OnKeyUp = SG02KeyUp
      OnMouseUp = SG02MouseUp
      CIMOptions = [goSorting]
    end
  end
end
