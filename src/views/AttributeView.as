package views
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
   import spark.components.NavigatorContent;
   import views.attribute.ElementAttribute;
   import views.attribute.EventAttribute;
   import views.attribute.MapAttribute;
   
   public class AttributeView extends NavigatorContent
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _968992034eventAttribute:EventAttribute;
      
      private var _161901728mapAttribute:MapAttribute;
      
      private var _1661193403npcAttribute:ElementAttribute;
      
      private var _109757064stack:ViewStack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function AttributeView()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AttributeView_Array1_c);
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
      
      private function _AttributeView_Array1_c() : Array
      {
         return [this._AttributeView_ViewStack1_i()];
      }
      
      private function _AttributeView_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
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
                  "type":ElementAttribute,
                  "id":"npcAttribute",
                  "propertiesFactory":function():Object
                  {
                     return {"label":"元素属性"};
                  }
               }),new UIComponentDescriptor({
                  "type":EventAttribute,
                  "id":"eventAttribute",
                  "propertiesFactory":function():Object
                  {
                     return {"label":"事件属性"};
                  }
               }),new UIComponentDescriptor({
                  "type":MapAttribute,
                  "id":"mapAttribute",
                  "propertiesFactory":function():Object
                  {
                     return {"label":"地图属性"};
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
      public function get eventAttribute() : EventAttribute
      {
         return this._968992034eventAttribute;
      }
      
      public function set eventAttribute(param1:EventAttribute) : void
      {
         var _loc2_:Object = this._968992034eventAttribute;
         if(_loc2_ !== param1)
         {
            this._968992034eventAttribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eventAttribute",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapAttribute() : MapAttribute
      {
         return this._161901728mapAttribute;
      }
      
      public function set mapAttribute(param1:MapAttribute) : void
      {
         var _loc2_:Object = this._161901728mapAttribute;
         if(_loc2_ !== param1)
         {
            this._161901728mapAttribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapAttribute",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get npcAttribute() : ElementAttribute
      {
         return this._1661193403npcAttribute;
      }
      
      public function set npcAttribute(param1:ElementAttribute) : void
      {
         var _loc2_:Object = this._1661193403npcAttribute;
         if(_loc2_ !== param1)
         {
            this._1661193403npcAttribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"npcAttribute",_loc2_,param1));
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

