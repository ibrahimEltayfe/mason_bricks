import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qr_voucher/core/extensions/mediaquery_size.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';

class LogoContainer extends StatelessWidget {
  const LogoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.6,
      width: context.width,
      clipBehavior: Clip.hardEdge,
      decoration: getBottomRoundedBoxDecoration(),

      child: Column(
        children: [
          SizedBox(height: 40,),

          //logo
          SizedBox(
            height: 275,
            width: 350,
            child: Placeholder(),
          ),

          Spacer(),

          _LoginRegisterSwitcher()
        ],
      ),
    );
  }
}

class _LoginRegisterSwitcher extends HookWidget {
  const _LoginRegisterSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animController = useAnimationController(
        duration: Duration(milliseconds: 380)
    );

    final tweenAnim = useAnimation(
        Tween<double>(
           begin: 96.0,
           end: -90.0
        ).animate(animController)
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: context.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  if(animController.isAnimating){
                    return;
                  }
                  if(animController.isDismissed || tweenAnim == -90){
                    animController.forward();
                  }else{
                    animController.reverse();
                  }
                },
                child: Text(
                    AppStrings.register,
                    style: getBoldTextStyle(fontSize: 22)
                ),
              ),

              const SizedBox(width: 128,),

              GestureDetector(
                onTap: (){
                  if(animController.isAnimating || tweenAnim == 96){
                    return;
                  }

                  if(animController.isDismissed){
                    animController.forward();
                  }else{
                    animController.reverse();
                  }
                },
                child: Text(
                  AppStrings.login,
                  style: getBoldTextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 4,),

        AnimatedBuilder(
          animation: animController,
          builder: (context,child) {
            return Transform.translate(
              offset: Offset(tweenAnim,0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.semiBlack,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                height: 3.5,
                width: 85,
              ),
            );
          }
        )
      ],
    );
  }
}