@extends('layouts.main')

@section('page_header')
  @include('garments.header')
@endsection

@section('content')
<div class="row">
  <div class="col-lg-6">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Edit Segment Type Information</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form" method="POST" action="{{ URL('/segments')}}/{{$segment->id}}" onsubmit="return validate(this);">
          @CSRF
          <div class="box-body">
            <div class="row">
              <div class="col-sm-12">
               <div class="col-sm-12 form-group">
                  <label class="control-label">Name</label>
                  <input type="text" class="form-control" value="{{$segment->name}}" name="name" autocomplete="off" required></input>
                </div>
              </div>
              <!-- /.col -->
            </div> 
            <!-- /.row inner -->   
          <div>
          <!-- /.box-body -->
          <div class="box-footer">
            <a type="button" class="btn btn-default" href="{{ url('/segments') }}">Cancel</a>
            {{ method_field('PUT') }}
            <button type="submit" class="btn btn-primary pull-right">Save</button>
          </div>
          <!-- /.box-footer -->
        </form>
        <!-- /.form-horizontal -->
      </div>
      <!-- /.add-form -->
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->
@endsection