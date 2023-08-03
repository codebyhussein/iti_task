import 'package:courses/API/models/success_model.dart';
import 'package:dio/dio.dart';

class ApiServies {
  SuccessModel successModel = SuccessModel();
  List<Model> data = [];
  getStory() async {
    Response response =
        await Dio().get('http://159.89.4.181:2000/api/v1/success-stories');
    successModel = SuccessModel.fromJson(response.data);

    return successModel;
  }
}
