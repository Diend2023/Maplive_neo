package tmx
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   
   public class SpriteBitmapData
   {
      
      public var targetXml:XML;
      
      public var targetBitmapData:BitmapData;
      
      public var targetName:String;
      
      public var path:String;
      
      public var pool:Dictionary;
      
      public var currentFrameX:int = 0;
      
      public var currentFrameY:int = 0;
      
      public function SpriteBitmapData(param1:String, param2:String, param3:XML, param4:BitmapData)
      {
         var _loc7_:String = null;
         super();
         this.path = param2;
         this.targetName = param1;
         this.targetXml = param3;
         this.targetBitmapData = param4;
         this.pool = new Dictionary();
         var _loc5_:XMLList = this.targetXml.children();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length())
         {
            _loc7_ = _loc5_[_loc6_].@name;
            this.pool[_loc7_] = {
               "bitmap":this.getBitmapData(_loc5_[_loc6_]),
               "xml":_loc5_[_loc6_]
            };
            _loc6_++;
         }
      }
      
      public function drawBitmap(param1:Bitmap, param2:int, param3:Sprite = null) : void
      {
         var _loc4_:XML = this.targetXml.children()[param2];
         param1.bitmapData = this.getBitmapDataFormName(_loc4_.@name).bitmap as BitmapData;
         this.currentFrameX = int(_loc4_.@frameX);
         this.currentFrameY = int(_loc4_.@frameY);
         if(param3)
         {
            param3.x = -this.currentFrameX + int(this.targetXml.@px);
            param3.y = -this.currentFrameY + int(this.targetXml.@py);
         }
         else
         {
            param1.x = -this.currentFrameX + int(this.targetXml.@px);
            param1.y = -this.currentFrameY + int(this.targetXml.@py);
         }
      }
      
      public function getBitmapData(param1:XML) : BitmapData
      {
         return BitmapDarw.xmlForBitmapData(this.targetBitmapData,param1,1,1,false);
      }
      
      public function getBitmapDataFormName(param1:String) : Object
      {
         return this.pool[param1];
      }
      
      public function length() : int
      {
         return this.targetXml.children().length();
      }
      
      public function hasPxy() : Boolean
      {
         return int(this.targetXml.@px) != 0 || int(this.targetXml.@px) != 0;
      }
   }
}

