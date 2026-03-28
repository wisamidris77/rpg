import 'package:flutter/material.dart';
import '../models/entities/player.dart';
import '../engine/combat_engine.dart';
import '../models/attacks/physical_attack.dart';
import '../models/attacks/fire_attack.dart';

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
      appBar: AppBar(title: const Text('RPG: OCP Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_player.name, style: const TextStyle(fontSize: 32, color: Colors.white)),
            const SizedBox(height: 20),
            Text(
              'HP: ${_player.health} / ${_player.maxHealth}',
              style: TextStyle(
                fontSize: 24, 
                color: _player.isDead ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 40),
            
            // Button 1: Physical Attack
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              onPressed: _player.isDead ? null : () {
                setState(() {
                  _engine.executeAttack(_player, PhysicalAttack(baseDamage: 15));
                });
              },
              child: const Text('Hit with Sword (15 DMG)', style: TextStyle(color: Colors.white)),
            ),
            
            const SizedBox(height: 10),

            // Button 2: Fire Attack
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              onPressed: _player.isDead ? null : () {
                setState(() {
                  _engine.executeAttack(_player, FireAttack(baseDamage: 15));
                });
              },
              child: const Text('Cast Fireball (15+5 DMG)', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}