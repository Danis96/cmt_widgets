import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../models/widget_model.dart';

part 'widget_store.g.dart';

class WidgetStore = WidgetBase with _$WidgetStore;

abstract class WidgetBase with Store {

  PageController pageController = PageController();

  @observable
  List<WidgetModel> widgetModelList = [];

  @action
  Future<void> loadAndParseJson() async {
    // todo refactor [move next 2 lines]
    String jsonFileName = 'widgets.json';
    String jsonData = await rootBundle.loadString('lib/app/utils/json/$jsonFileName');
    Map<String, dynamic> widgetInfo = jsonDecode(jsonData);
    for (final s in widgetInfo['widgets']) {
      widgetModelList.add(WidgetModel.fromJson(s));
    }
  }

  @observable
  String description = '';

  @action
  void setCorrectDescription() {
    if (widgetModelList.isNotEmpty) {
      widgetModelList.forEach((element) {
        if (widgetKey.contains(element.name)) {
          description = element.description;
        }
      });
    }
  }

  @observable
  String widgetName = '';

  @action
  void setCorrectWidgetName() {
    if (widgetModelList.isNotEmpty) {
      widgetModelList.forEach((element) {
        if (widgetKey.contains(element.name)) {
          widgetName = element.name;
        }
      });
    }
  }

  @observable
  String widgetKey = '';

  @action
  void setWidgetKey(String x) => widgetKey = x;

  @observable
  int pageNum = 0;

  @action
  void setPageNum(int x) => pageNum = x;

  @observable
  WidgetModel _singleWidget = WidgetModel();

  @computed
  WidgetModel get singleWidget => _singleWidget;

  @action
  void setSingleWidget(WidgetModel model) {
    _singleWidget = model;
  }

  @action
  void setSingleWidgetBasedOnName() {
    if (widgetModelList.isNotEmpty) {
      widgetModelList.forEach((element) {
        if (widgetKey.contains(element.name)) {
          _singleWidget = element;
        }
      });
    }
  }

  @observable
  bool loadAllParams = false;

  @action
  void toggleAllParams() {
    loadAllParams = !loadAllParams;
  }
}
