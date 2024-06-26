import 'package:afc_assignment/config/routes/app_route.dart';
import 'package:afc_assignment/module/controller/data_controller.dart';
import 'package:afc_assignment/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearch extends SearchDelegate {
  DataController data = Get.find();
  var list = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (list.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
            data.searchData.value.products!.clear();
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (data.searchData.value.products == null) {
      return const Center(
        child: Text("Please write something..."),
      );
    }
    return Obx(
      () => data.searchLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data.searchData.value.products!.isEmpty
              ? const Center(
                  child: Text("No Results Found"),
                )
              : Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: data.searchData.value.products!.length,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.66,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx, index) {
                          final item = data.searchData.value.products![index];
                          return ProductItem(
                            item: item,
                            press: () {
                              Get.toNamed(AppRoute.detailsPage,
                                  arguments: item.id);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    list = query.isEmpty
        ? []
        : data.productData.value.products!
            .where((p) => p.name!.isCaseInsensitiveContains(query))
            .toList();
    return Column(
      children: [
        if (query.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${list.length} Result(s) found",
              // style: kMediumTextStyle.copyWith(color: kLightText),
            ),
          ),
        Expanded(
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (ctx, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(10),
                horizontalTitleGap: 10,
                title: Text(
                  list[index].name.toString().capitalize!,
                  // style: TextStyle(font),
                ),
                trailing: const Icon(Icons.search),
                onTap: () async {
                  data.searchProduct(type: list[index].name);

                  Get.offAndToNamed(AppRoute.searchPage);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
