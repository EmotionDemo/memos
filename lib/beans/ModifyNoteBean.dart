class ModifyNoteBean {
  final String content;
  static const int INPUT = 0;
  static const int DEIT = 1;
  //0原生输入，1修改内容
  final int type;
  final int memoId;
  ModifyNoteBean(this.content, this.type, this.memoId);
}
