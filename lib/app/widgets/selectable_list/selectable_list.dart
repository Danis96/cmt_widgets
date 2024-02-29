part of widgets;

class AW_SelectableList extends StatelessWidget {
  const AW_SelectableList({
    Key? key,
    required this.onItemSelected,
    required this.items,
    this.selectedIndex,
    this.shrinkWrap = true,
    this.checkedIndicator = const Icon(Icons.check),
    this.textStyle = const TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0, color: Color.fromRGBO(35, 44, 53, 1)),
  }) : super(key: key);

  final int? selectedIndex;
  final Function(int) onItemSelected;
  final List<String> items;
  final bool shrinkWrap;
  final Widget checkedIndicator;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key('selectable_list_tile_$index'),
          title: Text(items[index], style: textStyle),
          tileColor: Colors.white,
          trailing: (selectedIndex != null && selectedIndex == index) ? checkedIndicator : null,
          onTap: () {
            onItemSelected(index);
          },
        );
      },
    );
  }
}
