import 'package:flutter/material.dart';
import '../models/entities/player.dart';
import '../models/entities/crate.dart';
import '../models/entities/damageable.dart';
import '../engine/i_combat_engine.dart'; // Import the interface, not the specific engine!
import '../models/attacks/physical_attack.dart';

class BattleScreen extends StatefulWidget {
  final ICombatEngine engine;

  const BattleScreen({super.key, required this.engine});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  final Player _player = Player(name: 'Knight');
  final WoodenCrate _crate = WoodenCrate();
  final PhysicalAttack _sword = PhysicalAttack(baseDamage: 15);

  void _attackTarget(Damageable target) {
    setState(() {
      // 2. Use the injected engine
      widget.engine.executeAttack(target, _sword);
    });
  }

  Widget _buildTargetUI(Damageable target) {
    return Column(
      children: [
        Text(target.name, style: const TextStyle(fontSize: 24, color: Colors.white)),
        Text(
          'HP: ${target.health} / ${target.maxHealth}',
          style: TextStyle(fontSize: 20, color: target.isDead ? Colors.red : Colors.green),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: target.isDead ? null : () => _attackTarget(target),
          child: Text('Hit ${target.name}'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: const Text('RPG: DIP Example')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildTargetUI(_player), _buildTargetUI(_crate)],
        ),
      ),
    );
  }
}
