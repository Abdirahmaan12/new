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
      <button id="addNew" class="btn btn-success float-right">Add New Transaction</button>

         
         </div>
        <table class="table" id="expenseTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Amount</th>
                    <th>Type</th>
                    <th>Description</th>
                    
                    <th>Action</th>
                </tr>
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
  
  

             
  <div class="modal" tabindex="-1" role="dialog" id="expenseModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">expense</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    
      <form id="expenseForm" enctype="multipart/form-data">
        <input type="hidden" name="update_id" id="update_id">
        <div class="row">
        <div class="col-sm-12">
        <div class="alert alert-success d-none" role="alert">
            This is a success alert—check it out!
            </div>
            <div class="alert alert-danger d-none" role="alert">
            This is a danger alert—check it out!
            </div>
        </div>
            <div class="col-sm-12">
                <div class="form-group">
                    <label for="">Amount</label>
                    <input type="text" name="amount" id="amount" class="form-control">
                </div>
            </div>
            <div class="col-sm-12 mt-3">
                <div class="form-group">
                    <label for="">Type</label>
                    <select name="type" id="type" class="form-control">
                        <option value="Income">
                            Income
                        </option>
                        <option value="Expense">
                            Expense
                        </option>
                    </select>
                
                </div>
            </div>

            <div class="col-sm-12 mt-3">
                <div class="form-group">
                    <label for="">Description</label>
                    <input type="text" name="description" id="description" class="form-control">
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