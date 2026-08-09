package events
{
   import flash.events.Event;
   
   public class RightClickEvent extends Event
   {
      
      public static const CLICK:String = "right_click";
      
      public var clickTag:String;
      
      public function RightClickEvent(param1:String, param2:String)
      {
         this.clickTag = param2;
         super(param1,true);
      }
   }
}

