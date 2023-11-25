import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:flying_crow_game/main.dart';

class GameEndScreen extends Component with HasGameRef<FlyingCrowGameStart> , TapCallbacks{
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(TextComponent(
        text: 'Game Over!',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
            style: const TextStyle(color: Colors.red, fontSize: 64))));
  }
  @override
  bool containsLocalPoint(Vector2 point) => true;
  @override
  void onTapUp(TapUpEvent event) {
    // TODO: implement onTapUp
    super.onTapUp(event);

    gameRef.router.pop();
    gameRef.flyingCrow.position=gameRef.size / 2;
    gameRef.gameOver=false;
    gameRef.showingGameOverScreen=false;
  }


}
