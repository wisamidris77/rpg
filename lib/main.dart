import 'package:flutter/material.dart';
import 'package:rpg/engine/combat_engine.dart';
import 'screens/battle_screen.dart';

void main() {
  final standardEngine = CombatEngine();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: BattleScreen(engine: standardEngine)));
}
