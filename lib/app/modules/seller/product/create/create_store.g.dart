// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreateStoreBase, Store {
  final _$imageAtom = Atom(name: '_CreateStoreBase.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$errorAtom = Atom(name: '_CreateStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CreateStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$productModelAtom = Atom(name: '_CreateStoreBase.productModel');

  @override
  ProductModel get productModel {
    _$productModelAtom.reportRead();
    return super.productModel;
  }

  @override
  set productModel(ProductModel value) {
    _$productModelAtom.reportWrite(value, super.productModel, () {
      super.productModel = value;
    });
  }

  final _$categoryListAtom = Atom(name: '_CreateStoreBase.categoryList');

  @override
  ObservableStream<List<CategoryModel>> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableStream<List<CategoryModel>> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$categorySelectedAtom =
      Atom(name: '_CreateStoreBase.categorySelected');

  @override
  CategoryModel get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(CategoryModel value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  final _$getImageGaleryAsyncAction =
      AsyncAction('_CreateStoreBase.getImageGalery');

  @override
  Future<dynamic> getImageGalery() {
    return _$getImageGaleryAsyncAction.run(() => super.getImageGalery());
  }

  final _$getImageProductEditAsyncAction =
      AsyncAction('_CreateStoreBase.getImageProductEdit');

  @override
  Future<dynamic> getImageProductEdit(ProductModel productModel) {
    return _$getImageProductEditAsyncAction
        .run(() => super.getImageProductEdit(productModel));
  }

  final _$getImageCameraAsyncAction =
      AsyncAction('_CreateStoreBase.getImageCamera');

  @override
  Future<dynamic> getImageCamera() {
    return _$getImageCameraAsyncAction.run(() => super.getImageCamera());
  }

  final _$saveProductAsyncAction = AsyncAction('_CreateStoreBase.saveProduct');

  @override
  Future<dynamic> saveProduct() {
    return _$saveProductAsyncAction.run(() => super.saveProduct());
  }

  final _$_CreateStoreBaseActionController =
      ActionController(name: '_CreateStoreBase');

  @override
  dynamic getListCategory() {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.getListCategory');
    try {
      return super.getListCategory();
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setProductModel(ProductModel value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setProductModel');
    try {
      return super.setProductModel(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setName(dynamic value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setError(dynamic value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setDescription(dynamic value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setPrice(double value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setCategorySelected(CategoryModel value) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setCategorySelected');
    try {
      return super.setCategorySelected(value);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setCategorySelectedEdit(
      ProductModel productModel, List<CategoryModel> categories) {
    final _$actionInfo = _$_CreateStoreBaseActionController.startAction(
        name: '_CreateStoreBase.setCategorySelectedEdit');
    try {
      return super.setCategorySelectedEdit(productModel, categories);
    } finally {
      _$_CreateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
error: ${error},
loading: ${loading},
productModel: ${productModel},
categoryList: ${categoryList},
categorySelected: ${categorySelected}
    ''';
  }
}
