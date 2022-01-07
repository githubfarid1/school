<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php if (isset($breadcrumb['active']) && $breadcrumb['active']) { ?>
          <li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
        <?php } else { ?>
          <li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      <?php } ?>
    </ol>
  </nav>
