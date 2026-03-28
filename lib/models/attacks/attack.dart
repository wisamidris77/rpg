import 'package:rpg/models/combat/combat_rules.dart';
import 'package:rpg/models/entities/interfaces/damageable.dart';

abstract class Attack {
  String get name;
  Element get element;
  int calculateBaseDamage(Damageable target);
  List<StatusEffect> get secondaryEffects => [];
}
