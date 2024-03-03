// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WidgetStore on WidgetBase, Store {
  Computed<WidgetModel>? _$singleWidgetComputed;

  @override
  WidgetModel get singleWidget => (_$singleWidgetComputed ??=
          Computed<WidgetModel>(() => super.singleWidget,
              name: 'WidgetBase.singleWidget'))
      .value;

  late final _$widgetModelListAtom =
      Atom(name: 'WidgetBase.widgetModelList', context: context);

  @override
  List<WidgetModel> get widgetModelList {
    _$widgetModelListAtom.reportRead();
    return super.widgetModelList;
  }

  @override
  set widgetModelList(List<WidgetModel> value) {
    _$widgetModelListAtom.reportWrite(value, super.widgetModelList, () {
      super.widgetModelList = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'WidgetBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$widgetNameAtom =
      Atom(name: 'WidgetBase.widgetName', context: context);

  @override
  String get widgetName {
    _$widgetNameAtom.reportRead();
    return super.widgetName;
  }

  @override
  set widgetName(String value) {
    _$widgetNameAtom.reportWrite(value, super.widgetName, () {
      super.widgetName = value;
    });
  }

  late final _$pageNumAtom = Atom(name: 'WidgetBase.pageNum', context: context);

  @override
  int get pageNum {
    _$pageNumAtom.reportRead();
    return super.pageNum;
  }

  @override
  set pageNum(int value) {
    _$pageNumAtom.reportWrite(value, super.pageNum, () {
      super.pageNum = value;
    });
  }

  late final _$_singleWidgetAtom =
      Atom(name: 'WidgetBase._singleWidget', context: context);

  @override
  WidgetModel get _singleWidget {
    _$_singleWidgetAtom.reportRead();
    return super._singleWidget;
  }

  @override
  set _singleWidget(WidgetModel value) {
    _$_singleWidgetAtom.reportWrite(value, super._singleWidget, () {
      super._singleWidget = value;
    });
  }

  late final _$loadAllParamsAtom =
      Atom(name: 'WidgetBase.loadAllParams', context: context);

  @override
  bool get loadAllParams {
    _$loadAllParamsAtom.reportRead();
    return super.loadAllParams;
  }

  @override
  set loadAllParams(bool value) {
    _$loadAllParamsAtom.reportWrite(value, super.loadAllParams, () {
      super.loadAllParams = value;
    });
  }

  late final _$loadAndParseJsonAsyncAction =
      AsyncAction('WidgetBase.loadAndParseJson', context: context);

  @override
  Future<void> loadAndParseJson() {
    return _$loadAndParseJsonAsyncAction.run(() => super.loadAndParseJson());
  }

  late final _$WidgetBaseActionController =
      ActionController(name: 'WidgetBase', context: context);

  @override
  void setCorrectDescription() {
    final _$actionInfo = _$WidgetBaseActionController.startAction(
        name: 'WidgetBase.setCorrectDescription');
    try {
      return super.setCorrectDescription();
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCorrectWidgetName() {
    final _$actionInfo = _$WidgetBaseActionController.startAction(
        name: 'WidgetBase.setCorrectWidgetName');
    try {
      return super.setCorrectWidgetName();
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPageNum(int x) {
    final _$actionInfo =
        _$WidgetBaseActionController.startAction(name: 'WidgetBase.setPageNum');
    try {
      return super.setPageNum(x);
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSingleWidget(WidgetModel model) {
    final _$actionInfo = _$WidgetBaseActionController.startAction(
        name: 'WidgetBase.setSingleWidget');
    try {
      return super.setSingleWidget(model);
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSingleWidgetBasedOnName() {
    final _$actionInfo = _$WidgetBaseActionController.startAction(
        name: 'WidgetBase.setSingleWidgetBasedOnName');
    try {
      return super.setSingleWidgetBasedOnName();
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAllParams() {
    final _$actionInfo = _$WidgetBaseActionController.startAction(
        name: 'WidgetBase.toggleAllParams');
    try {
      return super.toggleAllParams();
    } finally {
      _$WidgetBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
widgetModelList: ${widgetModelList},
description: ${description},
widgetName: ${widgetName},
pageNum: ${pageNum},
loadAllParams: ${loadAllParams},
singleWidget: ${singleWidget}
    ''';
  }
}
