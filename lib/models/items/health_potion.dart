import 'package:rpg/models/entities/player.dart';

import 'item_interfaces.dart';

class HealthPotion implements Consumable {
  @override
  final String name = "Minor Health Potion";

  final int healAmount;

  HealthPotion({this.healAmount = 25});

  @override
  void consume(Player target) {
    target.health += healAmount;
    if (target.health > target.maxHealth) {
      target.health = target.maxHealth;
    }
    print('${target.name} drank $name and healed for $healAmount!');
  }
}