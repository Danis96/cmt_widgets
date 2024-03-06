part of widgets;

// carousel item
class AW_DemoNewsItem extends StatelessWidget {
  const AW_DemoNewsItem({
    Key? key,
    required this.onTap,
    required this.date,
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
    this.titleStyle = const TextStyle(color: Color.fromRGBO(57, 70, 82, 1), fontSize: 14, fontWeight: FontWeight.w600),
    this.descriptionStyle = const TextStyle(
      color: Color.fromRGBO(100, 113, 126, 1),
      fontSize: 12,
    ),
    this.dateStyle = const TextStyle(color: Colors.white, fontSize: 12),
    this.height = 530,
    this.imageHeight = 330,
    this.imageWidth = 330,
    this.imageFit = BoxFit.fitHeight,
    this.bannerColor = Colors.white,
    this.bannerOpacity = 0.2,
    this.iconRadius = 24,
    this.emptyPlaceholder
  }): super(key: key);

  final String image;
  final String date;
  final String title;
  final String description;
  final VoidCallback onTap;
  final double height;
  final double imageHeight;
  final double imageWidth;
  final BoxFit imageFit;
  final IconData icon;

  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final TextStyle dateStyle;
  final Color bannerColor;
  final double bannerOpacity;
  final double iconRadius;
  final Widget? emptyPlaceholder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key,
      onTap: onTap,
      child: Container(
        height: height,
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                if(image.isEmpty || image.startsWith('http:'))
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: emptyPlaceholder ?? const SizedBox(),
                    ),
                  )
                else Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:image,
                      width: imageWidth,
                      height: imageHeight,
                      fit: imageFit,
                      errorWidget: (_, __, ___) {
                        if(emptyPlaceholder != null) {
                          return emptyPlaceholder!;
                        }
                        return const SizedBox();
                      },
                      placeholder: (_, __) {
                        if(emptyPlaceholder != null) {
                          return emptyPlaceholder!;
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: date.isEmpty ? 0 : iconRadius,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(color: bannerColor.withOpacity(bannerOpacity), borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        date,
                        style: dateStyle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ClipOval(
                    child: Container(
                        height: iconRadius,
                        width: iconRadius,
                        color: bannerColor.withOpacity(bannerOpacity),
                        child: Center(
                          child: Icon(icon, color: Colors.white, size: 15),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            AnimatedDefaultTextStyle(
              child: Text(title, maxLines: 2, overflow: TextOverflow.ellipsis,),
              style: title.isEmpty ? const TextStyle(fontSize: 0) : titleStyle,
              duration: const Duration(milliseconds: 150),
              curve: Curves.fastOutSlowIn,
            ),
            const SizedBox(
              height: 6,
            ),
            AnimatedDefaultTextStyle(
              child: Text(description, overflow: TextOverflow.ellipsis, maxLines: 4,),
              style: title.isEmpty ? const TextStyle(fontSize: 0) : descriptionStyle,
              duration: const Duration(milliseconds: 350),
              curve: Curves.fastOutSlowIn,
            ),
          ],
        ),
      ),
    );
  }
}
