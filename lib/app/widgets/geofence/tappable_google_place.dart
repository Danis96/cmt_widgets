
part of widgets;

class AW_TappableGooglePlace extends StatelessWidget {
  const AW_TappableGooglePlace({
    Key? key,
    required this.place,
    this.borderColor = Colors.grey,
    this.notSelectedStyle = const TextStyle(color: Colors.grey, fontSize: 16),
    this.selectedStyle = const TextStyle(color: Colors.blue, fontSize: 16),
    required this.isSelected,
    required this.onTap
  }) : super(key: key);

  final String place;
  final Color borderColor;
  final TextStyle notSelectedStyle;
  final TextStyle selectedStyle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(4)
        ),
        child: Text(
          place,
          overflow: TextOverflow.ellipsis,
          style: isSelected ? selectedStyle : notSelectedStyle
        ),
      ),
    );
  }
}
