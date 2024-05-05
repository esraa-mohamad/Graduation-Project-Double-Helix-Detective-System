
import 'package:double_helix_detective_system/app/di.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:double_helix_detective_system/presentation/screens/services_presented/viewmodel/service_presented_viewmodel.dart';
import 'package:flutter/material.dart';

class CustomCardService extends StatefulWidget {
  const CustomCardService({
    super.key,
    required this.route,
    required this.image,
    required this.caseState,
  });

  final String route;
  final String image;
  final String caseState;

  @override
  State<CustomCardService> createState() => _CustomCardServiceState();
}

class _CustomCardServiceState extends State<CustomCardService> {
  final ServicePresentedViewModel _viewModel =
      instance<ServicePresentedViewModel>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _viewModel.isHovered,
      builder: (context, snapshot) {
        bool isHovered = snapshot.data ?? false;
        return MouseRegion(
          onEnter:(_) => _viewModel.onEnter(),
          onExit:(_) => _viewModel.onExit(),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widget.route);
            },
            child: Container(
              width: AppSize.s300,
              height: AppSize.s300,
              decoration: BoxDecoration(
                color:
                    isHovered ? null : ColorManager.lightBlue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
                image: isHovered
                    ? DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Center(
                child: isHovered
                    ? null
                    : Text(
                        widget.caseState,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
              ),
            ),
          ),
        );
      },
      initialData: false,
    );
  }
}
