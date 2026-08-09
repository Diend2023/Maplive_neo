package views.tools
{
   import events.OpenEvent;
   import events.PushNpcEvent;
   import flash.events.MouseEvent;
   import flash.filesystem.File;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.managers.PopUpManager;
   import skins.IconButtonSkin;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.NavigatorContent;
   import views.SelectElementView;
   
   public class SpriteTools extends NavigatorContent
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function SpriteTools()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.height = 26;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._SpriteTools_Array1_c);
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
      
      protected function onAddTarget(param1:MouseEvent) : void
      {
         this.dispatchEvent(new OpenEvent(OpenEvent.ADD_TARGET));
      }
      
      protected function onAddEvent(param1:MouseEvent) : void
      {
         this.dispatchEvent(new OpenEvent(OpenEvent.ADD_EVENT));
      }
      
      protected function onAddNpc(param1:MouseEvent) : void
      {
         var addNpc:SelectElementView = null;
         var event:MouseEvent = param1;
         var npcFind:File = App.projectFile.resolvePath("npc");
         if(npcFind.exists)
         {
            addNpc = new SelectElementView();
            addNpc.findDir = "npc";
            addNpc.callFunc = function(param1:File):void
            {
               dispatchEvent(new PushNpcEvent(PushNpcEvent.ADD_NPC,param1));
            };
            PopUpManager.addPopUp(addNpc,this,true);
         }
         else
         {
            Alert.show("不存在可使用的NPC库","提示");
         }
      }
      
      private function _SpriteTools_Array1_c() : Array
      {
         return [this._SpriteTools_HGroup1_c()];
      }
      
      private function _SpriteTools_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._SpriteTools_Button1_c(),this._SpriteTools_Button2_c(),this._SpriteTools_Button3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SpriteTools_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "添加元素";
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","tmxtools/npc_add.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___SpriteTools_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SpriteTools_Button1_click(param1:MouseEvent) : void
      {
         this.onAddNpc(param1);
      }
      
      private function _SpriteTools_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "添加事件";
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","tmxtools/npc_add.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___SpriteTools_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SpriteTools_Button2_click(param1:MouseEvent) : void
      {
         this.onAddEvent(param1);
      }
      
      private function _SpriteTools_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "设置起点";
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","tmxtools/target.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___SpriteTools_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___SpriteTools_Button3_click(param1:MouseEvent) : void
      {
         this.onAddTarget(param1);
      }
   }
}

