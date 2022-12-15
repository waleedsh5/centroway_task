import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Helpers/AssetHelper.dart';

class DiscountList extends StatelessWidget {
  const DiscountList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 77.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                margin: EdgeInsetsDirectional.only(
                  start: 16.w,
                ),
                alignment: AlignmentDirectional.center,
                width: 343.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70,
                    border: Border.all(
                        width: 1, color: Colors.grey.shade300)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child:
                            SvgPicture.asset(AssetHelper.sale)),
                    const Expanded(
                        flex: 4,
                        child: Text(
                          "15% discount for a week on meals price ",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
          itemCount: 5),
    );
  }
}