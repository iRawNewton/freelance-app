import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/presentation/global/category_list/category.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import '../../../../models/home_model.dart';
import '../../../../resources/constants/colors.dart';

class ServiceCircle extends StatefulWidget {
  const ServiceCircle({super.key, required this.serviceCategory});

  final List<Category?> serviceCategory;

  @override
  State<ServiceCircle> createState() => _ServiceCircleState();
}

class _ServiceCircleState extends State<ServiceCircle> {
  String link =
      'https://freelancer-app.kyptronixllp.co.in/assets/images/category';

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;

    return SizedBox(
      width: x,
      height: 120.0,
      child: ListView.builder(
        itemCount: widget.serviceCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateToPage(context,
                  CategoryPage(id: widget.serviceCategory[index]!.categoryId));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 7.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 37.0,
                    backgroundColor: Colors.grey.shade400,
                    child: CircleAvatar(
                      backgroundColor: CustomColors.accentColor2,
                      minRadius: 35.0,
                      child: SizedBox(
                        height: 40.0,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SvgPicture.network(
                            '$link/${widget.serviceCategory[index]!.categoryImage}',
                            colorFilter: const ColorFilter.mode(
                              CustomColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    widget.serviceCategory[index]!.categoryName,
                    style: TextStyle(
                      fontSize: x * 0.03,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
