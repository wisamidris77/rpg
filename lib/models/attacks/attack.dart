import 'package:rpg/models/player.dart';

abstract class Attack {
  String get name;
  int calculateDamage(Player target);
}
