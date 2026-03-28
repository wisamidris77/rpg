import 'package:rpg/models/entities/player.dart';
import 'item_interfaces.dart';

class IronSword implements Equippable {
  @override
  final String name = "Iron Sword";

  final int bonusDamage;

  IronSword({this.bonusDamage = 10});

  @override
  void equip(Player target) {
    print('${target.name} equipped the $name (+${bonusDamage} ATK)!');
  }
}