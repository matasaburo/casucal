class PickupItem{
  String? picture;    //camera
  String? itemType;   //top pants skirt dress outer inner suite shoes accessory etc
  String? itemName;   //Keyboard or OCR
  var price;          //Keyboard or OCR
  var discount;       //10%-90%
  var selectFlg;

  PickupItem(){
    this.picture = '';
    this.itemType = 'etc';
    this.itemName = '';
    this.price= 0;
    this.discount = 0;
    this.selectFlg = 0;
  }
}


