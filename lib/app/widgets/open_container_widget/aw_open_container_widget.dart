part of widgets;

class OpenContainerModel {
  OpenContainerModel({this.closedText, this.openText, this.title, this.isOpened = false});

  final String? title;
  final String? openText;
  final String? closedText;
  final bool isOpened;
}

class AW_OpenContainer extends StatefulWidget {
  AW_OpenContainer({this.title = '', this.closedText = '', this.openText = '', this.isOpened = false});

  final String title;
  final String closedText;
  final String openText;
  bool isOpened;

  @override
  State<AW_OpenContainer> createState() => _AW_OpenContainerState();
}

class _AW_OpenContainerState extends State<AW_OpenContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () => setState(() {
          widget.isOpened = !widget.isOpened;
        }),
        child: Card(
          child: Container(
            height: widget.isOpened ? 200 : 100,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black, fontSize: 16),
                  ),
                  SvgPicture.asset(
                    Assets.assetsIcStatItemArrowsOpened,
                    width: 20,
                  ),
                ]),
                const SizedBox(height: 12),
                if (widget.isOpened)
                  Expanded(child: Text(widget.openText, maxLines: 7, overflow: TextOverflow.ellipsis))
                else
                  Text(widget.closedText, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
