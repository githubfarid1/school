<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
<style>
  .col-md-3 {
    background-color: #e3e3e3;
  }
</style>

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="Save Data" class="btn btn-primary" onclick="confirm('Simpan Data ?') ? $('#form-education-catalog').submit() : false;"><i class="fa fa-save"></i></button>
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
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-education-catalog">
        <?php foreach ($education_list as $ed) { ?>
          <div class="col-12">
            <a style="display:inline-block; width: 100%;" class="btn btn-info" role="button" data-toggle="collapse" href="#collapse-<?= $ed['category_id']; ?>" aria-expanded="false" aria-controls="collapse-<?= $ed['category_id']; ?>">
              <p>
                <h4><?= $ed['name']; ?></h4>
              </p>
            </a>
            <div class="collapse" id="collapse-<?= $ed['category_id']; ?>">
              <div class="thumbnail">
                <div class="caption">
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <select name="education_category[<?php echo $ed['category_id']; ?>][info_detail_theme]" class="form-control">
                          <option value="default">default</option>
                          <?php foreach ($detail_template as $template) { ?>
                            <?php
                            $path = pathinfo($template);
                            ?>
                            <option value="<?= $path['filename']; ?>" <?= $education_category[$ed['category_id']]['info_detail_theme'] == $path['filename'] ? 'selected' : ''; ?>><?= $path['filename']; ?></option>
                          <?php } ?>
                        </select>
                        <p style="font-style: italic;"><small>Tema Informasi Detail</small></p>
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group">
                        <select name="education_category[<?php echo $ed['category_id']; ?>][registration_theme]" class="form-control">
                          <option value="default">default</option>
                          <?php foreach ($registration_template as $template) { ?>
                            <?php
                            $path = pathinfo($template);
                            ?>

                            <option value="<?= $path['filename']; ?>" <?= $education_category[$ed['category_id']]['registration_theme'] == $path['filename'] ? 'selected' : ''; ?>><?= $path['filename']; ?></option>
                          <?php } ?>
                        </select>
                        <p style="font-style: italic;"><small>Tema Form Registrasi</small></p>

                      </div>
                    </div>

                  </div>
                  <hr>
                  <h4 class="alert alert-danger text-center"><strong>Daftar Kolom yang tampil</strong></h4>
                  <div class="row">
                    <div class="col-md-12">
                      <h4 class="alert alert-info"><strong>Umum</strong></h4>
                      <?php foreach ($column_list as $key => $cl) { ?>
                        <div class="row">
                          <div class="col-md-3">
                            <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>][status]" <?php echo isset($education_category[$ed['category_id']]['column'][$cl['education_column_id']]['status']) ? 'checked' : ''; ?>>
                            <label for="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>][status]"><?= $cl['name']; ?></label>
                          </div>
                          <div class="col-md-2">
                            <select name="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>][column_theme]" class="form-control">
                              <option value="default">default</option>
                              <?php foreach ($column_template as $template) { ?>
                                <?php
                                $path = pathinfo($template);
                                ?>
                                <?php if (!isset($education_category[$ed['category_id']]['column'][$cl['education_column_id']]['column_theme'])) { ?>
                                  <option value="<?= $path['filename']; ?>"><?= $path['filename']; ?></option> <?php } else { ?>
                                  <option value="<?= $path['filename']; ?>" <?= $education_category[$ed['category_id']]['column'][$cl['education_column_id']]['column_theme'] == $path['filename'] ? 'selected' : ''; ?>><?= $path['filename']; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </div>

                          <div class="col-md-1">
                            <?php if ($cl['coltype'] <> 'group') {?>
                            <select name="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>][screen_size]" class="form-control">
                              <?php foreach ($screen_size as $key => $size) { ?>
                                <?php if (!isset($education_category[$ed['category_id']]['column'][$cl['education_column_id']]['screen_size'])) { ?>
                                  <option value="<?= $key; ?>"><?= $size; ?></option> <?php } else { ?>
                                  <option value="<?= $key; ?>" <?= $education_category[$ed['category_id']]['column'][$cl['education_column_id']]['screen_size'] == $key ? 'selected' : ''; ?>><?= $size; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                            <?php } ?>
                          </div>

                          <div class="col-md-1">
                            <input class="form-control" type="number" name="education_category[<?php echo $ed['category_id']; ?>][column][<?= $cl['education_column_id']; ?>][sort_order]" id="" placeholder="sort order" value="<?= isset($education_category[$ed['category_id']]['column'][$cl['education_column_id']]['sort_order']) ? $education_category[$ed['category_id']]['column'][$cl['education_column_id']]['sort_order'] : '' ?>">
                          </div>

                        </div>
                      <?php }  ?>
                    </div>


                    <div class="col-md-12">
                      <h4 class="alert alert-info"><strong>Filter</strong></h4>
                      <?php foreach ($filter_list as $fl) { ?>
                        <div class="row">
                          <div class="col-md-3">
                            <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][status]" <?php echo isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['status']) ? 'checked' : ''; ?> id="">
                            <label for="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][status]"><?= $fl['name']; ?></label>
                          </div>
                          <div class="col-md-2">
                            <select name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][filter_theme]" class="form-control">
                              <option value="default">default</option>
                              <?php foreach ($filter_template as $template) { ?>
                                <?php
                                $path = pathinfo($template);
                                ?>
                                <?php if (!isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['filter_theme'])) { ?>
                                  <option value="<?= $path['filename']; ?>"><?= $path['filename']; ?></option> <?php } else { ?>
                                  <option value="<?= $path['filename']; ?>" <?= $education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['filter_theme'] == $path['filename'] ? 'selected' : ''; ?>><?= $path['filename']; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </div>

                          <div class="col-md-1">
                            <select name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][screen_size]" class="form-control">
                              <?php foreach ($screen_size as $key => $size) { ?>
                                <?php if (!isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['screen_size'])) { ?>
                                  <option value="<?= $key; ?>"><?= $size; ?></option> <?php } else { ?>
                                  <option value="<?= $key; ?>" <?= $education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['screen_size'] == $key ? 'selected' : ''; ?>><?= $size; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </div>
                          <div class="col-md-1">
                            <input class="form-control" type="number" name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][sort_order]" id="" placeholder="sort order" value="<?= isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['sort_order']) ? $education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['sort_order'] : '' ?>">
                          </div>
                          <div class="col-md-2">
                            <input class="form-control" type="text" name="education_category[<?php echo $ed['category_id']; ?>][filter][<?= $fl['filter_group_id']; ?>][icon]" id="" placeholder="Custom Icon" value="<?= isset($education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['icon']) ? $education_category[$ed['category_id']]['filter'][$fl['filter_group_id']]['icon'] : '' ?>">
                          </div>
                        </div>

                      <?php } ?>
                    </div>

                    <div class="col-md-12">
                      <h4 class="alert alert-info"><strong>Attribute</strong></h4>
                      <?php foreach ($attribute_list as $al) { ?>
                        <div class="row">
                          <div class="col-md-3">
                            <input type="checkbox" name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][status]" <?php echo isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['status']) ? 'checked' : ''; ?> id="">
                            <label for="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][status]"><?= $al['name']; ?></label>
                          </div>
                          <div class="col-md-2">
                            <select name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][attribute_theme]" class="form-control">
                              <option value="default">default</option>
                              <?php foreach ($attribute_template as $template) { ?>
                                <?php
                                $path = pathinfo($template);
                                ?>
                                <?php if (!isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['attribute_theme'])) { ?>
                                  <option value="<?= $path['filename']; ?>"><?= $path['filename']; ?></option> <?php } else { ?>
                                  <option value="<?= $path['filename']; ?>" <?= $education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['attribute_theme'] == $path['filename'] ? 'selected' : ''; ?>><?= $path['filename']; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>

                          </div>
                          <div class="col-md-1">
                            <select name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][screen_size]" class="form-control">
                              <?php foreach ($screen_size as $key => $size) { ?>
                                <?php if (!isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['screen_size'])) { ?>
                                  <option value="<?= $key; ?>"><?= $size; ?></option> <?php } else { ?>
                                  <option value="<?= $key; ?>" <?= $education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['screen_size'] == $key ? 'selected' : ''; ?>><?= $size; ?></option>
                                <?php } ?>
                              <?php } ?>
                            </select>
                          </div>

                          <div class="col-md-1">
                            <input class="form-control" type="number" name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][sort_order]" id="" placeholder="sort order" value="<?= isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['sort_order']) ? $education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['sort_order'] : '' ?>">
                          </div>
                          <div class="col-md-2">
                            <input class="form-control" type="text" name="education_category[<?php echo $ed['category_id']; ?>][attribute][<?= $al['attribute_group_id']; ?>][icon]" id="" placeholder="custom icon" value="<?= isset($education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['icon']) ? $education_category[$ed['category_id']]['attribute'][$al['attribute_group_id']]['icon'] : '' ?>">
                          </div>
                        </div>

                      <?php } ?>
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
