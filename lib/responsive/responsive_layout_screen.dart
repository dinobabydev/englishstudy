import 'package:englishstudy/utils/global_variable.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth > webScreenSize){
            return widget.webScreenLayout;
          }
          return widget.mobileScreenLayout;
        }
    );
  }
}
