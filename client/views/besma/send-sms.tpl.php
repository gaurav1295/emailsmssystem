<?php

$xheader='

';
$xfooter='
    <script src="views/besma/assets/js/jquery.parsley/parsley.js" type="text/javascript" ></script>

        <script type="text/javascript">

        $(document).ready(function(){
    var $remaining = $(\'#remaining\'),
        $messages = $remaining.next();

    $(\'#message\').keyup(function(){
        var chars = this.value.length,
            messages = Math.ceil(chars / 160),
            remaining = messages * 160 - (chars % (messages * 160) || messages * 160);

        $remaining.text(remaining + \' characters\');
        $messages.text(messages + \' message(s)\');
    });
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

    <div class="container-fluid" id="pcont">
        <div class="page-head">
            <h2><?php echo $Lan['Send_SMS']; ?></h2>
            <ol class="breadcrumb">
                <li><a href="index.php"><?php echo $Lan['Home']; ?></a></li>
                <li class="active"><?php echo $Lan['Send_SMS']; ?></li>
            </ol>
        </div>
        <div class="cl-mcont">
            <?php notify(); ?>
            <div class="row">


                <div class="col-sm-12 col-md-12">
                    <div class="block-flat">
                        <div class="header">
                            <h3><?php echo $Lan['Send_SMS']; ?></h3>
                        </div>
                        <div class="content">


                            <form class="form-horizontal group-border-dashed" role="form"  parsley-validate novalidate action="single-sms-send.php" method="post" accept-charset="UTF-8">

                                <div class="form-group">
                                    <label for="name_sg" class="col-sm-3 control-label">Customer Name</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control" style="text-transform: uppercase;" placeholder="Enter customer name" name="name_sg" id="name_sg">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="pnr_g" class="col-sm-3 control-label">PNR NUMBER</label>
                                    <div class="col-sm-7">
                                        <input type="text" required class="form-control" id="pnr_g" placeholder="Enter your pnr number" name="pnr_g" style="text-transform: uppercase;" >
                                    </div>
                                </div>   
                                <div class="form-group">
                                    <label for="agent_sg" class="col-sm-3 control-label">Agent name</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" style="text-transform: uppercase;" placeholder="" name="agent_sg" id="agent_sg" readonly value="<?php echo $client['name'].' '.$client['lname'] ;?>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="esubject" class="col-sm-3 control-label"><?php echo $Lan['Sender_ID']; ?>(ask admin for it , this is your number)</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control"  value="+16466635842" readonly name="sender_id" id="sender_id">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="esubject" class="col-sm-3 control-label"><?php echo $Lan['Receiver']; ?>(customer number)</label>
                                    <div class="col-sm-7">
                                        <input type="text" required  class="form-control"  placeholder="<?php echo $Lan['Receiver']; ?>" name="receiver" id="receiver">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label"><?php echo $Lan['Message']; ?></label>
                                    <div class="col-sm-7">
                                        <textarea style="height:150px;" class="form-control" id="message" name="message"></textarea>
                                        <p><strong><span id="remaining"></span>
                                                <span id="messages"></span></strong></p>
                                    </div>
                                </div>

				<!--send message template-->
                                <div class="form-group" style="background: #f79494;padding:6px;">
                                    <label for="temp_check" class="col-sm-3 control-label" style="margin-top: 20px;">tick to send template</label>
                                   
                                    <div class="col-sm-1">
                                    <label class="label">
                                        <input type="checkbox" class="form-control label__checkbox" id="temp_check" placeholder="Check the box" name="temp_check" value="temp_check">
                                        <span class="label__text">
                                        <span class="label__check" style="width: 40px;
                                            height: 40px;
                                            font-size: 27px;
                                            margin-left: 10px;
                                            margin-top: 0px;
                                            border: 1px solid black;">
                                            <i class="fa fa-check icon"></i>
                                        </span>
                                        </span>
                                        </label>
                                        </div>
                                </div>
				

                                <div class="form-group">
                                    <div class="col-sm-offset-3 col-sm-9">
                                        <button type="submit" class="btn btn-primary" name="submit" ><?php echo $Lan['Send_SMS']; ?></button>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>

<?php  require ('theme/footer.tpl.php'); ?>