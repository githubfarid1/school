<?php echo $header; ?>
<style>
  .cards-wrapper {
    display: flex;
    justify-content: center;
  }

  .card img {
    max-width: 100%;
    max-height: 100%;
  }

  .card {
    margin: 0 0.5em;
    box-shadow: 2px 6px 8px 0 rgba(22, 22, 26, 0.18);
    border: none;
    border-radius: 0;
  }

  .carousel-inner {
    padding: 1em;
  }

  .carousel-control-prev,
  .carousel-control-next {
    background-color: #e1e1e1;
    width: 5vh;
    height: 5vh;
    border-radius: 50%;
    top: 50%;
    transform: translateY(-50%);
  }

  @media (min-width: 768px) {
    .card img {
      height: 11em;
    }
  }
</style>
<div class="container">
  <?= $breadcrumbs; ?>
  <div class="row justify-content-center mb-3">
    <div class="col-md-10">
      <div class="carousel-container position-relative">
        <!-- Sorry! Lightbox doesn't work - yet. -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <?php $ke = 0;
            $isFirst = true; ?>
            <?php foreach ($images as $image) { ?>
              <div class="carousel-item <?= $isFirst ? 'active' : ''; ?>" data-slide-number="<?= $ke; ?>">
                <img src="<?= $image['popup']; ?>" class="d-block w-100" alt="..." data-remote="<?= $image['popup']; ?>" data-type="image" data-toggle="lightbox" data-gallery="example-gallery">
              </div>
              <?php $ke++;
              $isFirst = false;
              ?>
            <?php } ?>
          </div>
        </div>

        <!-- Carousel Navigation -->
        <div id="carousel-thumbs" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <?php
            $ke = 0;
            $check = 0;
            $isFirst = true;
            $carItem = true;
            $wClosed = false;
            ?>

            <?php foreach ($images as $image) { ?>
              <?php
              $check++;
              if ($carItem) {
                $wClosed = true;
                echo '<div class="carousel-item ' .  ($isFirst ? 'active' : '') . '">';
                echo '<div class="row mx-0">';
              } ?>
              <div id="carousel-selector-<?= $ke; ?>" class="thumb col-4 col-sm-2 px-1 py-2 <?= isFirst ? 'selected' : ''; ?>" data-target="#myCarousel" data-slide-to="<?= $ke; ?>">
                <img src="<?= $image['thumb']; ?>" class="img-fluid" alt="...">
              </div>
              <?php $ke++;
              $isFirst = false;
              $carItem = false;
              $countImage = 6;
              if ($check == $countImage) {
                $carItem = true;
                $check = 0;
                $wClosed = false;
                echo '</div></div>';
              } ?>

            <?php } ?>
            <?php if ($wClosed) {
              echo '</div></div>';
            } ?>

            <a class="carousel-control-prev" href="#carousel-thumbs" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-thumbs" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
      </div>

    </div>
  </div>


  <div class="d-none d-md-block mt-5">
    <div class="row  align-items-center">
      <div class="col-md-1 border">
        <img src="<?= $logo; ?>" alt="">
      </div>
      <div class="col-md-7">
        <h3><?= $school_name; ?></h3>
        <p><i class="fas fa-map-marker-alt" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
      </div>
      <div class="col-md-2">
        <p>Akreditasi:<?= $akreditasi; ?></p>
        <p>400 Likes</p>
        <p>9.0</p>
      </div>
      <div class="col-md-2">
        <img src="<?= $qrcode; ?>" alt="">
      </div>

    </div>
    <div class="row align-items-center mt-2">
      <div class="col-md-8">
        <button type="button" class="btn btn-success btn-lg">Daftar Sekarang</button>
        <button type="button" class="btn btn-secondary btn-lg">Download Brosur</button>
      </div>

    </div>
  </div>
  <div class="d-sm-block d-md-none">
    <div class="row align-items-center">
      <div class="col-3">
        <img src="<?= $logo; ?>" alt="">
      </div>
      <div class="col-9">
        <h3><?= $school_name; ?></h3>
      </div>

    </div>
    <div class="row">
      <div class="col-12">
        <p class="text-center"><i class="fas fa-search-location" style="font-size: 24px;"></i>&nbsp;<?= $address; ?></p>
      </div>

    </div>
    <div class="row">
      <div class="col-6">
        <p>Akreditasi:<?= $akreditasi; ?></p>
        <p>400 Likes</p>
        <p>9.0</p>
      </div>
      <div class="col-6">
        <img src="<?= $qrcode; ?>" alt="">
      </div>

    </div>
    <div class="row">
      <div class="col-6">
        <button type="button" class="btn btn-success btn-md">Daftar Sekarang</button>
      </div>
      <div class="col-6">
        <button type="button" class="btn btn-secondary btn-md">Download Brosur</button>
      </div>
    </div>

  </div>

  <br />
  <?php if (!empty($fasilitas['items'])) { ?>
    <h3><strong>Fasilitas Sekolah</strong></h3>
    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <div class="row">
          <?php foreach ($fasilitas['items'] as $item) { ?>
            <div class="col-md-6">
              <p><i class="fas fa-star"></i>&nbsp;<?= $item; ?></p>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
  <?php } ?>

  <?php if (!empty($ekstra['items'])) { ?>
    <h3><strong>Ekstrakurikuler</strong></h3>
    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <div class="row">
          <?php foreach ($ekstra['items'] as $item) { ?>
            <div class="col-md-6">
              <p><i class="fas fa-history" style="font-size: 24px;"></i>&nbsp;<?= $item['text']; ?></p>
            </div>
          <?php } ?>
        </div>
      </div>
    </div>
  <?php } ?>
  <?php if (!empty($photo_teachers)) { ?>
    <h3><strong>Pengajar</strong></h3>
    <div class="row my-3 mb-4">
      <div class="col-md-6">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <?php
            $isFirst = true;
            $isBlock = true;
            $counter = 0;
            $check = 0;
            $wClosed = false;
            ?>
            <?php foreach ($photo_teachers as $teach) { ?>
              <?php
              $check++;
              if ($isBlock) {
                $wClosed = true;
                echo '<div class="carousel-item' . ($isFirst ? ' active' : '') . '"><div class="cards-wrapper">';
              }
              ?>
              <div class="card <?= $check <> 1 ?  'd-none d-md-block' : ''; ?>">
                <img src="<?= $teach['thumb']; ?>" class="card-img-top" alt="...">
                <div class="card-body">
                  <h4 class="card-title"><strong><?=$teach['image_name'];?></strong></h4>
                  <p class="card-text"><small class="text-muted"><?=$teach['image_description'];?></small></p>

                </div>
              </div>

              <?php $counter++;
              $isFirst = false;
              $isBlock = false;
              $countImage = 4;
              if ($check == $countImage) {
                $isBlock = true;
                $check = 0;
                $wClosed = false;
                echo '</div></div>';
              } ?>
            <?php } ?>
            <?php if ($wClosed) {
              echo '</div></div>';
            } ?>

          </div>
          <!--control-->
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>

        </div>

      </div>
    </div>
  <?php } ?>

  <?php if (!empty($jam['items'])) { ?>
    <h3><strong>Jam Belajar</strong></h3>
    <div class="row my-3">
      <div class="col-md-6">
        <table class="table table-striped border">
          <th class="table-success">Hari</th>
          <th class="table-success">Waktu</th>
          <?php foreach ($jam['items'] as $item) { ?>
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

  <div class="row">
  </div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
  var multiplePsCard = document.querySelector(
    "#psControl"
  );
  if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel1 = new bootstrap.Carousel(multiplePsCard, {
      interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#psControl .carousel-control-next").on("click", function() {
      if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#psControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
    $("#psControl .carousel-control-prev").on("click", function() {
      if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#psControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
  } else {
    $(multiplePsCard).addClass("slide");
  }



  var multiTeacherCard = document.querySelector(
    "#teacherControl"
  );
  if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel = new bootstrap.Carousel(multiTeacherCard, {
      interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#teacherControl .carousel-control-next").on("click", function() {
      if (scrollPosition < carouselWidth - cardWidth * 4) {
        scrollPosition += cardWidth;
        $("#teacherControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
    $("#teacherControl .carousel-control-prev").on("click", function() {
      if (scrollPosition > 0) {
        scrollPosition -= cardWidth;
        $("#teacherControl .carousel-inner").animate({
            scrollLeft: scrollPosition
          },
          600
        );
      }
    });
  } else {
    $(multiTeacherCard).addClass("slide");
  }
</script>



<script>
  $(document).ready(function() {

    //Show carousel-control

    $("#myCarousel").mouseover(function() {
      $("#myCarousel .carousel-control").show();
    });

    $("#myCarousel").mouseleave(function() {
      $("#myCarousel .carousel-control").hide();
    });

    //Active thumbnail

    $("#thumbCarousel .thumb").on("click", function() {
      $(this).addClass("active");
      $(this).siblings().removeClass("active");

    });

    //When the carousel slides, auto update

    $('#myCarousel').on('slid.bs.carousel', function() {
      var index = $('.carousel-inner2 .item.active').index();
      //console.log(index);
      var thumbnailActive = $('#thumbCarousel .thumb[data-slide-to="' + index + '"]');
      thumbnailActive.addClass('active');
      $(thumbnailActive).siblings().removeClass("active");
      //console.log($(thumbnailActive).siblings());
    });
  });
</script>
<script>
  $('#myCarousel').carousel({
    interval: false
  });
  $('#carousel-thumbs').carousel({
    interval: false
  });

  // handles the carousel thumbnails
  // https://stackoverflow.com/questions/25752187/bootstrap-carousel-with-thumbnails-multiple-carousel
  $('[id^=carousel-selector-]').click(function() {
    var id_selector = $(this).attr('id');
    var id = parseInt(id_selector.substr(id_selector.lastIndexOf('-') + 1));
    $('#myCarousel').carousel(id);
  });
  // Only display 3 items in nav on mobile.
  if ($(window).width() < 575) {
    $('#carousel-thumbs .row div:nth-child(4)').each(function() {
      var rowBoundary = $(this);
      $('<div class="row mx-0">').insertAfter(rowBoundary.parent()).append(rowBoundary.nextAll().addBack());
    });
    $('#carousel-thumbs .carousel-item .row:nth-child(even)').each(function() {
      var boundary = $(this);
      $('<div class="carousel-item">').insertAfter(boundary.parent()).append(boundary.nextAll().addBack());
    });
  }
  // Hide slide arrows if too few items.
  if ($('#carousel-thumbs .carousel-item').length < 2) {
    $('#carousel-thumbs [class^=carousel-control-]').remove();
    $('.machine-carousel-container #carousel-thumbs').css('padding', '0 5px');
  }
  // when the carousel slides, auto update
  $('#myCarousel').on('slide.bs.carousel', function(e) {
    var id = parseInt($(e.relatedTarget).attr('data-slide-number'));
    $('[id^=carousel-selector-]').removeClass('selected');
    $('[id=carousel-selector-' + id + ']').addClass('selected');
  });
  // when user swipes, go next or previous
  $('#myCarousel').swipe({
    fallbackToMouseEvents: true,
    swipeLeft: function(e) {
      $('#myCarousel').carousel('next');
    },
    swipeRight: function(e) {
      $('#myCarousel').carousel('prev');
    },
    allowPageScroll: 'vertical',
    preventDefaultEvents: false,
    threshold: 75
  });
  /*
  $(document).on('click', '[data-toggle="lightbox"]', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
  });
  */

  $('#myCarousel .carousel-item img').on('click', function(e) {
    var src = $(e.target).attr('data-remote');
    if (src) $(this).ekkoLightbox();
  });
</script>
