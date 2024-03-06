part of widgets;

class AW_CustomBadge extends StatelessWidget {
  const AW_CustomBadge({
    this.animation = true,
    this.backgroundWidth = 1,
    this.circularRadius = 63,
    this.fontSize = 13,
    this.footerText,
    this.hasTitle = true,
    this.imageUrl = '',
    this.lineWidth = 3,
    this.lockedImage = '',
    this.percent = 0.0,
    this.progressColor,
    this.radiusImage = 23,
    this.widgetKey,
    this.isUnlocked = false,
    this.maxLines = 3,
    this.footerStyle,
    this.innerPadding = EdgeInsets.zero,
    this.titleSpacing = 5,
    this.width = 85,
    this.backgroundColor = const Color.fromRGBO(244, 242, 242, 1.0),
    this.sameRadiusOfImageAndProgress = false
  });

  final bool animation;
  final bool hasTitle;
  final bool isUnlocked;
  final double backgroundWidth;
  final double lineWidth;
  final double percent;
  final double radiusImage;
  final double circularRadius;
  final double fontSize;
  final Color? progressColor;
  final String? footerText;
  final String imageUrl;
  final String lockedImage;
  final Key? widgetKey;
  final int maxLines;
  final TextStyle? footerStyle;
  final EdgeInsets innerPadding;
  final double titleSpacing;
  final double? width;
  final Color backgroundColor;
  final bool sameRadiusOfImageAndProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: innerPadding,
      key: widgetKey!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              if (sameRadiusOfImageAndProgress)
              CachedNetworkImage(
                fit: BoxFit.contain,
                imageUrl: isUnlocked ? imageUrl : lockedImage,
                errorWidget: (BuildContext context, String s, dynamic error) {
                  return CircleAvatar(radius: radiusImage, backgroundColor: const Color.fromRGBO(244, 242, 242, 1));
                },
                imageBuilder: (BuildContext context, ImageProvider imageProvider) => _buildErrorImageState(imageProvider, radiusImage),
              ),
              Container(
                child: CircularPercentIndicator(
                  animation: animation,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  backgroundWidth: backgroundWidth,
                  center: sameRadiusOfImageAndProgress ? null : CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: isUnlocked ? imageUrl : lockedImage,
                    errorWidget: (BuildContext context, String s, dynamic error) {
                      return CircleAvatar(radius: radiusImage, backgroundColor: const Color.fromRGBO(244, 242, 242, 1));
                    },
                    imageBuilder: (BuildContext context, ImageProvider imageProvider) => _buildErrorImageState(imageProvider, radiusImage),
                  ),
                  radius: circularRadius,
                  percent: percent,
                  progressColor: progressColor!,
                  lineWidth: lineWidth,
                  backgroundColor: backgroundColor,
                ),
              ),
            ],
          ),
          SizedBox(height: titleSpacing),
          if (hasTitle)
            Expanded(
              child: Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Text(
                    footerText!,
                    style: footerStyle ?? Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: fontSize, fontWeight: FontWeight.w600),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget _buildErrorImageState(ImageProvider imageProvider, double radiusImage) => CircleAvatar(
      backgroundImage: imageProvider,
      radius: radiusImage,
      backgroundColor: Colors.transparent,
    );
