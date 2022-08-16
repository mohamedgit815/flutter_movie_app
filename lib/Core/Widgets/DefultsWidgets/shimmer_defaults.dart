// class ShimmerDefaults {
//
// }
//
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_api_app/Core/app.dart';
import 'package:shimmer/shimmer.dart';

class DefaultsCarouselShimmer extends StatelessWidget {
  const DefaultsCarouselShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: App.color.baseColor ,
        highlightColor: App.color.highlightColor ,
      child: CarouselSlider(
          items: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
            )
          ],
          options: CarouselOptions(
              height: double.infinity ,
              autoPlay: false ,
              reverse: true ,
              autoPlayInterval: const Duration(milliseconds: 2000)
          )
      ),
    );
  }
}


class DefaultPopularShimmer extends StatelessWidget {
  final BoxConstraints constraints;
  const DefaultPopularShimmer({Key? key , required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: App.color.baseColor ,
        highlightColor: App.color.highlightColor ,
      child: ListView.builder(
          scrollDirection: Axis.horizontal ,
          itemCount: 12,
          itemBuilder: (context,i) => Container(
            width: constraints.maxHeight * 0.3 ,
            color: App.color.highlightColor,
            margin: const EdgeInsets.all(10.0) ,
          )),
    );
  }
}
