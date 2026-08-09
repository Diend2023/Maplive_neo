package utils
{
   import flash.display.Sprite;
   import flash.filesystem.File;
   import mx.collections.ArrayCollection;
   import tmx.SaveObject;
   import tmx.StarlingMap;
   import tmx.TargetPoint;
   
   public class SaveUtils
   {
      
      public function SaveUtils()
      {
         super();
      }
      
      public static function saveTmx(param1:StarlingMap, param2:Array, param3:File, param4:ArrayCollection) : void
      {
         var _loc7_:Object = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:XML = null;
         var _loc15_:Object = null;
         var _loc16_:String = null;
         var _loc17_:XML = null;
         var _loc18_:Boolean = false;
         var _loc19_:int = 0;
         var _loc20_:XML = null;
         if(!param3 || param3.exists == false)
         {
            return;
         }
         var _loc5_:Object = new Object();
         _loc5_.version = "0.0.2";
         var _loc6_:Array = [];
         for(_loc7_ in param2)
         {
            _loc16_ = param2[_loc7_].id;
            saveObject(_loc5_,param2[_loc7_].id,param1.getChildByName(_loc16_) as Sprite);
            _loc6_.push({
               "name":param2[_loc7_].name,
               "id":param2[_loc7_].id,
               "type":param2[_loc7_].type
            });
         }
         _loc5_.layers = _loc6_;
         dataNode(param1.dataNode,_loc5_);
         _loc8_ = [];
         for(_loc9_ in param4.source)
         {
            _loc8_.push({
               "name":param4.source[_loc9_].name,
               "path":param4.source[_loc9_].path
            });
         }
         _loc5_.scenery = _loc8_;
         _loc10_ = new XML(FileUtils.readString(param3));
         if(_loc10_.child("properties").length() == 0)
         {
            _loc17_ = <properties><property name='extend' value=''/></properties>;
            _loc10_.appendChild(_loc17_);
         }
         var _loc11_:XMLList = _loc10_.properties.children();
         if(_loc11_.length() == 0)
         {
            _loc11_.appendChild("<property name=\'extend\' value=\'" + JSON.stringify(_loc5_) + "\'>");
         }
         else
         {
            _loc18_ = true;
            _loc19_ = 0;
            while(_loc19_ < _loc11_.length())
            {
               if(_loc11_[_loc19_].@name == "extend")
               {
                  _loc11_[_loc19_].@value = JSON.stringify(_loc5_);
                  _loc18_ = false;
                  break;
               }
               _loc19_++;
            }
            if(_loc18_)
            {
               _loc11_.appendChild("<property name=\'extend\' value=\'" + JSON.stringify(_loc5_) + "\'>");
            }
         }
         var _loc12_:XML = param1.getLayerXML();
         var _loc13_:XMLList = _loc12_.children();
         var _loc14_:XMLList = _loc10_.child("objectgroup");
         while(_loc14_.length() > 0)
         {
            delete _loc14_[0];
         }
         for(_loc15_ in _loc13_)
         {
            _loc20_ = _loc13_[_loc15_];
            if(_loc20_.children().length() > 0)
            {
               _loc10_.appendChild(_loc20_);
            }
         }
         FileUtils.writeString(param3,_loc10_.toXMLString());
      }
      
      public static function saveObject(param1:Object, param2:String, param3:Sprite) : void
      {
         var _loc6_:SaveObject = null;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param3.numChildren)
         {
            _loc6_ = param3.getChildAt(_loc5_) as SaveObject;
            if(_loc6_)
            {
               _loc4_[_loc4_.length] = _loc6_.toObject();
            }
            _loc5_++;
         }
         param1[param2] = _loc4_;
      }
      
      public static function dataNode(param1:Sprite, param2:Object) : void
      {
         var _loc3_:TargetPoint = param1.getChildByName("targetPoint") as TargetPoint;
         if(_loc3_)
         {
            param2.targetPoint = _loc3_.toObject();
         }
      }
   }
}

