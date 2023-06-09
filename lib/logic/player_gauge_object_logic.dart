import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player_object_logic.dart';

class PlayerGauge extends PositionComponent {
  double healthLeft = 1.0;

  @override
  FutureOr<void> onLoad() {
    final playerParent = parent;
    if (playerParent is Player) {
      width = playerParent.width;
      height = 10;
      anchor = Anchor.centerLeft;
      position = Vector2(0, 0);
    }
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
        Rect.fromPoints(
          const Offset(0, 0),
          Offset(width, height),
        ),
        Paint()..color = Colors.white);
    canvas.drawRect(
        Rect.fromPoints(
          const Offset(0, 0),
          Offset(width * healthLeft, height),
        ),
        Paint()
          ..color = healthLeft > 0.5
              ? Colors.green
              : healthLeft > 0.25
                  ? Colors.orange
                  : Colors.red);
  }
}
