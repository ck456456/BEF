object F_D18: TF_D18
  Left = 0
  Top = 117
  Width = 800
  Height = 375
  Caption = #25104#22411#32570#38519#25976#32113#35336
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
    Caption = 'QA'#25104#22411#33391#29575#22577#34920
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel6: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 71
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 200
      Top = 39
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label2: TLabel
      Left = 180
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label4: TLabel
      Left = 6
      Top = 10
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object Label5: TLabel
      Left = 10
      Top = 39
      Width = 29
      Height = 13
      Caption = 'Date :'
    end
    object Label6: TLabel
      Left = 497
      Top = 10
      Width = 26
      Height = 13
      Caption = 'Run :'
    end
    object CBType: TComboBox
      Left = 38
      Top = 6
      Width = 127
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object E_BDat: TEdit
      Left = 38
      Top = 35
      Width = 62
      Height = 21
      TabOrder = 1
    end
    object E_EDat: TEdit
      Left = 102
      Top = 35
      Width = 62
      Height = 21
      TabOrder = 2
    end
    object CB_BLn: TComboBox
      Left = 229
      Top = 35
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_ELn: TComboBox
      Left = 357
      Top = 35
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #25104#22411#31449
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_BWNo: TComboBox
      Left = 229
      Top = 8
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object CB_EWNo: TComboBox
      Left = 357
      Top = 8
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
    object E_BRun: TEdit
      Left = 526
      Top = 6
      Width = 120
      Height = 21
      TabOrder = 7
    end
    object E_ERun: TEdit
      Left = 654
      Top = 6
      Width = 120
      Height = 21
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
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
      Top = 9
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
  object PageControl1: TPageControl
    Left = 0
    Top = 112
    Width = 792
    Height = 195
    ActivePage = TS01
    Align = alClient
    TabOrder = 3
    object TS01: TTabSheet
      Caption = #32048#31680
      object SG01: TStringGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 167
        Align = alClient
        ColCount = 14
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        ColWidths = (
          40
          64
          64
          74
          70
          64
          64
          57
          64
          198
          64
          64
          64
          64)
      end
    end
    object TS02: TTabSheet
      Caption = #39318#27298
      ImageIndex = 1
      object TeeCommander3: TTeeCommander
        Left = 0
        Top = 0
        Width = 784
        Height = 33
        Panel = Chart3
        Align = alTop
        ParentShowHint = False
        TabOrder = 0
      end
      object Chart3: TChart
        Left = 0
        Top = 33
        Width = 784
        Height = 134
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
          #39318#27298)
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
        object T20: TBarSeries
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
        object T21: TLineSeries
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
    object TS03: TTabSheet
      Caption = #23614#27298
      ImageIndex = 2
      object TeeCommander2: TTeeCommander
        Left = 0
        Top = 0
        Width = 792
        Height = 33
        Panel = Chart2
        Align = alTop
        ParentShowHint = False
        TabOrder = 0
      end
      object Chart2: TChart
        Left = 0
        Top = 33
        Width = 792
        Height = 134
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
          #23614#27298)
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
        object T10: TBarSeries
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
        object T11: TLineSeries
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
    object TS04: TTabSheet
      Caption = #20840#37096
      ImageIndex = 3
      object Chart1: TChart
        Left = 0
        Top = 33
        Width = 792
        Height = 134
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
          #20840#37096)
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
        TabOrder = 0
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
      object TeeCommander1: TTeeCommander
        Left = 0
        Top = 0
        Width = 792
        Height = 33
        Panel = Chart1
        Align = alTop
        ParentShowHint = False
        TabOrder = 1
      end
    end
  end
end
