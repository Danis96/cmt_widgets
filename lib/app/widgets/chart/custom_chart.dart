part of widgets;

class AW_CustomProgressIndicator extends StatelessWidget {
  const AW_CustomProgressIndicator({
    this.minValue = 0,
    this.maxValue = 5,
    this.value = 1,
    this.lineColor,
    this.lineWidth = 0.05,
    this.bgColor,
    this.content,
    this.contentPadding = 0,
    this.startAngle = 125,
    this.endAngle = 55,
    this.height = 150,
    this.widgetKey,
  });

  final double minValue;
  final double maxValue;
  final double value;
  final Color? lineColor;
  final double lineWidth;
  final Color? bgColor;
  final Widget? content;
  final double contentPadding;
  final double startAngle;
  final double endAngle;
  final double height;
  final Key? widgetKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      key: widgetKey!,
      child: SfRadialGauge(
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
            majorTickStyle: null,
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                positionFactor: 0.1,
                angle: 90,
                widget: Padding(
                  padding: EdgeInsets.only(bottom: contentPadding),
                  child: content!,
                ),
              ),
            ],
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
        ],
      ),
    );
  }
}
