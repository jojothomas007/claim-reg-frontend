import 'package:claim_reg_frontend/widgets/AppCard.dart';
import 'package:flutter/material.dart';

import '../models/Claim.dart';
import '../services/ClaimService.dart';
import '../widgets/BaseAppBar.dart';

class ClaimDetailsPage extends StatefulWidget {
  const ClaimDetailsPage({Key? key}) : super(key: key);

  @override
  State<ClaimDetailsPage> createState() => _ClaimDetailsPageState();
}

class _ClaimDetailsPageState extends State<ClaimDetailsPage> {
  List<Claim>? claims;
  var isLoaded = false;

  // addClaimItem(ClaimType claimType, Currency currency, Employee claimant,
  //     Employee approver) async {
  //   Claim claimToBeCreated = ClaimItem(billNumber,
  //       billDate,
  //       expenseCode,
  //       costCenter,
  //       amount,
  //       subStartDate;
  //       subEndDate;
  //       0, claimant, approver, claimType, [], currency, ClaimStatus.created);
  //   claim = await ClaimService().postClaim(claimToBeCreated);
  // }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    claims = await ClaimService().getClaims();
    if (claims != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Claim Information',
        appBar: AppBar(),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: claims?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
              child: AppCard(valueList: [
                'id : ${claims![index].id.toString()}',
                'claimant : ${claims![index].claimant.name}',
                'approver : ${claims![index].approver.name}',
                'type : ${claims![index].type}',
                'currency : ${claims![index].currency}',
                'status : ${claims![index].status}',
              ]),
            );
          },
        ),
      ),
    );
  }
}
