//To convert the response into not nullable object (model)

import 'package:advance_flutter/data/responses/responses.dart';
import 'package:advance_flutter/domain/model/model.dart';
import 'package:advance_flutter/app/extension.dart';

const EMPTY = '';
const ZERO = 0;

extension CustomerReponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id?.orEmpty() ?? EMPTY, this?.name?.orEmpty() ?? EMPTY,
        this?.numOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactsReponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? EMPTY, this?.phone?.orEmpty() ?? EMPTY,
       this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenicationReponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}