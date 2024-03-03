part of widgets;

class BottomNavigationItemEventTrackers {
  BottomNavigationItemEventTrackers(
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
  );

  final VoidCallback first;
  final VoidCallback second;
  final VoidCallback third;
  final VoidCallback fourth;
  final VoidCallback fifth;
}

class AW_BottomNavigationItem {
  AW_BottomNavigationItem({
    this.page,
    this.icon,
    this.title,
    this.unreadMessagesCount = 0,
  });

  final String? title;
  final Widget? page;
  final String? icon;
  final int unreadMessagesCount;
// final int unreadMessagesCount;
}

class AW_BottomNavigationPage extends StatefulWidget {
  const AW_BottomNavigationPage({
    this.selectedItemColor,
    this.unSelectedItemColor = const Color.fromRGBO(227, 233, 239, 1),
    this.items,
    this.widgetKey,
    this.showTitle = false,
    this.logEvent,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBarType = BottomNavigationBarType.fixed,
    this.showTitleFromSide = false,
    this.initialSelection = 0,
    this.showUnselectedLabel = true,
    this.innerPadding = 0.0,
    this.elevation = 8,
    this.onPop,
    this.barVisible = true,
    this.eventTrackers,
  });

  final Color? selectedItemColor;
  final Color? unSelectedItemColor;
  final Color? backgroundColor;
  final List<AW_BottomNavigationItem>? items;
  final Key? widgetKey;
  final bool showTitle;
  final bool showTitleFromSide;
  final Function? logEvent;
  final BottomNavigationBarType bottomNavigationBarType;
  final int initialSelection;
  final bool showUnselectedLabel;

  ///pushes items to the inside
  final double innerPadding;
  final double elevation;

  ///flag is bottom navigation bar should be visible
  ///necessary for trip details custom flow implementation
  final bool barVisible;

  ///necessary for trip crash solution
  ///scaffold from TripDetails can't recognize
  ///WillPopScope because of BottomNavigationBar's one
  final Future<bool> Function()? onPop;
  final BottomNavigationItemEventTrackers? eventTrackers;

  @override
  _AW_BottomNavigationPageState createState() => _AW_BottomNavigationPageState();
}

class _AW_BottomNavigationPageState extends State<AW_BottomNavigationPage> {
  late int _selectedIndex = widget.initialSelection;

  void _trackEvents(int index) {
    final BottomNavigationItemEventTrackers? eventTrackers = widget.eventTrackers;

    if (eventTrackers != null) {
      const int first = 0;
      const int second = 1;
      const int third = 2;
      const int fourth = 3;
      const int fifth = 4;

      switch (index) {
        case first:
          eventTrackers.first();
          break;

        case second:
          eventTrackers.second();
          break;

        case third:
          eventTrackers.third();
          break;

        case fourth:
          eventTrackers.fourth();
          break;

        case fifth:
          eventTrackers.fifth();
          break;

        default:
          break;
      }
    }
  }

  void _onItemTapped(int index) {
    if (widget.logEvent != null) {
      widget.logEvent!();
    }

    _trackEvents(index);

    setState(() {
      _selectedIndex = index;
    });
  }

  bool isIconNotEmpty(String? icon) => icon != null && icon.isNotEmpty;

  List<BottomNavigationBarItem>? _getBottomNavigationBarItems() {
    final List<BottomNavigationBarItem>? _items = <BottomNavigationBarItem>[];
    for (int i = 0; i < widget.items!.length; i++) {
      final BottomNavigationBarItem _bottomItem = BottomNavigationBarItem(
          label: widget.showTitle ? widget.items![i].title : '',
          icon: isIconNotEmpty(widget.items![i].icon!)
              ? widget.items![i].unreadMessagesCount > 0
                  ? Stack(
                      children: <Widget>[
                        SvgPicture.asset(widget.items![i].icon!,
                            color: _selectedIndex != i ? widget.unSelectedItemColor : widget.selectedItemColor),
                        unreadMessageCount(widget.items![i].unreadMessagesCount)
                      ],
                    )
                  : SvgPicture.asset(
                      widget.items![i].icon!,
                      color: _selectedIndex != i ? widget.unSelectedItemColor : widget.selectedItemColor,
                    )
              : const SizedBox());
      _items!.add(_bottomItem);
    }
    return _items;
  }

  List<BottomNavigationBarItem>? _getBottomNavigationBarItemsRow() {
    List<BottomNavigationBarItem>? _items = <BottomNavigationBarItem>[];
    for (int i = 0; i < widget.items!.length; i++) {
      final BottomNavigationBarItem _bottomItem = BottomNavigationBarItem(
          label: widget.showTitle ? widget.items![i].title : '',
          icon: isIconNotEmpty(widget.items![i].icon!)
              ? widget.items![i].unreadMessagesCount > 0
                  ? Stack(
                      children: <Widget>[
                        SvgPicture.asset(widget.items![i].icon!,
                            color: _selectedIndex != i ? widget.unSelectedItemColor : widget.selectedItemColor),
                        unreadMessageCount(widget.items![i].unreadMessagesCount)
                      ],
                    )
                  : Container(
                      decoration: _selectedIndex != i
                          ? null
                          : BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(19),
                            ),
                      width: MediaQuery.of(context).size.width / 3.5,
                      padding: const EdgeInsets.all(5),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        SvgPicture.asset(widget.items![i].icon!,
                            color: _selectedIndex != i ? widget.unSelectedItemColor : widget.selectedItemColor),
                        if (_selectedIndex != i)
                          const SizedBox()
                        else
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(widget.items![i].title!,
                                style: TextStyle(
                                    color:
                                        _selectedIndex != i ? widget.unSelectedItemColor : widget.selectedItemColor)),
                          ),
                      ]))
              : const SizedBox());
      _items.add(_bottomItem);
    }
    return _items;
  }

  Widget unreadMessageCount(int unreadMessageCount) {
    return Container(
      height: 14,
      width: 14,
      padding: const EdgeInsets.all(1.5),
      decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '$unreadMessageCount',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white, fontSize: 10.5),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        // onWillPop: () async {
        //   if (widget.onPop != null) {
        //     return widget.onPop!();
        //   }
        //   return Future<bool>.value(false);
        // },
        // child:
        Scaffold(
      body: widget.items![_selectedIndex].page,
      bottomNavigationBar: Container(
          color: widget.backgroundColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: widget.innerPadding),
            child: widget.barVisible
                ? BottomNavigationBar(
                    backgroundColor: widget.backgroundColor,
                    key: widget.widgetKey!,
                    items:
                        widget.showTitleFromSide ? _getBottomNavigationBarItemsRow()! : _getBottomNavigationBarItems()!,
                    currentIndex: _selectedIndex,
                    showUnselectedLabels: widget.showUnselectedLabel,
                    elevation: widget.elevation,
                    type: widget.bottomNavigationBarType,
                    selectedItemColor: widget.selectedItemColor,
                    unselectedItemColor: widget.unSelectedItemColor,
                    onTap: _onItemTapped,
                  )
                : const SizedBox(),
            // ),
          )),
    );
  }
}
