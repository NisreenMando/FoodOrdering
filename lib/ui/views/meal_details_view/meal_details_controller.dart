import 'package:easy_shopping/core/data/enums/message_type.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_toast.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/cart_view/cart_view.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../core/services/base_controller.dart';

class MealDetailsController extends BasController {
  MealDetailsController(MealModel mealModel) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;

  void changeCount(bool incress) {
    if (incress)
      count++;
    else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => CartView());
          CustomToast.showMessage(
            message: "Added to Cart Successfully",
            messageType: MessageType.SUCSSES,
          );
        });
  }
}
