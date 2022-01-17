<div class="row">
    <?php foreach ($products as $product) { ?>
        <div class="col-md-3 col-6 mb-2">
            <div class="card bg-light" style="margin: 0;">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" class="card-img-top px-5 pt-3" alt="<?php echo $product['name']; ?>"></a>
                <div class="card-body">
                    <h4 class="card-title fw-bold text-center"><strong><?php echo $product['name']; ?></strong></h4>
                    <p class="card-text d-none d-md-block"><small class="text-muted"><i class="fas fa-map-marker-alt"></i>&nbsp;<?= $product['address']; ?></small></p>
                    <div class="text-center d-none d-md-block"><a href="#" class="btn <?= $product['regstatus_id'] == 1 ? 'btn-info' : ($product['regstatus_id'] == 2 ? 'btn-danger' : ($product['regstatus_id'] == 3 ? 'btn-secondary' : 'btn-warning')); ?>"><?= $product['regstatus_name']; ?></a></div>
                    <div class="text-center d-sm-block d-md-none"><a href="#" class="btn btn-sm <?= $product['regstatus_id'] == 1 ? 'btn-info' : ($product['regstatus_id'] == 2 ? 'btn-danger' : ($product['regstatus_id'] == 3 ? 'btn-secondary' : 'btn-warning')); ?>"><p class="small mb-0"><?= $product['regstatus_name']; ?></p> </a></div>
                </div>
            </div>
        </div>
    <?php } ?>
</div>
