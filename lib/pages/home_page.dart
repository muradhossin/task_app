import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import 'package:task_app/models/task_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TaskProvider taskProvider;
  final TextEditingController _nameEnController = TextEditingController();
  final TextEditingController _nameBnController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _orderIdController = TextEditingController();

  String? groupValueSenderType;
  String? groupValueServiceType;
  String? groupValueRequestType;
  String? groupValueHomeDelivery;
  String? groupValuePayer;
  String? groupValuePaymentType;

  @override
  void didChangeDependencies() {
    taskProvider = Provider.of<TaskProvider>(context, listen: true);
    taskProvider.getTaskData();
    getAllData();
    super.didChangeDependencies();
  }

  void getAllData() {
    senderData();
    orderData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Task App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionHeader(context, "Sender Info"),
            buildSectionSenderInfo(),
            buildSectionHeader(context, "Order Request"),
            buildSectionOrderRequest(),
            buildSectionHeader(context, "Charges"),
            buildSectionCharges(),
          ],
        ),
      ),
    );
  }

  Padding buildSectionCharges() {
    final chargeList =
        taskProvider.taskResponse?.consignmentChargesRequestParams;
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: (chargeList != null) ? Column(
              children: chargeList!.map((item) => Column(
                children: [
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Order ID"),
                    subtitle: (item.oid == null ||
                        item.oid == "")
                        ? const Text("Data not found")
                        : Text(item.oid!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Request Type"),
                    subtitle: (item.requestTypeId == null ||
                        item.requestTypeId == "")
                        ? const Text("Data not found")
                        : Text(item.requestTypeId!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Service Type"),
                    subtitle: (item.serviceTypeId == null ||
                        item.requestTypeId == "")
                        ? const Text("Data not found")
                        : Text(item.serviceTypeId!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Category"),
                    subtitle: (item.categoryId == null ||
                        item.categoryId == "")
                        ? const Text("Data not found")
                        : Text(item.categoryId!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Packaging"),
                    subtitle: (item.isPackaging == null ||
                        item.isPackaging == "")
                        ? const Text("Data not found")
                        : Text(item.isPackaging!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Packaging ID"),
                    subtitle: (item.packagingId == null ||
                        item.packagingId == "")
                        ? const Text("Data not found")
                        : Text(item.packagingId!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Volumetric weight"),
                    subtitle: (item.isVolumetricWeight == null ||
                        item.isVolumetricWeight == "")
                        ? const Text("Data not found")
                        : Text(item.isVolumetricWeight!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Length value"),
                    subtitle: (item.lengthValue == null ||
                        item.lengthValue == "")
                        ? const Text("Data not found")
                        : Text(item.lengthValue!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Width value"),
                    subtitle: (item.widthValue == null ||
                      item.widthValue == "")
                        ? const Text("Data not found")
                        : Text(item.widthValue!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Height value"),
                    subtitle: (item.heightValue == null ||
                        item.heightValue == "")
                        ? const Text("Data not found")
                        : Text(item.heightValue!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey.shade200,
                    title: const Text("Collectable amount"),
                    subtitle: (item.collectableAmount == null ||
                        item.collectableAmount == "")
                        ? const Text("Data not found")
                        : Text(item.collectableAmount!),
                  ),
                ],
              )).toList(),


            ) : Center(child: CircularProgressIndicator(),),
          );
  }

  Padding buildSectionOrderRequest() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _orderIdController,
            decoration: const InputDecoration(
              label: Text('Order Id'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Service Type"),
              ),
              Radio(
                value: "Regular",
                groupValue: groupValueServiceType,
                onChanged: (value) {
                  setState(() {
                    groupValueServiceType = value;
                  });
                },
              ),
              const Text("Regular"),
              Radio(
                value: "Emergency",
                groupValue: groupValueServiceType,
                onChanged: (value) {
                  setState(() {
                    groupValueServiceType = value;
                  });
                },
              ),
              const Text("Emergency"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Request Type"),
              ),
              Radio(
                value: "Pick up",
                groupValue: groupValueRequestType,
                onChanged: (value) {
                  setState(() {
                    groupValueRequestType = value;
                  });
                },
              ),
              const Text("Pick up"),
              Radio(
                value: "Home Delivery",
                groupValue: groupValueRequestType,
                onChanged: (value) {
                  setState(() {
                    groupValueRequestType = value;
                  });
                },
              ),
              const Text("Home Delivery"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Home Delivery"),
              ),
              Radio(
                value: "Yes",
                groupValue: groupValueHomeDelivery,
                onChanged: (value) {
                  setState(() {
                    groupValueHomeDelivery = value;
                  });
                },
              ),
              const Text("Yes"),
              Radio(
                value: "No",
                groupValue: groupValueHomeDelivery,
                onChanged: (value) {
                  setState(() {
                    groupValueHomeDelivery = value;
                  });
                },
              ),
              const Text("No"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Payer"),
              ),
              Radio(
                value: "Sender",
                groupValue: groupValuePayer,
                onChanged: (value) {
                  setState(() {
                    groupValuePayer = value;
                  });
                },
              ),
              const Text("Sender"),
              Radio(
                value: "Others",
                groupValue: groupValuePayer,
                onChanged: (value) {
                  setState(() {
                    groupValuePayer = value;
                  });
                },
              ),
              const Text("Others"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Payment Type"),
              ),
              Radio(
                value: "Online",
                groupValue: groupValuePaymentType,
                onChanged: (value) {
                  setState(() {
                    groupValuePaymentType = value;
                  });
                },
              ),
              const Text("Online"),
              Radio(
                value: "Cash",
                groupValue: groupValuePaymentType,
                onChanged: (value) {
                  setState(() {
                    groupValuePaymentType = value;
                  });
                },
              ),
              const Text("Cash"),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildSectionHeader(BuildContext context, String headerTitle) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Row(
        children: [
          Text(
            headerTitle,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }

  Padding buildSectionSenderInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _nameEnController,
            decoration: const InputDecoration(
              label: Text('Name in english'),
            ),
          ),
          TextField(
            controller: _nameBnController,
            decoration: const InputDecoration(
              label: Text('Name in bangla'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Text("Sender Type"),
              ),
              Radio(
                value: "Self",
                groupValue: groupValueSenderType,
                onChanged: (value) {
                  setState(() {
                    groupValueSenderType = value;
                  });
                },
              ),
              const Text("Self"),
              Radio(
                value: "Others",
                groupValue: groupValueSenderType,
                onChanged: (value) {
                  setState(() {
                    groupValueSenderType = value;
                  });
                },
              ),
              const Text("Others"),
            ],
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              label: Text('Phone'),
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextField(
            controller: _nidController,
            decoration: const InputDecoration(
              label: Text('NID'),
            ),
          ),
          TextField(
            controller: _addressController,
            decoration: const InputDecoration(
              label: Text("Address"),
            ),
          ),
        ],
      ),
    );
  }

  void senderData() {
    final senderInfo = taskProvider.taskResponse?.senderInfo;
    _nameEnController.text =
        (senderInfo?.senderNameEn == null || senderInfo?.senderNameEn == "")
            ? "Data not found"
            : senderInfo!.senderNameEn.toString();
    _nameBnController.text =
        (senderInfo?.senderNameBn == null || senderInfo?.senderNameBn == "")
            ? "Data not found"
            : senderInfo!.senderNameBn.toString();
    groupValueSenderType =
        (senderInfo?.senderType == null) ? null : senderInfo!.senderType;
    _phoneController.text =
        (senderInfo?.senderPhone == null || senderInfo?.senderPhone == "")
            ? "Data not found"
            : senderInfo!.senderPhone.toString();
    _emailController.text =
        (senderInfo?.senderEmail == null || senderInfo?.senderEmail == "")
            ? "Data not found"
            : senderInfo!.senderEmail.toString();
    _nidController.text =
        (senderInfo?.senderNid == null || senderInfo?.senderNid == "")
            ? "Data not found"
            : senderInfo!.senderNid.toString();
    _addressController.text = (senderInfo?.senderAddress == null ||
            senderInfo?.senderAddress == "" ||
            senderInfo?.senderDistrictOid == null ||
            senderInfo?.senderDistrictOid == "")
        ? "Data not found"
        : "${senderInfo!.senderAddress.toString()}, ${senderInfo!.senderDistrictOid}";
  }

  void orderData() {
    final orderRequest = taskProvider.taskResponse?.orderCnRequest;
    _orderIdController.text =
        (orderRequest?.cnRequestId == null || orderRequest?.cnRequestId == "")
            ? "Data not found"
            : orderRequest!.cnRequestId.toString();

    groupValueServiceType = (orderRequest?.serviceTypeId == null)
        ? null
        : orderRequest!.serviceTypeId;
    groupValueRequestType = (orderRequest?.requestTypeId == null)
        ? null
        : orderRequest!.requestTypeId;
    groupValueHomeDelivery = (orderRequest?.homeDelivery == null)
        ? null
        : orderRequest!.homeDelivery;
    groupValuePayer =
        (orderRequest?.payer == null) ? null : orderRequest!.payer;
    groupValuePaymentType =
        (orderRequest?.paymentType == null) ? null : orderRequest!.paymentType;
  }

}
