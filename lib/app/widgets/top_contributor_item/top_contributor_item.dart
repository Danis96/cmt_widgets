part of widgets;

class AW_TopContributorItem extends StatelessWidget {
  const AW_TopContributorItem({
    this.widgetKey,
    this.index,
    this.image = '',
    this.name = '',
    this.team = '',
    this.colorValue = Colors.black,
    this.value = '0.0',
    this.useColors = false,
    this.teamColor = Colors.grey,
    this.nameStyle,
    this.teamStyle
  });

  final Key? widgetKey;
  final int? index;
  final String? image;
  final String? name;
  final String? team;
  final String? value;
  final Color colorValue;

  final bool useColors;
  final Color teamColor;
  final TextStyle? nameStyle;
  final TextStyle? teamStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                Text('$index'),
                const SizedBox(width: 10),
                if (useColors) _colorCircle(teamColor) else _imageCircle(image!, context),
                const SizedBox(width: 10),
                Expanded(
                  child: _nameAndTeam(context, name!, team!, teamStyle: teamStyle, nameStyle: nameStyle),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12,),
          Text('$value', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: colorValue, fontSize: 15))
        ],
      ),
    );
  }
}

Widget _imageCircle(String image, BuildContext context) {
  return Container(
    height: 32,
    width: 32,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Container(height: 30, width: 30, color: Colors.grey, child: image.isNotEmpty ? Image.network(image) : _errorImage()),
      ),
    ),
  );
}

Widget _colorCircle(Color color) {
  return Container(
    height: 32,
    width: 32,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color
    ),
  );
}

Widget _errorImage() {
  return Container(height: 30, width: 30, color: const Color.fromRGBO(224, 224, 224, 1));
}

Widget _nameAndTeam(BuildContext context, String name, String team, {TextStyle? nameStyle, TextStyle? teamStyle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        name,
        style: nameStyle ?? Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
      Text(
        team,
        style: teamStyle ?? Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
