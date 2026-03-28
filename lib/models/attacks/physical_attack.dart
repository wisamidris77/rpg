import 'package:rpg/models/player.dart';
import 'attack.dart';

class PhysicalAttack implements Attack {
  final int baseDamage;

  PhysicalAttack({required this.baseDamage});

  @override
  String get name => 'Physical Strike';

  @override
  int calculateDamage(Player target) {
    return baseDamage;
  }
}