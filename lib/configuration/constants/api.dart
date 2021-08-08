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

  //user_store
  static const allStores = "/stores/stores";
  //photo
  static const imagePath="http://pets.sourcecode-ai.com/storage/";
  static const categories="/categories";
  static const types="/productTypes";
  //doctor_app
  static const getDoctorId="/doctor";
  static const getDoctors="/doctors";
  static const updateUser="/update/user";
  static const addService="/add/service";
  static const editServiceById="/edit/service";
  static const deleteServiceById="/delete/service";

  //vendor_app
 static const getStoreId="/store";
 static const getStoreOffers="/offers/store";
 static const getStoreBodyId="/about/store";
 static const updateStore="/update/store";
 static const updateProduct="/edit/product";
 static const addProduct="/add/product";
 static const deleteProduct="/delete/product";
 static const changeProductStatus="/item/status";
 static const addPhoto="/add/store/images";
 static const convertPhotoToStory="/convert";
 static const getPhotos="/store/images";
 static const removePhoto="/delete/image";

 static const updateOffer="/edit/offer";
 static const addOffer="/add/offer";
 static const deleteOffer="/delete/offer";

//locations
  static const getLocations="/districts";

  //contact
  static const updateSocial="/edit/contact";
  static const addSocial="/add/contact";
  static const deleteSocial="/delete/contact";

  //status
static const myAllStatuses="/myStatusAll";
static const getStatusId="/status";
static const allStatuses="/statuses";
static const deleteStatus="/delete/status";
static const addStatus="/add/status";
//corners
  static const myAllCorners="/myCorners";
  static const getCornerId="/corner";
  static const allCorneres="/corners";
  static const deleteCorner="/delete/corner";
  static const addCorner="/add/corner";
  static const editCornerbyId="/edit/corner";

}