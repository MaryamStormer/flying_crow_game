import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../main.dart';

class EnemyCraft extends SpriteComponent with HasGameRef<FlyingCrowGameStart> {
  EnemyCraft():super(){
    // debugMode=true;
  }
  final _random= Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('layers/enemy.png');
    size = Vector2(gameRef.size.x / 5, gameRef.size.y / 5);
    flipHorizontallyAroundCenter();
    var yPosition=_random.nextDouble()* gameRef.size.y;
    position = Vector2(gameRef.size.x * .95, yPosition);
    add(CircleHitbox(anchor: Anchor.center, radius: size.y*.35,position: size/2));
  }

  @override
  void update(double dt) {
    super.update(dt);

    if(position.x>0 && !gameRef.gameOver)
      {
        position.x -= 4;
      }
    else{
      removeFromParent();
    }
  }
}
