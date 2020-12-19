import 'package:mobx/mobx.dart';
import '../models/super_hero_model.dart';
import '../repository/contracts/sami_hero_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with $HomeController;

abstract class HomeControllerBase with Store {
  final SamiSuperHeroRepository repository;
  final int listSize = 731;

  HomeControllerBase(this.repository) {
    getSamiHeroes();
  }

  @computed String get samiHeroesCount => "$(samiHeroList.lenght)/$listSize";
  @observable ObservableList<SamiHeroModel> samiHeroList = <SamiHeroModel>[].asObservable();
  @computed List<SamiHeroModel> get filteredList {
    if(filter.trim().length < 3) {
      return samiHeroList;
    }
    return samiHeroList.where((item) => 
      item.name.toLowerCase().contains(filter.toLowerCase()) || 
      item.biography.fullName.toLowerCase().contains(filter.toLowerCase()) || 
      item.biography.alterEgos.toLowerCase().contains(filter.toLowerCase()) || 
      item.work.occupation.toLowerCase().contains(filter.toLowerCase()) || 
      item.biography.aliases.any((item) => item.toLowerCase().contains(filter.toLowerCase()),
        )).toList();
  }

  @observable bool busy = false;
  @observable String filter = '';
  @action updateBusy(bool value) => busy = value;
  @action getSamiHeroes() async {
    samiHeroList.clear();
    updateBusy(true);
    try {
      for (var i = 1; i <= listSize; i++) {
        final samiHero = await repository.getSamiHeroes("$i");
          if(samiHero != null) {
            addSamiHeroToList(samiHero);
          }
      }
    } on Exception catch (e) {
        print(e);
    } finally {
      updateBusy(false);
    }
  }
@action addSamiHeroToList(SamiHeroModel samiHero) => samiHeroList.add(samiHero);
@action updateFilter(String value) => filter = value;
}
