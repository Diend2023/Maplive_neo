package views.observe.map
{
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
   import io.arkeus.tiled.TiledObjectLayer;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.NavigatorContent;
   import spark.events.IndexChangeEvent;
   import spark.layouts.HorizontalLayout;
   import spark.layouts.supportClasses.LayoutBase;
   import tmx.MapEidtLayer;
   import tmx.MapLayer;
   import tmx.StarlingMap;
   import views.observe.TMXObserve;
   
   use namespace mx_internal;
   
   public class LayerContent extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      public var _LayerContent_Group1:Group;
      
      private var _3322014list:List;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _lockIndex:int = -1;
      
      private var _starlingMap:StarlingMap;
      
      public var observe:TMXObserve;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function LayerContent()
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
         bindings = this._LayerContent_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_map_LayerContentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return LayerContent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._LayerContent_Array1_c);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         LayerContent._watcherSetupUtil = param1;
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
      
      protected function onInit(param1:FlexEvent) : void
      {
      }
      
      public function getLayersArray(param1:StarlingMap) : Array
      {
         var _loc5_:MapLayer = null;
         var _loc6_:String = null;
         this._starlingMap = param1;
         var _loc2_:Array = [];
         var _loc3_:int = param1.numChildren;
         var _loc4_:int = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = param1.getChildAt(_loc4_) as MapLayer;
            if(_loc5_)
            {
               _loc6_ = _loc5_.name;
               _loc2_.push({
                  "name":this.layerName(_loc5_.getName()),
                  "id":_loc6_,
                  "group":param1.getChildAt(_loc4_),
                  "type":_loc5_.type,
                  "count":_loc5_.numChildren
               });
               if(_loc6_ == "_bottomLayer")
               {
                  if(this._lockIndex == -1)
                  {
                     this._lockIndex = _loc3_ - _loc4_ - 2;
                     if(this.list)
                     {
                        this.list.selectedIndex = this._lockIndex;
                     }
                  }
               }
            }
            _loc4_--;
         }
         return _loc2_;
      }
      
      public function showLayerMc(param1:StarlingMap) : void
      {
         var _loc2_:ArrayCollection = this.list.dataProvider as ArrayCollection;
         if(!_loc2_)
         {
            _loc2_ = new ArrayCollection();
         }
         _loc2_.removeAll();
         var _loc3_:Array = this.getLayersArray(param1);
         _loc2_.addAll(new ArrayCollection(_loc3_));
         if(Boolean(this.list) && !this.list.dataProvider)
         {
            this.list.dataProvider = _loc2_;
         }
         else
         {
            this.list.selectedIndex = this._lockIndex;
         }
      }
      
      public function getAddGroup() : MapLayer
      {
         if(!this.list)
         {
            return null;
         }
         return this.list.selectedItem.group;
      }
      
      private function layerName(param1:String) : String
      {
         switch(param1)
         {
            case "_bottomLayer":
               return "装饰层2";
            case "_npcLayer":
               return "互动层（原生）";
            case "_topLayer":
               return "装饰层1";
            case "_mapLayer":
               return "地表层";
            case "_eventSprite":
               return "事件层（不可选）";
            case "_dataLayer":
               return "数据层（不可选）";
            default:
               return param1;
         }
      }
      
      protected function onListChange(param1:IndexChangeEvent) : void
      {
         var event:IndexChangeEvent = param1;
         if(this.list.selectedItem.name.indexOf("不可选") != -1)
         {
            callLater(function():void
            {
               list.selectedIndex = _lockIndex;
            });
         }
         else
         {
            this._lockIndex = this.list.selectedIndex;
         }
      }
      
      protected function onDownMove(param1:MouseEvent) : void
      {
         this.moveLayer(-1);
      }
      
      private function moveLayer(param1:int) : void
      {
         var _loc2_:Sprite = this.list.selectedItem.group;
         var _loc3_:int = _loc2_.parent.getChildIndex(_loc2_) + param1;
         if(_loc3_ < 0 || _loc3_ >= _loc2_.parent.numChildren - 3)
         {
            return;
         }
         this._lockIndex -= param1;
         _loc2_.parent.setChildIndex(_loc2_,_loc3_);
         this.showLayerMc(_loc2_.parent as StarlingMap);
         this.list.selectedIndex = this._lockIndex;
      }
      
      protected function onUpMove(param1:MouseEvent) : void
      {
         this.moveLayer(1);
      }
      
      protected function onNew(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var view:AddLayerView = new AddLayerView();
         PopUpManager.addPopUp(view,this,true);
         view.onCreateLayer = function(param1:String, param2:String, param3:String):void
         {
            var _loc7_:TiledObjectLayer = null;
            var _loc4_:String = "";
            switch(param1)
            {
               case "互动层":
                  _loc4_ = "npc";
                  break;
               case "装饰层":
                  _loc4_ = "scenery";
                  break;
               case "地图层":
                  _loc4_ = "map";
            }
            var _loc5_:Class = _loc4_ == "map" ? MapEidtLayer : MapLayer;
            var _loc6_:MapLayer = new _loc5_(_loc4_);
            _loc6_.name = param3;
            _loc6_.nameString = param2;
            if(_loc6_ is MapEidtLayer)
            {
               _loc7_ = new TiledObjectLayer(<objectgroup name="hit_layer" width="64" height="40"/>);
               _loc7_.name = param3;
               observe.map.tmx.layers.addLayer(_loc7_);
               (_loc6_ as MapEidtLayer).layer = _loc7_;
            }
            _starlingMap.addChildAt(_loc6_,_starlingMap.getChildIndex(getAddGroup()));
            showLayerMc(_starlingMap);
            observe.onChange();
         };
      }
      
      private function onNameLabel(param1:Object) : String
      {
         return param1.name + "(" + param1.type + ")[" + param1.count + "]";
      }
      
      protected function onDel(param1:MouseEvent) : void
      {
         var _loc3_:StarlingMap = null;
         var _loc2_:MapLayer = this.list.selectedItem.group;
         if(_loc2_)
         {
            if(_loc2_.name == "_npcLayer")
            {
               Alert.show("无法删除原生的图层","提示");
               return;
            }
            _loc3_ = _loc2_.parent as StarlingMap;
            if(_loc2_ is MapEidtLayer)
            {
               _loc3_.tmx.layers.layers.splice(_loc3_.tmx.layers.layers.indexOf((_loc2_ as MapEidtLayer).layer),1);
            }
            _loc3_.removeChild(_loc2_);
            this.showLayerMc(_loc3_ as StarlingMap);
         }
      }
      
      private function _LayerContent_Array1_c() : Array
      {
         return [this._LayerContent_Group1_i(),this._LayerContent_List1_i()];
      }
      
      private function _LayerContent_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 2;
         _loc1_.left = 2;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._LayerContent_Button1_c(),this._LayerContent_Button2_c(),this._LayerContent_Button3_c(),this._LayerContent_Button4_c()];
         _loc1_.id = "_LayerContent_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._LayerContent_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_LayerContent_Group1",this._LayerContent_Group1);
         return _loc1_;
      }
      
      private function _LayerContent_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "新建";
         _loc1_.width = 50;
         _loc1_.addEventListener("click",this.___LayerContent_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___LayerContent_Button1_click(param1:MouseEvent) : void
      {
         this.onNew(param1);
      }
      
      private function _LayerContent_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "删除";
         _loc1_.width = 50;
         _loc1_.addEventListener("click",this.___LayerContent_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___LayerContent_Button2_click(param1:MouseEvent) : void
      {
         this.onDel(param1);
      }
      
      private function _LayerContent_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "上移";
         _loc1_.width = 50;
         _loc1_.addEventListener("click",this.___LayerContent_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___LayerContent_Button3_click(param1:MouseEvent) : void
      {
         this.onUpMove(param1);
      }
      
      private function _LayerContent_Button4_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "下移";
         _loc1_.width = 50;
         _loc1_.addEventListener("click",this.___LayerContent_Button4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___LayerContent_Button4_click(param1:MouseEvent) : void
      {
         this.onDownMove(param1);
      }
      
      private function _LayerContent_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.itemRenderer = this._LayerContent_ClassFactory1_c();
         _loc1_.top = 24;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.setStyle("contentBackgroundAlpha",0.6);
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
      
      private function _LayerContent_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = LayerItem;
         return _loc1_;
      }
      
      public function __list_change(param1:IndexChangeEvent) : void
      {
         this.onListChange(param1);
      }
      
      private function _LayerContent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():LayoutBase
         {
            return new HorizontalLayout();
         },null,"_LayerContent_Group1.layout");
         result[1] = new Binding(this,function():Function
         {
            return onNameLabel;
         },null,"list.labelFunction");
         return result;
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
   }
}

