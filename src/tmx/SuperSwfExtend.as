package tmx
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import utils.FileUtils;
   
   public class SuperSwfExtend
   {
      
      private var _content:Loader;
      
      public function SuperSwfExtend(param1:String)
      {
         var content:LoaderContext;
         var byte:ByteArray;
         var loader:Loader = null;
         var _url:String = param1;
         super();
         content = new LoaderContext();
         content.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
         content.allowLoadBytesCodeExecution = true;
         byte = FileUtils.readBytes(App.projectFile.resolvePath("runtime"));
         loader = new Loader();
         loader.loadBytes(byte,content);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function():void
         {
            _content = loader;
         });
      }
      
      public function getAttributeList(param1:String) : Array
      {
         var _loc2_:Class = null;
         try
         {
            _loc2_ = this._content.contentLoaderInfo.applicationDomain.getDefinition(param1) as Class;
            if(Boolean(_loc2_) && Boolean(_loc2_.PNAME))
            {
               return _loc2_.PNAME as Array;
            }
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      public function findClassFormName(param1:String, param2:String) : Class
      {
         var pclass:Class = null;
         var className:String = param1;
         var findName:String = param2;
         try
         {
            pclass = this._content.contentLoaderInfo.applicationDomain.getDefinition(className) as Class;
         }
         catch(e:Error)
         {
            return null;
         }
         findName = findName.substr(0,findName.indexOf("."));
         if(Boolean(pclass) && Boolean(pclass[findName]))
         {
            return pclass[findName];
         }
         return null;
      }
   }
}

