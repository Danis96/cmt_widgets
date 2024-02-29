part of widgets;

class AW_DefaultPage extends StatelessWidget {
  const AW_DefaultPage(this.child, {this.padding = 24.0, this.widgetKey, this.paddingInsets});

  final Widget child;

  ///this padding is used for EdgeInsets.all and is
  ///used ONLY in case 'paddingInsets' is null
  final double padding;
  final Key? widgetKey;
  final EdgeInsetsGeometry? paddingInsets;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: widgetKey,
      child: SafeArea(
        child: Padding(
          padding: paddingInsets ?? EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
