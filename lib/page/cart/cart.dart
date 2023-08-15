import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

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
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1501162946741-4960f990fdf4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
                      ),
                    ),
                    title: Text("Iphone 15 VIP PRO"),
                    subtitle: Text(
                        intl.NumberFormat.simpleCurrency(locale: 'vi')
                            .format(20000000)),
                    trailing: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        children: [
                          InkWell(onTap: () {}, child: Icon(Icons.remove)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "1",
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
                itemCount: 10),
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
