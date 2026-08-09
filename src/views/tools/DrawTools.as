package views.tools
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.primitives.Line;
   
   public class DrawTools extends NavigatorContent
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _827666741scaleSlider:HSlider;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function DrawTools()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 26;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._DrawTools_Array1_c);
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
      
      private function _DrawTools_Array1_c() : Array
      {
         return [this._DrawTools_HGroup1_c()];
      }
      
      private function _DrawTools_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DrawTools_Line1_c(),this._DrawTools_Label1_c(),this._DrawTools_HSlider1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DrawTools_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 0;
         _loc1_.xTo = 0;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 26;
         _loc1_.stroke = this._DrawTools_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _DrawTools_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _DrawTools_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "比例";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DrawTools_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.maximum = 3;
         _loc1_.minimum = 0.1;
         _loc1_.stepSize = 0.1;
         _loc1_.value = 1;
         _loc1_.id = "scaleSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scaleSlider = _loc1_;
         BindingManager.executeBindings(this,"scaleSlider",this.scaleSlider);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get scaleSlider() : HSlider
      {
         return this._827666741scaleSlider;
      }
      
      public function set scaleSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._827666741scaleSlider;
         if(_loc2_ !== param1)
         {
            this._827666741scaleSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scaleSlider",_loc2_,param1));
            }
         }
      }
   }
}

