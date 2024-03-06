

part of widgets;

class AW_PrivilegesItem extends StatelessWidget {
  const AW_PrivilegesItem({
    Key? key,
    this.title = '',
    this.deepLink = '',
    this.headerImage = '',
    this.leadText = '',
    this.link = '',
    this.titleTextStyle = const TextStyle(fontSize: 14, color: Color.fromRGBO(33, 33, 33, 1)),
    this.imageBorder = const BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8)
    ),
    required this.onTap
  }) : super(key: key);

  final String headerImage;
  final String deepLink;
  final String title;
  final String leadText;
  final String link;
  final TextStyle titleTextStyle;
  final BorderRadius imageBorder;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            Container(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: imageBorder,
                child: Image.network(headerImage,
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 20,),
            Flexible(
              child: Text(
                title,
                style: titleTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
