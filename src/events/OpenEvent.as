package events
{
   import flash.events.Event;
   import flash.filesystem.File;
   
   public class OpenEvent extends Event
   {
      
      public static const OPEN:String = "open";
      
      public static const SAVE:String = "save";
      
      public static const CHANGE:String = "project_change";
      
      public static const ATTRIBUTE_CHANGE:String = "attribute_change";
      
      public static const REFRESH:String = "refresh";
      
      public static const TRASH:String = "trash";
      
      public static const TRASH_DRAW:String = "trash_draw";
      
      public static const ADD_MAP_SPRITE:String = "add_map_sprite";
      
      public static const LAYER_CHANNGE:String = "layer_channge";
      
      public static const ACTION_EVENT:String = "ation_event";
      
      public static const ADD_TARGET:String = "add_target";
      
      public static const ADD_EVENT:String = "add_event";
      
      public var file:File;
      
      public var saveContent:Object;
      
      public function OpenEvent(param1:String, param2:File = null, param3:String = null)
      {
         this.file = param2;
         this.saveContent = param3;
         super(param1,true);
      }
   }
}

