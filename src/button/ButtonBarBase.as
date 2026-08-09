package button
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import skins.CloseButtonSkin;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.supportClasses.ItemRenderer;
   import spark.primitives.BitmapImage;
   
   public class ButtonBarBase extends ItemRenderer
   {

      use namespace mx_internal; //
      
      public static const CLOSE:String = "close_event";
      
      public static const rect:Rectangle = new Rectangle(5,10,10,15);
      
      private var _326675370closeDisplay:Button;
      
      private var _1893287094titleDisplay:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__1778942604:Class = ButtonBarBase__embed_mxml__1778942604;
      
      public function ButtonBarBase()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 26;
         this.minHeight = 26;
         this.left = 0;
         this.right = 0;
         this.mxmlContent = [this._ButtonBarBase_BitmapImage1_i(),this._ButtonBarBase_HGroup1_c()];
         this.addEventListener("initialize",this.___ButtonBarBase_ItemRenderer1_initialize);
         this.addEventListener("mouseOver",this.___ButtonBarBase_ItemRenderer1_mouseOver);
         this.addEventListener("mouseOut",this.___ButtonBarBase_ItemRenderer1_mouseOut);
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
      
      override public function set selected(param1:Boolean) : void
      {
         super.selected = param1;
         this.closeDisplay.visible = param1;
         this.titleDisplay.alpha = param1 ? 0.7 : 0.5;
      }
      
      private function onInit() : void
      {
         this.autoDrawBackground = false;
      }
      
      private function over() : void
      {
         this.titleDisplay.alpha = this.selected ? 0.7 : 0.6;
         this.closeDisplay.visible = true;
      }
      
      private function end() : void
      {
         this.titleDisplay.alpha = this.selected ? 0.7 : 0.5;
         this.closeDisplay.visible = this.selected;
      }
      
      private function close() : void
      {
         this.dispatchEvent(new Event(CLOSE,true));
      }
      
      private function _ButtonBarBase_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__1778942604;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.alpha = 0.5;
         _loc1_.initialized(this,"titleDisplay");
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _ButtonBarBase_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.left = 5;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._ButtonBarBase_Label1_i(),this._ButtonBarBase_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ButtonBarBase_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _ButtonBarBase_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.setStyle("skinClass",CloseButtonSkin);
         _loc1_.addEventListener("click",this.__closeDisplay_click);
         _loc1_.id = "closeDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.closeDisplay = _loc1_;
         BindingManager.executeBindings(this,"closeDisplay",this.closeDisplay);
         return _loc1_;
      }
      
      public function __closeDisplay_click(param1:MouseEvent) : void
      {
         this.close();
      }
      
      public function ___ButtonBarBase_ItemRenderer1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      public function ___ButtonBarBase_ItemRenderer1_mouseOver(param1:MouseEvent) : void
      {
         this.over();
      }
      
      public function ___ButtonBarBase_ItemRenderer1_mouseOut(param1:MouseEvent) : void
      {
         this.end();
      }
      
      [Bindable(event="propertyChange")]
      public function get closeDisplay() : Button
      {
         return this._326675370closeDisplay;
      }
      
      public function set closeDisplay(param1:Button) : void
      {
         var _loc2_:Object = this._326675370closeDisplay;
         if(_loc2_ !== param1)
         {
            this._326675370closeDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"closeDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : BitmapImage
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
   }
}

