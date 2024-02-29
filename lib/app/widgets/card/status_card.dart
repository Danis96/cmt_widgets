part of widgets;

class AW_StatusCard extends StatelessWidget {
  const AW_StatusCard({
    Key? key,
    this.backgroundColor = Colors.white,
    this.bodyColor = Colors.white,
    this.titleColor = Colors.white,
    this.iconColor = const Color.fromRGBO(23, 164, 160, 1),
    this.icon,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
  }) : super(key: key);

  final Color backgroundColor;
  final Color titleColor;
  final Color bodyColor;
  final Color iconColor;
  final IconData? icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: titleColor
            )
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: bodyColor
                  ),
                ),
              ),
              const SizedBox(width: 4,),
              Icon(
                icon,
                size: 17,
                color: iconColor
              ),
          ])
      ]),
    );
  }
}
