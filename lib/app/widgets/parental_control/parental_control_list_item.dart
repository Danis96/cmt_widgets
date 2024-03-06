
part of widgets;


class AW_ParentalControlItem extends StatelessWidget {
  const AW_ParentalControlItem({
    Key? key,
    required this.dialogContent,
    required this.description,
    required this.title,
    this.titleColor = const Color.fromRGBO(97, 97, 97, 1),
    this.infoButtonColor = const Color.fromRGBO(158, 158, 158, 1),
    this.descriptionColor = const Color.fromRGBO(52, 55, 65, 1),
    required this.buttonTitle,
    this.dialogContentColor = Colors.black,
    required this.dialogTitle
  }) : super(key: key);

  final String title;
  final String description;
  final String dialogContent;
  final Color titleColor;
  final Color infoButtonColor;
  final Color descriptionColor;
  final Color dialogContentColor;
  final String buttonTitle;
  final String dialogTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
                splashRadius: 20,
                icon: Icon(
                  Icons.info_outline,
                  size: 20,
                  color: infoButtonColor,
                ),
                onPressed: () => AW_SimpleDialog(context,
                    title: title,
                    content: dialogContent,
                    buttonText: buttonTitle,
                )
            ),
          ],
        ),
        const SizedBox(height: 12,),
        Text(
          description,
          style: TextStyle(
              color: descriptionColor,
              fontSize: 16
          ),
        )
      ],
    );
  }
}

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key? key,
    required this.content,
    this.contentColor = Colors.black,
    required this.buttonTitle
  }) : super(key: key);

  final String content;
  final Color contentColor;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          content,
          style: TextStyle(
              fontSize: 14,
              color: contentColor
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15,),
        AW_Button(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(100, 40),
              maximumSize: const Size(100, 40),
              minimumSize: const Size(100, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          ),
          onPressed: () => Navigator.of(context).pop(),
          buttonTitle: buttonTitle
        )
      ],
    );
  }
}

void buildDialog(BuildContext context, Widget content, String title) {
  /*showDialog<Container>(
      context: context,
      builder: (_) => Container(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          content: content,
        ),
      )
  );*/
}
