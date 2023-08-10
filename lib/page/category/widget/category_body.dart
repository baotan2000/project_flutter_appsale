import 'package:flutter/material.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          footer: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(20)),
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: const Text("Iphone 12"),
              subtitle: Column(
                children: const [
                  Text("lam phuc bao tan dep trai vo doi"),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "50.000 vnd",
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1683997941376-d5bbecbcdae7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80"),
              ),
            ),
          ),
        );
      },
    );
  }
}
