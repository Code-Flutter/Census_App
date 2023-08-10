import 'package:Census/database/database.dart';
import 'package:flutter/material.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HouseHolds registered'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: FutureBuilder(
          future: DatabaseService().fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>> householdData) {
            if (householdData.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Display loading indicator while waiting
            }

            if (householdData.hasError) {
              return Text('Error: ${householdData.error}');
            }

            if (!householdData.hasData) {
              return Text('No data available');
            }

            List<Map<String, dynamic>>? householdRecords = householdData.data;

            return ListView.builder(
              itemCount: householdRecords?.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> record = householdRecords![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: Colors.amberAccent[100], // Off-white color
                      elevation: 1, // No shadow
                      margin: EdgeInsets.all(0), // No margin
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('HouseHold ID',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(
                              '${record["HouseHold ID"]}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 12),
                            Text('HouseHold Head',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(
                              '${record["Head of HouseHold"]}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 12),
                            Text('Village',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(
                              '${record["Village"]}',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    size: 25.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.delete,
                                    size: 25.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0)
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
