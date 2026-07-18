import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_product_card.dart';
import 'package:waheed/core/models/product_model.dart';
import 'package:waheed/views/home/pages/home/components/app_section_header.dart';

class HomeLatestProducts extends StatelessWidget {
  HomeLatestProducts({super.key});

  final List<ProductModel> dummyProducts = [
    ProductModel(
      id: '1',
      title: 'بدلة كلاسيكية سوداء',
      subtitle: 'صوف إيطالي فاخر',
      price: 2450,
      rating: 4.9,
      reviewsCount: 128,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSekjF2FdQcjaWyS7w57TzYG-RoYJ7XQK_CYNvsINN4hg&s',
      tag: 'إيجار',
    ),
    ProductModel(
      id: '2',
      title: 'بدلة كلاسيكية برجاندي',
      subtitle: 'صوف إنجليزي ممتاز',
      price: 3200,
      rating: 4.8,
      reviewsCount: 95,
      image:
          'https://storage.googleapis.com/images_cms_prod_sscom/Park_Avenue_static_app_6c6710ba93/Park_Avenue_static_app_6c6710ba93.png',
      tag: 'شراء',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSectionHeader(title: "أحدث المنتجات", onSeeAllTap: () {}),
        SizedBox(height: 16.h),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return AppProductCard(
                product: dummyProducts[index],
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
