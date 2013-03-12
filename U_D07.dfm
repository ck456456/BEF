object F_D07: TF_D07
  Left = 0
  Top = 196
  Width = 800
  Height = 375
  Caption = 'Event Report'
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
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    Caption = 'Event Report'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 792
    Height = 39
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label11: TLabel
      Left = 16
      Top = 11
      Width = 39
      Height = 13
      Caption = 'Station :'
    end
    object Label3: TLabel
      Left = 189
      Top = 11
      Width = 26
      Height = 13
      Caption = 'Line :'
    end
    object L_Type: TLabel
      Left = 469
      Top = 11
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Date :'
    end
    object CB_001: TComboBox
      Left = 59
      Top = 7
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #25104#22411#31449
      OnChange = CB_001Change
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object E_BDT: TEdit
      Left = 502
      Top = 7
      Width = 63
      Height = 21
      TabOrder = 1
      Text = '20040101'
    end
    object E_EDT: TEdit
      Left = 572
      Top = 7
      Width = 63
      Height = 21
      TabOrder = 2
      Text = '20040101'
    end
    object CB_Type: TComboBox
      Left = 648
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = 'all'
      Items.Strings = (
        'all'
        'Run'
        'Event')
    end
    object CB_BLn: TComboBox
      Left = 218
      Top = 7
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #25104#22411#31449
      OnChange = CB_BLnChange
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
    object CB_ELn: TComboBox
      Left = 341
      Top = 7
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #25104#22411#31449
      OnChange = CB_BLnChange
      Items.Strings = (
        #25104#22411#31449
        #35097#33180#31449)
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 80
    Width = 792
    Height = 227
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 2
    object PC01: TPageControl
      Left = 2
      Top = 2
      Width = 788
      Height = 223
      ActivePage = TS01
      Align = alClient
      TabOrder = 0
      object TS01: TTabSheet
        Caption = 'Event Report'
        object SG01: TCIM_Grid
          Left = 0
          Top = 0
          Width = 780
          Height = 195
          Align = alClient
          ColCount = 17
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
          TabOrder = 0
          OnDblClick = SG01DblClick
          CIMOptions = [goSorting]
        end
      end
      object TS02: TTabSheet
        Caption = 'Downtime'
        ImageIndex = 1
        object SG02: TStringGrid
          Left = 0
          Top = 0
          Width = 780
          Height = 195
          Align = alClient
          ColCount = 18
          DefaultColWidth = 32
          DefaultRowHeight = 16
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          ColWidths = (
            98
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32
            32)
        end
      end
      object TS03: TTabSheet
        Caption = 'Chart 1'
        ImageIndex = 2
        object CmdEve01: TTeeCommander
          Left = 0
          Top = 0
          Width = 780
          Height = 33
          Panel = CEve01
          Align = alTop
          ParentShowHint = False
          TabOrder = 0
        end
        object CEve01: TChart
          Left = 0
          Top = 33
          Width = 780
          Height = 162
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
          Legend.Alignment = laBottom
          Legend.CheckBoxes = True
          Legend.CheckBoxesStyle = cbsRadio
          Legend.Color = clGray
          Legend.Font.Color = clWhite
          Legend.Font.Height = -13
          Legend.Gradient.Direction = gdTopBottom
          Legend.Gradient.EndColor = clYellow
          Legend.Gradient.StartColor = clWhite
          Legend.LegendStyle = lsSeries
          Legend.Shadow.HorizSize = 0
          Legend.Shadow.VertSize = 0
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
            'Events Chart')
          BottomAxis.Axis.Width = 1
          BottomAxis.Grid.Color = clBlack
          BottomAxis.Grid.Style = psSolid
          BottomAxis.Grid.Visible = False
          BottomAxis.GridCentered = True
          BottomAxis.LabelsAngle = 270
          BottomAxis.LabelStyle = talText
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
          TabOrder = 1
          PrintMargins = (
            15
            21
            15
            21)
          ColorPaletteIndex = 1
          object SEveDown: TBarSeries
            Depth = 0
            Marks.Callout.Brush.Color = clBlack
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            Title = 'Downtime'
            ValueFormat = '#0.#'
            BarWidthPercent = 40
            Gradient.Direction = gdTopBottom
            MultiBar = mbSideAll
            StackGroup = 1
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object SEveUp: TBarSeries
            Active = False
            Depth = 0
            Marks.Callout.Brush.Color = clBlack
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = 8454016
            Title = 'Uptime'
            ValueFormat = '#0.#'
            BarWidthPercent = 40
            Gradient.Direction = gdTopBottom
            MultiBar = mbSideAll
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
      object TS04: TTabSheet
        Caption = 'Chart 2'
        ImageIndex = 5
        object PC02: TPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 195
          ActivePage = TS0402
          Align = alClient
          TabOrder = 0
          object TS0401: TTabSheet
            Caption = 'Detail'
            object TeeCommander2: TTeeCommander
              Left = 0
              Top = 0
              Width = 772
              Height = 33
              Panel = Chart1
              Align = alTop
              ParentShowHint = False
              TabOrder = 0
            end
            object Chart1: TChart
              Left = 0
              Top = 33
              Width = 772
              Height = 134
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Color = clWhite
              BackWall.Dark3D = False
              BackWall.Gradient.EndColor = 11118482
              BackWall.Size = 8
              BackWall.Transparent = False
              Border.Visible = True
              BottomWall.Dark3D = False
              BottomWall.Gradient.EndColor = 16580349
              BottomWall.Gradient.StartColor = 3114493
              BottomWall.Size = 8
              LeftWall.Color = clWhite
              LeftWall.Dark3D = False
              LeftWall.Gradient.EndColor = 2413052
              LeftWall.Gradient.StartColor = 900220
              LeftWall.Size = 8
              Legend.Alignment = laLeft
              Legend.CheckBoxes = True
              Legend.Color = clGray
              Legend.Font.Color = clWhite
              Legend.Font.Height = -13
              Legend.Font.Name = 'Times New Roman'
              Legend.Frame.Visible = False
              Legend.Gradient.Direction = gdTopBottom
              Legend.Gradient.EndColor = clYellow
              Legend.Gradient.StartColor = clWhite
              Legend.LegendStyle = lsSeries
              Legend.Shadow.HorizSize = 0
              Legend.Shadow.VertSize = 0
              Legend.Symbol.DefaultPen = False
              Legend.Symbol.Pen.Visible = False
              Legend.TextStyle = ltsRightPercent
              Legend.Transparent = True
              Legend.Visible = False
              MarginBottom = 0
              MarginLeft = 0
              MarginRight = 5
              MarginTop = 5
              RightWall.Color = clWhite
              RightWall.Dark3D = False
              RightWall.Size = 8
              Title.AdjustFrame = False
              Title.Brush.Color = clBlue
              Title.Color = clBlue
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Times New Roman'
              Title.Frame.Width = 2
              Title.Text.Strings = (
                'Events Chart')
              Title.Visible = False
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.GridCentered = True
              BottomAxis.LabelsAngle = 270
              BottomAxis.LabelsFont.Height = -13
              BottomAxis.LabelsFont.Name = 'Times New Roman'
              BottomAxis.LabelStyle = talText
              BottomAxis.MinorTicks.Visible = False
              BottomAxis.Ticks.Color = clBlack
              BottomAxis.TicksInner.Visible = False
              BottomAxis.Title.Caption = 'Time'
              BottomAxis.Title.Font.Name = 'Times New Roman'
              BottomAxis.Title.Visible = False
              DepthAxis.Axis.Width = 1
              DepthAxis.Grid.Color = clBlack
              DepthAxis.Grid.Style = psSolid
              DepthAxis.LabelsFont.Height = -13
              DepthAxis.LabelsFont.Name = 'Times New Roman'
              DepthAxis.MinorTicks.Visible = False
              DepthAxis.Ticks.Color = clBlack
              DepthAxis.TicksInner.Visible = False
              DepthAxis.Title.Font.Name = 'Times New Roman'
              DepthTopAxis.Axis.Width = 1
              DepthTopAxis.Grid.Color = clBlack
              DepthTopAxis.Grid.Style = psSolid
              DepthTopAxis.LabelsFont.Height = -13
              DepthTopAxis.LabelsFont.Name = 'Times New Roman'
              DepthTopAxis.MinorTicks.Visible = False
              DepthTopAxis.Ticks.Color = clBlack
              DepthTopAxis.TicksInner.Visible = False
              DepthTopAxis.Title.Font.Name = 'Times New Roman'
              LeftAxis.Axis.Width = 1
              LeftAxis.Grid.Color = clBlack
              LeftAxis.Grid.Style = psSolid
              LeftAxis.LabelsFont.Height = -13
              LeftAxis.LabelsFont.Name = 'Times New Roman'
              LeftAxis.MinorTicks.Visible = False
              LeftAxis.StartPosition = 1.000000000000000000
              LeftAxis.EndPosition = 99.000000000000000000
              LeftAxis.Ticks.Color = clBlack
              LeftAxis.TicksInner.Visible = False
              LeftAxis.Title.Caption = 'Value'
              LeftAxis.Title.Font.Name = 'Times New Roman'
              LeftAxis.Title.Visible = False
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.LabelsFont.Height = -13
              RightAxis.LabelsFont.Name = 'Times New Roman'
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Title.Font.Name = 'Times New Roman'
              RightAxis.Visible = False
              Shadow.Color = clBlack
              TopAxis.Axis.Width = 1
              TopAxis.Grid.Color = clBlack
              TopAxis.Grid.Style = psSolid
              TopAxis.LabelsFont.Height = -13
              TopAxis.LabelsFont.Name = 'Times New Roman'
              TopAxis.MinorTicks.Visible = False
              TopAxis.Ticks.Color = clBlack
              TopAxis.TicksInner.Visible = False
              TopAxis.Title.Font.Name = 'Times New Roman'
              TopAxis.Visible = False
              View3D = False
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DOptions.Zoom = 88
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 1
              PrintMargins = (
                15
                25
                15
                25)
              ColorPaletteIndex = 5
              object SC01: TPieSeries
                Marks.Arrow.Color = clBlack
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Color = clBlack
                Marks.Font.Height = -13
                Marks.Font.Name = 'Times New Roman'
                Marks.Style = smsLabelPercent
                Marks.Transparent = True
                Marks.Visible = True
                ValueFormat = '##0.## %'
                Circled = True
                Gradient.Direction = gdRadial
                OtherSlice.Legend.Visible = False
                PieValues.Name = 'Pie'
                PieValues.Order = loDescending
              end
              object ChartTool3: TDragMarksTool
                Series = SC01
              end
              object ChartTool4: TExtraLegendTool
                Legend.Left = 0
                Legend.LegendStyle = lsValues
                Legend.ResizeChart = False
                Legend.TextStyle = ltsXAndPercent
                Legend.Top = 0
                Series = SC01
              end
            end
          end
          object TS0402: TTabSheet
            Caption = 'Overall'
            ImageIndex = 1
            object TeeCommander3: TTeeCommander
              Left = 0
              Top = 0
              Width = 772
              Height = 33
              Panel = Chart2
              Align = alTop
              ParentShowHint = False
              TabOrder = 0
            end
            object Chart2: TChart
              Left = 0
              Top = 33
              Width = 772
              Height = 134
              BackWall.Brush.Color = clWhite
              BackWall.Brush.Style = bsClear
              BackWall.Color = clWhite
              BackWall.Dark3D = False
              BackWall.Gradient.EndColor = 11118482
              BackWall.Size = 8
              BackWall.Transparent = False
              Border.Visible = True
              BottomWall.Dark3D = False
              BottomWall.Gradient.EndColor = 16580349
              BottomWall.Gradient.StartColor = 3114493
              BottomWall.Size = 8
              LeftWall.Color = clWhite
              LeftWall.Dark3D = False
              LeftWall.Gradient.EndColor = 2413052
              LeftWall.Gradient.StartColor = 900220
              LeftWall.Size = 8
              Legend.Alignment = laBottom
              Legend.CheckBoxes = True
              Legend.CheckBoxesStyle = cbsRadio
              Legend.Color = clGray
              Legend.Font.Color = clWhite
              Legend.Font.Height = -13
              Legend.Font.Name = 'Times New Roman'
              Legend.Frame.Visible = False
              Legend.Gradient.Direction = gdTopBottom
              Legend.Gradient.EndColor = clYellow
              Legend.Gradient.StartColor = clWhite
              Legend.LegendStyle = lsSeries
              Legend.Shadow.HorizSize = 0
              Legend.Shadow.VertSize = 0
              Legend.Symbol.DefaultPen = False
              Legend.Symbol.Pen.Visible = False
              Legend.TextStyle = ltsRightPercent
              Legend.Transparent = True
              Legend.Visible = False
              MarginBottom = 0
              MarginLeft = 0
              MarginRight = 5
              MarginTop = 5
              RightWall.Color = clWhite
              RightWall.Dark3D = False
              RightWall.Size = 8
              Title.AdjustFrame = False
              Title.Brush.Color = clBlue
              Title.Color = clBlue
              Title.Font.Color = clBlack
              Title.Font.Height = -16
              Title.Font.Name = 'Times New Roman'
              Title.Frame.Width = 2
              Title.Text.Strings = (
                'Events Chart')
              Title.Visible = False
              BottomAxis.Axis.Width = 1
              BottomAxis.Grid.Color = clBlack
              BottomAxis.Grid.Style = psSolid
              BottomAxis.GridCentered = True
              BottomAxis.LabelsAngle = 270
              BottomAxis.LabelsFont.Height = -13
              BottomAxis.LabelsFont.Name = 'Times New Roman'
              BottomAxis.LabelStyle = talText
              BottomAxis.MinorTicks.Visible = False
              BottomAxis.Ticks.Color = clBlack
              BottomAxis.TicksInner.Visible = False
              BottomAxis.Title.Caption = 'Time'
              BottomAxis.Title.Font.Name = 'Times New Roman'
              BottomAxis.Title.Visible = False
              DepthAxis.Axis.Width = 1
              DepthAxis.Grid.Color = clBlack
              DepthAxis.Grid.Style = psSolid
              DepthAxis.LabelsFont.Height = -13
              DepthAxis.LabelsFont.Name = 'Times New Roman'
              DepthAxis.MinorTicks.Visible = False
              DepthAxis.Ticks.Color = clBlack
              DepthAxis.TicksInner.Visible = False
              DepthAxis.Title.Font.Name = 'Times New Roman'
              DepthTopAxis.Axis.Width = 1
              DepthTopAxis.Grid.Color = clBlack
              DepthTopAxis.Grid.Style = psSolid
              DepthTopAxis.LabelsFont.Height = -13
              DepthTopAxis.LabelsFont.Name = 'Times New Roman'
              DepthTopAxis.MinorTicks.Visible = False
              DepthTopAxis.Ticks.Color = clBlack
              DepthTopAxis.TicksInner.Visible = False
              DepthTopAxis.Title.Font.Name = 'Times New Roman'
              LeftAxis.Axis.Width = 1
              LeftAxis.Grid.Color = clBlack
              LeftAxis.Grid.Style = psSolid
              LeftAxis.LabelsFont.Height = -13
              LeftAxis.LabelsFont.Name = 'Times New Roman'
              LeftAxis.MinorTicks.Visible = False
              LeftAxis.StartPosition = 1.000000000000000000
              LeftAxis.EndPosition = 99.000000000000000000
              LeftAxis.Ticks.Color = clBlack
              LeftAxis.TicksInner.Visible = False
              LeftAxis.Title.Caption = 'Value'
              LeftAxis.Title.Font.Name = 'Times New Roman'
              LeftAxis.Title.Visible = False
              RightAxis.Axis.Width = 1
              RightAxis.Grid.Color = clBlack
              RightAxis.Grid.Style = psSolid
              RightAxis.LabelsFont.Height = -13
              RightAxis.LabelsFont.Name = 'Times New Roman'
              RightAxis.MinorTicks.Visible = False
              RightAxis.Ticks.Color = clBlack
              RightAxis.TicksInner.Visible = False
              RightAxis.Title.Font.Name = 'Times New Roman'
              RightAxis.Visible = False
              Shadow.Color = clBlack
              TopAxis.Axis.Width = 1
              TopAxis.Grid.Color = clBlack
              TopAxis.Grid.Style = psSolid
              TopAxis.LabelsFont.Height = -13
              TopAxis.LabelsFont.Name = 'Times New Roman'
              TopAxis.MinorTicks.Visible = False
              TopAxis.Ticks.Color = clBlack
              TopAxis.TicksInner.Visible = False
              TopAxis.Title.Font.Name = 'Times New Roman'
              TopAxis.Visible = False
              View3D = False
              View3DOptions.Elevation = 315
              View3DOptions.Orthogonal = False
              View3DOptions.Perspective = 0
              View3DOptions.Rotation = 360
              View3DOptions.Zoom = 88
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              TabOrder = 1
              PrintMargins = (
                15
                25
                15
                25)
              ColorPaletteIndex = 5
              object SC02: TPieSeries
                Marks.Arrow.Color = clBlack
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Color = clBlack
                Marks.Font.Height = -13
                Marks.Font.Name = 'Times New Roman'
                Marks.Style = smsLabelPercent
                Marks.Transparent = True
                Marks.Visible = True
                Circled = True
                Gradient.Direction = gdRadial
                OtherSlice.Legend.Visible = False
                PieValues.Name = 'Pie'
                PieValues.Order = loNone
              end
              object ChartTool5: TDragMarksTool
                Series = SC02
              end
              object ChartTool6: TExtraLegendTool
                Legend.Left = 0
                Legend.LegendStyle = lsValues
                Legend.Top = 0
                Series = SC02
              end
            end
          end
        end
      end
      object TS05: TTabSheet
        Caption = 'Chart 3'
        ImageIndex = 3
        object CmdEve02: TTeeCommander
          Left = 0
          Top = 0
          Width = 780
          Height = 33
          Panel = CEve02
          Align = alTop
          ParentShowHint = False
          TabOrder = 0
        end
        object CEve02: TChart
          Left = 0
          Top = 33
          Width = 780
          Height = 162
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
          Legend.CheckBoxes = True
          Legend.Color = clGray
          Legend.Font.Color = clWhite
          Legend.Font.Height = -13
          Legend.Gradient.Direction = gdTopBottom
          Legend.Gradient.EndColor = clYellow
          Legend.Gradient.StartColor = clWhite
          Legend.LegendStyle = lsSeries
          Legend.Shadow.HorizSize = 0
          Legend.Shadow.VertSize = 0
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
            'Events Chart')
          Title.Visible = False
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
          RightAxis.AxisValuesFormat = '0.#%'
          RightAxis.ExactDateTime = False
          RightAxis.Grid.Color = clBlack
          RightAxis.Grid.Style = psSolid
          RightAxis.Grid.Visible = False
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
          object Utilization: TLineSeries
            Marks.Callout.Brush.Color = clBlack
            Marks.Style = smsValue
            Marks.Visible = True
            ValueFormat = '#,##0.## %'
            VertAxis = aRightAxis
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
          object ChartTool1: TLegendScrollBar
            Brush.Color = clWhite
            DrawStyle = dsAlways
            Pen.Color = clWindowFrame
            ThumbBrush.Color = clSilver
          end
        end
      end
      object TS06: TTabSheet
        Caption = 'Chart 4'
        ImageIndex = 4
        object TeeCommander1: TTeeCommander
          Left = 0
          Top = 0
          Width = 780
          Height = 33
          Panel = Obs
          Align = alTop
          ParentShowHint = False
          TabOrder = 0
        end
        object Obs: TChart
          Left = 0
          Top = 33
          Width = 780
          Height = 162
          AllowPanning = pmHorizontal
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
            'Observation')
          BottomAxis.Axis.Width = 1
          BottomAxis.DateTimeFormat = 'M/d hh:mm'
          BottomAxis.Grid.Color = clBlack
          BottomAxis.Grid.Style = psSolid
          BottomAxis.Grid.Visible = False
          BottomAxis.GridCentered = True
          BottomAxis.Increment = 0.000000000011574074
          BottomAxis.LabelsAngle = 270
          BottomAxis.MinimumOffset = -4
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
          LeftAxis.LabelStyle = talMark
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
          TabOrder = 1
          ColorPaletteIndex = 1
          object SObs: TGanttSeries
            Marks.Arrow.Color = clBlack
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Color = clBlack
            Marks.Gradient.Visible = True
            Marks.Visible = True
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Pen.Visible = False
            Pointer.Style = psRectangle
            Pointer.VertSize = 5
            Pointer.Visible = True
            XValues.Name = 'Start'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
            ConnectingPen.Visible = False
            StartValues.Name = 'Start'
            StartValues.Order = loAscending
            EndValues.Name = 'End'
            EndValues.Order = loNone
            NextTask.Name = 'NextTask'
            NextTask.Order = loNone
            Data = {
              04030000000000000020ABE2400B50726F746F747970696E670000000040ACE2
              40000000000000F0BF0000000040ABE2400644657369676E00000000E0ACE240
              000000000000F0BF0000000080ABE2400B446576656C6F706D656E7400000000
              A0ADE240000000000000F0BF}
          end
          object ChartTool2: TAxisArrowTool
            AxisID = 0
          end
          object ChartTool7: TDragMarksTool
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 307
    Width = 792
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    DesignSize = (
      792
      41)
    object B_Cls: TBitBtn
      Left = 704
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
      Left = 160
      Top = 9
      Width = 73
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
end
