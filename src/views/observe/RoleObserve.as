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
         this._effectStageObject = null;
         this.stopDrag();
      }
      
      override public function onChange() : void
      {
         super.onChange();
         this.timeline.setFrameGroup(this.timeline.currentFrameGroup);
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
   }
}

