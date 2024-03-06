
part of widgets;

///Draws a pentagon for 5 passed args
///this widget does not take text into account
///when drawing on the canvas
///the caller must supply space necessary

class AW_Pentagon extends StatelessWidget {
  const AW_Pentagon({
    Key? key,
    required this.valueA,
    required this.valueC,
    required this.valueE,
    required this.valueB,
    required this.valueD,
    required this.radius,
    this.maxScore = 5,
    this.axisColor = const Color.fromRGBO(23, 164, 160, 0.5),
    this.connectorColor = const Color.fromRGBO(23, 164, 160, 1),
    this.offsetFactor = 1.4,
    required this.labelA,
    required this.labelB,
    required this.labelC,
    required this.labelD,
    required this.labelE,
    this.labelsColor = Colors.red
  }) : super(key: key);

  // labels
  final String labelA;
  final String labelB;
  final String labelC;
  final String labelD;
  final String labelE;
  //colors
  final Color axisColor;
  final Color connectorColor;
  final Color labelsColor;
  //circle args
  ///pentagon will take this as space to draw, along with outter circles
  final double radius;
  final double offsetFactor;
  // values
  final double valueA;
  final double valueB;
  final double valueC;
  final double valueD;
  final double valueE;
  final double maxScore;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: key,
      size:  Size(radius, radius),
      painter: PentagramPainter(
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
          labelsColor: labelsColor
      ),
    );
  }
}

class AW_PerfectPentagon extends StatelessWidget {
  const AW_PerfectPentagon({
    Key? key,
    required this.radius
  }) : super(key: key);

  final double radius;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: key,
      size: Size(radius, radius),
      painter: PentagramPainter(
        valueA: 5,
        valueB: 5,
        valueC: 5,
        valueD: 5,
        valueE: 5,
        labelA: '',
        labelB: '',
        labelC: '',
        labelD: '',
        labelE: '',
      ),
    );
  }
}




class PentagramPainter extends CustomPainter {

  PentagramPainter({
    required this.valueA,
    required this.valueC,
    required this.valueD,
    required this.valueB,
    required this.valueE,
    this.maxScore = 5,
    this.axisColor = const Color.fromRGBO(23, 164, 160, 0.5),
    this.connectorColor = const Color.fromRGBO(23, 164, 160, 1),
    this.offsetFactor = 1.05,
    required this.labelA,
    required this.labelB,
    required this.labelC,
    required this.labelD,
    required this.labelE,
    this.labelsColor = const Color.fromRGBO(23, 164, 160, 1),
    this.axisPaintWidth = 1,
    this.outlinePaintWidth = 2,
    this.ringPaintWidth = 2
  });


  //colors
  final Color axisColor;
  final Color connectorColor;
  final Color labelsColor;

  //values
  final double valueA;
  final double valueE;
  final double valueB;
  final double valueD;
  final double valueC;
  final double maxScore;
  //final double stepLength;
  final double offsetFactor;

  //labels
  final String labelA;
  final String labelB;
  final String labelC;
  final String labelD;
  final String labelE;

  late double stepLength;

  //paint args
  final double outlinePaintWidth;
  final double axisPaintWidth;
  final double ringPaintWidth;

  @override
  void paint(Canvas canvas, Size size) {
    stepLength = size.width / 15;
    final Paint axisPaint = Paint()
      ..color = axisColor
      ..strokeWidth = axisPaintWidth
      ..strokeCap = StrokeCap.round;

    final Paint outlinePaint   = Paint()
      ..color = connectorColor
      ..strokeWidth = outlinePaintWidth
      ..strokeCap = StrokeCap.round;

    final Paint ringPaint = Paint()
      ..color = connectorColor
      ..strokeWidth = ringPaintWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;



    _drawPentagon(canvas, size, axisPaint, outlinePaint, ringPaint);
  }


  void _drawPentagon(Canvas canvas, Size size, Paint axisPaint, Paint outlinePaint, Paint ringPaint) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    final Offset a = Offset(size.width / 2, size.width / 2 - (valueA * stepLength));

    final Offset extendedA = Offset(
        size.width / 2,
        size.width / 2 - (maxScore * stepLength * offsetFactor)
    );

    final Offset b = Offset(
        size.width / 2 + valueB * math.cos(getRadians(18)) * stepLength,
        size.width / 2 - valueB * math.sin(getRadians(18)) * stepLength
    );

    final Offset extendedB = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(18)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(18)) * (stepLength * offsetFactor)
    );

    final Offset c = Offset(
        size.width / 2 + valueC * math.cos(getRadians(-54)) * stepLength,
        size.width / 2 -  (valueC * math.sin(getRadians(-54))  * stepLength)
    );

    final Offset extendedC = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(-54)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(-54)) * (stepLength * offsetFactor)
    );

    final Offset d = Offset(
        size.width / 2 + valueD * math.cos(getRadians(-126)) * stepLength,
        size.width / 2 - valueD * math.sin(getRadians(-126)) * stepLength
    );

    final Offset extendedD = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(-126)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(-126)) * (stepLength * offsetFactor)
    );

    final Offset e = Offset(
        size.width / 2 + valueE * math.cos(getRadians(162)) * stepLength,
        size.width / 2 - valueE * math.sin(getRadians(162)) * stepLength
    );

    final Offset extendedE = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(162)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(162)) * (stepLength * offsetFactor)
    );

    final Path path = Path()..moveTo(a.dx, a.dy)
      ..lineTo(b.dx, b.dy)
      ..lineTo(c.dx, c.dy)
      ..lineTo(d.dx, d.dy)
      ..lineTo(e.dx, e.dy)
      ..lineTo(a.dx, a.dy)
      ..close();

    canvas.drawLine(center, a, axisPaint);
    canvas.drawLine(center, b, axisPaint);
    canvas.drawLine(center, c, axisPaint);
    canvas.drawLine(center, d, axisPaint);
    canvas.drawLine(center, e, axisPaint);

    canvas.drawLine(a, b, outlinePaint);
    canvas.drawLine(b, c, outlinePaint);
    canvas.drawLine(c, d, outlinePaint);
    canvas.drawLine(d, e, outlinePaint);
    canvas.drawLine(e, a, outlinePaint);

    final Paint fillPaint = Paint()
      ..color = connectorColor.withOpacity(0.3)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, fillPaint);

    canvas.drawCircle(extendedA, 4, axisPaint);
    //canvas.drawCircle(extendedA, 6, ringPaint);

    canvas.drawCircle(extendedB, 4, axisPaint);
    //canvas.drawCircle(extendedB, 6, ringPaint);

    canvas.drawCircle(extendedC, 4, axisPaint);
    //canvas.drawCircle(extendedC, 6, ringPaint);

    canvas.drawCircle(extendedD, 4, axisPaint);
    //canvas.drawCircle(extendedD, 6, ringPaint);

    canvas.drawCircle(extendedE, 4, axisPaint);
    //canvas.drawCircle(extendedE, 6, ringPaint);

    canvas.drawCircle(center, 4, axisPaint);

    _drawAText(labelA.split(' '), canvas, size);
    _drawBText(labelB.split(' '), canvas, size);
    _drawCText(labelC.split(' '), canvas, size);
    _drawDText(labelD.split(' '), canvas, size);
    _drawEText(labelE.split(' '), canvas, size);

  }


  void _drawText(
      Canvas canvas,
      Offset offset,
      TextPainter textPainter
      ) {
    textPainter.paint(canvas, offset);
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

  TextPainter _createTextPainter(String text) {
    final TextSpan textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: labelsColor,
        fontSize: 14,
      ),
    );


    final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center
    );

    textPainter.layout(maxWidth: 85, minWidth: 0);

    return textPainter;
  }

  void _drawAText(List<String> strings, Canvas canvas, Size size) {
    Offset labelAOffset = Offset(
        size.width / 2,
        size.width / 2 - (maxScore * (stepLength * offsetFactor)) - (strings.length - 1) * 15
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
    Offset labelBOffset = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(18)) * (stepLength * (offsetFactor + 0.2)) + 35,
        size.width / 2 - maxScore * math.sin(getRadians(18)) * (stepLength * (offsetFactor + 0.2)) - (strings.length - 1) * 7.5 - 5
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

  ///refaktorisat donje dvije
  void _drawCText(List<String> strings, Canvas canvas, Size size) {
    Offset labelCOffset = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(-54)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(-54))  * (stepLength * offsetFactor)
    );

    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateBottomOffsets(textPainter, labelCOffset), textPainter);
      labelCOffset = Offset(
          labelCOffset.dx,
          labelCOffset.dy + 15
      );
    }
  }

  void _drawDText(List<String> strings, Canvas canvas, Size size) {
    Offset labelDOffset = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(-126)) * (stepLength * offsetFactor),
        size.width / 2 - maxScore * math.sin(getRadians(-126)) * (stepLength * offsetFactor)
    );
    for (final String element in strings) {
      final TextPainter textPainter = _createTextPainter(element);
      _drawText(canvas, _calculateBottomOffsets(textPainter, labelDOffset), textPainter);
      labelDOffset = Offset(
          labelDOffset.dx,
          labelDOffset.dy + 15
      );
    }
  }

  void _drawEText(List<String> strings, Canvas canvas, Size size) {
    Offset labelEOffset = Offset(
        size.width / 2 + maxScore * math.cos(getRadians(162)) * (stepLength * (offsetFactor + 0.2)) - 35,
        size.width / 2 - maxScore * math.sin(getRadians(162)) * (stepLength * (offsetFactor + 0.2)) - (strings.length - 1) * 7.5 - 5
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



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double getRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

}