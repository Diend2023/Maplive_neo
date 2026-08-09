package views.observe.role
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
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class RuntimeConfig extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _827371762drawData:ArrayCollection;
      
      private var _128788640drawLevel:DropDownList;
      
      private var _1878411244scaleData:ArrayCollection;
      
      private var _1906303066scaleLevel:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RuntimeConfig()
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
         bindings = this._RuntimeConfig_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_role_RuntimeConfigWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RuntimeConfig[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 230;
         this.height = 150;
         this.title = "全局运行配置设置";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._RuntimeConfig_Array3_c);
         this._RuntimeConfig_ArrayCollection1_i();
         this._RuntimeConfig_ArrayCollection2_i();
         this.addEventListener("addedToStage",this.___RuntimeConfig_Panel1_addedToStage);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RuntimeConfig._watcherSetupUtil = param1;
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
      
      protected function onEnter(param1:MouseEvent) : void
      {
         App.setValue("drawLevel",this.drawLevel.selectedIndex);
         App.setValue("scaleLevel",this.scaleLevel.selectedIndex);
         PopUpManager.removePopUp(this);
      }
      
      protected function onInit(param1:Event) : void
      {
         var event:Event = param1;
         callLater(function():void
         {
            drawLevel.selectedIndex = int(App.getValue("drawLevel"));
            scaleLevel.selectedIndex = int(App.getValue("scaleLevel"));
         });
      }
      
      private function _RuntimeConfig_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [{
            "name":"高",
            "tag":"high"
         },{
            "name":"普通",
            "tag":"none"
         },{
            "name":"低",
            "tag":"bottom"
         }];
         _loc1_.initialized(this,"drawData");
         this.drawData = _loc1_;
         BindingManager.executeBindings(this,"drawData",this.drawData);
         return _loc1_;
      }
      
      private function _RuntimeConfig_ArrayCollection2_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.source = [{
            "name":"正常",
            "scale":1
         },{
            "name":"75%",
            "scale":0.75
         },{
            "name":"50%",
            "scale":0.5
         }];
         _loc1_.initialized(this,"scaleData");
         this.scaleData = _loc1_;
         BindingManager.executeBindings(this,"scaleData",this.scaleData);
         return _loc1_;
      }
      
      private function _RuntimeConfig_Array3_c() : Array
      {
         return [this._RuntimeConfig_VGroup1_c()];
      }
      
      private function _RuntimeConfig_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._RuntimeConfig_HGroup1_c(),this._RuntimeConfig_HGroup2_c(),this._RuntimeConfig_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._RuntimeConfig_Label1_c(),this._RuntimeConfig_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "渲染次数级别：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.id = "drawLevel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drawLevel = _loc1_;
         BindingManager.executeBindings(this,"drawLevel",this.drawLevel);
         return _loc1_;
      }
      
      private function _RuntimeConfig_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._RuntimeConfig_Label2_c(),this._RuntimeConfig_DropDownList2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "窗口比例：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.id = "scaleLevel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleLevel = _loc1_;
         BindingManager.executeBindings(this,"scaleLevel",this.scaleLevel);
         return _loc1_;
      }
      
      private function _RuntimeConfig_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._RuntimeConfig_Button1_c(),this._RuntimeConfig_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RuntimeConfig_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "应用";
         _loc1_.addEventListener("click",this.___RuntimeConfig_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___RuntimeConfig_Button1_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _RuntimeConfig_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___RuntimeConfig_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___RuntimeConfig_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___RuntimeConfig_Panel1_addedToStage(param1:Event) : void
      {
         this.onInit(param1);
      }
      
      private function _RuntimeConfig_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"drawLevel.dataProvider","drawData");
         _loc1_[1] = new Binding(this,null,null,"scaleLevel.dataProvider","scaleData");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get drawData() : ArrayCollection
      {
         return this._827371762drawData;
      }
      
      public function set drawData(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._827371762drawData;
         if(_loc2_ !== param1)
         {
            this._827371762drawData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drawData",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drawLevel() : DropDownList
      {
         return this._128788640drawLevel;
      }
      
      public function set drawLevel(param1:DropDownList) : void
      {
         var _loc2_:Object = this._128788640drawLevel;
         if(_loc2_ !== param1)
         {
            this._128788640drawLevel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drawLevel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleData() : ArrayCollection
      {
         return this._1878411244scaleData;
      }
      
      public function set scaleData(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1878411244scaleData;
         if(_loc2_ !== param1)
         {
            this._1878411244scaleData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleData",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleLevel() : DropDownList
      {
         return this._1906303066scaleLevel;
      }
      
      public function set scaleLevel(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1906303066scaleLevel;
         if(_loc2_ !== param1)
         {
            this._1906303066scaleLevel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleLevel",_loc2_,param1));
            }
         }
      }
   }
}

