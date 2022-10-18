class PopularListData {
  String titleTxt;
  bool isSelected;

  PopularListData({
    this.titleTxt = '',
    this.isSelected = false,
  });

  static List<PopularListData> popularFList = [
    PopularListData(
      titleTxt: 'Free Breakfast',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Free Parking',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Pool',
      isSelected: true,
    ),
    PopularListData(
      titleTxt: 'Pet Friendly',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Free wifi',
      isSelected: false,
    ),
  ];

  static List<PopularListData> accomodationList = [
    PopularListData(
      titleTxt: 'All',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Apartment',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Home',
      isSelected: true,
    ),
    PopularListData(
      titleTxt: 'Villa',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Hotel',
      isSelected: false,
    ),
    PopularListData(
      titleTxt: 'Resort',
      isSelected: false,
    ),
  ];
}
