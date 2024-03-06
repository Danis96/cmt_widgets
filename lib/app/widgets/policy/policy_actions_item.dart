
part of widgets;

@immutable
class AW_PolicyActionsItem extends StatelessWidget {
  const AW_PolicyActionsItem({
    Key? key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.titleColor = const Color.fromRGBO(57, 70, 82, 1)
  }) : super(key: key);

  final String title;
  final Color titleColor;
  final VoidCallback onTap;
  final SvgPicture icon;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(35, 31, 32, 0.15),
                offset: Offset(0,8),
                blurRadius: 24,
                spreadRadius: 0
            )
          ]
      ),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: backgroundColor,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 24, 16),
            child: Row(
              children: <Widget>[
                icon,
                const SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}