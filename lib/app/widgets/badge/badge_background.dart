part of widgets;

class AW_BadgeBackground extends StatelessWidget {
  const AW_BadgeBackground({
    Key? key,
    this.animation = true,
    this.fontSize = 13,
    this.footerText,
    this.hasTitle = true,
    this.imageUrl = '',
    this.lineWidth = 3,
    this.lockedImage = '',
    this.percent = 0.0,
    required this.progressColor,
    this.radiusImage = 23,

    this.isUnlocked = false,
    this.maxLines = 3,
    this.footerStyle,
    this.innerPadding = EdgeInsets.zero,
    this.titleSpacing = 5,
    this.width = 85,
    this.lockedBackgroundColor = const Color.fromRGBO(244, 242, 242, 1.0),
    required this.unlockedBackgroundColor,
    this.spaceAround = false,
    this.badgeOnly = false,
  }): super(key: key);



  final bool animation;
  final bool hasTitle;
  final bool isUnlocked;

  final double lineWidth;
  final double percent;
  final double radiusImage;
  final double fontSize;
  final Color progressColor;
  final String? footerText;
  final String imageUrl;
  final String lockedImage;

  final int maxLines;
  final TextStyle? footerStyle;
  final EdgeInsets innerPadding;
  final double titleSpacing;
  final double? width;
  final Color lockedBackgroundColor;
  final Color unlockedBackgroundColor;
  final bool spaceAround;
  final bool badgeOnly;

  @override
  Widget build(BuildContext context) {
    return !badgeOnly ? Container(
      padding: innerPadding,
      key: key,
      child: Column(
        mainAxisAlignment: spaceAround ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildBadgeImageProgress(),

          if(!spaceAround)
            SizedBox(height: titleSpacing),

          if (hasTitle && !spaceAround)
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
            )
          else if (hasTitle && spaceAround)
            Container(
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
        ],
      ),
    ) : _buildBadgeImageProgress();
  }

  Widget _buildBadgeImageProgress() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: radiusImage,
          height: radiusImage,
          child: CircularProgressIndicator(
            value: percent,
            strokeWidth: lineWidth,
            color: progressColor,
          ),
        ),
        CircleAvatar(
          radius: radiusImage / 2,
          backgroundColor: isUnlocked ? unlockedBackgroundColor : lockedBackgroundColor,
          backgroundImage: CachedNetworkImageProvider(isUnlocked ? imageUrl : lockedImage),
        )
      ],
    );
  }
}