object F_A06: TF_A06
  Left = 0
  Top = 187
  Width = 800
  Height = 311
  Caption = 'Spec Set'
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
    Top = 41
    Height = 202
  end
  object Panel2: TPanel
    Left = 0
    Top = 243
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
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
      Left = 701
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Spec Set'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 5
      Height = 23
    end
    object L_Kind: TLabel
      Left = 26
      Top = 8
      Width = 5
      Height = 23
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 202
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 71
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label11: TLabel
        Left = 10
        Top = 12
        Width = 39
        Height = 13
        Caption = 'Station :'
      end
      object Label2: TLabel
        Left = 13
        Top = 42
        Width = 35
        Height = 13
        Caption = 'Group :'
      end
      object CB_001: TComboBox
        Left = 57
        Top = 8
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = #25104#22411#31449
        OnChange = CB_001Change
        Items.Strings = (
          #25104#22411#31449
          #35097#33180#31449
          #20998#26781#31449)
      end
      object CB_002: TComboBox
        Left = 57
        Top = 40
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'MET '#26495#26448
        OnChange = CB_002Change
        Items.Strings = (
          'MET '#26495#26448
          'VL '#26495#26448
          'DBL '#26495#26448
          'MDL '#26495#26448
          'DBL'
          'MDL'
          'V2 SCREEN'
          'MD FRESNEL'
          'CRT FRESNEL')
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 71
      Width = 185
      Height = 131
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object SG01: TStringGrid
        Left = 2
        Top = 2
        Width = 181
        Height = 127
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnKeyUp = SG01KeyUp
        OnMouseUp = SG01MouseUp
        ColWidths = (
          121
          34)
      end
    end
  end
  object Panel3: TPanel
    Left = 188
    Top = 41
    Width = 604
    Height = 202
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 604
      Height = 44
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label4: TLabel
        Left = 21
        Top = 15
        Width = 20
        Height = 13
        Caption = 'No :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object E_101: TEdit
        Left = 47
        Top = 11
        Width = 120
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object B_Target: TButton
        Left = 432
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Auto Target'
        TabOrder = 1
        OnClick = B_TargetClick
      end
      object CB_103: TCheckBox
        Left = 202
        Top = 14
        Width = 70
        Height = 17
        Caption = 'Use Spec'
        TabOrder = 2
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 44
      Width = 604
      Height = 158
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object SG02: TStringGrid
        Left = 2
        Top = 2
        Width = 600
        Height = 126
        Align = alClient
        ColCount = 15
        DefaultColWidth = 44
        DefaultRowHeight = 16
        RowCount = 38
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        OnDblClick = SG02DblClick
        ColWidths = (
          141
          41
          41
          41
          39
          40
          42
          41
          41
          38
          39
          47
          46
          44
          44)
        RowHeights = (
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16)
      end
      object Panel8: TPanel
        Left = 2
        Top = 128
        Width = 600
        Height = 28
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label3: TLabel
          Left = 16
          Top = 8
          Width = 258
          Height = 13
          Caption = 'Type : 1.'#38617#37002#35215#26684' 2.'#19978#38480#21934#37002#35215#26684' 3.'#19979#38480#21934#37002#35215#26684
        end
      end
    end
  end
end
