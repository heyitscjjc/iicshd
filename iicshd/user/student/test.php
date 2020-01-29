<?php

    session_start();    
    foreach ($_SESSION['previousMessages'] as $item) {
        echo $item;
        echo "<br>";
    }
?>

    <form method="post" autocomplete="off">
        <input type="text" id="query" name="query" class="form-control" placeholder="Send a message...">
        <br><button class="btn" name="send">Send message</button>
    </form>
</div>
</body>
</html>

<?php
    //CHATBOT COMMANDS
    if(isset($_POST['send'])){
        array_push($_SESSION['previousMessages'], $_POST['query']);
        echo "done";
    }
?>