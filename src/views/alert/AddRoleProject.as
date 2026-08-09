package views.alert
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
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.Panel;
   import spark.components.TextArea;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import utils.FileUtils;
   import views.SelectElementView;
   
   public class AddRoleProject extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _3433509path:TextArea;
      
      private var _106808059pname:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var type:String = null;
      
      public function AddRoleProject()
      {
         super();
         mx_internal::_document = this;
         this.width = 208;
         this.title = "新增战斗角色";
         this.height = 172;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._AddRoleProject_Array1_c);
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
      
      protected function onOpen(param1:MouseEvent) : void
      {
         var _loc2_:SelectElementView = new SelectElementView();
         _loc2_.findDir = "npc";
         _loc2_.callFunc = this.readFile;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      private function readFile(param1:File) : void
      {
         var _loc2_:String = param1.name;
         _loc2_ = _loc2_.substr(0,_loc2_.indexOf("."));
         if(param1.parent.resolvePath(_loc2_ + ".xml").exists)
         {
            this.path.text += "npc/" + _loc2_ + ".xml\n";
            this.path.text += "npc/" + _loc2_ + ".png";
            this.type = "sprite";
         }
         else
         {
            this.type = "dragonbone";
            this.path.text += "npc/" + _loc2_ + ".png\n";
            this.path.text += "npc/" + _loc2_ + ".json\n";
            this.path.text += "npc/" + _loc2_.substr(0,_loc2_.indexOf("_")) + "_ske.json";
         }
      }
      
      protected function onEnter(param1:MouseEvent) : void
      {
         var _loc4_:Object = null;
         var _loc2_:XML = <Role>
					<content>
					</content>
					<loads/>
					<action>
					</action>
				</Role>;
         _loc2_.@type = this.type;
         if(this.type == "sprite")
         {
            _loc2_.action.appendChild(<act name="待机"/>);
            _loc2_.action.appendChild(<act name="行走"/>);
            _loc2_.action.appendChild(<act name="跳跃"/>);
            _loc2_.action.appendChild(<act name="降落"/>);
            _loc2_.action.appendChild(<act name="落地"/>);
            _loc2_.action.appendChild(<act name="打飞"/>);
            _loc2_.action.appendChild(<act name="倒落"/>);
            _loc2_.action.appendChild(<act name="起身"/>);
            _loc2_.action.appendChild(<act name="受伤"/>);
            _loc2_.action.appendChild(<act name="防御"/>);
            _loc2_.action.appendChild(<act name="普通攻击"/>);
            _loc2_.action.appendChild(<act name="空中攻击"/>);
         }
         var _loc3_:Array = this.path.text.split("\n");
         for(_loc4_ in _loc3_)
         {
            _loc2_.content.appendChild(XML(this.conversionXml("<file path=\'" + _loc3_[_loc4_] + "\'/>")));
         }
         FileUtils.writeString(App.projectFile.resolvePath("role/" + this.pname.text + ".data"),_loc2_.toXMLString());
         PopUpManager.removePopUp(this);
      }
      
      private function conversionXml(param1:String) : String
      {
         if(param1.indexOf("_tex") != -1)
         {
            return param1.replace("<file","<tex");
         }
         if(param1.indexOf("_ske") != -1)
         {
            return param1.replace("<file","<ske");
         }
         if(param1.indexOf(".xml") != -1)
         {
            return param1.replace("<file","<xml");
         }
         if(param1.indexOf(".png") != -1)
         {
            return param1.replace("<file","<image");
         }
         return param1;
      }
      
      private function _AddRoleProject_Array1_c() : Array
      {
         return [this._AddRoleProject_VGroup1_c()];
      }
      
      private function _AddRoleProject_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 5;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.bottom = 5;
         _loc1_.mxmlContent = [this._AddRoleProject_HGroup1_c(),this._AddRoleProject_HGroup2_c(),this._AddRoleProject_HGroup3_c(),this._AddRoleProject_HGroup4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._AddRoleProject_Label1_c(),this._AddRoleProject_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "识别名称：";
         _loc1_.setStyle("textAlign","left");
         _loc1_.setStyle("verticalAlign","top");
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.id = "pname";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pname = _loc1_;
         BindingManager.executeBindings(this,"pname",this.pname);
         return _loc1_;
      }
      
      private function _AddRoleProject_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._AddRoleProject_Label2_c(),this._AddRoleProject_TextArea1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "角色资源：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.width = 128;
         _loc1_.height = 48;
         _loc1_.id = "path";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.path = _loc1_;
         BindingManager.executeBindings(this,"path",this.path);
         return _loc1_;
      }
      
      private function _AddRoleProject_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "right";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._AddRoleProject_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "浏览资源";
         _loc1_.addEventListener("click",this.___AddRoleProject_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddRoleProject_Button1_click(param1:MouseEvent) : void
      {
         this.onOpen(param1);
      }
      
      private function _AddRoleProject_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._AddRoleProject_Button2_c(),this._AddRoleProject_Button3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _AddRoleProject_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___AddRoleProject_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddRoleProject_Button2_click(param1:MouseEvent) : void
      {
         this.onEnter(param1);
      }
      
      private function _AddRoleProject_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___AddRoleProject_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___AddRoleProject_Button3_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      [Bindable(event="propertyChange")]
      public function get path() : TextArea
      {
         return this._3433509path;
      }
      
      public function set path(param1:TextArea) : void
      {
         var _loc2_:Object = this._3433509path;
         if(_loc2_ !== param1)
         {
            this._3433509path = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"path",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pname() : TextInput
      {
         return this._106808059pname;
      }
      
      public function set pname(param1:TextInput) : void
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
   }
}

