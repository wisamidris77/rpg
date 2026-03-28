import 'interfaces/playable.dart';
import '../combat/combat_rules.dart';

class Player implements Playable {
  @override
  final String id = 'player_1'; // Hardcoded for now, normally generated

  @override
  final String name;
  
  @override
  int health;
  
  @override
  final int maxHealth;

  @override
  int level = 1;

  @override
  int experience = 0;

  Player({
    required this.name, 
    this.health = 100, 
    this.maxHealth = 100, 
  });

  @override
  bool get isDead => health <= 0;

  @override
  List<StatusEffect> activeEffects = [];

  @override
  Map<Element, double> get resistances => {}; 

  @override
  void gainExperience(int amount) {
    experience += amount;
    print('$name gained $amount XP!');
    // Add level-up math here later
  }
}