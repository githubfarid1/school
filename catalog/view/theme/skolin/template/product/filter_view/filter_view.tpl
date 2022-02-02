<?php if (!empty($filter)) { ?>
    <h3><strong><?= $name; ?></strong></h3>
    <div class="row">
        <div class="col-md-<?= $screen_size; ?>">
            <div class="row">
                <?php foreach ($filter as $item) { ?>
                    <div class="col-md-6">
                        <p class="mb-2"><?= !empty($icon) ? $icon : '<i class="far fa-check-square" style="font-size: 24px;"></i>' ?>&nbsp;<?= $item['name']; ?></p>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
<?php } ?>
