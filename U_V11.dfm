object F_V11: TF_V11
  Left = 239
  Top = 170
  Width = 397
  Height = 375
  Caption = #20837#24235#33287#36864#22238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 307
    Width = 389
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = BitBtn1Click
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 152
      Top = 12
      Width = 36
      Height = 13
      Caption = #26855#26495' :  '
    end
    object L_01: TLabel
      Left = 192
      Top = 12
      Width = 24
      Height = 13
      Caption = 'L_01'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CB_Type: TComboBox
      Left = 29
      Top = 8
      Width = 96
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #20837#24235
      Items.Strings = (
        #20837#24235
        #36864#22238)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 389
    Height = 266
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object SG01: TCIM_Grid
      Left = 2
      Top = 2
      Width = 385
      Height = 262
      Align = alClient
      ColCount = 8
      DefaultRowHeight = 16
      FixedCols = 0
      TabOrder = 0
      CIMOptions = [goSorting]
    end
  end
end
