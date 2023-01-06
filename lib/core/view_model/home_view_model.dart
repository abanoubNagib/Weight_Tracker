import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/core/services/home_services.dart';
import 'package:getx/model/product_model.dart';

import 'package:getx/model/weight_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<ProductWeightModel> get productModel => _productModel;
  List<ProductWeightModel> _productModel = [];
  List<WeightModel> get weightModel => weightModel;
  List<WeightModel> _weightModel = [];

  HomeViewModel() {
    getAllWeight();
    // getAllWeights();
  }

  getAllWeight() async {
    _loading.value = true;
    HomeService().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        // _productModel.clear();
        _productModel
            .add(ProductWeightModel.fromJson(value[i].data() as dynamic));
        // _productModel.sort()
        _loading.value = false;
      }
      update();
    });
  }

  getAllWeights() async {
    _loading.value = true;
    HomeService().getAllWeights().then((value) {
      for (int i = 0; i < value.length; i++) {
        _weightModel.clear();
        _weightModel.add(WeightModel.fromJson(value[i].data() as dynamic));
        _productModel.sort();
        _loading.value = false;
      }
      update();
    });
  }
}
