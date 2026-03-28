import '../models/entities/interfaces/damageable.dart';
import '../models/attacks/attack.dart';
import 'i_combat_engine.dart';

class CombatEngine implements ICombatEngine {
  final Damageable player;
  final List<Damageable> enemies;
  int turnCount = 1;

  CombatEngine({required this.player, required this.enemies});

  List<Damageable> get allCombatants => [player, ...enemies].where((e) => !e.isDead).toList();

  bool get isGameOver => player.isDead || enemies.every((e) => e.isDead);

  @override
  void executeAttack(Damageable target, Attack attack) {
    if (target.isDead) return;

    int rawDamage = attack.calculateBaseDamage(target);
    double multiplier = target.getDamageMultiplier(attack.element);
    int finalDamage = (rawDamage * multiplier).toInt();
    
    target.health -= finalDamage;
    if (target.health < 0) target.health = 0;

    if (multiplier > 0) {
      target.activeEffects.addAll(attack.secondaryEffects);
    }
  }

  void endTurn() {
    if (isGameOver) return;

    for (var entity in allCombatants) {
      for (var effect in entity.activeEffects) {
        effect.onTurnEnd(entity);
      }
      
      entity.activeEffects.removeWhere((effect) => effect.remainingTurns <= 0);
    }
    
    turnCount++;
  }
}