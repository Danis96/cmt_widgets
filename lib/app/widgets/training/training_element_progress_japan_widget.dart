part of widgets;

class AW_ProgressJapanWidget extends StatelessWidget {
  const AW_ProgressJapanWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.progressColor,
    this.isAvailable = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.margin = const EdgeInsets.only(bottom: 20, left: 10)
  }) : super(key: key);

  final String title;
  final String description;
  final Color progressColor;
  final bool isAvailable;

  final EdgeInsets margin;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10
              )
            ),
            const SizedBox(height: 8,),
            Container(
              height: 6,
              width: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: progressColor
              ),
            ),
          ],
        )
    );
  }
}