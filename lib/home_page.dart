import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_fab_scroll_tutorial/hooks/scroll_controller_for_animation.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Scroll"),
      ),
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimController,
        child: ScaleTransition(
          scale: hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text('Useless Floating Action Button'),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            Card(child: FittedBox(child: FlutterLogo())),
        ],
      ),
    );
  }
}
