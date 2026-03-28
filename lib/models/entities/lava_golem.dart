import 'package:rpg/models/entities/interfaces/enemy.dart';

import 'interfaces/damageable.dart';
import '../combat/combat_rules.dart';

class LavaGolem implements Enemy {
  @override
  final String name = "Lava Golem";

  @override
  int health = 100;

  @override
  final int maxHealth = 100;

  @override
  bool get isDead => health <= 0;

  @override
  List<StatusEffect> activeEffects = [];

  @override
  Map<Element, double> get resistances => {Element.fire: 0.0, Element.ice: 2.0, Element.physical: 1.0};
  
  @override
  final String id = 'lava_golem_1';
  
  @override
  final int xpReward = 100;
}
