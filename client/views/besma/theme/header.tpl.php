<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../assets/admin/favicon.png">

    <title><?php echo $WebsiteTitle; ?></title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,400italic,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:100' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>


    <!-- Bootstrap core CSS -->
    <link href="views/besma/assets/js/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="views/besma/assets/fonts/font-awesome-4/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/jquery.gritter/css/jquery.gritter.css" />

    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/jquery.nanoscroller/nanoscroller.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/jquery.easypiechart/jquery.easy-pie-chart.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/bootstrap.switch/bootstrap-switch.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/jquery.select2/select2.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/bootstrap.slider/css/slider.css" />
    <link rel="stylesheet" type="text/css" href="views/besma/assets/js/intro.js/introjs.css" />

    <?php echo $xheader;?>
    <!-- Custom styles for this template -->
    <link href="views/besma/assets/css/style.css" rel="stylesheet" />


</head>
<body>

<!-- Fixed navbar -->
<div id="head-nav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="fa fa-gear"></span>
            </button>
            <a class="navbar-brand" href="index.php"><span><?php echo $bardname; ?></span></a>
        </div>
        <div class="navbar-collapse collapse">
            <?php
            $client=ORM::for_table('accounts')->find_one($cid);
            ?>
            <ul class="nav navbar-nav navbar-right user-nav">
                <li class="dropdown profile_menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" src="<?php echo $client['image']; ?>"  height="30px" width="30px"/><span><?php echo ucfirst($client['name'].' '.$client['lname']) ;?></span> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="profile-setting.php"><?php echo $Lan['Update_Profile']; ?></a></li>
                        <li><a href="update-password.php"><?php echo $Lan['Update_Password']; ?></a></li>
                        <li class="divider"></li>
                        <li><a href="logout.php"><?php echo $Lan['Logout']; ?></a></li>
                    </ul>
                </li>
            </ul>


            
            <ul class="nav navbar-nav navbar-right not-nav" >

                <li class="button dropdown">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"><i class=" fa fa-shopping-cart"></i> <span class="bubble"><?php echo $Lan['Limit']; ?></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="nano nscroller">
                                <div class="content">
                                    <ul>
                                        <li><a href="#" ><i class="fa fa-envelope info"></i><b><?php echo $Lan['Email_Balance']; ?></b> <span class="date"><?php echo $client['email_limit']; ?></span></a></li>
                                        <li><a href="#"><i class="fa fa-tablet success"></i> <b><?php echo $Lan['SMS_Balance']; ?></b>  <span class="date"><?php echo $client['sms_limit']; ?></span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <?php
                             if($client['parent']=='0'){
                                 ?>
                                                             <?php
                             }
                            ?>

                        </li>
                    </ul>
                </li>

            </ul>

           
        </div><!--/.nav-collapse animate-collapse -->
    </div>
</div>

<div id="cl-wrapper" class="fixed-menu">
    <div class="cl-sidebar" data-position="right" data-step="1" data-intro="<strong>Fixed Sidebar</strong> <br/> It adjust to your needs." >
        <div class="cl-toggle"><i class="fa fa-bars"></i></div>
        <div class="cl-navblock">
            <div class="menu-space">
                <div class="content">
                    <div class="side-user">
                        <div class="avatar"><img src="<?php echo $client['image']; ?>" alt="Avatar" width="50px" height="50px" /></div>
                        <div class="info">
                            <a href="profile-setting.php"><?php echo ucfirst($client['name']) ;?></a>
                            <img src="views/besma/assets/images/state_online.png" alt="Status" /> <span><?php echo $Lan['Online']; ?></span>
                        </div>
                    </div>
                    <ul class="cl-vnavigation">
                        <li <?php  if($url=='index.php'){echo 'class="active"';} ?>><a href="index.php"><i class="fa fa-home"></i><span><?php echo $Lan['Dashboard']; ?></span></a></li>

			

                        <?php
                        if($client['parent']=='0') {
                            ?>

                                                    <?php
                        }
                      $cl_perm=ORM::for_table('accounts')->find_one($cid);

                      $email_perm=$cl_perm['email_perm'];
                      $sms_perm=$cl_perm['sms_perm'];

                      if($Email_module=='1'){
                            if($email_perm=='1'){


                          ?>

                        <li><a href="#"><i class="fa fa-envelope"></i><span><?php echo $Lan['Bulk_Email']; ?></span></a>
                            <ul class="sub-menu">
                                <li <?php  if($url=='send-email.php'){echo 'class="active"';} ?>><a href="send-email.php"><?php echo $Lan['Send_Email']; ?></a></li>
                          
                                <li  <?php  if($url=='email-history.php' OR $url=='view-email.php'){echo 'class="active"';} ?>><a href="email-history.php"><?php echo $Lan['Email_History'];?></a></li>
                            </ul>
                        </li>

                      <?php
                            }
                      }
                      if($SMS_module=='1'){
                          if($sms_perm=='1'){

                      ?>
                        <li><a href="#"><i class="fa fa-tablet"></i><span><?php echo $Lan['Bulk_SMS']; ?></span></a>
                            <ul class="sub-menu">
                                <li <?php  if($url=='send-sms.php'){echo 'class="active"';} ?>><a href="send-sms.php"><?php echo $Lan['Send_SMS']; ?></a></li>
                                
                                <li  <?php  if($url=='sms-history.php' OR $url=='view-sms.php'){echo 'class="active"';} ?>><a href="sms-history.php"><?php echo $Lan['SMS_History'];?></a></li>
                                <?php
                              if($client['parent']=='0') {
                                  ?>
                                  <li  <?php if ($url == 'purchase-sms-plan.php' OR $url == 'view-price-plan-feature.php') {
                                      echo 'class="active"';
                                  } ?>><a href="purchase-sms-plan.php"><?php echo $Lan['Purchase_SMS_Plan'];?></a></li>
                              <?php
                              }
                                  ?>
                               </ul>
                        </li>

                        <?php
                          }
                      }
                        if($client['parent']=='0') {
                            ?>

                                                    <?php
                        }
                        ?>

                        <li><a href="logout.php"><i class="fa fa-key"></i><span><?php echo $Lan['Logout']; ?></span></a>
                    </ul>

                </div>
            </div>

            <div class="text-right collapse-button" style="padding:7px 9px;">
                <button id="sidebar-collapse" class="btn btn-default" style=""><i style="color:#fff;" class="fa fa-angle-left"></i></button>
            </div>
        </div>
    </div>


