part of widgets;

class AW_TripStaticImage extends StatelessWidget {
  const AW_TripStaticImage(this.staticMapUrl, {Key? key}) : super(key: key);

  final String staticMapUrl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CachedNetworkImage(
            imageUrl: staticMapUrl,
            fit: BoxFit.fitWidth,
            placeholder: (BuildContext context, _) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
    );
  }
}


