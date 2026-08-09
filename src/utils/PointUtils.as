package utils
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class PointUtils
   {
      
      public function PointUtils()
      {
         super();
      }
      
      public static function getRotation(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Math.atan2(param2.y - param1.y,param2.x - param1.x);
         return _loc3_ * (180 / Math.PI);
      }
      
      public static function getAngle(param1:Number) : Number
      {
         return param1 / (180 / Math.PI);
      }
      
      public static function setCenterPoint(param1:DisplayObject) : void
      {
         var _loc2_:Point = param1.parent.globalToLocal(new Point(param1.stage.stageWidth / 2,param1.stage.stageHeight / 2));
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
      }
      
      public static function getSaveData(param1:Vector.<Point>) : String
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_].x + "," + param1[_loc3_].y + " ";
            _loc3_++;
         }
         return _loc2_.substr(0,_loc2_.length - 1);
      }
      
      public static function setSaveData(param1:Vector.<Point>, param2:String) : void
      {
         var _loc5_:Array = null;
         var _loc3_:Array = param2.split(" ");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_].split(",");
            param1.push(new Point(int(_loc5_[0]),int(_loc5_[1])));
            _loc4_++;
         }
      }
      
      public static function getClockwisePoints(param1:Vector.<Point>) : Vector.<Point>
      {
         var _loc9_:int = 0;
         var _loc2_:Vector.<Point> = null;
         var _loc3_:Point = getMinXPoint(param1);
         var _loc4_:Vector.<Point> = new Vector.<Point>();
         var _loc5_:int = int(param1.indexOf(_loc3_));
         param1 = param1.concat(param1);
         _loc4_.push(param1[_loc5_],param1[_loc5_ + 1],param1[_loc5_ + 2]);
         var _loc6_:Point = _loc4_[0].subtract(_loc4_[1]);
         var _loc7_:Point = _loc4_[1].subtract(_loc4_[2]);
         var _loc8_:Number = _loc6_.x * _loc7_.y - _loc6_.y * _loc7_.x;
         if(_loc8_ < -1)
         {
            _loc2_ = new Vector.<Point>();
            _loc9_ = int(param1.length - 1);
            while(_loc9_ >= 0)
            {
               _loc2_.push(param1[_loc9_]);
               _loc9_--;
            }
         }
         else
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      public static function getMinXPoints(param1:Vector.<Point>) : Vector.<Point>
      {
         var _loc5_:int = 0;
         var _loc2_:Vector.<Point> = new Vector.<Point>();
         var _loc3_:Point = getMinXPoint(param1);
         var _loc4_:int = int(param1.indexOf(_loc3_));
         if(_loc4_ == 0)
         {
            return param1;
         }
         _loc5_ = _loc4_ + 1;
         if(_loc5_ >= param1.length)
         {
            _loc5_ = 0;
         }
         _loc2_.push(_loc3_);
         while(_loc5_ != _loc4_)
         {
            _loc2_.push(param1[_loc5_]);
            if(++_loc5_ >= param1.length)
            {
               _loc5_ = 0;
            }
         }
         return _loc2_;
      }
      
      public static function getMaxXPoint(param1:Vector.<Point>) : Point
      {
         var _loc3_:Object = null;
         var _loc2_:Point = param1[0];
         for(_loc3_ in param1)
         {
            if(param1[_loc3_].x > _loc2_.x)
            {
               _loc2_ = param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      public static function getMinXPoint(param1:Vector.<Point>) : Point
      {
         var _loc3_:Object = null;
         var _loc2_:Point = param1[0];
         for(_loc3_ in param1)
         {
            if(param1[_loc3_].x < _loc2_.x)
            {
               _loc2_ = param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      public static function getMaxYPoint(param1:Vector.<Point>) : Point
      {
         var _loc3_:Object = null;
         var _loc2_:Point = param1[0];
         for(_loc3_ in param1)
         {
            if(param1[_loc3_].y > _loc2_.y)
            {
               _loc2_ = param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      public static function getMinYPoint(param1:Vector.<Point>) : Point
      {
         var _loc3_:Object = null;
         var _loc2_:Point = param1[0];
         for(_loc3_ in param1)
         {
            if(param1[_loc3_].y < _loc2_.y)
            {
               _loc2_ = param1[_loc3_];
            }
         }
         return _loc2_;
      }
      
      public static function pointToLine(param1:Point, param2:Point, param3:Point) : Number
      {
         var _loc4_:Number = 0;
         var _loc5_:Number = Point.distance(param1,param2);
         var _loc6_:Number = Point.distance(param1,param3);
         var _loc7_:Number = Point.distance(param2,param3);
         if(_loc7_ + _loc6_ == _loc5_)
         {
            return 0;
         }
         if(_loc7_ * _loc7_ >= _loc5_ * _loc5_ + _loc6_ * _loc6_)
         {
            return _loc6_;
         }
         if(_loc6_ * _loc6_ >= _loc5_ * _loc5_ + _loc7_ * _loc7_)
         {
            return _loc7_;
         }
         var _loc8_:Number = (_loc5_ + _loc6_ + _loc7_) / 2;
         var _loc9_:Number = Math.sqrt(_loc8_ * (_loc8_ - _loc5_) * (_loc8_ - _loc6_) * (_loc8_ - _loc7_));
         return 2 * _loc9_ / _loc5_;
      }
   }
}

