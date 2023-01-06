// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/core/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView();
  final _formKey = GlobalKey<FormState>();
  final text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Track Your Weight',
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: text,
                              decoration: InputDecoration(
                                labelText: 'Enter Your Weight Please...',
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Weight';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    FirebaseFirestore.instance
                                        .collection('Products')
                                        .add({
                                      "weightValue": 'dfdf',
                                      "dateTime": DateTime.now().toString(),
                                    });
                                    await controller.getAllWeight();
                                    controller.update();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: const Text('Add Your Weight'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            _tableViewWeights()
                          ],
                        ),
                      )),
                ),
              ),
            ),
    );
  }
}

Widget _tableViewWeights() {
  return GetBuilder<HomeViewModel>(
    builder: (controller) => Container(
        height: 500,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
              columnSpacing: 5,
              horizontalMargin: 15,
              minWidth: 200,
              columns: [
                DataColumn2(
                  label: Text('Weight Value'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Date Time'),
                ),
                DataColumn(
                  label: Text(''),
                ),
                DataColumn(
                  label: Text(''),
                ),
              ],
              rows: List<DataRow>.generate(
                  controller.productModel.length,
                  (index) => DataRow(cells: [
                        DataCell(Text(controller
                                .productModel.length != 0 
                            ? controller.productModel[index].weightValue
                                .toString()
                            : 'please add weight')),
                        DataCell(Text(controller
                                .productModel.length != 0 
                            ? controller.productModel[index].dateTime.toString()
                            : 'No Date Yet')),
                        DataCell(
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('Products')
                                    .doc().delete();
                                await controller.getAllWeight();
                                controller.update();
                              },
                              child: const Text('Delete'),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection('Products')
                                    .add({
                                  "weightValue": "60",
                                  "dateTime": "pepo",
                                });
                                await controller.getAllWeight();
                                controller.update();
                              },
                              child: const Text('update'),
                            ),
                          ),
                        ),
                      ]))),
        )),
  );
}
