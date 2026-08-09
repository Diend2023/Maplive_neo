package utils
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import mx.collections.ArrayCollection;
   
   public class SwfClassUtils
   {
      
      private static var _class:Vector.<String> = new Vector.<String>();
      
      private static var _array:ArrayCollection = new ArrayCollection();
      
      public function SwfClassUtils()
      {
         super();
      }
      
      public static function loadSwf(param1:File, param2:Function) : void
      {
         var loader:Loader = null;
         var file:File = param1;
         var func:Function = param2;
         var byte:ByteArray = FileUtils.readBytes(file);
         loader = new Loader();
         var loaderContext:LoaderContext = new LoaderContext();
         loaderContext.allowCodeImport = true;
         loader.loadBytes(byte,loaderContext);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc4_:Object = null;
            var _loc2_:Array = [];
            var _loc3_:String = "";
            for(_loc4_ in loader.contentLoaderInfo.applicationDomain.getQualifiedDefinitionNames())
            {
               _loc3_ = loader.contentLoaderInfo.applicationDomain.getQualifiedDefinitionNames()[_loc4_];
               if(_loc3_.indexOf("game.display.extend") == 0)
               {
                  _loc2_.push(_loc3_);
                  _array.addItem({
                     "name":_loc3_.substr(_loc3_.indexOf("::") + 2),
                     "src":_loc3_,
                     "file":file.name
                  });
               }
            }
            func(_loc2_);
         });
      }
      
      public static function chaekIsClass(param1:File) : Boolean
      {
         if(param1.extension == "class" || param1.extension == "swf")
         {
            return true;
         }
         return false;
      }
      
      public static function arrToXml(param1:Array) : XML
      {
         var _loc4_:Object = null;
         if(param1.length == 0)
         {
            return null;
         }
         var _loc2_:XML = <src/>;
         var _loc3_:XML = null;
         for(_loc4_ in param1)
         {
            _loc3_ = <as/>;
            _loc3_.@label = param1[_loc4_];
            _loc3_.@icon = "code";
            _loc2_.appendChild(_loc3_);
         }
         return _loc2_;
      }
      
      public static function getClasses() : ArrayCollection
      {
         return _array;
      }
   }
}

