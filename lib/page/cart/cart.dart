import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:project_appsale/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routerName = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Consumer<CartProvider>(
              builder: (context, value, child) {
                var dataItems = value.items.values.toList();
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            '${dataItems[index].image}',
                          ),
                        ),
                        title: Text("${dataItems[index].name}"),
                        subtitle: Text(
                            intl.NumberFormat.simpleCurrency(locale: 'vi')
                                .format(dataItems[index].price)),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Row(
                            children: [
                              InkWell(onTap: () {}, child: Icon(Icons.remove)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "${dataItems[index].quantity}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(onTap: () {}, child: Icon(Icons.add))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: value.items.length);
              },
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {}, child: Text("Mua hàng"))))
        ],
      ),
    );
  }
}
