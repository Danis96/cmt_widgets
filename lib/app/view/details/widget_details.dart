import 'package:cmt/app/locator.dart';
import 'package:cmt/app/models/parameter_model.dart';
import 'package:cmt/app/stores/widget_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/helpers/list_of_widgets.dart';

class WidgetDetails extends StatelessWidget {
  WidgetDetails({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final WidgetStore widgetStore = getIt<WidgetStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey, appBar: _buildAppBar(context), body: _buildBody(context));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(title: Text(widgetStore.singleWidget.name));

  Widget _buildBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 50),
        listOfWidgets(context, _scaffoldKey)
            .firstWhere((element) => element.key.toString().contains(widgetStore.singleWidget.name)),
        const SizedBox(height: 50),
        _buildDescription(context),
        const SizedBox(height: 50),
        Text(
          'Parameters',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
        ),
        const Divider(),
        _buildParameterList(context),
        const SizedBox(height: 10),
        _buildSeeMore(context),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) => Text(widgetStore.singleWidget.description);

  Widget _buildParameterList(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widgetStore.loadAllParams
                ? widgetStore.singleWidget.parameters!.length
                : widgetStore.singleWidget.parameters!.take(3).length,
            itemBuilder: (BuildContext context, int index) {
              return _buildParameterItemWidget(context, widgetStore.singleWidget.parameters![index]);
            });
      },
    );
  }

  Widget _buildParameterItemWidget(BuildContext context, ParameterModel p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Chip(label: Text('Name: ${p.name}')),
        Chip(label: Text('Type: ${p.type}')),
        Text(p.description),
        const Divider(),
      ],
    );
  }

  Widget _buildSeeMore(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widgetStore.toggleAllParams(),
      child: Observer(builder: (BuildContext context) {
        return Text(widgetStore.loadAllParams ? 'See less' : 'See more');
      }),
    );
  }
}
