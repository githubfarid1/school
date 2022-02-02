<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="Save Data" class="btn btn-primary" onclick="confirm('Simpan Data ?') ? $('#form-education').submit() : false;"><i class="fa fa-save"></i></button>
      </div>
      <h1>
        <?php echo $heading_title; ?>
      </h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>">
              <?php echo $breadcrumb['text']; ?>
            </a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
        <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i>
        <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <div class="row">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-education">
        <?php foreach ($education_list as $ed) { ?>
          <div class="col-12">
            <a style="display:inline-block; width: 100%;" class="btn btn-success" role="button" data-toggle="collapse" href="#collapse-<?= $ed['category_id']; ?>" aria-expanded="false" aria-controls="collapse-<?= $ed['category_id']; ?>">
              <p>
                <h4><?= $ed['name']; ?></h4>
              </p>
            </a>
            <div class="collapse" id="collapse-<?= $ed['category_id']; ?>">
              <div class="thumbnail">
                <div class="caption">
                  <div class="row">
                    <div class="col-md-4">
                      <h4 class="alert alert-info"><strong>Umum</strong></h4>
                      <?php foreach ($column_list as $key => $cl) { ?>
                        <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>]" <?= $cl['required'] == '2' ? 'checked onclick="return false;"' : ''; ?> <?php echo isset($education_category[$ed['category_id']]['column'][$cl['education_column_id']]) ? 'checked' : ''; ?>>
                        <label for="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>]"><?= $cl['name']; ?></label><br />
                      <?php }  ?>

                    </div>
                    <div class="col-md-4">
                      <h4 class="alert alert-info"><strong>Filter</strong></h4>
                      <?php foreach ($filter_list as $fl) { ?>
                        <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>]" <?php echo isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]) ? 'checked' : ''; ?> id="">
                        <label for="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>]"><?= $fl['name']; ?></label><br />
                      <?php } ?>
                    </div>
                    <div class="col-md-4">
                      <h4 class="alert alert-info"><strong>Attribute</strong></h4>
                      <?php foreach ($attribute_list as $al) { ?>
                        <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>]" <?php echo isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]) ? 'checked' : ''; ?> id="">
                        <label for="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>]"><?= $al['name']; ?></label><br />
                      <?php } ?>
                    </div>

                  </div>
                  <div class="row">
                    <div class="col-12 text-center">
                      <div class="form-group">
                        <a href="<?= $ed['school_list']; ?>"><button type="button" class="btn btn-primary">Lihat Daftar Sekolah</button></a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        <?php } ?>
      </form>
    </div>
  </div>
</div>
