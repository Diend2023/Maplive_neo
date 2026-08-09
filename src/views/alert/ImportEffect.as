package views.alert
{
   import com.worlize.gif.GIFDecoder;
   import com.worlize.gif.GIFFrame;
   import com.worlize.gif.events.GIFDecoderEvent;
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
   import mx.graphics.codec.PNGEncoder;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.Panel;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import utils.FileUtils;
   import utils.MaxRectsBinPack;
   
   public class ImportEffect extends Panel
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {
      private var _skinParts:Object = { //
         "contentGroup":false,
         "titleDisplay":false,
         "controlBarGroup":false
      };
      
      private var _2071489326skipFrame:NumericStepper;
      
      private var _3556653text:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var _file:File = null;
      
      public function ImportEffect()
      {
         super();
         mx_internal::_document = this;
         this.width = 182;
         this.height = 134;
         this.title = "正在导入特效";
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._ImportEffect_Array1_c);
         this.addEventListener("addedToStage",this.___ImportEffect_Panel1_addedToStage);
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
      
      public function improtEffectFile(param1:File) : void
      {
         var gif:GIFDecoder = null;
         var file:File = param1;
         gif = new GIFDecoder();
         gif.decodeBytes(FileUtils.readBytes(file));
         gif.addEventListener(GIFDecoderEvent.DECODE_COMPLETE,function(param1:GIFDecoderEvent):void
         {
            var _loc15_:GIFFrame = null;
            var _loc16_:Rectangle = null;
            var _loc17_:Matrix = null;
            var _loc18_:XML = null;
            var _loc2_:MaxRectsBinPack = new MaxRectsBinPack(4096,4096);
            var _loc3_:int = int(gif.frames.length * gif.frames[0].width);
            var _loc4_:int = int(gif.frames.length * gif.frames[0].height);
            var _loc5_:int = 0;
            while(_loc5_ < gif.frames.length)
            {
               if(_loc5_ % skipFrame.value == 0 || skipFrame.value == 0)
               {
                  _loc15_ = gif.frames[_loc5_];
                  _loc2_.insert(_loc15_.bitmapData.width,_loc15_.bitmapData.height,1);
               }
               _loc5_++;
            }
            var _loc6_:BitmapData = new BitmapData(4096,4096,true,0);
            var _loc7_:int = 0;
            var _loc8_:int = 0;
            var _loc9_:XML = <TextureAtlas/>;
            _loc9_.@imagePath = file.name.replace(".gif",".png");
            var _loc10_:int = 0;
            var _loc11_:int = 0;
            while(_loc11_ < _loc2_.usedRectangles.length)
            {
               _loc16_ = _loc2_.usedRectangles[_loc10_];
               _loc17_ = new Matrix();
               _loc17_.tx = _loc16_.x;
               _loc17_.ty = _loc16_.y;
               _loc6_.draw(gif.frames[_loc11_ * (skipFrame.value + 1)].bitmapData,_loc17_);
               if(_loc17_.tx + _loc16_.width > _loc7_)
               {
                  _loc7_ = _loc17_.tx + _loc16_.width;
               }
               if(_loc17_.ty + _loc16_.height > _loc8_)
               {
                  _loc8_ = _loc17_.ty + _loc16_.height;
               }
               _loc18_ = <SubTexture/>;
               _loc18_.@name = "gif" + _loc11_;
               _loc18_.@x = _loc16_.x;
               _loc18_.@y = _loc16_.y;
               _loc18_.@width = _loc16_.width;
               _loc18_.@height = _loc16_.height;
               _loc9_.appendChild(_loc18_);
               _loc10_++;
               _loc11_++;
            }
            var _loc12_:BitmapData = new BitmapData(_loc7_,_loc8_,true,0);
            _loc12_.copyPixels(_loc6_,_loc12_.rect,new Point());
            var _loc13_:PNGEncoder = new PNGEncoder();
            var _loc14_:ByteArray = _loc13_.encode(_loc12_);
            FileUtils.writeBytes(App.projectFile.resolvePath("effect/" + text.text + ".png"),_loc14_);
            FileUtils.writeString(App.projectFile.resolvePath("effect/" + text.text + ".xml"),_loc9_.toXMLString());
            remove();
         });
      }
      
      public function remove() : void
      {
         PopUpManager.removePopUp(this);
      }
      
      protected function onInit(param1:Event) : void
      {
         var event:Event = param1;
         callLater(function():void
         {
            text.text = _file.name.replace(".gif","");
         });
      }
      
      private function _ImportEffect_Array1_c() : Array
      {
         return [this._ImportEffect_VGroup1_c()];
      }
      
      private function _ImportEffect_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 5;
         _loc1_.mxmlContent = [this._ImportEffect_HGroup1_c(),this._ImportEffect_HGroup2_c(),this._ImportEffect_HGroup3_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._ImportEffect_Label1_c(),this._ImportEffect_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "命名：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.id = "text";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.text = _loc1_;
         BindingManager.executeBindings(this,"text",this.text);
         return _loc1_;
      }
      
      private function _ImportEffect_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.mxmlContent = [this._ImportEffect_Label2_c(),this._ImportEffect_NumericStepper1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "跳帧：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.value = 0;
         _loc1_.id = "skipFrame";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.skipFrame = _loc1_;
         BindingManager.executeBindings(this,"skipFrame",this.skipFrame);
         return _loc1_;
      }
      
      private function _ImportEffect_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.horizontalAlign = "center";
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._ImportEffect_Button1_c(),this._ImportEffect_Button2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ImportEffect_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "确定";
         _loc1_.addEventListener("click",this.___ImportEffect_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ImportEffect_Button1_click(param1:MouseEvent) : void
      {
         this.improtEffectFile(this._file);
      }
      
      private function _ImportEffect_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "取消";
         _loc1_.addEventListener("click",this.___ImportEffect_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___ImportEffect_Button2_click(param1:MouseEvent) : void
      {
         PopUpManager.removePopUp(this);
      }
      
      public function ___ImportEffect_Panel1_addedToStage(param1:Event) : void
      {
         this.onInit(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get skipFrame() : NumericStepper
      {
         return this._2071489326skipFrame;
      }
      
      public function set skipFrame(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._2071489326skipFrame;
         if(_loc2_ !== param1)
         {
            this._2071489326skipFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"skipFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : TextInput
      {
         return this._3556653text;
      }
      
      public function set text(param1:TextInput) : void
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

