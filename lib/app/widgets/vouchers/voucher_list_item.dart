part of widgets;

class AW_VoucherListItem extends StatelessWidget {
  const AW_VoucherListItem({
    Key? key,
    this.title = '',
    this.imageUrl = '',
    this.onTap,
    this.titleTextStyle = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(33, 33, 33, 1)),
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final Function? onTap;
  final TextStyle titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap == null ? null : () => onTap!(),
      child: Card(
        elevation: 6.2,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: titleTextStyle,
                ))),
          ],
        ),
      ),
    );
  }
}
