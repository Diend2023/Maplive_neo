package views
{
   import flash.events.KeyboardEvent;
   import flash.filesystem.File;
   import mx.managers.PopUpManager;
   import spark.components.NavigatorContent;
   
   public class RefObserve extends NavigatorContent
   {
      
      // private static var _skinParts:Object = {"contentGroup":false};
      private var _skinParts:Object = {"contentGroup":false}; //
      
      protected var _change:Boolean = false;
      
      public var file:File;

      protected var _undoStack:Array = []; //

      protected var _redoStack:Array = []; //

      protected var _undoChars:int = 0; //

      protected var _isRestoring:Boolean = false; //

      public var undoMaxStep:int = 100; // 最大步数

      public var undoMaxChars:int = 32000000; // 快照总字符预算

      protected var _viewState:String = null; // 本次恢复要跳转到的位置：来自“被撤销/重做的那一步”的快照
      
      public function RefObserve()
      {
         super();
      }
      
      public function readFile(param1:File) : void
      {
         this.file = param1;
      }
      
      public function onChange() : void
      {
         if(!this._change)
         {
            this._change = true;
            this.label = this.file.name + " *";
         }
      }
      
      public function get isChange() : Boolean
      {
         return this._change;
      }
      
      public function onSave() : void
      {
         if(!this.file)
         {
            return;
         }
         PopUpManager.addPopUp(new TipsMessage("保存成功！"),this);
         this._change = false;
         this.label = this.file.name;
      }
      
      public function onFrame() : void
      {
      }
      
      public function onRefresh() : void
      {
      }
      
      public function getName() : String
      {
         return this.file.name;
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
      }
      
      public function onKeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function discarded() : void
      {
      }

      protected function captureState() : String //
      { //
         return null; //
      } //

      protected function restoreState(param1:String) : void //
      { //
      } //

      public function pushUndoSnapshot() : void //
      { //
         if(this._isRestoring) return; // 恢复期间不记录
         var s:String = this.captureState(); //
         if(s == null) return; // 不支持撤销的视图直接跳过
         if(this._undoStack.length > 0 && this.snapshotKey(this._undoStack[this._undoStack.length - 1]) == this.snapshotKey(s)) return; // 去重
         this._undoStack.push(s); //
         this._undoChars += s.length; //
         this._redoStack.length = 0; // 新编辑清空 redo
         while(this._undoStack.length > 2 && (this._undoStack.length > this.undoMaxStep || this._undoChars > this.undoMaxChars)) //
         { //
            this._undoChars -= (this._undoStack.shift() as String).length; // 从栈底截断
         } //
      } //

      public function get canUndo() : Boolean //
      { //
         return this._undoStack.length > 1; //
      } //

      public function get canRedo() : Boolean //
      { //
         return this._redoStack.length > 0; //
      } //

      public function onUndo() : void //
      { //
         if(this._undoStack.length <= 1) return; //
         var top:String = this._undoStack.pop(); // 被丢弃的状态：它的位置就是被撤销那一步的编辑位置
         this._redoStack.push(top); //
         this._viewState = top; // 告诉 restoreState：跳到这里
         try //
         { //
            this._restore(this._undoStack[this._undoStack.length - 1]); //
         } //
         finally //
         { //
            this._viewState = null; //
         } //
      } //

      public function onRedo() : void //
      { //
         if(this._redoStack.length == 0) return; //
         var s:String = this._redoStack.pop(); //
         this._undoStack.push(s); //
         this._viewState = null; // 重做：用该快照自身的位置（就是那一步的位置）
         this._restore(s); //
      } //

      private function _restore(param1:String) : void //
      { //
         this._isRestoring = true; //
         try //
         { //
            this.restoreState(param1); //
         } //
         finally //
         { //
            this._isRestoring = false; //
         } //
         this._change = true; //
         this.label = this.getName() + " *"; // 撤销后仍属未保存状态
      } //

      public function markInitialState() : void //
      { //
         this._undoStack.length = 0; //
         this._redoStack.length = 0; //
         this._undoChars = 0; //
         this.pushUndoSnapshot(); //
      } //

      protected function snapshotKey(param1:String) : String // 去重指纹：默认整串，子类可只取数据部分
      { //
         return param1; //
      } //

   }
}

