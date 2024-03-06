part of widgets;



class AW_NewsTrainingItem extends StatelessWidget {
  const AW_NewsTrainingItem({
    Key? key,
    required this.asset,
    required this.title,
    required this.onTap,
    this.titleColor = const Color(0xFF394652),
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.only(bottom: 20, left: 10)
  }) : super(key: key);

  final String title;
  final SvgPicture asset;
  final VoidCallback onTap;

  final Color titleColor;
  final Color backgroundColor;

  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(35, 31, 32, 0.15),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0
              )
            ],
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  color: titleColor
                ),
              ),
              const SizedBox(height: 8,),
              asset
            ],
          )
      ),
    );
  }
}

