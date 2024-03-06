part of widgets;

class AW_SettingsGroupItem extends StatelessWidget {
  const AW_SettingsGroupItem({
    Key? key,
    this.description = '',
    required this.title,
    this.trailingIcon = '',
    this.leadingIcon = '',
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.trailingIconColor = const Color.fromRGBO(15, 153, 221, 1),
    this.titleStyle = const TextStyle(
      color: Color.fromRGBO(57, 70, 82, 1),
      fontSize: 14,
      fontWeight: FontWeight.w600
    ),
    this.descStyle = const TextStyle(
      color: Color.fromRGBO(57, 70, 82, 0.3),
      fontSize: 11,
      fontWeight: FontWeight.w400
    ),
    this.leadingIconColor = const Color.fromRGBO(15, 153, 221, 1),
  }) : super(key: key);

  final String title;
  final String description;
  final String trailingIcon;
  final String leadingIcon;
  final VoidCallback onTap;

  final Color backgroundColor;
  final Color? trailingIconColor;
  final Color? leadingIconColor;

  final TextStyle titleStyle;
  final TextStyle descStyle;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: backgroundColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(35, 31, 32, 0.15),
              spreadRadius: 0,
              blurRadius: 24,
              offset: Offset(0, 8)
            )
          ]
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if(leadingIcon.isNotEmpty)
                  SvgPicture.asset(leadingIcon, color: leadingIconColor,),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: titleStyle,
                      ),
                      const SizedBox(height: 4,),
                      if(description.isNotEmpty)
                      Text(
                        description,
                        style: descStyle,
                      )
                    ],
                  ),
                ),
                if(trailingIcon.isNotEmpty)
                  SvgPicture.asset(trailingIcon, color: trailingIconColor)
              ],
            ),
          )
        ),
      ),
    );
  }
}
