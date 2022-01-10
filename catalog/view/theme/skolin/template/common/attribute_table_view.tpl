<?php if (!empty($items)) { ?>
    <h3><strong><?= $text_header; ?></strong></h3>
    <table class="table table-striped border">
        <th class="table-success"><?=$header_itemlabel;?></th>
        <th class="table-success"><?=$header_itemtext;?></th>
        <?php foreach ($items as $item) { ?>
            <tr>
                <td>
                    <?= $item['label']; ?>
                </td>
                <td>
                    <?= $item['text']; ?>
                </td>
            </tr>
        <?php } ?>
    </table>
<?php } ?>
