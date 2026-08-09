package tmx
{
   import utils.RightUtils;
   
   public class EventSprite extends PoltDisplay
   {
      
      public static const TIME_EVENT:String = "time_event";
      
      public static const ONEC_EVENT:String = "onec_event";
      
      public static const WARP_EVENT:String = "warp_event";
      
      public static const REPEAT_EVENT:String = "repeat_event";
      
      public var type:String = "";
      
      public var time:int = 0;
      
      public var go:String = "";
      
      public var to:String = "";
      
      public function EventSprite()
      {
         super();
         this.graphics.beginFill(16776960,0.5);
         this.graphics.drawRect(0,0,100,100);
         this.graphics.endFill();
         _rTools.parent.removeChild(_rTools);
         _mTools.parent.removeChild(_mTools);
         RightUtils.onRightClick(this,"event");
      }
      
      override public function toObject() : Object
      {
         var _loc1_:Object = super.toObject();
         _loc1_.type = this.type;
         _loc1_.go = this.go;
         _loc1_.to = this.to;
         return _loc1_;
      }
   }
}

