
part of widgets;

class AW_GeofenceItem extends StatelessWidget {
  const AW_GeofenceItem({
    Key? key,
    this.borderColor = const Color.fromRGBO(97, 97, 97, 1),
    this.checkBoxBackgroundColor = const Color.fromRGBO(224, 224, 224, 1),
    required this.checkBoxPath,
    required this.checkBoxColor,
    required this.text,
    this.editButton,
    this.onCheckBoxTap,
    required this.checkBoxTapped
  }) : super(key: key);

  final Color borderColor;
  final Color checkBoxBackgroundColor;
  final String checkBoxPath;
  final Color checkBoxColor;
  final String text;
  final Widget? editButton;
  final VoidCallback? onCheckBoxTap;
  final bool checkBoxTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: onCheckBoxTap,
            child: Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: checkBoxBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                  )
              ),
              child: checkBoxTapped ? SizedBox(
                height: 15,
                width: 20,
                child: SvgPicture.asset(
                  checkBoxPath,
                  color: checkBoxColor,
                  height: 15,
                ),
              ): const SizedBox(height: 15, width: 20,),
            ),
          ),
          Container(
            height: 47,
            width: 1,
            color: borderColor,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child:FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    color: checkBoxColor
                  ),
                ),
              ),
            ),
          ),
          editButton?? const SizedBox()
        ],
      ),
    );
  }
}
