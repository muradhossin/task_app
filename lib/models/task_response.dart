class TaskResponse {
  TaskResponse({
    this.parentConsignmentChargesRequestOid,
    this.parentConsignmentChargeOid,
    this.orderCnRequest,
    this.senderInfo,
    this.consignmentChargesRequestParams,
  });

  TaskResponse.fromJson(dynamic json) {
    parentConsignmentChargesRequestOid =
        json['parent_consignment_charges_request_oid'];
    parentConsignmentChargeOid = json['parent_consignment_charge_oid'];
    orderCnRequest = json['orderCnRequest'] != null
        ? OrderCnRequest.fromJson(json['orderCnRequest'])
        : null;
    senderInfo = json['senderInfo'] != null
        ? SenderInfo.fromJson(json['senderInfo'])
        : null;
    if (json['consignmentChargesRequestParams'] != null) {
      consignmentChargesRequestParams = [];
      json['consignmentChargesRequestParams'].forEach((v) {
        consignmentChargesRequestParams
            ?.add(ConsignmentChargesRequestParams.fromJson(v));
      });
    }
  }

  String? parentConsignmentChargesRequestOid;
  String? parentConsignmentChargeOid;
  OrderCnRequest? orderCnRequest;
  SenderInfo? senderInfo;
  List<ConsignmentChargesRequestParams>? consignmentChargesRequestParams;

  TaskResponse copyWith({
    String? parentConsignmentChargesRequestOid,
    String? parentConsignmentChargeOid,
    OrderCnRequest? orderCnRequest,
    SenderInfo? senderInfo,
    List<ConsignmentChargesRequestParams>? consignmentChargesRequestParams,
  }) =>
      TaskResponse(
        parentConsignmentChargesRequestOid:
            parentConsignmentChargesRequestOid ??
                this.parentConsignmentChargesRequestOid,
        parentConsignmentChargeOid:
            parentConsignmentChargeOid ?? this.parentConsignmentChargeOid,
        orderCnRequest: orderCnRequest ?? this.orderCnRequest,
        senderInfo: senderInfo ?? this.senderInfo,
        consignmentChargesRequestParams: consignmentChargesRequestParams ??
            this.consignmentChargesRequestParams,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parent_consignment_charges_request_oid'] =
        parentConsignmentChargesRequestOid;
    map['parent_consignment_charge_oid'] = parentConsignmentChargeOid;
    if (orderCnRequest != null) {
      map['orderCnRequest'] = orderCnRequest?.toJson();
    }
    if (senderInfo != null) {
      map['senderInfo'] = senderInfo?.toJson();
    }
    if (consignmentChargesRequestParams != null) {
      map['consignmentChargesRequestParams'] =
          consignmentChargesRequestParams?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ConsignmentChargesRequestParams {
  ConsignmentChargesRequestParams({
    this.oid,
    this.parentOid,
    this.requestTypeId,
    this.serviceTypeId,
    this.categoryId,
    this.isPackaging,
    this.packagingId,
    this.isVolumetricWeight,
    this.lengthValue,
    this.widthValue,
    this.heightValue,
    this.productWeight,
    this.isDhakaCity,
    this.isOtherCity,
    this.isUpazila,
    this.homeDelivery,
    this.isCheckCod,
    this.collectableAmount,
  });

  ConsignmentChargesRequestParams.fromJson(dynamic json) {
    oid = json['oid'];
    parentOid = json['parent_oid'];
    requestTypeId = json['request_type_id'];
    serviceTypeId = json['service_type_id'];
    categoryId = json['category_id'];
    isPackaging = json['is_packaging'];
    packagingId = json['packaging_id'];
    isVolumetricWeight = json['is_volumetric_weight'];
    lengthValue = json['length_value'];
    widthValue = json['width_value'];
    heightValue = json['height_value'];
    productWeight = json['product_weight'];
    isDhakaCity = json['is_dhaka_city'];
    isOtherCity = json['is_other_city'];
    isUpazila = json['is_upazila'];
    homeDelivery = json['home_delivery'];
    isCheckCod = json['is_check_cod'];
    collectableAmount = json['collectable_amount'];
  }

  String? oid;
  String? parentOid;
  String? requestTypeId;
  String? serviceTypeId;
  dynamic categoryId;
  String? isPackaging;
  dynamic packagingId;
  String? isVolumetricWeight;
  String? lengthValue;
  String? widthValue;
  String? heightValue;
  String? productWeight;
  String? isDhakaCity;
  String? isOtherCity;
  String? isUpazila;
  String? homeDelivery;
  String? isCheckCod;
  String? collectableAmount;

  ConsignmentChargesRequestParams copyWith({
    String? oid,
    String? parentOid,
    String? requestTypeId,
    String? serviceTypeId,
    dynamic categoryId,
    String? isPackaging,
    dynamic packagingId,
    String? isVolumetricWeight,
    String? lengthValue,
    String? widthValue,
    String? heightValue,
    String? productWeight,
    String? isDhakaCity,
    String? isOtherCity,
    String? isUpazila,
    String? homeDelivery,
    String? isCheckCod,
    String? collectableAmount,
  }) =>
      ConsignmentChargesRequestParams(
        oid: oid ?? this.oid,
        parentOid: parentOid ?? this.parentOid,
        requestTypeId: requestTypeId ?? this.requestTypeId,
        serviceTypeId: serviceTypeId ?? this.serviceTypeId,
        categoryId: categoryId ?? this.categoryId,
        isPackaging: isPackaging ?? this.isPackaging,
        packagingId: packagingId ?? this.packagingId,
        isVolumetricWeight: isVolumetricWeight ?? this.isVolumetricWeight,
        lengthValue: lengthValue ?? this.lengthValue,
        widthValue: widthValue ?? this.widthValue,
        heightValue: heightValue ?? this.heightValue,
        productWeight: productWeight ?? this.productWeight,
        isDhakaCity: isDhakaCity ?? this.isDhakaCity,
        isOtherCity: isOtherCity ?? this.isOtherCity,
        isUpazila: isUpazila ?? this.isUpazila,
        homeDelivery: homeDelivery ?? this.homeDelivery,
        isCheckCod: isCheckCod ?? this.isCheckCod,
        collectableAmount: collectableAmount ?? this.collectableAmount,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oid'] = oid;
    map['parent_oid'] = parentOid;
    map['request_type_id'] = requestTypeId;
    map['service_type_id'] = serviceTypeId;
    map['category_id'] = categoryId;
    map['is_packaging'] = isPackaging;
    map['packaging_id'] = packagingId;
    map['is_volumetric_weight'] = isVolumetricWeight;
    map['length_value'] = lengthValue;
    map['width_value'] = widthValue;
    map['height_value'] = heightValue;
    map['product_weight'] = productWeight;
    map['is_dhaka_city'] = isDhakaCity;
    map['is_other_city'] = isOtherCity;
    map['is_upazila'] = isUpazila;
    map['home_delivery'] = homeDelivery;
    map['is_check_cod'] = isCheckCod;
    map['collectable_amount'] = collectableAmount;
    return map;
  }
}

class SenderInfo {
  SenderInfo({
    this.senderNameEn,
    this.senderNameBn,
    this.senderType,
    this.senderPhone,
    this.senderEmail,
    this.senderNid,
    this.senderDivisionOid,
    this.senderDistrictOid,
    this.senderThanaOid,
    this.senderPostOfficeOid,
    this.senderAddress,
    this.senderHubOid,
  });

  SenderInfo.fromJson(dynamic json) {
    senderNameEn = json['sender_name_en'];
    senderNameBn = json['sender_name_bn'];
    senderType = json['sender_type'];
    senderPhone = json['sender_phone'];
    senderEmail = json['sender_email'];
    senderNid = json['sender_nid'];
    senderDivisionOid = json['sender_division_oid'];
    senderDistrictOid = json['sender_district_oid'];
    senderThanaOid = json['sender_thana_oid'];
    senderPostOfficeOid = json['sender_post_office_oid'];
    senderAddress = json['sender_address'];
    senderHubOid = json['sender_hub_oid'];
  }

  String? senderNameEn;
  String? senderNameBn;
  String? senderType;
  String? senderPhone;
  String? senderEmail;
  String? senderNid;
  String? senderDivisionOid;
  String? senderDistrictOid;
  String? senderThanaOid;
  String? senderPostOfficeOid;
  String? senderAddress;
  String? senderHubOid;

  SenderInfo copyWith({
    String? senderNameEn,
    String? senderNameBn,
    String? senderType,
    String? senderPhone,
    String? senderEmail,
    String? senderNid,
    String? senderDivisionOid,
    String? senderDistrictOid,
    String? senderThanaOid,
    String? senderPostOfficeOid,
    String? senderAddress,
    String? senderHubOid,
  }) =>
      SenderInfo(
        senderNameEn: senderNameEn ?? this.senderNameEn,
        senderNameBn: senderNameBn ?? this.senderNameBn,
        senderType: senderType ?? this.senderType,
        senderPhone: senderPhone ?? this.senderPhone,
        senderEmail: senderEmail ?? this.senderEmail,
        senderNid: senderNid ?? this.senderNid,
        senderDivisionOid: senderDivisionOid ?? this.senderDivisionOid,
        senderDistrictOid: senderDistrictOid ?? this.senderDistrictOid,
        senderThanaOid: senderThanaOid ?? this.senderThanaOid,
        senderPostOfficeOid: senderPostOfficeOid ?? this.senderPostOfficeOid,
        senderAddress: senderAddress ?? this.senderAddress,
        senderHubOid: senderHubOid ?? this.senderHubOid,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender_name_en'] = senderNameEn;
    map['sender_name_bn'] = senderNameBn;
    map['sender_type'] = senderType;
    map['sender_phone'] = senderPhone;
    map['sender_email'] = senderEmail;
    map['sender_nid'] = senderNid;
    map['sender_division_oid'] = senderDivisionOid;
    map['sender_district_oid'] = senderDistrictOid;
    map['sender_thana_oid'] = senderThanaOid;
    map['sender_post_office_oid'] = senderPostOfficeOid;
    map['sender_address'] = senderAddress;
    map['sender_hub_oid'] = senderHubOid;
    return map;
  }
}

class OrderCnRequest {
  OrderCnRequest({
    this.cnRequestId,
    this.serviceTypeId,
    this.requestTypeId,
    this.homeDelivery,
    this.payer,
    this.paymentType,
  });

  OrderCnRequest.fromJson(dynamic json) {
    cnRequestId = json['cn_request_id'];
    serviceTypeId = json['service_type_id'];
    requestTypeId = json['request_type_id'];
    homeDelivery = json['home_delivery'];
    payer = json['payer'];
    paymentType = json['payment_type'];
  }

  String? cnRequestId;
  String? serviceTypeId;
  String? requestTypeId;
  String? homeDelivery;
  String? payer;
  String? paymentType;

  OrderCnRequest copyWith({
    String? cnRequestId,
    String? serviceTypeId,
    String? requestTypeId,
    String? homeDelivery,
    String? payer,
    String? paymentType,
  }) =>
      OrderCnRequest(
        cnRequestId: cnRequestId ?? this.cnRequestId,
        serviceTypeId: serviceTypeId ?? this.serviceTypeId,
        requestTypeId: requestTypeId ?? this.requestTypeId,
        homeDelivery: homeDelivery ?? this.homeDelivery,
        payer: payer ?? this.payer,
        paymentType: paymentType ?? this.paymentType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cn_request_id'] = cnRequestId;
    map['service_type_id'] = serviceTypeId;
    map['request_type_id'] = requestTypeId;
    map['home_delivery'] = homeDelivery;
    map['payer'] = payer;
    map['payment_type'] = paymentType;
    return map;
  }
}
