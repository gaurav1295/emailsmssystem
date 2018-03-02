<?php
$xheader='
<link rel="stylesheet" type="text/css" href="views/besma/assets/js/redactor-js/redactor/redactor.css" />
';
$xfooter='
    <script src="views/besma/assets/js/jquery.parsley/parsley.js" type="text/javascript" ></script>
    <script src="views/besma/assets/js/fuelux/loader.min.js" type="text/javascript" ></script>
    <script src="views/besma/assets/js/modernizr.js" type="text/javascript" ></script>
    <script src="views/besma/assets/js/redactor-js/redactor/redactor.js" type="text/javascript" ></script>
    <script src="views/besma/assets/js/intojs/intro.min.js" type="text/javascript" ></script>
    <script src="views/besma/assets/js/template_variables.js" type="text/javascript" ></script>
     <script type="text/javascript">
    $(document).ready(function(){
    App.init();
      $(\'#content\').redactor();
        });
  </script>
';
require ('theme/header.tpl.php');
?>

<style>

.label__checkbox {
  display: none;
}
.label__check {
  display: inline-block;
  border-radius: 50%;
  border: 5px solid rgba(0, 0, 0, 0.1);
  background: white;
  vertical-align: middle;
  margin-right: 20px;
  width: 2em;
  height: 2em;
  cursor: pointer;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-box-pack: center;
      -ms-flex-pack: center;
          justify-content: center;
  -webkit-transition: border .3s ease;
  transition: border .3s ease;
}
.label__check i.icon {
  opacity: 1;
  font-size: calc(1rem + 1vw);
  color: transparent;
  -webkit-transition: opacity .3s .1s ease;
  transition: opacity .3s .1s ease;
  -webkit-text-stroke: 3px rgba(0, 0, 0, 0.5);
}
.label__check:hover {
  border: 5px solid rgba(0, 0, 0, 0.2);
}
.label__checkbox:checked + .label__text .label__check {
  -webkit-animation: check 0.5s cubic-bezier(0.895, 0.03, 0.685, 0.22) forwards;
          animation: check 0.5s cubic-bezier(0.895, 0.03, 0.685, 0.22) forwards;
}
.label__checkbox:checked + .label__text .label__check .icon {
  opacity: 1;
  -webkit-transform: scale(0);
          transform: scale(0);
  color: white;
  -webkit-text-stroke: 0;
  -webkit-animation: icon 0.3s cubic-bezier(1, 0.008, 0.565, 1.65) 0.1s 1 forwards;
          animation: icon 0.3s cubic-bezier(1, 0.008, 0.565, 1.65) 0.1s 1 forwards;
}

@-webkit-keyframes icon {
  from {
    opacity: 0;
    -webkit-transform: scale(0.3);
            transform: scale(0.3);
  }
  to {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@keyframes icon {
  from {
    opacity: 0;
    -webkit-transform: scale(0.3);
            transform: scale(0.3);
  }
  to {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@-webkit-keyframes check {
  0% {
    width: 1.5em;
    height: 1.5em;
    border-width: 5px;
  }
  10% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.1;
    background: rgba(0, 0, 0, 0.2);
    border-width: 15px;
  }
  12% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.4;
    background: rgba(0, 0, 0, 0.1);
    border-width: 0;
  }
  50% {
    width: 2em;
    height: 2em;
    background: #00d478;
    border: 0;
    opacity: 0.6;
  }
  100% {
    width: 2em;
    height: 2em;
    background: #00d478;
    border: 0;
    opacity: 1;
  }
}
@keyframes check {
  0% {
    width: 1.5em;
    height: 1.5em;
    border-width: 5px;
  }
  10% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.1;
    background: rgba(0, 0, 0, 0.2);
    border-width: 15px;
  }
  12% {
    width: 1.5em;
    height: 1.5em;
    opacity: 0.4;
    background: rgba(0, 0, 0, 0.1);
    border-width: 0;
  }
  50% {
    width: 2em;
    height: 2em;
    background: #00d478;
    border: 0;
    opacity: 0.6;
  }
  100% {
    width: 2em;
    height: 2em;
    background: #00d478;
    border: 0;
    opacity: 1;
  }
}

</style>
     <!--$(\'#content\').froalaEditor(\'html.set\', template1);-->
    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2><?php echo $Lan['Send_Email']; ?></h2>
            <ol class="breadcrumb">
                <li><a href="index.php"><?php echo $Lan['Home']; ?></a></li>
                <li class="active"><?php echo $Lan['Send_Email']; ?></li>
            </ol>
        </div>
        <div class="cl-mcont">
            <?php notify(); ?>
            <div class="row">


                <div class="col-sm-12 col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3><?php echo $Lan['Send_Email']; ?></h3>
                        </div>
                        <div class="content">


                            <form class="form-horizontal group-border-dashed" role="form"  parsley-validate novalidate action="single-email-send.php" method="post">

                                <!--code to enter name field -->
                                <div class="form-group">
                                    <label for="agent_name_g" class="col-sm-3 control-label">Agent name</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" style="text-transform:uppercase;" placeholder="" name="agent_name_g" id="agent_name_g" readonly value="<?php echo $client['name'].' '.$client['lname'] ;?>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="name_g" class="col-sm-3 control-label">Customer Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" required  class="form-control" style="text-transform:uppercase;" id="name_g" placeholder="Enter customer name" name="name_g">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pnr_g" class="col-sm-3 control-label">PNR NUMBER</label>
                                    <div class="col-sm-8">
                                        <input type="text" required class="form-control" id="pnr_g" placeholder="Enter your pnr number" name="pnr_g" style="text-transform: uppercase;" >
                                    </div>
                                </div>        
                                <!--ends-->

                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label">Customer Email</label>
                                    <div class="col-sm-8">
                                        <input type="email" required  class="form-control" id="email" placeholder="<?php echo $Lan['Email']; ?>" name="email">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="subject" class="col-sm-3 control-label"><?php echo $Lan['Subject']; ?></label>
                                    <div class="col-sm-8">
                                        <input type="text" required  class="form-control" id="subject" placeholder="<?php echo $Lan['Subject']; ?>" name="subject">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="subject" class="col-sm-3 control-label"><?php echo $Lan['Message']; ?></label>
                                    <div class="col-sm-8">
                                        <textarea rows="4" class="form-control" id="content" name="message"></textarea>
                                    </div>
                                </div>
                                <div class="form-group" style="background: #f79494;padding:6px;">
                                    <label for="temp_check" class="col-sm-3 control-label" style="margin-top: 20px;">tick to send template</label>
                                    <!--<div class="col-sm-1">
                                    
                                    </div>-->
                                <div class="col-sm-1">
                                <label class="label">
                                    <input type="checkbox" class="form-control label__checkbox" id="temp_check" placeholder="Check the box" name="temp_check" value="temp_check">
                                    <span class="label__text">
                                    <span class="label__check" style="width: 40px;
                                        height: 40px;
                                        font-size: 27px;
                                        margin-left: 10px;
                                        margin-top: 0px;
                                        border: 1px solid black;
">
                                        <i class="fa fa-check icon"></i>
                                    </span>
                                    </span>
                                </label>
                                </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <button type="submit" class="btn btn-primary" name="submit" ><?php echo $Lan['Send_Email']; ?></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>

<?php  require ('theme/bulk-email-footer.tpl.php'); ?>