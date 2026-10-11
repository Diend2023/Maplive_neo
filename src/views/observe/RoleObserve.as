package views.observe
{
   import dragonBones.flash.FlashArmatureDisplay;
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
   import mx.containers.HDividedBox;
   import mx.containers.VDividedBox;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal; //
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.styles.*;
   import spark.components.BorderContainer;
   import spark.components.Group;
   import utils.FileUtils;
   import views.RefObserve;
   import views.attribute.FrameAttribute;
   import views.attribute.SkillAttribute;
   import views.observe.map.SwfApplicationWindow;
   import views.observe.role.Attribute;
   import views.observe.role.DragonRole;
   import views.observe.role.EffectStageObject;
   import views.observe.role.Pool;
   import views.observe.role.RoleStage;
   import views.observe.role.RoleStageObject;
   import views.observe.role.TimeLine;
   import views.observe.role.frame.Frame;
   import views.observe.role.frame.FrameGroup;
   
   public class RoleObserve extends RefObserve
   {

      use namespace mx_internal; //
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      private var _3446812pool:Pool;
      
      private var _1798299709poolGroup:BorderContainer;
      
      private var _906915526roleAttribute:Attribute;
      
      private var _324938792roleStage:RoleStage;
      
      private var _2076650431timeline:TimeLine;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _effectStageObject:EffectStageObject;
      
      private var _data:XML;
      
      private var _movePoint:Point = new Point();

      public static var roleCount:int = 0; // 打开的角本数（用于关闭所有角色后清除特效缓存）

      private var _isClosed:Boolean = false; // 防止discarded重复执行

      private var _lastEffect:EffectStageObject; // 最后选中的特效（面板刷新用，不随 onStageUp 清空）

      private var _editFrame:Frame; // 本次改动针对的帧：属性面板绑定的那一帧 / 特效所属帧
      
      public function RoleObserve()
      {
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._RoleObserve_Array1_c);
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
         };
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      override public function readFile(param1:File) : void
      {
         RoleObserve.roleCount++;   // 打开角色计数+1
         var observe:RoleObserve = null;
         var pfile:File = param1;
         observe = this;
         callLater(function():void
         {
            var xmlList:XMLList = null;
            var list:XMLList = null;
            try
            {
               _data = new XML(FileUtils.readString(pfile));
               timeline.xml = _data;
               xmlList = _data.content.child("xml");
               if(_data.@type == "dragonbone")
               {
                  poolGroup.width = 0;
                  pool.enabled = false;
                  pool.parsingDrgonBone(pfile,_data);
               }
               else
               {
                  pool.parsing(pfile.parent.parent.resolvePath(xmlList[0].@path));
                  timeline.setXml(_data.action.child("act") as XMLList);
                  list = _data.action;
               }
               timeline.onSelect = onFrameSelect;
               timeline.onChange = onChange;
               timeline.onGroupSelect = onGroupSelect;
               timeline.onMouseSelect = onMouseSelect;
               timeline.observe = observe;
               roleStage.pool = pool;
               roleStage.onChange = onChange;
               roleStage.onToolsChange = onStageToolsChange;
               pool.onSelectFrame = onSelectFrame;
               pool.onCreateDragon = onCreateDragon;
               pool.onDragonLoaded = onDragonLoaded;
               callLater(function():void
               {
                  var _loc1_:RoleStageObject = null;
                  if(_data.@type == "dragonbone")
                  {
                     _loc1_ = new DragonRole();
                     roleStage.node.addChild(_loc1_);
                  }
                  else
                  {
                     _loc1_ = new RoleStageObject();
                     roleStage.node.addChild(_loc1_);
                  }
                  roleStage.role = _loc1_;
                  timeline.updateGPU();
                  markInitialState(); //
               });
            }
            catch(e:Error)
            {
               Alert.show("资源格式有误\n" + e.errorID + ":" + e.message,"打开异常");
            }
         });
         this.addEventListener(OpenEvent.CHANGE,this.onChangeEvent);
         this.file = pfile;
      }
      
      private function onChangeEvent(param1:Event) : void
      {
         this.onChange();
      }
      
      private function onDragonLoaded() : void
      {
         var _loc2_:Object = null;
         this.pool.parsingAction(this._data);
         var _loc1_:Array = this.pool.drgonSkeData.armature;
         for(_loc2_ in _loc1_)
         {
            this.timeline.roles.addItem({"name":_loc1_[_loc2_].name});
         }
      }
      
      public function onCreateDragon(param1:FlashArmatureDisplay) : void
      {
         (this.roleStage.role as DragonRole).pushDisplay(param1);
         this.timeline.setXml(this._data[param1.armature.name].action.child("act") as XMLList);
      }
      
      public function onStageToolsChange() : void
      {
         this.roleAttribute.stack.selectedIndex = this.roleStage.tools.selectedIndex;
         this.onFrameSelect(this.timeline.currentFrame);
      }
      
      private function onMouseSelect(param1:Frame) : void
      {
         var frame:Frame = param1;
         this._editFrame = frame; // 面板即将绑定到这一帧，后续帧属性编辑就针对它
         this.roleAttribute.stack.selectedIndex = 1;
         this.roleAttribute.enabled = true;
         callLater(function():void
         {
            (roleAttribute.stack.selectedChild as FrameAttribute).setFrame(frame);
         });
      }
      
      public function onSelectFrame(param1:String) : void
      {
         this.timeline.addFrameName(param1);
      }
      
      public function onGroupSelect(param1:FrameGroup) : void
      {
         this.roleStage.setGroup(param1);
      }
      
      public function onFrameSelect(param1:Frame) : void
      {
         if(param1) this._editFrame = param1; //
         this.roleStage.draw(param1,0);
         if(this.roleStage.tools.selectedIndex == 1 && Boolean(param1))
         {
            this.roleAttribute.enabled = true;
         }
      }
      
      override public function onFrame() : void
      {
         if(this.timeline && this.roleStage.role && (!SwfApplicationWindow.window || !SwfApplicationWindow.window.visible))
         {
            this.timeline.onFrame();
            this.roleStage.draw(null,this.timeline.timescale);
         }
      }
      
      override public function onSave() : void
      {
         super.onSave();
         this.timeline.onUpdateSave(this._data.loads);
         Frame.parsingEffectSprite(this._data.loads,this._data.@hitEffectName);
         FileUtils.writeString(file,this._data);
      }
      
      protected function onStageDown(param1:MouseEvent) : void
      {
         var effect:EffectStageObject = null;
         var event:MouseEvent = param1;
         if(this.roleStage.tools.selectedIndex == 1)
         {
            return;
         }
         this.roleAttribute.enabled = true;
         this.roleStage.cannelSelect();
         if(event.target is EffectStageObject)
         {
            effect = event.target as EffectStageObject;
            effect.select(true);
            this.roleAttribute.stack.selectedIndex = 0;
            this._effectStageObject = effect;
            this._lastEffect = effect; // 记录
            this._editFrame = effect.frame; // 特效参数的目标帧
            this._movePoint.x = this.mouseX;
            this._movePoint.y = this.mouseY;
            this._effectStageObject.startDrag();
            callLater(function():void
            {
               var _loc1_:SkillAttribute = roleAttribute.stack.selectedChild as SkillAttribute;
               if(_loc1_)
               {
                  _loc1_.setEffectData(effect.data);
               }
            });
         }
         else if(this.roleStage.tools.selectedIndex == 0)
         {
            this.roleAttribute.enabled = false;
         }
      }
      
      protected function onStageMove(param1:MouseEvent) : void
      {
         if(this.roleStage.tools.selectedIndex == 1)
         {
            return;
         }
         var _loc2_:SkillAttribute = this.roleAttribute.stack.selectedChild as SkillAttribute;
         if(Boolean(_loc2_) && Boolean(this._effectStageObject))
         {
            this._effectStageObject.data.x += this.mouseX - this._movePoint.x;
            this._effectStageObject.data.y += this.mouseY - this._movePoint.y;
            this._movePoint.x = this.mouseX;
            this._movePoint.y = this.mouseY;
            _loc2_.xLabel.text = this._effectStageObject.datax.toString();
            _loc2_.yLabel.text = this._effectStageObject.datay.toString();
         }
      }
      
      protected function onStageUp(param1:MouseEvent) : void
      {
         if(this.roleStage.tools.selectedIndex == 1)
         {
            return;
         }
         if(this._effectStageObject) // 只有确实拖过特效才标脏
         { //
            this.onChange(); // 拖动结束，标记修改（同时触发撤销快照）
         } //
         this._effectStageObject = null;
         this.stopDrag();
      }
      
      override public function onChange() : void
      {
         super.onChange();
         this.timeline.setFrameGroup(this.timeline.currentFrameGroup);
         this.pushUndoSnapshot(); //
      }
      
      override public function onKeyDown(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case 188:
               this.timeline.lastFrame();
               break;
            case 190:
               this.timeline.nextFrame();
         }
      }
      
      override public function discarded() : void
      {
         if(this._isClosed) return;   // 防止重复清理
         this._isClosed = true; // 
         super.discarded();
         this.pool.clear();
         this.roleStage.clear();
         RoleObserve.roleCount--;   // 关闭角色计数-1
         if(RoleObserve.roleCount <= 0)   // 所有角色已关闭，清除特效缓存
         { // 
            RoleObserve.roleCount = 0; // 
            EffectStageObject.clearCache(); // 
         } // 
      }
      
      private function _RoleObserve_Array1_c() : Array
      {
         return [this._RoleObserve_HDividedBox1_c()];
      }
      
      private function _RoleObserve_HDividedBox1_c() : HDividedBox
      {
         var temp:HDividedBox = new HDividedBox();
         temp.left = 0;
         temp.right = 0;
         temp.top = 0;
         temp.bottom = 0;
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
                  "id":"poolGroup",
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.5;
                     this.borderVisible = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":20,
                        "percentHeight":100,
                        "minWidth":64,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_RoleObserve_Array2_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":BorderContainer,
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.5;
                     this.borderVisible = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":80,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_RoleObserve_Array3_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _RoleObserve_Array2_c() : Array
      {
         return [this._RoleObserve_Pool1_i()];
      }
      
      private function _RoleObserve_Pool1_i() : Pool
      {
         var _loc1_:Pool = new Pool();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "pool";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.pool = _loc1_;
         BindingManager.executeBindings(this,"pool",this.pool);
         return _loc1_;
      }
      
      private function _RoleObserve_Array3_c() : Array
      {
         return [this._RoleObserve_VDividedBox1_c()];
      }
      
      private function _RoleObserve_VDividedBox1_c() : VDividedBox
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
                  "type":BorderContainer,
                  "stylesFactory":function():void
                  {
                     this.backgroundAlpha = 0.5;
                     this.borderVisible = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":210,
                        "maxHeight":178,
                        "minHeight":82,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_RoleObserve_Array4_c)
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Group,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":80,
                        "mxmlContent":[_RoleObserve_BorderContainer4_c(),_RoleObserve_BorderContainer5_c()]
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _RoleObserve_Array4_c() : Array
      {
         return [this._RoleObserve_TimeLine1_i()];
      }
      
      private function _RoleObserve_TimeLine1_i() : TimeLine
      {
         var _loc1_:TimeLine = new TimeLine();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "timeline";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.timeline = _loc1_;
         BindingManager.executeBindings(this,"timeline",this.timeline);
         return _loc1_;
      }
      
      private function _RoleObserve_BorderContainer4_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.left = 0;
         _loc1_.right = 232;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._RoleObserve_Array6_c);
         _loc1_.setStyle("backgroundAlpha",0.5);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleObserve_Array6_c() : Array
      {
         return [this._RoleObserve_RoleStage1_i()];
      }
      
      private function _RoleObserve_RoleStage1_i() : RoleStage
      {
         var _loc1_:RoleStage = new RoleStage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.percentHeight = 100;
         _loc1_.addEventListener("mouseDown",this.__roleStage_mouseDown);
         _loc1_.addEventListener("mouseMove",this.__roleStage_mouseMove);
         _loc1_.addEventListener("mouseUp",this.__roleStage_mouseUp);
         _loc1_.id = "roleStage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.roleStage = _loc1_;
         BindingManager.executeBindings(this,"roleStage",this.roleStage);
         return _loc1_;
      }
      
      public function __roleStage_mouseDown(param1:MouseEvent) : void
      {
         this.onStageDown(param1);
      }
      
      public function __roleStage_mouseMove(param1:MouseEvent) : void
      {
         this.onStageMove(param1);
      }
      
      public function __roleStage_mouseUp(param1:MouseEvent) : void
      {
         this.onStageUp(param1);
      }
      
      private function _RoleObserve_BorderContainer5_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.right = 0;
         _loc1_.width = 232;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._RoleObserve_Array7_c);
         _loc1_.setStyle("backgroundAlpha",0.25);
         _loc1_.setStyle("borderVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleObserve_Array7_c() : Array
      {
         return [this._RoleObserve_Attribute1_i()];
      }
      
      private function _RoleObserve_Attribute1_i() : Attribute
      {
         var _loc1_:Attribute = new Attribute();
         _loc1_.enabled = false;
         _loc1_.x = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.id = "roleAttribute";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.roleAttribute = _loc1_;
         BindingManager.executeBindings(this,"roleAttribute",this.roleAttribute);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get pool() : Pool
      {
         return this._3446812pool;
      }
      
      public function set pool(param1:Pool) : void
      {
         var _loc2_:Object = this._3446812pool;
         if(_loc2_ !== param1)
         {
            this._3446812pool = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"pool",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get poolGroup() : BorderContainer
      {
         return this._1798299709poolGroup;
      }
      
      public function set poolGroup(param1:BorderContainer) : void
      {
         var _loc2_:Object = this._1798299709poolGroup;
         if(_loc2_ !== param1)
         {
            this._1798299709poolGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"poolGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get roleAttribute() : Attribute
      {
         return this._906915526roleAttribute;
      }
      
      public function set roleAttribute(param1:Attribute) : void
      {
         var _loc2_:Object = this._906915526roleAttribute;
         if(_loc2_ !== param1)
         {
            this._906915526roleAttribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roleAttribute",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get roleStage() : RoleStage
      {
         return this._324938792roleStage;
      }
      
      public function set roleStage(param1:RoleStage) : void
      {
         var _loc2_:Object = this._324938792roleStage;
         if(_loc2_ !== param1)
         {
            this._324938792roleStage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roleStage",_loc2_,param1));
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

      protected override function captureState() : String //
      {
         if(!this._data || this._data.@type == "dragonbone" || !this.timeline) return null; // 首版跳过龙骨角色
         this.timeline.onUpdateSave(this._data.loads); // 先同步原数据（与 onSave 同路径），再拷贝
         var snap:XML = this._data.copy(); // 后拷贝
         var o:Object = {}; //
         o.xml = snap.toXMLString(); //
         var tf:Frame = this._editFrame || this.timeline.currentFrame; // 目标帧优先，别用“浏览位置”
         if(this.roleAttribute && this.roleAttribute.stack.selectedChild is SkillAttribute && this._lastEffect && this._lastEffect.frame) //
         { //
            tf = this._lastEffect.frame; // 特效页：参数写进“特效所属帧”，舞台选特效不会移动时间轴
         } //
         o.f = tf ? tf.at : -1; // Frame.at = 该帧在组内的下标（FrameGroup.as:39 赋值）
         o.an = tf ? this._actionNameOf(tf.group) : null; // 反查目标帧所属动作组名
         o.a = this._idxOfAction(o.an); // 保底下标与 o.an 同源
         o.ei = -1; // 选中的特效在该帧 effectObjects 里的下标
         o.en = null; // 特效名：特效增删后下标会错位，用名字校正
         o.pg = this.roleAttribute ? int(this.roleAttribute.stack.selectedIndex) : -1; // 记录编辑时的属性页：0=特效，1=帧
         var sel:EffectStageObject = this._effectStageObject || this._lastEffect; //
         if(sel && sel.frame) //
         { //
            o.ei = sel.frame.effectObjects.indexOf(sel); // Frame.effectObjects 是 public（Frame.as:26）
            o.en = sel.data.name; //
         } //
         return JSON.stringify(o); //
      }

      protected override function restoreState(param1:String) : void //
      { //
         var o:Object = JSON.parse(param1); //
         var v:Object = o; // 视图目标：默认用快照自身的位置
         if(this._viewState) // 撤销时改用“被撤销掉的那一步”的位置——内容就在那儿
         { //
            var vo:Object = JSON.parse(this._viewState); //
            if(vo && (vo.an != null || vo.a != null)) v = vo; //
         } //
         this._data = new XML(o.xml); //
         this.timeline.xml = this._data; // fps 等绑定刷新
         this.timeline.setXml(this._data.action.child("act")); // 重建动作组
         if(this.timeline.actions.length > 0) //
         { //
            var a:int = this._idxOfAction(v.an); //
            if(a == -1 && v !== o) a = this._idxOfAction(o.an); // 那一步的动作已不存在（如撤销“新增动作”）→ 退回快照自身的动作
            if(a == -1 && v.an == null && o.an == null && this.timeline.currentFrameGroup != null) //
            { // 快照与当前状态都没记动作名：保持当前动作组，别滑到第 0 组（currentFrameGroup 是 public，TimeLine.as:113）
               for(var k:int = 0; k < this.timeline.actions.length; k++) //
               { //
                  if(this.timeline.actions.getItemAt(k).data == this.timeline.currentFrameGroup) { a = k; break; } //
               } //
            } //
            if(a == -1) a = Math.max(0, Math.min(int(v.a), this.timeline.actions.length - 1)); //
            var group:FrameGroup = this.timeline.actions.getItemAt(a).data as FrameGroup; //
            var src:Object = this.timeline.actions.getItemAt(a).name == v.an || v.an == null ? v : o; // v 没记动作名也算同源，别滑到 o
            var fi:int = src.f == null ? -1 : int(src.f); //
            if(fi < 0) fi = o.f == null ? -1 : int(o.f); // 注意 int(null)=0，必须显式判空
            if(fi < 0) fi = this.timeline.currentFrame ? this.timeline.currentFrame.at : -1; // 停在当前帧
            if(fi < 0) fi = 0; //
            if(fi >= group.frames.length) fi = group.frames.length - 1; // 只有越界才落末帧
            this.timeline.drop.selectedIndex = a; //
            this.timeline.onGroupSelect(group); // 先 setGroup：把重建后的特效实例挂上舞台
            this.timeline.setFrameGroup(group); // 重建帧条并选中
            this.timeline.select(fi); // 跳到目标帧
            this.roleStage.resetDraw(); // 解除“同帧短路”
            this.onFrameSelect(this.timeline.currentFrame); // 重绘角色，并给所有特效实例喂 atFrame
            var pg:int = v.pg == null ? (o.pg == null ? -1 : int(o.pg)) : int(v.pg); // 这次撤销掉的那一步在哪一页
            if(pg >= 0 && this.roleAttribute && this.roleAttribute.stack.selectedIndex != pg) //
            { // 跨页撤销：先切页再回填；ViewStack 子项是延迟创建的，必须 callLater（与 onMouseSelect:221 同套路）
               if(pg == 1) this.roleStage.cannelSelect(); // 回帧页：撤掉画布上遗留的特效选中框
               this.roleAttribute.stack.selectedIndex = pg; //
               callLater(function():void { refreshAttribute(v.ei,v.en); }); //
            } //
            else //
            { //
               this.refreshAttribute(v.ei,v.en); // 把恢复后的帧/特效重新灌回属性面板
            } //
         } //
      } //

      private function _idxOfAction(param1:String) : int //
      { //
         if(param1 == null) return -1; //
         for(var i:int = 0; i < this.timeline.actions.length; i++) //
         { //
            if(this.timeline.actions.getItemAt(i).name == param1) return i; //
         } //
         return -1; //
      } //

      private function clearEffectSelection() : void // 特效已不在新树上：断开引用，别让下一次 captureState 读到旧实例
      { //
         if(this.roleStage) this.roleStage.cannelSelect(); //
         this._effectStageObject = null; //
         this._lastEffect = null; //
      } //

      private function refreshAttribute(param1:Object, param2:Object) : void // 恢复后重放一次“选中填充”，否则输入框是旧值/旧数据对象
      { //
         if(!this.roleAttribute || !this.timeline || this.timeline.currentFrame == null) return; //
         var child:Object = this.roleAttribute.stack.selectedChild; //
         if(child is FrameAttribute) // 帧属性页
         { //
            this.roleAttribute.frameAttr.setFrame(this.timeline.currentFrame); // 内部 callLater 重填全部输入框
            return; //
         } //
         if(!(child is SkillAttribute)) return; // 特效/技能页
         var objs:Vector.<EffectStageObject> = this.timeline.currentFrame.effectObjects; //
         if(objs.length == 0) { this.clearEffectSelection(); return; } //
         var i:int = param1 == null ? -1 : int(param1); //
         var nm:String = param2 == null ? null : String(param2); //
         if(nm != null && i >= 0 && i < objs.length && objs[i].data.name != nm) // 下标对不上 → 按名字找
         { //
            for(var j:int = 0; j < objs.length; j++) //
            { //
               if(objs[j].data.name == nm) { i = j; break; } //
            } //
         } //
         if(i < 0 || i >= objs.length) { this.clearEffectSelection(); return; } // 该特效被撤销删掉了 → 断开旧实例引用，面板留空等重选
         (child as SkillAttribute).setEffectData(objs[i].data); // 绑到重建后的新数据对象
         this.roleStage.cannelSelect(); //
         objs[i].select(true); // 画布上恢复选中框
         this._lastEffect = objs[i]; // 换绑到重建后的新实例，否则下一次 captureState 读到的是旧树
      } //

      private function _actionNameOf(param1:FrameGroup) : String // 反查目标帧所属的动作组名
      { //
         if(param1) //
         { //
            for(var i:int = 0; i < this.timeline.actions.length; i++) //
            { //
               if(this.timeline.actions.getItemAt(i).data == param1) return this.timeline.actions.getItemAt(i).name; //
            } //
         } //
         return null; //
      } //

      protected override function snapshotKey(param1:String) : String //
      { //
         var o:Object = JSON.parse(param1); //
         return o && o.xml != null ? String(o.xml) : param1; // 只比数据，不比“当时停在哪一帧”
      } //

   }
}

