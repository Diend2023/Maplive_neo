package views.observe
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
   import mx.containers.HDividedBox;
   import mx.containers.VDividedBox;
   import mx.containers.ViewStack;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColorStroke;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import skins.IconTabBarSkin;
   import skins.TextAreaSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NavigatorContent;
   import spark.components.NumericStepper;
   import spark.components.Scroller;
   import spark.components.TabBar;
   import spark.components.TextArea;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.TextOperationEvent;
   import spark.primitives.Line;
   import tmx.Npc;
   import tmx.SpriteBitmapData;
   import tmx.SpriteXMLManage;
   import utils.FileUtils;
   import views.RefObserve;
   import views.SelectElementView;
   import views.observe.text.HitDarwSprite;
   import views.observe.text.TextSpriteFrame;
   import views.observe.text.TimeLine;
   
   use namespace mx_internal;
   
   public class TextObserve extends RefObserve implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _268195779cardFrame:TextInput;
      
      private var _3091780draw:UIComponent;
      
      private var _136468215drawTools:NavigatorContent;
      
      private var _100325eff:NumericStepper;
      
      private var _3214351hurt:NumericStepper;
      
      private var _100313435image:BorderContainer;
      
      private var _104086693mouse:NavigatorContent;
      
      private var _586681095mouse_all:NavigatorContent;
      
      private var _993759480pclass:TextInput;
      
      private var _10262312pframeName:TextInput;
      
      private var _3443508play:Button;
      
      private var _1564061428pointDraw:UIComponent;
      
      private var _3592px:TextInput;
      
      private var _3593py:TextInput;
      
      private var _109627663sound:TextInput;
      
      private var _109757064stack:ViewStack;
      
      private var _3540994stop:Button;
      
      private var _1004197030textArea:TextArea;
      
      private var _2076650431timeline:TimeLine;
      
      private var _110545371tools:TabBar;
      
      private var _1140078720toolsBg:BorderContainer;
      
      private var _2068213191xmlConfig:TextArea;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _spriteXmlManage:SpriteXMLManage;
      
      private var _npc:Npc;
      
      private var _isDrop:Boolean = false;
      
      private var _isPlay:Boolean = false;
      
      private var _hitSprite:HitDarwSprite;
      
      private var _embed_mxml_tmxtools_pencil_png_1597401960:Class;
      
      private var _embed_mxml_tmxtools_select_png_1893312406:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TextObserve()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml_tmxtools_pencil_png_1597401960 = TextObserve__embed_mxml_tmxtools_pencil_png_1597401960;
         this._embed_mxml_tmxtools_select_png_1893312406 = TextObserve__embed_mxml_tmxtools_select_png_1893312406;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TextObserve_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_TextObserveWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TextObserve[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._TextObserve_Array1_c);
         this.addEventListener("initialize",this.___TextObserve_RefObserve1_initialize);
         this.addEventListener("removedFromStage",this.___TextObserve_RefObserve1_removedFromStage);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TextObserve._watcherSetupUtil = param1;
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
      
      private function onInit() : void
      {
         this._spriteXmlManage = new SpriteXMLManage();
         this._spriteXmlManage.updateTmxPaht(App.projectFile);
         callLater(function():void
         {
            var pngFile:File;
            textArea.text = FileUtils.readString(file);
            pngFile = file.parent.resolvePath(file.name.replace(".xml",".png"));
            if(pngFile.exists)
            {
               _spriteXmlManage.load(file,function(param1:SpriteBitmapData):void
               {
                  _npc = new Npc(param1);
                  draw.addChild(_npc);
                  _npc.x = draw.width / 2;
                  _npc.y = draw.height / 2;
                  px.text = int(_npc.getData().targetXml.@px).toFixed();
                  py.text = int(_npc.getData().targetXml.@py).toFixed();
                  pclass.text = String(_npc.getData().targetXml["class"]);
                  sound.text = String(_npc.getData().targetXml["sound"]);
                  _hitSprite = new HitDarwSprite();
                  pointDraw.addChild(_hitSprite);
                  _hitSprite.x = _npc.x;
                  _hitSprite.y = _npc.y;
                  _npc.contextMenu = null;
                  eff.enabled = false;
                  timeline.onSelect = onSelect;
                  timeline.setXml(param1.targetXml);
                  draw.width = _npc.width * 2 + _npc.x;
                  draw.height = _npc.height * 2 + _npc.y;
               });
            }
            else
            {
               image.width = 0;
               image.height = 0;
               textArea.left = 0;
               image.visible = false;
            }
         });
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onSelect(param1:TextSpriteFrame) : void
      {
         this.timeline.frame = param1.id;
         if(this._isPlay)
         {
            this.onPlayOrStop(null);
         }
         this._npc.frame = param1.id;
         this._npc.onFrame(false,true);
         this._hitSprite.drawPoint(this.timeline.currentFrame.hitPointReference);
         this.eff.enabled = this._hitSprite.point.length >= 3;
         this.eff.value = this.timeline.currentFrame.live;
         this.hurt.value = this.timeline.currentFrame.hurt;
         this.pframeName.text = param1.data.@name;
         this.cardFrame.text = String(int(param1.data.@cardFrame));
         this.xmlConfig.text = this.timeline.currentFrame.data.toXMLString();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(this.tools.selectedIndex <= 1)
         {
            this._npc.bitmap.startDrag();
            this._isDrop = true;
         }
         else
         {
            _loc2_ = new Point(this._hitSprite.mouseX,this._hitSprite.mouseY);
            this._hitSprite.push(_loc2_);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         if(!this._isDrop)
         {
            return;
         }
         if(this.tools.selectedIndex == 1)
         {
            this.px.text = String(this._npc.bitmap.x + this._npc.getData().currentFrameX);
            this.py.text = String(this._npc.bitmap.y + this._npc.getData().currentFrameY);
         }
         else
         {
            this.timeline.currentFrame.data.@frameX = -this._npc.bitmap.x;
            this.timeline.currentFrame.data.@frameY = -this._npc.bitmap.y;
            this.timeline.currentFrame.data.@frameWidth = this._npc.bitmap.width;
            this.timeline.currentFrame.data.@frameHeight = this._npc.bitmap.width;
         }
         this.onInputChange();
         this.stopDrag();
         this._isDrop = false;
      }
      
      override public function onSave() : void
      {
         var newXml:XML = null;
         try
         {
            newXml = new XML(this.textArea.text);
            FileUtils.writeString(file,this.textArea.text);
            System.disposeXML(this._npc.getData().targetXml);
            this.px.text = String(int(this._npc.getData().targetXml.@px));
            this.py.text = String(int(this._npc.getData().targetXml.@py));
            this.pclass.text = String(this._npc.getData().targetXml["class"]);
            super.onSave();
         }
         catch(e:Error)
         {
            Alert.show("格式错误","保存失败");
         }
      }
      
      override public function onFrame() : void
      {
         if(this._isPlay && this._npc && !this._isDrop)
         {
            this._npc.onFrame(true,true);
            this.timeline.frame = this._npc.frame;
            this._hitSprite.drawPoint(this.timeline.currentFrame.hitPointReference);
            this.eff.enabled = this._hitSprite.point.length >= 3;
            this.hurt.enabled = this.eff.enabled;
            this.eff.value = this.timeline.currentFrame.live;
         }
      }
      
      private function onInputChange() : void
      {
         this._npc.getData().targetXml.@px = int(this.px.text);
         this._npc.getData().targetXml.@py = int(this.py.text);
         this._npc.getData().targetXml["class"] = this.pclass.text;
         this._npc.getData().targetXml["sound"] = this.sound.text;
         this.onChange();
      }
      
      protected function onRemove(param1:Event) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      protected function onPlayOrStop(param1:MouseEvent) : void
      {
         this.play.visible = !this.play.visible;
         this.stop.visible = !this.stop.visible;
         this._isPlay = !this.play.visible;
      }
      
      protected function onRightClick(param1:MouseEvent) : void
      {
         this._hitSprite.over();
         this.timeline.currentFrame.data.@hitPoint = this._hitSprite.getPointValue();
         this.timeline.currentFrame.hitPointReference = this._hitSprite.point.concat();
         this.onChange();
      }
      
      public function updateXml() : void
      {
         if(this._npc)
         {
            this.textArea.text = this._npc.getData().targetXml.toXMLString();
            this._hitSprite.drawPoint(this.timeline.currentFrame.hitPointReference);
            this.eff.enabled = this._hitSprite.point.length >= 3;
            this.hurt.enabled = this.eff.enabled;
            this.timeline.updateEff();
            if(this._npc.getData().targetXml.@sound != undefined)
            {
               this.sound.text = this._npc.getData().targetXml.@sound;
            }
         }
      }
      
      override public function onChange() : void
      {
         super.onChange();
         this.updateXml();
      }
      
      protected function onEffChange(param1:Event) : void
      {
         if(this._hitSprite)
         {
            if(this.timeline.currentFrame.hitFrameReference)
            {
               this.timeline.currentFrame.hitFrameReference.data.@hitEffect = this.eff.value;
               this.timeline.currentFrame.hitFrameReference.data.@hurtInterval = this.hurt.value;
               this.timeline.currentFrame.hitFrameReference.data.@cardFrame = this.cardFrame.text;
            }
            else
            {
               this.timeline.currentFrame.data.@hitEffect = this.eff.value;
               this.timeline.currentFrame.data.@hurtInterval = this.hurt.value;
               this.timeline.currentFrame.data.@cardFrame = this.cardFrame.text;
            }
         }
         this.onChange();
      }
      
      protected function onConfigChange(param1:MouseEvent) : void
      {
         var openfile:File = null;
         var event:MouseEvent = param1;
         openfile = new File();
         openfile.browseForOpen("选择地图目录",[new FileFilter("*.xml","*.xml","*.xml")]);
         openfile.addEventListener(Event.SELECT,function(param1:Event):void
         {
            var _loc2_:XML = new XML(FileUtils.readString(openfile));
            var _loc3_:String = _loc2_.@imagePath;
            _loc3_ = _loc3_.substr(0,_loc3_.indexOf("."));
            if(file.name.indexOf(_loc3_) == -1)
            {
               Alert.show("资源名不匹配，怀疑这不是同一份资源文件。","提示");
               return;
            }
            openfile.parent.resolvePath(_loc3_ + ".png").copyTo(file.parent.resolvePath(_loc3_ + ".png"),true);
            updateXmlData(_loc2_);
         });
      }
      
      override public function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case 188:
               --this.timeline.frame;
               this.onSelect(this.timeline.currentFrame);
               break;
            case 190:
               ++this.timeline.frame;
               this.onSelect(this.timeline.currentFrame);
         }
      }
      
      public function updateXmlData(param1:XML) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc2_:XMLList = param1.children();
         var _loc3_:Array = ["hitPoint","frameX","frameY","frameHeight","frameWidth"];
         var _loc4_:XMLList = new XML(this.textArea.text).children();
         for(_loc5_ in _loc4_)
         {
            for(_loc6_ in _loc2_)
            {
               if(_loc4_[_loc5_].@name == _loc2_[_loc6_].@name)
               {
                  for(_loc7_ in _loc3_)
                  {
                     if(_loc4_[_loc5_][_loc3_[_loc7_]] != undefined)
                     {
                        _loc2_[_loc6_][_loc3_[_loc7_]] = _loc4_[_loc5_][_loc3_[_loc7_]];
                     }
                  }
               }
            }
         }
         this._npc.getData().targetXml = param1;
         this.textArea.text = param1.toXMLString();
         this.onInputChange();
         this.onSave();
      }
      
      protected function onSoundSelect(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var select:SelectElementView = new SelectElementView();
         select.findDir = "sound";
         select.extension = "mp3";
         select.title = "添加音效";
         select.callFunc = function(param1:File):void
         {
            var _loc2_:String = param1.nativePath.substr(param1.nativePath.lastIndexOf("sound") + 6);
            if(_loc2_.indexOf("\\") != -1)
            {
               _loc2_ = _loc2_.split("\\").join("/");
            }
            sound.text = _loc2_.substr(0,_loc2_.lastIndexOf("."));
            onChange();
         };
         PopUpManager.addPopUp(select,this,true);
      }
      
      private function _TextObserve_Array1_c() : Array
      {
         return [this._TextObserve_HDividedBox1_c()];
      }
      
      private function _TextObserve_HDividedBox1_c() : HDividedBox
      {
         var temp:HDividedBox = new HDividedBox();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":HDividedBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":BorderContainer,
                  "id":"image",
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.5;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":50,
                        "percentHeight":100,
                        "minWidth":200,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_TextObserve_Array2_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VGroup,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":50,
                        "percentHeight":100,
                        "mxmlContent":[_TextObserve_TextArea2_i()]
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _TextObserve_Array2_c() : Array
      {
         return [this._TextObserve_VDividedBox1_c()];
      }
      
      private function _TextObserve_VDividedBox1_c() : VDividedBox
      {
         var temp:VDividedBox = new VDividedBox();
         temp.percentWidth = 100;
         temp.percentHeight = 100;
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":VDividedBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":VGroup,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "gap":0,
                        "mxmlContent":[_TextObserve_Scroller1_c(),_TextObserve_BorderContainer2_i(),_TextObserve_Scroller2_c()]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VGroup,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":250,
                        "left":5,
                        "top":305,
                        "mxmlContent":[_TextObserve_HGroup2_c(),_TextObserve_TextArea1_i(),_TextObserve_HGroup3_c(),_TextObserve_HGroup4_c(),_TextObserve_HGroup5_c()]
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _TextObserve_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.height = 64;
         _loc1_.viewport = this._TextObserve_TimeLine1_i();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TimeLine1_i() : TimeLine
      {
         var _loc1_:TimeLine = new TimeLine();
         _loc1_.id = "timeline";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeline = _loc1_;
         BindingManager.executeBindings(this,"timeline",this.timeline);
         return _loc1_;
      }
      
      private function _TextObserve_BorderContainer2_i() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.height = 32;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TextObserve_Array4_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.id = "toolsBg";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.toolsBg = _loc1_;
         BindingManager.executeBindings(this,"toolsBg",this.toolsBg);
         return _loc1_;
      }
      
      private function _TextObserve_Array4_c() : Array
      {
         return [this._TextObserve_HGroup1_c()];
      }
      
      private function _TextObserve_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.verticalAlign = "middle";
         _loc1_.left = 5;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TextObserve_Group1_c(),this._TextObserve_Line1_c(),this._TextObserve_TabBar1_i(),this._TextObserve_ViewStack1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.mxmlContent = [this._TextObserve_Button1_i(),this._TextObserve_Button2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","timeline/play.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.__play_click);
         _loc1_.id = "play";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.play = _loc1_;
         BindingManager.executeBindings(this,"play",this.play);
         return _loc1_;
      }
      
      public function __play_click(param1:MouseEvent) : void
      {
         this.onPlayOrStop(param1);
      }
      
      private function _TextObserve_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.visible = false;
         _loc1_.setStyle("icon","timeline/pause.png");
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.__stop_click);
         _loc1_.id = "stop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stop = _loc1_;
         BindingManager.executeBindings(this,"stop",this.stop);
         return _loc1_;
      }
      
      public function __stop_click(param1:MouseEvent) : void
      {
         this.onPlayOrStop(param1);
      }
      
      private function _TextObserve_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 0;
         _loc1_.xTo = 0;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 26;
         _loc1_.stroke = this._TextObserve_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TextObserve_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _TextObserve_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",IconTabBarSkin);
         _loc1_.id = "tools";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tools = _loc1_;
         BindingManager.executeBindings(this,"tools",this.tools);
         return _loc1_;
      }
      
      private function _TextObserve_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.id = "stack";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"stack",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"mouse",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "icon":_embed_mxml_tmxtools_select_png_1893312406,
                        "label":"选择当前/修改当前"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"mouse_all",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "icon":_embed_mxml_tmxtools_select_png_1893312406,
                        "label":"选择全部/修改全部"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"drawTools",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "icon":_embed_mxml_tmxtools_pencil_png_1597401960,
                        "label":"绘制碰撞块"
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.stack = temp;
         BindingManager.executeBindings(this,"stack",this.stack);
         return temp;
      }
      
      private function _TextObserve_Scroller2_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._TextObserve_Group2_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TextObserve_UIComponent1_i(),this._TextObserve_UIComponent2_i()];
         _loc1_.addEventListener("mouseDown",this.___TextObserve_Group2_mouseDown);
         _loc1_.addEventListener("rightClick",this.___TextObserve_Group2_rightClick);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "draw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.draw = _loc1_;
         BindingManager.executeBindings(this,"draw",this.draw);
         return _loc1_;
      }
      
      private function _TextObserve_UIComponent2_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "pointDraw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pointDraw = _loc1_;
         BindingManager.executeBindings(this,"pointDraw",this.pointDraw);
         return _loc1_;
      }
      
      public function ___TextObserve_Group2_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function ___TextObserve_Group2_rightClick(param1:MouseEvent) : void
      {
         this.onRightClick(param1);
      }
      
      private function _TextObserve_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TextObserve_Button3_c(),this._TextObserve_Label1_c(),this._TextObserve_TextInput1_i(),this._TextObserve_Button4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "更换配置资源";
         _loc1_.addEventListener("click",this.___TextObserve_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TextObserve_Button3_click(param1:MouseEvent) : void
      {
         this.onConfigChange(param1);
      }
      
      private function _TextObserve_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "音效：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__sound_change);
         _loc1_.id = "sound";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sound = _loc1_;
         BindingManager.executeBindings(this,"sound",this.sound);
         return _loc1_;
      }
      
      public function __sound_change(param1:TextOperationEvent) : void
      {
         this.onInputChange();
      }
      
      private function _TextObserve_Button4_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "选择";
         _loc1_.addEventListener("click",this.___TextObserve_Button4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TextObserve_Button4_click(param1:MouseEvent) : void
      {
         this.onSoundSelect(param1);
      }
      
      private function _TextObserve_TextArea1_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.width = 360;
         _loc1_.height = 64;
         _loc1_.id = "xmlConfig";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.xmlConfig = _loc1_;
         BindingManager.executeBindings(this,"xmlConfig",this.xmlConfig);
         return _loc1_;
      }
      
      private function _TextObserve_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TextObserve_Label2_c(),this._TextObserve_TextInput2_i(),this._TextObserve_Label3_c(),this._TextObserve_TextInput3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "帧名称：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.editable = false;
         _loc1_.selectable = true;
         _loc1_.id = "pframeName";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pframeName = _loc1_;
         BindingManager.executeBindings(this,"pframeName",this.pframeName);
         return _loc1_;
      }
      
      private function _TextObserve_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "类绑定：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput3_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__pclass_change);
         _loc1_.id = "pclass";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pclass = _loc1_;
         BindingManager.executeBindings(this,"pclass",this.pclass);
         return _loc1_;
      }
      
      public function __pclass_change(param1:TextOperationEvent) : void
      {
         this.onInputChange();
      }
      
      private function _TextObserve_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TextObserve_Label4_c(),this._TextObserve_TextInput4_i(),this._TextObserve_Label5_c(),this._TextObserve_TextInput5_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X偏移：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput4_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__px_change);
         _loc1_.id = "px";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.px = _loc1_;
         BindingManager.executeBindings(this,"px",this.px);
         return _loc1_;
      }
      
      public function __px_change(param1:TextOperationEvent) : void
      {
         this.onInputChange();
      }
      
      private function _TextObserve_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y偏移：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput5_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.addEventListener("change",this.__py_change);
         _loc1_.id = "py";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.py = _loc1_;
         BindingManager.executeBindings(this,"py",this.py);
         return _loc1_;
      }
      
      public function __py_change(param1:TextOperationEvent) : void
      {
         this.onInputChange();
      }
      
      private function _TextObserve_HGroup5_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.horizontalAlign = "left";
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._TextObserve_Label6_c(),this._TextObserve_NumericStepper1_i(),this._TextObserve_Label7_c(),this._TextObserve_NumericStepper2_i(),this._TextObserve_Label8_c(),this._TextObserve_TextInput6_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "有效帧：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.minimum = 0;
         _loc1_.value = 0;
         _loc1_.addEventListener("change",this.__eff_change);
         _loc1_.id = "eff";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.eff = _loc1_;
         BindingManager.executeBindings(this,"eff",this.eff);
         return _loc1_;
      }
      
      public function __eff_change(param1:Event) : void
      {
         this.onEffChange(param1);
      }
      
      private function _TextObserve_Label7_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "伤害间隔：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_NumericStepper2_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.minimum = 0;
         _loc1_.value = 0;
         _loc1_.addEventListener("change",this.__hurt_change);
         _loc1_.id = "hurt";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.hurt = _loc1_;
         BindingManager.executeBindings(this,"hurt",this.hurt);
         return _loc1_;
      }
      
      public function __hurt_change(param1:Event) : void
      {
         this.onEffChange(param1);
      }
      
      private function _TextObserve_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "卡帧：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextObserve_TextInput6_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.text = "0";
         _loc1_.addEventListener("change",this.__cardFrame_change);
         _loc1_.id = "cardFrame";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cardFrame = _loc1_;
         BindingManager.executeBindings(this,"cardFrame",this.cardFrame);
         return _loc1_;
      }
      
      public function __cardFrame_change(param1:TextOperationEvent) : void
      {
         this.onEffChange(param1);
      }
      
      private function _TextObserve_TextArea2_i() : TextArea
      {
         var _loc1_:TextArea = new TextArea();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",TextAreaSkin);
         _loc1_.setStyle("contentBackgroundAlpha",0.5);
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("leadingModel","ideographicCenterDown");
         _loc1_.addEventListener("change",this.__textArea_change);
         _loc1_.id = "textArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.textArea = _loc1_;
         BindingManager.executeBindings(this,"textArea",this.textArea);
         return _loc1_;
      }
      
      public function __textArea_change(param1:TextOperationEvent) : void
      {
         this.onChange();
      }
      
      public function ___TextObserve_RefObserve1_initialize(param1:FlexEvent) : void
      {
         this.onInit();
      }
      
      public function ___TextObserve_RefObserve1_removedFromStage(param1:Event) : void
      {
         this.onRemove(param1);
      }
      
      private function _TextObserve_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"tools.dataProvider","stack");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get cardFrame() : TextInput
      {
         return this._268195779cardFrame;
      }
      
      public function set cardFrame(param1:TextInput) : void
      {
         var _loc2_:Object = this._268195779cardFrame;
         if(_loc2_ !== param1)
         {
            this._268195779cardFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cardFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get draw() : UIComponent
      {
         return this._3091780draw;
      }
      
      public function set draw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._3091780draw;
         if(_loc2_ !== param1)
         {
            this._3091780draw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"draw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drawTools() : NavigatorContent
      {
         return this._136468215drawTools;
      }
      
      public function set drawTools(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._136468215drawTools;
         if(_loc2_ !== param1)
         {
            this._136468215drawTools = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drawTools",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get eff() : NumericStepper
      {
         return this._100325eff;
      }
      
      public function set eff(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._100325eff;
         if(_loc2_ !== param1)
         {
            this._100325eff = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"eff",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hurt() : NumericStepper
      {
         return this._3214351hurt;
      }
      
      public function set hurt(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._3214351hurt;
         if(_loc2_ !== param1)
         {
            this._3214351hurt = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hurt",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get image() : BorderContainer
      {
         return this._100313435image;
      }
      
      public function set image(param1:BorderContainer) : void
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
      public function get mouse() : NavigatorContent
      {
         return this._104086693mouse;
      }
      
      public function set mouse(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._104086693mouse;
         if(_loc2_ !== param1)
         {
            this._104086693mouse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mouse",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mouse_all() : NavigatorContent
      {
         return this._586681095mouse_all;
      }
      
      public function set mouse_all(param1:NavigatorContent) : void
      {
         var _loc2_:Object = this._586681095mouse_all;
         if(_loc2_ !== param1)
         {
            this._586681095mouse_all = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mouse_all",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pclass() : TextInput
      {
         return this._993759480pclass;
      }
      
      public function set pclass(param1:TextInput) : void
      {
         var _loc2_:Object = this._993759480pclass;
         if(_loc2_ !== param1)
         {
            this._993759480pclass = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pclass",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pframeName() : TextInput
      {
         return this._10262312pframeName;
      }
      
      public function set pframeName(param1:TextInput) : void
      {
         var _loc2_:Object = this._10262312pframeName;
         if(_loc2_ !== param1)
         {
            this._10262312pframeName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pframeName",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get play() : Button
      {
         return this._3443508play;
      }
      
      public function set play(param1:Button) : void
      {
         var _loc2_:Object = this._3443508play;
         if(_loc2_ !== param1)
         {
            this._3443508play = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"play",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get pointDraw() : UIComponent
      {
         return this._1564061428pointDraw;
      }
      
      public function set pointDraw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._1564061428pointDraw;
         if(_loc2_ !== param1)
         {
            this._1564061428pointDraw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pointDraw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get px() : TextInput
      {
         return this._3592px;
      }
      
      public function set px(param1:TextInput) : void
      {
         var _loc2_:Object = this._3592px;
         if(_loc2_ !== param1)
         {
            this._3592px = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"px",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get py() : TextInput
      {
         return this._3593py;
      }
      
      public function set py(param1:TextInput) : void
      {
         var _loc2_:Object = this._3593py;
         if(_loc2_ !== param1)
         {
            this._3593py = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"py",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sound() : TextInput
      {
         return this._109627663sound;
      }
      
      public function set sound(param1:TextInput) : void
      {
         var _loc2_:Object = this._109627663sound;
         if(_loc2_ !== param1)
         {
            this._109627663sound = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sound",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stack() : ViewStack
      {
         return this._109757064stack;
      }
      
      public function set stack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._109757064stack;
         if(_loc2_ !== param1)
         {
            this._109757064stack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stop() : Button
      {
         return this._3540994stop;
      }
      
      public function set stop(param1:Button) : void
      {
         var _loc2_:Object = this._3540994stop;
         if(_loc2_ !== param1)
         {
            this._3540994stop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textArea() : TextArea
      {
         return this._1004197030textArea;
      }
      
      public function set textArea(param1:TextArea) : void
      {
         var _loc2_:Object = this._1004197030textArea;
         if(_loc2_ !== param1)
         {
            this._1004197030textArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get timeline() : TimeLine
      {
         return this._2076650431timeline;
      }
      
      public function set timeline(param1:TimeLine) : void
      {
         var _loc2_:Object = this._2076650431timeline;
         if(_loc2_ !== param1)
         {
            this._2076650431timeline = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"timeline",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tools() : TabBar
      {
         return this._110545371tools;
      }
      
      public function set tools(param1:TabBar) : void
      {
         var _loc2_:Object = this._110545371tools;
         if(_loc2_ !== param1)
         {
            this._110545371tools = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tools",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolsBg() : BorderContainer
      {
         return this._1140078720toolsBg;
      }
      
      public function set toolsBg(param1:BorderContainer) : void
      {
         var _loc2_:Object = this._1140078720toolsBg;
         if(_loc2_ !== param1)
         {
            this._1140078720toolsBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolsBg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlConfig() : TextArea
      {
         return this._2068213191xmlConfig;
      }
      
      public function set xmlConfig(param1:TextArea) : void
      {
         var _loc2_:Object = this._2068213191xmlConfig;
         if(_loc2_ !== param1)
         {
            this._2068213191xmlConfig = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlConfig",_loc2_,param1));
            }
         }
      }
   }
}

