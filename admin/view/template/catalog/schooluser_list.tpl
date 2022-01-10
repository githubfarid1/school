<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
  </div>
  <div class="container-fluid">
    <div class="row">
      <?php if ($products) { ?>
        <?php foreach ($products as $product) { ?>
          <div class="col-md-3">
            <div class="panel panel-default">
              <div class="panel-heading text-center">
                <h4><strong><?php echo $product['name']; ?></strong></h4>
              </div>
              <div class="panel-body">
                <div class="text-center"><div class="btn <?= $product['regstatus_id'] == 1 ? 'btn-primary' : ($product['regstatus_id'] == 2 ? 'btn-danger' : ($product['regstatus_id'] == 3 ? 'btn-default' : 'btn-warning')); ?>"><?= $product['regstatus_name']; ?></div></div>
              </div>
              <div class="panel-footer">
              <div class="text-center">
                <a href="<?php echo $product['edit']; ?>" class="btn btn-success btn-sm">Edit</a>
                <div class="btn btn-info btn-sm">Live Edit</div>
                <a href="<?php echo $product['view']; ?>" target="_blank" class="btn btn-primary btn-sm">View</a>
              </div>
              </div>
            </div>
          </div>
        <?php } ?>
      <?php } ?>
    </div>
  </div>
</div>
<?php echo $footer; ?>
