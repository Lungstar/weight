import 'package:flutter/material.dart';
import 'package:flutter_node/UI/edit_weight.dart';
import 'package:flutter_node/UI/login.dart';
import 'package:flutter_node/core/services/weight_api.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WeightHistory extends StatefulWidget {
  const WeightHistory({Key? key}) : super(key: key);

  @override
  _WeightHistoryState createState() => _WeightHistoryState();
}

class _WeightHistoryState extends State<WeightHistory> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 90,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('User'),
              ),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Weight History',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: Weight.weightDummyData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    key: ValueKey(index),
                    child: ListTile(
                      title: Text(
                          Weight.weightDummyData[index]['name'].toString()),
                      subtitle: Text(
                          Weight.weightDummyData[index]['weight'].toString()),
                      trailing: Text(
                          Weight.weightDummyData[index]['date'].toString()),
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                          onPressed: null,
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                        SlidableAction(
                          flex: 1,
                          onPressed: (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditWeight(
                                      weightData:
                                          Weight.weightDummyData[index]),
                                ));
                          },
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Update',
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
