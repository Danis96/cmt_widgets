part of widgets;

class AW_InboxReplyItem extends StatelessWidget {
  const AW_InboxReplyItem(
      {this.sentAt = 0.0,
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
      Key? key,
      this.useCached = true})
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
  final bool useCached;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: returnDateOrEmpty(dateTime)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _returnIconCircle(),
              const SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85 - 74),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _returnTextContentReply(),
                      if (htmlContent.isNotEmpty) _returnHtmlContentReply(),
                      if ((actionParameter.isNotEmpty) || (actionButtonLabel.isNotEmpty) || (actionType.isNotEmpty)) _returnActionReply(),
                      if (imageUrl.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _returnImageReply(),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget returnDateOrEmpty(String dateTime) {
    return dateTime.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 32.0, top: 24),
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 246, 247, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Text(
                  dateTime,
                  style: dateTimeTextStyle,
                ),
              ),
            ),
          )
        : const SizedBox(
            height: 24,
          );
  }

  Widget messageUrlAction({
    required Function(int) onPressed,
    required String textMsg,
    required String linkMsg,
  }) {
    return AW_TappableText(
      text: textMsg,
      links: linkMsg,
      onPressed: onPressed,
      defaultStyle: tappableTextStyle,
      linkStyle: tappableLinkTextStyle,
      textAlign: TextAlign.start,
    );
  }

  Widget _returnImageReply() {
    if (!useCached) {
      return Image.network(
          imageUrl.isNotEmpty ? imageUrl : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png');
    }
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
            child: Container(
              color: Colors.grey[300],
            ),
          ),
        ),
      ),
    );
  }

  Widget _returnActionReply() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 15),
          child: messageUrlAction(
            onPressed: linkAction == null ? (int i) {} : (int i) => linkAction!(i),
            textMsg: actionButtonLabel,
            linkMsg: (actionType == 'screen') ? actionButtonLabel : actionParameter,
          ),
        ),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(227, 233, 239, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _returnHtmlContentReply() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        child: html.HtmlWidget(htmlContent),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(227, 233, 239, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _returnTextContentReply() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 15),
        child: Text(
          textContent,
          style: textContentTextStyle,
        ),
      ),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(227, 233, 239, 1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _returnIconCircle() {
    return useCached
        ? CachedNetworkImage(
            imageUrl:
                iconUrl.isNotEmpty ? iconUrl : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
            imageBuilder: (BuildContext context, ImageProvider imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
              radius: 18,
            ),
            placeholder: (BuildContext context, _) => const CircleAvatar(
              backgroundColor: Color.fromRGBO(227, 233, 239, 1),
              radius: 18,
            ),
          )
        : CircleAvatar(
            radius: 18,
            backgroundColor: const Color.fromRGBO(227, 233, 239, 1),
            child: Image.network(
              iconUrl.isNotEmpty ? iconUrl : 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const CircleAvatar(
                  backgroundColor: Color.fromRGBO(227, 233, 239, 1),
                  radius: 18,
                );
              },
            ),
          );
  }
}
