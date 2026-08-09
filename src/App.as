package
{
   import flash.filesystem.File;
   import flash.net.SharedObject;
   import tmx.SuperSwfExtend;
   import utils.FileUtils;
   
   public class App
   {
      
      private static var _projectFile:File;
      
      public static var config:XML;
      
      public static var superSwf:SuperSwfExtend;
      
      public static var shareData:SharedObject = SharedObject.getLocal("net.zygame.maplive");
      
      public function App()
      {
         super();
      }
      
      public static function setValue(param1:String, param2:Object) : void
      {
         shareData.data[param1] = param2;
         shareData.flush();
      }
      
      public static function set projectFile(param1:File) : void
      {
         config = null;
         _projectFile = param1;
         if(param1.resolvePath("config.xml").exists)
         {
            config = XML(FileUtils.readString(param1.resolvePath("config.xml")));
         }
      }
      
      public static function get projectFile() : File
      {
         return _projectFile;
      }
      
      public static function getValue(param1:String) : Object
      {
         return shareData.data[param1];
      }
      
      public static function get history() : Array
      {
         return getValue("history") as Array;
      }
      
      public static function pushHistory(param1:String) : void
      {
         var _loc2_:Array = history;
         if(!_loc2_)
         {
            _loc2_ = [];
         }
         if(_loc2_.indexOf(param1) == -1)
         {
            _loc2_.push(param1);
         }
         setValue("history",_loc2_);
      }
   }
}

