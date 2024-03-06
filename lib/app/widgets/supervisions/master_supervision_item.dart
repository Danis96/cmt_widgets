part of widgets;


class AW_MasterSupervisionItem extends StatelessWidget {
  const AW_MasterSupervisionItem({
    Key? key,
    this.borderColor = const Color.fromRGBO(97, 97, 97, 1),
    this.toggleBackgroundColor = const Color.fromRGBO(224, 224, 224, 1),
    this.deleteIconColor = const Color.fromRGBO(2, 23, 100, 1),
    required this.toggleColor,
    required this.onToggle,
    required this.supervisionAllowed,
    required this.toggleAsset,
    required this.email,
    required this.onDelete
  }) : super(key: key);

  final Color borderColor;
  final Color toggleBackgroundColor;
  final Color toggleColor;
  final Color deleteIconColor;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final bool supervisionAllowed;
  final String toggleAsset;
  final String email;

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
            onTap: onToggle,
            child: Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: toggleBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)
                  )
              ),
              child: supervisionAllowed ? SvgPicture.asset(
                toggleAsset,
                color: toggleColor,
                height: 15,
              ) : const SizedBox(height: 15, width: 22.5,),
            ),
          ),
          Container(
            height: 47,
            width: 1,
            color: borderColor
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child:FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(email,
                  style: TextStyle(
                      color: toggleColor
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: deleteIconColor),
            onPressed: onDelete,
            splashRadius: 20,
            splashColor: toggleColor,
          ),
        ],
      ),
    );
  }
}
