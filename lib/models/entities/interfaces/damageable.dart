import 'package:rpg/models/combat/combat_rules.dart';
import 'package:rpg/models/entities/interfaces/entity.dart';

abstract interface class Damageable implements Entity {
  String get name;
  int get health;
  set health(int value);
  int get maxHealth;
  bool get isDead;
  List<StatusEffect> get activeEffects;

  Map<Element, double> get resistances;
}
extension DamageMath on Damageable {
  double getDamageMultiplier(Element element) {
    return resistances[element] ?? 1.0; 
  }
}