package views.observe.map
{
   import flash.display.Loader;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowInitOptions;
   import flash.display.NativeWindowRenderMode;
   import flash.display.NativeWindowSystemChrome;
   import flash.display.NativeWindowType;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.ui.Keyboard;
   import flash.utils.ByteArray;
   import utils.FileUtils;
   
   public class SwfApplicationWindow extends NativeWindow
   {
      
      public static var window:SwfApplicationWindow;
      
      private var _loader:Loader;
      
      private var _url:String;
      
      private var _uesRole:String;
      
      public function SwfApplicationWindow(param1:String, param2:String, param3:int, param4:int)
      {
         var _loc5_:NativeWindowInitOptions = new NativeWindowInitOptions();
         _loc5_.renderMode = NativeWindowRenderMode.DIRECT;
         _loc5_.maximizable = false;
         _loc5_.minimizable = false;
         _loc5_.resizable = false;
         _loc5_.systemChrome = NativeWindowSystemChrome.NONE;
         _loc5_.type = NativeWindowType.LIGHTWEIGHT;
         super(_loc5_);
         this.width = param3;
         this.height = param4;
         this.x = (stage.fullScreenWidth - param3) / 2;
         this.y = (stage.fullScreenHeight - param4) / 2;
         this.title = "游戏预览";
         this._url = param1;
         this._uesRole = param2;
         this.addEventListener(Event.ACTIVATE,this.onInit);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.addEventListener(Event.CLOSE,this.onClose);
      }
      
      public static function run(param1:String, param2:String, param3:int, param4:int) : void
      {
         switch(int(App.getValue("scaleLevel")))
         {
            case 1:
               param3 *= 0.75;
               param4 *= 0.75;
               break;
            case 2:
               param3 *= 0.5;
               param4 *= 0.5;
         }
         if(!window)
         {
            window = new SwfApplicationWindow(param1,param2,param3,param4);
            window.activate();
         }
         else
         {
            window.visible = true;
            window.activate();
            window.go(param1,param2);
         }
      }
      
      private function onClose(param1:Event) : void
      {
         if(this._loader)
         {
            this._loader.unloadAndStop(true);
         }
      }
      
      private function onInit(param1:Event) : void
      {
         var content:LoaderContext;
         var byte:ByteArray;
         var loader:Loader = null;
         var e:Event = param1;
         if(this._loader)
         {
            return;
         }
         content = new LoaderContext();
         content.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
         content.allowLoadBytesCodeExecution = true;
         byte = FileUtils.readBytes(App.projectFile.resolvePath("runtime"));
         loader = new Loader();
         loader.loadBytes(byte,content);
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function():void
         {
            loader.content["nativePath"] = App.projectFile.url + "/";
            loader.content["testTmxPath"] = _url;
            loader.content["uesRole"] = _uesRole;
            loader.content["runderType"] = int(App.getValue("drawLevel"));
            loader.content["viewRect"] = new Rectangle(0,0,width,height);
            stage.addChild(loader);
         });
         this._loader = loader;
      }
      
      public function go(param1:String, param2:String) : void
      {
         SoundMixer.soundTransform = new SoundTransform(1);
         this._loader.content["uesRole"] = param2;
         this._loader.content["runderType"] = int(App.getValue("drawLevel"));
         this._loader.content["run"](param1,null);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ESCAPE:
               SoundMixer.soundTransform = new SoundTransform(0);
               this.visible = false;
         }
      }
      
      override public function close() : void
      {
         super.close();
         this.onClose(null);
      }
   }
}

