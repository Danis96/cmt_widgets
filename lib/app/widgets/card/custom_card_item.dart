part of widgets;

/// modifiable card item
/// in some cases, bottom edges have border radius, some cases have top edges radius
/// because the picture is at the top, we must apply border to picture
/// if image border radius is provided, top edges will have radius, bottom will not


/// widget now accepts bottom edge radius, shadows should be ClipRRect - ed from the
/// place of usage, not from here


/// important to test maxLines property to not exceed constraints, at least one line will always be occupied


class AW_CustomCardItem extends StatelessWidget {

  const AW_CustomCardItem({
    this.width = 130,
    this.image,
    this.widgetKey,
    this.title,
    this.maxLines = 1,
    this.imageBorderRadius,
    this.imageHeight = 110,
    this.bottomRadius,
    this.boxFit = BoxFit.contain,
  });

  final Key? widgetKey;
  final String? title;
  final String? image;
  final double width;
  final BorderRadius? imageBorderRadius;
  final int maxLines;
  final double imageHeight;
  final BorderRadius? bottomRadius;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return  Container(
      key: widgetKey!,
      width: width,
      margin: const EdgeInsets.only(right: 17),
      child: Card(
        elevation: 10,
        shape: imageBorderRadius == null ? null : bottomRadius == null ? const RoundedRectangleBorder() : RoundedRectangleBorder(borderRadius: bottomRadius!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: imageHeight,
              child: _CardImage(
                imageBorderRadius: imageBorderRadius,
                image: image,
                imageHeight: imageHeight,
                boxFit: BoxFit.fill,
              )
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: bottomRadius,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
    required this.imageBorderRadius,
    required this.image,
    required this.imageHeight,
    this.boxFit = BoxFit.contain
  }) : super(key: key);

  final String? image;
  final BorderRadius? imageBorderRadius;
  final double imageHeight;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return (image != null && image!.isNotEmpty) ? (
    imageBorderRadius != null ? ClipRRect(
      borderRadius: imageBorderRadius!,
      child: Image.network(
        image!,
        fit: boxFit,
      ),
    ) :
    Image.network(
      image!,
      fit: boxFit,
    )) : const SizedBox();
  }
}
