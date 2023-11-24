import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:flying_crow_game/actors/flyingCrow.dart';
import '../actors/enemy.dart';
import '../main.dart';

class GamePlayScreen extends Component with HasGameRef<FlyingCrowGameStart>,TapCallbacks{
  FlyingCrow flyingCrow = FlyingCrow();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    ParallaxComponent flyingCrowBackground = await gameRef
        .loadParallaxComponent(
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
    add(flyingCrow);
    add(EnemyCraft());

    // add(SpriteComponent(
    //
    //     sprite: await loadSprite('layers/crow.png',srcSize: Vector2(87.5, 100.33), ),
    //     position: size/2,
    //     anchor:Anchor.center));
  }
  @override
  void containsLocalPoints(Vector2 point) => true;
  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    gameRef.gravity.y-=20;
  }

}