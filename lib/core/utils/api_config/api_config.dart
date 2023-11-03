class APIConfig {
  static String baseUrl = 'http://10.0.2.2:8000//api/v1/user/';
  static const String login = 'login';
  static const String register = 'register';
  static const String changePassword = 'changePassword';
  static const String editProfile = 'update';
  static const String deleteAccount = 'delete';
  static const String createItem = 'item/create';
  static const String searchItems = 'item/search';
  static const String getListContent = 'list/get';
  static const String getMyLists = 'list/get';
  static const String deleteList = 'list/delete';
  static const String removeItemFromList = 'list/removeItem';
  static const String listItems = 'item/list';
  static const String addItemToList = 'list/addItem';
  static const String uploadImage = 'item/image';
  static const String createList = 'list/create';
  static const String updateListContent = 'list/update';
  static const String getMostSearched = 'item/most-searched';
  static const String updateFavourite = 'favorite/update';
  static const String getFavourites = 'favorite/get';
  static const String createCatalog = 'catalog/create';
  static const String editCatalog = 'catalog/update';
  static const String listCatalogs = 'catalog/list';
  static const String deleteCatalog = 'catalog/delete';
}
