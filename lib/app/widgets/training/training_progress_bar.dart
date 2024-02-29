part of widgets;

class AW_TrainingProgressBar extends StatelessWidget {
  const AW_TrainingProgressBar({
    Key? key,
    required this.percentage,
    required this.radius,
    this.completedColor = const Color.fromRGBO(23, 164, 160, 1),
    this.notCompletedColor = const Color.fromRGBO(23, 164, 160, 0.4),
    this.startOffset = 20,
    this.endOffset = 40,
    this.startRadians = 180,
  }) : super(key: key);

  ///completed percentage of the training
  final double percentage;
  ///radius of the circle
  final double radius;

  final Color completedColor;
  final Color notCompletedColor;

  ///represents empty space from end of completed part to start of not completed one
  ///impacts endOffset, need to be balanced together
  final double startOffset;
  ///represents empty space from end of not completed part to start of completed one
  ///impacts startOffset, need to be balanced together
  final double endOffset;

  final double startRadians;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ProgressBarPainter(
        percentage: percentage,
        radius: radius,
        completedColor: completedColor,
        notCompletedColor: notCompletedColor,
        startOffset: startOffset,
        endOffset: endOffset,
        startRadians: startRadians,
      ),
      size: Size(radius, radius),
    );
  }

}

class _ProgressBarPainter extends CustomPainter{
  const _ProgressBarPainter({
    required this.percentage,
    required this.radius,
    required this.completedColor,
    required this.notCompletedColor,
    required this.endOffset,
    required this.startOffset,
    required this.startRadians,
    
  });

  final double percentage;
  final double radius;

  final double startOffset;
  final double endOffset;

  final Color completedColor;
  final Color notCompletedColor;

  final double startRadians;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, radius, radius);
    final double factor = (percentage * math.pi * radius) / 50;
    final double angle = ( 180 * factor) / (radius * math.pi);

    final double start = getRadians(-startRadians);

    canvas.drawArc(
        rect,
        start,
        getRadians(angle),
        false,
        Paint()
          ..color = completedColor
          ..strokeWidth = 6.0
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
    );

    canvas.drawArc(
        rect,
        getRadians(-startRadians + angle + startOffset),
        getRadians(360 - angle - endOffset),
        false,
        Paint()
          ..color = notCompletedColor
          ..strokeWidth = 6.0
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double percentageToAngle({double offset = 0}) {
    final double factor = ((percentage + offset) * math.pi * radius) / 50;
    final double angle = ( 180 * factor) / (radius * math.pi);
    return angle;
  }

  double getRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

}

