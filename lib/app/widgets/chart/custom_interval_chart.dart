part of widgets;

class AW_CustomIntervalProgressIndicator extends StatelessWidget {
  const AW_CustomIntervalProgressIndicator({
    this.minValue = 0,
    this.maxValue = 5,
    this.interval = 1,
    this.value = 1,
    this.lineColor,
    this.lineWidth = 0.05,
    this.bgColor = Colors.white,
    this.content,
    this.contentPadding = 0,
    this.startAngle = 125,
    this.endAngle = 55,
    this.majorThickness = 6,
    this.betweenColor,
    this.separationLines = true,
    this.widgetKey,
    this.isInversed = false,
  });

  final double minValue;
  final double maxValue;
  final double interval;
  final double value;
  final Color? lineColor;
  final double lineWidth;
  final Color? bgColor;
  final Color? betweenColor;
  final Widget? content;
  final double contentPadding;
  final double startAngle;
  final double endAngle;
  final double majorThickness;
  final bool separationLines;
  final Key? widgetKey;
  final bool isInversed;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      key: widgetKey,
      axes: <RadialAxis>[
        RadialAxis(
          minimum: minValue,
          maximum: maxValue,
          showLabels: false,
          showTicks: false,
          startAngle: startAngle,
          endAngle: endAngle,
          radiusFactor: 0.9,
          axisLineStyle: AxisLineStyle(
            thickness: lineWidth,
            color: bgColor ?? Colors.red,
            thicknessUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Padding(
                  padding: EdgeInsets.only(bottom: contentPadding),
                  child: content),
            ),
          ],
          isInversed: isInversed,
          pointers: <GaugePointer>[
            RangePointer(
              value: value,
              width: lineWidth,
              sizeUnit: GaugeSizeUnit.factor,
              color: lineColor ?? Colors.blue,
              cornerStyle: CornerStyle.bothCurve,
            )
          ],
        ),
        // Segmented line
        RadialAxis(
          minimum: minValue,
          interval: interval,
          maximum: maxValue,
          showLabels: false,
          showTicks: separationLines,
          tickOffset: -0.01,
          showAxisLine: false,
          offsetUnit: GaugeSizeUnit.factor,
          minorTicksPerInterval: 0,
          startAngle: startAngle,
          endAngle: endAngle,
          radiusFactor: 0.9,
          majorTickStyle: separationLines
              ? MajorTickStyle(
                  length: 0.07,
                  thickness: majorThickness,
                  lengthUnit: GaugeSizeUnit.factor,
                  color: betweenColor ?? Colors.white,
                )
              : null,
        ),
      ],
    );
  }
}
