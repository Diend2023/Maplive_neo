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
   import skins.IconNoneButtonSkin;
   import spark.components.Button;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   
   public class LayerItem extends ItemRenderer
   {

      use namespace mx_internal; //
      
      private var _1544481607showvisibleBtn:Button;
      
      private var _3556653text:Label;
      
      private var _1943857290visibleBtn:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function LayerItem()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 24;
         this.mxmlContent = [this._LayerItem_Button1_i(),this._LayerItem_Button2_i(),this._LayerItem_Label1_i()];
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
         this.text.text = data.name + "(" + data.type + ")[" + data.count + "]";
      }
      
      protected function onVisible(param1:MouseEvent) : void
      {
         this.data.group.visible = param1.target.label != "隐藏";
         this.visibleBtn.visible = !this.visibleBtn.visible;
         this.showvisibleBtn.visible = !this.showvisibleBtn.visible;
      }
      
      private function _LayerItem_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 5;
         _loc1_.width = 24;
         _loc1_.height = 24;
         _loc1_.label = "隐藏";
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("icon","spritePool/eye_visible.png");
         _loc1_.setStyle("skinClass",IconNoneButtonSkin);
         _loc1_.addEventListener("click",this.__visibleBtn_click);
         _loc1_.id = "visibleBtn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.visibleBtn = _loc1_;
         BindingManager.executeBindings(this,"visibleBtn",this.visibleBtn);
         return _loc1_;
      }
      
      public function __visibleBtn_click(param1:MouseEvent) : void
      {
         this.onVisible(param1);
      }
      
      private function _LayerItem_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.visible = false;
         _loc1_.x = 5;
         _loc1_.width = 24;
         _loc1_.height = 24;
         _loc1_.label = "显示";
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("icon","spritePool/eye_novisible.png");
         _loc1_.setStyle("skinClass",IconNoneButtonSkin);
         _loc1_.addEventListener("click",this.__showvisibleBtn_click);
         _loc1_.id = "showvisibleBtn";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.showvisibleBtn = _loc1_;
         BindingManager.executeBindings(this,"showvisibleBtn",this.showvisibleBtn);
         return _loc1_;
      }
      
      public function __showvisibleBtn_click(param1:MouseEvent) : void
      {
         this.onVisible(param1);
      }
      
      private function _LayerItem_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "图层名字";
         _loc1_.x = 40;
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
      public function get showvisibleBtn() : Button
      {
         return this._1544481607showvisibleBtn;
      }
      
      public function set showvisibleBtn(param1:Button) : void
      {
         var _loc2_:Object = this._1544481607showvisibleBtn;
         if(_loc2_ !== param1)
         {
            this._1544481607showvisibleBtn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showvisibleBtn",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get visibleBtn() : Button
      {
         return this._1943857290visibleBtn;
      }
      
      public function set visibleBtn(param1:Button) : void
      {
         var _loc2_:Object = this._1943857290visibleBtn;
         if(_loc2_ !== param1)
         {
            this._1943857290visibleBtn = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"visibleBtn",_loc2_,param1));
            }
         }
      }
   }
}

