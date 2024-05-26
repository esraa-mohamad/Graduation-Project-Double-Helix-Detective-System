import 'package:double_helix_detective_system/app/di.dart';
import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/routes_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/strings_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/services_presented/viewmodel/service_presented_viewmodel.dart';
import 'package:double_helix_detective_system/presentation/widget/custom_card_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({super.key});

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {

  // final AppPreferences _appPreferences=instance<AppPreferences>();
  final ServicePresentedViewModel _viewModel =
      instance<ServicePresentedViewModel>();

  bind() {
    _viewModel.isUserLogoutStreamController.stream
        .listen((isAddedSuccessfully) {
      if (isAddedSuccessfully) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(RoutesManager.loginRoute);
        });
      }
    });
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(AppStrings.service),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: 20,
                child: IconButton(
                    onPressed: () {
                      _viewModel.logout();
                      // _appPreferences.clearUserData();
                      // Navigator.pushNamedAndRemoveUntil(context, RoutesManager.loginRoute, (route) => false);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: ColorManager.primary,
                    )),
              ),
            )
          ],
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
                    route: RoutesManager.chooseIdentificationCase,
                    image: AssetsImageManager.crimeIcon,
                    caseState: AppStrings.identification,
                    ),
                CustomCardService(
                  route: RoutesManager.missingPersonFormRoute,
                  image: AssetsImageManager.missingIcon,
                  caseState: AppStrings.missing,
                ),
                CustomCardService(
                  route: RoutesManager.paternityFormRoute,
                  image: AssetsImageManager.paternityIcon,
                  caseState: AppStrings.paternity,
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
