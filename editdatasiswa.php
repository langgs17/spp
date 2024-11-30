<?php include 'header.php';
include 'koneksi.php';

if (isset($_GET['nisn'])) {
  $nisn = $_GET['nisn'];

  $query = "SELECT * FROM siswa WHERE nisn = $nisn";
  $exec = mysqli_query($conn, $query);
  $res = mysqli_fetch_assoc($exec);

  $nisn = $res['nisn'];

  $exec     = mysqli_query($conn, "DELETE FROM siswa WHERE nisn='$nisn'");
  $exec1     = mysqli_query($conn, "DELETE FROM pembayaran WHERE nisn='$nisn'");
  $exec2     = mysqli_query($conn, "DELETE FROM siswatemp WHERE nisn='$nisn'");

  if ($exec && $exec1) {
    echo "<script>alert('data siswa berhasil dihapus')
    document.location = 'editdatasiswa.php';
    </script>";
  } else {
    echo "<script>alert('data siswa gagal dihapus')
    document.location = 'editdatasiswa.php';
    </script>";
  }
}
$sqlx = "SELECT siswa.*, angkatan.*, jurusan.*, kelas.* FROM siswa, angkatan, jurusan, kelas WHERE siswa.id_angkatan = angkatan.nama_angkatan AND siswa.id_jurusan = jurusan.id_jurusan AND siswa.id_kelas = kelas.id_kelas";
$q = mysqli_query($conn, $sqlx);
while ($hasil = mysqli_fetch_array($q)) {
  //UPDATE `siswatemp` SET `kls11` = '1' WHERE `siswatemp`.`nisn` = '20220728092600';;

  $updates = "UPDATE `siswatemp` SET kls$hasil[kelas]='$hasil[nama_kelas]' WHERE `siswatemp`.`nisn` = '$hasil[nisn]'";
  //echo $updates;
  $qupd = mysqli_query($conn, $updates);
  //if($qupd) echo "berhasil";
  //else echo "gagal";
}

?>

<style>
  input[type="number"]::-webkit-inner-spin-button,
  input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    appearance: none;
    margin: 0;
  }

  input[type="number"] {
    -moz-appearance: textfield;
  }
</style>

<button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#exampleModal">Tambah Data</button>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h5 class="m-0 font-weight-bold text-primary">Data Siswa</h5>
  </div>
  <div class="card-body">
    <form method="GET" action="">
      <div class="form-group">
        <label for="filterAngkatan">Pilih Angkatan:</label>
        <select name="angkatan" id="filterAngkatan" class="form-control" onchange="this.form.submit()">
          <option value="">Semua Angkatan</option>
          <?php
          // Ambil data angkatan dari database
          $angkatanQuery = "SELECT DISTINCT nama_angkatan FROM angkatan ORDER BY nama_angkatan ASC";
          $angkatanExec = mysqli_query($conn, $angkatanQuery);
          while ($angkatanRow = mysqli_fetch_assoc($angkatanExec)) {
            $selected = (isset($_GET['angkatan']) && $_GET['angkatan'] == $angkatanRow['nama_angkatan']) ? 'selected' : '';
            echo "<option value='{$angkatanRow['nama_angkatan']}' $selected>{$angkatanRow['nama_angkatan']}</option>";
          }
          ?>
        </select>
      </div>
    </form>
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>NISN</th>
            <th>Nama</th>
            <th>Angkatan</th>
            <th>Jurusan</th>
            <th>Kelas</th>
            <th>Jenis Kelamin</th>
            <th>Tempat Tanggal Lahir</th>
            <th>Alamat</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          // Filter angkatan jika dipilih
          $filterAngkatan = isset($_GET['angkatan']) && !empty($_GET['angkatan']) ? $_GET['angkatan'] : '';
          $query = "SELECT siswa.*, angkatan.*, jurusan.*, kelas.* 
                    FROM siswa 
                    JOIN angkatan ON siswa.id_angkatan = angkatan.nama_angkatan 
                    JOIN jurusan ON siswa.id_jurusan = jurusan.id_jurusan 
                    JOIN kelas ON siswa.id_kelas = kelas.id_kelas";

          if ($filterAngkatan) {
            $query .= " WHERE angkatan.nama_angkatan = '$filterAngkatan'";
          }

          $query .= " ORDER BY siswa.nama DESC";
          $exec = mysqli_query($conn, $query);
          while ($res = mysqli_fetch_assoc($exec)) :
          ?>
            <tr>
              <td><?= $res['nisn'] ?></td>
              <td><?= $res['nama'] ?></td>
              <td><?= $res['nama_angkatan'] ?></td>
              <td><?= $res['nama_jurusan'] ?></td>
              <td><?= $res['nama_kelas'] ?></td>
              <td><?= $res['jenis_kelamin'] ?></td>
              <td><?= $res['ttl'] ?></td>
              <td><?= $res['alamat'] ?></td>
              <td>
                <a href="editdatasiswa.php?nisn=<?= $res['nisn'] ?>" class="btn btn-sm btn-danger" onclick="return confirm ('Apakah yakin ingin menghapus siswa (<?php echo $res['nama']; ?>) ?')">Hapus</a>
                <a href="#" class="view_data btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#myModal" id="<?php echo $res['nisn']; ?>">Edit</a>
              </td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>


<!-- Modal Tambah Data -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Data Siswa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body">
        <form action="" method="POST">
          <input type="number" maxlength="10" oninput="this.value = this.value.slice(0, 10);" required name="nisn" placeholder="Masukan NISN" class="form-control mb-2">
          <input type="text" required name="nama" placeholder="Nama Siswa" class="form-control mb-2">
          <select class="form-control mb-2" name="jenis_kelamin">
            <option selected="">Jenis Kelamin</option>
            <option value="laki-laki">Laki-Laki</option>
            <option value="perempuan">Perempuan</option>
          </select>
          <input type="text" required name="ttl" placeholder="Tempat Tanggal Lahir" class="form-control mb-2">
          <select class="form-control mb-2" name="id_angkatan">
            <option selected="">Pilih Angkatan</option>
            <?php
            $exec = mysqli_query($conn, "SELECT * FROM angkatan order by id_angkatan");
            while ($angkatan = mysqli_fetch_assoc($exec)) :
              echo "<option value = " . $angkatan['nama_angkatan'] . ">" . $angkatan['nama_angkatan'] . "</option>";
            endwhile;
            ?>
          </select>
          <select class="form-control mb-2" name="id_jurusan">
            <option selected="">Pilih Jurusan</option>
            <?php
            $exec = mysqli_query($conn, "SELECT * FROM jurusan order by id_jurusan");
            while ($angkatan = mysqli_fetch_assoc($exec)) :
              echo "<option value = " . $angkatan['id_jurusan'] . ">" . $angkatan['nama_jurusan'] . "</option>";
            endwhile;
            ?>
          </select>
          <select class="form-control mb-2" name="id_kelas">
            <option selected="">Pilih Kelas</option>
            <?php
            $exec = mysqli_query($conn, "SELECT * FROM kelas order by id_kelas");
            while ($angkatan = mysqli_fetch_assoc($exec)) :
              echo "<option value = " . $angkatan['id_kelas'] . ">" . $angkatan['nama_kelas'] . "</option>";
            endwhile;
            ?>
          </select>
          <textarea class="form-control mb-2" required name="alamat" placeholder="Alamat Siswa"></textarea>

      </div>
      <div class="modal-footer">
        <input type="hidden" name="angkatan" value="<?= $angkatan['nama_angkatan']; ?>">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="Submit" name="simpan" class="btn btn-primary">Simpan</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal Edit Data Siswa -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Edit Data Siswa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body" id="datasiswa">
      </div>
    </div>
  </div>
</div>

<?php


if (isset($_POST['simpan'])) {
  $nama          = htmlentities(strip_tags(ucwords($_POST['nama'])));
  $id_angkatan   = htmlentities(strip_tags($_POST['id_angkatan']));
  $id_jurusan    = htmlentities(strip_tags($_POST['id_jurusan']));
  $id_kelas      = htmlentities(strip_tags($_POST['id_kelas']));
  $alamat        = htmlentities(strip_tags(ucwords($_POST['alamat'])));
  $nisn = htmlentities(strip_tags($_POST['nisn']));
  $tahun         = htmlentities(strip_tags($_POST['id_angkatan']));
  $jenis_kelamin = htmlentities(strip_tags($_POST['jenis_kelamin']));
  $ttl           = htmlentities(strip_tags($_POST['ttl']));

  $tahunanggaran = substr($tahun, 0, 4);
  $nexttahunanggaran = $tahunanggaran + 1;

  $query = "INSERT INTO siswa (nisn, nama, id_angkatan, id_jurusan, id_kelas, alamat, jenis_kelamin, ttl) VALUES('$nisn','$nama','$id_angkatan','$id_jurusan','$id_kelas','$alamat','$jenis_kelamin','$ttl')";
  $exec = mysqli_query($conn, $query);



  $q2 = "insert into siswatemp (nisn, tahun) values ('$nisn','$tahun')";
  $qq = mysqli_query($conn, $q2);

  if ($exec) {
    $bulanIndo = [
        '1' => 'Januari',
        '2' => 'Februari',
        '3' => 'Maret',
        '4' => 'April',
        '5' => 'Mei',
        '6' => 'Juni',
        '7' => 'Juli',
        '8' => 'Agustus',
        '9' => 'September',
        '10' => 'Oktober',
        '11' => 'November',
        '12' => 'Desember'
    ];

    $query = "SELECT siswa.*, angkatan.* FROM siswa, angkatan WHERE siswa.nisn = '$nisn' AND siswa.id_angkatan = angkatan.nama_angkatan";
    $exec = mysqli_query($conn, $query);
    $res = mysqli_fetch_assoc($exec);
    $biaya = $res['biaya'];
    $nisn = $res['nisn'];
    $ket = $res['ket'];
    $id_kelas = $res['id_kelas'];

    $getkelas = mysqli_query($conn, "SELECT kelas FROM kelas WHERE id_kelas = $id_kelas");
    $hasil = mysqli_fetch_array($getkelas);

    for ($i = 7; $i <= 12; $i++) {
        $bulan = "$bulanIndo[$i] $tahunanggaran";
        $ket = 'BELUM DIBAYAR';
        $add = mysqli_query($conn, "INSERT INTO pembayaran(nisn, bulan, jumlah, ket, tahun, kelas) 
                                   VALUES ('$nisn', '$bulan', '$biaya', '$ket', '$tahunanggaran', '$hasil[0]')");
    }

    // Insert pembayaran untuk tahun berikutnya
    for ($i = 1; $i <= 6; $i++) {
        $bulan = "$bulanIndo[$i] $nexttahunanggaran";
        $ket = 'BELUM DIBAYAR';
        $add = mysqli_query($conn, "INSERT INTO pembayaran(nisn, bulan, jumlah, ket, tahun, kelas) 
                                   VALUES ('$nisn', '$bulan', '$biaya', '$ket', '$nexttahunanggaran', '$hasil[0]')");
    }

    echo "<script>alert('data siswa berhasil disimpan')
    document.location = 'editdatasiswa.php';
    </script>";
  } else {
    echo "<script>alert('data siswa gagal disimpan')
    document.location = 'editdatasiswa.php';
    </script>";
  }
}
?>

<?php include 'footer.php'; ?>

<script type="text/javascript">
  $('.view_data').click(function() {
    var nisn = $(this).attr('id');
    $.ajax({
      url: 'view.php',
      method: 'post',
      data: {
        nisn: nisn
      },
      success: function(data) {
        $('#datasiswa').html(data)
        $('#myModal').modal('show');
      }
    })
  })
</script>

<?php
if (isset($_POST['edit'])) {

  $nisn = $_POST['nisn'];
  $nisn = $_POST['nisn'];
  $nama = $_POST['nama'];
  $id_angkatan = $_POST['nama_angkatan'];
  $id_kelas = $_POST['id_kelas'];
  $id_jurusan = $_POST['id_jurusan'];
  $alamat = $_POST['alamat'];
  $jenis_kelamin = $_POST['jenis_kelamin'];
  $ttl = $_POST['ttl'];
  $kelas = $_POST['kelas'];

  $slqupdatesiswa = "UPDATE siswa SET nisn = '$nisn', nama = '$nama', id_angkatan = '$id_angkatan', id_kelas = '$id_kelas', id_jurusan = '$id_jurusan', alamat = '$alamat', jenis_kelamin = '$jenis_kelamin', ttl = '$ttl' WHERE nisn = '$nisn'";
  $updatesiswabaru = mysqli_query($conn, $slqupdatesiswa);

  if ($updatesiswabaru) {

    $query	 = "SELECT * FROM kelas WHERE id_kelas = $id_kelas";
    $exec = mysqli_query($conn, $query);
    $res = mysqli_fetch_assoc($exec);

    $namakelas = $res['nama_kelas'];
    
    $updates = "UPDATE siswatemp SET kls$kelas='$namakelas' WHERE nisn = '$nisn'";
    $qupd = mysqli_query($conn, $updates);

    echo "<script>alert('data siswa berhasil disimpan')
    document.location = 'editdatasiswa.php';
    </script>";
  } else {
    echo "<script>alert('data siswa gagal disimpan')
    document.location = 'editdatasiswa.php';
    </script>";
  }
}

/*
  if ($exec) {
    echo "<script>alert('data siswa berhasil diedit')
    document.location ='editdatasiswa.php' </script>
    ";
  } else {
    echo "<script>alert('data siswa gagal diedit')
    document.location ='editdatasiswa.php' </script>
    ";
  }
  */

?>