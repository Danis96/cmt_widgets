part of widgets;

class AW_DrawerListItem extends StatelessWidget {
  const AW_DrawerListItem({
    this.tapKey,
    this.title,
    this.image,
    this.routeName,
    this.widgetKey,
    this.imageColor = Colors.white,
    this.titleColor = Colors.white,
    this.arguments,
    this.height = 20,
    this.boxFit = BoxFit.contain,
    this.textStyle,
    this.margin = const EdgeInsets.only(bottom: 30, left: 15),
    this.isLink = false,
    this.onTap
  });

  final String? title;
  final String? image;
  final String? routeName;
  final Key? widgetKey;
  final Color? titleColor;
  final Color? imageColor;
  final dynamic arguments;
  final Key? tapKey;
  final double height;
  final BoxFit boxFit;
  final TextStyle? textStyle;
  final EdgeInsets margin;
  final bool? isLink;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      margin: margin,
      child: Row(
        children: <Widget>[
          Container(
              width: 25,
              child: image!.isNotEmpty ? SvgPicture.asset(image!, color: imageColor!, cacheColorFilter: true, fit: boxFit, height: height) : const SizedBox()),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: 220,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 15),
                child: Text(title!, style: textStyle != null ? textStyle! : Theme.of(context).textTheme.titleLarge!.copyWith(color: titleColor)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
