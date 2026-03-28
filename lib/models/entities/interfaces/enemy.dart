import 'package:rpg/models/entities/interfaces/damageable.dart';

abstract interface class Enemy implements Damageable {
  int get xpReward; 
}