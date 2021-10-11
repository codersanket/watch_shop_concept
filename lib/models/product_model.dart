class ProductModel {
  final String imageUrl;
  final String price;
  final String watchName;

  ProductModel(
      {required this.imageUrl, required this.price, required this.watchName});

  static List<ProductModel> watches = [
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/k4hcjgw0pkrrdj/watch-refurbished/j/y/s/c-fs5447-b-fossil-original-imafkzzckwr6vwym.jpeg?q=50",
        price: "₹ 9495.00",
        watchName: "FS5447 THE MINIMALIST"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/ks7tuvk0/watch/u/x/b/ed519-efv-610d-1avudf-casio-original-imag5tu2re8c7wzn.jpeg?q=50",
        price: "₹ 6296.00",
        watchName: "CASIO ED519"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/ktvucnk0/watch/r/l/s/twel98smu02-timex-women-original-imag74m7ptyghrhq.jpeg?q=50",
        price: "₹ 4,499.00",
        watchName: "TIMEX TWEL98SMU02"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/k4rcmfk0pkrrdj/watch-refurbished/7/c/g/c-38045pp03-fastrack-original-imaf8qx7vzuxrxr8.jpeg?q=50",
        price: "₹ 2,195.00",
        watchName: "Fastrack NN38045PP03"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/kst9gnk0/watch/f/i/l/g1154-ga-2200m-1adr-casio-men-original-imag6atwzg6kbrgd.jpeg?q=50",
        price: "₹ 6,996.00",
        watchName: "CASIO G1154"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/ku79vgw0/watch/c/q/h/me3099-fossil-men-original-imag7cvcngdthgu3.jpeg?q=50",
        price: "₹ 13,495.00",
        watchName: "FOSSIL ME3099"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/k0zlsi80/watch/6/f/h/ex508-casio-original-imafkmybc5cefjzh.jpeg?q=50",
        price: "₹ 12,595.00",
        watchName: "CASIO EX508"),
    ProductModel(
        imageUrl:
            "https://rukminim1.flixcart.com/image/800/960/k0plpjk0/watch/h/q/k/cc1091-50e-citizen-original-imafkfw8k7ztwykg.jpeg?q=50",
        price: "₹ 57,999.00",
        watchName: "CITIZEN CC1091-50E"),
  ];
}
