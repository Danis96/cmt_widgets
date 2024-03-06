
part of widgets;

class AW_PentagonOutline extends StatelessWidget {
  const AW_PentagonOutline({
    Key? key,
    required this.radius,
    required this.lineColor,
    required this.lineWidth,
    required this.filled,
    required this.outlineFillColor,
    required this.labelA,
    required this.labelB,
    required this.labelC,
    required this.labelD,
    required this.labelE,
    required this.valueC,
    required this.valueD,
    required this.valueB,
    required this.valueE,
    required this.valueA,
    this.offsetFactor = 1.2,
    required this.valueLineColor,
    required this.valueLineWidth,
    required this.valueFilledColor,
    required this.circleColor,
    required this.shouldDrawLines,
    this.labelColor = Colors.white
  }) : super(key: key);

  final double radius;
  final double offsetFactor;
  final Color lineColor;
  final Color valueLineColor;
  final Color valueFilledColor;
  final Color circleColor;
  final double lineWidth;
  final double valueLineWidth;

  final bool filled;
  final bool shouldDrawLines;
  final Color outlineFillColor;
  final Color labelColor;

  //values
  final double valueA;
  final double valueE;
  final double valueB;
  final double valueD;
  final double valueC;

  //labels
  final String labelA;
  final String labelB;
  final String labelC;
  final String labelD;
  final String labelE;


  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius, radius),
      painter: OutlinePentagonPainter(
        radius: radius,
        lineColor: lineColor,
        lineWidth: lineWidth,
        filled: filled,
        fillColor: outlineFillColor,
        valueA: valueA,
        valueB: valueB,
        valueC: valueC,
        valueD: valueD,
        valueE: valueE,
        labelA: labelA,
        labelB: labelB,
        labelC: labelC,
        labelD: labelD,
        labelE: labelE,
        offsetFactor: offsetFactor,
        valueLineColor: valueLineColor,
        valueLineWidth: valueLineWidth,
        valueFilledColor: valueFilledColor,
        circleColor: circleColor,
        shouldDrawLines: shouldDrawLines,
        labelColor: labelColor
      ),
    );
  }
}


class OutlinePentagonPainter extends CustomPainter{

  OutlinePentagonPainter({
    required this.radius,
    required this.lineColor,
    required this.lineWidth,
    required this.filled,
    required this.fillColor,
    required this.labelA,
    required this.labelB,
    required this.labelC,
    required this.labelD,
    required this.labelE,
    required this.valueC,
    required this.valueD,
    required this.valueB,
    required this.valueE,
    required this.valueA,
    this.offsetFactor = 1.2,
    this.labelColor = Colors.white,
    required this.valueLineWidth,
    required this.valueLineColor,
    required this.valueFilledColor,
    required this.circleColor,
    required this.shouldDrawLines
  });

  final double radius;
  final double lineWidth;
  final double valueLineWidth;
  final Color lineColor;
  final Color valueLineColor;
  final Color labelColor;
  final Color valueFilledColor;
  final Color circleColor;
  late double stepLength;
  final bool filled;
  final bool shouldDrawLines;
  final double offsetFactor;
  final Color fillColor;

  final double valueA;
  final double valueE;
  final double valueB;
  final double valueD;
  final double valueC;

  final String labelA;
  final String labelB;
  final String labelC;
  final String labelD;
  final String labelE;

  @override
  void paint(Canvas canvas, Size size) {
    stepLength = size.width / 10;

    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    final Paint valueLinePaint = Paint()
      ..color = valueLineColor
      ..strokeWidth = valueLineWidth;


    //outline pentagon, represents max values
    drawPentagon(canvas, size, linePaint, filled, true, fillColor);
    //value pentagon, represents risk card values
    drawPentagon(canvas, size, valueLinePaint, true, false, valueFilledColor,
        valueA: valueA / 20,
        valueB: valueB / 20,
        valueC: valueC / 20,
        valueD: valueD / 20,
        valueE: valueE / 20
    );

    _drawAText(labelA.split(' '), canvas, size);
    _drawBText(labelB.split(' '), canvas, size);
    _drawCText(labelC.split(' '), canvas, size);
    _drawDText(labelD.split(' '), canvas, size);
    _drawEText(labelE.split(' '), canvas, size);

    if(shouldDrawLines) {
      drawLines(canvas, size, linePaint);
    }



  }

  void _drawText(
      Canvas canvas,
      Offset offset,
      TextPainter textPainter
      ) {
    textPainter.paint(canvas, offset);
  }

  void _drawAText(List<String> strings, Canvas canvas, Size size) {
    final String longest = strings.reduce((String a, String b) {
      return a.length > b.length ? a : b;
    });

    final TextPainter painter = _createTextPainter(longest);
    Offset labelAOffset = Offset(
        size.width / 2,
        size.width / 2 - (5 * (stepLength * (offsetFactor - 0.1))) - (strings.length - 1) * 9 + (painter.height / 2 - 6)
    );
    for (final String element in strings) {
      _drawText(canvas, _calculateTopOffset(_createTextPainter(element), labelAOffset), _createTextPainter(element));
      labelAOffset = Offset(
          labelAOffset.dx,
          labelAOffset.dy + 15
      );
    }
  }



  void _drawBText(List<String> strings, Canvas canvas, Size size) {
    final String longest = strings.reduce((String a, String b) {
      return a.length > b.length ? a : b;
    });

    final TextPainter painter = _createTextPainter(longest);
    Offset labelBOffset = Offset(
        size.width / 2 + 5 * math.cos(getRadians(18)) * (stepLength * (offsetFactor + 0)) + (painter.width / 2 + 6),
        size.width / 2 - 5 * math.sin(getRadians(18)) * (stepLength * (offsetFactor + 0.2)) - (strings.length - 1) * 7.5 - 5
    );

    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateSideOffsets(textPainter, labelBOffset, 1), textPainter);
      labelBOffset = Offset(
          labelBOffset.dx,
          labelBOffset.dy + 15
      );
    }
  }

  void _drawCText(List<String> strings, Canvas canvas, Size size) {
    Offset labelCOffset = Offset(
        size.width / 2 + 5 * math.cos(getRadians(-54)) * (stepLength * offsetFactor) ,
        size.width / 2 - 5 * math.sin(getRadians(-54))  * (stepLength * offsetFactor) - 7
    );

    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateBottomOffsets(textPainter, labelCOffset), textPainter);
      labelCOffset = Offset(
          labelCOffset.dx,
          labelCOffset.dy + 13
      );
    }
  }

  void _drawDText(List<String> strings, Canvas canvas, Size size) {
    Offset labelDOffset = Offset(
        size.width / 2 + 5 * math.cos(getRadians(-136)) * (stepLength * offsetFactor),
        size.width / 2 - 5 * math.sin(getRadians(-126)) * (stepLength * offsetFactor) - 8
    );
    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateBottomOffsets(textPainter, labelDOffset), textPainter);
      labelDOffset = Offset(
          labelDOffset.dx,
          labelDOffset.dy + 10
      );
    }
  }

  void _drawEText(List<String> strings, Canvas canvas, Size size) {
    final String longest = strings.reduce((String a, String b) {
      return a.length > b.length ? a : b;
    });

    final TextPainter painter = _createTextPainter(longest);
    Offset labelEOffset = Offset(
        size.width / 2 + 5 * math.cos(getRadians(162)) * (stepLength * offsetFactor) - (painter.width / 2 + 6),
        size.width / 2 - 5 * math.sin(getRadians(162)) * (stepLength * (offsetFactor + 0.2)) - (strings.length - 1) * 7.5 - 5
    );

    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateSideOffsets(textPainter, labelEOffset,1), textPainter);
      labelEOffset = Offset(
          labelEOffset.dx,
          labelEOffset.dy + 15
      );
    }
  }

  TextPainter _createTextPainter(String text) {
    final TextSpan textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: labelColor,
        fontSize: 14,
      ),
    );


    final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center
    );

    textPainter.layout(maxWidth: 107, minWidth: 0);

    return textPainter;
  }

  Offset _calculateTopOffset(TextPainter textPainter, Offset offset) {
    return Offset(
        offset.dx - (textPainter.width / 2),
        offset.dy - (textPainter.height / 2) - 30
    );
  }

  Offset _calculateBottomOffsets(TextPainter textPainter, Offset offset) {
    return Offset(
        offset.dx - (textPainter.width / 2),
        offset.dy + 15
    );
  }

  Offset _calculateSideOffsets(TextPainter textPainter, Offset offset, int xFactor) {
    return Offset(
        offset.dx - (textPainter.width / 2),
        offset.dy
    );
  }

  void drawPath(
    Canvas canvas,
    Color fillColor,
    bool isFilled,
    Offset a,
    Offset b,
    Offset c,
    Offset d,
    Offset e
  ) {
    if(!isFilled) {
      return;
    }
    final Path path = Path()..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..lineTo(d.dx, d.dy)
      ..lineTo(e.dx, e.dy)
      ..lineTo(a.dx, a.dy)
      ..close();

    final Paint paint = Paint()..color = fillColor;
    canvas.drawPath(path, paint);

  }


  void drawLines(
    Canvas canvas,
    Size size,
    Paint linePaint
  ) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Offset a = Offset(size.width / 2, size.width / 2 - (5 * stepLength));

    final Offset b = Offset(
        size.width / 2 + 5 * math.cos(getRadians(18)) * stepLength,
        size.width / 2 - 5 * math.sin(getRadians(18)) * stepLength
    );
    final Offset c = Offset(
        size.width / 2 + 5 * math.cos(getRadians(-54)) * stepLength,
        size.width / 2 -  (5 * math.sin(getRadians(-54))  * stepLength)
    );

    final Offset d = Offset(
        size.width / 2 + 5 * math.cos(getRadians(-126)) * stepLength,
        size.width / 2 - 5 * math.sin(getRadians(-126)) * stepLength
    );

    final Offset e = Offset(
        size.width / 2 + 5 * math.cos(getRadians(162)) * stepLength,
        size.width / 2 - 5 * math.sin(getRadians(162)) * stepLength
    );

    canvas.drawLine(center, a, linePaint);
    canvas.drawLine(center, b, linePaint);
    canvas.drawLine(center, c, linePaint);
    canvas.drawLine(center, d, linePaint);
    canvas.drawLine(center, e, linePaint);
  }

  //draws outline pentagon, outline pentagon fill content
  //and circles
  void drawPentagon(
    Canvas canvas,
    Size size,
    Paint linePaint,
    bool filled,
    bool drawCircles,
    Color pathFillColor,
    {
      double valueA = 5,
      double valueB = 5,
      double valueC = 5,
      double valueD = 5,
      double valueE = 5
    }
) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final Offset a = Offset(size.width / 2, size.width / 2 - (valueA * stepLength));

    final Offset b = Offset(
        size.width / 2 + valueB * math.cos(getRadians(18)) * stepLength,
        size.width / 2 - valueB * math.sin(getRadians(18)) * stepLength
    );
    final Offset c = Offset(
        size.width / 2 + valueC * math.cos(getRadians(-54)) * stepLength,
        size.width / 2 -  (valueC * math.sin(getRadians(-54))  * stepLength)
    );

    final Offset d = Offset(
        size.width / 2 + valueD * math.cos(getRadians(-126)) * stepLength,
        size.width / 2 - valueD * math.sin(getRadians(-126)) * stepLength
    );

    final Offset e = Offset(
        size.width / 2 + valueE * math.cos(getRadians(162)) * stepLength,
        size.width / 2 - valueE * math.sin(getRadians(162)) * stepLength
    );

    canvas.drawLine(a, b, linePaint);
    canvas.drawLine(a, b, linePaint);
    canvas.drawLine(b, c, linePaint);
    canvas.drawLine(c, d, linePaint);
    canvas.drawLine(d, e, linePaint);
    canvas.drawLine(e, a, linePaint);

    if(filled) {
      drawPath(canvas, pathFillColor, filled, a, b, c, d, e);
    }

    if(drawCircles) {
      final Paint paint = Paint()..color = circleColor..strokeWidth = lineWidth;
      canvas.drawCircle(a, 2, paint);
      canvas.drawCircle(b, 2, paint);
      canvas.drawCircle(c, 2, paint);
      canvas.drawCircle(d, 2, paint);
      canvas.drawCircle(e, 2, paint);
      canvas.drawCircle(center, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double getRadians(double degrees) {
    return degrees * (math.pi / 180);
  }



}