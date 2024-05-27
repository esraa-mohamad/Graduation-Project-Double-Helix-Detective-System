
import 'package:double_helix_detective_system/presentation/resource/assets_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/color_manager.dart';
import 'package:double_helix_detective_system/presentation/resource/values_manager.dart';
import 'package:flutter/material.dart';

import '../resource/strings_manager.dart';

class UploadDnaFile extends StatefulWidget {
  const UploadDnaFile({

    required this.child,
    required this.onTap,
    super.key
  });

  final void Function() onTap;
  final Widget child ;

  @override
  State<UploadDnaFile> createState() => _UploadDnaFileState();

}

class _UploadDnaFileState extends State<UploadDnaFile> {

  bool focus = true;


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        setState(() {
          focus = !focus;
        });
      },
      child: Container(
        height: AppSize.s60,
        padding: const EdgeInsets.only(left: AppPadding.p8 , right: AppPadding.p8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s14),
          border: Border.all(
            width: 1.5,
            color: focus ? ColorManager.gray : ColorManager.primary,
          )
        ),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                  child: Text(
                    AppStrings.dnaPerson,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
              ),
              Flexible(
                flex: 1,
                  child: widget.child,
                  ),
              Flexible(
                flex: 1,
                child: Image.asset(AssetsImageManager.iconDna , color: ColorManager.primary,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
