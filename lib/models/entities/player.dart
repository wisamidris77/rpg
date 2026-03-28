import 'package:rpg/models/entities/damageable.dart';

class Player implements Damageable {
@override
  final String name;
  
  @override
  int health;
  
  @override
  final int maxHealth;

  Player({
    required this.name, 
    this.health = 100, 
    this.maxHealth = 100, 
  });

  @override
  bool get isDead => health <= 0;
}