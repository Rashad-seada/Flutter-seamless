import 'package:Mawthoq/core/views/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/views/widgets/custom_page_indicator.dart';

class DetailsImageSlider extends StatefulWidget {
  List<String> imageUrls;
  DetailsImageSlider({super.key,required this.imageUrls});

  @override
  State<DetailsImageSlider> createState() => _DetailsImageSliderState();
}

class _DetailsImageSliderState extends State<DetailsImageSlider> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 35.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int){
              setState(() {
                index = int;
              });
            },
            children: List.generate(widget.imageUrls.length, (index) => CustomNetworkImage(
              fit: BoxFit.cover,

              url: widget.imageUrls[index],),),
          ),

          Positioned(
              bottom: 2.h,
              child: CustomPageIndicator(
                count: widget.imageUrls.length,
                index: index,
              )
          ),

        ],
      ),
    );
  }
}
