object F_A99: TF_A99
  Left = -4
  Top = 89
  Width = 812
  Height = 375
  Caption = 'Password'
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
    Left = 455
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
    Caption = 'The Password For BEF'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object L_Kind: TLabel
      Left = 26
      Top = 8
      Width = 5
      Height = 23
    end
  end
  object Panel4: TPanel
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
      Left = 716
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 455
    Height = 266
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object Panel6: TPanel
      Left = 2
      Top = 2
      Width = 451
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 30
        Height = 13
        Caption = #32068#32676' :'
      end
      object Label2: TLabel
        Left = 92
        Top = 12
        Width = 30
        Height = 13
        Caption = #21517#23383' :'
      end
      object Label3: TLabel
        Left = 260
        Top = 12
        Width = 30
        Height = 13
        Caption = #23494#30908' :'
      end
      object E_001: TEdit
        Left = 40
        Top = 8
        Width = 32
        Height = 21
        TabOrder = 0
        Text = 'E_001'
      end
      object E_002: TEdit
        Left = 128
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'E_002'
      end
      object E_003: TEdit
        Left = 296
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'E_003'
      end
    end
    object Panel7: TPanel
      Left = 2
      Top = 41
      Width = 451
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object SG01: TStringGrid
        Left = 0
        Top = 0
        Width = 451
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
          43
          144
          153)
      end
    end
  end
  object Panel3: TPanel
    Left = 458
    Top = 41
    Width = 346
    Height = 266
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object Mm: TMemo
      Left = 2
      Top = 2
      Width = 342
      Height = 262
      Align = alClient
      Lines.Strings = (
        '00.MIS'
        '01.SA'#20840#38283'--'#38283#25918#20462#25913#27402#38480
        '02.SA'#20840#38283'--'#20677#20379#26597#35426'('#28961#27861#20462#25913')'
        '10.OP'
        '99.'#19968#33324#26597#35426)
      TabOrder = 0
    end
  end
end
