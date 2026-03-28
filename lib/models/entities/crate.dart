import 'damageable.dart';

class WoodenCrate implements Damageable {
  @override
  final String name = "Wooden Crate";
  
  @override
  int health = 10;
  
  @override
  final int maxHealth = 10;

  @override
  bool get isDead => health <= 0;
}