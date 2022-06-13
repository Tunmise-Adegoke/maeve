import 'package:get/get.dart';
import 'package:maeve/model/furniture_model.dart';

class CartController extends GetxController {
  final _furniture = {}.obs;
  final numOfItems = 1.obs;
  final totalQty = 0.obs;

  void addProducts(Furniture furniture) {
    if (_furniture.containsKey(furniture)) {
      _furniture[furniture] += 1;
    } else {
      _furniture[furniture] = 1;
    }

    Get.snackbar('Product Added', 'You have added ${furniture.title} to cart',
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  get furniture => _furniture;
  get productSubtotal {
    _furniture.entries
        .map((e) => furniture.key.price * furniture.value)
        .toList();
  }
  get productTotal {
    _furniture.entries
        .map((e) => furniture.key.price * furniture.value)
        .toList().reduce((value, element) => value + element)
        .toStringAsFixed(2);
  }
}
