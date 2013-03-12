object F_C07: TF_C07
  Left = 0
  Top = 101
  Width = 800
  Height = 375
  Caption = #22577#24290'/'#20837#20489#20316#26989' ('#25104#22411')'
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
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #22577#24290'/'#20837#20489#20316#26989' ('#25104#22411')'
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
    Width = 792
    Height = 50
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label3: TLabel
      Left = 17
      Top = 17
      Width = 34
      Height = 13
      Caption = 'TYPE :'
    end
    object CB_TYPE: TComboBox
      Left = 58
      Top = 13
      Width = 102
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #26410#35097#33180
      OnChange = CB_TYPEChange
      Items.Strings = (
        #26410#35097#33180
        'By Run')
    end
    object E_BRun: TEdit
      Left = 184
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object E_ERun: TEdit
      Left = 313
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object B_Go: TButton
      Left = 448
      Top = 11
      Width = 41
      Height = 25
      Caption = 'Go'
      TabOrder = 3
      OnClick = B_GoClick
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 91
    Width = 792
    Height = 257
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 788
      Height = 253
      Align = alClient
      ColCount = 12
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      OnDblClick = SG01DblClick
      OnDrawCell = SG01DrawCell
      CIMOptions = [goSorting]
    end
  end
end
