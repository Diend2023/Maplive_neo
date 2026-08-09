package
{
   import air.update.ApplicationUpdaterUI;
   import events.OpenEvent;
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.HDividedBox;
   import mx.containers.ViewStack;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import skins.TabBarSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.CheckBox;
   import spark.components.Label;
   import spark.components.RichEditableText;
   import spark.components.WindowedApplication;
   import tmx.PoltDisplay;
   import tmx.SuperSwfExtend;
   import utils.FileUtils;
   import utils.NavigatorContentUtils;
   import utils.ProjectUtils;
   import utils.RightUtils;
   import views.ProjectResources;
   import views.RefObserve;
   import views.StartPage;
   import views.TabBar;
   import views.observe.PNGObserve;
   import views.observe.RoleObserve;
   import views.observe.StoreObserve;
   import views.observe.TMXObserve;
   import views.observe.TextObserve;
   import views.observe.map.SwfApplicationWindow;
   
   use namespace mx_internal;
   
   public class Maplive extends WindowedApplication implements IBindingClient
   {
      
      public static var self:Maplive;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "gripper":false,
         "contentGroup":false,
         "statusBar":false,
         "statusText":false,
         "controlBarGroup":false,
         "titleBar":false
      };
      
      private var _1049258134neicun:Label;
      
      private var _1258356980projectResources:ProjectResources;
      
      private var _881418178tabBar:TabBar;
      
      private var _1554553085viewstack:ViewStack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _Maplive_StylesInit_done:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function Maplive()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._Maplive_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_MapliveWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return Maplive[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.preloaderChromeColor = 0;
         this.showStatusBar = false;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._Maplive_Array1_c);
         this.addEventListener("closing",this.___Maplive_WindowedApplication1_closing);
         this.addEventListener("enterFrame",this.___Maplive_WindowedApplication1_enterFrame);
         this.addEventListener("render",this.___Maplive_WindowedApplication1_render);
         this.addEventListener("initialize",this.___Maplive_WindowedApplication1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         Maplive._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 5263198;
         };
         mx_internal::_Maplive_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function openProject() : void
      {
         var file:File = new File();
         file.browseForDirectory("选择地图目录");
         file.addEventListener(Event.SELECT,function(param1:Event):void
         {
            var _loc2_:File = (param1.target as File).resolvePath("project.xml");
            if(_loc2_.exists)
            {
               projectResources.xmlData = FileUtils.fileToXml(param1.target as File);
               ProjectUtils.projectXml = new XML(FileUtils.readString(_loc2_));
               App.projectFile = param1.target as File;
               App.setValue("defalutProject",_loc2_.url);
               App.pushHistory(_loc2_.nativePath);
               initRuntime();
            }
            else
            {
               Alert.show("无效项目目录","打开失败");
            }
         });
      }
      
      public function initRuntime() : void
      {
         if(App.projectFile.resolvePath("runtime").exists)
         {
            App.superSwf = new SuperSwfExtend(App.projectFile.resolvePath("runtime").url);
         }
      }
      
      public function saveProject() : void
      {
         this.tabBar.onSave();
      }
      
      public function onInit() : void
      {
         self = this;
         this.addEventListener(OpenEvent.OPEN,this.onOpen);
         this.addEventListener(OpenEvent.ACTION_EVENT,this.onActionEvent);
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded); // 提前添加监听
         RightUtils.init();
         if(NativeApplication.nativeApplication.menu) // 修复高版本air启动报错
         { //
            NativeApplication.nativeApplication.menu.removeItemAt(1);
            NativeApplication.nativeApplication.menu.removeItemAt(1);
            var _loc1_:NativeMenu = new NativeMenu();
            var _loc2_:NativeMenuItem = new NativeMenuItem("保存");
            _loc1_.addItem(_loc2_);
            NativeApplication.nativeApplication.menu.addSubmenu(_loc1_,"文件");
            var _loc3_:NativeMenu = new NativeMenu();
            _loc3_.addItem(new NativeMenuItem("版本信息"));
            NativeApplication.nativeApplication.menu.addSubmenu(_loc3_,"关于");
         } //
         var _loc4_:String = App.getValue("defalutProject") as String;
         this.openProjectFormPath(_loc4_);
         // this.addEventListener(Event.ADDED_TO_STAGE,this.onAdded);
         this.nativeWindow.title += " [" + new ApplicationUpdaterUI().currentVersion + "]";
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
         if(!(stage.focus is RichEditableText))
         {
            (this.viewstack.selectedChild as RefObserve).onKeyDown(param1);
         }
      }
      
      public function onKeyUp(param1:KeyboardEvent) : void
      {
         if(stage.focus is RichEditableText)
         {
            return;
         }
         if(param1.ctrlKey || param1.commandKey)
         {
            switch(param1.keyCode)
            {
               case Keyboard.S:
                  this.saveProject();
            }
         }
         (this.viewstack.selectedChild as RefObserve).onKeyUp(param1);
      }
      
      public function openProjectFormPath(param1:String) : void
      {
         var _loc2_:File = null;
         if(param1)
         {
            _loc2_ = new File(param1);
            if(_loc2_.exists)
            {
               this.projectResources.xmlData = FileUtils.fileToXml(_loc2_.parent);
               this.projectResources.openRoot();
               ProjectUtils.projectXml = new XML(FileUtils.readString(_loc2_));
               App.projectFile = _loc2_.parent;
               this.initRuntime();
               if(SwfApplicationWindow.window)
               {
                  SwfApplicationWindow.window.close();
               }
               SwfApplicationWindow.window = null;
               App.setValue("defalutProject",_loc2_.url);
            }
         }
      }
      
      private function onAdded(param1:Event) : void
      {
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(stage.focus != param1.target)
         {
            stage.focus = null;
         }
      }
      
      public function onActionEvent(param1:OpenEvent) : void
      {
         var _loc2_:StoreObserve = new StoreObserve();
         _loc2_.setNpc(param1.target as PoltDisplay,this.viewstack.selectedChild as TMXObserve);
         this.viewstack.addItem(_loc2_);
         this.viewstack.selectedIndex = this.viewstack.length - 1;
      }
      
      public function onOpen(param1:OpenEvent) : void
      {
         var _loc3_:RefObserve = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.viewstack.length)
         {
            _loc3_ = this.viewstack.getItemAt(_loc2_) as RefObserve;
            if(_loc3_ && _loc3_.file && _loc3_.file.nativePath == param1.file.nativePath)
            {
               this.viewstack.selectedIndex = _loc2_;
               return;
            }
            _loc2_++;
         }
         switch(param1.file.extension)
         {
            case "png":
               this.viewstack.addItem(NavigatorContentUtils.applyFile(new PNGObserve(),param1.file));
               break;
            case "xml":
               if(param1.file.name == "project.xml")
               {
                  this.openProjectFormPath(param1.file.nativePath);
                  break;
               }
               this.viewstack.addItem(NavigatorContentUtils.applyFile(new TextObserve(),param1.file));
               break;
            case "tmx":
               this.viewstack.addItem(NavigatorContentUtils.applyFile(new TMXObserve(),param1.file));
               break;
            case "data":
               this.viewstack.addItem(NavigatorContentUtils.applyFile(new RoleObserve(),param1.file));
         }
         this.viewstack.selectedIndex = this.viewstack.length - 1;
      }
      
      protected function onRender(param1:Event) : void
      {
      }
      
      protected function windowedapplication1_closingHandler(param1:Event) : void
      {
         if(SwfApplicationWindow.window)
         {
            SwfApplicationWindow.window.close();
         }
      }
      
      protected function onFrame(param1:Event) : void
      {
         this.neicun.text = "已使用内存：" + int(System.totalMemory / 1024 / 1024) + "/" + int((System.freeMemory + System.totalMemory) / 1024 / 1024) + "MB";
      }
      
      protected function onSoundChange(param1:Event) : void
      {
         SoundMixer.soundTransform = new SoundTransform((param1.target as CheckBox).selected ? 0 : 1);
      }
      
      protected function onSwfReset(param1:MouseEvent) : void
      {
         if(SwfApplicationWindow.window)
         {
            SwfApplicationWindow.window.close();
            SwfApplicationWindow.window = null;
         }
      }
      
      private function _Maplive_Array1_c() : Array
      {
         return [this._Maplive_BorderContainer1_c()];
      }
      
      private function _Maplive_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._Maplive_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.setStyle("borderColor",0);
         _loc1_.setStyle("borderVisible",true);
         _loc1_.setStyle("borderWeight",1);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Maplive_Array2_c() : Array
      {
         return [this._Maplive_BorderContainer2_c(),this._Maplive_HDividedBox1_c()];
      }
      
      private function _Maplive_BorderContainer2_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.height = 36;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._Maplive_Array3_c);
         _loc1_.setStyle("backgroundAlpha",0);
         _loc1_.setStyle("textAlign","center");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Maplive_Array3_c() : Array
      {
         return [this._Maplive_Button1_c(),this._Maplive_Button2_c(),this._Maplive_Button3_c(),this._Maplive_Label1_i(),this._Maplive_CheckBox1_c()];
      }
      
      private function _Maplive_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 5;
         _loc1_.y = 4;
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.label = "打开项目";
         _loc1_.setStyle("icon","button/folder_open.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___Maplive_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___Maplive_Button1_click(param1:MouseEvent) : void
      {
         this.openProject();
      }
      
      private function _Maplive_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 37;
         _loc1_.y = 4;
         _loc1_.label = "刷新运行环境";
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","tmxtools/refresh.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___Maplive_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___Maplive_Button2_click(param1:MouseEvent) : void
      {
         this.onSwfReset(param1);
      }
      
      private function _Maplive_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 68;
         _loc1_.y = 4;
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.label = "保存";
         _loc1_.setStyle("icon","button/save.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___Maplive_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___Maplive_Button3_click(param1:MouseEvent) : void
      {
         this.saveProject();
      }
      
      private function _Maplive_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 105;
         _loc1_.y = 12;
         _loc1_.text = "已使用内存：9999";
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "neicun";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.neicun = _loc1_;
         BindingManager.executeBindings(this,"neicun",this.neicun);
         return _loc1_;
      }
      
      private function _Maplive_CheckBox1_c() : CheckBox
      {
         var _loc1_:CheckBox = new CheckBox();
         _loc1_.label = "全局静音";
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.setStyle("color",16777215);
         _loc1_.addEventListener("change",this.___Maplive_CheckBox1_change);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___Maplive_CheckBox1_change(param1:Event) : void
      {
         this.onSoundChange(param1);
      }
      
      private function _Maplive_HDividedBox1_c() : HDividedBox
      {
         var temp:HDividedBox = new HDividedBox();
         temp.left = 0;
         temp.right = 0;
         temp.top = 36;
         temp.bottom = 0;
         temp.mouseEnabled = false;
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":HDividedBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ProjectResources,
                  "id":"projectResources",
                  "propertiesFactory":function():Object
                  {
                     return {"percentWidth":30};
                  }
               }),new UIComponentDescriptor({
                  "type":BorderContainer,
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.17;
                     this.borderVisible = false;
                     this.dropShadowVisible = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "left":0,
                        "right":0,
                        "top":0,
                        "bottom":0,
                        "percentHeight":100,
                        "percentWidth":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_Maplive_Array4_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _Maplive_Array4_c() : Array
      {
         return [this._Maplive_TabBar1_i(),this._Maplive_BorderContainer4_c()];
      }
      
      private function _Maplive_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.y = 0;
         _loc1_.left = 0;
         _loc1_.height = 28;
         _loc1_.setStyle("skinClass",TabBarSkin);
         _loc1_.id = "tabBar";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tabBar = _loc1_;
         BindingManager.executeBindings(this,"tabBar",this.tabBar);
         return _loc1_;
      }
      
      private function _Maplive_BorderContainer4_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 28;
         _loc1_.bottom = 0;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._Maplive_Array5_c);
         _loc1_.setStyle("backgroundAlpha",0.3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Maplive_Array5_c() : Array
      {
         return [this._Maplive_ViewStack1_i()];
      }
      
      private function _Maplive_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.left = 0;
         temp.right = 0;
         temp.top = 0;
         temp.bottom = 0;
         temp.id = "viewstack";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"viewstack",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":StartPage,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "label":"开始"
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.viewstack = temp;
         BindingManager.executeBindings(this,"viewstack",this.viewstack);
         return temp;
      }
      
      public function ___Maplive_WindowedApplication1_closing(param1:Event) : void
      {
         this.windowedapplication1_closingHandler(param1);
      }
      
      public function ___Maplive_WindowedApplication1_enterFrame(param1:Event) : void
      {
         this.onFrame(param1);
      }
      
      public function ___Maplive_WindowedApplication1_render(param1:Event) : void
      {
         this.onRender(param1);
      }
      
      public function ___Maplive_WindowedApplication1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      private function _Maplive_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"tabBar.dataProvider","viewstack");
         return _loc1_;
      }
      
      mx_internal function _Maplive_StylesInit() : void
      {
         var _loc1_:CSSStyleDeclaration = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:CSSCondition = null;
         var _loc5_:CSSSelector = null;
         if(mx_internal::_Maplive_StylesInit_done)
         {
            return;
         }
         mx_internal::_Maplive_StylesInit_done = true;
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get neicun() : Label
      {
         return this._1049258134neicun;
      }
      
      public function set neicun(param1:Label) : void
      {
         var _loc2_:Object = this._1049258134neicun;
         if(_loc2_ !== param1)
         {
            this._1049258134neicun = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"neicun",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get projectResources() : ProjectResources
      {
         return this._1258356980projectResources;
      }
      
      public function set projectResources(param1:ProjectResources) : void
      {
         var _loc2_:Object = this._1258356980projectResources;
         if(_loc2_ !== param1)
         {
            this._1258356980projectResources = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"projectResources",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tabBar() : TabBar
      {
         return this._881418178tabBar;
      }
      
      public function set tabBar(param1:TabBar) : void
      {
         var _loc2_:Object = this._881418178tabBar;
         if(_loc2_ !== param1)
         {
            this._881418178tabBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tabBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get viewstack() : ViewStack
      {
         return this._1554553085viewstack;
      }
      
      public function set viewstack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1554553085viewstack;
         if(_loc2_ !== param1)
         {
            this._1554553085viewstack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"viewstack",_loc2_,param1));
            }
         }
      }
   }
}

