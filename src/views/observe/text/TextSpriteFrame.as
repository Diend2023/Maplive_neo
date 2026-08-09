package views.observe.text
{
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class TextSpriteFrame extends Sprite
   {
      
      public var id:int = 0;
      
      public var data:XML;
      
      public var hitPointReference:Vector.<Point>;
      
      public var hitFrameReference:TextSpriteFrame;
      
      public function TextSpriteFrame(param1:XML)
      {
         var _loc5_:Array = null;
         var _loc6_:Point = null;
         super();
         this.data = param1;
         var _loc2_:String = String(param1.@hitPoint);
         if(_loc2_ == null)
         {
            return;
         }
         this.hitPointReference = new Vector.<Point>();
         var _loc3_:Array = _loc2_.split(" ");
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_].split(",");
            _loc6_ = new Point(int(_loc5_[0]),int(_loc5_[1]));
            this.hitPointReference.push(_loc6_);
            _loc4_++;
         }
      }
      
      public function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(3355443,0);
         this.graphics.drawRect(0,0,8,32);
         this.graphics.endFill();
         if(!this.isHitPoint() && this.hitPointReference && this.hitPointReference.length > 2)
         {
            this.graphics.beginFill(56831);
         }
         else
         {
            this.graphics.beginFill(this.data.@hitPoint != undefined && String(this.data.@hitPoint) != "" ? 255 : 3355443);
         }
         this.graphics.drawRect(1,1,6,29);
         this.graphics.endFill();
      }
      
      public function select(param1:Boolean) : void
      {
         this.draw();
         if(param1)
         {
            this.graphics.beginFill(16776960,0.8);
            this.graphics.drawRect(0,0,8,32);
         }
      }
      
      public function isHitPoint() : Boolean
      {
         return this.data.@hitPoint != "" && this.data.@hitPoint != undefined;
      }
      
      public function get live() : int
      {
         if(this.hitFrameReference)
         {
            return this.hitFrameReference.live;
         }
         return int(this.data.@hitEffect);
      }
      
      public function get hurt() : int
      {
         if(this.hitFrameReference)
         {
            return this.hitFrameReference.hurt;
         }
         return int(this.data.@hurtInterval);
      }
   }
}

