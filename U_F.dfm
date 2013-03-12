object F: TF
  Left = 172
  Top = 26
  Width = 798
  Height = 649
  Caption = 'BEF System'
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
  object P01: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'BEF System'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = P01Click
    object L_Date: TLabel
      Left = 8
      Top = 17
      Width = 42
      Height = 13
      Caption = 'L_Date'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 570
    Width = 782
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    OnClick = Panel2Click
    DesignSize = (
      782
      41)
    object B_Close: TBitBtn
      Left = 634
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Kind = bkClose
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 145
    Height = 529
    Align = alLeft
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object B_A00: TBitBtn
      Left = 10
      Top = 10
      Width = 126
      Height = 25
      Caption = 'System set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_A00Click
    end
    object B_A98: TBitBtn
      Left = 10
      Top = 429
      Width = 126
      Height = 25
      Caption = 'Change Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_A98Click
    end
    object B_A99: TBitBtn
      Left = 10
      Top = 457
      Width = 126
      Height = 25
      Caption = 'Password'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = B_A99Click
    end
    object B_A97: TBitBtn
      Left = 10
      Top = 402
      Width = 126
      Height = 25
      Caption = 'Login / Logout'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_A97Click
    end
    object B_A01: TBitBtn
      Left = 10
      Top = 36
      Width = 126
      Height = 25
      Caption = #29983#29986#30446#27161#26009#34399
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = B_A01Click
    end
    object B_A02: TBitBtn
      Left = 10
      Top = 63
      Width = 126
      Height = 25
      Caption = #29983#29986#21028#32026#26009#34399
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = B_A02Click
    end
    object B_A04: TBitBtn
      Left = 10
      Top = 90
      Width = 126
      Height = 25
      Caption = 'Test Group'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = B_A04Click
    end
    object B_A05: TBitBtn
      Left = 10
      Top = 116
      Width = 126
      Height = 25
      Caption = 'Item Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = B_A05Click
    end
    object B_A06: TBitBtn
      Left = 10
      Top = 143
      Width = 126
      Height = 25
      Caption = 'Spec Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = B_A06Click
    end
    object B_A07: TBitBtn
      Left = 10
      Top = 170
      Width = 126
      Height = 25
      Caption = 'Process Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = B_A07Click
    end
    object B_A08: TBitBtn
      Left = 10
      Top = 196
      Width = 126
      Height = 25
      Caption = 'Event Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = B_A08Click
    end
    object B_A09: TBitBtn
      Left = 10
      Top = 223
      Width = 126
      Height = 25
      Caption = 'Line Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = B_A09Click
    end
    object B_A10: TBitBtn
      Left = 10
      Top = 250
      Width = 126
      Height = 25
      Caption = #20195#34399#20462#25913
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = B_A10Click
    end
    object B_A11: TBitBtn
      Left = 10
      Top = 277
      Width = 126
      Height = 25
      Caption = #24288#21312#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = B_A11Click
    end
    object B_A12: TBitBtn
      Left = 10
      Top = 305
      Width = 126
      Height = 25
      Caption = #20489#21029#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = B_A12Click
    end
    object B_A13: TBitBtn
      Left = 10
      Top = 333
      Width = 126
      Height = 25
      Caption = '('#25613#32791'/'#25910#26009#19981#36275') '#21407#22240
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = B_A13Click
    end
    object B_A14: TBitBtn
      Left = 10
      Top = 360
      Width = 126
      Height = 25
      Caption = #23458#25142#20027#27284
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = B_A14Click
    end
  end
  object Panel5: TPanel
    Left = 145
    Top = 41
    Width = 145
    Height = 529
    Align = alLeft
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object B_B03: TBitBtn
      Left = 10
      Top = 68
      Width = 126
      Height = 25
      Caption = 'UV'#33184#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_B03Click
    end
    object B_B02: TBitBtn
      Left = 10
      Top = 39
      Width = 126
      Height = 25
      Caption = 'ROLLER Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_B02Click
    end
    object B_B01: TBitBtn
      Left = 10
      Top = 10
      Width = 126
      Height = 25
      Caption = 'PET Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = B_B01Click
    end
    object B_B04: TBitBtn
      Left = 10
      Top = 97
      Width = 126
      Height = 25
      Caption = #19978#20445#35703#33180#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_B04Click
    end
    object B_B05: TBitBtn
      Left = 10
      Top = 127
      Width = 126
      Height = 25
      Caption = #19979#20445#35703#33180#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = B_B05Click
    end
    object B_B07: TBitBtn
      Left = 10
      Top = 190
      Width = 126
      Height = 28
      Caption = #38936#26009'/'#36864#26009'('#21253#26448')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = B_B07Click
    end
    object B_B08: TBitBtn
      Left = 10
      Top = 156
      Width = 126
      Height = 28
      Caption = #19978'/'#19979'(UV'#33184')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = B_B08Click
    end
    object B_B09: TBitBtn
      Left = 10
      Top = 223
      Width = 126
      Height = 28
      Caption = #25187#30041#20316#26989
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = B_B09Click
    end
  end
  object Panel1: TPanel
    Left = 290
    Top = 41
    Width = 145
    Height = 529
    Align = alLeft
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Bevel1: TBevel
      Left = 8
      Top = 235
      Width = 131
      Height = 2
      Style = bsRaised
    end
    object Bevel2: TBevel
      Left = 9
      Top = 305
      Width = 131
      Height = 2
      Style = bsRaised
    end
    object B_C01: TBitBtn
      Left = 10
      Top = 10
      Width = 126
      Height = 25
      Caption = 'Working Set'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_C01Click
    end
    object B_C02: TBitBtn
      Left = 10
      Top = 39
      Width = 126
      Height = 25
      Caption = #25104#22411#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_C02Click
    end
    object B_C03: TBitBtn
      Left = 10
      Top = 68
      Width = 126
      Height = 25
      Caption = #35097#33180#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = B_C03Click
    end
    object B_C04: TBitBtn
      Left = 10
      Top = 98
      Width = 126
      Height = 25
      Caption = #21253#35037#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_C04Click
    end
    object B_C05: TBitBtn
      Left = 10
      Top = 197
      Width = 126
      Height = 25
      Caption = #20986#36008#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = B_C05Click
    end
    object B_C06: TBitBtn
      Left = 10
      Top = 168
      Width = 126
      Height = 25
      Caption = #20986#36008#25490#31243
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = B_C06Click
    end
    object B_C07: TBitBtn
      Left = 10
      Top = 244
      Width = 126
      Height = 25
      Caption = #22577#24290'/'#20837#20489#20316#26989' ('#25104#22411')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = B_C07Click
    end
    object B_D22: TBitBtn
      Left = 11
      Top = 321
      Width = 126
      Height = 25
      Caption = #24235#23384#26126#32048#22577#34920'('#25104#21697')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = B_D22Click
    end
    object B_D23: TBitBtn
      Left = 11
      Top = 352
      Width = 126
      Height = 25
      Caption = #20986#36008#26126#32048#22577#34920'('#25104#21697')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = B_D23Click
    end
    object B_D24: TBitBtn
      Left = 11
      Top = 385
      Width = 126
      Height = 25
      Caption = #24037#21934#25187#26009#22577#34920
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = B_D24Click
    end
    object B_D25: TBitBtn
      Left = 12
      Top = 417
      Width = 126
      Height = 25
      Caption = #26085#22577#34920'('#35069#36896')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = B_D25Click
    end
    object B_D26: TBitBtn
      Left = 12
      Top = 449
      Width = 126
      Height = 28
      Caption = #29694#22580#24235#23384'('#21407#26009','#21322#25104#21697')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = B_D26Click
    end
    object B_C09: TBitBtn
      Left = 10
      Top = 273
      Width = 126
      Height = 25
      Caption = #24235#25151#35519#25972#20316#26989' ('#35097#33180')'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = B_C09Click
    end
    object B_C10: TBitBtn
      Left = 10
      Top = 126
      Width = 126
      Height = 25
      Caption = #24235#25151#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = B_C10Click
    end
  end
  object Panel4: TPanel
    Left = 435
    Top = 41
    Width = 145
    Height = 529
    Align = alLeft
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object B_D05: TBitBtn
      Left = 10
      Top = 69
      Width = 126
      Height = 25
      Caption = 'Monitoring'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_D05Click
    end
    object B_D07: TBitBtn
      Left = 10
      Top = 128
      Width = 126
      Height = 25
      Caption = 'Event Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_D07Click
    end
    object B_D11: TBitBtn
      Left = 10
      Top = 188
      Width = 126
      Height = 25
      Caption = 'Roller Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = B_D11Click
    end
    object B_D14: TBitBtn
      Left = 10
      Top = 217
      Width = 126
      Height = 25
      Caption = #29983#29986#22577#34920'-'#25104#22411#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_D14Click
    end
    object B_D15: TBitBtn
      Left = 11
      Top = 247
      Width = 126
      Height = 25
      Caption = #29983#29986#22577#34920'-'#35097#33180#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = B_D15Click
    end
    object B_D16: TBitBtn
      Left = 11
      Top = 361
      Width = 126
      Height = 25
      Caption = 'QA'#25104#22411#33391#29575#22577#34920
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = B_D16Click
    end
    object B_D17: TBitBtn
      Left = 12
      Top = 392
      Width = 126
      Height = 25
      Caption = 'QA'#36028#33180#33391#29575#22577#34920
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = B_D17Click
    end
    object B_D18: TBitBtn
      Left = 12
      Top = 422
      Width = 126
      Height = 25
      Caption = #25104#22411#32570#38519#25976#32113#35336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = B_D18Click
    end
    object B_D19: TBitBtn
      Left = 11
      Top = 277
      Width = 126
      Height = 25
      Caption = '('#25613#32791'/'#25910#26009#19981#36275') '#20998#26512
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = B_D19Click
    end
    object B_D20: TBitBtn
      Left = 12
      Top = 452
      Width = 126
      Height = 25
      Caption = 'CPK'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = B_D20Click
    end
    object B_D21: TBitBtn
      Left = 11
      Top = 307
      Width = 126
      Height = 25
      Caption = #21697#36074#21450#35069#31243'(RUN)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = B_D21Click
    end
  end
  object P_V01: TPanel
    Left = 580
    Top = 41
    Width = 145
    Height = 529
    Align = alLeft
    BevelInner = bvLowered
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    object B_D03: TBitBtn
      Left = 10
      Top = 369
      Width = 126
      Height = 25
      Caption = 'Defect Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_D03Click
    end
    object B_D04: TBitBtn
      Left = 10
      Top = 398
      Width = 126
      Height = 25
      Caption = 'Yield Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_D04Click
    end
    object B_A03: TBitBtn
      Left = 10
      Top = 309
      Width = 126
      Height = 25
      Caption = 'UV'#33184#26742#34399#35373#23450
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = B_A03Click
    end
    object B_D02: TBitBtn
      Left = 10
      Top = 248
      Width = 126
      Height = 25
      Caption = 'Trend Curve'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = B_D02Click
    end
    object B_D12: TBitBtn
      Left = 10
      Top = 207
      Width = 126
      Height = 25
      Caption = #29694#22580#20489
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = B_D12Click
    end
    object B_D01: TBitBtn
      Left = 10
      Top = 10
      Width = 126
      Height = 25
      Caption = 'Working Info'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = B_D01Click
    end
    object B_D09: TBitBtn
      Left = 10
      Top = 147
      Width = 126
      Height = 25
      Caption = #33391#29575#22577#21578
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = B_D09Click
    end
    object B_D13: TBitBtn
      Left = 10
      Top = 339
      Width = 126
      Height = 25
      Caption = 'Pet '#20351#29992#29575
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = B_D13Click
    end
    object B_D10: TBitBtn
      Left = 12
      Top = 427
      Width = 126
      Height = 25
      Caption = #27599#26085#29677#21029#22577#21578
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = B_D10Click
    end
    object B_C08: TBitBtn
      Left = 10
      Top = 97
      Width = 126
      Height = 25
      Caption = #20998#26781#31449
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = B_C08Click
    end
    object B_B06: TBitBtn
      Left = 10
      Top = 177
      Width = 126
      Height = 25
      Caption = #19978'/'#19979'(UV'#33184') - old'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = B_B06Click
    end
    object B_D08: TBitBtn
      Left = 10
      Top = 39
      Width = 126
      Height = 25
      Caption = 'Run Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = B_D08Click
    end
    object B_D06: TBitBtn
      Left = 10
      Top = 67
      Width = 126
      Height = 25
      Caption = 'UV'#33184#20351#29992#35352#37636
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = B_D06Click
    end
  end
  object SysTimer: TTimer
    Enabled = False
    Interval = 50000
    OnTimer = SysTimerTimer
    Left = 72
    Top = 8
  end
  object IdSMTP: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 112
    Top = 8
  end
  object IdTime: TIdTime
    MaxLineAction = maException
    ReadTimeout = 0
    BaseDate = 2.000000000000000000
    Left = 152
    Top = 8
  end
end
