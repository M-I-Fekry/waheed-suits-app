import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_category_card.dart';
import 'package:waheed/views/home/pages/home/components/app_section_header.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key});

  final List<Map<String, String>> categories = [
    {'title': 'بدلات', 'icon': 'suit.svg'},
    {'title': 'قمصان', 'icon': 'shirt.svg'},
    {'title': 'اكسسوارات', 'icon': 'tie.svg'},
    {'title': 'أحذية', 'icon': 'shoes.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSectionHeader(title: "تسوق حسب التصنيف", onSeeAllTap: () {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 3.2,
            ),
            itemBuilder: (context, index) {
              return AppCategoryCard(
                title: categories[index]['title']!,
                icon: categories[index]['icon']!,
                onTap: () {
                  print("تم الضغط على: ${categories[index]['title']}");
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
