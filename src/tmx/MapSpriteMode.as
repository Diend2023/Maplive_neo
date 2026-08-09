package tmx
{
   public class MapSpriteMode
   {
      
      public static const NOT_PENETRATE:String = "not_penetrate";
      
      public static const VISIBLE_STES:String = "visible_stes";
      
      public static const NOT_VISIBLE_STES:String = "not_visible_stes";
      
      public static const DYNAMIC_VISIBLE:String = "dynamic_visible";
      
      public static const NOT_HIT:String = "not_hit";
      
      public static const NOT_VISIBLE_NOT_PENETRATE:String = "not_visible_not_penetrate";
      
      public function MapSpriteMode()
      {
         super();
      }
      
      public static function getColor(param1:String) : uint
      {
         switch(param1)
         {
            case NOT_PENETRATE:
               return 65280;
            case VISIBLE_STES:
               return 255;
            case NOT_VISIBLE_STES:
               return 16711680;
            case DYNAMIC_VISIBLE:
               return 16776960;
            default:
               return 16777215;
         }
      }
   }
}

