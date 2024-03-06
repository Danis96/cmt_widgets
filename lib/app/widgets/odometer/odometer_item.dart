part of widgets;

class AW_OdometerItem extends StatelessWidget {
  const AW_OdometerItem({
    Key? key,
    @required this.onIconPressed,
    @required this.onImagePressed,
    this.icon = const Icon(Icons.camera_alt_outlined),
    this.title = 'Odometer',
    this.date = '',
    this.titleTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      color: Color.fromRGBO(35, 44, 53, 1),
    ),
    this.dateTextStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: Color.fromRGBO(114, 125, 134, 1),
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    this.imageBytes,
    this.imageUrl,
  }) : super(key: key);

  final Icon icon;
  final Function? onIconPressed;
  final Function? onImagePressed;
  final String title;
  final String date;
  final TextStyle titleTextStyle;
  final TextStyle dateTextStyle;
  final EdgeInsets padding;
  final Uint8List? imageBytes;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.5,
      child: Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            Container(
              width: 64.0,
              height: 48.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(235, 240, 244, 1),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              child: (imageBytes == null && imageUrl == null) ? const SizedBox() : _buildImage(imageBytes, imageUrl, onImagePressed),
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      title,
                      style: titleTextStyle,
                    ),
                  ),
                ),
                if (date.isNotEmpty)
                  Text(
                    date,
                    style: dateTextStyle,
                  ),
              ],
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              key: const Key('odometer_item_icon'),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => onIconPressed!(),
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImage(
  Uint8List? imageBytes,
  String? imageUrl,
  Function? onImagePressed,
) {
  return InkWell(
    key: const Key('odometer_item_tappable_image'),
    onTap: () => onImagePressed!(),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: FittedBox(
        child: imageBytes == null ? imageUrl!.isNotEmpty ? Image.network(imageUrl) : const SizedBox() : Image.memory(imageBytes),
        fit: BoxFit.cover,
      ),
    ),
  );
}
