package views.alert
{
   import deng.fzip.FZip;
   import deng.fzip.FZipEvent;
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
   import spark.components.Label;
   import spark.components.TextArea;
   import spark.components.TextInput;
   import utils.FileUtils;
   import utils.PinyinUtils;
   import views.AlertRef;
   
   public class ImportABPkg extends AlertRef
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _954925063message:TextArea;
      
      private var _116079url:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _byte:ByteArray;
      
      private var _file:File;
      
      public function ImportABPkg()
      {
         super();
         mx_internal::_document = this;
         this.width = 500;
         this.height = 400;
         this.title = "导入AB人物包";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ImportABPkg_Array1_c);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.chromeColor = 4144716;
            this.color = 16777215;
            this.backgroundColor = 5921126;
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      protected function onReadFile(param1:MouseEvent) : void
      {
         var _loc2_:File = new File();
         _loc2_.browseForOpen("选择AB人物包",[new FileFilter("*.data","*.data","*.data")]);
         _loc2_.addEventListener(Event.SELECT,this.onSelect);
      }
      
      private function onSelect(param1:Event) : void
      {
         this.url.text = (param1.target as File).nativePath;
         var _loc2_:ByteArray = FileUtils.readBytes(param1.target as File);
         this._byte = _loc2_;
         this.log("读取成功，大小：" + (_loc2_.bytesAvailable / 1024 / 1024).toFixed(2) + "kb");
      }
      
      private function log(param1:String) : void
      {
         this.message.appendText(param1 + "\n");
      }
      
      protected function onImport(param1:MouseEvent) : void
      {
         if(!this._byte)
         {
            return;
         }
         this.enabled = false;
         this._file = new File(this.url.text);
         var _loc2_:FZip = new FZip();
         _loc2_.addEventListener(FZipEvent.FILE_LOADED,this.onFile);
         _loc2_.addEventListener(Event.COMPLETE,this.onComplete);
         _loc2_.load(new URLRequest(this._file.url));
         this.log("导入开始");
      }
      
      private function onFile(param1:FZipEvent) : void
      {
         var _loc2_:File = null;
         var _loc3_:XML = null;
         this.log(param1.file.filename);
         if(param1.file.filename.indexOf("effect/") != -1)
         {
            _loc2_ = App.projectFile.resolvePath(PinyinUtils.toPinyin(param1.file.filename));
            if(!_loc2_.exists)
            {
               FileUtils.uncode(param1.file.content,23252499);
               if(_loc2_.extension == "xml")
               {
                  _loc3_ = new XML(param1.file.content.toString());
                  _loc3_.@imagePath = _loc2_.name.substr(0,_loc2_.name.indexOf(".")) + ".png";
                  FileUtils.writeString(_loc2_,_loc3_);
               }
               else
               {
                  FileUtils.writeBytes(_loc2_,param1.file.content);
               }
               this.log("新增:" + "effect/" + _loc2_.name);
            }
            else
            {
               this.log("已存在:" + "effect/" + _loc2_.name);
            }
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         this.log("导入完毕");
         this.enabled = true;
      }
      
      private function _ImportABPkg_Array1_c() : Array
      {
         return [this._ImportABPkg_Button1_c(),this._ImportABPkg_Button2_c(),this._ImportABPkg_Label1_c(),this._ImportABPkg_TextInput1_i(),this._ImportABPkg_Button3_c(),this._ImportABPkg_Label2_c(),this._ImportABPkg_TextArea1_i()];
      }
      
      private function _ImportABPkg_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 335;
         _loc1_.label = "取消";
         _loc1_.horizontalCenter = -45;
         _loc1_.addEventListener("click",this.___ImportABPkg_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ImportABPkg_Button1_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      private function _ImportABPkg_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.y = 335;
         _loc1_.label = "导入";
         _loc1_.horizontalCenter = 54;
         _loc1_.addEventListener("click",this.___ImportABPkg_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ImportABPkg_Button2_click(param1:MouseEvent) : void
      {
         this.onImport(param1);
      }
      
      private function _ImportABPkg_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 25;
         _loc1_.y = 24;
         _loc1_.text = "人物包路径：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportABPkg_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.x = 104;
         _loc1_.y = 18;
         _loc1_.width = 288;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "url";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.url = _loc1_;
         BindingManager.executeBindings(this,"url",this.url);
         return _loc1_;
      }
      
      private function _ImportABPkg_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.x = 400;
         _loc1_.y = 19;
         _loc1_.label = "浏览";
         _loc1_.addEventListener("click",this.___ImportABPkg_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ImportABPkg_Button3_click(param1:MouseEvent) : void
      {
         this.onReadFile(param1);
      }
      
      private function _ImportABPkg_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.x = 24;
         _loc1_.y = 56;
         _loc1_.text = "处理结果：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportABPkg_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.x = 24;
         _loc1_.y = 81;
         _loc1_.width = 446;
         _loc1_.height = 246;
         _loc1_.editable = false;
         _loc1_.setStyle("contentBackgroundAlpha",0.3);
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : TextArea
      {
         return this._954925063message;
      }
      
      public function set message(param1:TextArea) : void
      {
         var _loc2_:Object = this._954925063message;
         if(_loc2_ !== param1)
         {
            this._954925063message = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get url() : TextInput
      {
         return this._116079url;
      }
      
      public function set url(param1:TextInput) : void
      {
         var _loc2_:Object = this._116079url;
         if(_loc2_ !== param1)
         {
            this._116079url = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"url",_loc2_,param1));
            }
         }
      }
   }
}

