part of widgets;

class AW_DemoVoucherListItem extends StatefulWidget {
  const AW_DemoVoucherListItem({
    Key? key,
    required this.title,
    required this.discount,
    required this.voucherLabel,
    required this.imageWidget,
    this.discountColor = const Color.fromRGBO(23, 164, 160, 1),
    this.voucherLabelColor = const Color.fromRGBO(57, 70, 82, 1),
    this.titleColor = const Color.fromRGBO(57, 70, 82, 1),
    this.backgroundColor = Colors.white,
    this.onTap,
    this.imageSpacing = 24.0,
    this.reverseDetails = false,
    this.voucherLabelFontWeight,
    this.titleTextOverflow,
  }) : super(key: key);

  final String discount;
  final String voucherLabel;
  final String title;
  final Widget imageWidget;

  final Color backgroundColor;
  final Color discountColor;
  final Color voucherLabelColor;
  final Color titleColor;
  final VoidCallback? onTap;
  final double imageSpacing;
  final bool reverseDetails;
  final FontWeight? voucherLabelFontWeight;
  final TextOverflow? titleTextOverflow;

  @override
  State<AW_DemoVoucherListItem> createState() => _AW_DemoVoucherListItemState();
}

class _AW_DemoVoucherListItemState extends State<AW_DemoVoucherListItem> {
  double valuee = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          key: widget.key,
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              boxShadow: const <BoxShadow>[BoxShadow(blurRadius: 24, offset: Offset(0, 8), color: Color.fromRGBO(35, 31, 32, 0.15))],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              widget.imageWidget,
              SizedBox(
                width: widget.imageSpacing,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    if(!widget.reverseDetails) ...<Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(color: widget.titleColor, fontSize: 10, fontWeight: FontWeight.w300),
                        maxLines: widget.titleTextOverflow != null ? null : 2,
                        overflow: widget.titleTextOverflow,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                    RichText(
                      text: TextSpan(
                        text: widget.discount,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: widget.discountColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.voucherLabel,
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.voucherLabelColor,
                              fontWeight: widget.voucherLabelFontWeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(widget.reverseDetails) ...<Widget>[
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: widget.titleColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: widget.titleTextOverflow != null ? null : 2,
                        overflow: widget.titleTextOverflow,
                      ),
                    ],
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class CircleThumbShape extends SliderComponentShape {
  final double thumbRadius;

  const CircleThumbShape({
    this.thumbRadius = 6.0,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = const Color.fromRGBO(15, 153, 221, 1)
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, thumbRadius, fillPaint);
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
