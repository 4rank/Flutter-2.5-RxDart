import 'package:api_rxdart/models/color_response.dart';
import 'package:api_rxdart/repositories/api_client.dart';

class Repository {
  final ApiClient _apiProvider = ApiClient();

  Future<ColorResponse> getColor(){
    return _apiProvider.getColor();
  }
}