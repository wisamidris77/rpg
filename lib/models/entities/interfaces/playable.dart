import 'package:rpg/models/entities/interfaces/damageable.dart';

abstract interface class Playable implements Damageable {
  int get level;
  int get experience;
  
  void gainExperience(int amount);
}