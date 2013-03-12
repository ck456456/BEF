object F_V07: TF_V07
  Left = 174
  Top = 228
  Width = 447
  Height = 202
  Caption = 'F_V07'
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
  object P_01: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 48
      Top = 16
      Width = 26
      Height = 13
      Caption = 'Run :'
    end
    object L_Run: TLabel
      Left = 88
      Top = 16
      Width = 32
      Height = 13
      Caption = 'L_Run'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 20
      Top = 40
      Width = 54
      Height = 13
      Caption = #27298#39511#23532#24133' :'
    end
    object Label3: TLabel
      Left = 20
      Top = 62
      Width = 54
      Height = 13
      Caption = #29983#29986#38263#24230' :'
    end
    object Label4: TLabel
      Left = 236
      Top = 39
      Width = 54
      Height = 13
      Caption = #21097#39192#23532#24133' :'
    end
    object Label5: TLabel
      Left = 236
      Top = 61
      Width = 54
      Height = 13
      Caption = #21097#39192#38263#24230' :'
    end
    object L_16304: TLabel
      Left = 88
      Top = 39
      Width = 42
      Height = 13
      Caption = 'L_16304'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L_303: TLabel
      Left = 88
      Top = 62
      Width = 30
      Height = 13
      Caption = 'L_303'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L_502: TLabel
      Left = 304
      Top = 37
      Width = 30
      Height = 13
      Caption = 'L_502'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object L_501: TLabel
      Left = 304
      Top = 61
      Width = 30
      Height = 13
      Caption = 'L_501'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 236
      Top = 16
      Width = 54
      Height = 13
      Caption = #20986#36008#21934#34399' :'
    end
    object L_No: TLabel
      Left = 296
      Top = 16
      Width = 26
      Height = 13
      Caption = 'L_No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 439
    Height = 86
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object L_Go: TLabel
      Left = 156
      Top = 46
      Width = 26
      Height = 13
      Caption = 'L_Go'
    end
    object Label6: TLabel
      Left = 20
      Top = 11
      Width = 42
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #26855#26495' : '
    end
    object Label7: TLabel
      Left = 130
      Top = 11
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'SN : '
    end
    object Label8: TLabel
      Left = 203
      Top = 11
      Width = 41
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #37325#37327' : '
    end
    object CB_Type: TComboBox
      Left = 31
      Top = 42
      Width = 94
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #20840#37096#20986#36008
      OnChange = CB_TypeChange
      Items.Strings = (
        #20840#37096#20986#36008
        #20999#23532#20986#36008
        #20999#38263#20986#36008)
    end
    object E_Go: TEdit
      Left = 224
      Top = 42
      Width = 73
      Height = 21
      TabOrder = 1
      Text = 'E_Go'
    end
    object B_ok: TBitBtn
      Left = 323
      Top = 39
      Width = 58
      Height = 26
      TabOrder = 2
      OnClick = B_okClick
      Kind = bkOK
    end
    object E_010: TEdit
      Left = 63
      Top = 7
      Width = 61
      Height = 21
      TabOrder = 3
    end
    object E_011: TEdit
      Left = 156
      Top = 7
      Width = 39
      Height = 21
      TabOrder = 4
    end
    object E_012: TEdit
      Left = 248
      Top = 7
      Width = 50
      Height = 21
      TabOrder = 5
    end
  end
end
