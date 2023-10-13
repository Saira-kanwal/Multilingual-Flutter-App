import '../../data/api_services/network_api_services.dart';
import '../../res/app_url/app_url.dart';


class LoginRepository {
  final _apiServices = NetworkApiServices() ;

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiServices.postApi(data, AppUrl.loginApi);
    return response;
  }

}