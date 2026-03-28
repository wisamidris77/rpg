import '../models/entities/interfaces/damageable.dart';
import '../models/attacks/attack.dart';

abstract class ICombatEngine {
  void executeAttack(Damageable target, Attack attack);
}
