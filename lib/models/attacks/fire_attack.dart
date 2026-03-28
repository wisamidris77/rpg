import 'package:rpg/models/player.dart';
import 'attack.dart';

class FireAttack implements Attack {
  final int baseDamage;

  FireAttack({required this.baseDamage});

  @override
  String get name => 'Fireball';

  @override
  int calculateDamage(Player target) {
    return baseDamage + 5;
  }
}