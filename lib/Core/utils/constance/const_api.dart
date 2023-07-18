class ApiConstant {
  //https://BeeDegree.my-alphatech.com/api/Library/GetListTopics?PageNum=1

  static const baseUrl = 'https://BeeDegree.my-alphatech.com/api/Library/';
  static const getTopicsListEndPoint = 'GetListTopics';
  static const getItemsListEndPoint = 'GetListItems';
  static const pagination = 'PageNum';
  static const id = 'id';
  static const String token =
      'Bearer eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwidHlwIjoiSldUIiwiY3R5IjoiSldUIn0..4jtfwiYgZ4mfRVT512GgIA.uVZPXpJtU0Ho5hBVPdLVzYpIEuCQbinANRO9BOAd_v0byKA6Al5dACw6CtPkYSyON6VUkXs-3tQICXdVpDNJlBgDCGgkjNVjV2rBdXe25eO9cpFuUCcn-7Mn86K3eLeB4nlorvSl8Z_aaRIrjGAs488ziPdv_jRyHIUHkty7oweGAuh6E7DZ3Ur-9xg1G1zubC60keHB60tFDkXWAwUDJrc-f0LMwzUT2b8qn-XDv_gC1PeGhA0IeabLIbuqmKuYyANhIxInxfPMmmu9OiI6T1ImRjL4rQ2BC8_6UmYFa9Geg5OC5ASpYVKxxs4tmBkOE9K6DEJlPFqaZHxtBLMJb3XICjtcq6UnBlu-3kV2dX6QPdLoD2SCe70MsTBWJ4FVJEULUeMi2SdpSMstfaYqisgvd2iW9UiorQhR1iF0Fc318kHea2WdgkrB-5F5lzXltErGr3GfxaBJJb52LZTHpw.-13XMKjkFHOKEn8d_hwDE6sFK0xzrRYJ_77FfCLHkXM';

  static const getTopicsListPath =
      '$baseUrl/$getTopicsListEndPoint?$pagination=1';
}
