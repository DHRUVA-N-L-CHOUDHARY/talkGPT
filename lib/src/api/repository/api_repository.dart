import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:talkgpt/src/api/api_params.dart';
import 'package:talkgpt/src/models/search_output.dart';
import 'package:talkgpt/src/models/search_response_model.dart';

import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

final title = "ApiRepo";

class ApiRepo {
  Future<searchResponse> getresp() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return searchResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrl + ApiEndPoints.products;

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        List<search> searches =
            List<search>.from(response.data.map((x) => search.fromJson(x)));

        return searchResponse(success: true, searchList: searches);
      }

      return searchResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return searchResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future post(String data) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return searchResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = Api.baseUrl;

    String data = jsonEncode();
    try {
      search searchList = []; 
      final response = await apiUtils.post(url: url, data:searchList);

      if (response != null) {
        List<search> searches =
            List<search>.from(response.data.map((x) => search.fromJson(x)));

        return searchResponse(success: true, searchList: searches);
      }

      return searchResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return searchResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }

    List<search> cartDetails = [];
    String data = jsonEncode({"productId": productId, "quantity": quantity});
    try {
      Response cartDetailsData =
          await _dio.post('$_baseUrl/cart/add-to-cart', data: data);
      var list = cartDetailsData.data["products"] as List;
      cartDetails = list.map((e) => CartModel.fromJson(e)).toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {}
    }
    return cartDetails;
  }
}
