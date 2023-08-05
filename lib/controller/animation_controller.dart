import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAnimationController extends GetxController with GetTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

	void getAnimation(){
			animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
	}


}