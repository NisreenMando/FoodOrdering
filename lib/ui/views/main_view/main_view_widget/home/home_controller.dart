import 'package:easy_shopping/core/data/enums/connectivity_status_enums.dart';
import 'package:easy_shopping/core/data/enums/message_type.dart';
import 'package:easy_shopping/core/data/enums/operation_type.dart';
import 'package:easy_shopping/core/data/enums/request_status.dart';
import 'package:easy_shopping/core/data/models/api/category_model.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/data/repositories/category_repsitory.dart';
import 'package:easy_shopping/core/data/repositories/meal_repository.dart';
import 'package:easy_shopping/core/services/base_controller.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_toast.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:get/get.dart';

class HomeController extends BasController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;


  bool get isCategoryLoading =>
      requestStatus == RequestStatus.LODAIN &&
      operationType == OperationType.Category;

  bool get isMealLoadin =>
      requestStatus == RequestStatus.LODAIN &&
      operationType == OperationType.Meal;

  @override
  void onInit() {
    getAllCategory();
    getAllMeal();
    // checkConnection();
    super.onInit();
  }

  @override
  void onReady() {
    checkConnection();
    super.onReady();
  }

RxBool isOnlne = true.obs;
  void checkConnection() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      isOnlne.value = event == ConnectivityStatus.ONLINE;
    });
  }

  void getAllCategory() {
    CategoryRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        categoryList.addAll(r);
      });
    });
  }

  void getAllMeal() {
    MealRepository().getAll().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        //?اذا بدنا نستدعي api مرتين منعمل
        //?   mealList.clear();
        mealList.addAll(r);
      });
    });
  }

    void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {

          CustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCSSES);
        });
  }
}
