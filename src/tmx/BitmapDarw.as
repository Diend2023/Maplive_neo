package tmx
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BitmapDarw
   {
      
      public function BitmapDarw()
      {
         super();
      }
      
      public static function scaleXY(param1:BitmapData, param2:Number, param3:Number, param4:Boolean = false) : BitmapData
      {
         // 缩放为1时直接返回原图，避免无意义的二次复制
         if(param2 == 1 && param3 == 1)
         { //
            return param1; // 
         } //
         var _loc5_:BitmapData = new BitmapData(param1.width * Math.abs(param2),param1.height * Math.abs(param3),true,0);
         var _loc6_:Matrix = new Matrix();
         _loc6_.scale(param2,param3);
         if(param2 < 0)
         {
            _loc6_.tx = -param1.width - param1.width * (param2 - 1);
         }
         if(param3 < 0)
         {
            _loc6_.ty = -param1.height - param1.height * (param3 - 1);
         }
         _loc5_.draw(param1,_loc6_,null,null);
         if(param4)
         {
            param1.dispose();
            param1 = null;
         }
         return _loc5_;
      }
      
      public static function ro(param1:Bitmap) : void
      {
         var _loc2_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         param1.rotation = 180;
         _loc2_.draw(param1,null,null);
         param1.bitmapData.dispose();
         param1.bitmapData = _loc2_;
         param1.rotation = 0;
      }
      
      public static function xmlForBitmapData(param1:BitmapData, param2:XML, param3:Number = 1, param4:Number = 1, param5:Boolean = true) : BitmapData
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:BitmapData = null;
         var _loc11_:uint = 0;
         if(param1 !== null)
         {
            _loc6_ = int(param2.@x);
            _loc7_ = int(param2.@y);
            _loc8_ = int(param2.@width);
            _loc9_ = int(param2.@height);
            if(_loc8_ == 0 || _loc9_ == 0)
            {
               return null;
            }
            _loc10_ = new BitmapData(_loc8_,_loc9_,true,0);
            _loc10_.copyPixels(param1,new Rectangle(_loc6_,_loc7_,_loc8_,_loc9_),new Point(),null,null,true);
            if(param5)
            {
               _loc11_ = _loc10_.getPixel32(0,0);
               if(_loc11_ == 4278190080)
               {
                  _loc10_.threshold(_loc10_,_loc10_.rect,new Point(),"==",4278190080,0);
               }
               else
               {
                  _loc11_ >= 4294900000;
               }
               _loc10_.threshold(_loc10_,_loc10_.rect,new Point(),"==",_loc11_,0);
            }
            return scaleXY(_loc10_,param3,param4,true);
         }
         return null;
      }
      
      public static function buttonBitmapDataArray(param1:BitmapData, param2:XML) : Array
      {
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < param2.SubTexture.length())
         {
            _loc3_.push(xmlForBitmapData(param1,param2.SubTexture[_loc4_]));
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

