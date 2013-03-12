object F_A00: TF_A00
  Left = 0
  Top = 0
  Width = 800
  Height = 507
  Caption = 'System set'
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
    Caption = 'System set'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 439
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object B_Close: TBitBtn
      Left = 720
      Top = 10
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkClose
    end
    object B_Save: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 1
      OnClick = B_SaveClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 398
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 28
      Top = 20
      Width = 66
      Height = 13
      AutoSize = False
      Caption = #20844#21496#21517#31281' :'
    end
    object Label4: TLabel
      Left = 55
      Top = 50
      Width = 33
      Height = 13
      AutoSize = False
      Caption = #26085#29677' :'
    end
    object Label5: TLabel
      Left = 203
      Top = 50
      Width = 40
      Height = 13
      AutoSize = False
      Caption = #22812#29677' :'
    end
    object Label2: TLabel
      Left = 33
      Top = 111
      Width = 54
      Height = 13
      Caption = 'PET Type :'
    end
    object Label3: TLabel
      Left = 38
      Top = 142
      Width = 48
      Height = 13
      Caption = 'UV Type :'
    end
    object Label6: TLabel
      Left = 10
      Top = 173
      Width = 76
      Height = 13
      Caption = 'ROLLER Type :'
    end
    object Label7: TLabel
      Left = 254
      Top = 111
      Width = 95
      Height = 13
      AutoSize = False
      Caption = #19978#20445#35703#33180' Type :'
    end
    object Label8: TLabel
      Left = 254
      Top = 142
      Width = 95
      Height = 13
      AutoSize = False
      Caption = #19979#20445#35703#33180' Type :'
    end
    object Label10: TLabel
      Left = 9
      Top = 260
      Width = 158
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25104#22411#31449#38928#20272#33391#29575#35686#31034' Mail :'
    end
    object Label11: TLabel
      Left = 63
      Top = 228
      Width = 102
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25104#22411#31449'-'#21151#33021#27298#39511' :'
    end
    object Label12: TLabel
      Left = 569
      Top = 8
      Width = 90
      Height = 13
      AutoSize = False
      Caption = #27298#39511#21729'('#25104#22411#31449')'
    end
    object Label13: TLabel
      Left = 76
      Top = 292
      Width = 91
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25104#22411#31449#39511#20986#29575' :'
    end
    object Label14: TLabel
      Left = 18
      Top = 81
      Width = 73
      Height = 13
      AutoSize = False
      Caption = 'A'#29677#36215#22987#26085' :'
    end
    object Label15: TLabel
      Left = 86
      Top = 337
      Width = 81
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #35097#33180#31449' Group :'
    end
    object Label16: TLabel
      Left = 279
      Top = 228
      Width = 102
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #25104#22411#31449'-'#22806#35264#32113#35336' :'
    end
    object Label9: TLabel
      Left = 255
      Top = 172
      Width = 95
      Height = 13
      AutoSize = False
      Caption = #21253#35037#26448#26009' Type :'
    end
    object E_001: TEdit
      Left = 96
      Top = 16
      Width = 400
      Height = 21
      TabOrder = 0
      Text = 'E_001'
    end
    object E_101: TEdit
      Left = 95
      Top = 46
      Width = 96
      Height = 21
      TabOrder = 1
      Text = 'E_101'
    end
    object E_102: TEdit
      Left = 243
      Top = 46
      Width = 96
      Height = 21
      TabOrder = 2
      Text = 'E_102'
    end
    object CB_201: TComboBox
      Left = 95
      Top = 107
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'CB_201'
    end
    object CB_202: TComboBox
      Left = 95
      Top = 138
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      Text = 'CB_202'
    end
    object CB_203: TComboBox
      Left = 95
      Top = 169
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      Text = 'CB_203'
    end
    object CB_204: TComboBox
      Left = 351
      Top = 107
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = 'CB_204'
    end
    object CB_205: TComboBox
      Left = 351
      Top = 138
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Text = 'CB_205'
    end
    object E_302: TEdit
      Left = 169
      Top = 256
      Width = 628
      Height = 21
      TabOrder = 8
      Text = 'E_302'
    end
    object E_300: TEdit
      Left = 170
      Top = 224
      Width = 100
      Height = 21
      TabOrder = 9
      Text = 'E_300'
    end
    object M_303: TMemo
      Left = 568
      Top = 24
      Width = 185
      Height = 169
      TabOrder = 10
    end
    object E_304: TEdit
      Left = 169
      Top = 288
      Width = 100
      Height = 21
      TabOrder = 11
      Text = 'E_304'
    end
    object E_103: TEdit
      Left = 96
      Top = 77
      Width = 96
      Height = 21
      TabOrder = 12
      Text = 'E_103'
    end
    object E_400: TEdit
      Left = 170
      Top = 333
      Width = 100
      Height = 21
      TabOrder = 13
      Text = 'E_400'
    end
    object E_305: TEdit
      Left = 386
      Top = 224
      Width = 100
      Height = 21
      TabOrder = 14
      Text = 'E_305'
    end
    object CB_306: TCheckBox
      Left = 310
      Top = 336
      Width = 124
      Height = 17
      Caption = 'Monitoring '#35686#31034#20449#20214
      TabOrder = 15
    end
    object CB_206: TComboBox
      Left = 351
      Top = 167
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 16
      Text = 'CB_206'
    end
    object CB_307: TCheckBox
      Left = 310
      Top = 361
      Width = 124
      Height = 17
      Caption = #25187#30041#35686#31034#20449#20214
      TabOrder = 17
    end
  end
end
