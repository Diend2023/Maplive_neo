package utils
{
   import events.OpenEvent;
   import flash.filesystem.File;
   import flash.utils.setTimeout;
   import views.observe.TMXObserve;
   
   public class BatchMaps
   {
      
      private var _files:Array;
      
      public function BatchMaps()
      {
         super();
         this._files = App.projectFile.resolvePath("tmx").getDirectoryListing();
         this.next();
      }
      
      public function next() : void
      {
         if(this._files.length > 0)
         {
            Maplive.self.onOpen(new OpenEvent(OpenEvent.OPEN,this._files[0] as File));
            this._files.shift();
            setTimeout(this.next,2000);
            setTimeout(function():void
            {
               if(Maplive.self.viewstack.selectedChild as TMXObserve)
               {
                  (Maplive.self.viewstack.selectedChild as TMXObserve).outImage();
                  setTimeout(function():*
                  {
                     Maplive.self.tabBar.onClose(null);
                  },1000);
               }
            },1000);
         }
      }
   }
}

