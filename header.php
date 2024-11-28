<?php
session_start();

$current_page = basename($_SERVER['PHP_SELF']);

?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Pembayaran SPP RASECO SCHOOL</title>

  <link class="rounded-circle" href="img/logoku.png" rel="icon">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>


<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center mb-5 mt-4">
        <img class="img-profile rounded-circle" height="100" width="100" src="img/logoku.png">
      </a>


      <div class="sidebar-heading">
        Beranda
      </div>

      <li class="nav-item <?php echo ($current_page == 'beranda.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="beranda.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Beranda</span>
        </a>
      </li>

      <div class="sidebar-heading">
        Menu 
      </div>
      
      <li class="nav-item <?php echo ($current_page == 'pembayaran.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="pembayaran.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pembayaran</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'pengeluaran.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="pengeluaran.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pengeluaran</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'kenaikankelas.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="kenaikankelas.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Kenaikan Kelas</span>
        </a>
      </li>


      <div class="sidebar-heading">
        Management Data 
      </div>

      <li class="nav-item <?php echo ($current_page == 'editdatasiswa.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="editdatasiswa.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Data Siswa</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'editdatakelas.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="editdatakelas.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Data Kelas</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'editdatajurusan.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="editdatajurusan.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Data Angkatan</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'editdataangkatan.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="editdataangkatan.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Data Angkatan</span>
        </a>
      </li>

      <li class="nav-item <?php echo ($current_page == 'editdataadmin.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="editdataadmin.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Data Admin</span>
        </a>
      </li>

      <div class="sidebar-heading">
        Management Data 
      </div>

      <li class="nav-item <?php echo ($current_page == 'laporan.php') ? 'active' : ''; ?>">
        <a class="nav-link collapsed" href="laporan.php">
          <i class="fas fa-fw fa-folder"></i>
          <span>Laporan</span>
        </a>
      </li>

      <hr class="sidebar-divider d-none d-md-block">

    </ul>
    <div id="content-wrapper" class="d-flex flex-column">

      <div id="content">

        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>


          <div class="input-group">
              <h3>RASECO SCHOOL</h3>
          </div>

          <ul class="navbar-nav ml-auto">
            

            <div class="topbar-divider d-none d-sm-block"></div>

            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="logout.php" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= $_SESSION['nama_admin'] ?></span>
                <i class="fas fa-user fa-lg fa-fw mr-2 text-gray-800"></i>
              </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"aria-labelledby="userDropdown">
                  <a class="dropdown-item" href="editprofil.php?id_admin=<?= $_SESSION['admin']?>">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                  </a>
             
              <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="index.php" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>

        <div class="container-fluid">

         

          
        