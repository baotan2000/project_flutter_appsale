import 'package:flutter/material.dart';
import 'package:project_appsale/models/category_model.dart';
import 'package:project_appsale/page/category/widget/category.dart';
import 'package:project_appsale/providers/category_provider.dart';
import 'package:provider/provider.dart';

class HomeCategory extends StatefulWidget {
  const HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  late Future categoryFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    categoryFuture = Provider.of<CategoryProvider>(context).getCatgory();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categoryFuture,
      initialData: [],
      builder: (context, asyncData) {
        var categoryData = [];
        if (asyncData.hasData) {
          categoryData = asyncData.data! as List;
        } else {
          return Container(
            child: Text(asyncData.error.toString()),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CategoryPage.routerName,
                      arguments: {
                        "id": categoryData[index].id,
                        "name": categoryData[index].name,
                      });
                },
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black26,
                        image: DecorationImage(
                          image: NetworkImage(categoryData[index].image),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(categoryData[index].name)
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
