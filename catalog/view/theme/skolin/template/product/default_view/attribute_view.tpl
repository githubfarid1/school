<?php if (!empty($items)) { ?>
    <h3><strong><?=$text_header;?></strong></h3>
    <div class="row">
        <?php foreach ($items as $item) { ?>
            <div class="col-md-6">
                <p class="mb-2"><i class="<?=isset($icon) ? $icon : '';?>" style="<?=isset($iconstyle) ? $iconstyle : '';?>"></i>&nbsp;<?= $item['text']; ?></p>
            </div>
        <?php } ?>
    </div>
<?php } ?>
