part of widgets;

class AW_RiskCardItem extends StatelessWidget {
  const AW_RiskCardItem({
    Key? key,
    required this.description,
    required this.title,
    required this.discount,
    this.backgroundColor = const Color.fromRGBO(23, 164, 160, 1),
    this.textColor = Colors.white,
    this.discountBackgroundColor = Colors.white,
    this.onTap,
    this.descriptionHeight,
    this.fontFamily,
    this.descPadding = EdgeInsets.zero,
    this.imageAsset,
    this.dividerColor = Colors.white,
    this.titleOffset = 0
  }) : super(key: key);

  final String title;
  final String description;
  final String discount;
  final VoidCallback? onTap;

  final Color backgroundColor;
  final Color textColor;
  final Color discountBackgroundColor;
  final Color dividerColor;
  final double? descriptionHeight;
  final String? fontFamily;
  final EdgeInsets descPadding;
  final String? imageAsset;
  final double titleOffset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap != null) {
          onTap!();
        }
      },
      child: Container(
        key: key,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          image: imageAsset == null ? null : DecorationImage(
            image: AssetImage(imageAsset!),
            fit: BoxFit.cover,
            alignment: Alignment.center
          ),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(35, 31, 32, 0.2),
              offset: Offset(0, 8),
              blurRadius: 16,
              spreadRadius: 1
            )
          ]
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: titleOffset),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ),
                if(discount.isEmpty)
                  const AW_AmodoBanner()
                else
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: textColor
                  ),
                  child: Text(
                    discount,
                    style: TextStyle(
                      color: backgroundColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6,),
            Divider(color: dividerColor, height: 20),
            Expanded(
              child: Padding(
                padding: descPadding,
                child: Text(
                  description,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      height: descriptionHeight,
                      fontFamily: fontFamily
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              )
            ),
            const SizedBox(height: 10,),
            if(discount.isNotEmpty)
            const Opacity(
              opacity: 0.3,
              child: AW_AmodoBanner(),
            )
            else const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Text(
                '',
                style: TextStyle(
                    fontSize: 12
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
