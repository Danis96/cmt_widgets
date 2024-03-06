part of widgets;

class AW_AchievementTrainingItem extends StatelessWidget {
  const AW_AchievementTrainingItem({
    Key? key,
    required this.title,
    required this.completed,
    required this.completedColor,
    required this.notCompletedColor,
    this.titleColor = const Color(0xFF394652),
    this.backgroundColor = Colors.white,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.only(bottom: 20, left: 10)
  }) : super(key: key);

  final String title;
  final bool completed;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color completedColor;
  final Color notCompletedColor;
  final Color titleColor;

  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(35, 31, 32, 0.15),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0
              )
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 10
                )
              ),
              const SizedBox(height: 8,),
              Container(
                height: 6,
                width: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: completed ? completedColor : notCompletedColor
                ),
              ),
            ],
          )
      ),
    );
  }
}