package utils
{
   public class ProjectUtils
   {
      
      public static var projectXml:XML;
      
      public function ProjectUtils()
      {
         super();
      }
      
      public static function cheakIsMainMap(param1:String) : Boolean
      {
         if(!param1 || param1 == "null" || !mainMap)
         {
            return false;
         }
         if(param1.indexOf(mainMap) != -1)
         {
            return true;
         }
         return false;
      }
      
      public static function get mainMap() : String
      {
         if(!projectXml)
         {
            return null;
         }
         if(projectXml.@mapMain == undefined)
         {
            return null;
         }
         return projectXml.@mapMain;
      }
      
      public static function set mainMap(param1:String) : void
      {
         projectXml.@mapMain = param1;
         save();
      }
      
      public static function save() : void
      {
         FileUtils.writeString(App.projectFile.resolvePath("project.xml"),projectXml.toXMLString());
      }
   }
}

