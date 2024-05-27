import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/widget/custom_card_service.dart';
import 'package:flutter/material.dart';


class ChooseIdentificationView extends StatefulWidget {
  const ChooseIdentificationView({super.key});

  @override
  State<ChooseIdentificationView> createState() => _ChooseIdentificationViewState();
}

class _ChooseIdentificationViewState extends State<ChooseIdentificationView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: const Icon(
                Icons.arrow_back_ios_outlined
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: const Text(AppStrings.chooseIdentification),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(AssetsImageManager.services),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(1),
                  BlendMode.dstIn,
                ),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCardService(
                  route: RoutesManager.searchFormRoute,
                  image: AssetsImageManager.searchIcon,
                  caseState: AppStrings.searchDB,
                ),
                CustomCardService(
                  route: RoutesManager.compareDnaFormRoute,
                  image: AssetsImageManager.compareIcon,
                  caseState: AppStrings.compare,
                ),
              ],
            ),
          ),
        ));
  }
}
