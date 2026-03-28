import 'package:rpg/models/entities/damageable.dart';
import 'attack.dart';

class FireAttack implements Attack {
  final int baseDamage;

  FireAttack({required this.baseDamage});

  @override
  String get name => 'Fireball';

  @override
  int calculateDamage(Damageable target) {
    return baseDamage + 5;
  }
}