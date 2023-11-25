import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter/services.dart';
import 'package:flying_crow_game/Screens/gameEndScreen.dart';
import 'Screens/gamePlay.dart';
import 'Screens/gameStartScreen.dart';
import 'actors/enemy.dart';
import 'actors/flyingCrow.dart';

void main() {
  runApp(GameWidget(game: FlyingCrowGameStart()));
}

class FlyingCrowGameStart extends FlameGame with TapCallbacks,HasCollisionDetection{
  late final RouterComponent router;
bool gameOver=false;
bool showingGameOverScreen=false;
  Vector2 gravity = Vector2(0, 30);
  FlyingCrow flyingCrow = FlyingCrow();

 @override
  Future<void> onLoad() async {
   await super.onLoad();
   add(router =RouterComponent(initialRoute: 'gameStart', routes: {
     'gameStart': Route(GameStartScreen.new),
     'gamePlay': Route(GamePlayScreen.new),
     'gameEnd': Route(GameEndScreen.new)}));


   SystemChrome.setPreferredOrientations([
     DeviceOrientation.landscapeRight,
     DeviceOrientation.landscapeLeft,
   ]);
 }

@override
  void update(double dt){
  super.update(dt);
if(gameOver && !showingGameOverScreen)
  {
    router.pushNamed('gameEnd');
    showingGameOverScreen=true;
  }
 }
  // @override
  // void onTapDown(TapDownEvent event) {
  //   super.onTapDown(event);
  //   gravity.y-=20;
  //   print('main');
  //   event.handled = true;
  // }


}
