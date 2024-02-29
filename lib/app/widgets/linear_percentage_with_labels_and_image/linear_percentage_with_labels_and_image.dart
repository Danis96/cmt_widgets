part of widgets;

class AW_LinearPercentageWithLabelsAndImage extends StatelessWidget {
  const AW_LinearPercentageWithLabelsAndImage({
    this.widgetKey,
    this.discountCondition,
    this.progressColor = Colors.blueAccent,
    this.points,
    this.title,
    this.progress = 0,
    this.progressStrokeCap = StrokeCap.square,
    this.checkCondition = false,
  });

  final Key? widgetKey;
  final String? discountCondition;
  final double? progress;
  final List<double>? points;
  final Color progressColor;
  final String? title;
  final StrokeCap progressStrokeCap;
  final bool checkCondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(title!, style: Theme.of(context).textTheme.titleSmall),
            Text(discountCondition!, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: <Widget>[
            Expanded(
              child: AW_ProgressBarWithPoints(
                progress: progress != 0 ? progress! / 100 : 0,
                backgroundStrokeCap: StrokeCap.round,
                progressStrokeWidth: 6,
                points: points ?? <double>[],
                pointColor: Colors.white,
                progressColor: progressColor,
                backgroundColor: const Color.fromRGBO(232, 235, 237, 1),
                backgroundStrokeWidth: 6,
                progressStrokeCap: progressStrokeCap,
              ),
            ),
            const SizedBox(width: 16),
            Container(child: SvgPicture.asset(checkCondition ? 'assets/ic_discount_check.svg' : 'assets/ic_discount_x.svg')),
          ],
        ),
      ],
    );
  }
}
