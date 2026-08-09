package tmx
{
   import mx.collections.ArrayCollection;
   
   public class BitmapDataArrayList extends ArrayCollection
   {
      
      public function BitmapDataArrayList(param1:SpriteBitmapData)
      {
         var _loc2_:Object = null;
         super();
         for(_loc2_ in param1.pool)
         {
            this.addItem({
               "name":_loc2_,
               "data":param1.pool[_loc2_].bitmap,
               "xml":param1.pool[_loc2_].xml
            });
         }
         this.source.sortOn("name");
      }
   }
}

