<?php echo $header; ?>
<div class="container">
  <?= $breadcrumbs; ?>
  <div class="container alert alert-light">
    <?= $info_view; ?>
    <div class="row  mb-3">
      <div class="col-md-12">
        <?= $gallery_view; ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <?= $identity_view; ?>
      </div>
    </div>
    <br>
    <?php if ($school_profile <> '') { ?>
      <div class="row my-3 mb-4">
        <div class="col-md-8">
          <h3><strong>Profile Sekolah</strong></h3>
          <p><?= $school_profile; ?></p>
        </div>
      </div>
    <?php } ?>

    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <?= $ekstrakur_view; ?>
      </div>
    </div>
    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <?= $prog_view; ?>
      </div>
    </div>

    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <?= $teacher_view; ?>
      </div>
    </div>

    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <?= $promo_view; ?>
      </div>
    </div>

    <div class="row">
      <div class="col-md-6">
        <?= $jambelajar_view; ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <?= $fasilitas_view; ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-6">
        <?= $fasilitas_att_view; ?>
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-md-6">
        <?= $program_keahlian_view; ?>
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-md-8">
        <?= $video_view; ?>
      </div>
    </div>
    <div class="row">
      <div class="col-md-7">
        <?= $contact_view; ?>
      </div>
    </div>
    <br><br>
    <div class="row">
      <div class="col-md-7">
        <?= $socmed_view; ?>
      </div>
    </div>

    <br>
  </div>
</div>
<?php echo $footer; ?>
