class Api {

  static String get baseUrl {
    return "http://pets.sourcecode-ai.com/api";
  }

  //registration
  static const registerUser = "/register/user";
  static const registerStable = "/register/barn";
  static const registerStore = "/register/store";
  static const registerDoctor = "/register/doctor";
  static const mobileExist = "/check/mobile";
  //login & logout
  static const login = "/login";
  static const logout = "/logout";

  //forgotPassword
  static const forgotPassword = "/password/reset/init";

  //verifyPhoneAccount
  static const verifyPhoneAccount = "/verify/phone";

  //photo
  static const imagePath="http://pets.sourcecode-ai.com/storage/";
  static const categories="/categories";
  static const types="/productTypes";

  //vendor_app
 static const getStoreId="/store";
 static const getStoreOffers="/offers/store";
 static const getStoreBodyId="/about/store";
 static const updateStore="/update/store";
 static const updateProduct="/edit/product";
 static const addProduct="/add/product";
 static const deleteProduct="/delete/product";

 static const updateOffer="/edit/offer";
 static const addOffer="/add/offer";
 static const deleteOffer="/delete/offer";

//locations
  static const getLocations="/districts";

  //contact
  static const updateSocial="/edit/contact";
  static const addSocial="/add/contact";
  static const deleteSocial="/delete/contact";
}