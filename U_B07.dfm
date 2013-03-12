object F_B07: TF_B07
  Left = 409
  Top = 187
  Width = 801
  Height = 434
  Caption = #38936#26009'/'#36864#26009'('#21253#26448')'
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
    Width = 793
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #38936#26009'/'#36864#26009'('#21253#26448')'
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
    Width = 793
    Height = 85
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 12
      Width = 20
      Height = 13
      Caption = 'No :'
    end
    object Label8: TLabel
      Left = 11
      Top = 48
      Width = 29
      Height = 13
      Caption = 'Note :'
    end
    object Label9: TLabel
      Left = 531
      Top = 12
      Width = 28
      Height = 13
      Caption = 'QTY :'
    end
    object Label10: TLabel
      Left = 406
      Top = 12
      Width = 21
      Height = 13
      Caption = 'OP :'
    end
    object L_000: TLabel
      Left = 631
      Top = 12
      Width = 54
      Height = 13
      Caption = #38936#26009#26085#26399' :'
    end
    object Label4: TLabel
      Left = 157
      Top = 12
      Width = 43
      Height = 13
      Caption = 'Product :'
    end
    object E_002: TEdit
      Left = 44
      Top = 8
      Width = 106
      Height = 21
      TabOrder = 0
      Text = 'E_002'
    end
    object E_999: TEdit
      Left = 44
      Top = 44
      Width = 733
      Height = 21
      TabOrder = 1
      Text = 'E_999'
    end
    object E_005: TEdit
      Left = 562
      Top = 8
      Width = 56
      Height = 21
      TabOrder = 2
      Text = 'E_001'
    end
    object E_006: TEdit
      Left = 433
      Top = 8
      Width = 95
      Height = 21
      TabOrder = 3
      Text = 'E_006'
    end
    object E_007: TEdit
      Left = 690
      Top = 8
      Width = 87
      Height = 21
      TabOrder = 4
      Text = 'E_007'
    end
    object CB_004: TComboBox
      Left = 205
      Top = 8
      Width = 195
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 125
    Width = 793
    Height = 241
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TStringGrid
      Left = 2
      Top = 38
      Width = 789
      Height = 201
      Align = alClient
      ColCount = 9
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 789
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = 10
        Top = 11
        Width = 30
        Height = 13
        Caption = 'Type :'
      end
      object CB_001: TComboBox
        Left = 44
        Top = 7
        Width = 120
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '01.'#38936#26009
        OnChange = CB_001Change
        Items.Strings = (
          '01.'#38936#26009
          '02.'#35519#25972
          '03.'#29694#22580
          '04.'#38620#38917)
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 366
    Width = 793
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      793
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
      Left = 704
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 2
      Kind = bkClose
    end
  end
end
