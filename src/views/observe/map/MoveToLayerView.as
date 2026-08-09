package views.observe.map
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
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
   import tmx.MapLayer;
   
   public class MoveToLayerView extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3092207drop:DropDownList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var display:DisplayObject;
      
      public function MoveToLayerView()
      {
         super();
         mx_internal::_document = this;
         this.width = 200;
         this.title = "移动至图层";
         this.height = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._MoveToLayerView_Array1_c);
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
      
      public function set data(param1:Array) : void
      {
         var _loc2_:int = int(param1.length - 1);
         while(_loc2_ >= 0)
         {
            if(param1[_loc2_].group == this.display.parent || param1[_loc2_].type != (this.display.parent as MapLayer).type || String(param1[_loc2_].group) != String(this.display.parent) || param1[_loc2_].type == "data" || param1[_loc2_].type == "event")
            {
               param1.removeAt(_loc2_);
            }
            _loc2_--;
         }
         this.drop.dataProvider = new ArrayCollection(param1);
      }
      
      protected function onYes(param1:MouseEvent) : void
      {
         if(this.drop.selectedItem)
         {
            this.drop.selectedItem.group.addChild(this.display);
            PopUpManager.removePopUp(this);
            this.display.dispatchEvent(new OpenEvent(OpenEvent.CHANGE,null));
         }
      }
      
      private function _MoveToLayerView_Array1_c() : Array
      {
         return [this._MoveToLayerView_VGroup1_c()];
      }
      
      private function _MoveToLayerView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.mxmlContent = [this._MoveToLayerView_HGroup1_c(),this._MoveToLayerView_HGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveToLayerView_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MoveToLayerView_Label1_c(),this._MoveToLayerView_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveToLayerView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "移动至：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveToLayerView_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.labelField = "name";
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      private function _MoveToLayerView_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._MoveToLayerView_Button1_c(),this._MoveToLayerView_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MoveToLayerView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___MoveToLayerView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MoveToLayerView_Button1_click(param1:MouseEvent) : void
      {
         this.onYes(param1);
      }
      
      private function _MoveToLayerView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___MoveToLayerView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___MoveToLayerView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
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
   }
}

