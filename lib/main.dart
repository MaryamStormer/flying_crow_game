import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(GameWidget(game: FlyingCrowGameStart()));
}

class FlyingCrowGameStart extends FlameGame {
  late SpriteAnimationComponent crowFlying;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    ParallaxComponent flyingCrowBackground = await loadParallaxComponent(
      [
        ParallaxImageData('layers/sky.png'),
        ParallaxImageData('layers/clouds_bg.png'),
        ParallaxImageData('layers/glacial_mountains_lightened.png'),
        ParallaxImageData('layers/glacial_mountains.png'),
        ParallaxImageData('layers/cloud_lonely.png'),
        ParallaxImageData('layers/clouds_mg_3.png'),
        ParallaxImageData('layers/clouds_mg_2.png'),
        ParallaxImageData('layers/clouds_mg_1.png'),


      ],
      baseVelocity: Vector2(5, 0),
      velocityMultiplierDelta: Vector2(1.6, 1.0),

    );
    add(flyingCrowBackground);
    final flyingCrowAnimation= await loadSpriteAnimation('layers/crow.png', SpriteAnimationData.sequenced(amount: 12, stepTime: 0.1,
          amountPerRow: 4,
          textureSize:  Vector2(87.5, 100.33),));
    crowFlying= SpriteAnimationComponent(animation:flyingCrowAnimation );
    add(SpriteComponent(

        sprite: await loadSprite('layers/crow.png',srcSize: Vector2(87.5, 100.33), ),
        position: size/2,
        anchor:Anchor.center));
  }
}
