package views.tools
{
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
   import mx.containers.ViewStack;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.graphics.SolidColorStroke;
   import mx.styles.*;
   import skins.IconButtonSkin;
   import skins.IconTabBarSkin;
   import spark.components.Button;
   import spark.components.HGroup;
   import spark.components.NavigatorContent;
   import spark.components.TabBar;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   import tmx.MapSpriteMode;
   
   use namespace mx_internal;
   
   public class MapRectTools extends NavigatorContent implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      public var _MapRectTools_TabBar1:TabBar;
      
      private var _983528355toolView:ViewStack;
      
      private var _110621496trash:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml_tmxtools_fk_png_1637161448:Class;
      
      private var _embed_mxml_tmxtools_draw_png_1940100410:Class;
      
      private var _embed_mxml_tmxtools_steps_png_1050951974:Class;
      
      private var _embed_mxml_tmxtools_maprect_png_1808628680:Class;
      
      private var _embed_mxml_tmxtools_rect_png_2007209530:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function MapRectTools()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml_tmxtools_fk_png_1637161448 = MapRectTools__embed_mxml_tmxtools_fk_png_1637161448;
         this._embed_mxml_tmxtools_draw_png_1940100410 = MapRectTools__embed_mxml_tmxtools_draw_png_1940100410;
         this._embed_mxml_tmxtools_steps_png_1050951974 = MapRectTools__embed_mxml_tmxtools_steps_png_1050951974;
         this._embed_mxml_tmxtools_maprect_png_1808628680 = MapRectTools__embed_mxml_tmxtools_maprect_png_1808628680;
         this._embed_mxml_tmxtools_rect_png_2007209530 = MapRectTools__embed_mxml_tmxtools_rect_png_2007209530;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._MapRectTools_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_tools_MapRectToolsWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return MapRectTools[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.height = 26;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._MapRectTools_Array1_c);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         MapRectTools._watcherSetupUtil = param1;
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
      
      public function onChange() : void
      {
         this.trash.enabled = this.toolView.selectedIndex == 0;
         this.dispatchEvent(new OpenEvent(OpenEvent.TRASH_DRAW));
      }
      
      public function isDrawMode() : Boolean
      {
         if(!this.toolView)
         {
            // return null;
            return false; //
         }
         return this.toolView.selectedIndex != 0;
      }
      
      public function getDrawMode() : String
      {
         switch(this.toolView.selectedIndex)
         {
            case 4:
            case 1:
               return MapSpriteMode.NOT_PENETRATE;
            case 2:
               return MapSpriteMode.VISIBLE_STES;
            case 3:
               return MapSpriteMode.NOT_VISIBLE_STES;
            default:
               return null;
         }
      }
      
      private function _MapRectTools_Array1_c() : Array
      {
         return [this._MapRectTools_HGroup1_c(),this._MapRectTools_ViewStack1_i()];
      }
      
      private function _MapRectTools_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._MapRectTools_TabBar1_i(),this._MapRectTools_Line1_c(),this._MapRectTools_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _MapRectTools_TabBar1_i() : TabBar
      {
         var _loc1_:TabBar = new TabBar();
         _loc1_.setStyle("skinClass",IconTabBarSkin);
         _loc1_.addEventListener("change",this.___MapRectTools_TabBar1_change);
         _loc1_.id = "_MapRectTools_TabBar1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._MapRectTools_TabBar1 = _loc1_;
         BindingManager.executeBindings(this,"_MapRectTools_TabBar1",this._MapRectTools_TabBar1);
         return _loc1_;
      }
      
      public function ___MapRectTools_TabBar1_change(param1:IndexChangeEvent) : void
      {
         this.onChange();
      }
      
      private function _MapRectTools_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.xFrom = 0;
         _loc1_.xTo = 0;
         _loc1_.yFrom = 0;
         _loc1_.yTo = 26;
         _loc1_.stroke = this._MapRectTools_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _MapRectTools_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _MapRectTools_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 26;
         _loc1_.height = 26;
         _loc1_.setStyle("skinClass",IconButtonSkin);
         _loc1_.setStyle("icon","tmxtools/trash.png");
         _loc1_.addEventListener("click",this.__trash_click);
         _loc1_.id = "trash";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.trash = _loc1_;
         BindingManager.executeBindings(this,"trash",this.trash);
         return _loc1_;
      }
      
      public function __trash_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new OpenEvent(OpenEvent.TRASH));
      }
      
      private function _MapRectTools_ViewStack1_i() : ViewStack
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
                  "type":NavigatorContent,
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"编辑地形",
                        "icon":_embed_mxml_tmxtools_rect_png_2007209530
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"bottom",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"绘制地形",
                        "icon":_embed_mxml_tmxtools_maprect_png_1808628680
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"bottom",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"绘制台阶",
                        "icon":_embed_mxml_tmxtools_steps_png_1050951974
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"bottom",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"绘制隐藏台阶",
                        "icon":_embed_mxml_tmxtools_draw_png_1940100410
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":NavigatorContent,
                  "id":"bottom",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "label":"绘制方块",
                        "icon":_embed_mxml_tmxtools_fk_png_1637161448
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
      
      private function _MapRectTools_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_MapRectTools_TabBar1.dataProvider","toolView");
         return _loc1_;
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
      
      [Bindable(event="propertyChange")]
      public function get trash() : Button
      {
         return this._110621496trash;
      }
      
      public function set trash(param1:Button) : void
      {
         var _loc2_:Object = this._110621496trash;
         if(_loc2_ !== param1)
         {
            this._110621496trash = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"trash",_loc2_,param1));
            }
         }
      }
   }
}

