import 'package:rpg/models/entities/interfaces/damageable.dart';

enum Element { physical, fire, ice, poison }

abstract class StatusEffect {
  String get name;
  int get remainingTurns;
  
  void onTurnEnd(Damageable target); 
}