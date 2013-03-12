object F_D09: TF_D09
  Left = 0
  Top = 109
  Width = 800
  Height = 375
  Caption = #25104#22411#38928#20272#33391#29575#22577#21578
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
  object P_Main: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = #33391#29575#22577#21578
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      792
      41)
    object B_Close: TBitBtn
      Left = 701
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 0
      Kind = bkClose
    end
    object B_OK: TBitBtn
      Left = 17
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 1
      OnClick = B_OKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object B_Excel: TBitBtn
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excel'
      Default = True
      TabOrder = 2
      OnClick = B_ExcelClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 89
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 505
      Top = 35
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object L_Date: TLabel
      Left = 230
      Top = 11
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date :'
    end
    object L_Type: TLabel
      Left = 233
      Top = 35
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Run :'
    end
    object Label2: TLabel
      Left = 485
      Top = 11
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Working :'
    end
    object Label6: TLabel
      Left = 26
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Report :'
    end
    object L004: TLabel
      Left = 20
      Top = 35
      Width = 44
      Height = 13
      Caption = 'Process :'
    end
    object Label1: TLabel
      Left = 195
      Top = 61
      Width = 64
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PET '#23532#24133' :'
    end
    object Label4: TLabel
      Left = 467
      Top = 61
      Width = 64
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'PET '#21402#24230' :'
    end
    object Label7: TLabel
      Left = 10
      Top = 59
      Width = 54
      Height = 13
      Caption = #30446#27161#26009#34399' :'
    end
    object EB102: TEdit
      Left = 266
      Top = 7
      Width = 95
      Height = 21
      TabOrder = 0
      Text = '20040101'
    end
    object EE102: TEdit
      Left = 362
      Top = 7
      Width = 95
      Height = 21
      TabOrder = 1
      Text = '20040101'
    end
    object EB001: TEdit
      Left = 266
      Top = 31
      Width = 95
      Height = 21
      TabOrder = 2
    end
    object EE001: TEdit
      Left = 362
      Top = 31
      Width = 95
      Height = 21
      TabOrder = 3
    end
    object CB_Type: TComboBox
      Left = 69
      Top = 7
      Width = 126
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = 'By Date'
      Items.Strings = (
        'By Date'
        'By Working no'
        'By Run')
    end
    object CB004: TComboBox
      Left = 69
      Top = 31
      Width = 126
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Items.Strings = (
        ''
        'FRESNEL')
    end
    object CB006: TComboBox
      Left = 539
      Top = 7
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
    object CE006: TComboBox
      Left = 667
      Top = 7
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 7
    end
    object CB_ELn: TComboBox
      Left = 667
      Top = 31
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_BLn: TComboBox
      Left = 539
      Top = 31
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object EB003: TEdit
      Left = 266
      Top = 57
      Width = 95
      Height = 21
      TabOrder = 10
    end
    object EE003: TEdit
      Left = 362
      Top = 57
      Width = 95
      Height = 21
      TabOrder = 11
    end
    object EB004: TEdit
      Left = 539
      Top = 57
      Width = 60
      Height = 21
      TabOrder = 12
    end
    object EE004: TEdit
      Left = 604
      Top = 57
      Width = 60
      Height = 21
      TabOrder = 13
    end
    object CB002: TComboBox
      Left = 69
      Top = 55
      Width = 126
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 14
      OnChange = CB002Change
      Items.Strings = (
        ''
        'FRESNEL')
    end
    object CB_DD: TCheckBox
      Left = 686
      Top = 59
      Width = 97
      Height = 17
      Caption = #32048#31680
      TabOrder = 15
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 130
    Width = 792
    Height = 177
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 3
    object PC: TPageControl
      Left = 2
      Top = 2
      Width = 788
      Height = 173
      ActivePage = TS02
      Align = alClient
      TabOrder = 0
      object TS01: TTabSheet
        Caption = #22577#21578
        object SG01: TStringGrid
          Left = 0
          Top = 0
          Width = 782
          Height = 145
          Align = alClient
          ColCount = 26
          DefaultRowHeight = 16
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          TabOrder = 0
          ColWidths = (
            54
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64
            64)
        end
      end
      object TS02: TTabSheet
        Caption = #26575#25289#22294
        ImageIndex = 1
        object TeeCommander1: TTeeCommander
          Left = 0
          Top = 0
          Width = 780
          Height = 33
          Panel = Chart1
          Align = alTop
          ParentShowHint = False
          TabOrder = 0
        end
        object Chart1: TChart
          Left = 0
          Top = 33
          Width = 780
          Height = 112
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          BackWall.Dark3D = False
          BackWall.Gradient.EndColor = 11118482
          BackWall.Pen.Color = clGray
          BackWall.Transparent = False
          Border.Visible = True
          BottomWall.Color = clGray
          BottomWall.Dark3D = False
          BottomWall.Gradient.EndColor = 16580349
          BottomWall.Gradient.StartColor = 3114493
          BottomWall.Pen.Color = clGray
          LeftWall.Color = clSilver
          LeftWall.Dark3D = False
          LeftWall.Gradient.EndColor = 2413052
          LeftWall.Gradient.StartColor = 900220
          LeftWall.Pen.Color = clGray
          Legend.Alignment = laTop
          Legend.Color = clGray
          Legend.Font.Color = clWhite
          Legend.Font.Height = -13
          Legend.Gradient.Direction = gdTopBottom
          Legend.Gradient.EndColor = clYellow
          Legend.Gradient.StartColor = clWhite
          Legend.LegendStyle = lsSeries
          Legend.Shadow.HorizSize = 0
          Legend.Shadow.VertSize = 0
          Legend.Visible = False
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 5
          MarginTop = 5
          RightWall.Dark3D = False
          RightWall.Pen.Color = clGray
          Title.AdjustFrame = False
          Title.Brush.Color = clBlue
          Title.Color = clBlue
          Title.Font.Color = clBlack
          Title.Font.Height = -13
          Title.Frame.Width = 2
          Title.Text.Strings = (
            'Pareto Chart')
          BottomAxis.Axis.Width = 1
          BottomAxis.Grid.Color = clBlack
          BottomAxis.Grid.Style = psSolid
          BottomAxis.Grid.Visible = False
          BottomAxis.GridCentered = True
          BottomAxis.LabelsAngle = 270
          BottomAxis.MinorTicks.Visible = False
          BottomAxis.Ticks.Color = clBlack
          BottomAxis.TicksInner.Visible = False
          BottomAxis.Title.Caption = 'Time'
          BottomAxis.Title.Visible = False
          DepthAxis.Axis.Width = 1
          DepthAxis.Grid.Color = clBlack
          DepthAxis.Grid.Style = psSolid
          DepthAxis.Grid.Visible = False
          DepthAxis.LabelsFont.Height = -13
          DepthAxis.MinorTicks.Visible = False
          DepthAxis.Ticks.Color = clBlack
          DepthAxis.TicksInner.Visible = False
          DepthTopAxis.Axis.Width = 1
          DepthTopAxis.Grid.Color = clBlack
          DepthTopAxis.Grid.Style = psSolid
          DepthTopAxis.Grid.Visible = False
          DepthTopAxis.LabelsFont.Height = -13
          DepthTopAxis.MinorTicks.Visible = False
          DepthTopAxis.Ticks.Color = clBlack
          DepthTopAxis.TicksInner.Visible = False
          Frame.Color = clGray
          LeftAxis.Axis.Width = 1
          LeftAxis.Grid.Color = clBlack
          LeftAxis.Grid.Style = psSolid
          LeftAxis.Grid.Visible = False
          LeftAxis.LabelsFont.Height = -13
          LeftAxis.MinorTicks.Visible = False
          LeftAxis.StartPosition = 1.000000000000000000
          LeftAxis.EndPosition = 99.000000000000000000
          LeftAxis.Ticks.Color = clBlack
          LeftAxis.TicksInner.Visible = False
          LeftAxis.Title.Caption = 'Value'
          LeftAxis.Title.Visible = False
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          RightAxis.Axis.Width = 1
          RightAxis.AxisValuesFormat = '#,##0.##%'
          RightAxis.Grid.Color = clBlack
          RightAxis.Grid.Style = psSolid
          RightAxis.Grid.Visible = False
          RightAxis.LabelsAlign = alOpposite
          RightAxis.LabelsFont.Height = -13
          RightAxis.Maximum = 100.000000000000000000
          RightAxis.MinorTicks.Visible = False
          RightAxis.Ticks.Color = clBlack
          RightAxis.TicksInner.Visible = False
          Shadow.Color = clBlack
          TopAxis.Axis.Width = 1
          TopAxis.Grid.Color = clBlack
          TopAxis.Grid.Style = psSolid
          TopAxis.Grid.Visible = False
          TopAxis.LabelsFont.Height = -13
          TopAxis.MinorTicks.Visible = False
          TopAxis.Ticks.Color = clBlack
          TopAxis.TicksInner.Visible = False
          TopAxis.Visible = False
          View3D = False
          View3DOptions.Elevation = 355
          View3DOptions.Rotation = 287
          View3DOptions.Zoom = 88
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 1
          ColorPaletteIndex = 1
          object T00: TBarSeries
            Marks.Callout.Brush.Color = clBlack
            Marks.Style = smsValue
            Marks.Visible = True
            BarWidthPercent = 40
            Gradient.Direction = gdTopBottom
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object T01: TLineSeries
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Length = -14
            Marks.Style = smsValue
            Marks.Visible = True
            ValueFormat = '0.##%'
            VertAxis = aRightAxis
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
    end
  end
end
