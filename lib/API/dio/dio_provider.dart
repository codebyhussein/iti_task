import 'package:courses/API/models/success_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServies {
  SuccessModel successModel = SuccessModel();
  final String baseUrl = "http://159.89.4.181:2000/api/v1";
  List<Model> data = [];
  getStory() async {
    Response response = await Dio().get("$baseUrl/success-stories");
    successModel = SuccessModel.fromJson(response.data);

    return successModel;
  }

  loginUser({required String email, required String password}) async {
    try {
      FormData formData =
          FormData.fromMap(({"email": email, "password": password}));
      Response response =
          await Dio().post("$baseUrl/auth/email/signin", data: formData);

      print(response.data);

      final SharedPreferences preferences =
          await SharedPreferences.getInstance();

      await preferences.setString(
          'token', response.data['model']['tokens']['accessToken']);
      final String? token = preferences.getString("token");

      print("****");

      print(token);
    } catch (e) {
      if (e is DioException) {
        print(e.error);
      }
    }
  }
}
