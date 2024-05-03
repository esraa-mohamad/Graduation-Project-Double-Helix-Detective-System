
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class CustomCardService extends StatelessWidget {
  const CustomCardService({super.key, required this.route, required this.image, required this.caseState, required this.onEnter, required this.onExit, required this.isHover});
  final void Function(PointerEnterEvent) onEnter;
  final void Function(PointerExitEvent) onExit;
  final String route;
  final bool isHover;
  final String image;
  final String caseState;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context,route);
        },
        child: Container(
          width: AppSize.s250,
          height: AppSize.s250,
          decoration: BoxDecoration(
            color: isHover
                ? null
                : ColorManager.lightBlue.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
            image: isHover
                ?  DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )
                : null,
          ),
          child: Center(
            child:isHover? null : Text(
              caseState,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
