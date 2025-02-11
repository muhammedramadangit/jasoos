import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jasoos/features/select_category/bloc/select_category_bloc.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';

import 'category_card.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    SelectCategoryBloc bloc = SelectCategoryBloc.instance;
    return GridView.builder(
      itemCount: bloc.model.data!.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          model: bloc.model.data?[index],
        );
      },
    );
  }
}
