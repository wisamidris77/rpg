import 'package:rpg/models/combat/combat_rules.dart';

import 'interfaces/damageable.dart';
import 'interfaces/enemy.dart';

class WoodenPawn implements Enemy {
  @override
  final String name = "Wooden Pawn";

  @override
  int health = 10;

  @override
  final int maxHealth = 10;

  @override
  List<StatusEffect> activeEffects = [];

  @override
  Map<Element, double> get resistances => {Element.physical: 1.0, Element.fire: 2.0};

  @override
  bool get isDead => health <= 0;
  
  @override
  final String id = 'wooden_pawn_1';
  
  @override
  final int xpReward = 10;
}
