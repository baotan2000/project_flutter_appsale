import 'package:flutter/material.dart';
import 'package:project_appsale/page/product/widget/product.dart';
import 'package:project_appsale/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  late Future productIncategoryFuture;
  @override
  void didChangeDependencies() {
    final Map<String, dynamic> arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    productIncategoryFuture =
        Provider.of<CategoryProvider>(context).getProductCatgory(arg['id']);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [],
      future: productIncategoryFuture,
      builder: (context, asyncData) {
        List data = [];
        if (asyncData.hasData) {
          data = asyncData.data as List;
        } else {
          return Container(
            child: Text('err'),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, ProductPage.routerName,
                    arguments: {
                      "data": data[index],
                    });
              },
              child: GridTile(
                footer: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(data[index].name),
                    subtitle: Column(
                      children: [
                        Text(data[index].summary),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          data[index].price.toString(),
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    trailing: const Icon(Icons.shopping_cart),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data[index].image),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
