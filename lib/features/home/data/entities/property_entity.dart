class PropertyEntity {
  int? id;
  String? city;
  String? name;
  String? status;
  int? isRented;
  num? price;
  String? percentageSold;
  String? annualIncome;
  String? annualExpectedGrowth;
  String? annualRentIncome;
  String? annualNetRentIncome;
  String? image;
  List<String>? images;
  String? locationDescription;
  int? bedsCount;
  int? bathroomsCount;
  double? area;
  int? totalRentPaid;
  String? fundingDate;
  int? investorsCount;
  int? isProtected;
  num? monthlyCurrentRent;
  String? propertyDescription;
  String? seamlessFee;
  String? servicesFees;
  String? maintainceFees;
  List<String>? documents;
  int? hasGym;
  int? hasParking;
  int? hasBalcony;
  int? hasPool;
  int? hasSupermarket;
  int? hasRestaurant;
  int? hasGarden;
  String? createdAt;
  String? updatedAt;

  PropertyEntity(
      {this.id,
        this.city,
        this.name,
        this.status,
        this.isRented,
        this.price,
        this.percentageSold,
        this.annualIncome,
        this.annualExpectedGrowth,
        this.annualRentIncome,
        this.annualNetRentIncome,
        this.image,
        this.images,
        this.locationDescription,
        this.bedsCount,
        this.bathroomsCount,
        this.area,
        this.totalRentPaid,
        this.fundingDate,
        this.investorsCount,
        this.isProtected,
        this.monthlyCurrentRent,
        this.propertyDescription,
        this.seamlessFee,
        this.servicesFees,
        this.maintainceFees,
        this.documents,
        this.hasGym,
        this.hasParking,
        this.hasBalcony,
        this.hasPool,
        this.hasSupermarket,
        this.hasRestaurant,
        this.hasGarden,
        this.createdAt,
        this.updatedAt});

  PropertyEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    name = json['name'];
    status = json['status'];
    isRented = json['is_rented'];
    price = json['price'];
    percentageSold = json['percentage_sold'];
    annualIncome = json['annual_income'];
    annualExpectedGrowth = json['annual_expected_growth'];
    annualRentIncome = json['annual_rent_income'];
    annualNetRentIncome = json['annual_net_rent_income'];
    image = json['image'];
    images = json['images'].cast<String>();
    locationDescription = json['location_description'];
    bedsCount = json['beds_count'];
    bathroomsCount = json['bathrooms_count'];
    area = json['area'];
    totalRentPaid = json['total_rent_paid'];
    fundingDate = json['funding_date'];
    investorsCount = json['investors_count'];
    isProtected = json['is_protected'];
    monthlyCurrentRent = json['monthly_current_rent'];
    propertyDescription = json['property_description'];
    seamlessFee = json['seamless_fee'];
    servicesFees = json['services_fees'];
    maintainceFees = json['maintaince_fees'];
    documents = json['documents'].cast<String>();
    hasGym = json['has_gym'];
    hasParking = json['has_parking'];
    hasBalcony = json['has_balcony'];
    hasPool = json['has_pool'];
    hasSupermarket = json['has_supermarket'];
    hasRestaurant = json['has_restaurant'];
    hasGarden = json['has_garden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['name'] = this.name;
    data['status'] = this.status;
    data['is_rented'] = this.isRented;
    data['price'] = this.price;
    data['percentage_sold'] = this.percentageSold;
    data['annual_income'] = this.annualIncome;
    data['annual_expected_growth'] = this.annualExpectedGrowth;
    data['annual_rent_income'] = this.annualRentIncome;
    data['annual_net_rent_income'] = this.annualNetRentIncome;
    data['image'] = this.image;
    data['images'] = this.images;
    data['location_description'] = this.locationDescription;
    data['beds_count'] = this.bedsCount;
    data['bathrooms_count'] = this.bathroomsCount;
    data['area'] = this.area;
    data['total_rent_paid'] = this.totalRentPaid;
    data['funding_date'] = this.fundingDate;
    data['investors_count'] = this.investorsCount;
    data['is_protected'] = this.isProtected;
    data['monthly_current_rent'] = this.monthlyCurrentRent;
    data['property_description'] = this.propertyDescription;
    data['seamless_fee'] = this.seamlessFee;
    data['services_fees'] = this.servicesFees;
    data['maintaince_fees'] = this.maintainceFees;
    data['documents'] = this.documents;
    data['has_gym'] = this.hasGym;
    data['has_parking'] = this.hasParking;
    data['has_balcony'] = this.hasBalcony;
    data['has_pool'] = this.hasPool;
    data['has_supermarket'] = this.hasSupermarket;
    data['has_restaurant'] = this.hasRestaurant;
    data['has_garden'] = this.hasGarden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}