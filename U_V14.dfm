object F_V14: TF_V14
  Left = 0
  Top = 148
  Width = 800
  Height = 375
  Caption = #20986#36008#36984#25799
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
    Caption = #20986#36008#36984#25799
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 62
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 19
      Top = 13
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#36008#34399#30908' : '
    end
    object Label12: TLabel
      Left = 234
      Top = 13
      Width = 57
      Height = 13
      Caption = #38263#24230#38480#21046' : '
    end
    object Label2: TLabel
      Left = 234
      Top = 37
      Width = 54
      Height = 13
      Caption = #26009#34399#38480#21046' :'
    end
    object Label7: TLabel
      Left = 464
      Top = 13
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#36008'm2 :'
    end
    object Label9: TLabel
      Left = 29
      Top = 40
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object E_102: TEdit
      Left = 293
      Top = 9
      Width = 69
      Height = 21
      TabOrder = 0
      Text = 'E_102'
    end
    object E_103: TEdit
      Left = 370
      Top = 9
      Width = 69
      Height = 21
      TabOrder = 1
      Text = 'E_103'
    end
    object E_104: TEdit
      Left = 292
      Top = 33
      Width = 389
      Height = 21
      TabOrder = 2
      Text = 'E_104'
    end
    object E_001: TEdit
      Left = 78
      Top = 9
      Width = 142
      Height = 21
      TabOrder = 3
    end
    object E_007: TEdit
      Left = 510
      Top = 9
      Width = 82
      Height = 21
      TabOrder = 4
    end
    object E_008: TEdit
      Left = 78
      Top = 33
      Width = 142
      Height = 21
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 103
    Width = 792
    Height = 245
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 788
      Height = 241
      Align = alClient
      ColCount = 11
      DefaultColWidth = 32
      DefaultRowHeight = 16
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDblClick = SG01DblClick
      CIMOptions = [goSorting]
    end
  end
end
