import 'package:flame/components.dart';

import '../main.dart';

class EnemyCraft extends SpriteComponent with HasGameRef<FlyingCrowGameStart>{
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite =await gameRef.loadSprite('layers/enemy.png');
    size=Vector2(gameRef.size.x/5, gameRef.size.y/5);
    flipHorizontallyAroundCenter();
    position=Vector2(gameRef.size.x*.95, 33);
  }
@override
  void update(double dt){
    super.update(dt);
position.x-=10;

}


}