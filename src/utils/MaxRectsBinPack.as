package utils
{
   import flash.geom.Rectangle;
   
   public class MaxRectsBinPack
   {
      
      public static const BESTSHORTSIDEFIT:int = 0;
      
      public static const BESTLONGSIDEFIT:int = 1;
      
      public static const BESTAREAFIT:int = 2;
      
      public static const BOTTOMLEFTRULE:int = 3;
      
      public static const CONTACTPOINTRULE:int = 4;
      
      public var binWidth:int = 0;
      
      public var binHeight:int = 0;
      
      public var allowRotations:Boolean = false;
      
      public var usedRectangles:Vector.<Rectangle> = new Vector.<Rectangle>();
      
      public var freeRectangles:Vector.<Rectangle> = new Vector.<Rectangle>();
      
      private var score1:int = 0;
      
      private var score2:int = 0;
      
      private var bestShortSideFit:int;
      
      private var bestLongSideFit:int;
      
      public function MaxRectsBinPack(param1:int, param2:int, param3:Boolean = false)
      {
         super();
         this.init(param1,param2,param3);
      }
      
      private function init(param1:int, param2:int, param3:Boolean = false) : void
      {
         if(this.count(param1) % 1 != 0 || this.count(param2) % 1 != 0)
         {
            throw new Error("Must be 2,4,8,16,32,...512,1024,...");
         }
         this.binWidth = param1;
         this.binHeight = param2;
         this.allowRotations = param3;
         var _loc4_:Rectangle = new Rectangle();
         _loc4_.x = 0;
         _loc4_.y = 0;
         _loc4_.width = param1;
         _loc4_.height = param2;
         this.usedRectangles.length = 0;
         this.freeRectangles.length = 0;
         this.freeRectangles.push(_loc4_);
      }
      
      private function count(param1:Number) : Number
      {
         if(param1 >= 2)
         {
            return this.count(param1 / 2);
         }
         return param1;
      }
      
      public function insert(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:Rectangle = new Rectangle();
         this.score1 = 0;
         this.score2 = 0;
         switch(param3)
         {
            case BESTSHORTSIDEFIT:
               _loc4_ = this.findPositionForNewNodeBestShortSideFit(param1,param2);
               break;
            case BOTTOMLEFTRULE:
               _loc4_ = this.findPositionForNewNodeBottomLeft(param1,param2,this.score1,this.score2);
               break;
            case CONTACTPOINTRULE:
               _loc4_ = this.findPositionForNewNodeContactPoint(param1,param2,this.score1);
               break;
            case BESTLONGSIDEFIT:
               _loc4_ = this.findPositionForNewNodeBestLongSideFit(param1,param2,this.score2,this.score1);
               break;
            case BESTAREAFIT:
               _loc4_ = this.findPositionForNewNodeBestAreaFit(param1,param2,this.score1,this.score2);
         }
         if(_loc4_.height == 0)
         {
            return _loc4_;
         }
         this.placeRectangle(_loc4_);
         return _loc4_;
      }
      
      private function insert2(param1:Vector.<Rectangle>, param2:Vector.<Rectangle>, param3:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Rectangle = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Rectangle = null;
         param2.length = 0;
         while(param1.length > 0)
         {
            _loc4_ = int.MAX_VALUE;
            _loc5_ = int.MAX_VALUE;
            _loc6_ = -1;
            _loc7_ = new Rectangle();
            _loc8_ = 0;
            while(_loc8_ < param1.length)
            {
               _loc9_ = 0;
               _loc10_ = 0;
               _loc11_ = this.scoreRectangle(param1[_loc8_].width,param1[_loc8_].height,param3,_loc9_,_loc10_);
               if(_loc9_ < _loc4_ || _loc9_ == _loc4_ && _loc10_ < _loc5_)
               {
                  _loc4_ = _loc9_;
                  _loc5_ = _loc10_;
                  _loc7_ = _loc11_;
                  _loc6_ = _loc8_;
               }
               _loc8_++;
            }
            if(_loc6_ == -1)
            {
               return;
            }
            this.placeRectangle(_loc7_);
            param1.splice(_loc6_,1);
         }
      }
      
      private function placeRectangle(param1:Rectangle) : void
      {
         var _loc2_:int = int(this.freeRectangles.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.splitFreeNode(this.freeRectangles[_loc3_],param1))
            {
               this.freeRectangles.splice(_loc3_,1);
               _loc3_--;
               _loc2_--;
            }
            _loc3_++;
         }
         this.pruneFreeList();
         this.usedRectangles.push(param1);
      }
      
      private function scoreRectangle(param1:int, param2:int, param3:int, param4:int, param5:int) : Rectangle
      {
         var _loc6_:Rectangle = new Rectangle();
         param4 = int.MAX_VALUE;
         param5 = int.MAX_VALUE;
         switch(param3)
         {
            case BESTSHORTSIDEFIT:
               _loc6_ = this.findPositionForNewNodeBestShortSideFit(param1,param2);
               break;
            case BOTTOMLEFTRULE:
               _loc6_ = this.findPositionForNewNodeBottomLeft(param1,param2,param4,param5);
               break;
            case CONTACTPOINTRULE:
               _loc6_ = this.findPositionForNewNodeContactPoint(param1,param2,param4);
               param4 = -param4;
               break;
            case BESTLONGSIDEFIT:
               _loc6_ = this.findPositionForNewNodeBestLongSideFit(param1,param2,param5,param4);
               break;
            case BESTAREAFIT:
               _loc6_ = this.findPositionForNewNodeBestAreaFit(param1,param2,param4,param5);
         }
         if(_loc6_.height == 0)
         {
            param4 = int.MAX_VALUE;
            param5 = int.MAX_VALUE;
         }
         return _loc6_;
      }
      
      private function occupancy() : Number
      {
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.usedRectangles.length)
         {
            _loc1_ += this.usedRectangles[_loc2_].width * this.usedRectangles[_loc2_].height;
            _loc2_++;
         }
         return _loc1_ / (this.binWidth * this.binHeight);
      }
      
      private function findPositionForNewNodeBottomLeft(param1:int, param2:int, param3:int, param4:int) : Rectangle
      {
         var _loc6_:Rectangle = null;
         var _loc7_:int = 0;
         var _loc5_:Rectangle = new Rectangle();
         param3 = int.MAX_VALUE;
         var _loc8_:int = 0;
         while(_loc8_ < this.freeRectangles.length)
         {
            _loc6_ = this.freeRectangles[_loc8_];
            if(_loc6_.width >= param1 && _loc6_.height >= param2)
            {
               _loc7_ = _loc6_.y + param2;
               if(_loc7_ < param3 || _loc7_ == param3 && _loc6_.x < param4)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param1;
                  _loc5_.height = param2;
                  param3 = _loc7_;
                  param4 = _loc6_.x;
               }
            }
            if(this.allowRotations && _loc6_.width >= param2 && _loc6_.height >= param1)
            {
               _loc7_ = _loc6_.y + param1;
               if(_loc7_ < param3 || _loc7_ == param3 && _loc6_.x < param4)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param2;
                  _loc5_.height = param1;
                  param3 = _loc7_;
                  param4 = _loc6_.x;
               }
            }
            _loc8_++;
         }
         return _loc5_;
      }
      
      private function findPositionForNewNodeBestShortSideFit(param1:int, param2:int) : Rectangle
      {
         var _loc4_:Rectangle = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc3_:Rectangle = new Rectangle();
         this.bestShortSideFit = int.MAX_VALUE;
         this.bestLongSideFit = this.score2;
         var _loc9_:int = 0;
         while(_loc9_ < this.freeRectangles.length)
         {
            _loc4_ = this.freeRectangles[_loc9_];
            if(_loc4_.width >= param1 && _loc4_.height >= param2)
            {
               _loc5_ = Math.abs(_loc4_.width - param1);
               _loc6_ = Math.abs(_loc4_.height - param2);
               _loc7_ = Math.min(_loc5_,_loc6_);
               _loc8_ = Math.max(_loc5_,_loc6_);
               if(_loc7_ < this.bestShortSideFit || _loc7_ == this.bestShortSideFit && _loc8_ < this.bestLongSideFit)
               {
                  _loc3_.x = _loc4_.x;
                  _loc3_.y = _loc4_.y;
                  _loc3_.width = param1;
                  _loc3_.height = param2;
                  this.bestShortSideFit = _loc7_;
                  this.bestLongSideFit = _loc8_;
               }
            }
            if(this.allowRotations && _loc4_.width >= param2 && _loc4_.height >= param1)
            {
               _loc10_ = Math.abs(_loc4_.width - param2);
               _loc11_ = Math.abs(_loc4_.height - param1);
               _loc12_ = Math.min(_loc10_,_loc11_);
               _loc13_ = Math.max(_loc10_,_loc11_);
               if(_loc12_ < this.bestShortSideFit || _loc12_ == this.bestShortSideFit && _loc13_ < this.bestLongSideFit)
               {
                  _loc3_.x = _loc4_.x;
                  _loc3_.y = _loc4_.y;
                  _loc3_.width = param2;
                  _loc3_.height = param1;
                  this.bestShortSideFit = _loc12_;
                  this.bestLongSideFit = _loc13_;
               }
            }
            _loc9_++;
         }
         return _loc3_;
      }
      
      private function findPositionForNewNodeBestLongSideFit(param1:int, param2:int, param3:int, param4:int) : Rectangle
      {
         var _loc6_:Rectangle = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:Rectangle = new Rectangle();
         param4 = int.MAX_VALUE;
         var _loc11_:int = 0;
         while(_loc11_ < this.freeRectangles.length)
         {
            _loc6_ = this.freeRectangles[_loc11_];
            if(_loc6_.width >= param1 && _loc6_.height >= param2)
            {
               _loc7_ = Math.abs(_loc6_.width - param1);
               _loc8_ = Math.abs(_loc6_.height - param2);
               _loc9_ = Math.min(_loc7_,_loc8_);
               _loc10_ = Math.max(_loc7_,_loc8_);
               if(_loc10_ < param4 || _loc10_ == param4 && _loc9_ < param3)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param1;
                  _loc5_.height = param2;
                  param3 = _loc9_;
                  param4 = _loc10_;
               }
            }
            if(this.allowRotations && _loc6_.width >= param2 && _loc6_.height >= param1)
            {
               _loc7_ = Math.abs(_loc6_.width - param2);
               _loc8_ = Math.abs(_loc6_.height - param1);
               _loc9_ = Math.min(_loc7_,_loc8_);
               _loc10_ = Math.max(_loc7_,_loc8_);
               if(_loc10_ < param4 || _loc10_ == param4 && _loc9_ < param3)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param2;
                  _loc5_.height = param1;
                  param3 = _loc9_;
                  param4 = _loc10_;
               }
            }
            _loc11_++;
         }
         return _loc5_;
      }
      
      private function findPositionForNewNodeBestAreaFit(param1:int, param2:int, param3:int, param4:int) : Rectangle
      {
         var _loc6_:Rectangle = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:Rectangle = new Rectangle();
         param3 = int.MAX_VALUE;
         var _loc11_:int = 0;
         while(_loc11_ < this.freeRectangles.length)
         {
            _loc6_ = this.freeRectangles[_loc11_];
            _loc10_ = _loc6_.width * _loc6_.height - param1 * param2;
            if(_loc6_.width >= param1 && _loc6_.height >= param2)
            {
               _loc7_ = Math.abs(_loc6_.width - param1);
               _loc8_ = Math.abs(_loc6_.height - param2);
               _loc9_ = Math.min(_loc7_,_loc8_);
               if(_loc10_ < param3 || _loc10_ == param3 && _loc9_ < param4)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param1;
                  _loc5_.height = param2;
                  param4 = _loc9_;
                  param3 = _loc10_;
               }
            }
            if(this.allowRotations && _loc6_.width >= param2 && _loc6_.height >= param1)
            {
               _loc7_ = Math.abs(_loc6_.width - param2);
               _loc8_ = Math.abs(_loc6_.height - param1);
               _loc9_ = Math.min(_loc7_,_loc8_);
               if(_loc10_ < param3 || _loc10_ == param3 && _loc9_ < param4)
               {
                  _loc5_.x = _loc6_.x;
                  _loc5_.y = _loc6_.y;
                  _loc5_.width = param2;
                  _loc5_.height = param1;
                  param4 = _loc9_;
                  param3 = _loc10_;
               }
            }
            _loc11_++;
         }
         return _loc5_;
      }
      
      private function commonIntervalLength(param1:int, param2:int, param3:int, param4:int) : int
      {
         if(param2 < param3 || param4 < param1)
         {
            return 0;
         }
         return Math.min(param2,param4) - Math.max(param1,param3);
      }
      
      private function contactPointScoreNode(param1:int, param2:int, param3:int, param4:int) : int
      {
         var _loc6_:Rectangle = null;
         var _loc5_:int = 0;
         if(param1 == 0 || param1 + param3 == this.binWidth)
         {
            _loc5_ += param4;
         }
         if(param2 == 0 || param2 + param4 == this.binHeight)
         {
            _loc5_ += param3;
         }
         var _loc7_:int = 0;
         while(_loc7_ < this.usedRectangles.length)
         {
            _loc6_ = this.usedRectangles[_loc7_];
            if(_loc6_.x == param1 + param3 || _loc6_.x + _loc6_.width == param1)
            {
               _loc5_ += this.commonIntervalLength(_loc6_.y,_loc6_.y + _loc6_.height,param2,param2 + param4);
            }
            if(_loc6_.y == param2 + param4 || _loc6_.y + _loc6_.height == param2)
            {
               _loc5_ += this.commonIntervalLength(_loc6_.x,_loc6_.x + _loc6_.width,param1,param1 + param3);
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      private function findPositionForNewNodeContactPoint(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc5_:Rectangle = null;
         var _loc6_:int = 0;
         var _loc4_:Rectangle = new Rectangle();
         param3 = -1;
         var _loc7_:int = 0;
         while(_loc7_ < this.freeRectangles.length)
         {
            _loc5_ = this.freeRectangles[_loc7_];
            if(_loc5_.width >= param1 && _loc5_.height >= param2)
            {
               _loc6_ = this.contactPointScoreNode(_loc5_.x,_loc5_.y,param1,param2);
               if(_loc6_ > param3)
               {
                  _loc4_.x = _loc5_.x;
                  _loc4_.y = _loc5_.y;
                  _loc4_.width = param1;
                  _loc4_.height = param2;
                  param3 = _loc6_;
               }
            }
            if(this.allowRotations && _loc5_.width >= param2 && _loc5_.height >= param1)
            {
               _loc6_ = this.contactPointScoreNode(_loc5_.x,_loc5_.y,param2,param1);
               if(_loc6_ > param3)
               {
                  _loc4_.x = _loc5_.x;
                  _loc4_.y = _loc5_.y;
                  _loc4_.width = param2;
                  _loc4_.height = param1;
                  param3 = _loc6_;
               }
            }
            _loc7_++;
         }
         return _loc4_;
      }
      
      private function splitFreeNode(param1:Rectangle, param2:Rectangle) : Boolean
      {
         var _loc3_:Rectangle = null;
         if(param2.x >= param1.x + param1.width || param2.x + param2.width <= param1.x || param2.y >= param1.y + param1.height || param2.y + param2.height <= param1.y)
         {
            return false;
         }
         if(param2.x < param1.x + param1.width && param2.x + param2.width > param1.x)
         {
            if(param2.y > param1.y && param2.y < param1.y + param1.height)
            {
               _loc3_ = param1.clone();
               _loc3_.height = param2.y - _loc3_.y;
               this.freeRectangles.push(_loc3_);
            }
            if(param2.y + param2.height < param1.y + param1.height)
            {
               _loc3_ = param1.clone();
               _loc3_.y = param2.y + param2.height;
               _loc3_.height = param1.y + param1.height - (param2.y + param2.height);
               this.freeRectangles.push(_loc3_);
            }
         }
         if(param2.y < param1.y + param1.height && param2.y + param2.height > param1.y)
         {
            if(param2.x > param1.x && param2.x < param1.x + param1.width)
            {
               _loc3_ = param1.clone();
               _loc3_.width = param2.x - _loc3_.x;
               this.freeRectangles.push(_loc3_);
            }
            if(param2.x + param2.width < param1.x + param1.width)
            {
               _loc3_ = param1.clone();
               _loc3_.x = param2.x + param2.width;
               _loc3_.width = param1.x + param1.width - (param2.x + param2.width);
               this.freeRectangles.push(_loc3_);
            }
         }
         return true;
      }
      
      private function pruneFreeList() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.freeRectangles.length)
         {
            _loc2_ = _loc1_ + 1;
            while(_loc2_ < this.freeRectangles.length)
            {
               if(this.isContainedIn(this.freeRectangles[_loc1_],this.freeRectangles[_loc2_]))
               {
                  this.freeRectangles.splice(_loc1_,1);
                  break;
               }
               if(this.isContainedIn(this.freeRectangles[_loc2_],this.freeRectangles[_loc1_]))
               {
                  this.freeRectangles.splice(_loc2_,1);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      private function isContainedIn(param1:Rectangle, param2:Rectangle) : Boolean
      {
         return param1.x >= param2.x && param1.y >= param2.y && param1.x + param1.width <= param2.x + param2.width && param1.y + param1.height <= param2.y + param2.height;
      }
   }
}

