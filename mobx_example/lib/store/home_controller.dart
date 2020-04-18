import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeStoreBase with _$HomeController;

abstract class HomeStoreBase with Store {

  @observable
  int count = 0;

  @action
  void changeValue() {
    count++;
  }
}