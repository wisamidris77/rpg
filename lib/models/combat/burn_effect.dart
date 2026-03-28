import 'combat_rules.dart';
import '../entities/interfaces/damageable.dart';

class BurnEffect implements StatusEffect {
  @override
  final String name = "Burning";
  
  @override
  int remainingTurns;
  
  final int damagePerTurn;

  BurnEffect({this.remainingTurns = 3, this.damagePerTurn = 5});

  @override
  void onTurnEnd(Damageable target) {
    if (remainingTurns <= 0) return;
    
    target.health -= damagePerTurn;
    if (target.health < 0) target.health = 0;
    
    remainingTurns--;
    print('${target.name} takes $damagePerTurn fire damage from burning! ($remainingTurns turns left)');
  }
}