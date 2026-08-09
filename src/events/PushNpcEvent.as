package events
{
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class PushNpcEvent extends Event
   {
      
      public static const ADD_NPC:String = "add_npc";
      
      public var file:File;
      
      public function PushNpcEvent(param1:String, param2:File)
      {
         super(param1,true);
         this.file = param2;
      }
   }
}

