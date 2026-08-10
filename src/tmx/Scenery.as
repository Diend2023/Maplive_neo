package tmx
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import utils.RightUtils;
   
   public class Scenery extends SaveObject
   {
      
      public static var _array:Array = ["name","target"];
      
      public var targetName:String;
      
      public var currentTargetName:String;
      
      public var sprite:Shape;
      
      public var rootClass:String = "<null>";
      
      public var bitmapData:BitmapData;
      
      private var _scaleX:Number = 1;
      
      private var _scaleY:Number = 1;
      
      public var isRepeat:Boolean = false;
      
      public function Scenery(param1:String, param2:String, param3:BitmapData, param4:XML)
      {
         super();
         this.bitmapData = param3;
         this.currentTargetName = param2;
         this.targetName = param1;
         RightUtils.onRightClick(this,"sceneryKey");
         this.sprite = new Shape();
         this.addChild(this.sprite);
         if(param4)
         {
            this.sprite.x = -param4.@frameX;
            this.sprite.y = -param4.@frameY;
         }
         this.updateDraw();
      }
      
      override public function set scaleX(param1:Number) : void
      {
         this._scaleX = param1;
         if(!this.isRepeat)
         {
            super.scaleX = param1;
         }
         else
         {
            super.scaleX = param1 > 0 ? 1 : -1;
         }
         this.updateDraw();
      }
      
      override public function get scaleX() : Number
      {
         return this._scaleX;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         this._scaleY = param1;
         if(!this.isRepeat)
         {
            super.scaleY = param1;
         }
         else
         {
            super.scaleY = param1 > 0 ? 1 : -1;
         }
         this.updateDraw();
      }
      
      override public function get scaleY() : Number
      {
         return this._scaleY;
      }
      
      public function updateDraw() : void
      {
         this.sprite.graphics.clear();
         if(this.isRepeat)
         {
            this.sprite.graphics.beginBitmapFill(this.bitmapData);
            this.sprite.graphics.drawRect(0,0,this.bitmapData.width * Math.abs(this.scaleX),this.bitmapData.height * Math.abs(this.scaleX));
            this.sprite.graphics.endFill();
         }
         else
         {
            this.sprite.graphics.beginBitmapFill(this.bitmapData);
            this.sprite.graphics.drawRect(0,0,this.bitmapData.width,this.bitmapData.height);
            this.sprite.graphics.endFill();
         }
      }
      
      override public function getName() : String
      {
         return this.targetName;
      }
      
      override public function toObject() : Object
      {
         return {
            "scaleX":this.scaleX,
            "scaleY":this.scaleY,
            "name":this.targetName,
            "x":this.x,
            "y":this.y,
            "rotation":this.rotation,
            "target":this.currentTargetName,
            "instanceName":this.instanceName,
            "other":this.other,
            "pingpu":this.pingpu
         };
      }
      
      public function applyObject(param1:Object) : void
      {
         var _loc2_:Object = null;
         for(_loc2_ in param1)
         {
            if(_array.indexOf(_loc2_) == -1)
            {
               this[_loc2_] = param1[_loc2_];
            }
         }
      }
      
      public function select(param1:Boolean) : void
      {
         if(param1)
         {
            this.filters = [new DropShadowFilter(0,45,16711680)];
         }
         else
         {
            this.filters = null;
         }
      }
      
      public function drawCenterLine() : void
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16711680);
         _loc1_.graphics.drawRect(0,0,100,1);
         _loc1_.graphics.drawRect(0,0,1,100);
         _loc1_.graphics.drawRect(0,0,-100,1);
         _loc1_.graphics.drawRect(0,0,1,-100);
         this.addChild(_loc1_);
      }
      
      override public function get classBind() : String
      {
         var _loc1_:Class = null;
         if(App.superSwf)
         {
            _loc1_ = App.superSwf.findClassFormName(this.rootClass,this.getName());
            if(!_loc1_)
            {
               return "<null>";
            }
            return String(_loc1_);
         }
         return "<null>";
      }
      
      override public function set pingpu(param1:Boolean) : void
      {
         super.pingpu = param1;
         this.isRepeat = param1;
         this.updateDraw();
      }
      
      override public function get attribute() : Array
      {
         var _loc1_:Class = null;
         if(App.superSwf)
         {
            _loc1_ = App.superSwf.findClassFormName(this.rootClass,this.getName());
            if(Boolean(_loc1_) && Boolean(_loc1_.PNAME))
            {
               return (_loc1_.PNAME as Array).concat("isCanHit","isThrough");
            }
         }
         return null;
      }

      override public function clear() : void //
      { //
         if(this.bitmapData) //
         { //
            // bitmapData 来自 pool 子图，由 SpriteBitmapData.dispose() 统一释放，这里只断引用
            this.bitmapData = null; //
         } //
         this.removeChildren(); //
      } //

   }
}

