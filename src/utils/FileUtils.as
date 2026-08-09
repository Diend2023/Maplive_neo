package utils
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   
   public class FileUtils
   {
      
      public function FileUtils()
      {
         super();
      }
      
      public static function fileToXml(param1:File) : XML
      {
         var _loc2_:XML = <project/>;
         _loc2_.@label = param1.name;
         return putXml(_loc2_,param1);
      }
      
      public static function putFile(param1:XML, param2:File) : void
      {
         var newxml:XML = null;
         var xml:XML = param1;
         var file:File = param2;
         newxml = null;
         newxml = <file/>;
         newxml.@label = file.name;
         newxml.@icon = getIconByFile(file);
         newxml.@file = file.nativePath;
         if(newxml.@icon == null)
         {
            delete newxml.@icon;
         }
         xml.appendChild(newxml);
         if(SwfClassUtils.chaekIsClass(file))
         {
            SwfClassUtils.loadSwf(file,function(param1:Array):void
            {
               var _loc3_:XMLList = null;
               var _loc4_:Object = null;
               var _loc2_:XML = SwfClassUtils.arrToXml(param1);
               if(_loc2_)
               {
                  _loc3_ = _loc2_.children();
                  for(_loc4_ in _loc3_)
                  {
                     newxml.appendChild(_loc3_[_loc4_]);
                  }
               }
            });
         }
      }
      
      public static function putXml(param1:XML, param2:File) : XML
      {
         var _loc6_:Object = null;
         var _loc3_:Array = param2.getDirectoryListing();
         var _loc4_:File = null;
         var _loc5_:XML = null;
         for(_loc6_ in _loc3_)
         {
            _loc4_ = _loc3_[_loc6_] as File;
            if(_loc4_.isDirectory)
            {
               _loc5_ = <dir/>;
               _loc5_.@label = getDirString(_loc4_);
               _loc5_.@file = _loc4_.nativePath;
               param1.appendChild(putXml(_loc5_,_loc4_));
            }
            else if(!_loc4_.isHidden)
            {
               putFile(param1,_loc4_);
            }
         }
         return param1;
      }
      
      public static function getDirString(param1:File) : String
      {
         switch(param1.name)
         {
            case "tmx":
               return "地图";
            case "npc":
               return "动态元素";
            case "scenery":
               return "地图元素";
            case "bg":
               return "背景";
            case "bgm":
               return "背景音乐";
            case "extendsSwf":
               return "扩展类";
            case "role":
               return "战斗元素";
            case "effect":
               return "特效元素";
            default:
               return param1.name;
         }
      }
      
      public static function getIconByFile(param1:File) : String
      {
         switch(param1.extension)
         {
            case "tmx":
               return "map";
            case "jpg":
            case "png":
               return "picture";
            case "xml":
            case "txt":
               return "documentContent";
            case "mp3":
               return "sound";
            case "class":
            case "swf":
               return "codeDir";
            case "data":
               return "fight";
            default:
               return null;
         }
      }
      
      public static function readString(param1:File) : String
      {
         var _loc2_:FileStream = new FileStream();
         _loc2_.open(param1,FileMode.READ);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:String = _loc3_.toString();
         _loc2_.close();
         return _loc4_;
      }
      
      public static function writeString(param1:File, param2:String) : void
      {
         var _loc3_:FileStream = new FileStream();
         _loc3_.open(param1,FileMode.WRITE);
         _loc3_.writeUTFBytes(param2);
         _loc3_.close();
      }
      
      public static function readBytes(param1:File) : ByteArray
      {
         var _loc2_:FileStream = new FileStream();
         _loc2_.open(param1,FileMode.READ);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         _loc2_.close();
         return _loc3_;
      }
      
      public static function writeBytes(param1:File, param2:ByteArray) : void
      {
         var _loc3_:FileStream = new FileStream();
         _loc3_.open(param1,FileMode.WRITE);
         _loc3_.writeBytes(param2);
         _loc3_.close();
      }
      
      public static function getArrayCollectionConfig(param1:File) : ArrayCollection
      {
         var _loc5_:Object = null;
         var _loc2_:ArrayCollection = new ArrayCollection();
         var _loc3_:Array = param1.getDirectoryListing();
         var _loc4_:File = null;
         for(_loc5_ in _loc3_)
         {
            _loc4_ = _loc3_[_loc5_] as File;
            if(!_loc4_.isDirectory && !_loc4_.isHidden && _loc4_.extension == "png")
            {
               _loc2_.addItem({
                  "name":_loc4_.name,
                  "file":_loc4_
               });
            }
         }
         return _loc2_;
      }
      
      public static function readImage(param1:File, param2:Function) : void
      {
         var file:File = param1;
         var func:Function = param2;
         var urlLoader:URLLoader = new URLLoader(new URLRequest(file.url));
         urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
         urlLoader.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc2_:Loader = new Loader();
            _loc2_.loadBytes(param1.target.data as ByteArray);
            _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,func);
         });
         urlLoader.addEventListener(IOErrorEvent.IO_ERROR,function(param1:IOErrorEvent):void
         {
            Alert.show("无法加载" + file.nativePath,"加载失败");
         });
      }
      
      public static function decode(param1:ByteArray, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            param1[_loc3_] += param2;
            _loc3_++;
         }
      }
      
      public static function uncode(param1:ByteArray, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            param1[_loc3_] -= param2;
            _loc3_++;
         }
      }
      
      public static function playSound(param1:File) : SoundChannel
      {
         var _loc2_:Sound = null;
         if(param1.exists)
         {
            _loc2_ = new Sound(new URLRequest(param1.url));
            return _loc2_.play();
         }
         return null;
      }
   }
}

