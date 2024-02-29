part of widgets;

class AW_BoostWidget extends StatelessWidget {
  const AW_BoostWidget({
    Key? key,
    required this.description,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.moreIcon,
    required this.label,
    required this.dayLabel,
    required this.detailsIcon,
    required this.onTap,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1),
    this.activeColor = const Color.fromRGBO(23, 164, 160, 1),
    this.stoppedColor = const Color.fromRGBO(235, 87, 87, 1),
    this.titleStyle = const TextStyle(
      fontSize: 18,
      color: Color.fromRGBO(57, 70, 82, 1),
      fontWeight: FontWeight.w700
    ),
    this.descriptionStyle = const TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(57, 70, 82, 1),
    ),
    this.labelStyle = const TextStyle(
      fontSize: 12,
      color: Color.fromRGBO(57, 70, 82, 1)
    ),
  }) : super(key: key);

  final String title;
  final String description;
  final String icon;
  final IconData moreIcon;
  final bool isActive;
  final String label;
  final String dayLabel;
  final String detailsIcon;
  final VoidCallback onTap;

  //colors
  final Color activeColor;
  final Color stoppedColor;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final TextStyle labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AW_BoostStatus(
          description: description,
          title: title,
          icon: icon,
          isActive: isActive,
          moreIcon: moreIcon,
          activeColor: activeColor,
          stoppedColor: stoppedColor,
          backgroundColor: backgroundColor,
          titleStyle: titleStyle,
          descriptionStyle: descriptionStyle,
          onTap: onTap,
        ),
        const SizedBox(height: 10,),
        AW_BoostDetails(
          label: label,
          dayLabel: dayLabel,
          isActive: isActive,
          labelStyle: labelStyle,
          activeColor: activeColor,
          stoppedColor: stoppedColor,
          backgroundColor: backgroundColor,
          iconAsset: detailsIcon,
        )
      ],
    );
  }
}
