import 'package:flutter/material.dart';
import '../models/player.dart';
import '../engine/combat_engine.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  final Player _player = Player(name: 'Knight');
  final CombatEngine _engine = CombatEngine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(title: const Text('RPG Battle Engine')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _player.name, 
              style: const TextStyle(fontSize: 32, color: Colors.white)
            ),
            const SizedBox(height: 20),
            Text(
              'HP: ${_player.health} / ${_player.maxHealth}',
              style: TextStyle(
                fontSize: 24, 
                color: _player.isDead ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _player.isDead ? null : () {
                setState(() {
                  _engine.takeDamage(_player, 25);
                });
              },
              child: const Text('Take 25 Damage', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}