import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/styles.dart';
import '../../../helper/text_styles.dart';
import '../bloc/select_category_bloc.dart';
import '../model/categories_model.dart';

class CategoryCard extends StatefulWidget {
  final CategoryInfo? model;
  const CategoryCard({super.key, this.model});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    SelectCategoryBloc bloc = SelectCategoryBloc.instance;
    return GestureDetector(
      onTap: () {
        isSelected = !isSelected;
        if(isSelected == false) {
          bloc.categories.remove(widget.model?.id);
        } else {
          bloc.categories.add(widget.model!.id!);
        }
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isSelected == true ? Styles.HIGHLIGHT_COLOR : Styles.FILL_COLOR,
          border: Border.all(color: isSelected == true ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                border: Border.all(color: isSelected == true ? Styles.PRIMARY_COLOR : Styles.BORDER_COLOR),
                shape: BoxShape.circle,
                color: isSelected == true
                    ? Styles.WHITE_COLOR
                    : null,
              ),
              child: Center(
                child: Image.network(
                  widget.model?.image ?? "",
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              widget.model?.name ?? "",
              style: AppTextStyles.w400.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
