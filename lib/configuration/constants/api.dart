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
  static const addDoctorReview="/rate";
  static const getDoctorReview="/rates?doctor_id=";
  static const getStoreReview="/rates?store_id=";

  //vendor_app
 static const getStoreId="/store";
 static const getStoreOffers="/offers/store";
 static const getStoreBodyId="/about/store";
 static const updateStore="/update/store";
 static const updateWorkTime="/edit/day";
 static const deleteWorkTime="/delete/day";
 static const updateProduct="/edit/product";
 static const addProduct="/add/product";
 static const deleteProduct="/delete/product";
 static const changeProductStatus="/item/status";
 static const addPhoto="/add/store/images";

 static const getPhotos="/store/images";
 static const removePhoto="/delete/image";

 static const updateOffer="/edit/offer";
 static const addOffer="/add/offer";
 static const deleteOffer="/delete/offer";

//locations
  static const getLocations="/districts";
  static const convertPhotoToStory="/convert";
//home
  static const home="/home";

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
//favorites
  static const getProductFav="/myFavourites/items";
  static const getOffersFav="/myFavourites/offers";
  static const getStoresFav="/myFavourites/stores";
  static const getSievesFav="/myFavourites/sieves";
  static const getBarnsFav="/myFavourites/barns";
  static const getDoctorFav="/myFavourites/doctors";


  static const addToFav="/addToFavourite";
  static const addProductFav="/product";
  static const addOffersFav="/offer";
  static const addStoresFav="/store";
  static const addSievesFav="/sieve";
  static const addBarnsFav="/barn";
  static const addDoctorFav="/doctor";

//oreder

  static const addOrder="/add/order";
  static const deleteOrderId="/delete/order";
  static const updateOrderId="/update/order";
  static const addOrderAnswer="/answer/order";
  static const getOrderId="/show/order";
  static const orders="/show/orders";
  static const myOrders="/show/my/orders/sent";
  static const myAnswers="/show/my/answers";


  //search
static const searchOffers="/search/offers?name=";
static const searchStores="/search/stores?name=";
static const searchDoctors="/get/search/doctors?name=";
static const searchProducts="/search/products?name=";
static const searchCategory="/search/cats?name=";



}