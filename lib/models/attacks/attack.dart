import 'package:rpg/models/entities/damageable.dart';

abstract class Attack {
  String get name;
  int calculateDamage(Damageable target);
}
