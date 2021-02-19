import 'package:bloc_injection_dep/src/shared/models/post.dart';
import 'package:dio/dio.dart';

class GeneralApi {
  //instacia do dio
  final Dio dio;

  //construtor
  GeneralApi(this.dio);

  //metodo para pegar os posts da aplicacao
  Future<List<Post>> getPosts() async {
    Response response = await dio.get("/posts");
    return (response.data as List).map((post) => Post.fromJson(post)).toList();
  }
}
