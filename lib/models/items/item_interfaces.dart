import 'package:rpg/models/entities/player.dart';

abstract class BaseItem {
  String get name;
}

abstract class Consumable extends BaseItem {
  void consume(Player target);
}

abstract class Equippable extends BaseItem {
  void equip(Player target);
}