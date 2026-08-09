package views.observe
{
   import button.DrawPan;
   import dragonBones.flash.FlashArmatureDisplay;
   import events.OpenEvent;
   import events.PushNpcEvent;
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
   import io.arkeus.tiled.TiledLayer;
   import io.arkeus.tiled.TiledObject;
   import mx.binding.*;
   import mx.collections.ArrayCollection;
   import mx.containers.HDividedBox;
   import mx.containers.ViewStack;
   import mx.controls.Alert;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColorStroke;
   import mx.graphics.codec.PNGEncoder;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import skins.IconTabBarSkin;
   import skins.TabBarSkin;
   import spark.components.BorderContainer;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.Scroller;
   import spark.components.TabBar;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   import tmx.BaseTools;
   import tmx.BitmapDataArrayList;
   import tmx.DragonNpc;
   import tmx.EventSprite;
   import tmx.MapEidtLayer;
   import tmx.MapLayer;
   import tmx.MapSprite;
   import tmx.Npc;
   import tmx.PointSprite;
   import tmx.PoltDisplay;
   import tmx.SaveObject;
   import tmx.Scenery;
   import tmx.SpriteBitmapData;
   import tmx.SpriteXMLManage;
   import tmx.StarlingMap;
   import tmx.TMXData;
   import tmx.TargetPoint;
   import utils.Base64;
   import utils.FileUtils;
   import utils.PointUtils;
   import utils.SaveUtils;
   import views.AttributeView;
   import views.RefObserve;
   import views.ScenarioSpritePool;
   import views.observe.map.FinalMap;
   import views.observe.map.LayerContent;
   import views.observe.map.MapConfigView;
   import views.observe.map.MoveToLayerView;
   import views.observe.map.SwfApplicationWindow;
   import views.tools.DrawTools;
   import views.tools.MapRectTools;
   import views.tools.SpriteTools;
   
   use namespace mx_internal;
   
   public class TMXObserve extends RefObserve implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      public var _TMXObserve_TabBar1:TabBar;
      
      public var _TMXObserve_TabBar2:TabBar;
      
      private var _13085340attribute:AttributeView;
      
      private var _124552091drawGroup:Group;
      
      private var _136468215drawTools:DrawTools;
      
      private var _1575743485editMapAttr:Button;
      
      private var _1109732030layers:LayerContent;
      
      private var _836238078mapDarw:UIComponent;
      
      private var _285284603mapDrawTools:MapRectTools;
      
      private var _954925063message:Label;
      
      private var _318184504preview:Button;
      
      private var _1549614365runGame:Button;
      
      private var _775588976scenario:ScenarioSpritePool;
      
      private var _226003457scrollerView:Scroller;
      
      private var _899647263slider:HSlider;
      
      private var _1531585665spritePool:ViewStack;
      
      private var _983528355toolView:ViewStack;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _frameSelect:Shape;
      
      private var _starlingMap:StarlingMap;
      
      private var _spriteXmlManage:SpriteXMLManage;
      
      private var _varpoint:Array;
      
      private var _pan:DrawPan;
      
      private var downPoint:Point;
      
      private var _mapSprite:MapSprite;
      
      private var _isDown:Boolean = false;
      
      private var _newMapSprite:MapSprite;
      
      private var _gridBg:Shape;
      
      private var _gameView:Shape;
      
      private var _finalMaps:Vector.<FinalMap>;
      
      private var _bg:Shape;
      
      private var _xmlData:XML;
      
      private var _currentSelect:SaveObject;
      
      private var _mSelects:Vector.<SaveObject>;
      
      private var _isUseTools:Boolean = false;
      
      private var _isCatch:Boolean = false;
      
      private var _catch:Point = null;
      
      private var _dropPoint:Point;
      
      private var _movePoint:Point;
      
      private var _dropDisplay:Sprite;
      
      public var isShowDelete:Boolean = false;
      
      public var _isMeshMove:Boolean = false;
      
      public var _openDrawMode:Boolean = false;
      
      private var _embed_mxml_tmxtools_map_pencil_png_1594940130:Class;
      
      private var _embed_mxml_tmxtools_pencil_png_1597401960:Class;
      
      private var _embed_mxml_tmxtools_select_png_1893312406:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TMXObserve()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._spriteXmlManage = new SpriteXMLManage();
         this._dropPoint = new Point();
         this._movePoint = new Point();
         this._embed_mxml_tmxtools_map_pencil_png_1594940130 = TMXObserve__embed_mxml_tmxtools_map_pencil_png_1594940130;
         this._embed_mxml_tmxtools_pencil_png_1597401960 = TMXObserve__embed_mxml_tmxtools_pencil_png_1597401960;
         this._embed_mxml_tmxtools_select_png_1893312406 = TMXObserve__embed_mxml_tmxtools_select_png_1893312406;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._TMXObserve_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_observe_TMXObserveWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TMXObserve[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._TMXObserve_Array1_c);
         this.addEventListener("addedToStage",this.___TMXObserve_RefObserve1_addedToStage);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TMXObserve._watcherSetupUtil = param1;
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
         this._finalMaps = new Vector.<FinalMap>();
         callLater(function():void
         {
            var _loc1_:String = FileUtils.readString(file);
            var _loc2_:XML = TMXData.repair(_loc1_);
            _xmlData = _loc2_;
            _starlingMap = new StarlingMap(_loc2_);
            var _loc3_:Shape = new Shape();
            _loc3_.graphics.beginFill(10066329,0.5);
            _loc3_.graphics.drawRect(0,0,_starlingMap.getWidth() * 2,_starlingMap.getHeight() * 2);
            _loc3_.graphics.endFill();
            mapDarw.addChild(_loc3_);
            _starlingMap.x = _starlingMap.getWidth() / 2;
            _starlingMap.y = _starlingMap.getHeight() / 2;
            _loc3_.graphics.beginFill(16777215,0.5);
            _loc3_.graphics.drawRect(_starlingMap.x,_starlingMap.y,_starlingMap.getWidth(),_starlingMap.getHeight());
            _bg = _loc3_;
            mapDarw.addChild(_starlingMap);
            mapDarw.width = _starlingMap.getWidth() * 2;
            mapDarw.height = _starlingMap.getHeight() * 2;
            message.text = "size:" + _starlingMap.getWidth() + "x" + _starlingMap.getHeight();
            _spriteXmlManage.updateTmxPaht(App.projectFile);
            _spriteXmlManage.loadTMXData(_loc2_,onMapAessest);
            _pan = new DrawPan();
            mapDarw.addChild(_pan);
            _pan.visible = false;
            mapDarw.addEventListener(MouseEvent.MOUSE_DOWN,onDown);
            drawGroup.addEventListener(MouseEvent.MOUSE_UP,onUp);
            scenario.spriteXMLManage = _spriteXmlManage;
            scenario.onChangeFunc = onChange;
            validateNow();
            drawGroup.horizontalScrollPosition = _starlingMap.x;
            drawGroup.verticalScrollPosition = _starlingMap.y;
            _gridBg = new Shape();
            drawGrid();
            mapDarw.addChild(_gridBg);
            _gameView = new Shape();
            mapDarw.addChild(_gameView);
            drawGameView(800,550);
            resetMapSize(_starlingMap.getWidth(),_starlingMap.getHeight());
            _frameSelect = new Shape();
            mapDarw.addChild(_frameSelect);
            _frameSelect.visible = false;
         });
         this.addEventListener(PushNpcEvent.ADD_NPC,this.onAddNpc);
         this.addEventListener(OpenEvent.ADD_EVENT,this.onAddEvent);
         this.addEventListener(OpenEvent.REFRESH,this.onRefreshEvent);
         this.addEventListener(MouseEvent.MOUSE_MOVE,this.onMove);
         this.addEventListener(OpenEvent.TRASH,this.onTrash);
         this.addEventListener(OpenEvent.TRASH_DRAW,this.onTrash);
         this.addEventListener(OpenEvent.LAYER_CHANNGE,this.onTrash);
         this.addEventListener(MouseEvent.RIGHT_CLICK,this.onRightClick);
         this.addEventListener(RightClickEvent.CLICK,this.onRightMenuClick);
         this.addEventListener(OpenEvent.ADD_TARGET,this.onAddTargetPoint);
         this.addEventListener(MouseEvent.MOUSE_WHEEL,this.onWheel);
         this.addEventListener(OpenEvent.CHANGE,this.onChangeEvent);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageUp);
      }
      
      private function onChangeEvent(param1:OpenEvent) : void
      {
         this.onChange();
      }
      
      private function onWheel(param1:MouseEvent) : void
      {
         if(param1.ctrlKey)
         {
            this.slider.value += param1.delta * 0.1;
            this.onSizeChange(true);
         }
      }
      
      public function drawGrid(param1:int = 32) : void
      {
         this._gridBg.graphics.clear();
         this._gridBg.graphics.beginFill(16711680);
         var _loc2_:int = this._starlingMap.getWidth() * 2 / param1;
         var _loc3_:int = this._starlingMap.getHeight() * 2 / param1;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            this._gridBg.graphics.drawRect(param1 * _loc4_,0,0.5,this._starlingMap.getHeight() * 2);
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            this._gridBg.graphics.drawRect(0,param1 * _loc5_,this._starlingMap.getWidth() * 2,0.5);
            _loc5_++;
         }
      }
      
      public function drawGameView(param1:int, param2:int) : void
      {
         this._gameView.graphics.clear();
         this._gameView.graphics.beginFill(16776960);
         this._gameView.graphics.drawRect(0,0,param1,param2);
         this._gameView.graphics.drawRect(2,2,param1 - 4,param2 - 4);
         this._gameView.graphics.endFill();
         this._gameView.visible = false;
      }
      
      private function onRightMenuClick(param1:RightClickEvent) : void
      {
         if(param1.target is EventSprite)
         {
            this.onNpcMenuClick(param1);
         }
         else if(param1.target is PoltDisplay)
         {
            this.onNpcMenuClick(param1);
         }
         else if(param1.target is Scenery)
         {
            this.onSceneryMenuClick(param1);
         }
      }
      
      private function onAddTargetPoint(param1:OpenEvent) : void
      {
         if(this._starlingMap.dataNode.getChildByName("targetPoint"))
         {
            Alert.show("已经存在起点设置","提示");
            return;
         }
         PointUtils.setCenterPoint(this.addTargetPoint(0,0));
      }
      
      private function onAddEvent(param1:OpenEvent) : void
      {
         var _loc2_:EventSprite = new EventSprite();
         this._starlingMap.addAt(_loc2_,4);
         PointUtils.setCenterPoint(_loc2_);
      }
      
      private function addTargetPoint(param1:int, param2:int) : TargetPoint
      {
         var _loc3_:TargetPoint = new TargetPoint();
         this._starlingMap.dataNode.addChild(_loc3_);
         _loc3_.name = "targetPoint";
         _loc3_.x = param1;
         _loc3_.y = param2;
         return _loc3_;
      }
      
      private function onNpcMenuClick(param1:RightClickEvent) : void
      {
         switch(param1.clickTag)
         {
            case "删除":
               param1.target.parent.removeChild(param1.target);
               this.onChange();
               break;
            case "动作":
               param1.target.dispatchEvent(new OpenEvent(OpenEvent.ACTION_EVENT));
               break;
            case "移至":
               this.moveToLayer(param1.target as DisplayObject);
         }
      }
      
      private function onSceneryMenuClick(param1:RightClickEvent) : void
      {
         switch(param1.clickTag)
         {
            case "删除":
               param1.target.parent.removeChild(param1.target);
               break;
            case "移至":
               this.moveToLayer(param1.target as DisplayObject);
         }
      }
      
      public function moveToLayer(param1:DisplayObject) : void
      {
         var _loc2_:MoveToLayerView = new MoveToLayerView();
         PopUpManager.addPopUp(_loc2_,this,true);
         _loc2_.display = param1;
         _loc2_.data = this.layers.getLayersArray(this._starlingMap);
      }
      
      private function onRightClick(param1:MouseEvent) : void
      {
         var _loc2_:MapEidtLayer = null;
         if(this._newMapSprite)
         {
            if(this._newMapSprite.data.points.length >= 3)
            {
               _loc2_ = this.layers.getAddGroup() as MapEidtLayer;
               if(_loc2_)
               {
                  this._newMapSprite.layer = _loc2_.layer;
                  _loc2_.addChild(this._newMapSprite);
               }
               else
               {
                  this._newMapSprite.layer = this._starlingMap.tmxObjectLayer;
                  this._starlingMap.addAt(this._newMapSprite,1);
               }
               this._newMapSprite.layer.objects.push(this._newMapSprite.data);
               this._newMapSprite.closePointDraw();
               this.onChange();
            }
            else
            {
               this._newMapSprite.parent.removeChild(this._newMapSprite);
            }
            this._newMapSprite = null;
         }
      }
      
      private function onTrash(param1:OpenEvent) : void
      {
         switch(param1.type)
         {
            case OpenEvent.TRASH:
               if(this._mapSprite)
               {
                  this._starlingMap.trash(this._mapSprite);
                  this._mapSprite = null;
                  this.onChange();
               }
               break;
            case OpenEvent.TRASH_DRAW:
               this.closeAllPointDraw();
               if(this._newMapSprite)
               {
                  this._newMapSprite.parent.removeChild(this._newMapSprite);
                  this._newMapSprite = null;
               }
         }
      }
      
      public function get map() : StarlingMap
      {
         return this._starlingMap;
      }
      
      private function onRefreshEvent(param1:OpenEvent) : void
      {
         this.onRefresh();
      }
      
      private function drawMapSprite() : void
      {
         var _loc1_:XML = null;
         if(!this._newMapSprite)
         {
            _loc1_ = <object/>;
            if(!this._isMeshMove)
            {
               _loc1_.@x = this._starlingMap.mouseX;
               _loc1_.@y = this._starlingMap.mouseY;
            }
            else
            {
               _loc1_.@x = this.meshStarlingMapMouseX;
               _loc1_.@y = this.meshStarlingMapMouseY;
            }
            if(this.mapDrawTools.toolView.selectedIndex == 4)
            {
               _loc1_.appendChild(<polygon points="0,0 32,0 32,32 0,32"/>);
            }
            else
            {
               _loc1_.appendChild(<polygon points="0,0"/>);
            }
            this._newMapSprite = new MapSprite(null,new TiledObject(_loc1_));
            this._newMapSprite.mode = this.mapDrawTools.getDrawMode();
            this._starlingMap.addChild(this._newMapSprite);
            if(!this._isMeshMove)
            {
               this._newMapSprite.x = this._starlingMap.mouseX;
               this._newMapSprite.y = this._starlingMap.mouseY;
            }
            else
            {
               this._newMapSprite.x = this.meshStarlingMapMouseX;
               this._newMapSprite.y = this.meshStarlingMapMouseY;
            }
            this._newMapSprite.onDrawPoint();
         }
         else
         {
            if(!this._isMeshMove)
            {
               this._newMapSprite.data.points.push(new Point(this._starlingMap.mouseX - this._newMapSprite.x + this._newMapSprite.currentMinX,this._starlingMap.mouseY - this._newMapSprite.y + this._newMapSprite.currentMinY));
            }
            else
            {
               this._newMapSprite.data.points.push(new Point(this.meshStarlingMapMouseX - this._newMapSprite.x + this._newMapSprite.currentMinX,this.meshStarlingMapMouseY - this._newMapSprite.y + this._newMapSprite.currentMinY));
            }
            this._newMapSprite.onDraw();
         }
      }
      
      private function onDown(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(this._isCatch)
         {
            this._catch = new Point();
            this._catch.x = this.scrollerView.viewport.horizontalScrollPosition + stage.mouseX;
            this._catch.y = this.scrollerView.viewport.verticalScrollPosition + stage.mouseY;
            return;
         }
         if(this._currentSelect)
         {
            if(e.target is BaseTools)
            {
               this._isUseTools = true;
               this._currentSelect.useTools = e.target as BaseTools;
            }
            else
            {
               this._currentSelect.onSelect(false);
               this._currentSelect = null;
               this.attribute.enabled = false;
            }
         }
         this._isDown = true;
         if(this.toolView.selectedIndex == 1 && this._pan.visible)
         {
            this.downPoint = new Point(this.mapDarw.mouseX,this.mapDarw.mouseY);
            return;
         }
         if(this.toolView.selectedIndex == 0)
         {
            if(e.target is EventSprite)
            {
               this._currentSelect = e.target as SaveObject;
               (e.target as SaveObject).onSelect(true);
               this.startDropDisplay(e.target as Sprite);
               this.selectAttribute(1,function():void
               {
                  attribute.eventAttribute.setEventSprite(e.target as EventSprite);
               });
            }
            else if(e.target is SaveObject)
            {
               this._currentSelect = e.target as SaveObject;
               this.startDropDisplay(e.target as Sprite);
               this.selectAttribute(0,function():void
               {
                  attribute.npcAttribute.setNpc(e.target as SaveObject);
                  _currentSelect = e.target as SaveObject;
                  (e.target as SaveObject).onSelect(true);
                  attribute.enabled = true;
               });
            }
         }
         else if(this.toolView.selectedIndex == 2)
         {
            if(e.target is MapSprite)
            {
               this.selectAttribute(2,function():void
               {
                  attribute.mapAttribute.setMapSprite(e.target as MapSprite);
               });
            }
            if(this.mapDrawTools.isDrawMode())
            {
               if(this.mapDrawTools.toolView.selectedIndex == 4)
               {
                  this.drawMapSprite();
               }
               return;
            }
            if((e.target as DisplayObject).parent.parent is MapSprite)
            {
               if(e.target is PointSprite)
               {
                  this.startDropDisplay(e.target as Sprite);
               }
               else
               {
                  this.startDropDisplay(this._mapSprite);
               }
            }
            else
            {
               this.closeAllPointDraw();
               if(e.target is MapSprite)
               {
                  (e.target as MapSprite).parent.addChild(e.target as MapSprite);
                  (e.target as MapSprite).onDrawPoint();
                  this._mapSprite = e.target as MapSprite;
                  this.startDropDisplay(this._mapSprite);
               }
            }
         }
         if(!this._currentSelect && this.toolView.selectedIndex == 0)
         {
            this._frameSelect.visible = true;
            this._frameSelect.graphics.clear();
            this._frameSelect.x = this._frameSelect.parent.mouseX;
            this._frameSelect.y = this._frameSelect.parent.mouseY;
         }
      }
      
      public function startDropDisplay(param1:Sprite) : void
      {
         this._dropPoint.x = param1.x;
         this._dropPoint.y = param1.y;
         this._movePoint.x = param1.x;
         this._movePoint.y = param1.y;
         param1.startDrag();
         this._dropDisplay = param1;
      }
      
      public function stopDropDisplay() : void
      {
         if(this._dropDisplay)
         {
            if(this._dropDisplay.x != this._dropPoint.x || this._dropDisplay.y != this._dropPoint.y)
            {
               onChange();
            }
         }
         this._dropDisplay = null;
         this.stopDrag();
      }
      
      public function selectAttribute(param1:int, param2:Function) : void
      {
         var i:int = 0;
         var group:Sprite = null;
         var index:int = param1;
         var func:Function = param2;
         var select:DisplayObject = this._currentSelect ? this._currentSelect : this._mapSprite;
         if(select)
         {
            i = this.layers.list.dataProvider.length - 1;
            while(i >= 0)
            {
               group = this.layers.list.dataProvider.getItemAt(i).group as Sprite;
               if(Boolean(group) && group == select.parent)
               {
                  this.layers.list.selectedIndex = i;
                  this.layers.list.scroller.viewport.verticalScrollPosition = i * 24;
                  break;
               }
               i--;
            }
         }
         this.spritePool.selectedIndex = 1;
         callLater(function():void
         {
            attribute.stack.selectedIndex = index;
            callLater(function():void
            {
               if(func != null)
               {
                  func();
               }
               attribute.enabled = true;
            });
         });
      }
      
      public function closeAllPointDraw() : void
      {
         var _loc2_:MapEidtLayer = null;
         var _loc3_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this._starlingMap.numChildren)
         {
            _loc2_ = this._starlingMap.getChildAt(_loc1_) as MapEidtLayer;
            if(_loc2_)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc2_.numChildren)
               {
                  if(_loc2_.getChildAt(_loc3_) as MapSprite)
                  {
                     (_loc2_.getChildAt(_loc3_) as MapSprite).closePointDraw();
                  }
                  _loc3_++;
               }
            }
            _loc1_++;
         }
      }
      
      private function onStageUp(param1:MouseEvent) : void
      {
         this._isUseTools = false;
         this.stopDropDisplay();
         if(this._isCatch && Boolean(this._catch))
         {
            this.scrollerView.viewport.horizontalScrollPosition = this._catch.x - stage.mouseX;
            this.scrollerView.viewport.verticalScrollPosition = this._catch.y - stage.mouseY;
            this._catch = null;
            return;
         }
         this._catch = null;
      }
      
      private function onUp(param1:MouseEvent) : void
      {
         var findRect:Rectangle = null;
         var arr:Vector.<SaveObject> = null;
         var d:Object = null;
         var i:Object = null;
         var s:Scenery = null;
         var movePoint:Point = null;
         var e:MouseEvent = param1;
         if(this._frameSelect.visible)
         {
            if(Boolean(this._mSelects) && this._mSelects.length > 0)
            {
               for(i in this._mSelects)
               {
                  this._mSelects[i].onSelect(false);
               }
               this._mSelects.splice(0,this._mSelects.length);
               this._mSelects = null;
            }
            this._frameSelect.visible = false;
            findRect = this._frameSelect.getBounds(this._frameSelect.parent);
            findRect.x -= this._starlingMap.x;
            findRect.y -= this._starlingMap.y;
            arr = this._starlingMap.findRect(findRect);
            for(d in arr)
            {
               arr[d].onSelect(true);
            }
            if(arr.length > 0)
            {
               this._mSelects = arr;
            }
            return;
         }
         if(this._isCatch && Boolean(this._catch))
         {
            return;
         }
         if(e.target is EventSprite && Boolean(this.attribute.eventAttribute))
         {
            this.attribute.eventAttribute.setEventSprite(e.target as EventSprite);
         }
         if(this.toolView.selectedIndex == 2)
         {
            if(Boolean(this.mapDrawTools.toolView) && this.mapDrawTools.isDrawMode())
            {
               if(this.mapDrawTools.toolView.selectedIndex == 4)
               {
                  this.onRightClick(null);
               }
               else
               {
                  this.drawMapSprite();
               }
            }
            else if(this._mapSprite && this._mapSprite.isSelect && this._mapSprite.getBounds(this._mapSprite.parent).intersects(new Rectangle(this._mapSprite.parent.mouseX,this._mapSprite.parent.mouseY,1,1)))
            {
               this._mapSprite.onUp(e);
            }
            return;
         }
         this._isDown = false;
         if(e.target is SaveObject)
         {
            this.selectAttribute(e.target is EventSprite ? 1 : 0,function():void
            {
               attribute.npcAttribute.setNpc(e.target as SaveObject);
            });
         }
         if(this.downPoint && this.scenario.list.selectedItem && this._pan.visible)
         {
            s = new Scenery(this.scenario.list.selectedItem.name,this.scenario.drop.selectedItem.name,this._pan.bitmapData,this.scenario.list.selectedItem.xml);
            s.rootClass = this.scenario.drop.selectedItem.classBind;
            s.x = this._pan.x - this._starlingMap.x;
            s.y = this._pan.y - this._starlingMap.y;
            s.rotation = this._pan.rotation;
            s.scaleX = this._pan.scaleX;
            s.scaleY = this._pan.scaleY;
            this.layers.getAddGroup().addChild(s);
            this.downPoint = null;
            movePoint = this._pan.bitmap.localToGlobal(new Point()).subtract(s.localToGlobal(new Point()));
            this.onChange();
         }
      }
      
      public function onAddNpc(param1:PushNpcEvent) : void
      {
         var e:PushNpcEvent = param1;
         var filename:String = e.file.name;
         filename = filename.substr(0,filename.lastIndexOf("."));
         if(e.file.parent.resolvePath(filename + ".xml").exists)
         {
            this._spriteXmlManage.load(e.file,function(param1:SpriteBitmapData):void
            {
               var _loc2_:Npc = new Npc(param1);
               if(layers.getAddGroup().type == "npc")
               {
                  layers.getAddGroup().addChild(_loc2_);
               }
               else
               {
                  _starlingMap.addAt(_loc2_,2);
               }
               PointUtils.setCenterPoint(_loc2_);
               onChange();
            });
         }
         else
         {
            this._spriteXmlManage.loadDragon(e.file,function(param1:FlashArmatureDisplay, param2:String):void
            {
               var _loc3_:DragonNpc = new DragonNpc(param1,param2);
               if(layers.getAddGroup().type == "npc")
               {
                  layers.getAddGroup().addChild(_loc3_);
               }
               else
               {
                  _starlingMap.addAt(_loc3_,2);
               }
               PointUtils.setCenterPoint(_loc3_);
               onChange();
            });
         }
      }
      
      public function get extendData() : Object
      {
         return this._spriteXmlManage.extendData;
      }
      
      private function onMapAessest() : void
      {
         var sceneryList:ArrayCollection;
         var saveList:Array;
         var i3:Object = null;
         var spriteData:SpriteBitmapData = null;
         var layeri:Object = null;
         var layerob:Object = null;
         var i6:Object = null;
         var ob3:Object = null;
         var event:EventSprite = null;
         var layer:MapLayer = null;
         var i7:Object = null;
         var i4:Object = null;
         var i5:Object = null;
         var ob:Object = null;
         var dataXmlAndTexture:Object = null;
         var scenery:Scenery = null;
         var ob2:Object = null;
         var dataXmlAndTexture2:Object = null;
         var scenery2:Scenery = null;
         if(!this._spriteXmlManage.extendData)
         {
            this.layers.showLayerMc(this._starlingMap);
            return;
         }
         this.map.resetLayer();
         this.createNpc();
         sceneryList = new ArrayCollection();
         saveList = [];
         for(i3 in this._spriteXmlManage.extendData.scenery)
         {
            spriteData = this._spriteXmlManage.getSpriteBitmapData(this._spriteXmlManage.extendData.scenery[i3].name);
            if(Boolean(spriteData) && saveList.indexOf(spriteData.targetName) == -1)
            {
               sceneryList.addItem({
                  "name":spriteData.targetName,
                  "classBind":spriteData.targetXml["class"],
                  "data":new BitmapDataArrayList(spriteData),
                  "path":spriteData.path
               });
               saveList.push(spriteData.targetName);
            }
         }
         this.scenario.dataSprites = sceneryList;
         this.scenario.onInit();
         if(this._spriteXmlManage.extendData.version == "0.0.2")
         {
            for(layeri in this._spriteXmlManage.extendData.layers)
            {
               layerob = this._spriteXmlManage.extendData.layers[layeri];
               if(layerob.type == "scenery")
               {
                  this.parsingLayer(layerob.id,layerob.name,this._spriteXmlManage.extendData.layers.length - int(layeri) - 1,this._spriteXmlManage.extendData[layerob.id]);
               }
               else if(layerob.type == "event")
               {
                  for(i6 in this._spriteXmlManage.extendData[layerob.id])
                  {
                     ob3 = this._spriteXmlManage.extendData[layerob.id][i6];
                     event = new EventSprite();
                     event.applyObject(ob3);
                     this._starlingMap.eventNode.addChild(event);
                  }
               }
               else if(layerob.type == "npc")
               {
                  layer = this._starlingMap.getChildByName(layerob.id) as MapLayer;
                  if(!layer)
                  {
                     layer = new MapLayer("npc");
                     layer.nameString = layerob.name;
                     layer.name = layerob.id;
                     this._starlingMap.addChildAt(layer,0);
                  }
                  else
                  {
                     this._starlingMap.addChildAt(layer,0);
                  }
                  for(i7 in this._spriteXmlManage.extendData[layerob.id])
                  {
                     this.loadData(this._spriteXmlManage.extendData[layerob.id][i7],layer);
                  }
               }
               else if(layerob.type == "map")
               {
                  layerob.id = layerob.id == "_mapLayer" ? "hit_layer" : layerob.id;
                  if(this._starlingMap.getChildByName(layerob.id))
                  {
                     this._starlingMap.addChildAt(this._starlingMap.getChildByName(layerob.id),0);
                  }
               }
            }
         }
         else
         {
            for(i4 in this._spriteXmlManage.extendData.scenerySprites)
            {
               ob = this._spriteXmlManage.extendData.scenerySprites[i4];
               try
               {
                  dataXmlAndTexture = this._spriteXmlManage.getSpriteBitmapData(ob.target).getBitmapDataFormName(ob.name);
                  scenery = new Scenery(ob.name,ob.target,dataXmlAndTexture.bitmap,dataXmlAndTexture.xml);
                  scenery.applyObject(ob);
                  this._starlingMap.addAt(scenery,3);
               }
               catch(e:Error)
               {
               }
            }
            for(i5 in this._spriteXmlManage.extendData.scenerySpritesBottom)
            {
               ob2 = this._spriteXmlManage.extendData.scenerySpritesBottom[i5];
               spriteData = this._spriteXmlManage.getSpriteBitmapData(ob2.target);
               if(spriteData)
               {
                  dataXmlAndTexture2 = this._spriteXmlManage.getSpriteBitmapData(ob2.target).getBitmapDataFormName(ob2.name);
                  scenery2 = new Scenery(ob2.name,ob2.target,dataXmlAndTexture2.bitmap,dataXmlAndTexture2.xml);
                  scenery2.applyObject(ob2);
                  this._starlingMap.addAt(scenery2,0);
               }
            }
            for(i6 in this._spriteXmlManage.extendData.events)
            {
               ob3 = this._spriteXmlManage.extendData.events[i6];
               try
               {
                  event = new EventSprite();
                  event.applyObject(ob3);
                  this._starlingMap.addAt(event,4);
               }
               catch(e:Error)
               {
               }
            }
         }
         if(this._spriteXmlManage.extendData.targetPoint)
         {
            this.addTargetPoint(this._spriteXmlManage.extendData.targetPoint.x,this._spriteXmlManage.extendData.targetPoint.y);
         }
         this.layers.observe = this;
         this.layers.showLayerMc(this._starlingMap);
      }
      
      private function parsingLayer(param1:String, param2:String, param3:int, param4:Array) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:SpriteBitmapData = null;
         var _loc8_:BitmapData = null;
         var _loc9_:Scenery = null;
         var _loc10_:MapLayer = null;
         for(_loc5_ in param4)
         {
            _loc6_ = param4[_loc5_];
            _loc7_ = this._spriteXmlManage.getSpriteBitmapData(_loc6_.target);
            _loc8_ = _loc7_.getBitmapDataFormName(_loc6_.name).bitmap as BitmapData;
            if(_loc8_)
            {
               _loc9_ = new Scenery(_loc6_.name,_loc6_.target,_loc8_,_loc7_.getBitmapDataFormName(_loc6_.name).xml);
               _loc9_.applyObject(_loc6_);
               _loc9_.rootClass = _loc7_.targetXml["class"];
               _loc10_ = this._starlingMap.getChildByName(param1) as MapLayer;
               if(!_loc10_)
               {
                  _loc10_ = new MapLayer("scenery");
                  _loc10_.nameString = param2;
                  _loc10_.name = param1;
               }
               this._starlingMap.addChildAt(_loc10_,0);
               _loc10_.addChild(_loc9_);
            }
         }
      }
      
      private function onSizeChange(param1:Boolean) : void
      {
         var num:int;
         var oldh:Number = NaN;
         var oldv:Number = NaN;
         var mapSpr:MapSprite = null;
         var lockMouse:Boolean = param1;
         var lockX:int = this.scrollerView.viewport.horizontalScrollPosition;
         var lockY:int = this.scrollerView.viewport.verticalScrollPosition;
         oldh = lockX / (this.scrollerView.viewport.contentWidth - this.scrollerView.viewport.width);
         oldv = lockY / (this.scrollerView.viewport.contentHeight - this.scrollerView.viewport.height);
         if(this.scrollerView.viewport.width > this.mapDarw.width * this.mapDarw.scaleX)
         {
            oldh = 0.5;
         }
         if(this.scrollerView.viewport.height > this.mapDarw.height * this.mapDarw.scaleY)
         {
            oldv = 0.5;
         }
         this.mapDarw.scaleX = this.slider.value;
         this.mapDarw.scaleY = this.slider.value;
         callLater(function():void
         {
            scrollerView.viewport.verticalScrollPosition = (scrollerView.viewport.contentHeight - scrollerView.viewport.height) * oldv;
            scrollerView.viewport.horizontalScrollPosition = (scrollerView.viewport.contentWidth - scrollerView.viewport.width) * oldh;
            if(scrollerView.viewport.width > mapDarw.width * mapDarw.scaleX)
            {
               mapDarw.x = (scrollerView.viewport.width - mapDarw.width * mapDarw.scaleX) / 2;
            }
            else
            {
               mapDarw.x = 0;
            }
            if(scrollerView.viewport.height > mapDarw.height * mapDarw.scaleY)
            {
               mapDarw.y = (scrollerView.viewport.height - mapDarw.height * mapDarw.scaleY) / 2;
            }
            else
            {
               mapDarw.y = 0;
            }
         });
         num = this._starlingMap.mapNode.numChildren - 1;
         while(num >= 0)
         {
            mapSpr = this._starlingMap.mapNode.getChildAt(num) as MapSprite;
            if(mapSpr)
            {
               mapSpr.setPointScale(1 + (1 - this.slider.value));
            }
            num--;
         }
      }
      
      override public function onFrame() : void
      {
         if(this._starlingMap)
         {
            this._starlingMap.onFrame();
         }
      }
      
      public function outImage() : void
      {
         var i:int;
         var layer:MapLayer = null;
         this.map.eventNode.visible = false;
         this.map.dataNode.visible = false;
         i = 0;
         while(i < this.map.numChildren)
         {
            layer = this.map.getChildAt(i) as MapLayer;
            if(Boolean(layer) && layer.type == "npc")
            {
               layer.visible = false;
            }
            i++;
         }
         this.showFinalMap();
         setTimeout(function():void
         {
            var _loc9_:MapLayer = null;
            var _loc1_:Number = 0.1;
            var _loc2_:Matrix = new Matrix();
            _loc2_.scale(_loc1_,_loc1_);
            var _loc3_:BitmapData = new BitmapData(map.getWidth() * _loc1_,map.getHeight() * _loc1_,true,0);
            _loc3_.draw(map,_loc2_,null,null,null,true);
            var _loc4_:PNGEncoder = new PNGEncoder();
            var _loc5_:ByteArray = _loc4_.encode(_loc3_);
            var _loc6_:FileStream = new FileStream();
            var _loc7_:File = App.projectFile.resolvePath("map_images/" + file.name.replace(".tmx",".png"));
            _loc6_.open(_loc7_,FileMode.WRITE);
            _loc6_.writeBytes(_loc5_);
            _loc6_.close();
            map.eventNode.visible = true;
            map.dataNode.visible = true;
            var _loc8_:int = 0;
            while(_loc8_ < map.numChildren)
            {
               _loc9_ = map.getChildAt(_loc8_) as MapLayer;
               if((Boolean(_loc9_)) && _loc9_.type == "npc")
               {
                  _loc9_.visible = true;
               }
               _loc8_++;
            }
            closeFinal();
         },300);
      }
      
      override public function onSave() : void
      {
         super.onSave();
         SaveUtils.saveTmx(this._starlingMap,this.layers.getLayersArray(this._starlingMap),file,this.scenario.dataSprites);
         this._xmlData = TMXData.repair(FileUtils.readString(file));
         this.outImage();
      }
      
      override public function onRefresh() : void
      {
         var _loc2_:Object = null;
         var _loc3_:Npc = null;
         var _loc4_:String = null;
         if(!this._spriteXmlManage.extendData)
         {
            return;
         }
         this._varpoint = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < this._starlingMap.npcNode.numChildren)
         {
            _loc3_ = this._starlingMap.npcNode.getChildAt(_loc1_) as Npc;
            this._varpoint.push({
               "name":_loc3_.getData().targetName,
               "x":_loc3_.x,
               "y":_loc3_.y
            });
            _loc1_++;
         }
         this._starlingMap.npcNode.removeChildren();
         for(_loc2_ in this._spriteXmlManage.extendData.npc)
         {
            _loc4_ = this._spriteXmlManage.extendData.npc[_loc2_].path;
            _loc4_ = _loc4_.substr(_loc4_.lastIndexOf("/") + 1);
            _loc4_ = _loc4_.substr(0,_loc4_.indexOf("."));
            this._spriteXmlManage.removeSpriteBitmapData(_loc4_);
         }
         this.createNpc();
      }
      
      public function createNpc() : void
      {
         var _loc1_:Object = null;
         if(this._spriteXmlManage.extendData.version != "0.0.2")
         {
            for(_loc1_ in this._spriteXmlManage.extendData.npc)
            {
               this.loadData(this._spriteXmlManage.extendData.npc[_loc1_],this._starlingMap.npcNode);
            }
         }
      }
      
      private function loadData(param1:Object, param2:DisplayObjectContainer) : void
      {
         var npcData:Object = param1;
         var addto:DisplayObjectContainer = param2;
         var file:File = this._spriteXmlManage.projectRootFile.resolvePath(npcData.path);
         if(file.parent.resolvePath(file.name.replace(".png",".xml")).exists)
         {
            this._spriteXmlManage.load(file,function(param1:SpriteBitmapData):void
            {
               var _loc2_:Npc = new Npc(param1);
               addto.addChild(_loc2_);
               attr(_loc2_,npcData);
            });
         }
         else
         {
            this._spriteXmlManage.loadDragon(file,function(param1:FlashArmatureDisplay, param2:String):void
            {
               var _loc3_:DragonNpc = null;
               if(param1)
               {
                  _loc3_ = new DragonNpc(param1,param2);
                  addto.addChild(_loc3_);
                  attr(_loc3_,npcData);
               }
            });
         }
      }
      
      public function attr(param1:PoltDisplay, param2:Object) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         if(param2.scaleX)
         {
            param1.scaleX = param2.scaleX;
         }
         if(param2.scaleY)
         {
            param1.scaleY = param2.scaleY;
         }
         if(param2.blendMode)
         {
            param1.starlingBlendMode = param2.blendMode;
         }
         if(param2.dialogue)
         {
            param1.dialogue = param2.dialogue;
         }
         if(param2.poltData)
         {
            if(param2.poltData is Array)
            {
               param1.poltData = param2.poltData;
            }
            else
            {
               param1.poltData = JSON.parse(Base64.decode(param2.poltData)) as Array;
            }
         }
         if(param2.instanceName)
         {
            param1.instanceName = param2.instanceName;
         }
         if(param2.other)
         {
            param1.other = param2.other;
         }
         if(param2.noChange)
         {
            param1.noChange = param2.noChange;
         }
      }
      
      public function onToolViewSelectChange() : void
      {
         this.closeAllPointDraw();
         this.onTrash(new OpenEvent(OpenEvent.TRASH_DRAW));
         this.layers.showLayerMc(this._starlingMap);
         if(this._currentSelect)
         {
            this._currentSelect.onSelect(false);
            this._currentSelect = null;
         }
         if(this._mapSprite)
         {
            this._mapSprite.closePointDraw();
            this._mapSprite = null;
         }
      }
      
      public function converMeshValue(param1:int) : int
      {
         var _loc2_:int = param1;
         if(this._isMeshMove)
         {
            _loc2_ = param1 / 32;
            _loc2_ *= 32;
            if(_loc2_ == 0)
            {
               _loc2_ = param1 < 0 ? -32 : 32;
            }
            if(_loc2_ < 0)
            {
               _loc2_ = 32;
            }
         }
         else if(_loc2_ < 0)
         {
            _loc2_ = 5;
         }
         return _loc2_;
      }
      
      protected function onMove(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Object = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(this._dropDisplay is PointSprite)
         {
            (this._dropDisplay.parent.parent as MapSprite).onMovePoint();
         }
         if(this.toolView.selectedIndex == 2)
         {
            if(Boolean(this.mapDrawTools.toolView) && this.mapDrawTools.isDrawMode())
            {
               if(this.mapDrawTools.toolView.selectedIndex == 4 && Boolean(this._newMapSprite))
               {
                  _loc2_ = this._newMapSprite.parent.mouseX - this._newMapSprite.x;
                  _loc3_ = this._newMapSprite.parent.mouseY - this._newMapSprite.y;
                  this._newMapSprite.points[1].x = this.converMeshValue(_loc2_);
                  this._newMapSprite.points[2].x = this.converMeshValue(_loc2_);
                  this._newMapSprite.points[2].y = this.converMeshValue(_loc3_);
                  this._newMapSprite.points[3].y = this.converMeshValue(_loc3_);
                  _loc4_ = this._newMapSprite.x;
                  _loc5_ = this._newMapSprite.y;
                  this._newMapSprite.onDraw();
                  this._newMapSprite.onResetPoints();
               }
            }
            return;
         }
         if(this._frameSelect.visible)
         {
            this._frameSelect.graphics.clear();
            this._frameSelect.graphics.beginFill(16776960,0.3);
            this._frameSelect.graphics.drawRect(0,0,-this._frameSelect.x + this._frameSelect.parent.mouseX,-this._frameSelect.y + this._frameSelect.parent.mouseY);
         }
         else if(this._currentSelect && this._mSelects && this._mSelects.length > 0)
         {
            _loc2_ = this._movePoint.x - this._currentSelect.x;
            _loc3_ = this._movePoint.y - this._currentSelect.y;
            for(_loc6_ in this._mSelects)
            {
               if(this._mSelects[_loc6_] != this._currentSelect)
               {
                  this._mSelects[_loc6_].x -= _loc2_;
                  this._mSelects[_loc6_].y -= _loc3_;
               }
            }
            this._movePoint.x = this._currentSelect.x;
            this._movePoint.y = this._currentSelect.y;
         }
         if(this._isUseTools && Boolean(this._currentSelect))
         {
            this._currentSelect.useTools.onMath();
            this.onChange();
            this.attribute.npcAttribute.setNpc(this._currentSelect);
            return;
         }
         if(this._isCatch && Boolean(this._catch))
         {
            this.scrollerView.viewport.horizontalScrollPosition = this._catch.x - stage.mouseX;
            this.scrollerView.viewport.verticalScrollPosition = this._catch.y - stage.mouseY;
            return;
         }
         if(param1.altKey)
         {
            this._gameView.visible = true;
            this._gameView.x = this._gameView.parent.mouseX;
            this._gameView.y = this._gameView.parent.mouseY;
         }
         else
         {
            this._gameView.visible = false;
         }
         this._starlingMap.rightEnble = !this._newMapSprite;
         this._pan.visible = this.toolView.selectedIndex == 1;
         if(this._pan.visible)
         {
            if(!this.layers.getAddGroup() || this.layers.getAddGroup().type != "scenery")
            {
               this._pan.visible = false;
            }
         }
         if(this.toolView.selectedIndex == 2)
         {
            if(Boolean(this._mapSprite) && this._isDown)
            {
               if(this._mapSprite.onMovePoint())
               {
                  this.onChange();
               }
            }
            return;
         }
         if(!this.drawTools.scaleSlider)
         {
            return;
         }
         if(Boolean(this.downPoint) && Boolean(this._pan.bitmapData))
         {
            _loc7_ = new Point(this.mapDarw.mouseX,this.mapDarw.mouseY);
            _loc8_ = Point.distance(_loc7_,this.downPoint);
            _loc9_ = _loc8_ / this._pan.bitmapData.width;
            if(!this._openDrawMode)
            {
               if(param1.ctrlKey)
               {
                  _loc9_ = this.drawTools.scaleSlider.value;
               }
               this._pan.scaleX = _loc9_ * -1;
               this._pan.scaleY = -1 * this.drawTools.scaleSlider.value;
               this._pan.rotation = PointUtils.getRotation(_loc7_,this.downPoint);
               return;
            }
            this._pan.width = _loc9_ * this._pan.bitmap.bitmapData.width;
            return;
         }
         if(this.scenario.list.selectedItem)
         {
            this._pan.rotation = 0;
            this._pan.scaleX = 1 * this.drawTools.scaleSlider.value;
            this._pan.scaleY = 1 * this.drawTools.scaleSlider.value;
            this._pan.bitmapData = this.scenario.image.bitmapData;
            this._pan.bitmap.x = -int(this.scenario.list.selectedItem.xml.@frameX);
            this._pan.bitmap.y = -int(this.scenario.list.selectedItem.xml.@frameY);
            this._pan.alpha = 0.5;
            if(!this._isMeshMove)
            {
               this._pan.x = this.mapDarw.mouseX;
               this._pan.y = this.mapDarw.mouseY;
            }
            else
            {
               this._pan.x = this.meshMouseX;
               this._pan.y = this.meshMouseY;
            }
         }
      }
      
      public function get meshMouseX() : int
      {
         return int(this.mapDarw.mouseX / 32) * 32;
      }
      
      public function get meshMouseY() : int
      {
         return int(this.mapDarw.mouseY / 32) * 32;
      }
      
      public function get meshStarlingMapMouseX() : int
      {
         return int(this._starlingMap.mouseX / 32) * 32;
      }
      
      public function get meshStarlingMapMouseY() : int
      {
         return int(this._starlingMap.mouseY / 32) * 32;
      }
      
      public function getNpcs() : ArrayCollection
      {
         var _loc3_:MapLayer = null;
         var _loc4_:int = 0;
         var _loc5_:PoltDisplay = null;
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.addItem({"name":"self"});
         var _loc2_:int = 0;
         while(_loc2_ < this._starlingMap.numChildren)
         {
            _loc3_ = this._starlingMap.getChildAt(_loc2_) as MapLayer;
            if(Boolean(_loc3_) && _loc3_.type == "npc")
            {
               _loc4_ = 0;
               while(_loc4_ < _loc3_.numChildren)
               {
                  _loc5_ = _loc3_.getChildAt(_loc4_) as PoltDisplay;
                  if(_loc5_)
                  {
                     _loc1_.addItem({
                        "name":_loc5_.currentInstanceName,
                        "npc":_loc5_
                     });
                  }
                  _loc4_++;
               }
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function showFinalMap() : Boolean
      {
         var _loc1_:File = null;
         var _loc2_:Vector.<TiledLayer> = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:MapLayer = null;
         var _loc6_:FinalMap = null;
         if(this._finalMaps.length == 0)
         {
            if(this._xmlData.@texture != undefined)
            {
               _loc1_ = App.projectFile.resolvePath(this._xmlData.@texture + ".xml");
               if(_loc1_.exists)
               {
                  _loc2_ = this._starlingMap.tmx.layers.getObjectLayers();
                  for(_loc3_ in _loc2_)
                  {
                     _loc4_ = _loc2_[_loc3_].name;
                     _loc5_ = _loc4_ == "hit_layer" ? this.map.mapNode : this.map.getChildByName(_loc4_) as MapLayer;
                     if(_loc5_)
                     {
                        _loc6_ = new FinalMap(this._starlingMap,_loc5_ as MapEidtLayer,_loc1_.url,this._xmlData.@textureOffsetX,this._xmlData.@textureOffsetY);
                        _loc5_.addChild(_loc6_);
                        this._finalMaps.push(_loc6_);
                     }
                  }
                  return true;
               }
            }
         }
         return false;
      }
      
      protected function onShowFianlMap(param1:MouseEvent) : void
      {
         if(this.preview.label == "预览")
         {
            if(!this.showFinalMap())
            {
               return;
            }
         }
         else
         {
            this.closeFinal();
         }
         this.preview.label = this.preview.label == "预览" ? "关闭预览" : "预览";
      }
      
      public function closeFinal() : void
      {
         var _loc1_:Object = null;
         for(_loc1_ in this._finalMaps)
         {
            this._finalMaps[_loc1_].parent.removeChild(this._finalMaps[_loc1_]);
         }
         this._finalMaps.splice(0,this._finalMaps.length);
      }
      
      protected function onSpritePoolChange(param1:IndexChangedEvent) : void
      {
      }
      
      protected function onEditMap(param1:MouseEvent) : void
      {
         var _loc2_:MapConfigView = new MapConfigView();
         _loc2_.setXmlFile(file,this);
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      public function resetMapSize(param1:int, param2:int) : void
      {
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:int = 0;
         var _loc9_:DisplayObjectContainer = null;
         var _loc3_:int = param2 - this._starlingMap.getHeight();
         this._bg.graphics.clear();
         this._bg.graphics.beginFill(10066329,0.5);
         this._bg.graphics.drawRect(0,0,param1 * 2,param2 * 2);
         this._bg.graphics.endFill();
         var _loc4_:int = param1 / 2 / 32;
         var _loc5_:int = param2 / 2 / 32;
         this._starlingMap.x = _loc4_ * 32;
         this._starlingMap.y = _loc5_ * 32;
         this._starlingMap.setWidth(param1);
         this._starlingMap.setHeight(param2);
         this.mapDarw.width = param1 * 2;
         this.mapDarw.height = param2 * 2;
         this._bg.graphics.beginFill(16777215,0.5);
         this._bg.graphics.drawRect(this._starlingMap.x,this._starlingMap.y,param1,param2);
         var _loc6_:int = 0;
         while(_loc6_ < this._starlingMap.numChildren)
         {
            _loc7_ = this._starlingMap.getChildAt(_loc6_) as DisplayObjectContainer;
            if(_loc7_)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc7_.numChildren)
               {
                  _loc9_ = _loc7_.getChildAt(_loc8_) as DisplayObjectContainer;
                  if(_loc9_)
                  {
                     _loc7_.getChildAt(_loc8_).y = _loc7_.getChildAt(_loc8_).y + _loc3_;
                     if(_loc9_ is MapSprite)
                     {
                        (_loc9_ as MapSprite).onMovePoint();
                     }
                  }
                  _loc8_++;
               }
            }
            _loc6_++;
         }
         this.drawGrid();
      }
      
      override public function onKeyDown(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.SPACE:
            case Keyboard.H:
               this._isCatch = true;
               break;
            case Keyboard.G:
               this._isMeshMove = !this._isMeshMove;
               break;
            case Keyboard.F:
               this._openDrawMode = !this._openDrawMode;
         }
      }
      
      override public function onKeyUp(param1:KeyboardEvent) : void
      {
         var event:KeyboardEvent = param1;
         switch(event.keyCode)
         {
            case Keyboard.F5:
               this.outImage();
               break;
            case Keyboard.SPACE:
            case Keyboard.H:
               this._isCatch = false;
               break;
            case Keyboard.M:
               this.toolView.selectedIndex = 2;
               break;
            case Keyboard.V:
               this.toolView.selectedIndex = 0;
               break;
            case Keyboard.B:
               this.toolView.selectedIndex = 1;
               break;
            case Keyboard.R:
               if(event.ctrlKey || event.commandKey)
               {
                  this._gridBg.visible = !this._gridBg.visible;
               }
               break;
            case Keyboard.DELETE:
            case Keyboard.KEYNAME_DELETE:
               if(this.isShowDelete)
               {
                  return;
               }
               if(Boolean(this._mSelects) && this._mSelects.length > 0)
               {
                  this.removeCurrentSelect();
                  return;
               }
               if(this._currentSelect)
               {
                  if(this._currentSelect is PoltDisplay)
                  {
                     if(Boolean((this._currentSelect as PoltDisplay).poltData) && (this._currentSelect as PoltDisplay).poltData.length > 0)
                     {
                        Alert.show("该交互元素包含了交互数据，是否删除","提示",Alert.OK | Alert.NO,null,function(param1:CloseEvent):void
                        {
                           if(Alert.OK == param1.detail)
                           {
                              removeCurrentSelect();
                           }
                           isShowDelete = false;
                        });
                        return;
                     }
                  }
                  this.removeCurrentSelect();
               }
               if(this._mapSprite)
               {
                  this._starlingMap.trash(this._mapSprite);
                  this._mapSprite = null;
               }
         }
      }
      
      public function removeCurrentSelect() : void
      {
         var _loc1_:Object = null;
         if(this._currentSelect)
         {
            this._currentSelect.parent.removeChild(this._currentSelect);
            this._currentSelect = null;
         }
         if(this._mSelects)
         {
            for(_loc1_ in this._mSelects)
            {
               if(this._mSelects[_loc1_].parent)
               {
                  this._mSelects[_loc1_].parent.removeChild(this._mSelects[_loc1_]);
               }
            }
            this._mSelects.splice(0,this._mSelects.length);
            this._mSelects = null;
         }
         onChange();
      }
      
      protected function onRunGame(param1:MouseEvent) : void
      {
         if(App.projectFile.resolvePath("runtime").exists)
         {
            SwfApplicationWindow.run(file.name,null,800,550);
         }
         else
         {
            Alert.show("不存在运行环境","运行失败");
         }
      }
      
      override public function discarded() : void
      {
         var _loc3_:MapLayer = null;
         var _loc4_:int = 0;
         var _loc5_:SaveObject = null;
         var _loc1_:Array = this.layers.getLayersArray(this._starlingMap);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_] as MapLayer;
            if(_loc3_)
            {
               _loc4_ = _loc3_.numChildren - 1;
               while(_loc4_ >= 0)
               {
                  _loc5_ = (_loc1_[_loc2_] as Sprite).getChildAt(_loc4_) as SaveObject;
                  if(_loc5_)
                  {
                     _loc5_.clear();
                  }
                  _loc4_--;
               }
            }
            _loc2_++;
         }
         this._spriteXmlManage.discarded();
      }
      
      private function _TMXObserve_Array1_c() : Array
      {
         return [this._TMXObserve_HDividedBox1_c(),this._TMXObserve_BorderContainer2_c(),this._TMXObserve_BorderContainer3_c()];
      }
      
      private function _TMXObserve_HDividedBox1_c() : HDividedBox
      {
         var temp:HDividedBox = new HDividedBox();
         temp.top = 32;
         temp.bottom = 26;
         temp.percentWidth = 100;
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":HDividedBox,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Scroller,
                  "id":"scrollerView",
                  "stylesFactory":function():void
                  {
                     this.chromeColor = 4144716;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":80,
                        "percentHeight":100,
                        "viewport":_TMXObserve_Group1_i()
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":BorderContainer,
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 4144716;
                     this.borderVisible = false;
                     this.dropShadowVisible = false;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":0,
                        "y":0,
                        "width":230,
                        "percentHeight":100,
                        "mxmlContentFactory":new DeferredInstanceFromFunction(_TMXObserve_Array3_c)
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         return temp;
      }
      
      private function _TMXObserve_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._TMXObserve_UIComponent1_i()];
         _loc1_.id = "drawGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.drawGroup = _loc1_;
         BindingManager.executeBindings(this,"drawGroup",this.drawGroup);
         return _loc1_;
      }
      
      private function _TMXObserve_UIComponent1_i() : UIComponent
      {
         var _loc1_:UIComponent = new UIComponent();
         _loc1_.id = "mapDarw";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.mapDarw = _loc1_;
         BindingManager.executeBindings(this,"mapDarw",this.mapDarw);
         return _loc1_;
      }
      
      private function _TMXObserve_Array3_c() : Array
      {
         return [this._TMXObserve_LayerContent1_i(),this._TMXObserve_TabBar1_i(),this._TMXObserve_ViewStack1_i()];
      }
      
      private function _TMXObserve_LayerContent1_i() : LayerContent
      {
         var _loc1_:LayerContent = new LayerContent();
         _loc1_.label = "图层";
         _loc1_.height = 165;
         _loc1_.id = "layers";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.layers = _loc1_;
         BindingManager.executeBindings(this,"layers",this.layers);
         return _loc1_;
      }
      
      private function _TMXObserve_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.top = 165;
         _loc1_.height = 26;
         _loc1_.setStyle("skinClass",TabBarSkin);
         _loc1_.id = "_TMXObserve_TabBar1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TMXObserve_TabBar1 = _loc1_;
         BindingManager.executeBindings(this,"_TMXObserve_TabBar1",this._TMXObserve_TabBar1);
         return _loc1_;
      }
      
      private function _TMXObserve_ViewStack1_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.top = 191;
         temp.percentWidth = 100;
         temp.bottom = 0;
         temp.addEventListener("change",this.__spritePool_change);
         temp.id = "spritePool";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"spritePool",
            "events":{"change":"__spritePool_change"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":ScenarioSpritePool,
                  "id":"scenario",
                  "propertiesFactory":function():Object
                  {
                     return {"label":"素材库"};
                  }
               }),new UIComponentDescriptor({
                  "type":AttributeView,
                  "id":"attribute",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"属性",
                        "minWidth":200
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.spritePool = temp;
         BindingManager.executeBindings(this,"spritePool",this.spritePool);
         return temp;
      }
      
      public function __spritePool_change(param1:IndexChangedEvent) : void
      {
         this.onSpritePoolChange(param1);
      }
      
      private function _TMXObserve_BorderContainer2_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.height = 26;
         _loc1_.bottom = 0;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TMXObserve_Array4_c);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("dropShadowVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TMXObserve_Array4_c() : Array
      {
         return [this._TMXObserve_Label1_i()];
      }
      
      private function _TMXObserve_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.left = 5;
         _loc1_.right = 0;
         _loc1_.verticalCenter = 2;
         _loc1_.text = "size:4096*1026";
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "message";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.message = _loc1_;
         BindingManager.executeBindings(this,"message",this.message);
         return _loc1_;
      }
      
      private function _TMXObserve_BorderContainer3_c() : BorderContainer
      {
         var _loc1_:BorderContainer = new BorderContainer();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.percentWidth = 100;
         _loc1_.height = 32;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this._TMXObserve_Array5_c);
         _loc1_.setStyle("backgroundColor",4144716);
         _loc1_.setStyle("borderVisible",false);
         _loc1_.setStyle("dropShadowVisible",false);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TMXObserve_Array5_c() : Array
      {
         return [this._TMXObserve_Button1_i(),this._TMXObserve_Button2_i(),this._TMXObserve_Button3_i(),this._TMXObserve_HSlider1_i(),this._TMXObserve_Label2_c(),this._TMXObserve_HGroup1_c()];
      }
      
      private function _TMXObserve_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 314;
         _loc1_.label = "运行";
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("click",this.__runGame_click);
         _loc1_.id = "runGame";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.runGame = _loc1_;
         BindingManager.executeBindings(this,"runGame",this.runGame);
         return _loc1_;
      }
      
      public function __runGame_click(param1:MouseEvent) : void
      {
         this.onRunGame(param1);
      }
      
      private function _TMXObserve_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 237;
         _loc1_.label = "地图属性";
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("click",this.__editMapAttr_click);
         _loc1_.id = "editMapAttr";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.editMapAttr = _loc1_;
         BindingManager.executeBindings(this,"editMapAttr",this.editMapAttr);
         return _loc1_;
      }
      
      public function __editMapAttr_click(param1:MouseEvent) : void
      {
         this.onEditMap(param1);
      }
      
      private function _TMXObserve_Button3_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.right = 160;
         _loc1_.label = "预览";
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("click",this.__preview_click);
         _loc1_.id = "preview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.preview = _loc1_;
         BindingManager.executeBindings(this,"preview",this.preview);
         return _loc1_;
      }
      
      public function __preview_click(param1:MouseEvent) : void
      {
         this.onShowFianlMap(param1);
      }
      
      private function _TMXObserve_HSlider1_i() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.right = 5;
         _loc1_.maximum = 2;
         _loc1_.minimum = 0.2;
         _loc1_.stepSize = 0.01;
         _loc1_.value = 1;
         _loc1_.focusEnabled = false;
         _loc1_.verticalCenter = 0;
         _loc1_.addEventListener("change",this.__slider_change);
         _loc1_.id = "slider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.slider = _loc1_;
         BindingManager.executeBindings(this,"slider",this.slider);
         return _loc1_;
      }
      
      public function __slider_change(param1:Event) : void
      {
         this.onSizeChange(false);
      }
      
      private function _TMXObserve_Label2_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.right = 110;
         _loc1_.text = "缩放：";
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TMXObserve_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.top = 3;
         _loc1_.left = 3;
         _loc1_.percentWidth = 100;
         _loc1_.mxmlContent = [this._TMXObserve_TabBar2_i(),this._TMXObserve_Line1_c(),this._TMXObserve_Line2_c(),this._TMXObserve_ViewStack2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TMXObserve_TabBar2_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",IconTabBarSkin);
         _loc1_.addEventListener("change",this.___TMXObserve_TabBar2_change);
         _loc1_.id = "_TMXObserve_TabBar2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TMXObserve_TabBar2 = _loc1_;
         BindingManager.executeBindings(this,"_TMXObserve_TabBar2",this._TMXObserve_TabBar2);
         return _loc1_;
      }
      
      public function ___TMXObserve_TabBar2_change(param1:IndexChangeEvent) : void
      {
         this.onToolViewSelectChange();
      }
      
      private function _TMXObserve_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 0;
         _loc1_.xTo = 0;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 26;
         _loc1_.stroke = this._TMXObserve_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TMXObserve_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _TMXObserve_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 0;
         _loc1_.xTo = 0;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 26;
         _loc1_.stroke = this._TMXObserve_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _TMXObserve_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _TMXObserve_ViewStack2_i() : ViewStack
      {
         var temp:ViewStack = new ViewStack();
         temp.id = "toolView";
         if(!temp.document)
         {
            temp.document = this;
         }
         temp.mx_internal::_documentDescriptor = new UIComponentDescriptor({
            "type":ViewStack,
            "id":"toolView",
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":SpriteTools,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"元素编辑（V）",
                        "icon":_embed_mxml_tmxtools_select_png_1893312406
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":DrawTools,
                  "id":"drawTools",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"绘制笔（B）",
                        "icon":_embed_mxml_tmxtools_pencil_png_1597401960
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":MapRectTools,
                  "id":"mapDrawTools",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"地基编辑（M）",
                        "icon":_embed_mxml_tmxtools_map_pencil_png_1594940130
                     };
                  }
               })]};
            }
         });
         temp.mx_internal::_documentDescriptor.document = this;
         this.toolView = temp;
         BindingManager.executeBindings(this,"toolView",this.toolView);
         return temp;
      }
      
      public function ___TMXObserve_RefObserve1_addedToStage(param1:Event) : void
      {
         this.onInit();
      }
      
      private function _TMXObserve_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_TMXObserve_TabBar1.dataProvider","spritePool");
         _loc1_[1] = new Binding(this,null,null,"_TMXObserve_TabBar2.dataProvider","toolView");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get attribute() : AttributeView
      {
         return this._13085340attribute;
      }
      
      public function set attribute(param1:AttributeView) : void
      {
         var _loc2_:Object = this._13085340attribute;
         if(_loc2_ !== param1)
         {
            this._13085340attribute = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"attribute",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drawGroup() : Group
      {
         return this._124552091drawGroup;
      }
      
      public function set drawGroup(param1:Group) : void
      {
         var _loc2_:Object = this._124552091drawGroup;
         if(_loc2_ !== param1)
         {
            this._124552091drawGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"drawGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get drawTools() : DrawTools
      {
         return this._136468215drawTools;
      }
      
      public function set drawTools(param1:DrawTools) : void
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
      public function get editMapAttr() : Button
      {
         return this._1575743485editMapAttr;
      }
      
      public function set editMapAttr(param1:Button) : void
      {
         var _loc2_:Object = this._1575743485editMapAttr;
         if(_loc2_ !== param1)
         {
            this._1575743485editMapAttr = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editMapAttr",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get layers() : LayerContent
      {
         return this._1109732030layers;
      }
      
      public function set layers(param1:LayerContent) : void
      {
         var _loc2_:Object = this._1109732030layers;
         if(_loc2_ !== param1)
         {
            this._1109732030layers = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"layers",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapDarw() : UIComponent
      {
         return this._836238078mapDarw;
      }
      
      public function set mapDarw(param1:UIComponent) : void
      {
         var _loc2_:Object = this._836238078mapDarw;
         if(_loc2_ !== param1)
         {
            this._836238078mapDarw = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapDarw",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mapDrawTools() : MapRectTools
      {
         return this._285284603mapDrawTools;
      }
      
      public function set mapDrawTools(param1:MapRectTools) : void
      {
         var _loc2_:Object = this._285284603mapDrawTools;
         if(_loc2_ !== param1)
         {
            this._285284603mapDrawTools = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mapDrawTools",_loc2_,param1));
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
      public function get preview() : Button
      {
         return this._318184504preview;
      }
      
      public function set preview(param1:Button) : void
      {
         var _loc2_:Object = this._318184504preview;
         if(_loc2_ !== param1)
         {
            this._318184504preview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"preview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get runGame() : Button
      {
         return this._1549614365runGame;
      }
      
      public function set runGame(param1:Button) : void
      {
         var _loc2_:Object = this._1549614365runGame;
         if(_loc2_ !== param1)
         {
            this._1549614365runGame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"runGame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scenario() : ScenarioSpritePool
      {
         return this._775588976scenario;
      }
      
      public function set scenario(param1:ScenarioSpritePool) : void
      {
         var _loc2_:Object = this._775588976scenario;
         if(_loc2_ !== param1)
         {
            this._775588976scenario = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scenario",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scrollerView() : Scroller
      {
         return this._226003457scrollerView;
      }
      
      public function set scrollerView(param1:Scroller) : void
      {
         var _loc2_:Object = this._226003457scrollerView;
         if(_loc2_ !== param1)
         {
            this._226003457scrollerView = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scrollerView",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get slider() : HSlider
      {
         return this._899647263slider;
      }
      
      public function set slider(param1:HSlider) : void
      {
         var _loc2_:Object = this._899647263slider;
         if(_loc2_ !== param1)
         {
            this._899647263slider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"slider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get spritePool() : ViewStack
      {
         return this._1531585665spritePool;
      }
      
      public function set spritePool(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1531585665spritePool;
         if(_loc2_ !== param1)
         {
            this._1531585665spritePool = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"spritePool",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolView() : ViewStack
      {
         return this._983528355toolView;
      }
      
      public function set toolView(param1:ViewStack) : void
      {
         var _loc2_:Object = this._983528355toolView;
         if(_loc2_ !== param1)
         {
            this._983528355toolView = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolView",_loc2_,param1));
            }
         }
      }
   }
}

