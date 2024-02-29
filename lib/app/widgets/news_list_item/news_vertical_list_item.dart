part of widgets;

class AW_NewsVerticalListItem extends StatelessWidget {
  const AW_NewsVerticalListItem({
    required this.onTap,
    this.imageUrl,
    this.title = '',
    this.leadText = '',
    this.readMoreText = '',
    this.titleTextStyle = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
    this.leadTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(33, 33, 33, 1),
    ),
    this.readMoreTextStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(37, 37, 137, 1),
    ),
    this.dividerColor = const Color.fromRGBO(245, 246, 247, 1),
  });

  final Function? onTap;
  final String? imageUrl;
  final String title;
  final String leadText;
  final String readMoreText;
  final TextStyle titleTextStyle;
  final TextStyle leadTextStyle;
  final TextStyle readMoreTextStyle;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => onTap!(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 81,
                  height: 81,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(245, 246, 247, 1),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl ?? 'https://via.placeholder.com/150'),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: titleTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.0),
                          if (leadText.isNotEmpty)
                            Expanded(
                              child: Text(
                                leadText,
                                style: leadTextStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          else
                            const SizedBox(),
                          if (readMoreText.isNotEmpty)
                            Text(
                              readMoreText,
                              style: readMoreTextStyle,
                            )
                          else
                            const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            thickness: 1,
            color: dividerColor,
          ),
        ],
      ),
    );
  }
}
