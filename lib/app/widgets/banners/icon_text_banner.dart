part of widgets;

class AW_IconTextBanner extends StatelessWidget {
  const AW_IconTextBanner({
    this.widgetKey,
    this.title = '',
    this.icon = Icons.error,
    this.backgroundColor = const Color.fromRGBO(158, 158, 158, 0.15),
    this.textColor = const Color.fromRGBO(158, 158, 158, 1),
    this.iconColor = const Color.fromRGBO(158, 158, 158, 1),
    this.textStyle,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final TextStyle? textStyle;
  final Key? widgetKey;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: widgetKey,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        color: backgroundColor,
        child: Row(
          children: <Widget>[
            Icon(icon, color: iconColor),
            const SizedBox(width: 18.0),
            Expanded(
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        title,
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
