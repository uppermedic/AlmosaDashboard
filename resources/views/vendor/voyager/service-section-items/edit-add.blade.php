@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .buttonsContainer {
            position: absolute;
            width: 164px;
            opacity: 0;
            display: flex;
            justify-content: center;
            left: 37em;
            top: 10%;
            background: #9999;
            transition: all 0.2s ease-in-out;
            z-index: 99;
            pointer-events: none;
        }

        .newSectionContainer{
            position: absolute;
            opacity: 0;
            display: flex;
            justify-content: center;
            background: #9999;
            transition: all 0.1s ease-in-out;
            z-index: 99;
            pointer-events: none;
            flex-direction: column;
            width: 100%;
        }

        .open {
            opacity: 1!important;
            pointer-events: all;
        }
        .voyager .btn.btn-success {
            min-width: 200px;
        }
    </style>
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
    @if($edit == 'edit')
        <a href="/service-sections/{{ $dataTypeContent->section_id }}/edit" id="addSection"
           class="btn btn-success btn-add-new optionButton">
            <i class="voyager-plus"></i> <span>Edit this Section</span>
        </a>
    @endif
@stop

@section('content')

    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                          class="form-edit-add"
                          action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                          method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                    @if($edit)
                        {{ method_field("PUT") }}
                    @endif

                    <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">
                            <div class="col-md-12 col-sm-12">
                                @if (count($errors) > 0)
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif

                            <!-- Adding / Editing -->
                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="name">Services</label>
                                    <select id="service_id" class="form-control services" name="service_id"
                                            data-method="{{$edit}}" tabindex="-1" aria-hidden="false">
                                        <option value="">None</option>
                                        @foreach($allServices as $val)
                                            <option value="{{$val->id}}"
                                                {{isset($serviceInfo) && $val->id == $serviceInfo->service_id
                                                    ? 'selected'
                                                    : ''}}>
                                                {{$val->title}}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                    <div class="form-group  col-md-12 ">
                                        <label class="control-label" for="name">Service sections</label>
                                        <select id = "service_sections" class="form-control" name="service_section_id"
                                                data-method="add" tabindex="-1" aria-hidden="false">
                                            <option value="">None</option>
                                            @foreach ($service_sections as $val)
<!--                                                --><?php //file_put_contents('zzzzz1.txt',print_r($dataTypeContent->section_id,1)) ?>
                                                <option value="{{$val->id}}" {{isset($dataTypeContent->section_id) && $val->id == $dataTypeContent->section_id ? 'selected' : ''}}>{{$val->title}}</option>
                                            @endforeach
                                        </select>
                                        <div>
                                            <a onclick="showAddingModal()" id="newSection" class="btn btn-success btn-add-new">
                                                <i class="voyager-plus"></i> <span>Add new section</span>
                                            </a>
                                            <div class="newSectionContainer">
                                                <input id="newSectionText" dir="rtl" type="text" name="new_section">
                                                <a onclick="addNewSection()" class="btn btn-success btn-add-new ">
                                                    <i class="voyager-plus"></i> <span>Add</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                <div class="form-group  col-md-12 ">
                                    <label class="control-label" for="name">Color</label>
                                    <input type="color" class="form-control" name="color" value="{{!empty($serviceInfo->color) ? $serviceInfo->color : '#000000'}}">

                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true"
                                          data-toggle="tooltip" data-placement="right" data-html="true" title=""
                                          data-original-title="background color of section title"></span>
                                </div>

                                @php
                                    $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                                @endphp

                                @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                    @php
                                        $display_options = $row->details->display ?? NULL;
                                        if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                            $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                        }
                                    @endphp
                                    @if (isset($row->details->legend) && isset($row->details->legend->text))
                                        <legend class="text-{{ $row->details->legend->align ?? 'center' }}"
                                                style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                    @endif

                                    <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 12 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                        {{ $row->slugify }}
                                        <label class="control-label"
                                               for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                        @include('voyager::multilingual.input-hidden-bread-edit-add')
                                        @if (isset($row->details->view))
                                            @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                        @elseif ($row->type == 'relationship')

                                            @include('formfields.serviceItems', ['options' => $row->details])
                                        @else
                                            {!! app('voyager')->formField($row, $dataType, $dataTypeContent)!!}
                                        @endif

                                        @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                            {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                        @endforeach
                                        @if ($errors->has($row->field))
                                            @foreach ($errors->get($row->field) as $error)
                                                <span class="help-block">{{ $error }}</span>
                                            @endforeach
                                        @endif
                                    </div>
                                @endforeach

                            </div>

                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit"
                                        class="btn btn-primary save">{{ __('voyager::generic.save') }}</button>
                            @stop
                            @yield('submit-buttons')
                        </div>
                    </form>

                    <iframe id="form_target" name="form_target" style="display:none"></iframe>
                    <form id="my_form" action="{{ route('voyager.upload') }}" target="form_target" method="post"
                          enctype="multipart/form-data" style="width:0;height:0;overflow:hidden">
                        <input name="image" id="upload_file" type="file"
                               onchange="$('#my_form').submit();this.value='';">
                        <input type="hidden" name="type_slug" id="type_slug" value="{{ $dataType->slug }}">
                        {{ csrf_field() }}
                    </form>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}
                    </h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'
                    </h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger"
                            id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

        function deleteHandler(tag, isMulti) {
            return function () {
                $file = $(this).siblings(tag);

                params = {
                    slug: '{{ $dataType->slug }}',
                    filename: $file.data('file-name'),
                    id: $file.data('id'),
                    field: $file.parent().data('field-name'),
                    multi: isMulti,
                    _token: '{{ csrf_token() }}'
                }

                $('.confirm_delete_name').text(params.filename);
                $('#confirm_delete_modal').modal('show');
            };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: ['YYYY-MM-DD']
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
            $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function (i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function () {
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if (response
                        && response.data
                        && response.data.status
                        && response.data.status == 200) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function () {
                            $(this).remove();
                        })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();

            getSectionItems();

            $('.services').on('change', function () {
                var sectionId = this.value;
                getSectionItems(sectionId);
            })

            $('body').click(function (e) {
                if($(e.target).closest('#allButtons').length) return;
                setTimeout(function () {
                    $('.buttonsContainer').removeClass('open');
                }, 100)
            });
        })

        function getSectionItems(serveId = 0) {
            var serviceId = serveId ? serveId : $('.services').val(),
                sectionTitle = $('#service_sections').val();

            $.post('/getSections', {serviceID: serviceId}, function (response) {
                if (response) {
                    var sectionOptions = "",
                        selected = "";
                    $.each(response, function (k, v) {
                        var id = response[k].id,
                            val = response[k].title;

                        selected = parseInt(id) === parseInt(sectionTitle) ? 'selected' : '';
                        sectionOptions += "<option value='" + id + "'" + selected + ">" + val + "</option>";
                    });
                    $('#service_sections').html(sectionOptions);
                }
            })
        }

        function showButtons() {
            $('.buttonsContainer').toggleClass('open')
        }

        function showAddingModal() {
            if ($('#service_id').val() == '') return;
            $('.newSectionContainer').toggleClass('open')
        }

        function addNewSection() {
            var serviceId = $('#service_id').val(),
                sectionTitle = $('#newSectionText').val();

            if($.trim(serviceId) === '' || $.trim(sectionTitle) === '') return;

            $.post('/addNewSection', {serviceID: serviceId, sectionTitle: sectionTitle}, function (response) {
                if (response) {
                    var sectionOptions = "";
                    $.each(response, function (k, v) {

                        var id = response[k].id,
                            val = response[k].title;
                        sectionOptions += "<option value='" + id + "'>" + val + "</option>";
                    });
                    $('#service_sections').html(sectionOptions);

                    showAddingModal();
                }
            })
        }
    </script>
@stop
