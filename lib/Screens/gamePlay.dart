import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import '../actors/enemy.dart';
import '../main.dart';

class GamePlayScreen extends Component with HasGameRef<FlyingCrowGameStart>,TapCallbacks{
  Timer interval=Timer(6,repeat: true);
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
    add(gameRef.flyingCrow);
    interval.onTick = () => add(EnemyCraft());


    // add(SpriteComponent(
    //
    //     sprite: await loadSprite('layers/crow.png',srcSize: Vector2(87.5, 100.33), ),
    //     position: size/2,
    //     anchor:Anchor.center));
  }
  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
  }
@override
  bool containsLocalPoint(Vector2 point) {

// return super.containsLocalPoint(point);
return true;


  }
  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    gameRef.gravity.y -= 20;
    print('tap on screen anywhere');
    event.handled = true;
  }

}