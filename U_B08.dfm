object F_B08: TF_B08
  Left = 0
  Top = 0
  Width = 800
  Height = 544
  Caption = #19978'/'#19979'(UV'#33184')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 40
    Height = 477
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #19978'/'#19979'(UV'#33184')'
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
  object Panel3: TPanel
    Left = 0
    Top = 40
    Width = 185
    Height = 477
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 1
    object SG01: TStringGrid
      Left = 2
      Top = 2
      Width = 181
      Height = 473
      Align = alClient
      DefaultRowHeight = 16
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnKeyUp = SG01KeyUp
      OnMouseUp = SG01MouseUp
    end
  end
  object Panel5: TPanel
    Left = 188
    Top = 40
    Width = 604
    Height = 477
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 265
      Top = 0
      Height = 436
    end
    object Panel2: TPanel
      Left = 0
      Top = 436
      Width = 604
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      DesignSize = (
        604
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
        Left = 509
        Top = 8
        Width = 64
        Height = 25
        Anchors = [akTop, akRight]
        TabOrder = 2
        Kind = bkClose
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 265
      Height = 436
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 37
        Align = alTop
        BevelInner = bvLowered
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 11
          Width = 20
          Height = 13
          Caption = 'No :'
        end
        object E_BDaT: TEdit
          Left = 36
          Top = 7
          Width = 81
          Height = 21
          TabOrder = 0
          Text = 'E_BDaT'
        end
        object E_EDaT: TEdit
          Left = 124
          Top = 7
          Width = 81
          Height = 21
          TabOrder = 1
          Text = 'E_EDaT'
        end
        object B_001: TButton
          Left = 218
          Top = 7
          Width = 34
          Height = 21
          Caption = '....'
          TabOrder = 2
          OnClick = B_001Click
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 37
        Width = 265
        Height = 399
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object SG02: TStringGrid
          Left = 2
          Top = 2
          Width = 261
          Height = 395
          Align = alClient
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          TabOrder = 0
          OnKeyUp = SG02KeyUp
          OnMouseUp = SG02MouseUp
        end
      end
    end
    object Panel8: TPanel
      Left = 268
      Top = 0
      Width = 336
      Height = 436
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 336
        Height = 103
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 20
          Height = 13
          Caption = 'No :'
        end
        object Label2: TLabel
          Left = 156
          Top = 12
          Width = 33
          Height = 13
          Caption = #26009#34399' : '
        end
        object Label3: TLabel
          Left = 7
          Top = 80
          Width = 71
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #26399#21021#33184#37327' : '
        end
        object Label4: TLabel
          Left = 121
          Top = 80
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #20351#29992#21512#35336' :'
        end
        object Label5: TLabel
          Left = 121
          Top = 46
          Width = 68
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #21097#39192#33184#37327' :'
        end
        object L_004: TLabel
          Left = 81
          Top = 80
          Width = 30
          Height = 13
          Caption = 'L_004'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object L_005: TLabel
          Left = 195
          Top = 80
          Width = 30
          Height = 13
          Caption = 'L_005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object E_001: TEdit
          Left = 36
          Top = 8
          Width = 110
          Height = 21
          TabOrder = 0
          Text = 'E_001'
        end
        object CB_003: TComboBox
          Left = 196
          Top = 8
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'CB_003'
        end
        object E_006: TEdit
          Left = 196
          Top = 42
          Width = 110
          Height = 21
          TabOrder = 2
          Text = 'E_006'
        end
        object B_003: TButton
          Left = 310
          Top = 44
          Width = 19
          Height = 17
          Caption = '..'
          TabOrder = 3
          OnClick = B_003Click
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 103
        Width = 336
        Height = 333
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object Splitter3: TSplitter
          Left = 2
          Top = 212
          Width = 332
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel12: TPanel
          Left = 2
          Top = 2
          Width = 332
          Height = 210
          Align = alTop
          TabOrder = 0
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 330
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 9
              Top = 6
              Width = 26
              Height = 13
              Caption = 'Run :'
            end
            object E_ERun: TEdit
              Left = 134
              Top = 3
              Width = 81
              Height = 21
              TabOrder = 0
              Text = 'E_ERun'
            end
            object E_BRun: TEdit
              Left = 46
              Top = 3
              Width = 81
              Height = 21
              TabOrder = 1
              Text = 'E_BRun'
            end
            object B_002: TButton
              Left = 219
              Top = 4
              Width = 34
              Height = 21
              Caption = '....'
              TabOrder = 2
              OnClick = B_002Click
            end
          end
          object SG03: TStringGrid
            Left = 1
            Top = 29
            Width = 330
            Height = 180
            Align = alClient
            ColCount = 4
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnDblClick = SG03DblClick
          end
        end
        object Panel13: TPanel
          Left = 2
          Top = 215
          Width = 332
          Height = 116
          Align = alClient
          TabOrder = 1
          object Panel14: TPanel
            Left = 1
            Top = 1
            Width = 330
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'UV '#33184
            TabOrder = 0
          end
          object SG04: TStringGrid
            Left = 1
            Top = 21
            Width = 330
            Height = 94
            Align = alClient
            ColCount = 6
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnDblClick = SG04DblClick
          end
        end
      end
    end
  end
end
