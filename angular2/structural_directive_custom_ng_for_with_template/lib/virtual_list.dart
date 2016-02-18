library structural_directive_custom_ng_for_with_template.virtual_list;

import "package:angular2/core.dart"
    show
        DoCheck,
        Directive,
        ChangeDetectorRef,
        IterableDiffer,
        IterableDiffers,
        ViewContainerRef,
        TemplateRef,
        EmbeddedViewRef;
import "package:angular2/src/facade/lang.dart" show isPresent, isBlank;
import "package:angular2/src/core/change_detection/differs/default_iterable_differ.dart"
    show CollectionChangeRecord, DefaultIterableDiffer;

@Directive(
    selector: "[virtualList][virtualListOf]",
    inputs: const ["virtualListOf", "virtualListTemplate"])
class VirtualList implements DoCheck {
  ViewContainerRef _viewContainer;
  TemplateRef _templateRef;
  IterableDiffers _iterableDiffers;
  ChangeDetectorRef _cdr;

  /// @internal
  dynamic _virtualListOf;
  IterableDiffer _differ;
  VirtualList(this._viewContainer, this._templateRef, this._iterableDiffers,
      this._cdr) {
    print('x');
  }

  void set virtualListOf(dynamic value) {
    this._virtualListOf = value;
    if (isBlank(this._differ) && isPresent(value)) {
      this._differ = this._iterableDiffers.find(value).create(this._cdr);
    }
  }

  void set virtualListTemplate(TemplateRef value) {
    if (isPresent(value)) {
      this._templateRef = value;
    }
  }

  void ngDoCheck() {
    if (isPresent(this._differ)) {
      dynamic changes = this._differ.diff(this._virtualListOf);
      if (isPresent(changes)) this._applyChanges(changes);
    }
  }

  void _applyChanges(DefaultIterableDiffer changes) {
    // TODO(rado): check if change detection can produce a change record that is

    // easier to consume than current.
    List<RecordViewTuple> recordViewTuples = <RecordViewTuple>[];
    changes.forEachRemovedItem((CollectionChangeRecord removedRecord) =>
        recordViewTuples.add(new RecordViewTuple(removedRecord, null)));
    changes.forEachMovedItem((CollectionChangeRecord movedRecord) =>
        recordViewTuples.add(new RecordViewTuple(movedRecord, null)));
    List<RecordViewTuple> insertTuples = this._bulkRemove(recordViewTuples);
    changes.forEachAddedItem((CollectionChangeRecord addedRecord) =>
        insertTuples.add(new RecordViewTuple(addedRecord, null)));
    this._bulkInsert(insertTuples);
    for (int i = 0; i < insertTuples.length; i++) {
      this._perViewChange(insertTuples[i].view, insertTuples[i].record);
    }
    for (int i = 0, ilen = this._viewContainer.length; i < ilen; i++) {
      EmbeddedViewRef viewRef = (this._viewContainer.get(i) as EmbeddedViewRef);
      viewRef.setLocal("last", identical(i, ilen - 1));
    }
  }

  void _perViewChange(EmbeddedViewRef view, CollectionChangeRecord record) {
    view.setLocal("\$implicit", record.item);
    view.setLocal("index", record.currentIndex);
    view.setLocal("even", (record.currentIndex % 2 == 0));
    view.setLocal("odd", (record.currentIndex % 2 == 1));
  }

  List<RecordViewTuple> _bulkRemove(List<RecordViewTuple> tuples) {
    tuples.sort((RecordViewTuple a, RecordViewTuple b) =>
        a.record['previousIndex'] - b.record['previousIndex']);
    List<RecordViewTuple> movedTuples = [];
    for (int i = tuples.length - 1; i >= 0; i--) {
      RecordViewTuple tuple = tuples[i];
      // separate moved views from removed views.
      if (isPresent(tuple.record['currentIndex'])) {
        tuple.view = this._viewContainer.detach(tuple.record['previousIndex']);
        movedTuples.add(tuple);
      } else {
        this._viewContainer.remove(tuple.record['previousIndex']);
      }
    }
    return movedTuples;
  }

  List<RecordViewTuple> _bulkInsert(List<RecordViewTuple> tuples) {
    tuples.sort((RecordViewTuple a, RecordViewTuple b) =>
        ((a.record as CollectionChangeRecord).currentIndex as int) -
        ((b.record as CollectionChangeRecord).currentIndex as int));
    for (int i = 0; i < tuples.length; i++) {
      RecordViewTuple tuple = tuples[i];
      if (isPresent(tuple.view)) {
        this._viewContainer.insert(tuple.view, (tuple.record as CollectionChangeRecord).currentIndex);
      } else {
        tuple.view = this
            ._viewContainer
            .createEmbeddedView(this._templateRef, (tuple.record as CollectionChangeRecord).currentIndex);
      }
    }
    return tuples;
  }
}

class RecordViewTuple {
  EmbeddedViewRef view;
  dynamic record;
  RecordViewTuple(this.record, this.view);
}
