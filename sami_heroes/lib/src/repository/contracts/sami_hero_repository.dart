import '../../models/sami_hero_model.dart';

abstract class SamiSuperHeroRepository {
  Future<SamiHeroModel> getSamiHeroes(String superHeroId);
}
