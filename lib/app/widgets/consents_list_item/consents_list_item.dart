part of widgets;

class AW_ConsentsListItem extends StatelessWidget {
  const AW_ConsentsListItem(this.onToggle,
      {this.onTitleTap,
      this.consentTitle = '',
      this.isToggleSwitched,
      this.activeBgColor = const Color.fromRGBO(23, 72, 213, 1),
      this.declinedBgColor = Colors.red,
      this.widgetKey,
      this.style = const TextStyle(
        decoration: TextDecoration.underline,
      ),
      this.changeOnTap = true});

  final String consentTitle;
  final bool? isToggleSwitched;
  final Color activeBgColor;
  final Color declinedBgColor;
  final Function(int) onToggle;
  final Function? onTitleTap;
  final Key? widgetKey;
  final TextStyle style;
  final bool changeOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      width: double.infinity,
      height: 60.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              key: const Key('consent_list_item_tappable'),
              onTap: () => onTitleTap == null ? null : onTitleTap!(),
              child: Text(consentTitle, style: style),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ToggleSwitch(
            key: const Key('consent_list_item_toggle_switch'),
            totalSwitches: 2,
            initialLabelIndex: _returnIndexFromBool(isToggleSwitched),
            minWidth: 40.0,
            minHeight: 30.0,
            cornerRadius: 20.0,
            activeBgColor: <Color>[
              if (_returnIndexFromBool(isToggleSwitched) == 0)
                declinedBgColor
              else
                activeBgColor
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: const Color.fromRGBO(244, 244, 244, 1.0),
            inactiveFgColor: const Color.fromRGBO(136, 162, 187, 1.0),
            labels: const <String>['', ''],
            icons: const <IconData>[Icons.close, Icons.check],
            onToggle: (int? index) => onToggle(index!),
            changeOnTap: changeOnTap,
          ),
        ],
      ),
    );
  }

  int _returnIndexFromBool(bool? isToggleSwitched) {
    switch (isToggleSwitched) {
      case null:
        return -1;
      case true:
        return 1;
      default:
        return 0;
    }
  }
}
