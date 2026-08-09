package tmx
{
   import dragonBones.flash.FlashArmatureDisplay;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import utils.RightUtils;
   
   public class DragonNpc extends PoltDisplay
   {
      
      public var dragon:FlashArmatureDisplay;
      
      private var _spr:Sprite;
      
      private var _path:String;
      
      private var _line:Shape;
      
      public function DragonNpc(param1:FlashArmatureDisplay, param2:String)
      {
         super();
         this.dragon = param1;
         this._path = param2;
         this.addChild(this.dragon);
         this.mouseChildren = true;
         this._spr = new Sprite();
         this.addChild(this._spr);
         param1.mouseEnabled = false;
         this._spr.mouseEnabled = false;
         this._line = new Shape();
         this._line.graphics.beginFill(65280);
         this._line.graphics.drawRect(0,0,100,1);
         this._line.graphics.drawRect(0,0,1,100);
         this._line.graphics.drawRect(0,0,-100,1);
         this._line.graphics.drawRect(0,0,1,-100);
         this.addChild(this._line);
         RightUtils.onRightClick(this,"npcKey");
      }
      
      override public function getName() : String
      {
         return this.dragon.armature.name;
      }
      
      override public function getPath() : String
      {
         return this._path;
      }
      
      override public function onSelect(param1:Boolean) : void
      {
         this.drawRect(param1 ? this.dragon.getBounds(null) : null);
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         this._line.scaleX = 1 / param1;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         this._line.scaleY = 1 / param1;
      }
      
      override public function get attribute() : Array
      {
         var _loc1_:Array = null;
         if(App.superSwf)
         {
            _loc1_ = App.superSwf.getAttributeList(classBind);
            if(_loc1_)
            {
               return _loc1_.concat("isCanHit","isThrough","liveRectEvent");
            }
         }
         return ["isCanHit","isThrough","liveRectEvent"];
      }
      
      override public function clear() : void
      {
         this.removeChild(this.dragon);
         this.dragon.armature.clock.remove(this.dragon.armature);
         this.dragon.dispose();
         this.dragon = null;
      }
   }
}

