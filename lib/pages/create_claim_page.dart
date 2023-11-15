import 'dart:developer';

import 'package:claim_reg_frontend/enums/claim_status.dart';
import 'package:claim_reg_frontend/enums/claim_type.dart';
import 'package:claim_reg_frontend/enums/currency.dart';
import 'package:claim_reg_frontend/models/Employee.dart';
import 'package:claim_reg_frontend/pages/claim_item_page.dart';
import 'package:claim_reg_frontend/services/ClaimService.dart';
import 'package:claim_reg_frontend/widgets/AppButton.dart';
import 'package:flutter/material.dart';

import '../models/Claim.dart';
import '../services/EmployeeService.dart';
import '../utils/Validators.dart';
import '../widgets/AppDropdown.dart';
import '../widgets/BaseAppBar.dart';

class CreateClaimPage extends StatefulWidget {
  const CreateClaimPage({Key? key}) : super(key: key);

  @override
  State<CreateClaimPage> createState() => _CreateClaimPageState();
}

class _CreateClaimPageState extends State<CreateClaimPage> {
  List<Employee> employees = [];
  List<Employee> approvers = [];
  ClaimType? _selected_claim_type;
  Employee? _selected_claimant;
  Employee? _selected_approver;
  Currency? _selected_currency;
  final _formKey = GlobalKey<FormState>();
  Claim? claim;
  var isLoaded = false;

  _CreateClaimPageState() {
    claim = null;
    _selected_claimant = null;
    _selected_approver = null;
  }
  createClaim(ClaimType claimType, Currency currency, Employee claimant,
      Employee approver) async {
    Claim claimToBeCreated = Claim(
        0, claimant, approver, claimType, [], currency, ClaimStatus.created);
    claim = await ClaimService().postClaim(claimToBeCreated);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    employees = await EmployeeService().getEmployees();
    approvers = await EmployeeService().getEmployees();
    if (employees != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Create Claim',
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text(claim?.id.toString()),
                AppDropdown(
                  label: 'Claim Type',
                  itemList: [ClaimType.internet],
                  validator: Validators().checkFieldEmpty,
                  value: _selected_claim_type,
                  onChanged: (value) {
                    setState(() {
                      _selected_claim_type = value;
                    });
                  },
                ),
                AppDropdown(
                  label: 'Currency',
                  itemList: [Currency.INR],
                  validator: Validators().checkFieldEmpty,
                  value: _selected_currency,
                  onChanged: (value) {
                    setState(() {
                      _selected_currency = value;
                    });
                  },
                ),
                AppDropdown(
                  label: 'Claimant',
                  itemList: employees,
                  validator: Validators().checkFieldEmpty,
                  value: _selected_claimant,
                  onChanged: (value) {
                    setState(() {
                      _selected_claimant = value;
                    });
                  },
                ),
                AppDropdown(
                  label: 'Approver',
                  itemList: approvers,
                  validator: Validators().checkFieldEmpty,
                  value: _selected_approver,
                  onChanged: (value) {
                    setState(() {
                      _selected_approver = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: AppButton(
                    text: 'Save and Proceed',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        createClaim(_selected_claim_type!, _selected_currency!,
                            _selected_claimant!, _selected_approver!);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ClaimItemPage()),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Claim created.')),
                        );
                        log('Claim created.');
                      }
                    },
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
