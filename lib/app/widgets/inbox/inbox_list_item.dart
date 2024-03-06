part of widgets;

class AW_InboxListItem extends StatelessWidget {
  const AW_InboxListItem({
    Key? key,
    this.title = '',
    this.imageUrl = '',
    this.dateTime = '',
    this.textContent = '',
    this.readAt = 0.0,
    this.sentAt = 0.0,
    this.titleTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(28, 37, 53, 1)),
    this.textContentTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(127, 144, 159, 1)),
    this.dateTimeTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700, color: Color.fromRGBO(127, 144, 159, 1)),
    this.titleUnreadFontWeight = FontWeight.w700,
    this.titleReadFontWeight = FontWeight.w500,
    this.textReadFontWeight = FontWeight.w400,
    this.textUnreadFontWeight = FontWeight.w600,
    this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.useCached = true,
    this.imgFit = BoxFit.fill,
    this.imgNotCachedHeight = 40,
    this.titleReadColor = const Color.fromRGBO(33, 33, 33, 1),
    this.titleUnReadColor = const Color.fromRGBO(33, 33, 33, 1),
    this.dateReadColor = const Color.fromRGBO(33, 33, 33, 1),
    this.dateUnReadColor = const Color.fromRGBO(33, 33, 33, 1),
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final double readAt;
  final String textContent;
  final double sentAt;
  final TextStyle titleTextStyle;
  final TextStyle textContentTextStyle;
  final TextStyle dateTimeTextStyle;
  final String dateTime;
  final FontWeight titleUnreadFontWeight;
  final FontWeight titleReadFontWeight;
  final FontWeight textReadFontWeight;
  final FontWeight textUnreadFontWeight;
  final Function? onTap;
  final CrossAxisAlignment crossAxisAlignment;
  final bool useCached;
  final BoxFit imgFit;
  final double imgNotCachedHeight;
  final Color titleReadColor;
  final Color titleUnReadColor;
  final Color dateReadColor;
  final Color dateUnReadColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () => onTap!(),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 12.0, left: 20.0, right: 24.0),
        child: Row(
          crossAxisAlignment: crossAxisAlignment,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: useCached
                    ? CachedNetworkImage(
                        imageUrl: imageUrl.isNotEmpty
                            ? imageUrl
                            : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                        fit: imgFit,
                        imageBuilder: (BuildContext context, ImageProvider imageProvider) => CircleAvatar(
                          backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
                          backgroundImage: imageProvider,
                          radius: 26,
                        ),
                        placeholder: (BuildContext context, _) => const CircleAvatar(
                          backgroundColor: Color.fromRGBO(227, 233, 239, 1),
                          radius: 26,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
                        radius: 26,
                        child: Image.network(
                          imageUrl.isNotEmpty ? imageUrl : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                          fit: imgFit,
                          height: imgNotCachedHeight,
                        ),
                      )),
            const SizedBox(width: 18),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: titleTextStyle.copyWith(
                        fontWeight: (readAt != 0.0) ? titleReadFontWeight : titleUnreadFontWeight,
                        color: (readAt != 0.0) ? titleReadColor : titleUnReadColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      textContent,
                      style: textContentTextStyle.copyWith(
                        fontWeight: (readAt != 0.0) ? textReadFontWeight : textUnreadFontWeight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              dateTime,
              style: dateTimeTextStyle.copyWith(fontWeight: (readAt != 0.0) ? textReadFontWeight : textUnreadFontWeight, color: (readAt != 0.0) ? dateReadColor : dateUnReadColor),
            ),
          ],
        ),
      ),
    );
  }
}
