import 'package:rpg/models/entities/damageable.dart';
import 'package:rpg/models/entities/player.dart';
import 'attack.dart';

class PhysicalAttack implements Attack {
  final int baseDamage;

  PhysicalAttack({required this.baseDamage});

  @override
  String get name => 'Physical Strike';

  @override
  int calculateDamage(Damageable target) {
    return baseDamage;
  }
}