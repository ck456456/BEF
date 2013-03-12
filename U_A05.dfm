object F_A05: TF_A05
  Left = 68
  Top = 107
  Width = 812
  Height = 375
  Caption = 'Item Set'
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
    Height = 266
  end
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Item Set'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
      Left = 713
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 185
    Height = 266
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 39
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
    end
    object Panel7: TPanel
      Left = 0
      Top = 39
      Width = 185
      Height = 227
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object SG01: TStringGrid
        Left = 2
        Top = 2
        Width = 181
        Height = 223
        Align = alClient
        ColCount = 3
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnKeyUp = SG01KeyUp
        OnMouseUp = SG01MouseUp
        ColWidths = (
          72
          64
          64)
      end
    end
  end
  object Panel3: TPanel
    Left = 188
    Top = 41
    Width = 616
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 616
      Height = 88
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
      object Label5: TLabel
        Left = 7
        Top = 39
        Width = 34
        Height = 13
        Caption = 'Name :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 188
        Top = 15
        Width = 30
        Height = 13
        Caption = 'Type :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 65
        Width = 30
        Height = 13
        Caption = #20844#24335' :'
      end
      object Label6: TLabel
        Left = 183
        Top = 40
        Width = 35
        Height = 13
        Caption = 'Judge :'
      end
      object E_101: TEdit
        Left = 47
        Top = 11
        Width = 120
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'E_101'
      end
      object E_102: TEdit
        Left = 47
        Top = 35
        Width = 120
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = 'E_102'
      end
      object CB_103: TComboBox
        Left = 225
        Top = 11
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'CB_103'
        Items.Strings = (
          'Value'
          'Boolean')
      end
      object CB_104: TComboBox
        Left = 47
        Top = 62
        Width = 500
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Items.Strings = (
          ''
          '1.'#32570#40670#25976'/'#38928#35336#20998#26781#25976
          '2.'#32570#40670#25976'/(('#32317#27298#26597#38263#24230'/'#35009#20999#21697#38263')*'#38928#35336#20998#26781#25976')'
          '3.(('#32570#40670#25976'*'#32317#27298#26597#38263#24230')/(Roller '#30452#24465'*3.14)) / (('#32317#27298#26597#38263#24230'/'#35009#20999#21697#38263') *'#38928#35336#20998#26781#25976')')
      end
      object CB_105: TComboBox
        Left = 225
        Top = 36
        Width = 145
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = '0 : NG, C, B,A-,A ,A+'
        Items.Strings = (
          '0 : NG, C, B,A-,A ,A+'
          '1 : 0B,1B,2B,3B,4B,5B')
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 88
      Width = 616
      Height = 178
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object SG02: TStringGrid
        Left = 2
        Top = 2
        Width = 612
        Height = 174
        Align = alClient
        DefaultRowHeight = 16
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnKeyUp = SG01KeyUp
        OnMouseUp = SG01MouseUp
        ColWidths = (
          72
          64
          64
          64
          64)
      end
    end
  end
end
