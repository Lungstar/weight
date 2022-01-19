
import 'package:flutter/material.dart';
import 'package:flutter_node/UI/get_weight_history.dart';
class EditWeight extends StatefulWidget {
  final dynamic weightData;

  const EditWeight({Key? key, this.weightData}) : super(key: key);

  @override
  _EditWeightState createState() => _EditWeightState();
}

class _EditWeightState extends State<EditWeight> {
  TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    weightController.text = widget.weightData['weight'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Edit weight',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                child: const Text('Update'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeightHistory()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
