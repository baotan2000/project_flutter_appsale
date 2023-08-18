import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_appsale/providers/order_provider.dart';
import 'package:provider/provider.dart';

class ListOrder extends StatefulWidget {
  static const routerName = '/listOrder';
  const ListOrder({super.key});

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách đơn hàng'),
      ),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context).getListOrderCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data as List;
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var dataItem = data[index]['order_items'] as List;
                    return ExpansionTile(
                      title: Text('Mã Đơn Hàng: ${data[index]['code']}'),
                      subtitle: Text(DateFormat('kk:mm - dd-MM-yyyy')
                          .format(DateTime.parse(data[index]['created_at']))),
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: dataItem.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("aaaaaa"),
                            );
                          },
                        )
                      ],
                    );
                  },
                )
              : SvgPicture.asset(
                  'assets/svg/no-data.svg',
                  fit: BoxFit.cover,
                );
        },
      ),
    );
  }
}
