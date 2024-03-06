part of widgets;

// details widget should be wrapped inside expanded and list view builder
// from the app side
class AW_PolicyBoostDetails extends StatelessWidget {
  const AW_PolicyBoostDetails({
    Key? key,
    required this.detailsLabel,
    required this.boostLabel,
    this.selectedStyle = const TextStyle(
        color: Color.fromRGBO(57, 70, 82, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),
    this.notSelectedStyle = const TextStyle(
        color: Color.fromRGBO(127, 144, 159, 1),
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),
    this.indicatorColor = const Color.fromRGBO(23, 164, 160, 1),
    required this.detailsSelected,
    required this.boost,
    this.detailsStyle = const TextStyle(
        color: Color.fromRGBO(57, 70, 82, 1),
        fontSize: 12
    ),
    required this.onBoost,
    required this.onDetails,
    required this.detailsList
  }) : super(key: key);

  final String detailsLabel;
  final String boostLabel;
  final TextStyle selectedStyle;
  final TextStyle notSelectedStyle;
  final TextStyle detailsStyle;
  final Color indicatorColor;
  final bool detailsSelected;
  final Widget detailsList;
  final String boost;

  final VoidCallback onBoost;
  final VoidCallback onDetails;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: onDetails,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      detailsLabel,
                      style: detailsSelected ? selectedStyle : notSelectedStyle,
                    ),
                  ),
                ),
                if (detailsSelected) _buildIndicator() else const SizedBox()
              ],
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: onBoost,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      boostLabel,
                      style: !detailsSelected ? selectedStyle : notSelectedStyle,
                    ),
                  ),
                ),
                if (!detailsSelected) _buildIndicator() else const SizedBox()
              ],
            )
          ],
        ),

        if(detailsSelected) detailsList
        else Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              boost,
              style: detailsStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        height: 4,
        width: 24,
        decoration: BoxDecoration(
            color: indicatorColor,
            borderRadius: const BorderRadius.all( Radius.circular(10))
        ),
      ),
    );
  }

}