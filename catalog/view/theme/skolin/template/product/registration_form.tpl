<?php echo $header; ?>

<style>
    label {
        margin-top: 10px;
    }

    .help-inline-error {
        color: red;
    }
</style>
<div class="clearfix"></div>
<div class="container alert alert-light">
    <form name="basicform" id="basicform" method="post" action="yourpage.html">
        <!-- id will be unique, but class name will be same -->
        <div class="container">
            <div id="sf1" class="frm">
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            <strong>Data Diri Siswa</strong>
                        </div>
                    </div>
                </div>
                <fieldset>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="student_name">Nama Siswa</label>
                                <input type="text" placeholder="" id="student-name" name="student_name" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_nickname">Nama Panggilan</label>
                                <input type="text" placeholder="" id="student-nickname" name="student_nickname" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_sex">Jenis Kelamin</label>
                                <select name="student_sex" id="" class="form-control">
                                    <option value="L">Laki-Laki</option>
                                    <option value="P">Perempuan</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="student_birthplace">Tempat Lahir</label>
                                <input type="text" placeholder="" id="student-birthplace" name="student_birthplace" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_birthdate">Tanggal Lahir</label>
                                <input type="date" placeholder="" id="student-birthdate" name="student_birthdate" class="form-control" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="student_nokk">No KK (Kartu Keluarga)</label>
                                <input type="text" placeholder="" id="student-nokk" name="student_nokk" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_nik">NIK (Bagi WNA diisi No KITAS)</label>
                                <input type="text" placeholder="" id="student-nik" name="student_nik" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_nisn">NISN (Wajib diisi apabila sudah ada)</label>
                                <input type="text" placeholder="" id="student-nisn" name="student_nisn" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_religion">Agama</label>
                                <select name="student_religion" id="" class="form-control">
                                    <?php foreach ($religions as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="student_citizen">Kewarganegaraan</label>
                                <select name="student_citizen" id="" class="form-control">
                                    <option value="1">WNI</option>
                                    <option value="2">WNA</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="student_language">Bahasa sehari-hari</label>
                                <input type="text" placeholder="" id="student-language" name="student_language" class="form-control" autocomplete="off">
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <button class="btn btn-primary open1 float-right" type="button">Next <span class="fa fa-arrow-right"></span></button>
                            </div>

                        </div>

                    </div>
                </fieldset>
            </div>

        </div>

        <div class="container">
            <div id="sf2" class="frm">
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            <strong>Data Diri Siswa</strong>
                        </div>
                    </div>
                </div>
                <fieldset>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="student_status">Status Anak</label>
                                <select name="student_status" id="" class="form-control">
                                    <option value="1">Anak Kandung</option>
                                    <option value="2">Anak Tiri</option>
                                    <option value="3">Anak Angkat</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <div class="form-group pr-3">
                                    <label for="student_childorder">Anak ke</label>
                                    <input type="number" placeholder="" id="student-childorder" name="student_childorder" class="form-control" autocomplete="off">
                                </div>
                                <div class="form-group pr-3">
                                    <label for="student_csibling">Jumlah saudara</label>
                                    <input type="number" placeholder="" id="student-csibling" name="student_csibling" class="form-control" autocomplete="off">
                                </div>
                                <div class="form-group">
                                    <label for="student_blood">Golongan Darah</label>
                                    <select name="student_blood" id="" class="form-control">
                                        <option value="1">A</option>
                                        <option value="2">B</option>
                                        <option value="3">O</option>
                                        <option value="4">AB</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="student_live">Tinggal bersama</label>
                                <select name="student_live" id="" class="form-control">
                                    <option value="1">Orangtua Kandung</option>
                                    <option value="2">Orangtua angkat</option>
                                    <option value="3">Kos</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <div class="col-md-4">
                                    <label for="student_weight">Berat Badan</label>
                                    <div class="input-group">
                                        <input type="number" placeholder="" id="student-weight" name="student_weight" class="form-control" autocomplete="off">
                                        <div class="input-group-append">
                                            <span class="input-group-text">CM</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="student_height">Tinggi Badan</label>
                                    <div class="input-group">
                                        <input type="number" placeholder="" id="student-height" name="student_height" class="form-control" autocomplete="off">
                                        <div class="input-group-append">
                                            <span class="input-group-text">KG</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="student_hobby">Hobi</label>
                                <input type="text" placeholder="" id="student-hobby" name="student_hobby" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_deseas">Riwayat Penyakit</label>
                                <input type="text" placeholder="" id="student-deseas" name="student_deseas" class="form-control" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="student_provinsi">Provinsi</label>
                                <select name="student_provinsi" id="select2-provinsi" class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="student_kabupaten">Kabupaten</label>
                                <select name="student_kabupaten" id="select2-kabupaten" class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="student_kecamatan">Kecamatan</label>
                                <select name="student_kecamatan" id="select2-kecamatan" class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="student_kelurahan">Kelurahan</label>
                                <select name="student_kelurahan" id="select2-kelurahan" class="form-control"></select>
                            </div>
                            <div class="form-group">
                                <label for="student_address">Alamat</label>
                                <input type="text" placeholder="" id="student-address" name="student_address" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="student_distance">Jarak dari rumah ke Sekolah</label>
                                <input type="text" placeholder="" id="student-distance" name="student_distance" class="form-control" autocomplete="off">
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <div class="float-right">
                                    <button class="btn btn-warning back2" type="button"><span class="fa fa-arrow-left"></span> Back</button>
                                    <button class="btn btn-primary open2" type="button">Next <span class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>

                        </div>

                    </div>
                </fieldset>
            </div>

        </div>

        <div class="container">
            <div id="sf3" class="frm">
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            <strong>Data Ayah</strong>
                        </div>
                    </div>
                </div>
                <fieldset>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="father_name">Nama Ayah</label>
                                <div class="input-group">
                                    <div class="col-md-9">
                                        <input type="text" placeholder="" id="father-name" name="father_name" class="form-control" autocomplete="off">

                                    </div>
                                    <div class="col-md-3 col-6">
                                        <select name="father_active" id="" class="form-control">
                                            <option value="1">Ada</option>
                                            <option value="2">Tidak Ada</option>
                                        </select>

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="father_nik">NIK (Bagi WNA diisi No KITAS)</label>
                                <input type="text" placeholder="" id="father-nik" name="father_nik" class="form-control" autocomplete="off">
                            </div>

                            <div class="form-group">
                                <label for="father_birthplace">Tempat Lahir</label>
                                <input type="text" placeholder="" id="father-birthplace" name="father_birthplace" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_birthdate">Tanggal Lahir</label>
                                <input type="date" placeholder="" id="father-birthdate" name="father_birthdate" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_edu">Pendidikan</label>
                                <select name="father_edu" id="" class="form-control">
                                    <?php foreach ($educations as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="father_job">Pekerjaan</label>
                                <select name="father_job" id="" class="form-control">
                                    <?php foreach ($jobs as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="father_salary">Penghasilan Perbulan</label>
                                <select name="father_salary" id="" class="form-control">
                                    <?php foreach ($salaries as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="father_workto">Nama Tempat Bekerja</label>
                                <input type="text" placeholder="" id="father-workto" name="father_workto" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_workaddress">Alamat Tempat Bekerja</label>
                                <input type="text" placeholder="" id="father-workaddress" name="father_workaddress" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_workphone">No Telephone Tempat Bekerja</label>
                                <input type="text" placeholder="" id="father-workphone" name="father_workphone" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_mail">Email Ayah</label>
                                <input type="text" placeholder="" id="father-mail" name="father_mail" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_phonewa1">No Handphone Ayah</label>
                                <input type="text" placeholder="isi dengan no WhatsApp" id="father-phonewa1" name="father_phonewa1" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="father_phonewa2">No Handphone Ayah</label>
                                <input type="text" placeholder="Jika berbeda dengan no WhatsApp" id="father-phonewa2" name="father_phonewa2" class="form-control" autocomplete="off">
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <div class="float-right">
                                    <button class="btn btn-warning back3" type="button"><span class="fa fa-arrow-left"></span> Back</button>
                                    <button class="btn btn-primary open3" type="button">Next <span class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>

                        </div>

                    </div>

                </fieldset>
            </div>

        </div>


        <div class="container">
            <div id="sf4" class="frm">
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            <strong>Data Ibu</strong>
                        </div>
                    </div>
                </div>
                <fieldset>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="mother_name">Nama Ibu</label>
                                <div class="input-group">
                                    <div class="col-md-9">
                                        <input type="text" placeholder="" id="mother-name" name="mother_name" class="form-control" autocomplete="off">

                                    </div>
                                    <div class="col-md-3 col-6">
                                        <select name="mother_active" id="" class="form-control">
                                            <option value="1">Ada</option>
                                            <option value="2">Tidak Ada</option>
                                        </select>

                                    </div>

                                </div>
                            </div>

                            <div class="form-group">
                                <label for="mother_nik">NIK (Bagi WNA diisi No KITAS)</label>
                                <input type="text" placeholder="" id="mother-nik" name="mother_nik" class="form-control" autocomplete="off">
                            </div>

                            <div class="form-group">
                                <label for="mother_birthplace">Tempat Lahir</label>
                                <input type="text" placeholder="" id="mother-birthplace" name="mother_birthplace" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_birthdate">Tanggal Lahir</label>
                                <input type="date" placeholder="" id="mother-birthdate" name="mother_birthdate" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_edu">Pendidikan</label>
                                <select name="mother_edu" id="" class="form-control">
                                    <?php foreach ($educations as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="mother_job">Pekerjaan</label>
                                <select name="mother_job" id="" class="form-control">
                                    <?php foreach ($jobs as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="mother_salary">Penghasilan Perbulan</label>
                                <select name="mother_salary" id="" class="form-control">
                                    <?php foreach ($salaries as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="mother_workto">Nama Tempat Bekerja</label>
                                <input type="text" placeholder="" id="mother-workto" name="mother_workto" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_workaddress">Alamat Tempat Bekerja</label>
                                <input type="text" placeholder="" id="mother-workaddress" name="mother_workaddress" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_workphone">No Telephone Tempat Bekerja</label>
                                <input type="text" placeholder="" id="mother-workphone" name="mother_workphone" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_mail">Email Ibu</label>
                                <input type="text" placeholder="" id="mother-mail" name="mother_mail" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_phonewa1">No Handphone Ibu</label>
                                <input type="text" placeholder="isi dengan no WhatsApp" id="mother-phonewa1" name="mother_phonewa1" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="mother_phonewa2">No Handphone Ibu</label>
                                <input type="text" placeholder="Jika berbeda dengan no WhatsApp" id="mother-phonewa2" name="mother_phonewa2" class="form-control" autocomplete="off">
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <div class="float-right">
                                    <button class="btn btn-warning back4" type="button"><span class="fa fa-arrow-left"></span> Back</button>
                                    <button class="btn btn-primary open4" type="button">Next <span class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>

                        </div>

                    </div>

                </fieldset>
            </div>

        </div>

        <div class="container">
            <div id="sf5" class="frm">
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-info text-center" role="alert">
                            <strong>Data Wali</strong>
                        </div>
                    </div>
                </div>
                <fieldset>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="wali_name">Nama Wali</label>
                                <input type="text" placeholder="" id="wali-name" name="wali_name" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_nik">NIK (Bagi WNA diisi No KITAS)</label>
                                <input type="text" placeholder="" id="wali-nik" name="wali_nik" class="form-control" autocomplete="off">
                            </div>

                            <div class="form-group">
                                <label for="wali_birthplace">Tempat Lahir</label>
                                <input type="text" placeholder="" id="wali-birthplace" name="wali_birthplace" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_birthdate">Tanggal Lahir</label>
                                <input type="date" placeholder="" id="wali-birthdate" name="wali_birthdate" class="form-control" autocomplete="off">
                            </div>


                            <div class="input-group">
                                <div class="col-md-6">
                                    <label for="wali_edu">Pendidikan</label>
                                    <select name="wali_edu" id="" class="form-control">
                                        <?php foreach ($educations as $key => $rel) { ?>
                                            <option value="<?= $key; ?>"><?= $rel; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="wali_job">Pekerjaan</label>
                                    <select name="wali_job" id="" class="form-control">
                                        <?php foreach ($jobs as $key => $rel) { ?>
                                            <option value="<?= $key; ?>"><?= $rel; ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>


                            <div class="input-group">
                                <div class="col-md-6">
                                    <label for="wali_religon">Agama</label>
                                    <select name="wali_religon" id="" class="form-control">
                                        <?php foreach ($religions as $key => $rel) { ?>
                                            <option value="<?= $key; ?>"><?= $rel; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="wali_relation">Hubungan dengan Siswa</label>
                                    <select name="wali_relation" id="" class="form-control">
                                        <?php foreach ($relations as $key => $rel) { ?>
                                            <option value="<?= $key; ?>"><?= $rel; ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="wali_salary">Penghasilan Perbulan</label>
                                <select name="wali_salary" id="" class="form-control">
                                    <?php foreach ($salaries as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="wali_workto">Nama Tempat Bekerja</label>
                                <input type="text" placeholder="" id="wali-workto" name="wali_workto" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_workaddress">Alamat Tempat Bekerja</label>
                                <input type="text" placeholder="" id="wali-workaddress" name="wali_workaddress" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_workphone">No Telephone Tempat Bekerja</label>
                                <input type="text" placeholder="" id="wali-workphone" name="wali_workphone" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_mail">Email Wali</label>
                                <input type="text" placeholder="" id="wali-mail" name="wali_mail" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_phonewa1">No Handphone Wali</label>
                                <input type="text" placeholder="isi dengan no WhatsApp" id="wali-phonewa1" name="wali_phonewa1" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="wali_phonewa2">No Handphone Wali</label>
                                <input type="text" placeholder="Jika berbeda dengan no WhatsApp" id="wali-phonewa2" name="mother_phonewa2" class="form-control" autocomplete="off">
                            </div>

                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <div class="float-right">
                                    <button class="btn btn-warning back5" type="button"><span class="fa fa-arrow-left"></span> Back</button>
                                    <button class="btn btn-primary open5" type="button">Next <span class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>

                        </div>

                    </div>

                </fieldset>
            </div>

        </div>

        <div class="container">
            <div id="sf6" class="frm">
                <fieldset>
                    <div class="row">
                        <div class="col-md-6 mt-3">
                            <div class="alert alert-info text-center" role="alert">
                                <strong>Data Sekolah Asal</strong>
                            </div>
                            <div class="form-group">
                                <label for="education_level">Jenjang Pendidikan</label>
                                <select name="education_level" id="" class="form-control">
                                    <?php foreach ($edulevels as $key => $rel) { ?>
                                        <option value="<?= $key; ?>"><?= $rel; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="education_name">Nama Sekolah</label>
                                <input type="text" placeholder="" id="education-name" name="education_name" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="education_address">Alamat Sekolah</label>
                                <input type="text" placeholder="" id="education-address" name="education_address" class="form-control" autocomplete="off">
                            </div>
                            <div class="form-group">
                                <label for="education_phone">No Telephone Sekolah</label>
                                <input type="text" placeholder="" id="education-phone" name="education_phone" class="form-control" autocomplete="off">
                            </div>

                            <div class="input-group">
                                <div class="col-md-4">
                                    <label for="education_startat">Masuk</label>
                                    <input type="number" placeholder="" id="education-startat" name="education_startat" class="form-control" autocomplete="off">
                                </div>
                                <div class="col-md-4">
                                    <label for="education_endat">Lulus</label>
                                    <input type="number" placeholder="" id="education-endat" name="education_endat" class="form-control" autocomplete="off">
                                </div>

                            </div>

                        </div>


                        <div class="col-md-6 mt-3">
                            <div class="alert alert-info text-center" role="alert">
                                <strong>Upload Berkas</strong>
                            </div>
                            <div class="form-group">
                                <label for="file_fatherktp">KTP Ayah</label>
                                <input type="file" class="form-control" id="file-fatherktp" name="file_fatherktp">
                            </div>
                            <div class="form-group">
                                <label for="file_motherktp">KTP Ibu</label>
                                <input type="file" class="form-control" id="file-motherktp" name="file_motherktp">
                            </div>
                            <div class="form-group">
                                <label for="file_waliktp">KTP Wali</label>
                                <input type="file" class="form-control" id="file-waliktp" name="file_waliktp">
                            </div>
                            <div class="form-group">
                                <label for="file_kk">Kartu Keluarga</label>
                                <input type="file" class="form-control" id="file-kk" name="file_kk">
                            </div>
                            <div class="form-group">
                                <label for="file_akte">Akte Kelahiran</label>
                                <input type="file" class="form-control" id="file-akte" name="file_akte">
                            </div>
                            <div class="form-group">
                                <label for="file_raport">Raport Terakhir</label>
                                <input type="file" class="form-control" id="file-raport" name="file_raport">
                            </div>
                            <div class="form-group">
                                <label for="file_photo">Foto Siswa</label>

                                <input type="file" class="form-control" id="file-photo" name="file_photo">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <!-- open1 is given in the class that is binded with the click event -->
                                <div class="float-right">
                                    <button class="btn btn-warning back6" type="button"><span class="fa fa-arrow-left"></span> Back</button>
                                    <button class="btn btn-primary open6" type="button">Next <span class="fa fa-arrow-right"></span></button>
                                </div>
                            </div>

                        </div>

                    </div>
                </fieldset>
            </div>

        </div>



    </form>

</div>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-validate/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script type="text/javascript">
    jQuery().ready(function() {
        $(".frm").hide("fast");
        $("#sf1").show("fast");
        $(window).scrollTop(0);
        // validate form on keyup and submit
        var v = jQuery("#basicform").validate({
            rules: {
                uname: {
                    required: true,
                    minlength: 2,
                    maxlength: 16
                },
                uemail: {
                    required: true,
                    minlength: 2,
                    email: true,
                    maxlength: 100,
                },
                upass1: {
                    required: true,
                    minlength: 6,
                    maxlength: 15,
                },
                upass2: {
                    required: true,
                    minlength: 6,
                    equalTo: "#upass1",
                }

            },
            errorElement: "span",
            errorClass: "help-inline-error",
        });

        $(".open1").click(function() {
            if (v.form()) {
                $(".frm").hide("fast");
                $("#sf2").show("fast");
            }
            $('html, body').animate({
                scrollTop: $("#sf2").offset().top
            }, 1000);
        });

        $(".open2").click(function() {
            if (v.form()) {
                $(".frm").hide("fast");
                $("#sf3").show("fast");
            }
            $('html, body').animate({
                scrollTop: $("#sf3").offset().top
            }, 1000);

        });
        $(".open3").click(function() {
            if (v.form()) {
                $(".frm").hide("fast");
                $("#sf4").show("fast");
            }
            $('html, body').animate({
                scrollTop: $("#sf4").offset().top
            }, 1000);

        });
        $(".open4").click(function() {
            if (v.form()) {
                $(".frm").hide("fast");
                $("#sf5").show("fast");
            }
            $('html, body').animate({
                scrollTop: $("#sf5").offset().top
            }, 1000);

        });
        $(".open5").click(function() {
            if (v.form()) {
                $(".frm").hide("fast");
                $("#sf6").show("fast");
            }
            $('html, body').animate({
                scrollTop: $("#sf6").offset().top
            }, 1000);

        });

        $(".open6").click(function() {
            if (v.form()) {
                $("#loader").show();
                setTimeout(function() {
                    $("#basicform").html('<h2>Thanks for your time.</h2>');
                }, 100);
                $(window).scrollTop(0);
                return false;
            }

        });

        $(".back2").click(function() {
            $(".frm").hide("fast");
            $("#sf1").show("fast");
            $('html, body').animate({
                scrollTop: $("#sf1").offset().top
            }, 1000);

        });

        $(".back3").click(function() {
            $(".frm").hide("fast");
            $("#sf2").show("fast");
            $('html, body').animate({
                scrollTop: $("#sf2").offset().top
            }, 1000);

        });
        $(".back4").click(function() {
            $(".frm").hide("fast");
            $("#sf3").show("fast");
            $('html, body').animate({
                scrollTop: $("#sf3").offset().top
            }, 1000);

        });
        $(".back5").click(function() {
            $(".frm").hide("fast");
            $("#sf4").show("fast");
            $('html, body').animate({
                scrollTop: $("#sf4").offset().top
            }, 1000);

        });
        $(".back6").click(function() {
            $(".frm").hide("fast");
            $("#sf5").show("fast");
            $('html, body').animate({
                scrollTop: $("#sf5").offset().top
            }, 1000);

        });



        //--------------//
        var urlProvinsi = "data-indonesia/provinsi.json";
        var urlKabupaten = "data-indonesia/kabupaten/";
        var urlKecamatan = "data-indonesia/kecamatan/";
        var urlKelurahan = "data-indonesia/kelurahan/";

        function clearOptions(id) {
            console.log("on clearOptions :" + id);

            //$('#' + id).val(null);
            $('#' + id).empty().trigger('change');
        }

        console.log('Load Provinsi...');
        $.getJSON(urlProvinsi, function(res) {

            res = $.map(res, function(obj) {
                obj.text = obj.nama
                return obj;
            });

            data = [{
                id: "",
                nama: "- Pilih Provinsi -",
                text: "- Pilih Provinsi -"
            }].concat(res);

            //implemen data ke select provinsi
            $("#select2-provinsi").select2({
                dropdownAutoWidth: true,
                width: '100%',
                data: data
            })
        });

        var selectProv = $('#select2-provinsi');
        $(selectProv).change(function() {
            var value = $(selectProv).val();
            clearOptions('select2-kabupaten');

            if (value) {
                console.log("on change selectProv");

                var text = $('#select2-provinsi :selected').text();
                console.log("value = " + value + " / " + "text = " + text);

                console.log('Load Kabupaten di ' + text + '...')
                $.getJSON(urlKabupaten + value + ".json", function(res) {

                    res = $.map(res, function(obj) {
                        obj.text = obj.nama
                        return obj;
                    });

                    data = [{
                        id: "",
                        nama: "- Pilih Kabupaten -",
                        text: "- Pilih Kabupaten -"
                    }].concat(res);

                    //implemen data ke select provinsi
                    $("#select2-kabupaten").select2({
                        dropdownAutoWidth: true,
                        width: '100%',
                        data: data
                    })
                })
            }
        });

        var selectKab = $('#select2-kabupaten');
        $(selectKab).change(function() {
            var value = $(selectKab).val();
            clearOptions('select2-kecamatan');

            if (value) {
                console.log("on change selectKab");

                var text = $('#select2-kabupaten :selected').text();
                console.log("value = " + value + " / " + "text = " + text);

                console.log('Load Kecamatan di ' + text + '...')
                $.getJSON(urlKecamatan + value + ".json", function(res) {

                    res = $.map(res, function(obj) {
                        obj.text = obj.nama
                        return obj;
                    });

                    data = [{
                        id: "",
                        nama: "- Pilih Kecamatan -",
                        text: "- Pilih Kecamatan -"
                    }].concat(res);

                    //implemen data ke select provinsi
                    $("#select2-kecamatan").select2({
                        dropdownAutoWidth: true,
                        width: '100%',
                        data: data
                    })
                })
            }
        });

        var selectKec = $('#select2-kecamatan');
        $(selectKec).change(function() {
            var value = $(selectKec).val();
            clearOptions('select2-kelurahan');

            if (value) {
                console.log("on change selectKec");

                var text = $('#select2-kecamatan :selected').text();
                console.log("value = " + value + " / " + "text = " + text);

                console.log('Load Kelurahan di ' + text + '...')
                $.getJSON(urlKelurahan + value + ".json", function(res) {

                    res = $.map(res, function(obj) {
                        obj.text = obj.nama
                        return obj;
                    });

                    data = [{
                        id: "",
                        nama: "- Pilih Kelurahan -",
                        text: "- Pilih Kelurahan -"
                    }].concat(res);

                    //implemen data ke select provinsi
                    $("#select2-kelurahan").select2({
                        dropdownAutoWidth: true,
                        width: '100%',
                        data: data
                    })
                })
            }
        });

        var selectKel = $('#select2-kelurahan');
        $(selectKel).change(function() {
            var value = $(selectKel).val();

            if (value) {
                console.log("on change selectKel");

                var text = $('#select2-kelurahan :selected').text();
                console.log("value = " + value + " / " + "text = " + text);
            }
        });
        //-----//




    });
</script>

<?php echo $footer; ?>
