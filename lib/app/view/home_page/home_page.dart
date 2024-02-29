import 'package:cmt/routing/routes.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../locator.dart';
import '../../stores/widget_store.dart';
import '../../utils/helpers/list_of_widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final WidgetStore widgetStore = getIt<WidgetStore>();

  @override
  void initState() {
    _initialBuild();
    super.initState();
  }

  Future<void> _initialBuild() async {
    await widgetStore.loadAndParseJson();
    if (widgetStore.widgetModelList.isNotEmpty) {
      widgetStore.setSingleWidget(widgetStore.widgetModelList.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(context),
      body: _buildBody(context, _scaffoldKey),
      bottomNavigationBar: _buildControllerArrows(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(title: const Text('CMT Widgets'));

  Widget _buildBody(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpandablePageView(
              controller: widgetStore.pageController,
              animateFirstPage: true,
              padEnds: true,
              onPageChanged: (int pageNum) {
                widgetStore.setPageNum(pageNum);
                widgetStore.setWidgetKey(listOfWidgets(context, scaffoldKey)[pageNum].key.toString());
                widgetStore.setCorrectDescription();
                widgetStore.setSingleWidget(widgetStore.widgetModelList[pageNum]);
              },
              children: listOfWidgets(context, scaffoldKey).toList(),
            ),
            const SizedBox(height: 30),
            _buildDescription(context),
            const SizedBox(height: 30),
            _buildSeeMore(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Text(
          widgetStore.description.isNotEmpty
              ? widgetStore.description
              : widgetStore.widgetModelList.isNotEmpty
                  ? widgetStore.widgetModelList.first.description
                  : '',
        );
      },
    );
  }

  Widget _buildSeeMore(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widgetStore.setSingleWidgetBasedOnName();
        Navigator.of(context).pushNamed(Details);
      },
      child: const Text('See more'),
    );
  }

  Widget _buildControllerArrows(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              widgetStore.pageNum == 0
                  ? const SizedBox()
                  : ElevatedButton(onPressed: () => controllerAction(isNext: false), child: Text('Previous')),
              widgetStore.pageNum == widgetStore.widgetModelList.length - 1
                  ? const SizedBox()
                  : ElevatedButton(onPressed: () => controllerAction(isNext: true), child: Text('Next')),
            ],
          ),
        );
      },
    );
  }

  void controllerAction({required bool isNext}) {
    if (isNext) {
      widgetStore.pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      widgetStore.pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }
}
