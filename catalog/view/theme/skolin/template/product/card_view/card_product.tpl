<div class="row">
    <?php foreach ($products as $product) { ?>
        <div class="col-md-3 col-6 mb-2 p-1 d-flex align-items-stretch">
            <div class="card bg-light" style="margin: 0;">
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" class="card-img-top px-5 pt-3" alt="<?php echo $product['name']; ?>">
                    <div class="card-body">
                        <h4 class="card-title fw-bold text-center text-truncate" style="display: -webkit-box !important; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal;"><strong><?php echo $product['name']; ?></strong></h4>
                        <div class="d-none d-md-block">
                            <p class="card-text text-truncate mb-1 text-center" style="display: -webkit-box !important; -webkit-line-clamp: 2; -webkit-box-orient: vertical; white-space: normal;"><small class="text-muted"><i class="fas fa-map-marker-alt"></i>&nbsp;<?= $product['address']; ?></small></p>
                        </div>
                        <div class="text-center d-none d-md-block"><a href="#" class="btn btn-sm <?= $product['regstatus_id'] == 1 ? 'btn-info' : ($product['regstatus_id'] == 2 ? 'btn-danger' : ($product['regstatus_id'] == 3 ? 'btn-secondary' : 'btn-warning')); ?>"><?= $product['regstatus_name']; ?></a></div>
                        <div class="text-center d-sm-block d-md-none"><a href="#" class="btn btn-sm <?= $product['regstatus_id'] == 1 ? 'btn-info' : ($product['regstatus_id'] == 2 ? 'btn-danger' : ($product['regstatus_id'] == 3 ? 'btn-secondary' : 'btn-warning')); ?>">
                                <p class="small mb-0"><?= $product['regstatus_name']; ?></p>
                            </a></div>
                    </div>
                </a>
            </div>
        </div>
    <?php } ?>
</div>
