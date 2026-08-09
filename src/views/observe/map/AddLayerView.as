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
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextInput;
   
   use namespace mx_internal;
   
   public class AddLayerView extends Panel implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3092207drop:DropDownList;
      
      private var _41955764layerId:TextInput;
      
      private var _1664633988layerName:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var onCreateLayer:Function;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function AddLayerView()
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
         bindings = this._AddLayerView_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_map_AddLayerViewWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return AddLayerView[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 200;
         this.height = 162;
         this.title = "添加图层";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddLayerView_Array1_c);
         this.addEventListener("initialize",this.___AddLayerView_Panel1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         AddLayerView._watcherSetupUtil = param1;
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
      
      protected function onYes(param1:MouseEvent) : void
      {
         if(this.onCreateLayer != null)
         {
            this.onCreateLayer(this.drop.selectedItem,this.layerName.text,this.layerId.text);
         }
         PopUpManager.removePopUp(this);
      }
      
      private function _AddLayerView_Array1_c() : Array
      {
         return [this._AddLayerView_Label1_c(),this._AddLayerView_DropDownList1_i(),this._AddLayerView_Label2_c(),this._AddLayerView_TextInput1_i(),this._AddLayerView_Label3_c(),this._AddLayerView_TextInput2_i(),this._AddLayerView_Button1_c(),this._AddLayerView_Button2_c()];
      }
      
      private function _AddLayerView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 16;
         _loc1_.text = "图层类型：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddLayerView_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.selectedIndex = 0;
         _loc1_.x = 78;
         _loc1_.y = 10;
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      private function _AddLayerView_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 10;
         _loc1_.y = 45;
         _loc1_.text = "图层命名：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddLayerView_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 78;
         _loc1_.y = 39;
         _loc1_.width = 110;
         _loc1_.id = "layerName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.layerName = _loc1_;
         BindingManager.executeBindings(this,"layerName",this.layerName);
         return _loc1_;
      }
      
      private function _AddLayerView_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 23;
         _loc1_.y = 75;
         _loc1_.text = "识别ID：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddLayerView_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 78;
         _loc1_.y = 69;
         _loc1_.width = 110;
         _loc1_.id = "layerId";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.layerId = _loc1_;
         BindingManager.executeBindings(this,"layerId",this.layerId);
         return _loc1_;
      }
      
      private function _AddLayerView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 23;
         _loc1_.y = 99;
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___AddLayerView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddLayerView_Button1_click(param1:MouseEvent) : void
      {
         this.onYes(param1);
      }
      
      private function _AddLayerView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 109;
         _loc1_.y = 99;
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddLayerView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddLayerView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___AddLayerView_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      private function _AddLayerView_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():IList
         {
            return new ArrayCollection(["装饰层","互动层","地图层"]);
         },null,"drop.dataProvider");
         return result;
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
      public function get layerId() : TextInput
      {
         return this._41955764layerId;
      }
      
      public function set layerId(param1:TextInput) : void
      {
         var _loc2_:Object = this._41955764layerId;
         if(_loc2_ !== param1)
         {
            this._41955764layerId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layerName() : TextInput
      {
         return this._1664633988layerName;
      }
      
      public function set layerName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1664633988layerName;
         if(_loc2_ !== param1)
         {
            this._1664633988layerName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layerName",_loc2_,param1));
            }
         }
      }
   }
}

