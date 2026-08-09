package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.*;
   import flash.utils.*;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.ColorPickerAccImpl;
   import mx.accessibility.ComboBaseAccImpl;
   import mx.accessibility.LabelAccImpl;
   import mx.accessibility.ListAccImpl;
   import mx.accessibility.ListBaseAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.TreeAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.managers.systemClasses.ChildManager;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.ButtonBarBaseAccImpl;
   import spark.accessibility.ButtonBaseAccImpl;
   import spark.accessibility.CheckBoxAccImpl;
   import spark.accessibility.DropDownListBaseAccImpl;
   import spark.accessibility.ListAccImpl;
   import spark.accessibility.ListBaseAccImpl;
   import spark.accessibility.NumericStepperAccImpl;
   import spark.accessibility.PanelAccImpl;
   import spark.accessibility.RadioButtonAccImpl;
   import spark.accessibility.RichEditableTextAccImpl;
   import spark.accessibility.SliderBaseAccImpl;
   import spark.accessibility.SpinnerAccImpl;
   import spark.accessibility.TabBarAccImpl;
   import spark.accessibility.TextBaseAccImpl;
   import spark.accessibility.ToggleButtonAccImpl;
   
   public class _Maplive_FlexInit
   {
      
      public function _Maplive_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleNames:Array;
         var i:int;
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("closeEffect","windowClose");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("itemsChangeEffect","itemsChange");
         EffectManager.mx_internal::registerEffectTrigger("minimizeEffect","windowMinimize");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         EffectManager.mx_internal::registerEffectTrigger("unminimizeEffect","windowUnminimize");
         if(Capabilities.hasAccessibility)
         {
            mx.accessibility.PanelAccImpl.enableAccessibility();
            SpinnerAccImpl.enableAccessibility();
            NumericStepperAccImpl.enableAccessibility();
            RadioButtonAccImpl.enableAccessibility();
            mx.accessibility.ListAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            LabelAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            ButtonBarBaseAccImpl.enableAccessibility();
            ColorPickerAccImpl.enableAccessibility();
            SliderBaseAccImpl.enableAccessibility();
            mx.accessibility.ListBaseAccImpl.enableAccessibility();
            TreeAccImpl.enableAccessibility();
            ButtonBaseAccImpl.enableAccessibility();
            spark.accessibility.ListBaseAccImpl.enableAccessibility();
            ToggleButtonAccImpl.enableAccessibility();
            TabBarAccImpl.enableAccessibility();
            RichEditableTextAccImpl.enableAccessibility();
            spark.accessibility.PanelAccImpl.enableAccessibility();
            spark.accessibility.ListAccImpl.enableAccessibility();
            CheckBoxAccImpl.enableAccessibility();
            DropDownListBaseAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
            ComboBaseAccImpl.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         styleNames = ["lineHeight","unfocusedTextSelectionColor","kerning","iconColor","listAutoPadding","textDecoration","showErrorTip","dominantBaseline","fontThickness","textShadowColor","depthColors","blockProgression","textAlignLast","listStylePosition","textShadowAlpha","textAlpha","chromeColor","rollOverColor","fontSize","shadowColor","paragraphEndIndent","fontWeight","breakOpportunity","leading","renderingMode","symbolColor","paragraphStartIndent","layoutDirection","footerColors","contentBackgroundColor","paragraphSpaceAfter","digitWidth","ligatureLevel","touchDelay","firstBaselineOffset","fontLookup","paragraphSpaceBefore","fontFamily","strokeWidth","lineThrough","alignmentBaseline","trackingLeft","fontStyle","dropShadowColor","accentColor","selectionColor","disabledIconColor","textJustify","focusColor","alternatingItemColors","typographicCase","highlightColor","showErrorSkin","textRollOverColor","digitCase","inactiveTextSelectionColor","shadowCapColor","justificationRule","dividerColor"
         ,"trackingRight","leadingModel","selectionDisabledColor","letterSpacing","focusedTextSelectionColor","baselineShift","strokeColor","fontSharpness","barColor","modalTransparencyDuration","justificationStyle","listStyleType","wordSpacing","contentBackgroundAlpha","textRotation","fontAntiAliasType","direction","cffHinting","errorColor","locale","backgroundDisabledColor","modalTransparencyColor","showPromptWhenFocused","textIndent","clearFloats","themeColor","tabStops","modalTransparency","textAlign","headerColors","textSelectedColor","interactionMode","whiteSpaceCollapse","fontGridFitType","disabledColor","modalTransparencyBlur","downColor","color"];
         i = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}

import mx.core.TextFieldFactory;

TextFieldFactory;

