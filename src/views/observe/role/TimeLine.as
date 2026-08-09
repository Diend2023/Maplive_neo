package views.observe.role
{
   import dragonBones.flash.FlashArmatureDisplay;
   import events.RightClickEvent;
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
   import mx.collections.ArrayCollection;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.DropDownList;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.NumericStepper;
   import spark.components.Scroller;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.IndexChangeEvent;
   import spark.events.TextOperationEvent;
   import utils.XMLUtils;
   import views.ActionView;
   import views.observe.RoleObserve;
   import views.observe.map.SwfApplicationWindow;
   import views.observe.role.frame.FPSUtil;
   import views.observe.role.frame.Frame;
   import views.observe.role.frame.FrameGroup;
   import views.observe.role.frame.FrameSprite;
   
   use namespace mx_internal;
   
   public class TimeLine extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _1851397701actionDrop:DropDownList;
      
      private var _1161803523actions:ArrayCollection;
      
      private var _1362989334cframe:Label;
      
      private var _3092207drop:DropDownList;
      
      private var _722321006fpsNumber:NumericStepper;
      
      private var _544640655frameDarw:UIComponent;
      
      private var _102572gpu:Label;
      
      private var _954925063message:Label;
      
      private var _1036773999onChange:Function;
      
      private var _1224377596onGroupSelect:Function;
      
      private var _1299060386onMouseSelect:Function;
      
      private var _1492388795onSelect:Function;
      
      private var _3443508play:Button;
      
      private var _108695229roles:ArrayCollection;
      
      private var _3540994stop:Button;
      
      private var _113425861xText:TextInput;
      
      private var _118807xml:XML;
      
      private var _114349382yText:TextInput;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      // public const timeline:Class;
      public var timeline:Class;
      
      public var currentFrameGroup:FrameGroup;
      
      public var currentFrame:Frame;
      
      private var frameSprites:Vector.<FrameSprite>;
      
      private var frameIndex:int = -1;
      
      private var _fps:FPSUtil;
      
      private var _isPlay:Boolean = false;
      
      private var _xml:XML;
      
      public var observe:RoleObserve;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TimeLine()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.timeline = TimeLine_timeline;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TimeLine_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_role_TimeLineWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TimeLine[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 332;
         this.mxmlContent = [this._TimeLine_BorderContainer1_c(),this._TimeLine_BorderContainer2_c(),this._TimeLine_Scroller1_c(),this._TimeLine_BorderContainer15_c()];
         this._TimeLine_ArrayCollection1_i();
         this._TimeLine_ArrayCollection2_i();
         this._TimeLine_XML1_i();
         this.addEventListener("initialize",this.___TimeLine_Group1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TimeLine._watcherSetupUtil = param1;
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
      
      protected function onInit(param1:FlexEvent) : void
      {
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginBitmapFill((new this.timeline() as Bitmap).bitmapData,null,true);
         _loc2_.graphics.drawRect(0,0,2048,120);
         _loc2_.graphics.endFill();
         _loc2_.alpha = 0.5;
         this.frameDarw.addChild(_loc2_);
         this._fps = new FPSUtil(24);
         this.addEventListener(RightClickEvent.CLICK,this.onRightMenuClick);
      }
      
      public function onRightMenuClick(param1:RightClickEvent) : void
      {
         var e:RightClickEvent = param1;
         switch(e.clickTag)
         {
            case "删除帧":
               this.removeAt(this.frameIndex);
               this.onChange();
               break;
            case "清除位移":
               this.currentFrame.isGoPoint = false;
               this.currentFrameGroup.math();
               this.onChange();
               break;
            case "清除碰撞":
               this.currentFrame.hitPoint = null;
               this.onChange();
               break;
            case "清除音效":
               this.currentFrame.soundName = "";
               this.onChange();
               break;
            case "清除停顿":
               this.currentFrame.isStop = false;
               this.onChange();
               break;
            case "清除元素":
               this.currentFrame.clearAllEffect();
               this.onChange();
               break;
            case "删除所有帧":
               Alert.show("是否删除所有帧，将不可还原","删除提示",Alert.OK | Alert.NO,null,function(param1:CloseEvent):void
               {
                  var _loc2_:int = 0;
                  if(param1.detail == Alert.OK)
                  {
                     _loc2_ = int(frameSprites.length - 1);
                     while(_loc2_ >= 0)
                     {
                        removeAt(_loc2_);
                        _loc2_--;
                     }
                  }
               });
         }
      }
      
      public function removeAt(param1:int) : void
      {
         if(this.currentFrameGroup)
         {
            this.currentFrameGroup.remove(param1);
            this.setFrameGroup(this.currentFrameGroup);
            this.onChange();
         }
      }
      
      public function onDown(param1:MouseEvent) : void
      {
         var _loc2_:FrameSprite = param1.target as FrameSprite;
         if(_loc2_)
         {
            this.select(_loc2_);
            _loc2_.updateMenu();
            this.onMouseSelect(_loc2_.frame);
         }
      }
      
      public function setXml(param1:XMLList) : void
      {
         var _loc2_:Object = null;
         this.actions.removeAll();
         XMLUtils.optimizes(param1);
         this._xml = param1.parent();
         for(_loc2_ in param1)
         {
            this.actions.addItem({
               "name":param1[_loc2_].@name,
               "data":new FrameGroup(param1[_loc2_],int(this.xml.@fps))
            });
         }
      }
      
      protected function onDropChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:FrameGroup = this.drop.selectedItem.data as FrameGroup;
         if(_loc2_)
         {
            this.onGroupSelect(_loc2_);
            this.setFrameGroup(_loc2_);
         }
      }
      
      public function setFrameGroup(param1:FrameGroup) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Frame = null;
         var _loc5_:FrameSprite = null;
         if(!this.frameSprites)
         {
            this.frameSprites = new Vector.<FrameSprite>();
         }
         this.currentFrameGroup = param1;
         this.fpsNumber.value = this.currentFrameGroup.fps;
         this._fps.fps = this.currentFrameGroup.fps;
         for(_loc2_ in this.frameSprites)
         {
            this.frameSprites[_loc2_].visible = false;
         }
         for(_loc3_ in this.currentFrameGroup.frames)
         {
            _loc4_ = this.currentFrameGroup.frames[_loc3_];
            _loc5_ = null;
            if(this.frameSprites.length > _loc3_)
            {
               _loc5_ = this.frameSprites[_loc3_];
            }
            if(!_loc5_)
            {
               _loc5_ = new FrameSprite();
               _loc5_.id = int(_loc3_);
               this.frameDarw.addChild(_loc5_);
               _loc5_.x = 8 * int(_loc3_);
               this.frameSprites.push(_loc5_);
            }
            else
            {
               this.frameSprites[_loc3_].visible = true;
            }
            this.frameSprites[_loc3_].frame = _loc4_;
         }
         this.select(this.frameIndex);
         this.updateMessage();
      }
      
      public function updateMessage() : void
      {
         var _loc5_:Object = null;
         var _loc6_:Frame = null;
         var _loc7_:int = 0;
         if(!this.currentFrameGroup)
         {
            return;
         }
         var _loc1_:Number = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         for(_loc5_ in this.currentFrameGroup.frames)
         {
            _loc6_ = this.currentFrameGroup.frames[_loc5_];
            _loc1_ += _loc6_.golden;
            if(_loc6_.hitPoint.length > 0)
            {
               _loc7_ = _loc6_.hitEffect / (_loc6_.hitInterval == 0 ? _loc6_.hitEffect : _loc6_.hitInterval);
               _loc3_ += _loc6_.mFight * _loc7_;
               if(_loc6_.mFight == 0 && _loc6_.wFight == 0)
               {
                  _loc2_ += 100 * _loc7_;
               }
               else
               {
                  _loc2_ += _loc6_.wFight * _loc7_;
               }
               if(_loc4_ < _loc6_.straight)
               {
                  _loc4_ = _loc6_.straight;
               }
               if(_loc4_ == 0)
               {
                  _loc4_ = 30;
               }
            }
            _loc2_ += _loc6_.wEffFight;
            _loc3_ += _loc6_.mEffFight;
         }
         this.message.text = "物理伤害：" + _loc2_ + "% 魔法伤害：" + _loc3_ + "% 总霸体：" + _loc1_ + " 最大硬直：" + _loc4_ + " 压缩纹理：" + (this.currentFrameGroup.getGPUMenemy() / 1024 / 1024 * 0.5).toFixed(2) + "MB";
      }
      
      public function updateGPU() : void
      {
         var _loc1_:Number = this.observe.pool.getGPUUseMenemy();
         var _loc2_:Number = Number((_loc1_ + this.getActionGPUMenemy()) / 1024 / 1024);
         var _loc3_:Number = Number((_loc1_ + this.getActionGPUMenemy(3)) / 1024 / 1024);
         this.gpu.text = "GPU  ROLE=" + (_loc1_ / 1024 / 1024).toFixed(2) + "MB  BGRA=" + _loc2_.toFixed(2) + "MB  PACKED=" + (_loc2_ * 0.5).toFixed(2) + "MB  BGR=" + (_loc3_ * 0.5).toFixed(2) + "MB";
      }
      
      public function getActionGPUMenemy(param1:int = 4) : int
      {
         var _loc5_:FrameGroup = null;
         var _loc6_:int = 0;
         var _loc7_:Vector.<EffectStageObject> = null;
         var _loc8_:Object = null;
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < this.actions.length)
         {
            _loc5_ = this.actions.getItemAt(_loc4_).data as FrameGroup;
            _loc6_ = 0;
            while(_loc6_ < _loc5_.frames.length)
            {
               _loc7_ = _loc5_.frames[_loc6_].effectObjects;
               for(_loc8_ in _loc7_)
               {
                  if(_loc3_.indexOf(_loc7_[_loc8_].data.name) == -1)
                  {
                     _loc3_.push(_loc7_[_loc8_].data.name);
                     _loc2_ += mathGPU(_loc7_[_loc8_].bitmapData,param1);
                  }
               }
               _loc6_++;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function select(param1:Object) : void
      {
         var _loc2_:Object = null;
         if(!this.currentFrameGroup || this.currentFrameGroup.frames.length == 0)
         {
            return;
         }
         if(!(param1 is FrameSprite))
         {
            if(param1 < 0 || param1 >= this.currentFrameGroup.frames.length)
            {
               param1 = 0;
            }
            param1 = this.frameSprites[param1];
         }
         for(_loc2_ in this.frameSprites)
         {
            if(this.frameSprites[_loc2_] == param1)
            {
               this.frameIndex = int(_loc2_);
               this.frameSprites[_loc2_].select(true);
               this.currentFrame = this.frameSprites[_loc2_].frame;
               this.updateFrame();
               if(this.onSelect != null)
               {
                  this.onSelect(this.currentFrame);
               }
            }
            else
            {
               this.frameSprites[_loc2_].select(false);
            }
         }
         this.cframe.text = "当前帧：" + this.frameIndex;
      }
      
      public function updateFrame() : void
      {
         this.xText.text = String(this.currentFrame.gox);
         this.yText.text = String(this.currentFrame.goy);
      }
      
      public function onFrame() : void
      {
         if(this._isPlay && this._fps.update())
         {
            ++this.frameIndex;
            this.select(this.frameIndex);
            if(this.frameIndex == 0 && this._isPlay)
            {
               this.onPlayOrStop(null);
            }
         }
         this.updateGPU();
      }
      
      public function get timescale() : Number
      {
         return this._fps.currentTimeScale;
      }
      
      protected function onPlayOrStop(param1:MouseEvent) : void
      {
         this.play.visible = !this.play.visible;
         this.stop.visible = !this.stop.visible;
         this._isPlay = !this.play.visible;
      }
      
      protected function onRemoveAction(param1:MouseEvent) : void
      {
         var _loc3_:Object = null;
         var _loc2_:int = this.drop.selectedIndex;
         if(_loc2_ != -1)
         {
            _loc3_ = this.actions.getItemAt(this.drop.selectedIndex);
            (_loc3_.data as FrameGroup).removeAction();
            this.actions.removeItemAt(this.drop.selectedIndex);
            this.drop.selectedIndex = _loc2_ - 1;
            this.onChange();
         }
      }
      
      protected function onFpsChange(param1:Event) : void
      {
         if(this.currentFrameGroup)
         {
            this.currentFrameGroup.fps = this.fpsNumber.value;
            this._fps.fps = this.currentFrameGroup.fps;
            this.onChange();
         }
      }
      
      public function addFrameName(param1:String) : void
      {
         var _loc2_:XML = null;
         if(this.currentFrameGroup)
         {
            _loc2_ = new XML("<SubTexture name=\'" + param1 + "\'/>");
            this.currentFrameGroup.add(new Frame(_loc2_),this.frameIndex + 1);
            ++this.frameIndex;
            this.setFrameGroup(this.currentFrameGroup);
            this.onChange();
         }
      }
      
      protected function onGoYXChange(param1:TextOperationEvent) : void
      {
         if(this.currentFrame)
         {
            this.currentFrame.gox = int(this.xText.text);
            this.currentFrame.goy = int(this.yText.text);
            this.currentFrame.isGoPoint = true;
            this.currentFrameGroup.math();
            this.onChange();
         }
      }
      
      public function onUpdateSave(param1:XMLList) : void
      {
         var _loc5_:FrameGroup = null;
         var _loc2_:XMLList = param1.children();
         var _loc3_:int = _loc2_.length() - 1;
         while(_loc3_ >= 0)
         {
            delete _loc2_[_loc3_];
            _loc3_--;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.actions.length)
         {
            _loc5_ = this.actions.getItemAt(_loc4_).data as FrameGroup;
            _loc5_.updateFrames(param1);
            _loc4_++;
         }
         this.updateMessage();
      }
      
      protected function onAddAction(param1:MouseEvent) : void
      {
         var _loc2_:ActionView = new ActionView();
         _loc2_.callFunc = this.onActionCreate;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      protected function onActionCreate(param1:ActionView) : void
      {
         var _loc2_:XML = <act/>;
         _loc2_.@name = param1.actionName.text;
         _loc2_.@key = param1.key.text;
         _loc2_.@type = param1.skilltype.selectedItem.type;
         _loc2_.@cd = param1.cd.text;
         _loc2_.@other = JSON.stringify(param1.attrArray);
         this._xml.appendChild(_loc2_);
         this.actions.addItem({
            "name":_loc2_.@name,
            "data":new FrameGroup(_loc2_,int(this.xml.@fps))
         });
         PopUpManager.removePopUp(param1);
      }
      
      protected function onRunGame(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(App.projectFile.resolvePath("runtime").exists)
         {
            _loc2_ = this.observe.file.name;
            _loc2_ = _loc2_.replace(".data","");
            SwfApplicationWindow.run(null,_loc2_,800,550);
         }
         else
         {
            Alert.show("不存在运行环境","运行失败");
         }
      }
      
      protected function onRoleConfig(param1:MouseEvent) : void
      {
         var _loc2_:RoleConfigView = new RoleConfigView();
         _loc2_.xml = this.xml;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      protected function onEidtAction(param1:MouseEvent) : void
      {
         var _loc2_:ActionView = new ActionView();
         _loc2_.editxml = this.currentFrameGroup.data;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      public function nextFrame() : void
      {
         var _loc1_:int = this.currentFrame.at + 1;
         if(_loc1_ > this.frameSprites.length - 1)
         {
            _loc1_ = int(this.frameSprites.length - 1);
         }
         this.select(this.frameSprites[_loc1_]);
      }
      
      public function lastFrame() : void
      {
         var _loc1_:int = this.currentFrame.at - 1;
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         this.select(this.frameSprites[_loc1_]);
      }
      
      public function dropString(param1:Object) : String
      {
         var _loc2_:String = null;
         if(param1.data.data.@key != undefined)
         {
            _loc2_ = param1.data.data.@key;
            return param1.name + " (" + _loc2_ + ")";
         }
         return param1.name;
      }
      
      protected function onConfig(param1:MouseEvent) : void
      {
         PopUpManager.addPopUp(new RuntimeConfig(),this,true);
      }
      
      protected function onRoleChange(param1:IndexChangeEvent) : void
      {
         this.observe.onCreateDragon(this.observe.pool.drgonData.buildArmature(this.actionDrop.selectedItem.name as String).display as FlashArmatureDisplay);
      }
      
      protected function onStartGame(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(App.projectFile.resolvePath("runtime").exists)
         {
            _loc2_ = this.observe.file.name;
            _loc2_ = _loc2_.replace(".data","");
            SwfApplicationWindow.run(null,null,800,550);
         }
         else
         {
            Alert.show("不存在运行环境","运行失败");
         }
      }
      
      private function _TimeLine_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"actions");
         this.actions = _loc1_;
         BindingManager.executeBindings(this,"actions",this.actions);
         return _loc1_;
      }
      
      private function _TimeLine_ArrayCollection2_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"roles");
         this.roles = _loc1_;
         BindingManager.executeBindings(this,"roles",this.roles);
         return _loc1_;
      }
      
      private function _TimeLine_XML1_i() : XML
      {
         var _loc1_:XML = null;
         this.xml = _loc1_;
         BindingManager.executeBindings(this,"xml",this.xml);
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.height = 32;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array2_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array2_c() : Array
      {
         return [this._TimeLine_HGroup1_c()];
      }
      
      private function _TimeLine_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.horizontalAlign = "left";
         _loc1_.verticalAlign = "middle";
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TimeLine_Button1_c(),this._TimeLine_Button2_c(),this._TimeLine_Button3_c(),this._TimeLine_Button4_c(),this._TimeLine_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "启动";
         _loc1_.addEventListener("click",this.___TimeLine_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button1_click(param1:MouseEvent) : void
      {
         this.onStartGame(param1);
      }
      
      private function _TimeLine_Button2_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "运行";
         _loc1_.addEventListener("click",this.___TimeLine_Button2_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button2_click(param1:MouseEvent) : void
      {
         this.onRunGame(param1);
      }
      
      private function _TimeLine_Button3_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "运行配置";
         _loc1_.addEventListener("click",this.___TimeLine_Button3_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button3_click(param1:MouseEvent) : void
      {
         this.onConfig(param1);
      }
      
      private function _TimeLine_Button4_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "人物属性";
         _loc1_.addEventListener("click",this.___TimeLine_Button4_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button4_click(param1:MouseEvent) : void
      {
         this.onRoleConfig(param1);
      }
      
      private function _TimeLine_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "显存已使用：75MB";
         _loc1_.id = "gpu";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.gpu = _loc1_;
         BindingManager.executeBindings(this,"gpu",this.gpu);
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer2_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.top = 32;
         _loc1_.height = 32;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array4_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array4_c() : Array
      {
         return [this._TimeLine_HGroup2_c(),this._TimeLine_HGroup3_c()];
      }
      
      private function _TimeLine_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.horizontalAlign = "right";
         _loc1_.verticalAlign = "middle";
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TimeLine_Label2_c(),this._TimeLine_DropDownList1_i(),this._TimeLine_Label3_c(),this._TimeLine_DropDownList2_i(),this._TimeLine_Button5_c(),this._TimeLine_Button6_c(),this._TimeLine_Button7_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "人物组：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.width = 124;
         _loc1_.selectedIndex = 0;
         _loc1_.labelField = "name";
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.addEventListener("change",this.__actionDrop_change);
         _loc1_.id = "actionDrop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.actionDrop = _loc1_;
         BindingManager.executeBindings(this,"actionDrop",this.actionDrop);
         return _loc1_;
      }
      
      public function __actionDrop_change(param1:IndexChangeEvent) : void
      {
         this.onRoleChange(param1);
      }
      
      private function _TimeLine_Label3_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "动作组：";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_DropDownList2_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.width = 124;
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.setStyle("selectionColor",9210772);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.addEventListener("change",this.__drop_change);
         _loc1_.id = "drop";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drop = _loc1_;
         BindingManager.executeBindings(this,"drop",this.drop);
         return _loc1_;
      }
      
      public function __drop_change(param1:IndexChangeEvent) : void
      {
         this.onDropChange(param1);
      }
      
      private function _TimeLine_Button5_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","tmxtools/pencil.png");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___TimeLine_Button5_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button5_click(param1:MouseEvent) : void
      {
         this.onEidtAction(param1);
      }
      
      private function _TimeLine_Button6_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","storetools/add.png");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___TimeLine_Button6_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button6_click(param1:MouseEvent) : void
      {
         this.onAddAction(param1);
      }
      
      private function _TimeLine_Button7_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("icon","storetools/remove.png");
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.addEventListener("click",this.___TimeLine_Button7_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___TimeLine_Button7_click(param1:MouseEvent) : void
      {
         this.onRemoveAction(param1);
      }
      
      private function _TimeLine_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.verticalAlign = "middle";
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TimeLine_Label4_c(),this._TimeLine_NumericStepper1_i(),this._TimeLine_Label5_c(),this._TimeLine_TextInput1_i(),this._TimeLine_Label6_c(),this._TimeLine_TextInput2_i(),this._TimeLine_Label7_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Label4_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "FPS:";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_NumericStepper1_i() : NumericStepper
      {
         var _loc1_:NumericStepper = new NumericStepper();
         _loc1_.maximum = 60;
         _loc1_.minimum = 1;
         _loc1_.value = 24;
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.addEventListener("change",this.__fpsNumber_change);
         _loc1_.id = "fpsNumber";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fpsNumber = _loc1_;
         BindingManager.executeBindings(this,"fpsNumber",this.fpsNumber);
         return _loc1_;
      }
      
      public function __fpsNumber_change(param1:Event) : void
      {
         this.onFpsChange(param1);
      }
      
      private function _TimeLine_Label5_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "X:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 50;
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.addEventListener("change",this.__xText_change);
         _loc1_.id = "xText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.xText = _loc1_;
         BindingManager.executeBindings(this,"xText",this.xText);
         return _loc1_;
      }
      
      public function __xText_change(param1:TextOperationEvent) : void
      {
         this.onGoYXChange(param1);
      }
      
      private function _TimeLine_Label6_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "Y:";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_TextInput2_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.width = 50;
         _loc1_.setStyle("contentBackgroundColor",3355443);
         _loc1_.addEventListener("change",this.__yText_change);
         _loc1_.id = "yText";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.yText = _loc1_;
         BindingManager.executeBindings(this,"yText",this.yText);
         return _loc1_;
      }
      
      public function __yText_change(param1:TextOperationEvent) : void
      {
         this.onGoYXChange(param1);
      }
      
      private function _TimeLine_Label7_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "当前帧：0";
         _loc1_.id = "cframe";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cframe = _loc1_;
         BindingManager.executeBindings(this,"cframe",this.cframe);
         return _loc1_;
      }
      
      private function _TimeLine_Scroller1_c() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.top = 64;
         _loc1_.bottom = 24;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.viewport = this._TimeLine_Group2_c();
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._TimeLine_VGroup1_c(),this._TimeLine_UIComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.gap = 0;
         _loc1_.percentHeight = 100;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._TimeLine_BorderContainer3_c(),this._TimeLine_BorderContainer5_c(),this._TimeLine_BorderContainer7_c(),this._TimeLine_BorderContainer9_c(),this._TimeLine_BorderContainer11_c(),this._TimeLine_BorderContainer13_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer3_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 32;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array9_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array9_c() : Array
      {
         return [this._TimeLine_BorderContainer4_c()];
      }
      
      private function _TimeLine_BorderContainer4_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array10_c);
         _loc1_.setStyle("backgroundAlpha",0.25);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array10_c() : Array
      {
         return [this._TimeLine_Label8_c()];
      }
      
      private function _TimeLine_Label8_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "时间轴";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer5_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array11_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array11_c() : Array
      {
         return [this._TimeLine_BorderContainer6_c()];
      }
      
      private function _TimeLine_BorderContainer6_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array12_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array12_c() : Array
      {
         return [this._TimeLine_Label9_c()];
      }
      
      private function _TimeLine_Label9_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "元素";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer7_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array13_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array13_c() : Array
      {
         return [this._TimeLine_BorderContainer8_c()];
      }
      
      private function _TimeLine_BorderContainer8_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array14_c);
         _loc1_.setStyle("backgroundAlpha",0.25);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array14_c() : Array
      {
         return [this._TimeLine_Label10_c()];
      }
      
      private function _TimeLine_Label10_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "停顿";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer9_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array15_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array15_c() : Array
      {
         return [this._TimeLine_BorderContainer10_c()];
      }
      
      private function _TimeLine_BorderContainer10_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array16_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array16_c() : Array
      {
         return [this._TimeLine_Label11_c()];
      }
      
      private function _TimeLine_Label11_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "音效";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer11_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array17_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array17_c() : Array
      {
         return [this._TimeLine_BorderContainer12_c()];
      }
      
      private function _TimeLine_BorderContainer12_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array18_c);
         _loc1_.setStyle("backgroundAlpha",0.25);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array18_c() : Array
      {
         return [this._TimeLine_Label12_c()];
      }
      
      private function _TimeLine_Label12_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "碰撞";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_BorderContainer13_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array19_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.8);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array19_c() : Array
      {
         return [this._TimeLine_BorderContainer14_c()];
      }
      
      private function _TimeLine_BorderContainer14_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.width = 70;
         _loc1_.height = 18;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array20_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array20_c() : Array
      {
         return [this._TimeLine_Label13_c()];
      }
      
      private function _TimeLine_Label13_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "位移";
         _loc1_.verticalCenter = 0;
         _loc1_.left = 5;
         _loc1_.horizontalCenter = 0;
         _loc1_.setStyle("fontSize",10);
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.left = 70;
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("mouseDown",this.__frameDarw_mouseDown);
         _loc1_.addEventListener("rightMouseDown",this.__frameDarw_rightMouseDown);
         _loc1_.id = "frameDarw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.frameDarw = _loc1_;
         BindingManager.executeBindings(this,"frameDarw",this.frameDarw);
         return _loc1_;
      }
      
      public function __frameDarw_mouseDown(param1:MouseEvent) : void
      {
         this.onDown(param1);
      }
      
      public function __frameDarw_rightMouseDown(param1:MouseEvent) : void
      {
         this.onDown(param1);
      }
      
      private function _TimeLine_BorderContainer15_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.bottom = 0;
         _loc1_.height = 24;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TimeLine_Array21_c);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("backgroundAlpha",0.5);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Array21_c() : Array
      {
         return [this._TimeLine_HGroup4_c()];
      }
      
      private function _TimeLine_HGroup4_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.top = 2;
         _loc1_.mxmlContent = [this._TimeLine_Group3_c(),this._TimeLine_Group4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 24;
         _loc1_.height = 24;
         _loc1_.mxmlContent = [this._TimeLine_Button8_i(),this._TimeLine_Button9_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Button8_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 20;
         _loc1_.height = 20;
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
      
      private function _TimeLine_Button9_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 20;
         _loc1_.height = 20;
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
      
      private function _TimeLine_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 24;
         _loc1_.height = 24;
         _loc1_.mxmlContent = [this._TimeLine_Label14_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TimeLine_Label14_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "详情：无";
         _loc1_.top = 5;
         _loc1_.setStyle("color",16776960);
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      public function ___TimeLine_Group1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      private function _TimeLine_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"actionDrop.dataProvider","roles");
         result[1] = new Binding(this,function():Function
         {
            return dropString;
         },null,"drop.labelFunction");
         result[2] = new Binding(this,null,null,"drop.dataProvider","actions");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get actionDrop() : DropDownList
      {
         return this._1851397701actionDrop;
      }
      
      public function set actionDrop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1851397701actionDrop;
         if(_loc2_ !== param1)
         {
            this._1851397701actionDrop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionDrop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actions() : ArrayCollection
      {
         return this._1161803523actions;
      }
      
      public function set actions(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1161803523actions;
         if(_loc2_ !== param1)
         {
            this._1161803523actions = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actions",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cframe() : Label
      {
         return this._1362989334cframe;
      }
      
      public function set cframe(param1:Label) : void
      {
         var _loc2_:Object = this._1362989334cframe;
         if(_loc2_ !== param1)
         {
            this._1362989334cframe = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cframe",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drop() : DropDownList
      {
         return this._3092207drop;
      }
      
      public function set drop(param1:DropDownList) : void
      {
         var _loc2_:Object = this._3092207drop;
         if(_loc2_ !== param1)
         {
            this._3092207drop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fpsNumber() : NumericStepper
      {
         return this._722321006fpsNumber;
      }
      
      public function set fpsNumber(param1:NumericStepper) : void
      {
         var _loc2_:Object = this._722321006fpsNumber;
         if(_loc2_ !== param1)
         {
            this._722321006fpsNumber = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fpsNumber",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameDarw() : UIComponent
      {
         return this._544640655frameDarw;
      }
      
      public function set frameDarw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._544640655frameDarw;
         if(_loc2_ !== param1)
         {
            this._544640655frameDarw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameDarw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gpu() : Label
      {
         return this._102572gpu;
      }
      
      public function set gpu(param1:Label) : void
      {
         var _loc2_:Object = this._102572gpu;
         if(_loc2_ !== param1)
         {
            this._102572gpu = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gpu",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : Label
      {
         return this._954925063message;
      }
      
      public function set message(param1:Label) : void
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
      public function get onChange() : Function
      {
         return this._1036773999onChange;
      }
      
      public function set onChange(param1:Function) : void
      {
         var _loc2_:Object = this._1036773999onChange;
         if(_loc2_ !== param1)
         {
            this._1036773999onChange = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onChange",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onGroupSelect() : Function
      {
         return this._1224377596onGroupSelect;
      }
      
      public function set onGroupSelect(param1:Function) : void
      {
         var _loc2_:Object = this._1224377596onGroupSelect;
         if(_loc2_ !== param1)
         {
            this._1224377596onGroupSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onGroupSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onMouseSelect() : Function
      {
         return this._1299060386onMouseSelect;
      }
      
      public function set onMouseSelect(param1:Function) : void
      {
         var _loc2_:Object = this._1299060386onMouseSelect;
         if(_loc2_ !== param1)
         {
            this._1299060386onMouseSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onMouseSelect",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get onSelect() : Function
      {
         return this._1492388795onSelect;
      }
      
      public function set onSelect(param1:Function) : void
      {
         var _loc2_:Object = this._1492388795onSelect;
         if(_loc2_ !== param1)
         {
            this._1492388795onSelect = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onSelect",_loc2_,param1));
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
      public function get roles() : ArrayCollection
      {
         return this._108695229roles;
      }
      
      public function set roles(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._108695229roles;
         if(_loc2_ !== param1)
         {
            this._108695229roles = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roles",_loc2_,param1));
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
      public function get xText() : TextInput
      {
         return this._113425861xText;
      }
      
      public function set xText(param1:TextInput) : void
      {
         var _loc2_:Object = this._113425861xText;
         if(_loc2_ !== param1)
         {
            this._113425861xText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xText",_loc2_,param1));
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
      
      [Bindable(event="propertyChange")]
      public function get yText() : TextInput
      {
         return this._114349382yText;
      }
      
      public function set yText(param1:TextInput) : void
      {
         var _loc2_:Object = this._114349382yText;
         if(_loc2_ !== param1)
         {
            this._114349382yText = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"yText",_loc2_,param1));
            }
         }
      }
   }
}

