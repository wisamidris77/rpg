import 'package:flutter/material.dart';
import '../models/entities/interfaces/damageable.dart';
import '../engine/combat_engine.dart';
import '../models/attacks/physical_attack.dart';
import '../models/attacks/fire_attack.dart';

class BattleScreen extends StatefulWidget {
  final CombatEngine engine;

  const BattleScreen({super.key, required this.engine});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  final _sword = PhysicalAttack(baseDamage: 15);
  final _fireball = FireAttack(baseDamage: 10);

  void _playerAttack(Damageable target, var attack) {
    setState(() {
      widget.engine.executeAttack(target, attack);
    });
  }

  void _endTurn() {
    setState(() {
      widget.engine.endTurn();
      
      // Basic enemy AI: Enemies hit back automatically when you end your turn
      for (var enemy in widget.engine.enemies) {
        if (!enemy.isDead && !widget.engine.player.isDead) {
          widget.engine.executeAttack(widget.engine.player, _sword);
        }
      }
    });
  }

  // Widget to display a character, their HP bar, and their status effects
  Widget _buildCharacterCard(Damageable entity, {bool isPlayer = false}) {
    return Card(
      color: entity.isDead ? Colors.grey[800] : (isPlayer ? Colors.blue[900] : Colors.red[900]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              entity.name, 
              style: TextStyle(
                fontSize: isPlayer ? 24 : 20, 
                color: Colors.white,
                decoration: entity.isDead ? TextDecoration.lineThrough : null,
              )
            ),
            const SizedBox(height: 8),
            Text(
              'HP: ${entity.health} / ${entity.maxHealth}',
              style: const TextStyle(fontSize: 18, color: Colors.greenAccent),
            ),
            const SizedBox(height: 8),
            // Render active status effects (like Burning)
            Wrap(
              spacing: 4,
              children: entity.activeEffects.map((effect) => Chip(
                label: Text('${effect.name} (${effect.remainingTurns})', style: const TextStyle(fontSize: 12)),
                backgroundColor: Colors.orange,
              )).toList(),
            ),
            if (!isPlayer && !entity.isDead) ...[
              const Divider(color: Colors.white54),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.colorize, color: Colors.grey),
                    onPressed: () => _playerAttack(entity, _sword),
                    tooltip: 'Sword Attack',
                  ),
                  IconButton(
                    icon: const Icon(Icons.local_fire_department, color: Colors.orange),
                    onPressed: () => _playerAttack(entity, _fireball),
                    tooltip: 'Fireball',
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Turn: ${widget.engine.turnCount}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TOP: Enemies Area
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.engine.enemies.map((e) => Center(child: _buildCharacterCard(e))).toList(),
              ),
            ),
            
            // MIDDLE: Battle Log / Game Over text
            if (widget.engine.isGameOver)
              Text(
                widget.engine.player.isDead ? "DEFEAT" : "VICTORY",
                style: const TextStyle(fontSize: 40, color: Colors.amber, fontWeight: FontWeight.bold),
              ),

            // BOTTOM: Player Area and Turn Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: _buildCharacterCard(widget.engine.player, isPlayer: true)),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  ),
                  onPressed: widget.engine.isGameOver ? null : _endTurn,
                  child: const Text('END TURN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}