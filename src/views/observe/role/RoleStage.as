package views.observe.role
{
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
   import mx.containers.ViewStack;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconTabBarSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.NavigatorContent;
   import spark.components.Scroller;
   import spark.components.TabBar;
   import spark.events.IndexChangeEvent;
   import views.SelectElementView;
   import views.observe.role.frame.Frame;
   import views.observe.role.frame.FrameGroup;
   import views.observe.text.HitDarwSprite;
   
   use namespace mx_internal;
   
   public class RoleStage extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _136468215drawTools:NavigatorContent;
      
      private var _104086693mouse:NavigatorContent;
      
      private var _1036773999onChange:Function;
      
      private var _665107956onToolsChange:Function;
      
      private var _267061542roleDraw:UIComponent;
      
      private var _402164678scroller:Scroller;
      
      private var _109757064stack:ViewStack;
      
      private var _110545371tools:TabBar;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var role:RoleStageObject;
      
      public var node:Sprite;
      
      public var hitNode:Sprite;
      
      private var _pool:Pool;
      
      private var _effect:Vector.<EffectStageObject>;
      
      private var _hitSprite:HitDarwSprite;
      
      private var _currentFrame:Frame;
      
      private var _embed_mxml_tmxtools_pencil_png_1597401960:Class;
      
      private var _embed_mxml_tmxtools_select_png_1893312406:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function RoleStage()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml_tmxtools_pencil_png_1597401960 = RoleStage__embed_mxml_tmxtools_pencil_png_1597401960;
         this._embed_mxml_tmxtools_select_png_1893312406 = RoleStage__embed_mxml_tmxtools_select_png_1893312406;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._RoleStage_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_role_RoleStageWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return RoleStage[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 300;
         this.mxmlContent = [this._RoleStage_BorderContainer1_c(),this._RoleStage_Scroller1_i()];
         this.addEventListener("initialize",this.___RoleStage_Group1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         RoleStage._watcherSetupUtil = param1;
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
         var event:FlexEvent = param1;
         this._effect = new Vector.<EffectStageObject>();
         callLater(function():void
         {
            var _loc1_:Sprite = new Sprite();
            _loc1_.graphics.beginFill(16777215,0);
            _loc1_.graphics.drawRect(0,0,800 * 2,800 * 2);
            _loc1_.graphics.beginFill(3355443);
            _loc1_.graphics.drawRect(200 * 2,200 * 2,400 * 2,400 * 2);
            _loc1_.graphics.endFill();
            roleDraw.addChild(_loc1_);
            node = new Sprite();
            roleDraw.addChild(node);
            node.x = 400 * 2;
            node.y = 400 * 2;
            hitNode = new Sprite();
            roleDraw.addChild(hitNode);
            hitNode.x = node.x;
            hitNode.y = node.y;
            _hitSprite = new HitDarwSprite();
            hitNode.addChild(_hitSprite);
            scroller.viewport.horizontalScrollPosition = 1600 / 2 - 200;
            scroller.viewport.verticalScrollPosition = 1600 / 2 - 200;
         });
         this.addEventListener(RightClickEvent.CLICK,this.onRightClick);
      }
      
      private function onRightClick(param1:RightClickEvent) : void
      {
         switch(param1.clickTag)
         {
            case "删除":
               this.node.removeChild(param1.target as DisplayObject);
               this._effect.removeAt(this._effect.indexOf(param1.target as EffectStageObject));
               (param1.target as EffectStageObject).removeFrame();
         }
      }
      
      public function set pool(param1:Pool) : void
      {
         this._pool = param1;
      }
      
      public function draw(param1:Frame, param2:Number) : void
      {
         var _loc3_:Object = null;
         if(param1 == this._currentFrame)
         {
            return;
         }
         if(param1)
         {
            this._currentFrame = param1;
            this._hitSprite.drawPoint(this._currentFrame.hitPoint);
         }
         this.role.draw(param1,this._pool,param2);
         if(this.role.frame)
         {
            this.hitNode.x = this.node.x + this.role.frame.gox + this.role.frame.nextGox * param2;
            this.hitNode.y = this.node.y + this.role.frame.goy + this.role.frame.nextGoy * param2;
         }
         for(_loc3_ in this._effect)
         {
            this._effect[_loc3_].draw(param1,param2);
         }
      }
      
      public function setGroup(param1:FrameGroup) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         for(_loc2_ in this._effect)
         {
            if(this._effect[_loc2_].parent)
            {
               this._effect[_loc2_].parent.removeChild(this._effect[_loc2_]);
            }
         }
         this._effect.splice(0,this._effect.length);
         for(_loc3_ in param1.frames)
         {
            if(param1.frames[_loc3_].effectObjects.length > 0)
            {
               for(_loc4_ in param1.frames[_loc3_].effectObjects)
               {
                  this.node.addChild(param1.frames[_loc3_].effectObjects[_loc4_]);
                  if(this._effect.indexOf(param1.frames[_loc3_].effectObjects[_loc4_]) == -1)
                  {
                     this._effect.push(param1.frames[_loc3_].effectObjects[_loc4_]);
                  }
               }
            }
         }
      }
      
      public function cannelSelect() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in this._effect)
         {
            this._effect[_loc1_].select(false);
         }
      }
      
      protected function onHitDown(param1:MouseEvent) : void
      {
         if(this.tools.selectedIndex == 1)
         {
            this._hitSprite.push(new Point(this.hitNode.mouseX,this.hitNode.mouseY));
         }
      }
      
      protected function onHitCreate(param1:MouseEvent) : void
      {
         if(Boolean(this._currentFrame) && this.tools.selectedIndex == 1)
         {
            this._currentFrame.hitPoint = this._hitSprite.point.concat();
            this._hitSprite.over();
            this.onChange();
         }
      }
      
      protected function onCreateEffect(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         var addEffect:SelectElementView = new SelectElementView();
         addEffect.findDir = "effect";
         addEffect.callFunc = function(param1:File):void
         {
            var _loc2_:String = param1.name.substr(0,param1.name.lastIndexOf("."));
            createToFrameEffect(_loc2_);
         };
         PopUpManager.addPopUp(addEffect,this,true);
      }
      
      public function createToFrameEffect(param1:String) : void
      {
         var _loc2_:Object = {
            "findName":"",
            "isFollow":false,
            "isLockAction":false,
            "isBreak":false,
            "blendMode":"screen",
            "x":0,
            "y":0,
            "scaleY":1,
            "scaleX":1,
            "rotation":0,
            "name":param1
         };
         var _loc3_:EffectStageObject = new EffectStageObject(_loc2_);
         this.node.addChild(_loc3_);
         this._effect.push(_loc3_);
         this._currentFrame.addEffect(_loc3_);
         this.onChange();
      }
      
      public function clear() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in this._effect)
         {
            this._effect[_loc1_].clear();
         }
      }
      
      private function _RoleStage_BorderContainer1_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.percentWidth = 100;
         _loc1_.height = 32;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._RoleStage_Array2_c);
         _loc1_.setStyle("backgroundColor",4144716);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleStage_Array2_c() : Array
      {
         return [this._RoleStage_HGroup1_c()];
      }
      
      private function _RoleStage_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 5;
         _loc1_.top = 3;
         _loc1_.mxmlContent = [this._RoleStage_TabBar1_i(),this._RoleStage_ViewStack1_i(),this._RoleStage_Button1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleStage_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",IconTabBarSkin);
         _loc1_.addEventListener("change",this.__tools_change);
         _loc1_.id = "tools";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tools = _loc1_;
         BindingManager.executeBindings(this,"tools",this.tools);
         return _loc1_;
      }
      
      public function __tools_change(param1:IndexChangeEvent) : void
      {
         this.onToolsChange();
      }
      
      private function _RoleStage_ViewStack1_i() : ViewStack
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
                        "label":"选择/修改"
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
      
      private function _RoleStage_Button1_c() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = "添加特效";
         _loc1_.addEventListener("click",this.___RoleStage_Button1_click);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      public function ___RoleStage_Button1_click(param1:MouseEvent) : void
      {
         this.onCreateEffect(param1);
      }
      
      private function _RoleStage_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.top = 32;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.viewport = this._RoleStage_Group2_c();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _RoleStage_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._RoleStage_UIComponent1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _RoleStage_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.width = 1600;
         _loc1_.height = 1600;
         _loc1_.addEventListener("mouseDown",this.__roleDraw_mouseDown);
         _loc1_.addEventListener("rightMouseDown",this.__roleDraw_rightMouseDown);
         _loc1_.id = "roleDraw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.roleDraw = _loc1_;
         BindingManager.executeBindings(this,"roleDraw",this.roleDraw);
         return _loc1_;
      }
      
      public function __roleDraw_mouseDown(param1:MouseEvent) : void
      {
         this.onHitDown(param1);
      }
      
      public function __roleDraw_rightMouseDown(param1:MouseEvent) : void
      {
         this.onHitCreate(param1);
      }
      
      public function ___RoleStage_Group1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      private function _RoleStage_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"tools.dataProvider","stack");
         return _loc1_;
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
      public function get onToolsChange() : Function
      {
         return this._665107956onToolsChange;
      }
      
      public function set onToolsChange(param1:Function) : void
      {
         var _loc2_:Object = this._665107956onToolsChange;
         if(_loc2_ !== param1)
         {
            this._665107956onToolsChange = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"onToolsChange",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get roleDraw() : UIComponent
      {
         return this._267061542roleDraw;
      }
      
      public function set roleDraw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._267061542roleDraw;
         if(_loc2_ !== param1)
         {
            this._267061542roleDraw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"roleDraw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
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
   }
}

