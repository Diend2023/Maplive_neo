package views.observe.text
{
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class HitDarwSprite extends Sprite
   {
      
      public var point:Vector.<Point>;
      
      public var isEnd:Boolean = true;
      
      public function HitDarwSprite()
      {
         super();
         this.point = new Vector.<Point>();
      }
      
      public function push(param1:Point) : void
      {
         this.alpha = 0.5;
         if(this.isEnd)
         {
            this.clear();
         }
         this.point.push(param1);
         if(this.point.length == 1)
         {
            this.graphics.moveTo(param1.x,param1.y);
         }
         else
         {
            this.graphics.lineTo(param1.x,param1.y);
         }
      }
      
      public function clear() : void
      {
         this.point.splice(0,this.point.length);
         this.graphics.clear();
         this.graphics.beginFill(16711680,0.5);
         this.graphics.lineStyle(1,255);
         this.isEnd = false;
      }
      
      public function over() : void
      {
         this.isEnd = true;
         this.graphics.endFill();
         if(this.point.length < 3)
         {
            this.clear();
         }
      }
      
      public function getPointValue() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.point.length)
         {
            _loc1_ += this.point[_loc2_].x + "," + this.point[_loc2_].y + " ";
            _loc2_++;
         }
         return _loc1_.substr(0,_loc1_.length - 1);
      }
      
      public function drawPoint(param1:Object) : void
      {
         var _loc2_:Vector.<Point> = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:Point = null;
         this.clear();
         if(param1 is Vector.<Point>)
         {
            _loc2_ = param1 as Vector.<Point>;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               this.push(_loc2_[_loc3_]);
               _loc3_++;
            }
         }
         else
         {
            if(param1 == null)
            {
               return;
            }
            _loc4_ = param1.split(" ");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = _loc4_[_loc5_].split(",");
               _loc7_ = new Point(int(_loc6_[0]),int(_loc6_[1]));
               this.push(_loc7_);
               _loc5_++;
            }
         }
         this.over();
         this.alpha = 1;
      }
   }
}

