import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flying_crow_game/Screens/gameEndScreen.dart';

import '../main.dart';

class ScrollGame extends FlameGame with HasCollisionDetection, TapCallbacks{
  late final RouterComponent router;
  bool gameOver=false;
  bool displayingGameOverScreen=false;
Vector2 velocity=Vector2(0, 30);

@override
  Future<void> onLoad() async {
    // TODO: implement onLoad
  super.onLoad();
  FlameAudio.bgm.initialize();

add(router=RouterComponent(initialRoute: 'gameStart', routes: {
  'gameStart':Route(FlyingCrowGameStart.new),
  'gameEnd':Route(GameEndScreen.new),
}));
















  }


}