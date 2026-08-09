package views
{
   import events.OpenEvent;
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
   import mx.controls.Alert;
   import mx.controls.Tree;
   import mx.controls.treeClasses.TreeItemRenderer;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.CloseEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.filters.*;
   import mx.managers.PopUpManager;
   import mx.styles.*;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.TextInput;
   import spark.components.VGroup;
   import spark.events.TextOperationEvent;
   import utils.BatchMaps;
   import utils.FileUtils;
   import utils.ProjectUtils;
   import utils.RightUtils;
   import utils.XMLUtils;
   import views.alert.AddRoleProject;
   import views.alert.CreateTMX;
   import views.alert.ImportABPkg;
   import views.alert.ImportEffect;
   import views.observe.map.SwfApplicationWindow;
   
   use namespace mx_internal;
   
   public class ProjectResources extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      private var _3143097find:TextInput;
      
      private var _3568542tree:Tree;
      
      private var _1946267551xmlData:XML;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      // public const map:Class;
      public var map:Class; //
      
      // public const picture:Class;
      public var picture:Class; //
      
      // public const documentContent:Class;
      public var documentContent:Class; //
      
      // public const sound:Class;
      public var sound:Class; //
      
      // public const codeDir:Class;
      public var codeDir:Class; //
      
      // public const code:Class;
      public var code:Class; //
      
      // public const folder:Class;
      public var folder:Class; //
      
      // public const map_start:Class;
      public var map_start:Class; //
      
      // public const fight:Class;
      public var fight:Class; //
      
      private var _findXmlData:XML;
      
      mx_internal var _ProjectResources_StylesInit_done:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ProjectResources()
      {
         var bindings:Array;
         var watchers:Array;
         var i:uint;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.map = ProjectResources_map;
         this.picture = ProjectResources_picture;
         this.documentContent = ProjectResources_documentContent;
         this.sound = ProjectResources_sound;
         this.codeDir = ProjectResources_codeDir;
         this.code = ProjectResources_code;
         this.folder = ProjectResources_folder;
         this.map_start = ProjectResources_map_start;
         this.fight = ProjectResources_fight;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._ProjectResources_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_views_ProjectResourcesWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ProjectResources[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.minWidth = 40;
         this.mxmlContent = [this._ProjectResources_VGroup1_c()];
         this._ProjectResources_XML1_i();
         this.addEventListener("initialize",this.___ProjectResources_Group1_initialize);
         i = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ProjectResources._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         mx_internal::_ProjectResources_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function doubleClick(param1:MouseEvent) : void
      {
         if(!this.tree.selectedItem)
         {
            return;
         }
         if(XML(this.tree.selectedItem).localName() != "file")
         {
            return;
         }
         var _loc2_:String = this.tree.selectedItem.@file;
         if(!_loc2_)
         {
            return;
         }
         this.dispatchEvent(new OpenEvent(OpenEvent.OPEN,new File(_loc2_)));
      }
      
      protected function onInit(param1:FlexEvent) : void
      {
         var event:FlexEvent = param1;
         callLater(function():void
         {
            RightUtils.onRightClick(tree,"porjectRef");
         });
         this.addEventListener(RightClickEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:RightClickEvent) : void
      {
         var create:CreateTMX = null;
         var arr:Object = null;
         var effectFile:File = null;
         var e:RightClickEvent = param1;
         switch(e.clickTag)
         {
            case "测试":
               SwfApplicationWindow.run(new File((this.tree.selectedItem as XML).@file).name,null,800,550);
               break;
            case "刷新":
               this.onRefresh(null);
               break;
            case "新建地图":
               create = new CreateTMX();
               create.back = this.onFilePut;
               PopUpManager.addPopUp(create,this,true);
               break;
            case "删除":
               this.removeFile(this.tree.selectedItem as XML);
               break;
            case "设置为启动地图":
               if(this.tree.selectedItem)
               {
                  ProjectUtils.mainMap = new File((this.tree.selectedItem as XML).@file).name;
               }
               arr = this.tree.openItems;
               this.tree.dataProvider = this.tree.dataProvider;
               this.tree.openItems = arr;
               break;
            case "导入AB人物包":
               PopUpManager.addPopUp(new ImportABPkg(),this,true);
               break;
            case "新增战斗人物":
               PopUpManager.addPopUp(new AddRoleProject(),this,true);
               break;
            case "导入特效":
               effectFile = new File();
               effectFile.browseForOpen("选择你的特效文件",[new FileFilter("*.gif","*.gif","*.gof")]);
               effectFile.addEventListener(Event.SELECT,function(param1:Event):void
               {
                  importEffect(param1.target as File);
               });
               break;
            case "批量导出小地图":
               this.batchMaps();
         }
      }
      
      public function batchMaps() : void
      {
         new BatchMaps();
      }
      
      public function importEffect(param1:File) : void
      {
         var _loc2_:ImportEffect = new ImportEffect();
         _loc2_._file = param1;
         PopUpManager.addPopUp(_loc2_,this,true);
      }
      
      private function removeFile(param1:XML) : void
      {
         var xml:XML = param1;
         if(!xml)
         {
            Alert.show("请选择要删除的文件","提示");
            return;
         }
         Alert.show("是否删除" + xml.@label,"删除提示",Alert.YES | Alert.NO,null,function(param1:CloseEvent):void
         {
            var _loc2_:File = null;
            if(param1.detail == Alert.YES)
            {
               _loc2_ = new File(xml.@file);
               if(_loc2_.exists)
               {
                  _loc2_.deleteFile();
               }
               XMLUtils.deleteData(xml);
            }
         });
      }
      
      private function onFilePut(param1:File, param2:String) : void
      {
         this.onRefresh(null);
         this.dispatchEvent(new OpenEvent(OpenEvent.OPEN,param1));
      }
      
      private function iconFunction(param1:XML) : Class
      {
         if(ProjectUtils.cheakIsMainMap(String(param1.@file)))
         {
            return this.map_start;
         }
         if(param1.@icon != undefined && String(param1.@icon) != "" && Boolean(this[param1.@icon]))
         {
            return this[param1.@icon];
         }
         return this.folder;
      }
      
      protected function onUpdateRightMenu(param1:MouseEvent) : void
      {
         var _loc2_:TreeItemRenderer = param1.target as TreeItemRenderer;
         if(!_loc2_)
         {
            _loc2_ = param1.target.parent as TreeItemRenderer;
         }
         if(_loc2_)
         {
            this.tree.selectedItem = _loc2_.data;
            (this.tree.contextMenu.items[6] as NativeMenuItem).enabled = String(this.tree.selectedItem.@icon).length != 0;
            (this.tree.contextMenu.items[5] as NativeMenuItem).enabled = String(this.tree.selectedItem.@file).indexOf(".tmx") != -1;
         }
      }
      
      public function openRoot() : void
      {
         this.tree.openItems = [this.xmlData];
      }
      
      public function openAll(param1:XML) : Array
      {
         var _loc4_:Object = null;
         var _loc2_:Array = [param1];
         var _loc3_:XMLList = param1.children();
         for(_loc4_ in _loc3_)
         {
            if(XML(_loc3_[_loc4_]).hasComplexContent())
            {
               _loc2_ = _loc2_.concat(this.openAll(_loc3_[_loc4_]));
            }
         }
         return _loc2_;
      }
      
      protected function onRefresh(param1:MouseEvent) : void
      {
         var opens:Array = null;
         var event:MouseEvent = param1;
         opens = this.tree.openItems as Array;
         this.xmlData = FileUtils.fileToXml(App.projectFile);
         callLater(function():void
         {
            var _loc2_:Object = null;
            var _loc3_:Object = null;
            tree.expandItem(xmlData,true);
            var _loc1_:XMLList = xmlData.child("*");
            for(_loc2_ in opens)
            {
               for(_loc3_ in _loc1_)
               {
                  if(String(_loc1_[_loc3_].@file) == String(opens[_loc2_].@file))
                  {
                     tree.expandItem(_loc1_[_loc3_],true);
                  }
               }
            }
         });
      }
      
      protected function onXMLFind(param1:TextOperationEvent) : void
      {
         var event:TextOperationEvent = param1;
         if(this.find.text == "")
         {
            this.tree.dataProvider = this.xmlData;
            this.openRoot();
            return;
         }
         this._findXmlData = this.findXmlData(this.xmlData.copy().children());
         this.tree.dataProvider = this._findXmlData;
         callLater(function():void
         {
            tree.openItems = openAll(_findXmlData);
         });
      }
      
      private function findXmlData(param1:XMLList) : XML
      {
         var _loc3_:Object = null;
         var _loc4_:XML = null;
         var _loc2_:XML = <dic label="res"/>;
         _loc2_.@label = param1[0].parent().@label;
         for(_loc3_ in param1)
         {
            if(param1[_loc3_].hasComplexContent())
            {
               _loc4_ = this.findXmlData(param1[_loc3_].children());
               if(_loc4_.hasComplexContent())
               {
                  _loc2_.appendChild(_loc4_);
               }
            }
            else if(String(param1[_loc3_].@label).indexOf(this.find.text) != -1)
            {
               _loc2_.appendChild(param1[_loc3_].copy());
            }
         }
         return _loc2_;
      }
      
      private function _ProjectResources_XML1_i() : XML
      {
         var _loc1_:XML = <xml label="TestDemo" xmlns=""><xml label="1.tmx" xmlns=""></xml><xml label="2.tmx" xmlns=""></xml><xml label="3.tmx" xmlns=""></xml></xml>;
         this.xmlData = _loc1_;
         BindingManager.executeBindings(this,"xmlData",this.xmlData);
         return _loc1_;
      }
      
      private function _ProjectResources_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._ProjectResources_HGroup1_c(),this._ProjectResources_Tree1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProjectResources_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 90;
         _loc1_.height = 30;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._ProjectResources_Label1_c(),this._ProjectResources_TextInput1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProjectResources_Label1_c() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "搜索：";
         _loc1_.setStyle("color",16777215);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ProjectResources_TextInput1_i() : TextInput
      {
         var _loc1_:TextInput = new TextInput();
         _loc1_.percentWidth = 100;
         _loc1_.addEventListener("change",this.__find_change);
         _loc1_.id = "find";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.find = _loc1_;
         BindingManager.executeBindings(this,"find",this.find);
         return _loc1_;
      }
      
      public function __find_change(param1:TextOperationEvent) : void
      {
         this.onXMLFind(param1);
      }
      
      private function _ProjectResources_Tree1_i() : Tree
      {
         var _loc1_:Tree = new Tree();
         _loc1_.top = "";
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.labelField = "@label";
         _loc1_.styleName = "tree";
         _loc1_.doubleClickEnabled = true;
         _loc1_.setStyle("chromeColor",4144716);
         _loc1_.setStyle("rollOverColor",12237498);
         _loc1_.setStyle("focusColor",11711154);
         _loc1_.addEventListener("rightMouseDown",this.__tree_rightMouseDown);
         _loc1_.addEventListener("doubleClick",this.__tree_doubleClick);
         _loc1_.id = "tree";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.tree = _loc1_;
         BindingManager.executeBindings(this,"tree",this.tree);
         return _loc1_;
      }
      
      public function __tree_rightMouseDown(param1:MouseEvent) : void
      {
         this.onUpdateRightMenu(param1);
      }
      
      public function __tree_doubleClick(param1:MouseEvent) : void
      {
         this.doubleClick(param1);
      }
      
      public function ___ProjectResources_Group1_initialize(param1:FlexEvent) : void
      {
         this.onInit(param1);
      }
      
      private function _ProjectResources_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,null,null,"tree.dataProvider","xmlData");
         result[1] = new Binding(this,function():Function
         {
            return iconFunction;
         },null,"tree.iconFunction");
         return result;
      }
      
      mx_internal function _ProjectResources_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_ProjectResources_StylesInit_done)
         {
            return;
         }
         mx_internal::_ProjectResources_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tree");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".tree");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.contentBackgroundAlpha = 0.7;
               this.selectionColor = 9210772;
            };
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get find() : TextInput
      {
         return this._3143097find;
      }
      
      public function set find(param1:TextInput) : void
      {
         var _loc2_:Object = this._3143097find;
         if(_loc2_ !== param1)
         {
            this._3143097find = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"find",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tree() : Tree
      {
         return this._3568542tree;
      }
      
      public function set tree(param1:Tree) : void
      {
         var _loc2_:Object = this._3568542tree;
         if(_loc2_ !== param1)
         {
            this._3568542tree = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tree",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get xmlData() : XML
      {
         return this._1946267551xmlData;
      }
      
      public function set xmlData(param1:XML) : void
      {
         var _loc2_:Object = this._1946267551xmlData;
         if(_loc2_ !== param1)
         {
            this._1946267551xmlData = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"xmlData",_loc2_,param1));
            }
         }
      }
   }
}

