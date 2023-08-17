import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:project_appsale/providers/cart_provider.dart';
import 'package:project_appsale/providers/order_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  static const routerName = '/cart';
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 15), child: Text("Loading..."))
      ],
    ),
  );

  void handleAddCart() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alert;
      },
    );
    Future.delayed(Duration(seconds: 2), (() {
      Provider.of<OrderProvider>(context, listen: false)
          .buy(Provider.of<CartProvider>(context, listen: false).items)
          .then((value) => {
                if (value)
                  {
                    Navigator.pop(context),
                    Provider.of<CartProvider>(context, listen: false)
                        .removeItems()
                  }
              });
    }));
    //show thong bao
    //call api
    //remove items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
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
                              InkWell(
                                  onTap: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .decrease(
                                            value.items.keys.toList()[index]);
                                  },
                                  child: const Icon(Icons.remove)),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "${dataItems[index].quantity}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .increase(
                                            value.items.keys.toList()[index]);
                                  },
                                  child: const Icon(Icons.add))
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
                      onPressed: handleAddCart, child: Text("Mua hàng"))))
        ],
      ),
    );
  }
}
