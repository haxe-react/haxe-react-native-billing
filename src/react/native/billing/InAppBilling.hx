package react.native.billing;

#if android
import js.Promise;

@:jsRequire("react-native-billing")
extern class InAppBilling {
	static function open():Promise<Void>;
	static function close():Promise<Void>;
	static function purchase(productId:String, ?developerPayload:String):Promise<TransactionDetails>;
	static function consumePurchase(productId:String):Promise<Bool>;
	static function subscribe(productId:String, ?developerPayload:String):Promise<TransactionDetails>;
	static function isPurchased(productId:String):Promise<Bool>;
	static function isSubscribed(productId:String):Promise<Bool>;
	static function listOwnedProducts():Promise<Array<String>>;
	static function listOwnedSubscriptions():Promise<Array<String>>;
	static function getProductDetails(productId:String):Promise<ProductDetails>;
	static function getProductDetailsArray(productIds:Array<String>):Promise<Array<ProductDetails>>;
	static function getSubscriptionDetails(productId:String):Promise<ProductDetails>;
	static function getSubscriptionDetailsArray(productIds:Array<String>):Promise<Array<ProductDetails>>;
	static function getPurchaseTransactionDetails(productId:String):Promise<TransactionDetails>;
	static function getSubscriptionTransactionDetails(productId:String):Promise<TransactionDetails>;
}

typedef TransactionDetails = {
	productId:String,
	orderId:String,
	purchaseToken:String,
	purchaseTime:String,
	purchaseState:PurchaseState,
	receiptSignature:String,
	receiptData:String,
	developerPayload:String,
}
typedef ProductDetails = {
	productId:String,
	title:String,
	description:String,
	isSubscription:Bool,
	currency:String,
	priceValue:Float,
	priceText:String,
}

@:enum
abstract PurchaseState(String) to String {
	var PurchasedSuccessfully = 'PurchasedSuccessfully';
	var Canceled = 'Canceled';
	var Refunded = 'Refunded';
	var SubscriptionExpired = 'SubscriptionExpired';
}
#end