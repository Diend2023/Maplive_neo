package views
{
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
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.HGroup;
   import spark.components.Image;
   import spark.components.List;
   import spark.components.NavigatorContent;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import tmx.BitmapDataArrayList;
   import tmx.SpriteBitmapData;
   import tmx.SpriteXMLManage;
   import views.observe.map.ImageItem;
   
   use namespace mx_internal;
   
   public class ScenarioSpritePool extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _817490756dataSprites:ArrayCollection;
      
      private var _3092207drop:DropDownList;
      
      private var _100313435image:Image;
      
      private var _3322014list:List;
      
      private var _655158505spriteXMLManage:SpriteXMLManage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var onChangeFunc:Function;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ScenarioSpritePool()
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
         bindings = this._ScenarioSpritePool_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_ScenarioSpritePoolWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ScenarioSpritePool[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ScenarioSpritePool_Array1_c);
         this._ScenarioSpritePool_ArrayCollection1_i();
         this._ScenarioSpritePool_SpriteXMLManage1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ScenarioSpritePool._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      public function onInit() : void
      {
         callLater(function():void
         {
            if(drop.dataProvider)
            {
               drop.selectedIndex = 0;
               onChange();
               onSelect();
            }
         });
         this.addEventListener(OpenEvent.ADD_MAP_SPRITE,this.onAddMapSprite);
      }
      
      public function onAddMapSprite(param1:OpenEvent) : void
      {
         var e:OpenEvent = param1;
         this.spriteXMLManage.load(e.file,function(param1:SpriteBitmapData):void
         {
            drop.dataProvider.addItem({
               "name":param1.targetName,
               "data":new BitmapDataArrayList(param1),
               "path":param1.path
            });
            drop.selectedIndex = drop.dataProvider.length - 1;
            onChange();
            onSelect();
            onChangeFunc();
         });
      }
      
      private function onChange() : void
      {
         if(this.drop.selectedItem)
         {
            this.list.dataProvider = this.drop.selectedItem.data;
            this.list.selectedIndex = 0;
         }
      }
      
      private function onSelect() : void
      {
         if(this.list.selectedItem)
         {
            this.image.source = this.list.selectedItem.data;
         }
      }
      
      protected function onAdd(param1:MouseEvent) : void
      {
         var _loc2_:AddMapsElementView = null;
         if(App.projectFile.resolvePath("scenery").exists)
         {
            _loc2_ = new AddMapsElementView();
            _loc2_.refParent = this;
            PopUpManager.addPopUp(_loc2_,this,true);
         }
         else
         {
            Alert.show("无可用的场景精灵表","无法添加");
         }
      }
      
      private function _ScenarioSpritePool_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"dataSprites");
         this.dataSprites = _loc1_;
         BindingManager.executeBindings(this,"dataSprites",this.dataSprites);
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_SpriteXMLManage1_i() : SpriteXMLManage
      {
         var _loc1_:SpriteXMLManage = new SpriteXMLManage();
         this.spriteXMLManage = _loc1_;
         BindingManager.executeBindings(this,"spriteXMLManage",this.spriteXMLManage);
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_Array1_c() : Array
      {
         return [this._ScenarioSpritePool_BorderContainer1_c(),this._ScenarioSpritePool_VGroup1_c()];
      }
      
      private function _ScenarioSpritePool_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._ScenarioSpritePool_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.65);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_Array2_c() : Array
      {
         return [this._ScenarioSpritePool_Image1_i()];
      }
      
      private function _ScenarioSpritePool_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "image";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.image = _loc1_;
         BindingManager.executeBindings(this,"image",this.image);
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 106;
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ScenarioSpritePool_HGroup1_c(),this._ScenarioSpritePool_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.mxmlContent = [this._ScenarioSpritePool_DropDownList1_i(),this._ScenarioSpritePool_Button1_c(),this._ScenarioSpritePool_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.percentWidth = 100;
         _loc1_.height = 26;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("chromeColor",4144716);
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.addEventListener("change",this.__drop_change);
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      public function __drop_change(param1:IndexChangeEvent) : void
      {
         this.onChange();
      }
      
      private function _ScenarioSpritePool_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","spritePool/add.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___ScenarioSpritePool_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ScenarioSpritePool_Button1_click(param1:MouseEvent) : void
      {
         this.onAdd(param1);
      }
      
      private function _ScenarioSpritePool_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","spritePool/remove.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.itemRenderer = this._ScenarioSpritePool_ClassFactory1_c();
         _loc1_.labelField = "name";
         _loc1_.setStyle("chromeColor",4144716);
         _loc1_.setStyle("contentBackgroundAlpha",0.7);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.addEventListener("change",this.__list_change);
         _loc1_.id = "list";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.list = _loc1_;
         BindingManager.executeBindings(this,"list",this.list);
         return _loc1_;
      }
      
      private function _ScenarioSpritePool_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = ImageItem;
         return _loc1_;
      }
      
      public function __list_change(param1:IndexChangeEvent) : void
      {
         this.onSelect();
      }
      
      private function _ScenarioSpritePool_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"drop.dataProvider","dataSprites");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dataSprites() : ArrayCollection
      {
         return this._817490756dataSprites;
      }
      
      public function set dataSprites(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._817490756dataSprites;
         if(_loc2_ !== param1)
         {
            this._817490756dataSprites = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dataSprites",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drop() : DropDownList
      {
         return this._3092207drop;
      }
      
      public function set drop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._3092207drop;
         if(_loc2_ !== param1)
         {
            this._3092207drop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : Image
      {
         return this._100313435image;
      }
      
      public function set image(param1:Image) : void
      {
         var _loc2_:Object = this._100313435image;
         if(_loc2_ !== param1)
         {
            this._100313435image = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"image",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get list() : List
      {
         return this._3322014list;
      }
      
      public function set list(param1:List) : void
      {
         var _loc2_:Object = this._3322014list;
         if(_loc2_ !== param1)
         {
            this._3322014list = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"list",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spriteXMLManage() : SpriteXMLManage
      {
         return this._655158505spriteXMLManage;
      }
      
      public function set spriteXMLManage(param1:SpriteXMLManage) : void
      {
         var _loc2_:Object = this._655158505spriteXMLManage;
         if(_loc2_ !== param1)
         {
            this._655158505spriteXMLManage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spriteXMLManage",_loc2_,param1));
            }
         }
      }
   }
}

