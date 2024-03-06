part of widgets;

class AW_FilterAigComponent extends StatelessWidget {
  const AW_FilterAigComponent(
      {required this.widgetKey,
      required this.listItem,
      this.onItemClick,
      required this.selectedShieldId,
      required this.selectedFilterColor});

  final Key? widgetKey;
  final List<ShieldFilter>? listItem;
  final Function(String, int)? onItemClick;
  final int selectedShieldId;
  final Color selectedFilterColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(color: const Color.fromRGBO(238, 238, 238, 1), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listItem!.map((ShieldFilter e) {
          return GestureDetector(
              onTap: () => onItemClick!(e.text, e.id),
              child: _filterItem(e.icon, context, e.id == selectedShieldId, selectedFilterColor));
        }).toList(),
      ),
    );
  }
}

Widget _filterItem(String image, BuildContext context, bool isSelected, Color selectedColor) {
  return Container(
      width: MediaQuery.of(context).size.width / 7.2,
      child: Column(children: <Widget>[
        if (image.isNotEmpty)
          Image.network(image, color: isSelected ? selectedColor : const Color.fromRGBO(158, 158, 158, 1))
        else
          const SizedBox()
      ]));
}
