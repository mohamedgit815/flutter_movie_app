import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/Utils/app_colors.dart';
import 'package:flutter_architecture_api_app/Core/Utils/app_constance.dart';
import 'package:flutter_architecture_api_app/Core/Utils/const_functions.dart';
import 'package:flutter_architecture_api_app/Core/Utils/navigator.dart';
import 'package:flutter_architecture_api_app/Core/Utils/offline_builder.dart';
import 'package:flutter_architecture_api_app/Core/Widgets/DefultsWidgets/shimmer_defaults.dart';


class App {

  static final AppConstance constance = AppConstance();
  static final AppColor color = AppColor();
  static final AppNavigator navigator = AppNavigator();
  static final AppValidator validator = AppValidator();
  static final AppGeneral general = AppGeneral();


  static AnimatedConditionalBuilder conditional({
    required bool condition ,
    required WidgetBuilder builder ,
    required WidgetBuilder? fallback
  }) {
    return AnimatedConditionalBuilder(
        condition: condition,
        builder: builder,
        fallback: fallback
    );
  }


  /// Shimmer
  static DefaultsCarouselShimmer defaultsCarouselShimmer = const DefaultsCarouselShimmer();
  static DefaultPopularShimmer defaultPopularShimmer(BoxConstraints constraints) {
    return DefaultPopularShimmer(constraints: constraints);
  }

  /// Offline
  static OfflineBuilderScreen offlineBuilderScreen = const OfflineBuilderScreen();
  static OfflineWidget offlineWidget = const OfflineWidget();
}