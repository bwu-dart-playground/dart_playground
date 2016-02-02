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

@Directive(
    selector: "[ngFor][ngForOf]", inputs: const ["ngForOf", "ngForTemplate"])
class NgFor implements DoCheck {
  ViewContainerRef _viewContainer;
  TemplateRef _templateRef;
  IterableDiffers _iterableDiffers;
  ChangeDetectorRef _cdr;
  /// @internal
  dynamic _ngForOf;
  IterableDiffer _differ;
  NgFor(this._viewContainer, this._templateRef, this._iterableDiffers,
      this._cdr);

  void set ngForOf(dynamic value) {
    this._ngForOf = value;
    if (isBlank(this._differ) && isPresent(value)) {
      this._differ = this._iterableDiffers.find(value).create(this._cdr);
    }
  }

  void set ngForTemplate(TemplateRef value) {
    if (isPresent(value)) {
      this._templateRef = value;
    }
  }

  void ngDoCheck() {
    if (isPresent(this._differ)) {
      dynamic changes = this._differ.diff(this._ngForOf);
      if (isPresent(changes)) this._applyChanges(changes);
    }
  }

  void _applyChanges(dynamic changes) {
    // TODO(rado): check if change detection can produce a change record that is

    // easier to consume than current.
    List<RecordViewTuple> recordViewTuples = <RecordViewTuple>[];
    changes.forEachRemovedItem((removedRecord) =>
        recordViewTuples.add(new RecordViewTuple(removedRecord, null)));
    changes.forEachMovedItem((movedRecord) =>
        recordViewTuples.add(new RecordViewTuple(movedRecord, null)));
    List<RecordViewTuple> insertTuples = this._bulkRemove(recordViewTuples);
    changes.forEachAddedItem((addedRecord) =>
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

  void _perViewChange(EmbeddedViewRef view, Map record) {
    view.setLocal("\$implicit", record['item']);
    view.setLocal("index", record['currentIndex']);
    view.setLocal("even", (record['currentIndex'] % 2 == 0));
    view.setLocal("odd", (record['currentIndex'] % 2 == 1));
  }

  List<RecordViewTuple> _bulkRemove(List<RecordViewTuple> tuples) {
    tuples.sort((RecordViewTuple a, RecordViewTuple b) => a.record['previousIndex'] - b.record['previousIndex']);
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
    tuples.sort((RecordViewTuple a, RecordViewTuple b) => a.record.currentIndex - b.record.currentIndex);
    for (var i = 0; i < tuples.length; i++) {
      var tuple = tuples[i];
      if (isPresent(tuple.view)) {
        this._viewContainer.insert(tuple.view, tuple.record.currentIndex);
      } else {
        tuple.view = this
            ._viewContainer
            .createEmbeddedView(this._templateRef, tuple.record.currentIndex);
      }
    }
    return tuples;
  }
}

class RecordViewTuple {
  EmbeddedViewRef view;
  dynamic record;
  RecordViewTuple(record, view) {
    this.record = record;
    this.view = view;
  }
}
