import 'dart:developer';

import 'package:claim_reg_frontend/models/Claim.dart';
import 'package:claim_reg_frontend/models/ClaimItem.dart';
import 'package:claim_reg_frontend/pages/home_page.dart';
import 'package:claim_reg_frontend/services/ScannerService.dart';
import 'package:claim_reg_frontend/utils/Constants.dart';
import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:claim_reg_frontend/widgets/AppDatebox.dart';
import 'package:claim_reg_frontend/widgets/AppTextbox.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../services/ClaimItemService.dart';
import '../utils/Validators.dart';
import '../widgets/BaseAppBar.dart';

class ClaimItemPage extends StatefulWidget {
  final Claim claim;
  const ClaimItemPage({Key? key, required this.claim}) : super(key: key);

  @override
  State<ClaimItemPage> createState() => _ClaimItemPageState();
}

class _ClaimItemPageState extends State<ClaimItemPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController billNumberController = TextEditingController();
  TextEditingController billDateController = TextEditingController();
  TextEditingController expenseCodeController = TextEditingController();
  TextEditingController costCenterController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController subStartController = TextEditingController();
  TextEditingController subEndController = TextEditingController();
  Widget? prefixIconBillNumber;
  Widget? prefixIconBillDate;
  Widget? prefixIconAmount;
  Widget? prefixIconSubStart;
  Widget? prefixIconSubEnd;
  List<ClaimItem>? claimItemList;

  _ClaimItemPageState() {
    claimItemList = [];
  }

  void scanFile(String filePath) {
    ScannerService()
        .postScanPdfFile(filePath)
        .then((docFieldList) => setState(() {
              for (final docField in docFieldList) {
                log('key: ${docField.key}, value: ${docField.value}, confidence: ${docField.confidence}');
                switch (docField.key) {
                  case 'SubPeriodStart':
                    subStartController.text = docField.value;
                    if (docField.confidence > Constants.confidenceThreshold) {
                      prefixIconSubStart = getPrefixIconGreen();
                    } else {
                      prefixIconSubStart = getPrefixIconAmber();
                    }
                    break;
                  case 'SubPeriodEnd':
                    subEndController.text = docField.value;
                    if (docField.confidence > Constants.confidenceThreshold) {
                      prefixIconSubEnd = getPrefixIconGreen();
                    } else {
                      prefixIconSubEnd = getPrefixIconAmber();
                    }
                    break;
                  case 'InvoiceNumber':
                    billNumberController.text = docField.value;
                    if (docField.confidence > Constants.confidenceThreshold) {
                      prefixIconBillNumber = getPrefixIconGreen();
                    } else {
                      prefixIconBillNumber = getPrefixIconAmber();
                    }
                    break;
                  case 'InvoiceDate':
                    billDateController.text = docField.value;
                    if (docField.confidence > Constants.confidenceThreshold) {
                      prefixIconBillDate = getPrefixIconGreen();
                    } else {
                      prefixIconBillDate = getPrefixIconAmber();
                    }
                    break;
                  case 'AmountPayable':
                    amountController.text = docField.value;
                    if (docField.confidence > Constants.confidenceThreshold) {
                      prefixIconAmount = getPrefixIconGreen();
                    } else {
                      prefixIconAmount = getPrefixIconAmber();
                    }
                    break;
                  case 'Name':
                    break;
                  default:
                    log("Field not configured ${docField.value}");
                }
              }
            }));
  }

  Future<ClaimItem> createClaimItem() async {
    var inputFormat = DateFormat(Constants.dateFormat);
    ClaimItem claimItemToBeCreated = ClaimItem(
        0,
        inputFormat.parse(billDateController.text),
        billNumberController.text,
        expenseCodeController.text,
        int.parse(costCenterController.text),
        double.parse(amountController.text),
        inputFormat.parse(subStartController.text),
        inputFormat.parse(subEndController.text));
    return await ClaimItemService().postClaimItem(claimItemToBeCreated);
  }

  getPrefixIconGreen() {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  }

  getPrefixIconAmber() {
    return const Icon(
      Icons.error_rounded,
      color: Colors.amber,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Claim Items',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.upload_file),
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result == null) {
                          log("No file selected");
                        } else {
                          String filePath = result.files.single.path!;
                          log("Upload file ${result.files.single.name}");
                          scanFile(filePath);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.blue), //Background Color
                        elevation:
                            MaterialStateProperty.all(3), //Defines Elevation
                        shadowColor:
                            MaterialStateProperty.all(Colors.lightBlue),
                      ),
                      label: const Text(
                        'Upload File',
                        style: TextStyle(
                          color: Colors.black54,
                          letterSpacing: 2.0,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                AppTextbox(
                  label: 'Bill Number',
                  validator: Validators().checkFieldEmpty,
                  controller: billNumberController,
                  prefixIcon: prefixIconBillNumber,
                ),
                AppDatebox(
                  label: 'Bill Date',
                  validator: Validators().checkFieldEmpty,
                  controller: billDateController,
                  prefixIcon: prefixIconBillDate,
                ),
                AppTextbox(
                  label: 'Expense Code',
                  validator: Validators().checkFieldEmpty,
                  controller: expenseCodeController,
                ),
                AppTextbox(
                  label: 'Cost Center',
                  validator: Validators().checkFieldEmpty,
                  controller: costCenterController,
                  textInputType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                AppTextbox(
                    label: 'Amount',
                    validator: Validators().checkFieldEmpty,
                    prefixIcon: prefixIconAmount,
                    controller: amountController,
                    textInputType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d{0,4}\.?\d{0,2}')),
                    ]),
                AppDatebox(
                  label: 'Subscription Start Date',
                  validator: Validators().checkFieldEmpty,
                  prefixIcon: prefixIconSubStart,
                  controller: subStartController,
                ),
                AppDatebox(
                  label: 'Subscription End Date',
                  validator: Validators().checkFieldEmpty,
                  prefixIcon: prefixIconSubEnd,
                  controller: subEndController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                          text: 'Add',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              createClaimItem().then((claimItem) => {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Claim Item created - ${claimItem.id}')),
                                    ),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ClaimItemPage(
                                              claim: widget.claim)),
                                    )
                                  });
                            }
                          }),
                      AppButton(
                          text: 'Submit',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              createClaimItem().then((claimItem) => {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Claim Submitted.')),
                                    ),
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    )
                                  });
                            }
                          }),
                      AppButton(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                            log('Cancel button clicked.');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
