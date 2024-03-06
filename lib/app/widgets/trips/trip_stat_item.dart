part of widgets;

class AW_TripStatItem extends StatefulWidget {
  const AW_TripStatItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.score,
    required this.description,
    required this.failureColor,
    required this.successColor,
    required this.arrowsAssetPathClosed,
    required this.arrowsAssetPathOpened,
    this.onLogEvent,
    this.progressBar,
    this.customScoring,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.customContent,
    this.boxShadow = const BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), offset: Offset(0, 8), blurRadius: 16, spreadRadius: 0),
    this.iconColor,
    this.iconSize = 22,
    this.border,
    this.titleColor,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final int score;
  final String description;
  final Color successColor;
  final Color failureColor;
  final SvgPicture arrowsAssetPathClosed;
  final SvgPicture arrowsAssetPathOpened;
  final AW_PercentageProgressBar? progressBar;
  final Function? onLogEvent;
  final Widget? customScoring;
  final EdgeInsets padding;
  final double iconSize;

  ///used to pass custom content and ignore standard design
  ///title widget is not impacted by it
  final Widget? customContent;
  final BoxShadow boxShadow;
  final Border? border;
  final Color? iconColor;
  final Color? titleColor;

  @override
  State<AW_TripStatItem> createState() => _AW_TripStatItemState();
}

class _AW_TripStatItemState extends State<AW_TripStatItem> {
  bool opened = false;

  void onTap() {
    if (widget.onLogEvent != null) {
      widget.onLogEvent!();
    }
    setState(() {
      opened = !opened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      padding: widget.padding,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: widget.border != null ? null : <BoxShadow>[widget.boxShadow],
            border: widget.border,
          ),
          child: ExpansionTile(
            onExpansionChanged: (bool value) => onTap(),
            trailing: Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Row(
                children: <Widget>[
                  if (widget.customScoring == null)
                    Expanded(
                      child: _StatItemsList(
                        key: const Key('stat_items_list_key'),
                        numberOfSuccess: widget.score,
                        successColor: widget.successColor,
                        failureColor: widget.failureColor,
                      ),
                    )
                  else
                    widget.customScoring!,
                  const SizedBox(
                    width: 10,
                  ),
                  if (opened) widget.arrowsAssetPathOpened else widget.arrowsAssetPathClosed
                ],
              ),
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  widget.iconPath,
                  width: widget.iconSize,
                  color: widget.iconColor,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 14, color: widget.titleColor ?? Colors.black, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            children: _buildContent(),
          ),
        ),
      ),
    );
  }

  //util function to help decide which content will be displayed
  //in expanded view
  List<Widget> _buildContent() {
    if (widget.customContent != null) {
      return <Widget>[widget.customContent!];
    }
    return <Widget>[
      widget.progressBar ?? const SizedBox(),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 30, bottom: 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(widget.description),
        ),
      )
    ];
  }
}

class _StatItemDot extends StatelessWidget {
  const _StatItemDot({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(right: 8),
      child: ClipOval(
        child: Container(
          height: 12,
          width: 12,
          color: color,
        ),
      ),
    );
  }
}

class _StatItemsList extends StatelessWidget {
  const _StatItemsList({Key? key, required this.numberOfSuccess, required this.successColor, required this.failureColor}) : super(key: key);

  final int numberOfSuccess;
  final Color successColor;
  final Color failureColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
        for (int i = 0; i < numberOfSuccess; i++) _StatItemDot(color: successColor),
        for (int i = 0; i < (5 - numberOfSuccess); i++) _StatItemDot(color: failureColor)
      ]),
    );
  }
}
