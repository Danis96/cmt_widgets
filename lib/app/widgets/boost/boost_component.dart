part of widgets;

class AW_BoostStatus extends StatelessWidget {
  const AW_BoostStatus({
    Key? key,
    required this.description,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.moreIcon,
    required this.onTap,
    this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1),
    this.activeColor = const Color.fromRGBO(23, 164, 160, 1),
    this.stoppedColor = const Color.fromRGBO(235, 87, 87, 1),
    this.titleStyle = const TextStyle(fontSize: 18, color: Color.fromRGBO(57, 70, 82, 1), fontWeight: FontWeight.w700),
    this.descriptionStyle = const TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(57, 70, 82, 1),
    ),
    this.iconColor = Colors.white,
  }) : super(key: key);

  final String title;
  final String description;
  final String icon;
  final IconData moreIcon;
  final bool isActive;
  final VoidCallback onTap;

  //colors
  final Color activeColor;
  final Color iconColor;
  final Color stoppedColor;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const <BoxShadow>[BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), offset: Offset(0, 8), blurRadius: 24, spreadRadius: 0)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: isActive ? activeColor : stoppedColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                child: Center(
                  child: SvgPicture.asset(icon, height: 50, color: iconColor),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: titleStyle),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(description, style: descriptionStyle),
                      const SizedBox(
                        height: 6,
                      ),
                      Align(alignment: Alignment.centerRight, child: Icon(moreIcon, color: isActive ? activeColor : stoppedColor))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// subject to change, day and icon depend on backend response
// use png instead of svg for icon asset, flutter unable to draw this type of svg
// pass explicitly icon string
class AW_BoostDetails extends StatelessWidget {
  const AW_BoostDetails(
      {Key? key,
      required this.dayLabel,
      required this.label,
      required this.isActive,
      required this.iconAsset,
      this.labelStyle = const TextStyle(color: Color.fromRGBO(57, 70, 82, 1), fontSize: 12),
      this.activeColor = const Color.fromRGBO(23, 164, 160, 1),
      this.stoppedColor = const Color.fromRGBO(235, 87, 87, 1),
      this.backgroundColor = Colors.white})
      : super(key: key);

  final String label;

  // subject to change, argument passing depends on the backend response
  final String dayLabel;
  final bool isActive;
  final String iconAsset;

  final TextStyle labelStyle;
  final Color activeColor;
  final Color stoppedColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10), boxShadow: const <BoxShadow>[
                BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), offset: Offset(0, 8), blurRadius: 24, spreadRadius: 0)
              ]),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(label, style: labelStyle),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    dayLabel,
                    style: TextStyle(fontSize: 10, color: isActive ? activeColor : stoppedColor),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10), boxShadow: const <BoxShadow>[
                  BoxShadow(color: Color.fromRGBO(35, 31, 32, 0.15), offset: Offset(0, 8), blurRadius: 24, spreadRadius: 0)
                ]),
                child: Center(
                    child: Image.asset(
                  iconAsset,
                  height: 37,
                  width: 37,
                ))),
          )
        ],
      ),
    );
  }
}
