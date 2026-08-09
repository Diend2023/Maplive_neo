package
{
   import flash.display.LoaderInfo;
   import flash.system.ApplicationDomain;
   import flash.system.Security;
   import flash.utils.Dictionary;
   import flashx.textLayout.compose.ISWFContext;
   import mx.core.IFlexModule;
   import mx.core.IFlexModuleFactory;
   import mx.events.RSLEvent;
   import mx.managers.SystemManager;
   import mx.preloaders.SparkDownloadProgressBar;
   import flash.events.Event; //
   import flash.events.TimerEvent; //
   import flash.utils.Timer; //
   import mx.core.mx_internal; //
   import mx.events.FlexEvent; //
   
   public class _Maplive_mx_managers_SystemManager extends SystemManager implements IFlexModuleFactory, ISWFContext
   {

      use namespace mx_internal; //

      private static var _linkage:Array = [Maplive, _Maplive_FlexInit, _Maplive_Styles, _MapliveWatcherSetupUtil, _mx_skins_spark_PanelBorderSkinWatcherSetupUtil, _spark_skins_spark_HSliderSkinInnerClass0WatcherSetupUtil, _spark_skins_spark_ImageLoadingSkinWatcherSetupUtil, _spark_skins_spark_PanelSkinWatcherSetupUtil, _views_ActionViewWatcherSetupUtil, _views_alert_AddNewPoltCodeWatcherSetupUtil, _views_alert_AddNewPoltMessageWatcherSetupUtil, _views_alert_AddNewPoltSelectWatcherSetupUtil, _views_attribute_child_MoveAttributeWatcherSetupUtil, _views_attribute_ElementAttributeWatcherSetupUtil, _views_attribute_MapAttributeWatcherSetupUtil, _views_attribute_SkillAttributeWatcherSetupUtil, _views_observe_map_AddLayerViewWatcherSetupUtil, _views_observe_map_LayerContentWatcherSetupUtil, _views_observe_role_RoleStageWatcherSetupUtil, _views_observe_role_RuntimeConfigWatcherSetupUtil, _views_observe_role_TimeLineWatcherSetupUtil, _views_observe_StoreObserveWatcherSetupUtil, _views_observe_TextObserveWatcherSetupUtil, _views_observe_TMXObserveWatcherSetupUtil, _views_ProjectResourcesWatcherSetupUtil, _views_ScenarioSpritePoolWatcherSetupUtil, _views_SelectElementViewWatcherSetupUtil, _views_tools_MapRectToolsWatcherSetupUtil]; //
      
      private var _info:Object;
      
      private var _preloadedRSLs:Dictionary;
      
      private var _allowDomainParameters:Vector.<Array>;
      
      private var _allowInsecureDomainParameters:Vector.<Array>;

      private var forceKickOffRegistered:Boolean = false; //
      
      private var forceKickOffDone:Boolean = false; //
      
      public function _Maplive_mx_managers_SystemManager()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStageForSingleFrameFix); //
      }
      
      override public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true) : *
      {
         if(param4)
         {
            return param1.apply(param2,param3);
         }
         param1.apply(param2,param3);
      }
      
      override public function create(... rest) : Object
      {
         if(rest.length > 0 && !(rest[0] is String))
         {
            return super.create.apply(this,rest);
         }
         var _loc2_:String = rest.length == 0 ? "Maplive" : String(rest[0]);
         var _loc3_:Class = Class(getDefinitionByName(_loc2_));
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:Object = new _loc3_();
         if(_loc4_ is IFlexModule)
         {
            IFlexModule(_loc4_).moduleFactory = this;
         }
         return _loc4_;
      }
      
      override public function info() : Object
      {
         if(!this._info)
         {
            this._info = {
               "backgroundColor":"0x504F5E",
               "closing":"windowedapplication1_closingHandler(event)",
               "compiledLocales":["en_US"],
               "compiledResourceBundleNames":["SharedResources","collections","components","containers","controls","core","effects","formatters","layout","skins","sparkEffects","styles","textLayout"],
               "currentDomain":ApplicationDomain.currentDomain,
               "enterFrame":"onFrame(event)",
               "frameRate":"60",
               "initialize":"onInit();",
               "mainClassName":"Maplive",
               "mixins":["_Maplive_FlexInit","_Maplive_Styles","mx.managers.systemClasses.ActiveWindowManager","mx.messaging.config.LoaderConfig"],
               "preloader":SparkDownloadProgressBar,
               "preloaderChromeColor":"#000000",
               "render":"onRender(event)",
               "showStatusBar":"false"
            };
         }
         return this._info;
      }
      
      override public function get preloadedRSLs() : Dictionary
      {
         if(this._preloadedRSLs == null)
         {
            this._preloadedRSLs = new Dictionary(true);
         }
         return this._preloadedRSLs;
      }
      
      override public function allowDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowDomainParameters)
         {
            this._allowDomainParameters = new Vector.<Array>();
         }
         this._allowDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      override public function allowInsecureDomain(... rest) : void
      {
         var _loc2_:Object = null;
         Security.allowInsecureDomain.apply(null,rest);
         for(_loc2_ in this._preloadedRSLs)
         {
            if(Boolean(_loc2_.content) && "allowInsecureDomainInRSL" in _loc2_.content)
            {
               _loc2_.content["allowInsecureDomainInRSL"].apply(null,rest);
            }
         }
         if(!this._allowInsecureDomainParameters)
         {
            this._allowInsecureDomainParameters = new Vector.<Array>();
         }
         this._allowInsecureDomainParameters.push(rest);
         addEventListener(RSLEvent.RSL_ADD_PRELOADED,this.addPreloadedRSLHandler,false,50);
      }
      
      private function addPreloadedRSLHandler(param1:RSLEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:LoaderInfo = param1.loaderInfo;
         if(!_loc2_ || !_loc2_.content)
         {
            return;
         }
         if(allowDomainsInNewRSLs && Boolean(this._allowDomainParameters))
         {
            for each(_loc3_ in this._allowDomainParameters)
            {
               if("allowDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
         if(allowInsecureDomainsInNewRSLs && Boolean(this._allowInsecureDomainParameters))
         {
            for each(_loc3_ in this._allowInsecureDomainParameters)
            {
               if("allowInsecureDomainInRSL" in _loc2_.content)
               {
                  _loc2_.content["allowInsecureDomainInRSL"].apply(null,_loc3_);
               }
            }
         }
      }

      private function onAddedToStageForSingleFrameFix(param1:Event) : void
      { //
         var _loc1_:Timer = new Timer(500,20); //
         _loc1_.addEventListener(TimerEvent.TIMER,this.forceKickOffTick); //
         _loc1_.start(); //
      } //

      private function forceKickOffTick(param1:TimerEvent) : void
      { //
         if(this.forceKickOffDone) //
         { //
            return; //
         } //
         if(!this.mx_internal::preloader) //
         { //
            return; //
         } //
         var _loc1_:Boolean = false; //
         try //
         { //
            _loc1_ = this.loaderInfo.bytesLoaded >= this.loaderInfo.bytesTotal && this.loaderInfo.bytesTotal > 0; //
         } //
         catch(e:Error) //
         { //
            _loc1_ = false; //
         } //
         if(!this.forceKickOffRegistered) //
         { //
            this.forceKickOffRegistered = true; //
            this.mx_internal::preloader.addEventListener(FlexEvent.PRELOADER_DOC_FRAME_READY,this.forceKickOffHandler); //
         } //
         if(this.totalFrames == 1 && _loc1_ && !this.document) //
         { //
            this.forceKickOffDone = true; //
            this.mx_internal::kickOff(); //
         } //
      } //

      private function forceKickOffHandler(param1:Event) : void
      { //
         if(this.totalFrames == 1 && !this.document) //
         { //
            this.forceKickOffDone = true; //
            this.mx_internal::kickOff(); //
         } //
      } //

   }
}

