@extends('layouts.main')

@push('extra_links')
<!-- Select2 -->
<link rel="stylesheet" href="{{ asset("bower_components/select2/dist/css/select2.min.css")}}">

@endpush

@section('page_header')
  @include('quotations.header')
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12">
      <div class="box box-primary add-form box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Create New Quotation</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form" method="POST" action="{{ url('/quotations') }}" onsubmit="return validate(this);">
          @CSRF
          <div class="box-body">
            <div class="row">
              <div class="form-group col-lg-2">
                <label>Date</label>
                <p id="date"></p>
              </div>
              <div class="form-group col-lg-3">
                <label>Client Name</label>
                <select id="client" class="form-control select2" style="width: 100%;" name="client" required></select>
              </div>
              <div class="form-group col-lg-3" id="help">
                <label> </label>
                <h4>&#8678; Search a client here</h4>
              </div>
              <div class="form-group col-lg-3" id="company_group" style="display:none">
                <label>Company Name</label>
                <p id="company_name"></p>
              </div>
              <div class="form-group col-lg-4" id="address_group" style="display:none">
                <label>Client Address</label>
                <p id="address"></p>
              </div>
            </div>
            <div class="form-group">
              <div id="myTable" class="table-responsive">
                <table class="table table-bordered">
                  <tr bgcolor="#f5f5f5">
                    <th style="width: 1%">Product Description</th>
                    <th style="width: 25%">Unit Price</th>
                    <th style="width: 20%"> </th>
                  </tr>
                </table>
                <input class="btn btn-success row_add_product" type="button" value="+ Product">
              </div>
            </div>
          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <a type="button" class="btn btn-default" href="{{url('/quotations')}}">Cancel</a>
            <button type="submit" class="btn btn-primary pull-right">Save</button>
          </div>
          <!-- /.box-footer -->
        </form>
        <!-- /.add-form -->
      </div>
    </div>
    <!-- /.col-->
  </div>
  <!-- /.row-->
@endsection

@push('extra_scripts')
<!-- Select2 -->
<script src="{{ asset("bower_components/select2/dist/js/select2.full.min.js")}}"></script>

<script src="{{ asset("dist/js/helper-functions.js")}}"></script>
<script src="{{ asset("dist/js/quotation-create.js")}}"></script>

@endpush