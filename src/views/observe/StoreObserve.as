package views.observe
{
   import events.RightClickEvent;
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
   import mx.controls.Tree;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import skins.IconNoneButtonSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.List;
   import spark.components.Scroller;
   import spark.events.IndexChangeEvent;
   import tmx.Npc;
   import tmx.PoltDisplay;
   import utils.RightUtils;
   import utils.TreeMessageUtils;
   import utils.XMLUtils;
   import views.RefObserve;
   import views.alert.AddNewPoltCode;
   import views.alert.AddNewPoltMessage;
   import views.alert.AddNewPoltPoint;
   import views.alert.AddNewPoltSelect;
   
   use namespace mx_internal;
   
   public class StoreObserve extends RefObserve implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      public static const nodeSelect:Class = StoreObserve_nodeSelect;
      
      public static const all:Class = StoreObserve_all;
      
      public static const message:Class = StoreObserve_message;
      
      public static const rightPng:Class = StoreObserve_rightPng;
      
      public static const code:Class = StoreObserve_code;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _3322014list:List;
      
      private var _2141189061npcDraw:UIComponent;
      
      private var _869667999tmxObs:TMXObserve;
      
      private var _3568542tree:Tree;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _poltDisplay:PoltDisplay;
      
      private var drawNpc:Npc;
      
      private var _poltListData:ArrayCollection;
      
      private var _copyNode:XML;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StoreObserve()
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
         bindings = this._StoreObserve_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_StoreObserveWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StoreObserve[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._StoreObserve_Array1_c);
         this._StoreObserve_TMXObserve1_i();
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StoreObserve._watcherSetupUtil = param1;
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
      
      public function setNpc(param1:PoltDisplay, param2:TMXObserve) : void
      {
         var npc:PoltDisplay = param1;
         var tmxobs:TMXObserve = param2;
         this.addEventListener(RightClickEvent.CLICK,this.onRightMenuClick);
         this.tmxObs = tmxobs;
         this._poltDisplay = npc;
         this.label = "[action - " + tmxobs.file.name + "] " + this._poltDisplay.getName();
         callLater(function():void
         {
            var _loc1_:Object = null;
            var _loc2_:Npc = null;
            if(_poltDisplay is Npc)
            {
               _loc2_ = new Npc((_poltDisplay as Npc).getData());
               npcDraw.addChild(_loc2_);
               drawNpc = _loc2_;
               drawNpc.x = 100;
               drawNpc.y = 150;
            }
            _poltListData = new ArrayCollection();
            for(_loc1_ in _poltDisplay.poltData)
            {
               _poltListData.addItem({
                  "name":_poltDisplay.poltData[_loc1_].name,
                  "data":new XML(_poltDisplay.poltData[_loc1_].data)
               });
            }
            list.dataProvider = _poltListData;
            RightUtils.onRightClick(tree,"poltTree");
         });
      }
      
      private function onRightMenuClick(param1:RightClickEvent) : void
      {
         if(!this.tree.selectedItem)
         {
            return;
         }
         switch(param1.clickTag)
         {
            case "复制":
               this._copyNode = (this.tree.selectedItem as XML).copy();
               break;
            case "粘贴":
               if(this._copyNode)
               {
                  XMLUtils.pushXml(this.tree.selectedItem as XML,this._copyNode,"down");
               }
               break;
            case "删除":
               XMLUtils.deleteData(this.tree.selectedItem as XML);
         }
      }
      
      override public function onFrame() : void
      {
         if(this.drawNpc)
         {
            this.drawNpc.onFrame();
         }
      }
      
      private function onSelect() : void
      {
         this.tree.dataProvider = this.list.selectedItem.data as XML;
         callLater(function():void
         {
            TreeMessageUtils.openTree(tree);
         });
      }
      
      private function onTreeIcon(param1:XML) : Class
      {
         switch(param1.localName())
         {
            case "polt":
               return all;
            case "select":
               return nodeSelect;
            case "m":
               return message;
            case "s":
               return rightPng;
            case "as3":
               return code;
            default:
               return nodeSelect;
         }
      }
      
      private function onRemove() : void
      {
         if(this.list.selectedItem)
         {
            this.list.dataProvider.removeItemAt(this.list.selectedIndex);
            this.tree.dataProvider = null;
            this.onChange();
         }
      }
      
      private function onAdd() : void
      {
         var _loc1_:AddNewPoltPoint = new AddNewPoltPoint();
         _loc1_.back = this.onPush;
         PopUpManager.addPopUp(_loc1_,this,true);
      }
      
      private function onPush(param1:String) : void
      {
         this._poltListData.addItem({
            "name":param1,
            "data":<polt/>
         });
         this.onChange();
      }
      
      override public function onChange() : void
      {
         _change = true;
         this.label = this.getName() + " *";
         this.tmxObs.onChange();
      }
      
      override public function onSave() : void
      {
         var _loc3_:Object = null;
         _change = false;
         this.label = this.getName();
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this._poltListData.length)
         {
            _loc3_ = this._poltListData.getItemAt(_loc2_);
            _loc1_.push({
               "name":_loc3_.name,
               "data":(_loc3_.data as XML).toXMLString()
            });
            _loc2_++;
         }
         this._poltDisplay.poltData = _loc1_;
         if(this.tmxObs)
         {
            this.tmxObs.onSave();
         }
      }
      
      override public function getName() : String
      {
         return "[action - " + this.tmxObs.file.name + "] " + this._poltDisplay.getName();
      }
      
      protected function onAddMessage(param1:MouseEvent) : void
      {
         if(!this.cheakEdit())
         {
            return;
         }
         var _loc2_:AddNewPoltMessage = new AddNewPoltMessage();
         PopUpManager.addPopUp(_loc2_,this,true);
         _loc2_.setNpcs(this._poltDisplay,this.tmxObs.getNpcs());
         _loc2_.setXml(this.getCurrentSelectXml());
         _loc2_.back = this.onChange;
      }
      
      protected function onAddSelect(param1:MouseEvent) : void
      {
         if(!this.cheakEdit())
         {
            return;
         }
         var _loc2_:AddNewPoltSelect = new AddNewPoltSelect();
         _loc2_.setXml(this.getCurrentSelectXml());
         _loc2_.back = this.onChange;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      private function cheakEdit() : Boolean
      {
         if(!this.list.selectedItem)
         {
            Alert.show("请选择一个可用的选项进行编辑","提示");
            return false;
         }
         return true;
      }
      
      public function getCurrentSelectXml() : XML
      {
         if(this.tree.selectedItem)
         {
            return this.tree.selectedItem as XML;
         }
         return this.list.selectedItem.data as XML;
      }
      
      protected function onAddAS(param1:MouseEvent) : void
      {
         if(!this.cheakEdit())
         {
            return;
         }
         var _loc2_:AddNewPoltCode = new AddNewPoltCode();
         PopUpManager.addPopUp(_loc2_,this,true);
         _loc2_.setNpcs(this._poltDisplay,this.tmxObs.getNpcs());
         _loc2_.setXml(this.getCurrentSelectXml());
         _loc2_.back = this.onChange;
      }
      
      protected function onEditClick(param1:MouseEvent) : void
      {
         var _loc2_:AddNewPoltCode = null;
         var _loc3_:AddNewPoltMessage = null;
         if(!this.tree.selectedItem)
         {
            return;
         }
         switch(XML(this.tree.selectedItem).localName())
         {
            case "as3":
               _loc2_ = new AddNewPoltCode();
               _loc2_.setAS3Code(XML(this.tree.selectedItem).@message);
               PopUpManager.addPopUp(_loc2_,this,true);
               _loc2_.setNpcs(this._poltDisplay,this.tmxObs.getNpcs());
               _loc2_.setXml(this.getCurrentSelectXml());
               _loc2_.back = this.onChange;
               break;
            case "m":
               _loc3_ = new AddNewPoltMessage();
               _loc3_.setEditXml(this.tree.selectedItem as XML);
               _loc3_.setXml(this.getCurrentSelectXml());
               _loc3_.back = this.onChange;
               _loc3_.setNpcs(this._poltDisplay,this.tmxObs.getNpcs());
               PopUpManager.addPopUp(_loc3_,this,true);
         }
      }
      
      private function _StoreObserve_TMXObserve1_i() : TMXObserve
      {
         var _loc1_:TMXObserve = new TMXObserve();
         _loc1_.id = "tmxObs";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tmxObs = _loc1_;
         BindingManager.executeBindings(this,"tmxObs",this.tmxObs);
         return _loc1_;
      }
      
      private function _StoreObserve_Array1_c() : Array
      {
         return [this._StoreObserve_BorderContainer1_c(),this._StoreObserve_BorderContainer3_c()];
      }
      
      private function _StoreObserve_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 200;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._StoreObserve_Array2_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Array2_c() : Array
      {
         return [this._StoreObserve_Scroller1_c(),this._StoreObserve_BorderContainer2_c(),this._StoreObserve_List1_i()];
      }
      
      private function _StoreObserve_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.height = 200;
         _loc1_.viewport = this._StoreObserve_Group1_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._StoreObserve_UIComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "npcDraw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.npcDraw = _loc1_;
         BindingManager.executeBindings(this,"npcDraw",this.npcDraw);
         return _loc1_;
      }
      
      private function _StoreObserve_BorderContainer2_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.top = 200;
         _loc1_.height = 32;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._StoreObserve_Array4_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundAlpha",0.3);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Array4_c() : Array
      {
         return [this._StoreObserve_HGroup1_c()];
      }
      
      private function _StoreObserve_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.top = 3;
         _loc1_.right = 5;
         _loc1_.horizontalAlign = "right";
         _loc1_.mxmlContent = [this._StoreObserve_Button1_c(),this._StoreObserve_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("skinClass",IconNoneButtonSkin);
         _loc1_.setStyle("icon","storetools/add.png");
         _loc1_.addEventListener("click",this.___StoreObserve_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___StoreObserve_Button1_click(param1:MouseEvent) : void
      {
         this.onAdd();
      }
      
      private function _StoreObserve_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("skinClass",IconNoneButtonSkin);
         _loc1_.setStyle("icon","storetools/remove.png");
         _loc1_.addEventListener("click",this.___StoreObserve_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___StoreObserve_Button2_click(param1:MouseEvent) : void
      {
         this.onRemove();
      }
      
      private function _StoreObserve_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.labelField = "name";
         _loc1_.top = 232;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.setStyle("contentBackgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
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
      
      public function __list_change(param1:IndexChangeEvent) : void
      {
         this.onSelect();
      }
      
      private function _StoreObserve_BorderContainer3_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 200;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._StoreObserve_Array6_c);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Array6_c() : Array
      {
         return [this._StoreObserve_BorderContainer4_c(),this._StoreObserve_Tree1_i()];
      }
      
      private function _StoreObserve_BorderContainer4_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.height = 32;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._StoreObserve_Array7_c);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Array7_c() : Array
      {
         return [this._StoreObserve_HGroup2_c()];
      }
      
      private function _StoreObserve_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.top = 3;
         _loc1_.mxmlContent = [this._StoreObserve_Button3_c(),this._StoreObserve_Button4_c(),this._StoreObserve_Button5_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StoreObserve_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","storetools/message_add.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___StoreObserve_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___StoreObserve_Button3_click(param1:MouseEvent) : void
      {
         this.onAddMessage(param1);
      }
      
      private function _StoreObserve_Button4_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","storetools/add_select.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___StoreObserve_Button4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___StoreObserve_Button4_click(param1:MouseEvent) : void
      {
         this.onAddSelect(param1);
      }
      
      private function _StoreObserve_Button5_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","storetools/add_as.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___StoreObserve_Button5_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___StoreObserve_Button5_click(param1:MouseEvent) : void
      {
         this.onAddAS(param1);
      }
      
      private function _StoreObserve_Tree1_i() : Tree
      {
         var _loc1_:Tree = new Tree();
         _loc1_.doubleClickEnabled = true;
         _loc1_.percentWidth = 100;
         _loc1_.top = 32;
         _loc1_.bottom = 0;
         _loc1_.variableRowHeight = true;
         _loc1_.setStyle("verticalAlign","top");
         _loc1_.setStyle("borderVisible",false);
         _loc1_.addEventListener("doubleClick",this.__tree_doubleClick);
         _loc1_.id = "tree";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tree = _loc1_;
         BindingManager.executeBindings(this,"tree",this.tree);
         return _loc1_;
      }
      
      public function __tree_doubleClick(param1:MouseEvent) : void
      {
         this.onEditClick(param1);
      }
      
      private function _StoreObserve_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Function
         {
            return TreeMessageUtils.getLabel;
         },null,"tree.labelFunction");
         result[1] = new Binding(this,function():Function
         {
            return onTreeIcon;
         },null,"tree.iconFunction");
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
      
      [Bindable(event="propertyChange")]
      public function get npcDraw() : UIComponent
      {
         return this._2141189061npcDraw;
      }
      
      public function set npcDraw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._2141189061npcDraw;
         if(_loc2_ !== param1)
         {
            this._2141189061npcDraw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"npcDraw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tmxObs() : TMXObserve
      {
         return this._869667999tmxObs;
      }
      
      public function set tmxObs(param1:TMXObserve) : void
      {
         var _loc2_:Object = this._869667999tmxObs;
         if(_loc2_ !== param1)
         {
            this._869667999tmxObs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tmxObs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tree() : Tree
      {
         return this._3568542tree;
      }
      
      public function set tree(param1:Tree) : void
      {
         var _loc2_:Object = this._3568542tree;
         if(_loc2_ !== param1)
         {
            this._3568542tree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tree",_loc2_,param1));
            }
         }
      }
   }
}

