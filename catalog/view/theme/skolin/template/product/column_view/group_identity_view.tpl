<div class="d-none d-md-block mt-5">
    <div class="row  align-items-center">
        <div class="col-md-1">
            <img class="mx-auto d-block" src="<?= $photo_main; ?>" alt="">
        </div>
        <div class="col-md-7">
            <h3><?= $school_name; ?></h3>
            <p><i class="fas fa-map-marker-alt" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
        </div>
        <div class="col-md-2">
            <p><i class="fas fa-medal"></i> Akreditasi: <?= isset($akreditasi) ? $akreditasi : ''; ?></p>
            <p><i class="fas fa-thumbs-up"></i> <?= isset($likes) ? $likes : ''; ?> Likes</p>
            <p><i class="fas fa-star"></i> <?= isset($review) ? $review : ''; ?></p>
        </div>
        <div class="col-md-2">
            <img class="mx-auto d-block" src="<?= isset($qrcode) ? $qrcode : ''; ?>" alt="">
        </div>

    </div>
    <div class="row align-items-center mt-2">
        <div class="col-md-8">
            <?php if (isset($daftar)) { ?>
                <a href="<?= $daftar; ?>"><button type="button" class="btn btn-success btn-lg">Daftar</button></a>
            <?php } ?>
            <?php if (isset($brosur_front)) { ?>
                <a href="<?= $brosur_front; ?>" target="_new"><button type="button" class="btn btn-primary btn-lg"><?= isset($brosur_back) ? 'Brosur Depan' : 'Download Brosur'; ?></button></a>
            <?php } ?>
            <?php if (isset($brosur_back)) { ?>
                <a href="<?= $brosur_back; ?>" target="_new"><button type="button" class="btn btn-primary btn-lg">Brosur Belakang</button></a>
            <?php } ?>

        </div>
    </div>
    <div class="row align-items-center mt-2">
        <div class="col-8">
            <?php if ($school_profile <> '') { ?>
                <p></p>
                <h3><strong>Profile Sekolah</strong></h3>
                <p><?= $school_profile; ?></p>
            <?php } ?>
        </div>
    </div>
</div>

<div class="d-sm-block d-md-none">
    <div class="row align-items-center">
        <div class="col-3">
            <img src="<?= $photo_main; ?>" alt="" class="img-fluid">
        </div>
        <div class="col-9">
            <h3><?= $school_name; ?></h3>
        </div>

    </div>
    <div class="row mt-1">
        <div class="col-12">
            <i class="fas fa-search-location" style="font-size: 24px;"></i>
            <p class="text-center font-italic">&nbsp;<?= $address; ?></p>
        </div>

    </div>
    <div class="row">
        <div class="col-6">
            <p><i class="fas fa-medal"></i> Akreditasi:<?= $akreditasi; ?></p>
            <p><i class="fas fa-thumbs-up"></i> 400 Likes</p>
            <p><i class="fas fa-star"></i> 9.0</p>
        </div>
        <div class="col-6">
            <img src="<?= $qrcode; ?>" alt="">
        </div>

    </div>
    <div class="row">
        <div class="col-12">
            <?php if (isset($daftar)) { ?>
                <a href="<?= $daftar; ?>"><button type="button" class="btn btn-success btn-sm">Daftar</button></a>
            <?php } ?>
            <?php if (isset($brosur_front)) { ?>
                <a href="<?= $brosur_front; ?>" target="_new"><button type="button" class="btn btn-primary btn-sm"><?= isset($brosur_back) ? 'Brosur Depan' : 'Download Brosur'; ?></button></a>
            <?php } ?>
            <?php if (isset($brosur_back)) { ?>
                <a href="<?= $brosur_back; ?>" target="_new"><button type="button" class="btn btn-primary btn-sm">Brosur Belakang</button></a>
            <?php } ?>
        </div>

    </div>
    <?php if ($school_profile <> '') { ?>
        <div class="row">
            <div class="col-12">
                <h3><strong>Profile Sekolah</strong></h3>
                <p><?= $school_profile; ?></p>
            </div>
        </div>
    <?php } ?>
</div>
<br>
