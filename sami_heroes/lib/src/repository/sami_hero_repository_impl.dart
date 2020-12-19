import 'dart:ffi';

import 'package:dio/dio.dart';
import '../models/super_hero_model.dart';
import 'config/backend_client.dart';
import 'contracts/sami_hero_repository.dart';

class SamiHeroRepositoryImpl extends SamiHeroRepobackenhomesitory {
  final Dio client = BackendClient().handler;
  @override
  Future<SamiHeroModel> getSuperHeroes(String superHeroID) async {
    final path = "/$superHeroID";
    Response response = await client.get(path);
    if (response.statusCode >= 400) {
      throw DioError(request: response.request, response: response);
    }
    return SamiHeroModel.fromJson(response.data);
  }
}
