import '../entities/interfaces/damageable.dart';
import '../combat/combat_rules.dart';
import '../combat/burn_effect.dart';
import 'attack.dart';

class FireAttack implements Attack {
  final int baseDamage;

  FireAttack({required this.baseDamage});

  @override
  String get name => 'Fireball';

  @override
  Element get element => Element.fire;

  @override
  int calculateBaseDamage(Damageable target) => baseDamage;

  @override
  List<StatusEffect> get secondaryEffects => [BurnEffect(remainingTurns: 3, damagePerTurn: 5)];
}