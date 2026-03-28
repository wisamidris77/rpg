class Player {
  final String name;
  int health;
  int maxHealth;

  Player({
    required this.name, 
    this.health = 100, 
    this.maxHealth = 100, 
  });

  bool get isDead => health <= 0;
}