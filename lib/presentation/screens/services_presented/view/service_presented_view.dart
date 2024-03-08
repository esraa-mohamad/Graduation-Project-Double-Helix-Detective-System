import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.service),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: ColorManager.primary,
              radius: 20,
            ),
          )
        ],
      ),
      body:Center(
        child:
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(AssetsManager.services),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1),
                BlendMode.dstIn,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered1 = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered1 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,RoutesManager.identificationFormRoute);
                  },
                  child: Container(
                    width: AppSize.s250,
                    height: AppSize.s250,
                    decoration: BoxDecoration(
                      color: isHovered1
                          ? null
                          : ColorManager.lightBlue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                      image: isHovered1
                          ? const DecorationImage(
                        image: AssetImage(AssetsManager.crimeIcon),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: Center(
                      child:isHovered1? null : Text(
                        AppStrings.identification,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered2 = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered2 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,RoutesManager.missingPersonFormRoute);
                  },
                  child: Container(
                    width: AppSize.s250,
                    height: AppSize.s250,
                    decoration: BoxDecoration(
                      color: isHovered2
                          ? null
                          : ColorManager.lightBlue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                      image: isHovered2
                          ? const DecorationImage(
                        image: AssetImage(AssetsManager.missingIcon),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: Center(
                      child: isHovered2? null :Text(
                        AppStrings.missing,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHovered3 = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHovered3 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,RoutesManager.paternityFormRoute);
                  },
                  child: Container(
                    width: AppSize.s250,
                    height: AppSize.s250,
                    decoration: BoxDecoration(
                      color: isHovered3
                          ? null
                          : ColorManager.lightBlue.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                      image: isHovered3
                          ? const DecorationImage(
                        image: AssetImage(AssetsManager.paternityIcon),
                        fit: BoxFit.cover,
                      )
                          : null,
                    ),
                    child: Center(
                      child: isHovered3? null :Text(
                        AppStrings.paternity,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
