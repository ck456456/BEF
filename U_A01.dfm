object F_A01: TF_A01
  Left = -4
  Top = -4
  Width = 1032
  Height = 776
  Caption = 'Product Type'
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
    Width = 1024
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #29983#29986#30446#27161#26009#34399
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
    Width = 1024
    Height = 81
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 14
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label5: TLabel
      Left = 8
      Top = 46
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object E_001: TEdit
      Left = 44
      Top = 10
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_099: TEdit
      Left = 44
      Top = 42
      Width = 734
      Height = 21
      TabOrder = 1
      Text = 'E_099'
    end
    object CB_002: TCheckBox
      Left = 176
      Top = 12
      Width = 60
      Height = 17
      Caption = #35069#36896#21697
      TabOrder = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 121
    Width = 1024
    Height = 587
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 1020
      Height = 583
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
      TabOrder = 0
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
      ColWidths = (
        133
        74
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 708
    Width = 1024
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      1024
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
      Left = 935
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
end
