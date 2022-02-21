<?php if (!empty($attribute)) { ?>
    <div class="row my-3">
        <div class="col-md-<?= $screen_size; ?>">

            <h3><strong><?= $name; ?></strong></h3>
            <table class="table table-striped border">
                <!-- <th class="table-success">Hari</th>
                <th class="table-success">Jam</th> -->
                <?php foreach ($attribute as $item) { ?>
                    <tr>
                        <td>
                            <?= $item['name']; ?>
                        </td>
                        <td>
                            <?= $item['text']; ?>
                        </td>
                    </tr>
                <?php } ?>
            </table>
        </div>
    </div>
<?php } ?>
