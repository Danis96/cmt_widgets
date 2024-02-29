part of widgets;

class AW_AchievementTrainingItemJapan extends StatelessWidget {
  const AW_AchievementTrainingItemJapan({
    Key? key,
    required this.title,
    required this.completed,
    required this.progress,
    this.titleColor = const Color(0xFF394652),
    this.backgroundColorProgress = const Color(0xFF394652),
    this.progressColor = const Color(0xFF0F99DD),
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.only(bottom: 20, left: 10)
  }) : super(key: key);

  final String title;
  final bool completed;
  final double progress;

  final VoidCallback onTap;

  final Color titleColor;
  final Color backgroundColorProgress;
  final Color progressColor;

  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 11
                )
              ),
              const SizedBox(height: 7),
                Container(
                  width: 110,
                  height: 10,
                  child: LinearPercentIndicator(
                    padding: EdgeInsets.zero,
                    width: 110,
                    percent: progress.isNegative ? 0 : progress,
                    backgroundColor: backgroundColorProgress.withOpacity(0.05),
                    barRadius: const Radius.circular(10),
                    progressColor: progressColor,
                  ),
                ),
            ],
          )
    );
  }
}