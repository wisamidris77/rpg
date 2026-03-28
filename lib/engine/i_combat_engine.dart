import '../models/entities/damageable.dart';
import '../models/attacks/attack.dart';

abstract class ICombatEngine {
  void executeAttack(Damageable target, Attack attack);
}
