
import 'package:getx_mvvm/data/network/api/network_api_service.dart';
import 'package:getx_mvvm/res/routes/api_routes.dart';

class LoginRepository{

  final _apiService =  NetworkApiService();

  Future<dynamic> loginApi(var data) async{
    dynamic response =  _apiService.postApi(data, ApiUrlRoute.login_url,false);
    return response;
  }
}