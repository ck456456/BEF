object F_B09: TF_B09
  Left = 0
  Top = 113
  Width = 800
  Height = 375
  ActiveControl = SG03
  Caption = #25187#30041#20316#26989
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    Caption = #25187#30041#20316#26989
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 40
    Width = 792
    Height = 308
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object Panel4: TPanel
      Left = 2
      Top = 2
      Width = 788
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 96
        Top = 12
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #25187#30041#20154#21729
      end
      object Label2: TLabel
        Left = 96
        Top = 38
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #21462#28040#20154#21729
      end
      object Label3: TLabel
        Left = 245
        Top = 12
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #25187#30041#21407#22240
      end
      object Label4: TLabel
        Left = 245
        Top = 38
        Width = 66
        Height = 13
        AutoSize = False
        Caption = #21462#28040#21407#22240
      end
      object L_000: TLabel
        Left = 97
        Top = 61
        Width = 30
        Height = 13
        Caption = 'L_000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object E_H001: TEdit
        Left = 156
        Top = 8
        Width = 84
        Height = 21
        TabOrder = 0
        Text = 'E_H001'
      end
      object E_C001: TEdit
        Left = 156
        Top = 34
        Width = 84
        Height = 21
        TabOrder = 1
        Text = 'E_C001'
      end
      object E_H002: TEdit
        Left = 311
        Top = 8
        Width = 425
        Height = 21
        TabOrder = 2
        Text = 'E_H002'
      end
      object E_C002: TEdit
        Left = 311
        Top = 34
        Width = 425
        Height = 21
        TabOrder = 3
        Text = 'E_C002'
      end
      object CB_Type: TComboBox
        Left = 9
        Top = 8
        Width = 80
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = #25187#30041
        Items.Strings = (
          #25187#30041
          #21462#28040)
      end
      object B_Save: TBitBtn
        Left = 747
        Top = 33
        Width = 40
        Height = 23
        Caption = 'Save'
        TabOrder = 5
        OnClick = B_SaveClick
      end
    end
    object Panel5: TPanel
      Left = 2
      Top = 83
      Width = 788
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 788
        Height = 223
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #21487#25187#29289#26009
          object Splitter1: TSplitter
            Left = 400
            Top = 0
            Height = 195
          end
          object SG01: TStringGrid
            Left = 0
            Top = 0
            Width = 400
            Height = 195
            Align = alLeft
            ColCount = 13
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            OnDrawCell = SG01DrawCell
            OnKeyUp = SG01KeyUp
            OnMouseUp = SG01MouseUp
          end
          object SG02: TStringGrid
            Left = 403
            Top = 0
            Width = 377
            Height = 195
            Align = alClient
            ColCount = 12
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnDrawCell = SG01DrawCell
            OnKeyUp = SG01KeyUp
            OnMouseUp = SG01MouseUp
          end
        end
        object TabSheet2: TTabSheet
          Caption = #24050#25187#29289#26009
          ImageIndex = 1
          object Splitter2: TSplitter
            Left = 400
            Top = 0
            Height = 195
          end
          object SG03: TStringGrid
            Left = 0
            Top = 0
            Width = 400
            Height = 195
            Align = alLeft
            ColCount = 11
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 0
            OnDrawCell = SG01DrawCell
            OnKeyUp = SG01KeyUp
            OnMouseUp = SG01MouseUp
          end
          object SG04: TStringGrid
            Left = 403
            Top = 0
            Width = 377
            Height = 195
            Align = alClient
            ColCount = 12
            DefaultRowHeight = 16
            FixedCols = 0
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
            TabOrder = 1
            OnDrawCell = SG01DrawCell
            OnKeyUp = SG01KeyUp
            OnMouseUp = SG01MouseUp
          end
        end
      end
    end
  end
end
