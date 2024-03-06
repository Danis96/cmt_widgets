
part of widgets;

@immutable
class AW_PolicyDetailItem extends StatelessWidget {
  const AW_PolicyDetailItem({
    Key? key,
    required this.icon,
    required this.topText,
    required this.bottomText,
    this.bottomTextColor = const Color.fromRGBO(100, 113, 126, 1),
    this.topTextColor = const Color.fromRGBO(100, 113, 126, 1),
    this.trailingWidget
  }) : super(key: key);

  final SvgPicture icon;
  final String topText;
  final String bottomText;

  final Color topTextColor;
  final Color bottomTextColor;
  final Widget? trailingWidget;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        icon,
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                topText,
                style: TextStyle(
                    color: topTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                bottomText,
                style: TextStyle(
                    color: bottomTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300
                ),
              )
            ],
          ),
        ),
        if(trailingWidget != null) trailingWidget!
      ],
    );
  }
}