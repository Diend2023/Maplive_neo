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
   import mx.containers.ViewStack;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Group;
   import spark.components.Label;
   import views.attribute.FrameAttribute;
   import views.attribute.SkillAttribute;
   
   public class Attribute extends Group
   {

      use namespace mx_internal; //
      
      private var _544569598frameAttr:FrameAttribute;
      
      private var _109757064stack:ViewStack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function Attribute()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._Attribute_BorderContainer1_c(),this._Attribute_ViewStack1_i()];
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
      
      private function _Attribute_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.top = 0;
         _loc1_.height = 32;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._Attribute_Array2_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Attribute_Array2_c() : Array
      {
         return [this._Attribute_Label1_c()];
      }
      
      private function _Attribute_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "属性";
         _loc1_.left = 5;
         _loc1_.top = 10;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _Attribute_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.left = 0;
         temp.right = 0;
         temp.top = 32;
         temp.bottom = 0;
         temp.selectedIndex = 0;
         temp.id = "stack";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"stack",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":SkillAttribute,
                  "propertiesFactory":function():Object
                  {
                     return {"percentHeight":100};
                  }
               }),new UIComponentDescriptor({
                  "type":FrameAttribute,
                  "id":"frameAttr",
                  "propertiesFactory":function():Object
                  {
                     return {"percentHeight":100};
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.stack = temp;
         BindingManager.executeBindings(this,"stack",this.stack);
         return temp;
      }
      
      [Bindable(event="propertyChange")]
      public function get frameAttr() : FrameAttribute
      {
         return this._544569598frameAttr;
      }
      
      public function set frameAttr(param1:FrameAttribute) : void
      {
         var _loc2_:Object = this._544569598frameAttr;
         if(_loc2_ !== param1)
         {
            this._544569598frameAttr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameAttr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stack() : ViewStack
      {
         return this._109757064stack;
      }
      
      public function set stack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._109757064stack;
         if(_loc2_ !== param1)
         {
            this._109757064stack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stack",_loc2_,param1));
            }
         }
      }
   }
}

