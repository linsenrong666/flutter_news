import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/entities.dart';
import '../../common/values/values.dart';

Widget newsCategoriesWidget({
  required List<CategoryResponseEntity> categories,
  required String selCategoryCode,
  required Function(CategoryResponseEntity) onTap,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: categories.map<Widget>((item) {
        return Container(
          alignment: Alignment.center,
          height: 52.h,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            child: Text(
              item.title,
              style: TextStyle(
                color: selCategoryCode == item.code
                    ? AppColors.secondaryElementText
                    : AppColors.primaryText,
                fontSize:18.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () => onTap(item),
          ),
        );
      }).toList(),
    ),
  );
}
