object F_D20: TF_D20
  Left = 1
  Top = 1
  Width = 798
  Height = 598
  Caption = 'CPK'
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
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 57
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 183
      Top = 33
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object Label2: TLabel
      Left = 385
      Top = 33
      Width = 46
      Height = 13
      Caption = 'Working :'
    end
    object Label4: TLabel
      Left = 179
      Top = 11
      Width = 30
      Height = 13
      Caption = 'Type :'
    end
    object Label5: TLabel
      Left = 18
      Top = 33
      Width = 29
      Height = 13
      Caption = 'Date :'
    end
    object Label6: TLabel
      Left = 629
      Top = 33
      Width = 26
      Height = 13
      Caption = 'Run :'
    end
    object Label3: TLabel
      Left = 396
      Top = 11
      Width = 35
      Height = 13
      Caption = 'Group :'
    end
    object Label7: TLabel
      Left = 621
      Top = 11
      Width = 34
      Height = 13
      Caption = 'SPEC :'
    end
    object Label11: TLabel
      Left = 8
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object CBType: TComboBox
      Left = 213
      Top = 7
      Width = 167
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = CBTypeChange
    end
    object E_BDat: TEdit
      Left = 50
      Top = 29
      Width = 62
      Height = 21
      TabOrder = 1
    end
    object E_EDat: TEdit
      Left = 114
      Top = 29
      Width = 62
      Height = 21
      TabOrder = 2
    end
    object CB_BLn: TComboBox
      Left = 213
      Top = 29
      Width = 81
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
      Left = 299
      Top = 29
      Width = 81
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
      Left = 434
      Top = 29
      Width = 92
      Height = 21
      ItemHeight = 13
      TabOrder = 5
    end
    object CB_EWNo: TComboBox
      Left = 526
      Top = 29
      Width = 91
      Height = 21
      ItemHeight = 13
      TabOrder = 6
    end
    object E_BRun: TEdit
      Left = 658
      Top = 29
      Width = 64
      Height = 21
      TabOrder = 7
    end
    object E_ERun: TEdit
      Left = 725
      Top = 29
      Width = 64
      Height = 21
      TabOrder = 8
    end
    object CB_Grp: TComboBox
      Left = 434
      Top = 7
      Width = 183
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      OnChange = CB_GrpChange
    end
    object CB_SPEC: TComboBox
      Left = 658
      Top = 7
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 10
    end
    object CB_001: TComboBox
      Left = 51
      Top = 7
      Width = 125
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 11
      Text = #25104#22411#31449
      OnChange = CB_001Change
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 530
    Width = 790
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      790
      41)
    object B_Close: TBitBtn
      Left = 709
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
    Top = 87
    Width = 790
    Height = 443
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Value'
      object Splitter1: TSplitter
        Left = 0
        Top = 212
        Width = 782
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object SG01: TStringGrid
        Left = 0
        Top = 0
        Width = 782
        Height = 212
        Align = alTop
        ColCount = 22
        DefaultRowHeight = 16
        RowCount = 12
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        ScrollBars = ssVertical
        TabOrder = 0
        OnMouseUp = SG02MouseUp
        OnTopLeftChanged = SG02TopLeftChanged
        ColWidths = (
          90
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
        RowHeights = (
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16)
      end
      object SG02: TStringGrid
        Left = 0
        Top = 215
        Width = 782
        Height = 200
        Align = alClient
        ColCount = 50
        DefaultRowHeight = 16
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 1
        OnDrawCell = SG02DrawCell
        OnMouseUp = SG02MouseUp
        OnTopLeftChanged = SG02TopLeftChanged
        ColWidths = (
          90
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
        RowHeights = (
          16
          16)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Chart'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 782
        Height = 415
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object P_Left: TPanel
          Left = 2
          Top = 2
          Width = 581
          Height = 411
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Panel7: TPanel
            Left = 0
            Top = 293
            Width = 581
            Height = 118
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object OChart: TChart
              Left = 2
              Top = 2
              Width = 577
              Height = 114
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
                'Observations')
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.Grid.Visible = False
              BottomAxis.GridCentered = True
              BottomAxis.Labels = False
              BottomAxis.LabelsFont.Height = -13
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
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.Grid.Visible = False
              RightAxis.LabelsFont.Height = -13
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Visible = False
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
              PrintMargins = (
                15
                40
                15
                40)
              ColorPaletteIndex = 1
              object ODt: TPointSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Length = 8
                Marks.Visible = False
                SeriesColor = clRed
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psCircle
                Pointer.Visible = True
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 113
            Width = 581
            Height = 180
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object MRChart: TChart
              Left = 2
              Top = 2
              Width = 577
              Height = 176
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
                'MR Chart')
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.Grid.Visible = False
              BottomAxis.GridCentered = True
              BottomAxis.LabelsFont.Height = -13
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
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.Grid.Visible = False
              RightAxis.LabelsFont.Height = -13
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Visible = False
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
              object MDt: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                Pointer.InflateMargins = True
                Pointer.Style = psCircle
                Pointer.Visible = True
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object MMean: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object M3U: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clBlack
                LinePen.Style = psDot
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
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 581
            Height = 113
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 2
            object XChart: TChart
              Left = 2
              Top = 2
              Width = 577
              Height = 109
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
                'X Chart')
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.Grid.Visible = False
              BottomAxis.GridCentered = True
              BottomAxis.LabelsFont.Height = -13
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
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.Grid.Visible = False
              RightAxis.LabelsFont.Height = -13
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Visible = False
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
              PrintMargins = (
                15
                29
                15
                29)
              ColorPaletteIndex = 1
              object XSL: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clBlack
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object XSU: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clBlack
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object XDt: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clRed
                ClickableLine = False
                Pointer.InflateMargins = True
                Pointer.Style = psCircle
                Pointer.Visible = True
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object XMean: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                DataSource = XSL
                SeriesColor = clBlack
                LinePen.Width = 2
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
                DataSources = (
                  'XSL'
                  'XSU')
                object TeeFunction1: TAverageTeeFunction
                end
              end
              object X3U: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clBlack
                Title = 'X3L'
                LinePen.Style = psDot
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.Visible = False
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
              object X3L: TLineSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clBlack
                Title = 'X3U'
                LinePen.Style = psDot
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
        object P_Right: TPanel
          Left = 583
          Top = 2
          Width = 197
          Height = 411
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Panel10: TPanel
            Left = 0
            Top = 179
            Width = 197
            Height = 232
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 0
            object BChart: TChart
              Left = 2
              Top = 2
              Width = 193
              Height = 228
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
                'Box and Whisker Plots')
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.Grid.Visible = False
              BottomAxis.GridCentered = True
              BottomAxis.LabelsFont.Height = -13
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
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.Grid.Visible = False
              RightAxis.LabelsFont.Height = -13
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Visible = False
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
              object BDt: TBoxSeries
                Marks.Arrow.Color = 4194368
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Color = 4194368
                Marks.Callout.Length = 19
                Marks.Brush.Color = clWhite
                Marks.Brush.Style = bsClear
                Marks.Font.Shadow.Smooth = False
                Marks.Transparent = True
                Marks.Visible = False
                ClickableLine = False
                Pointer.Brush.Color = clWhite
                Pointer.Draw3D = False
                Pointer.HorizSize = 15
                Pointer.InflateMargins = True
                Pointer.Style = psRectangle
                Pointer.VertSize = 15
                Pointer.Visible = True
                XValues.Order = loAscending
                YValues.Name = 'Samples'
                YValues.Order = loNone
                ExtrOut.InflateMargins = True
                ExtrOut.Style = psStar
                ExtrOut.Visible = True
                MedianPen.Style = psDot
                MildOut.InflateMargins = True
                MildOut.Style = psCircle
                MildOut.Visible = True
                SampleValues.Name = 'Samples'
                SampleValues.Order = loNone
                WhiskerLength = 1.500000000000000000
              end
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 197
            Height = 179
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object HChart: TChart
              Left = 2
              Top = 2
              Width = 193
              Height = 175
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
                'Histogram')
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.Grid.Visible = False
              BottomAxis.GridCentered = True
              BottomAxis.LabelsFont.Height = -13
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
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.Grid.Visible = False
              RightAxis.LabelsFont.Height = -13
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Visible = False
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
              object HDt: THistogramSeries
                Marks.Callout.Brush.Color = clBlack
                Marks.Visible = False
                SeriesColor = clRed
                LinesPen.Visible = True
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
  end
  object Panel5: TPanel
    Left = 0
    Top = 57
    Width = 790
    Height = 30
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 3
    object Label8: TLabel
      Left = 204
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Item : '
    end
    object CB_Type: TComboBox
      Left = 241
      Top = 4
      Width = 150
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = CB_TypeChange
    end
    object CB_CPK: TComboBox
      Left = 44
      Top = 4
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 1
      Text = 'all'
      OnChange = CB_CPKChange
      Items.Strings = (
        'all'
        #39318#27298
        #23614#27298)
    end
  end
end
