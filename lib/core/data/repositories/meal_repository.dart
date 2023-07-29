import 'package:dartz/dartz.dart';
import 'package:easy_shopping/core/data/enums/reouest_type.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/data/models/common_response.dart';
import 'package:easy_shopping/core/data/network/endpoints/meal_endpoints.dart';
import 'package:easy_shopping/core/data/network/network_config.dart';
import 'package:easy_shopping/core/utils/network_utils.dart';

//!اعادة
class MealRepository {
  Future<Either<String, List<MealModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: MealEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStutus) {
          List<MealModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(MealModel.fromJson(element));
            },
          );
          return Right(resultList);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
