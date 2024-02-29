part of widgets;

class AW_ShieldHomepageCard extends StatelessWidget {
  const AW_ShieldHomepageCard(
      {required this.widgetKey, this.title = '', this.description = '', required this.onButtonPressed, this.image = '', this.btnTitle = ''});

  final Key? widgetKey;
  final String title;
  final String image;
  final String description;
  final String btnTitle;
  final Function? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        //padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 16, color: const Color.fromRGBO(28, 37, 53, 1))),
            const SizedBox(height: 12,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              _imageContainerWidget(image, context),
              const SizedBox(width: 16),
              _infoCont(description, context),
            ]),
            const SizedBox(height: 16),
            AW_Button(onPressed: () => onButtonPressed!(), buttonTitle: btnTitle),
          ],
        ),
      );
   // );
  }
}

Widget _imageContainerWidget(String image, BuildContext context) {
  return image.isNotEmpty
      ? ClipRRect(
          child: CachedNetworkImage(imageUrl: image, height: 150, width: MediaQuery.of(context).size.width * 0.4, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(8.0),
        )
      : Container(height: 160, width: MediaQuery.of(context).size.width / 2.2, color: const Color.fromRGBO(196, 196, 196, 1));
}

Widget _infoCont(String body, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(body,
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 13.5, color: const Color.fromRGBO(70, 83, 93, 1))),
      ],
    ),
  );
}
