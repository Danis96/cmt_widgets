part of widgets;

class AW_TrainingWidget extends StatelessWidget {
  const AW_TrainingWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.onInfoTap,
    this.progressWidget,
    this.infoIcon = Icons.info_outline,
    this.titleColor = const Color.fromRGBO(57, 70, 82, 1),
    this.descriptionColor = const Color.fromRGBO(70, 83, 93, 1),
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.iconColor = const Color.fromRGBO(57, 70, 82, 1),
    this.displayIcon = true,
  }) : super(key: key);

  final String title;
  final String description;
  final VoidCallback onInfoTap;
  final Widget? progressWidget;
  final IconData infoIcon;

  final Color titleColor;
  final Color descriptionColor;
  final Color backgroundColor;
  final Color iconColor;
  final EdgeInsets padding;
  final bool displayIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.red),
          color: backgroundColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(35, 31, 32, 0.2),
                blurRadius: 24,
                offset: Offset(0, 8))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              if (progressWidget != null) progressWidget!,
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: titleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (displayIcon)
                      IconButton(
                        alignment: Alignment.topCenter,
                        icon: Icon(
                          infoIcon,
                          size: 20,
                          color: iconColor,
                        ),
                        onPressed: onInfoTap,
                        splashRadius: 12,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      )
                    else
                      const SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: descriptionColor,
                    fontSize: 12,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
