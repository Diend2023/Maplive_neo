package tmx
{
   public class TMXData
   {
      
      public function TMXData()
      {
         super();
      }
      
      public static function repair(param1:String) : XML
      {
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:XML = new XML(param1);
         var _loc3_:XMLList = _loc2_.properties.child("property");
         for(_loc4_ in _loc3_)
         {
            if(_loc3_[_loc4_].@name == "extend")
            {
               _loc5_ = JSON.parse(_loc3_[_loc4_].@value);
               repairObject(_loc5_);
               _loc3_[_loc4_].@value = JSON.stringify(_loc5_);
            }
         }
         return _loc2_;
      }
      
      private static function repairObject(param1:Object) : void
      {
         var _loc2_:Object = null;
         for(_loc2_ in param1)
         {
            if(String(_loc2_) == "path")
            {
               param1[_loc2_] = (param1[_loc2_] as String).split("\\").join("/");
            }
            else if(param1[_loc2_] is Object || param1[_loc2_] is Array)
            {
               repairObject(param1[_loc2_]);
            }
         }
      }
   }
}

