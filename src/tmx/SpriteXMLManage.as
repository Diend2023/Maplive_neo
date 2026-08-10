package tmx
{
   import dragonBones.flash.FlashArmatureDisplay;
   import dragonBones.flash.FlashFactory;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   import flash.net.URLRequest;
   import flash.system.System;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   import mx.controls.Alert;
   import utils.FileUtils;
   
   public class SpriteXMLManage
   {
      
      private var _dict:Dictionary;
      
      private var _loads:Array;
      
      private var _batchFunc:Function;
      
      public var extendData:Object = null;
      
      public var projectRootFile:File;
      
      public var dragonFactory:FlashFactory;
      
      public var dragonNames:Array;
      
      public function SpriteXMLManage()
      {
         super();
         this._dict = new Dictionary();
         this.dragonNames = [];
         this.dragonFactory = new FlashFactory();
         this.dragonFactory.autoSearch = false;
      }
      
      public function load(param1:File, param2:Function) : void
      {
         var loader:Loader;
         var fileName:String = null;
         var xml:XML = null;
         var file:File = param1;
         var func:Function = param2;
         fileName = file.name.substr(0,file.name.indexOf("."));
         if(file.extension == "png")
         {
            file = file.parent.resolvePath(fileName + ".xml");
         }
         if(this._dict[fileName] != null)
         {
            func(this._dict[fileName]);
            return;
         }
         xml = new XML(FileUtils.readString(file));
         loader = new Loader();
         loader.load(new URLRequest(file.parent.resolvePath(xml.@imagePath).url));
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc2_:LoaderInfo = param1.target as LoaderInfo;
            _dict[fileName] = new SpriteBitmapData(fileName,getFilePath(file),xml,(_loc2_.content as Bitmap).bitmapData);
            func(_dict[fileName]);
         });
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
         {
            func(null);
         });
      }
      
      public function loadDragon(param1:File, param2:Function) : void
      {
         var loader:Loader;
         var skeObject:Object = null;
         var texObject:Object = null;
         var file:File = param1;
         var func:Function = param2;
         var filename:String = file.name;
         filename = filename.substr(0,filename.lastIndexOf("_"));
         var skejson:String = filename + "_ske.json";
         var texjson:String = filename + "_tex.json";
         var texpng:String = filename + "_tex.png";
         var skeObjectFile:File = file.parent.resolvePath(skejson);
         if(!skeObjectFile.exists)
         {
            setTimeout(function():void
            {
               func(null,null);
            },100);
            return;
         }
         skeObject = JSON.parse(FileUtils.readString(skeObjectFile));
         if(this.dragonNames.indexOf(skeObject.armature[0].name) != -1)
         {
            func(this.dragonFactory.buildArmature(skeObject.armature[0].name).display,this.getFilePath(file));
            return;
         }
         texObject = JSON.parse(FileUtils.readString(file.parent.resolvePath(texjson)));
         loader = new Loader();
         loader.load(new URLRequest(file.url));
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            var _loc2_:LoaderInfo = param1.target as LoaderInfo;
            try
            {
               dragonFactory.parseDragonBonesData(skeObject);
               dragonFactory.parseTextureAtlasData(texObject,(_loc2_.content as Bitmap).bitmapData);
            }
            catch(e:Error)
            {
            }
            dragonNames.push(skeObject.armature[0].name);
            func(dragonFactory.buildArmature(skeObject.armature[0].name).display,getFilePath(file));
         });
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
         {
            func(null,null);
         });
      }
      
      public function loadTMXData(param1:XML, param2:Function) : void
      {
         var loads:Array;
         var extend:Object = null;
         var i3:Object = null;
         var i5:Object = null;
         var i2:Object = null;
         var data:XML = param1;
         var func:Function = param2;
         var child:XMLList = data.properties.children();
         var i:int = 0;
         while(i < child.length())
         {
            if(child[i].@name == "extend")
            {
               try
               {
                  extend = JSON.parse(child[i].@value);
                  this.extendData = extend;
                  break;
               }
               catch(e:Error)
               {
                  Alert.show("意外的地图格式","无法读取");
                  break;
               }
               break;
            }
            i++;
         }
         loads = [];
         if(!extend || !extend.npc && !extend._npcLayer)
         {
            func();
            return;
         }
         if(extend.version == "0.0.2")
         {
            for(i5 in extend._npcLayer)
            {
               if(loads.indexOf(extend._npcLayer[i5].path) == -1)
               {
                  loads.push(extend._npcLayer[i5].path);
               }
            }
         }
         else
         {
            for(i2 in extend.npc)
            {
               if(loads.indexOf(extend.npc[i2].path) == -1)
               {
                  loads.push(extend.npc[i2].path);
               }
            }
         }
         for(i3 in extend.scenery)
         {
            if(loads.indexOf(extend.scenery[i3].path) == -1)
            {
               loads.push(extend.scenery[i3].path);
            }
         }
         this._loads = loads;
         if(this._loads.length > 0)
         {
            this.loaded(null);
            this._batchFunc = func;
         }
         else
         {
            func();
         }
      }
      
      private function loaded(param1:SpriteBitmapData) : void
      {
         var _loc2_:File = null;
         if(this._loads.length > 0)
         {
            _loc2_ = this.projectRootFile.resolvePath(this._loads[0]);
            if(_loc2_.parent.resolvePath(_loc2_.name.replace(".png",".xml")).exists)
            {
               this.load(_loc2_,this.loaded);
            }
            else
            {
               this.loadDragon(_loc2_,this.loaded2);
            }
            this._loads.shift();
         }
         else
         {
            this._batchFunc();
         }
      }
      
      private function loaded2(param1:FlashArmatureDisplay, param2:String) : void
      {
         var _loc3_:File = null;
         if(this._loads.length > 0)
         {
            _loc3_ = this.projectRootFile.resolvePath(this._loads[0]);
            _loc3_ = _loc3_.parent.resolvePath(_loc3_.name.replace(".png",".xml"));
            if(_loc3_.exists)
            {
               this.load(_loc3_,this.loaded);
            }
            else
            {
               this.loadDragon(_loc3_,this.loaded2);
            }
            this._loads.shift();
         }
         else
         {
            this._batchFunc();
         }
      }
      
      public function updateTmxPaht(param1:File) : void
      {
         this.extendData = null;
         this.projectRootFile = param1;
      }
      
      public function getSpriteBitmapData(param1:String) : SpriteBitmapData
      {
         return this._dict[param1];
      }
      
      public function removeSpriteBitmapData(param1:String) : void
      {
         var _loc2_:SpriteBitmapData = this._dict[param1];
         if(_loc2_)
         {
            // _loc2_.targetBitmapData.dispose();
            _loc2_.dispose(); // 新增：释放源大图 + 所有子图
            System.disposeXML(_loc2_.targetXml);
            delete this._dict[param1];
         }
      }
      
      public function getFilePath(param1:File) : String
      {
         if(param1.nativePath.indexOf(this.projectRootFile.nativePath) != -1)
         {
            return param1.nativePath.substr(this.projectRootFile.nativePath.length + 1);
         }
         return param1.nativePath;
      }
      
      public function discarded() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in this._dict)
         {
            this.removeSpriteBitmapData(_loc1_ as String);
         }
         this.dragonFactory.clear();
         this._dict = null;
      }
   }
}

