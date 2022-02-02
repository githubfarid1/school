<?php if (!empty($attribute)) { ?>
    <div class="row">
        <div class="col-md-<?= $screen_size; ?>">
            <h3><strong><?= $name; ?></strong></h3>
            <div class="row">
                <?php foreach ($attribute as $item) { ?>
                    <div class="col-md-6">
                        <p class="mb-2"><?=!empty($icon) ? $icon : '<i class="far fa-check-square" style="font-size: 24px;"></i>'?>&nbsp;<?= $item['text']; ?></p>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
<?php } ?>
