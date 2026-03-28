import 'package:rpg/models/combat/combat_rules.dart';
import 'package:rpg/models/entities/interfaces/damageable.dart';
import 'attack.dart';

class PhysicalAttack implements Attack {
  final int baseDamage;

  PhysicalAttack({required this.baseDamage});

  @override
  String get name => 'Physical Strike';


  @override
  int calculateBaseDamage(Damageable target) {
    return baseDamage;
  }

  @override
  Element get element => Element.physical;

  @override
  List<StatusEffect> get secondaryEffects => [];
}