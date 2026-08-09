package views.observe.role
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   
   public class RoleConfigView extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _1715632060effectName:TextInput;
      
      private var _101609fps:TextInput;
      
      private var _109250890scale:TextInput;
      
      private var _118807xml:XML;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function RoleConfigView()
      {
         super();
         mx_internal::_document = this;
         this.width = 194;
         this.height = 154;
         this.title = "角色配置";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._RoleConfigView_Array1_c);
         this._RoleConfigView_XML1_i();
         this.addEventListener("initialize",this.___RoleConfigView_Panel1_initialize);
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
      
      protected function onEnter(param1:MouseEvent) : void
      {
         this.xml.@scale = this.scale.text;
         this.xml.@fps = this.fps.text;
         this.xml.@hitEffectName = this.effectName.text;
         this.dispatchEvent(new Event(OpenEvent.CHANGE,true));
         PopUpManager.removePopUp(this);
      }
      
      protected function onInit(param1:FlexEvent) : void
      {
         if(this.xml.@scale != undefined)
         {
            this.scale.text = this.xml.@scale;
         }
         else
         {
            this.scale.text = "1";
         }
         if(this.xml.@fps != undefined)
         {
            this.fps.text = this.xml.@fps;
         }
         else
         {
            this.fps.text = "24";
         }
         if(this.xml.@hitEffectName != undefined)
         {
            this.effectName.text = this.xml.@hitEffectName;
         }
      }
      
      private function _RoleConfigView_XML1_i() : XML
      {
         var _loc1_:XML = null;
         this.xml = _loc1_;
         BindingManager.executeBindings(this,"xml",this.xml);
         return _loc1_;
      }
      
      private function _RoleConfigView_Array1_c() : Array
      {
         return [this._RoleConfigView_VGroup1_c()];
      }
      
      private function _RoleConfigView_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 5;
         _loc1_.mxmlContent = [this._RoleConfigView_HGroup1_c(),this._RoleConfigView_HGroup2_c(),this._RoleConfigView_HGroup3_c(),this._RoleConfigView_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._RoleConfigView_Label1_c(),this._RoleConfigView_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "角色缩放";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "1";
         _loc1_.id = "scale";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scale = _loc1_;
         BindingManager.executeBindings(this,"scale",this.scale);
         return _loc1_;
      }
      
      private function _RoleConfigView_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._RoleConfigView_Label2_c(),this._RoleConfigView_TextInput2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "全局FPS";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "24";
         _loc1_.id = "fps";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fps = _loc1_;
         BindingManager.executeBindings(this,"fps",this.fps);
         return _loc1_;
      }
      
      private function _RoleConfigView_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._RoleConfigView_Label3_c(),this._RoleConfigView_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "打击特效";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "";
         _loc1_.id = "effectName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.effectName = _loc1_;
         BindingManager.executeBindings(this,"effectName",this.effectName);
         return _loc1_;
      }
      
      private function _RoleConfigView_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._RoleConfigView_Button1_c(),this._RoleConfigView_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleConfigView_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___RoleConfigView_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___RoleConfigView_Button1_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _RoleConfigView_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___RoleConfigView_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___RoleConfigView_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___RoleConfigView_Panel1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get effectName() : TextInput
      {
         return this._1715632060effectName;
      }
      
      public function set effectName(param1:TextInput) : void
      {
         var _loc2_:Object = this._1715632060effectName;
         if(_loc2_ !== param1)
         {
            this._1715632060effectName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"effectName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fps() : TextInput
      {
         return this._101609fps;
      }
      
      public function set fps(param1:TextInput) : void
      {
         var _loc2_:Object = this._101609fps;
         if(_loc2_ !== param1)
         {
            this._101609fps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fps",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scale() : TextInput
      {
         return this._109250890scale;
      }
      
      public function set scale(param1:TextInput) : void
      {
         var _loc2_:Object = this._109250890scale;
         if(_loc2_ !== param1)
         {
            this._109250890scale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xml() : XML
      {
         return this._118807xml;
      }
      
      public function set xml(param1:XML) : void
      {
         var _loc2_:Object = this._118807xml;
         if(_loc2_ !== param1)
         {
            this._118807xml = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xml",_loc2_,param1));
            }
         }
      }
   }
}

