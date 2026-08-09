package views.attribute
{
   import events.OpenEvent;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import spark.components.NavigatorContent;
   
   public class RefAttribute extends NavigatorContent
   {
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      public var blends:ArrayCollection;
      
      public function RefAttribute()
      {
         this.blends = new ArrayCollection([{
            "name":"正常",
            "value":"normal"
         },{
            "name":"高光",
            "value":"screen"
         },{
            "name":"白底特效",
            "value":"white"
         },{
            "name":"去灰",
            "value":"black"
         },{
            "name":"改色",
            "value":"changeColor"
         },{
            "name":"高光改色",
            "value":"changeColor2"
         }]);
         super();
         this.addEventListener(OpenEvent.ATTRIBUTE_CHANGE,function(param1:Event):void
         {
            onChannge();
         });
      }
      
      public function onChannge() : void
      {
         this.dispatchEvent(new Event(OpenEvent.CHANGE,true));
      }
   }
}

