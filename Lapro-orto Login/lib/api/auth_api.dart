import 'package:sky_engine/_http/http.dart' as http;
import 'package:meta/meta.dart';
import '../app_config.dart';

class AuthApi{

  registro(String username, String email, String password){
    final url = "${AppConfig.apiHost}/registro";

    http.post(url,body: {
      "username":username,
      "email":email,
    });

  }

}