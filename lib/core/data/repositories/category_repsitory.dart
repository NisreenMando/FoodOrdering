import 'package:dartz/dartz.dart';
import 'package:easy_shopping/core/data/enums/reouest_type.dart';
import 'package:easy_shopping/core/data/models/api/category_model.dart';
import 'package:easy_shopping/core/data/models/common_response.dart';
import 'package:easy_shopping/core/data/network/endpoints/category_endpoints.dart';
import 'package:easy_shopping/core/data/network/network_config.dart';
import 'package:easy_shopping/core/utils/network_utils.dart';

class CategoryRepository {
  Future<Either<String, List<CategoryModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        requestType: RequestType.GET,
        url: CategoryEndpoints.getAll,
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.POST),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStutus) {
          List<CategoryModel> resultList = [];
          commonResponse.data!.forEach(
            (element) {
              resultList.add(CategoryModel.fromJson(element));
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
