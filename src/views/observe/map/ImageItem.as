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
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.Image;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   
   public class ImageItem extends ItemRenderer
   {

      use namespace mx_internal; //
      
      private var _100313435image:Image;
      
      private var _3556653text:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function ImageItem()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 32;
         this.mxmlContent = [this._ImageItem_Image1_i(),this._ImageItem_Label1_i()];
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
            this.image.source = param1.data;
            this.text.text = param1.name;
         }
      }
      
      private function _ImageItem_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.width = 64;
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
      
      private function _ImageItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "test";
         _loc1_.x = 64;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
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
      public function get text() : Label
      {
         return this._3556653text;
      }
      
      public function set text(param1:Label) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}

