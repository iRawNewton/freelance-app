import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import '../../../user/stats/freelance_posted/views/product_view.dart';
import '../../../../models/category_model.dart';
import '../../../../resources/constants/strings.dart';
import '../../../../resources/widgets/appbar.dart';
import '../../../../services/get_remote_services.dart';
import '../../../global/category_list/views/products_list.dart';

class ServiceSearchResult extends StatefulWidget {
  const ServiceSearchResult({super.key, required this.searchKeyword});
  final String searchKeyword;
  @override
  State<ServiceSearchResult> createState() => _ServiceSearchResultState();
}

class _ServiceSearchResultState extends State<ServiceSearchResult> {
  bool loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String totalProducts = '';
  List<Project> projectsList = [];
  bool isVisible = true;
  Future<CategoryModel?>? futureVariable;
  bool isLoading = false;

  Future<CategoryModel?> categoryProductList() async {
    CategoryModel? response = await GetRemoteService()
        .getProductsFromSearchKeyword(widget.searchKeyword);
    // stats/freelance_stat.php

    setState(() {
      totalProducts = response!.totalCount;
      projectsList = response.projects;
      (response.totalCount == '0') ? isVisible = false : isVisible = true;
    });

    return response;
  }

  @override
  void initState() {
    setState(() {
      futureVariable = categoryProductList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.searchKeyword),
        ),
        key: _scaffoldKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            JobAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(20.0),

                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: CustomText(
                //     title: 'Your Products',
                //     size: 24.0,
                //     color: Colors.black,
                //     weight: FontWeight.w500,
                //   ),
                // ),
                FutureBuilder(
                  future: futureVariable,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: projectsList.length,
                          itemBuilder: (context, index) {
                            // return Text(projectsList[index].categoryName);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Column(
                                children: [
                                  ProductPostedView(
                                    productId: projectsList[index].projectId,
                                    imgUrl:
                                        '$productImage${projectsList[index].images.gallery1}',
                                    category: projectsList[index].categoryName,
                                    title: projectsList[index].projectTitle,
                                    user:
                                        '${projectsList[index].firstName} ${projectsList[index].lastName}',
                                    price: '29',
                                  ),
                                  const Gap(20.0),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return Column(
                          children: [
                            Lottie.asset(
                              'lib/resources/assets/animations/nothing_found.json',
                            ),
                            const CustomText(
                              title: 'No data found!',
                              size: 16.0,
                              color: Colors.black87,
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const ProductListLoading();
                    } else {
                      return const Center(
                        child: Text('Oops something went wrong!'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
