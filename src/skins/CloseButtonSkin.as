package skins
{
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal; //
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Image;
   import spark.skins.SparkButtonSkin;
   
   public class CloseButtonSkin extends SparkButtonSkin implements IStateClient2
   {

      use namespace mx_internal; //
      
      private static const exclusions:Array = ["labelDisplay"];
      
      public var _CloseButtonSkin_Image1:Image;
      
      public var _CloseButtonSkin_Image2:Image;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var cornerRadius:Number = 2;
      
      private var _embed_mxml_button_close_png_1902431564:Class = CloseButtonSkin__embed_mxml_button_close_png_1902431564;
      
      public function CloseButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CloseButtonSkin_Image1_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CloseButtonSkin_Image2_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var unscaledWidth:Number = param1;
         var unscaledHeight:Number = param2;
         this.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
         });
         super.updateDisplayList(unscaledWidth,unscaledHeight);
      }
      
      private function _CloseButtonSkin_Image1_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml_button_close_png_1902431564;
         _loc1_.verticalCenter = 0;
         _loc1_.id = "_CloseButtonSkin_Image1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CloseButtonSkin_Image1 = _loc1_;
         BindingManager.executeBindings(this,"_CloseButtonSkin_Image1",this._CloseButtonSkin_Image1);
         return _loc1_;
      }
      
      private function _CloseButtonSkin_Image2_i() : Image
      {
         var _loc1_:Image = new Image();
         _loc1_.horizontalCenter = 0;
         _loc1_.source = this._embed_mxml_button_close_png_1902431564;
         _loc1_.verticalCenter = 0;
         _loc1_.alpha = 0.5;
         _loc1_.id = "_CloseButtonSkin_Image2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CloseButtonSkin_Image2 = _loc1_;
         BindingManager.executeBindings(this,"_CloseButtonSkin_Image2",this._CloseButtonSkin_Image2);
         return _loc1_;
      }
   }
}

