import 'package:flutter/material.dart';
import 'package:snapbuy/data/model/response/address_model.dart';
import 'package:snapbuy/utill/color_resources.dart';
import 'package:snapbuy/utill/custom_themes.dart';
import 'package:snapbuy/utill/images.dart';
class AddressListPage extends StatelessWidget {
  final AddressModel address;
  AddressListPage({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        address.addressType == 'Home' ? Images.home_image
            : address.addressType == 'Ofice' ? Images.bag : Images.more_image,
        color: ColorResources.getSellerTxt(context), height: 30, width: 30,
      ),
      title: Text(address.address, style: titilliumRegular),
    );



  }
}
