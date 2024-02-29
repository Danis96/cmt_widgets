part of widgets;

class AW_InboxReplyItemNew extends StatelessWidget {
  const AW_InboxReplyItemNew(
      {Key? key,
      this.sentAt = 0.0,
      this.iconUrl = '',
      this.imageUrl = '',
      this.dateTime = '',
      this.textContent = '',
      this.actionButtonLabel = '',
      this.actionParameter = '',
      this.actionType = '',
      this.htmlContent = '',
      this.htmlContentColor = const Color.fromRGBO(0, 164, 228, 1),
      this.linkAction,
      this.dateTimeTextStyle = const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color.fromRGBO(127, 144, 159, 1)),
      this.tappableTextStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 37, 53, 1)),
      this.tappableLinkTextStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromRGBO(0, 164, 228, 1)),
      this.textContentTextStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color.fromRGBO(28, 37, 53, 1)),
      this.padding = const EdgeInsets.symmetric(horizontal: 24)})
      : super(key: key);

  final double sentAt;
  final String iconUrl;
  final String textContent;
  final String htmlContent;
  final String actionParameter;
  final String actionButtonLabel;
  final String actionType;
  final String imageUrl;
  final String dateTime;
  final Color htmlContentColor;
  final Function(int)? linkAction;
  final TextStyle dateTimeTextStyle;
  final TextStyle tappableTextStyle;
  final TextStyle tappableLinkTextStyle;
  final TextStyle textContentTextStyle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(child: returnDateOrEmpty(dateTime)),
          _returnTextContentReply(),
          if (imageUrl.isNotEmpty) _returnImageReply(),
          if ((actionParameter.isNotEmpty) || (actionButtonLabel.isNotEmpty) || (actionType.isNotEmpty)) _returnActionReply(),
        ],
      ),
    );
  }

  Widget returnDateOrEmpty(String dateTime) {
    return dateTime.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 24),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 246, 247, 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Text(dateTime, style: dateTimeTextStyle),
              ),
            ),
          )
        : const SizedBox(height: 24);
  }

  Widget _returnImageReply() {
    return CachedNetworkImage(
      imageUrl: imageUrl.isNotEmpty ? imageUrl : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
      imageBuilder: (BuildContext context, ImageProvider imageProvider) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image(image: imageProvider),
          ),
        ),
      ),
      placeholder: (BuildContext context, _) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          width: double.infinity,
          color: Colors.grey[300],
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Container(color: Colors.grey[300]),
          ),
        ),
      ),
    );
  }

  Widget _returnTextContentReply() {
    return Center(child: Text(textContent, style: textContentTextStyle, textAlign: TextAlign.center));
  }

  Widget _returnActionReply() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: messageUrlAction(
          onPressed: linkAction == null ? (int i) {} : (int i) => linkAction!(i),
          textMsg: actionButtonLabel,
          linkMsg: (actionType == 'screen') ? actionButtonLabel : actionParameter,
        ),
      ),
    );
  }

  Widget messageUrlAction({
    required Function(int) onPressed,
    required String textMsg,
    required String linkMsg,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: AW_TappableText(
        text: textMsg,
        links: linkMsg,
        onPressed: (int i) => onPressed(i),
        defaultStyle: tappableTextStyle,
        linkStyle: tappableLinkTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }
}
