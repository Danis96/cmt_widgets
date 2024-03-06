part of widgets;

class AW_CheckboxText extends StatefulWidget {
  AW_CheckboxText({
    Key? key,
    @required this.text,
    @required this.disabled,
    @required this.newValue,
    @required this.onChange,
    this.checkBoxIconColor = Colors.blue,
    this.inActiveCheckBoxBgColor = Colors.white,
    this.activeCheckBoxBgColor,
    this.textColor = Colors.black,
    this.shouldUseRichTest = false,
    this.otherText = '',
    this.richText = ''
  }) : super(key: key);

  final String? text;
  final Color? textColor;
  bool? newValue;
  final bool? disabled;
  Function(bool)? onChange;
  final Color? inActiveCheckBoxBgColor;
  final Color? activeCheckBoxBgColor;
  final Color? checkBoxIconColor;
  final bool? shouldUseRichTest;
  final String? richText;
  final String? otherText;

  @override
  _AW_CheckboxTextState createState() => _AW_CheckboxTextState();
}

class _AW_CheckboxTextState extends State<AW_CheckboxText> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                onTap: widget.disabled!
                    ? null
                    : () {
                  setState(() {
                    widget.newValue = !widget.newValue!;
                    widget.onChange!(widget.newValue!);
                  });
                },
                child: widget.newValue!
                    ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SizedBox(
                      height: 24, width: 24, child: _activeCheckbox()),
                )
                    : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SizedBox(
                      height: 24, width: 24, child: _notActiveCheckbox()),
                )),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: GestureDetector(
                    onTap: widget.disabled!
                        ? null
                        : () {
                      setState(() {
                        widget.newValue = !widget.newValue!;
                        widget.onChange!(widget.newValue!);
                      });
                    },
                    child: Container(
                      child: widget.shouldUseRichTest! ? richText() : Text(widget.text!,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                )),
          ],
        ),
      )
    );
  }

  Widget richText() {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge,
        children: <TextSpan>[
          TextSpan(text: widget.richText, style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: widget.otherText, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _notActiveCheckbox() {
    return Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: widget.inActiveCheckBoxBgColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color.fromRGBO(197, 205, 211, 1))));
  }

  Widget _activeCheckbox() {
    return Container(
        child: Icon(
          Icons.check,
          color: widget.checkBoxIconColor,
          size: 16,
        ),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            color: widget.activeCheckBoxBgColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color.fromRGBO(197, 205, 211, 1))));
  }
}
