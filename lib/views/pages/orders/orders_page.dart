import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodiego/core/app_text_styles.dart';
import 'package:provider/provider.dart';

import 'controller/categories_controller.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  void initState() {
    Future.microtask(() =>
        Provider.of<CategoryController>(context, listen: false).fetchCategories());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Consumer<CategoryController>(
        builder: (context, controller, child) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }
          if (controller.categories == null || controller.categories!.isEmpty) {
            return Center(child: Text("No categories available"));
          }
          return ListView.builder(
            itemCount: controller.categories!.length,
            itemBuilder: (context, index) {
              final category = controller.categories![index];
              return
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row (
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black
                            )
                          ),
                          child: CachedNetworkImage(imageUrl: category.strCategoryThumb ?? ''))),
                      Expanded(
                        flex: 2,
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(category.strCategory ?? '', style: AppTextStyles.heading3,),
                            Text(category.strCategoryDescription ?? '', style: AppTextStyles.caption,
                            maxLines: 2, overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      )
                    ],
                  ),
                );
                ListTile(
                leading: Container(
                    color: Colors.red,
                    child: CachedNetworkImage(imageUrl:category.strCategoryThumb ?? '',)),
                title: Text(category.strCategory ?? ''),
                subtitle: Text(category.strCategoryDescription ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
