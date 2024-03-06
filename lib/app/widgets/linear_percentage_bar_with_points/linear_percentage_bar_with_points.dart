part of widgets;

class AW_ProgressBarWithPoints extends StatefulWidget {
  const AW_ProgressBarWithPoints({
    this.widgetKey,
    this.start = 0.0,
    this.progress = 0.0,
    this.progressColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.progressStrokeWidth = 10.0,
    this.backgroundStrokeWidth = 5.0,
    this.progressStrokeCap = StrokeCap.square,
    this.backgroundStrokeCap = StrokeCap.square,
    this.pointColor = Colors.blue,
    this.points = const <double>[],
  });

  final Key? widgetKey;

  // The starting position of the progress bar. Defaults to 0.0 must be less than 1.0
  final double start;

  // The progress position of the progress bar. Defaults to 0.0 must be less than 1.0 and greater than start.
  final double progress;

  // a List of double values that are represented on the progress line as points. Must be greater than or equal to 0.0 and less than or equal to 1.0
  final List<double> points;

  // The Color of the progress bar
  final Color progressColor;

  // The color of the background bar
  final Color backgroundColor;

  // The stroke width of the progress bar
  final double progressStrokeWidth;

  // The cap style of the progress bar. Defaults to square, options include StrokeCap.round, StrokeCap.square, StrokeCap.butt
  final StrokeCap progressStrokeCap;

  // the stroke width of the background bar
  final double backgroundStrokeWidth;

  // The cap style of the progress bar. Defaults to square, options include StrokeCap.round, StrokeCap.square, StrokeCap.butt
  final StrokeCap backgroundStrokeCap;

  // The Color of the outer circle of the points given in the points parameter defaults to Colors.blue
  final Color pointColor;

  @override
  _AW_ProgressBarWithPointsState createState() => _AW_ProgressBarWithPointsState();
}

class _AW_ProgressBarWithPointsState extends State<AW_ProgressBarWithPoints> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        key: widget.widgetKey,
        foregroundPainter: _AW_ProgressBarPainter(
            progress: widget.progress,
            start: widget.start,
            progressColor: widget.progressColor,
            backgroundColor: widget.backgroundColor,
            progressStrokeWidth: widget.progressStrokeWidth,
            progressStrokeCap: widget.progressStrokeCap,
            backgroundStrokeWidth: widget.backgroundStrokeWidth,
            backgroundStrokeCap: widget.backgroundStrokeCap,
            pointColor: widget.pointColor,
            points: widget.points),
        child: const Center());
  }
}

class _AW_ProgressBarPainter extends CustomPainter {
  _AW_ProgressBarPainter({
    required this.start,
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.progressStrokeWidth,
    required this.progressStrokeCap,
    required this.backgroundStrokeWidth,
    required this.backgroundStrokeCap,
    required this.points,
    required this.pointColor,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeCap = backgroundStrokeCap;
    _paintBackground.strokeWidth = backgroundStrokeWidth;
    _paintProgress.color = progressColor;
    _paintProgress.style = PaintingStyle.stroke;
    _paintProgress.strokeCap = progressStrokeCap;
    _paintProgress.strokeWidth = progressStrokeWidth;
    _paintPoint.color = pointColor;
    _paintPoint.style = PaintingStyle.fill;
    _paintPointCenter.style = PaintingStyle.fill;
  }

  final Paint _paintBackground = Paint();
  final Paint _paintProgress = Paint();
  final Paint _paintPoint = Paint();
  final Paint _paintPointCenter = Paint();
  final Color backgroundColor;
  final Color progressColor;
  final double start;
  final double progress;
  final double progressStrokeWidth;
  final StrokeCap progressStrokeCap;
  final double backgroundStrokeWidth;
  final StrokeCap backgroundStrokeCap;
  final Color pointColor;
  final List<double> points;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset startOffset = Offset(0.0, size.height / 2);
    final Offset endOffset = Offset(size.width, size.height / 2);
    canvas.drawLine(startOffset, endOffset, _paintBackground);
    final double xStart = size.width * start;
    double cappedProgress = progress;
    if (progress > 1) {
      cappedProgress = 1.0;
    }
    final double xProgress = size.width * cappedProgress;
    final Offset progressStart = Offset(xStart, size.height / 2);
    canvas.drawLine(progressStart, Offset(xProgress, size.height / 2), _paintProgress);
    for (final double point in points) {
      final double pointPos = size.width * point;
      final Offset pointX = Offset(pointPos, size.height / 2);
      canvas.drawRect(Rect.fromCenter(center: pointX, width: 6, height: 6), _paintPoint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final _AW_ProgressBarPainter old = oldDelegate as _AW_ProgressBarPainter;
    return old.progress != progress ||
        old.start != start ||
        old.progressColor != progressColor ||
        old.backgroundColor != backgroundColor ||
        old.progressStrokeWidth != progressStrokeWidth ||
        old.backgroundStrokeWidth != backgroundStrokeWidth ||
        old.progressStrokeCap != progressStrokeCap ||
        old.backgroundStrokeCap != backgroundStrokeCap ||
        old.pointColor != pointColor ||
        old.points != points;
  }
}
