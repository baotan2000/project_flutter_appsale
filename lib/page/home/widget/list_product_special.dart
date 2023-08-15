import 'package:flutter/material.dart';
import 'package:project_appsale/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProductSpecial(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data! as List;
          return snapshot.hasData
              ? ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image(
                        image: NetworkImage('${data[index].image}'),
                      ),
                      title: Text(
                        "${data[index].name}",
                        maxLines: 2,
                      ),
                      subtitle: Text(
                          intl.NumberFormat.simpleCurrency(locale: 'vi')
                              .format(data[index].price)),
                      trailing: Icon(Icons.shopping_cart),
                    );
                  },
                )
              : Center(
                  child: Text("Empty Product"),
                );
        },
      ),
    );
  }
}
