import 'package:flutter/material.dart';

class ListProductSpecial extends StatelessWidget {
  const ListProductSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.separated(
        itemCount: 50,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80'),
            ),
            title: Text(
              "Iphone 14 PRO MAX",
              maxLines: 2,
            ),
            subtitle: Text("200.000vnd"),
            trailing: Icon(Icons.shopping_cart),
          );
        },
      ),
    );
  }
}
