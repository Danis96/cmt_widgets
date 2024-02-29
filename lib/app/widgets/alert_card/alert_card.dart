part of widgets;

class AW_AlertCard extends StatelessWidget {
  const AW_AlertCard({
    this.widgetKey,
    this.icon,
    this.title,
    this.status,
    this.statusColor = const Color.fromRGBO(0, 164, 228, 1),
    this.statusColorContainer = const Color.fromRGBO(224, 243, 251, 1),
    this.shouldSHowTitleText = false,
  });

  final Key? widgetKey;
  final String? title;
  final String? icon;
  final String? status;
  final Color? statusColorContainer;
  final Color? statusColor;
  final bool? shouldSHowTitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widgetKey,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(color: const Color.fromRGBO(238, 238, 238, 1)), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Row(
                  children: <Widget>[
                SvgPicture.asset(icon!, color: const Color.fromRGBO(127, 144, 159, 1)),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(title!, textAlign: TextAlign.left, style: Theme.of(context).textTheme.bodyLarge))),
                  flex: 2,
                ),
              ])),
          const SizedBox(width: 5),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 20,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: statusColorContainer),
                child: Center(
                    child: FittedBox(
                         child: Text(status!, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12, color: statusColor)))),
              )),
        ],
      ),
    );
  }
}
