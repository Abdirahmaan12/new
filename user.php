<?php
include 'include/header.php';


?>
  <!-- ======= Header ======= -->
<?php
include 'include/nav.php';
?>
<!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <?php

 include 'include/sidebar.php';

?>



<style>

  #show{
    width: 150px;
    height: 150px;
    border: solid 1px #744547;
    border-radius: 50%;
    object-fit: cover;
    margin-top: 20px;
  }

</style>
<!-- End Sidebar-->

  <main id="main" class="main">
   
  
  <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div>

    <div class="container">
  <div class="row justify-content-center mt-4">
    <div class="col-sm-10">
      <div class="card">
      <div class="text-end">
        <button type="button" class="btn btn-success  m-2" data-bs-toggle="modal" data-bs-target="#usermodal">
       Add user
         </button>
         </div>
        <table class="table" id="UserTable">

        <thead>
       

            
        </thead>

        <tbody>
   
        <!-- <tr>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          
        </tr>
        <tr>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          
        </tr>
        <tr>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          
        </tr>
        <tr>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          <td>welcome</td>
          
        </tr> -->
        
     
        </tbody>
        </table>
        </div>
       </div>
    </div>
  </div>
   <!-- End Page Title -->

   

  </main>
  
  

             
  <div class="modal fade" id="usermodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">User Info</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form id="userform">
      <form id="userform" enctype="multipart/form-data">
        <input type="hidden" name="update_id" id="update_id">
        <div class="row">
            


            <div class="col-sm-12">
                <div class="form-group">
                <label for="">username</label>
                <input type="text" name="username" id="username" class="form-control" required>
                </div>

            </div>

            <div class="col-sm-12 mt-3">
                <div class="form-group">
                <label for="">password</label>
                <input type="password" name="password" id="password" class="form-control" required>
                </div>

            </div>

            <div class="col-sm-12 mt-3">
                <div class="form-group">
                <label for="">image</label>
                <input type="file" name="image" id="image" class="form-control">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-8">
                <div class="form-group">
                <img id="show">
                </div>
            </div>
        </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit"  name="insert" class="btn btn-primary">Save Info</button>
      </div>
     </form>
    </div>
  </div>
</div>
  <!-- End #main -->

 

 

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

  <?php
include 'include/footer.php';

?>