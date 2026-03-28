import 'package:rpg/models/entities/damageable.dart';
import 'package:rpg/models/entities/player.dart';

abstract class Attack {
  String get name;
  int calculateDamage(Damageable target);
}
