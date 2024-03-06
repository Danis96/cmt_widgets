part of widgets;
class AW_SupervisionInfoItem extends StatelessWidget {
  const AW_SupervisionInfoItem({
    Key? key,
    required this.title,
    this.onPressed,
    required this.hasInfoButton
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool hasInfoButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 22,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                right: 0,
                child: hasInfoButton ? IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.info_outline, color: Colors.grey,),
                ) : const SizedBox(),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 25, thickness: 1, color: Colors.grey,),
      ],
    );
  }
}
