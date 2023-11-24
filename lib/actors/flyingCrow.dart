


import 'package:flame/components.dart';
import 'package:flying_crow_game/main.dart';

class FlyingCrow extends SpriteAnimationComponent with HasGameRef<FlyingCrowGameStart>{
  late SpriteAnimationComponent crowFlying;

  @override
  Future<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
     final flyingCrowAnimation = await gameRef.loadSpriteAnimation(
         'layers/crow.png',
         SpriteAnimationData.sequenced(
           amount: 12,
           stepTime: 0.1,
           amountPerRow: 4,
           textureSize: Vector2(87.5, 100.33),));

         animation= flyingCrowAnimation;
         position= gameRef.size / 2;
         anchor= Anchor.center;
         size= Vector2(gameRef.size.y * 87.5 / 100.33, gameRef.size.y) * .5;




  }
  @override
  void update(double dt) {
    super.update(dt);
    if(y < gameRef.size.y && y>0){
      gameRef.gravity.y += .4;
      position += gameRef.gravity * dt;
    }
    else if(!gameRef.showingGameOverScreen)
    {
      gameRef.gameOver=true;

    }
  }


}