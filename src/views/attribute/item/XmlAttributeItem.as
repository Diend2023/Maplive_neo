package views.attribute.item
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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.TextOperationEvent;
   
   public class XmlAttributeItem extends ItemRenderer
   {

      use namespace mx_internal; //
      
      private var _106808059pname:Label;
      
      private var _976529663pvalue:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function XmlAttributeItem()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 26;
         this.mxmlContent = [this._XmlAttributeItem_HGroup1_c()];
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(param1)
         {
            this.pname.text = param1.@name + ":";
            this.pvalue.text = param1.@value == undefined ? "null" : param1.@value;
         }
      }
      
      protected function pvalue_changeHandler(param1:TextOperationEvent) : void
      {
         data.@value = this.pvalue.text;
         this.dispatchEvent(new Event(OpenEvent.ATTRIBUTE_CHANGE,true));
      }
      
      private function _XmlAttributeItem_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalCenter = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._XmlAttributeItem_Label1_i(),this._XmlAttributeItem_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _XmlAttributeItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "speedX";
         _loc1_.width = 60;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("color",0);
         _loc1_.id = "pname";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pname = _loc1_;
         BindingManager.executeBindings(this,"pname",this.pname);
         return _loc1_;
      }
      
      private function _XmlAttributeItem_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 120;
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.addEventListener("change",this.__pvalue_change);
         _loc1_.id = "pvalue";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pvalue = _loc1_;
         BindingManager.executeBindings(this,"pvalue",this.pvalue);
         return _loc1_;
      }
      
      public function __pvalue_change(param1:TextOperationEvent) : void
      {
         this.pvalue_changeHandler(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get pname() : Label
      {
         return this._106808059pname;
      }
      
      public function set pname(param1:Label) : void
      {
         var _loc2_:Object = this._106808059pname;
         if(_loc2_ !== param1)
         {
            this._106808059pname = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pname",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pvalue() : TextInput
      {
         return this._976529663pvalue;
      }
      
      public function set pvalue(param1:TextInput) : void
      {
         var _loc2_:Object = this._976529663pvalue;
         if(_loc2_ !== param1)
         {
            this._976529663pvalue = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pvalue",_loc2_,param1));
            }
         }
      }
   }
}

