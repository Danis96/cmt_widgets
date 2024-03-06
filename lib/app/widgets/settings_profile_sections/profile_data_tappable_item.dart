part of widgets;

class AW_ProfileDataTappableItem extends StatelessWidget {
  const AW_ProfileDataTappableItem({
    Key? key,
    @required this.onTap,
    this.height = 80.0,
    this.firstName = ' ',
    this.lastName = ' ',
    this.email = '',
    this.avatarCircleColor = const Color.fromRGBO(47, 201, 218, 1),
    this.backgroundColor = Colors.white,
    this.avatarTextStyle = const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
    this.firstLastNameTextStyle = const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Color.fromRGBO(35, 44, 53,1)),
    this.emailTextStyle = const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Color.fromRGBO(114, 125, 134,1)),
    this.rightIcon,
    this.padding = const EdgeInsets.only(left: 24.0, right: 31.0),
  }) : super(key: key);

  final double height;
  final String firstName;
  final String lastName;
  final String email;
  final Color avatarCircleColor;
  final Color backgroundColor;
  final TextStyle avatarTextStyle;
  final TextStyle firstLastNameTextStyle;
  final TextStyle emailTextStyle;
  final Widget? rightIcon;
  final Function? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        height: height,
        width: double.infinity,
        color: backgroundColor,
        child: Padding(
          padding: padding,
          child: Row(
            children: <Widget>[
              Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: BoxDecoration(
                    color: avatarCircleColor,
                    shape: BoxShape.circle,
                  ),
            child: Center(child: Text(returnLetters(), style: avatarTextStyle,)),),
              const SizedBox(width: 16.0),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$firstName $lastName', style: firstLastNameTextStyle),
                  const SizedBox(height: 5.0),
                  Text(email, style: emailTextStyle),
                ],
              )),
              rightIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  String returnLetters(){
    return '${firstName.isEmpty ? '' : firstName[0]}${lastName.isEmpty ? '' : lastName[0]}';
  }
}
