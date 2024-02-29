part of widgets;

class AW_FAQListItem extends StatefulWidget {
  const AW_FAQListItem({
    Key? key,
    required this.title,
    this.titleTextStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
    required this.arrowsAssetClosed,
    required this.arrowsAssetOpened,
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          offset: Offset(0, 8),
          blurRadius: 16,
          spreadRadius: 0
      )
    ],
    required this.description,
    this.descriptionTextStyle = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color.fromRGBO(70, 83, 93, 1)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16)
  }) : super(key: key);

  final String title;
  final TextStyle titleTextStyle;
  final List<BoxShadow> boxShadow;
  final SvgPicture arrowsAssetClosed;
  final SvgPicture arrowsAssetOpened;
  final String description;
  final TextStyle descriptionTextStyle;
  final EdgeInsets padding;

  @override
  State<AW_FAQListItem> createState() => _AW_FAQListItemState();
}

class _AW_FAQListItemState extends State<AW_FAQListItem> {

  bool opened = false;

  void onTap() {
    setState(() {
      opened = !opened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      padding: widget.padding,
      margin: const EdgeInsets.only(bottom: 16),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: widget.boxShadow
          ),
          child: ExpansionTile(
            onExpansionChanged: (bool value) => onTap(),
            trailing: IntrinsicWidth(
              child: Row(
                children: <Widget>[
                  if (opened) widget.arrowsAssetOpened else widget.arrowsAssetClosed
                ],
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.title,
                      style: widget.titleTextStyle
                    ),
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 30, bottom: 16),
                child: Text(
                  widget.description,
                  style: widget.descriptionTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
