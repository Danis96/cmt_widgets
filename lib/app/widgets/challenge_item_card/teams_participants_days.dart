part of widgets;

class TeamsParticipantsDays extends StatelessWidget {
  const TeamsParticipantsDays({
    Key? key,
    required this.subtitle1,
    required this.title1,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.subtitle2,
    required this.subtitle3,
    required this.title2,
    required this.title3,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.height = 70,
    this.alignment = CrossAxisAlignment.center,
    this.color1 = const Color.fromRGBO(189, 189, 189, 1),
    this.color2 = const Color.fromRGBO(189, 189, 189, 1),
    this.color3 = const Color.fromRGBO(189, 189, 189, 1),
    this.subtitleStyle,
    this.hide1 = false,
    this.hide2 = false,
    this.hide3 = false,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween
  }) : super(key: key);

  final String image1;
  final String image2;
  final String image3;
  final String title1;
  final String title2;
  final String title3;
  final String subtitle1;
  final String subtitle2;
  final String subtitle3;
  final Color color1;
  final Color color2;
  final Color color3;
  final EdgeInsets padding;
  final double height;
  final CrossAxisAlignment alignment;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? subtitleStyle;
  final bool hide1;
  final bool hide2;
  final bool hide3;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: height,
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: alignment,
        children: <Widget>[
          if (!hide1)
          _RowItem(
            key: const Key('teams_key'),
            title: title1,
            image: image1,
            subtitle: subtitle1,
            color: color1,
            subtitleStyle: subtitleStyle,
           ),
          if (hide2)
            const SizedBox()
          else
            _RowItem(
              key: const Key('participants_key'),
              title: title2,
              image: image2,
              subtitle: subtitle2,
              color: color2,
              subtitleStyle: subtitleStyle,
            ),
          if (hide3)
            const SizedBox()
          else
            _RowItem(
              key: const Key('days_left_key'),
              title: title3,
              image: image3,
              subtitle: subtitle3,
              color: color3,
              subtitleStyle: subtitleStyle,
            ),
        ],
      ),
    );
  }
}

class _RowItem extends StatelessWidget {
  const _RowItem({Key? key, required this.title, required this.image, required this.subtitle, required this.color, this.subtitleStyle})
      : super(key: key);

  final String image;
  final String title;
  final String subtitle;
  final Color color;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 20, child: SvgPicture.asset(image, color: color)),
          const SizedBox(width: 4),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(subtitle, style: subtitleStyle ?? Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black, fontSize: 14))
              ],
            ),
          )
        ],
      ),
    );
  }
}
