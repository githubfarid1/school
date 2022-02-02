<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
                    <input type="hidden" name="product_store[]" value="0">

                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
                        <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
                        <li><a href="#tab-filter" data-toggle="tab"><?php echo $tab_filter; ?></a></li>
                        <li><a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <li><a href="#tab-registration" data-toggle="tab">Pendaftaran</a></li>
                        <li><a href="#tab-authorization" data-toggle="tab"><?php echo $tab_authorization; ?></a></li>
                    </ul>
                    <style type="text/css">
                        .form-group {
                            /*margin-left: 20px !important;*/
                            margin-right: 20px !important;
                        }
                    </style>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="tab-content">
                                <?php foreach ($columns as $col) { ?>
                                    <?php if ($col['coltype'] == 'text') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="col-md-2 control-label">
                                                <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="text" name="<?= $col['colname']; ?>" id="" class="form-control" placeholder="" aria-describedby="helpId" value="<?= $col['value']; ?>">
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($col['coltype'] == 'number' || $col['coltype'] == 'currency') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="col-sm-2 control-label">
                                                <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="number" name="<?= $col['colname']; ?>" id="" class="form-control" placeholder="" aria-describedby="helpId" value="<?= $col['value']; ?>">
                                            </div>
                                        </div>
                                    <?php } ?>

                                    <?php if ($col['coltype'] == 'textarea') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="col-sm-2 control-label">
                                                <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>

                                            </div>
                                            <div class="col-sm-10">
                                                <textarea class="form-control summernote" name="<?= $col['colname']; ?>" id="" rows="3"><?= $col['value']; ?></textarea>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($col['coltype'] == 'tinyint') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="col-sm-2 control-label">
                                                <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                            </div>

                                            <div class="col-sm-10">
                                                <select name="<?= $col['colname']; ?>" id="" class="form-control">
                                                    <?php if ($col['value']) { ?>
                                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                        <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php } else { ?>
                                                        <option value="1"><?php echo $text_enabled; ?></option>
                                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>


                                        </div>
                                    <?php } ?>

                                    <?php if ($col['coltype'] == 'date') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="col-sm-2 control-label">
                                                <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                            </div>
                                            <div class="col-sm-10">
                                                <input type="date" name="<?= $col['colname']; ?>" id="" class="form-control" placeholder="" aria-describedby="helpId" value="<?= $col['value']; ?>">
                                            </div>
                                        </div>
                                    <?php } ?>

                                <?php } ?>

                            </div>
                        </div>
                        <div class="tab-pane" id="tab-image">
                            <div class="tab-content">
                                <?php foreach ($columns as $col) { ?>
                                    <?php if ($col['coltype'] == 'image' || $col['coltype'] == 'brosur') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="row">
                                                <div class="col-sm-2 control-label" style="margin-bottom: 15px;">
                                                    <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                                </div>
                                                <div class="col-sm-10">
                                                    <div class="row">
                                                        <div class="col-sm-2">
                                                            <a href="" id="thumb-<?= $col['colname']; ?>" data-toggle="image" class="img-thumbnail" style="justify-content: center; display: flex;">
                                                                <img src="<?= $col['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                                                            </a>
                                                            <input type="hidden" name="<?= $col['colname']; ?>[image]" value="<?= $col['value']; ?>" id="input-<?= $col['colname']; ?>" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                    <?php if ($col['coltype'] == 'images') { ?>
                                        <div class="form-group <?php echo $col['required'] == 2 ? 'required' : ''; ?>">
                                            <div class="row">
                                                <div class="col-sm-2 control-label">
                                                    <label for="<?= $col['colname']; ?>"><?= $col['name']; ?></label>
                                                </div>
                                                <?php
                                                $ar = explode("-", $col['length']);
                                                $start = (int)$ar[0];
                                                $end = (int)$ar[1]; ?>
                                                <div class="col-sm-10">
                                                    <div class="row">

                                                        <?php while ($start <= $end) { ?>
                                                            <div class="col-sm-2" style="margin-bottom: 15px;">
                                                                <a href="" id="thumb-<?= $col['colname']; ?><?= $start; ?>" data-toggle="image" class="img-thumbnail" style="justify-content: center; display: flex;"><img src="<?= isset($col['value'][$start]['thumb']) ? $col['value'][$start]['thumb'] : $empty_image; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="<?= $col['colname']; ?>[<?= $start; ?>][image]" value="<?= isset($col['value'][$start]['image']) ? $col['value'][$start]['image'] : ''; ?>" id="input-<?= $col['colname']; ?><?= $start; ?>" />
                                                                <input type="text" name="<?= $col['colname']; ?>[<?= $start; ?>][name]" id="" class="form-control" placeholder="title" aria-describedby="helpId" value="<?= isset($col['value'][$start]['name']) ? $col['value'][$start]['name'] : ''; ?>">
                                                                <textarea class="form-control" name="<?= $col['colname']; ?>[<?= $start; ?>][description]" id="" rows="3" placeholder="description"><?= isset($col['value'][$start]['description']) ? $col['value'][$start]['description'] : ''; ?></textarea>
                                                            </div>

                                                        <?php
                                                            $start++;
                                                        }
                                                        ?>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    <?php } ?>

                                <?php } ?>

                            </div>

                        </div>
                        <div class="tab-pane" id="tab-filter">
                            <div class="tab-content">
                                <?php if (!empty($filters)) { ?>
                                    <?php foreach ($filters as $col) { ?>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-2 control-label">
                                                    <h4><strong>
                                                            <?= $col['name']; ?>
                                                    </h4></strong>
                                                </div>
                                                <div class="col-sm-10">
                                                    <?php if ($col['checktype'] == 'checkbox') { ?>
                                                        <?php foreach ($col['items'] as $item) { ?>
                                                            <input type="checkbox" name="filter[<?= $col['id']; ?>][<?= $item['id']; ?>]" <?= $item['selected'] ? 'checked' : ''; ?>>
                                                            <label for="filter[<?= $col['id']; ?>][<?= $item['id']; ?>]"><?= $item['name']; ?></label><br />
                                                        <?php } ?>
                                                    <?php } ?>
                                                    <?php if ($col['checktype'] == 'select') { ?>
                                                        <select name="filter[<?= $col['id']; ?>][]" class="select2" style="width: 100%;">
                                                            <option value="">--- Pilih ---</option>
                                                            <?php foreach ($col['items'] as $item) { ?>
                                                                <option value="<?= $item['id']; ?>" <?= $item['selected'] ? 'selected' : ''; ?>><?= $item['name']; ?></option>
                                                            <?php } ?>
                                                        </select>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>

                                    <?php } ?>
                                <?php } ?>

                            </div>
                        </div>
                        <div class="tab-pane" id="tab-attribute">
                            <div class="tab-content">
                                <?php if (!empty($attributes)) { ?>
                                    <?php foreach ($attributes as $col) { ?>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-md-2 control-label">
                                                    <h4><strong>
                                                            <?= $col['name']; ?>
                                                    </h4></strong>
                                                </div>
                                                <div class="col-md-10">
                                                    <?php if ($col['showlabel'] == 0) { ?>
                                                        <?php foreach ($col['items'] as $item) { ?>
                                                            <input type="text" name="attribute[<?= $col['id']; ?>][<?= $item['id']; ?>]" id="" placeholder="<?= $item['name']; ?>" class="form-control" value="<?= $item['value']; ?>">
                                                            <br />
                                                        <?php } ?>
                                                    <?php } ?>
                                                    <?php if ($col['showlabel'] == 1) { ?>
                                                        <?php foreach ($col['items'] as $item) { ?>
                                                            <label for="attribute[<?= $col['id']; ?>][<?= $item['id']; ?>]"><?= $item['name']; ?></label><br />
                                                            <input type="text" name="attribute[<?= $col['id']; ?>][<?= $item['id']; ?>]" id="" placeholder="" class="form-control" value="<?= $item['value']; ?>">
                                                            <br />
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </div>
                                    <?php } ?>
                                <?php } ?>
                            </div>

                        </div>
                        <div class="tab-pane" id="tab-authorization">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
                                        <?php if ($status) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-user">User</label>
                                <div class="col-sm-10">
                                    <select name="user_id" id="input-user" class="form-control">
                                        <option value="">--- Pilih ---</option>
                                        <?php foreach ($users as $user) { ?>
                                            <option value="<?= $user['user_id']; ?>" <?= $user['user_id'] == $user_id ? 'selected' : '' ?>><?= $user['username'] . ' | ' . $user['firstname'] . ' ' . $user['lastname'] . ' | ' . $user['email']; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>


                        </div>
                        <div class="tab-pane" id="tab-registration">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="">Status Pendaftaran</span></label>
                                <div class="col-sm-10">
                                    <select name="stock_status_id" id="input-stock-status" class="form-control">
                                        <?php foreach ($stock_statuses as $stock_status) { ?>
                                            <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                                                <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-date-closed">Pendaftaran sampai dengan</label>
                                <div class="col-sm-3">
                                    <div class="input-group date">
                                        <input type="text" name="date_closed" value="<?php echo $date_closed; ?>" placeholder="" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function() {
        $('.select2').select2();

        $('.date').datetimepicker({
            pickTime: false
        });

    });
</script>
