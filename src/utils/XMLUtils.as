package utils
{
   import mx.collections.ArrayCollection;
   import mx.collections.XMLListCollection;
   import mx.controls.Alert;
   import tmx.PoltDisplay;
   
   public class XMLUtils
   {
      
      public static const ACT_VALUE:Array = ["turn","name","soundName","sound","effects","gox","goy","isApplyGoPoint","hitPoint","hitX","hitY","straight","stop","hitEffect","hitInterval","mFight","wFight","isHitMapGoOn","vibration","key","cd","type","dieSound","fps","scale","unhit","golden","other","msg","cardFrame","vibrationSize","mapVibrationSize","mapVibrationTime","hitEffectName"];
      
      public function XMLUtils()
      {
         super();
      }
      
      public static function createMessage(param1:XML, param2:PoltDisplay, param3:String, param4:String, param5:Boolean = false) : void
      {
         var _loc6_:XML = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:XML = null;
         if(param5)
         {
            _loc6_ = <as3/>;
            _loc6_.@message = param3;
            _loc6_.@target = param2 ? param2.currentInstanceName : "self";
            pushXml(param1,_loc6_,param4);
         }
         else
         {
            _loc7_ = param5 ? [param3] : param3.split("\n");
            _loc8_ = 0;
            while(_loc8_ < _loc7_.length)
            {
               _loc9_ = <m/>;
               _loc9_.@message = _loc7_[_loc8_];
               _loc9_.@target = param2 ? param2.currentInstanceName : "self";
               pushXml(param1,_loc9_,param4);
               param1 = _loc9_;
               param4 = "down";
               _loc8_++;
            }
         }
      }
      
      public static function createSelect(param1:XML, param2:String, param3:Array, param4:String) : void
      {
         var _loc7_:XML = null;
         var _loc5_:XML = <select/>;
         _loc5_.@message = param2;
         var _loc6_:int = 0;
         while(_loc6_ < param3.length)
         {
            if(param3[_loc6_] != null && param3[_loc6_] != "")
            {
               _loc7_ = <s/>;
               _loc7_.@message = param3[_loc6_];
               _loc5_.appendChild(_loc7_);
            }
            _loc6_++;
         }
         pushXml(param1,_loc5_,param4);
      }
      
      public static function pushXml(param1:XML, param2:XML, param3:String) : void
      {
         var _loc4_:XMLList = null;
         var _loc5_:Object = null;
         if(param1.localName() == "polt" || param1.localName() == "s")
         {
            param3 = null;
         }
         if(param3 == null)
         {
            param1.appendChild(param2);
         }
         else if(param3 == "up")
         {
            param1.parent().insertChildBefore(param1,param2);
         }
         else if(param3 == "down")
         {
            param1.parent().insertChildAfter(param1,param2);
         }
         else if(param3 == "update")
         {
            _loc4_ = param2.attributes();
            for(_loc5_ in _loc4_)
            {
               param1[_loc4_[_loc5_].name()] = param2[_loc4_[_loc5_].name()];
            }
         }
      }
      
      public static function deleteData(param1:XML) : void
      {
         if(!param1)
         {
            Alert.show("无法删除空对象","错误");
            return;
         }
         if(param1.localName() == "polt")
         {
            Alert.show("不能删除根目录","错误");
            return;
         }
         var _loc2_:XMLList = XMLList(param1.parent()).children();
         var _loc3_:XMLListCollection = new XMLListCollection(_loc2_);
         var _loc4_:Number = _loc3_.getItemIndex(param1);
         _loc3_.removeItemAt(_loc4_);
      }
      
      public static function optimizes(param1:XMLList) : void
      {
         var _loc2_:Object = null;
         var _loc3_:XMLList = null;
         for(_loc2_ in param1)
         {
            optimize(param1[_loc2_]);
            _loc3_ = param1[_loc2_].children();
            if(_loc3_.length() > 0)
            {
               optimizes(_loc3_);
            }
         }
      }
      
      public static function optimize(param1:XML) : void
      {
         var _loc2_:XMLList = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         _loc2_ = param1.attributes();
         _loc3_ = 0;
         for(; _loc3_ < _loc2_.length(); _loc3_++)
         {
            if(ACT_VALUE.indexOf(String(_loc2_[_loc3_].name())) != -1)
            {
               continue;
            }
            switch(String(_loc2_[_loc3_].name()))
            {
               case "asA":
                  _loc4_ = param1[_loc2_[_loc3_].name()];
                  delete param1[_loc2_[_loc3_].name()];
                  param1.@stop = _loc4_;
                  return;
               default:
                  delete param1[_loc2_[_loc3_].name()];
            }
         }
      }
      
      public static function getArrayDataFormXml(param1:XML, param2:String) : ArrayCollection
      {
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         param1 = param1.copy();
         var _loc3_:XMLList = param1[param2];
         if(_loc3_)
         {
            _loc3_ = _loc3_.children();
            _loc4_ = [];
            for(_loc5_ in _loc3_)
            {
               _loc4_.push(_loc3_[_loc5_]);
            }
            return new ArrayCollection(_loc4_);
         }
         return null;
      }
   }
}

