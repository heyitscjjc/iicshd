<!--NEW NAVBAR-->

<?php 

if($_SESSION['role'] == 'student'){
   echo " <nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
        <a class='navbar-brand'>
            <img src = '../../img/logosolo.png'></img>       
            <span class='mb-0 h6' style='color:white;'>IICS Help Desk</span> 
        </a>


        <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
            <span class='navbar-toggler-icon'></span>
        </button>

        <div class='collapse navbar-collapse' id='navbarSupportedContent'>

            <ul class='navbar-nav mr-auto'>

                <li class='nav-item active'>
                    <a class='nav-link active' href='home.php'>
                        <span data-feather='home'></span>
                        Home <span class='sr-only'>(current)</span>
                    </a>
                </li>

                <li class='nav-item'>
                    <a class='nav-link' style='color:white;' href='documents.php'>
                        <span data-feather='file-text'></span>
                        Documents
                    </a>
                </li>

                <li class='nav-item'>
                    <a class='nav-link' style='color:white;' href='queue.php'>
                        <span data-feather='users'></span>
                        Queue
                    </a>
                </li>

                <li class='nav-item'>
                    <a class='nav-link' style='color:white;' href='consultations.php'>
                        <span data-feather='info'></span>
                        Consultation
                    </a>
                </li>


                <li class='nav-item dropdown'>
                    <a class='nav-link dropdown-toggle' style='color:white;' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>
                        <span data-feather='calendar'></span>
                        Schedule
                    </a>
                    <div class='dropdown-menu'>
                        <a class='dropdown-item' href='fschedule.php'>
                            <span data-feather='book-open'></span>
                            Faculty Schedule
                        </a>
                        <a class='dropdown-item' href='cschedule.php'>
                            <span data-feather='book-open'></span>
                            Class Schedule
                        </a>
                        <a class='dropdown-item' href='rschedule.php'>
                            <span data-feather='book-open'></span>
                            Room Schedule
                        </a>
                        <a class='dropdown-item' href='eschedule.php'>
                            <span data-feather='book-open'></span>
                            Exam Schedule
                        </a>
                    </div>
                </li>

                <li class='nav-item'>
                    <a class='nav-link' style='color:white;' href='https://assistant-chat-us-south.watsonplatform.net/web/public/a2ca822f-0910-4719-9716-04613441c9e8' target='_blank'>
                        <span data-feather='external-link'></span>
                        Ask Me Anything
                    </a>
                </li>

            </ul>

            <ul class='navbar-nav px-1'>
                <li class='dropdown'>
                    <a href='#' class='btn btn-primary btn-sm dropdown-toggle notif-toggle' data-toggle='dropdown'><span class='badge badge-danger count' style='border-radius:10px;'></span> <span class='fas fa-bell' style='font-size:18px;'></span> Notifications</a>
                    <ul class='shownotif dropdown-menu' style='white-space:normal;'></ul>
                </li>
            </ul>

            <ul class='navbar-nav px-3'>
                <li class='nav-item text-nowrap'>
                <li class='nav-item dropdown'>
                    <button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                        <span data-feather='user'></span> ";

                        echo $_SESSION['user_name'];

    echo "          </button>
                    <div class='dropdown-menu'>
                        <a class='dropdown-item' href='account.php'>
                            <i class='fas fa-user-cog'></i>
                            Account
                        </a>
                        <div class='dropdown-divider'></div>
                        <a class='dropdown-item' href='../../logout.php'>
                            <span data-feather='log-out'></span>  Log Out
                        </a>
                    </div>
                </li>
                </li>
            </ul>
        </div>
    </nav> ";
}

else if($_SESSION['role'] == 'faculty'){
    echo "<nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
    <a class='navbar-brand'>
        <img src = '../../img/logosolo.png'></img>       
        <span class='mb-0 h6' style='color:white;'>IICS Help Desk</span> 
    </a>


    <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
        <span class='navbar-toggler-icon'></span>
    </button>

    <div class='collapse navbar-collapse' id='navbarSupportedContent'>

        <ul class='navbar-nav mr-auto'>

            <li class='nav-item active'>
                <a class='nav-link' style='color:white;' href='home.php'>
                    <span data-feather='home'></span>
                    Home <span class='sr-only'>(current)</span>
                </a>
            </li>

            <li class='nav-item'>
                <a class='nav-link' style='color:white;' href='consultations.php'>
                    <span data-feather='file-text'></span>
                    Consultation
                </a>
            </li>
            <li class='nav-item dropdown'>
                <a class='nav-link dropdown-toggle' style='color:white;' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>
                    <span data-feather='calendar'></span>
                    Schedule
                </a>
                <div class='dropdown-menu'>
                    <a class='dropdown-item' href='fschedule.php'>
                        <span data-feather='book-open'></span>
                        Faculty Schedule
                    </a>
                    <a class='dropdown-item' href='cschedule.php'>
                        <span data-feather='book-open'></span>
                        Class Schedule
                    </a>
                    <a class='dropdown-item' href='rschedule.php'>
                        <span data-feather='book-open'></span>
                        Room Schedule
                    </a>
                    <a class='dropdown-item' href='eschedule.php'>
                        <span data-feather='book-open'></span>
                        Exam Schedule
                    </a>
                </div>
            </li>
        </ul>

        <ul class='navbar-nav px-1'>
            <li class='dropdown'>
                <a href='#' class='btn btn-primary btn-sm dropdown-toggle notif-toggle' data-toggle='dropdown'><span class='badge badge-danger count' style='border-radius:10px;'></span> <span class='fas fa-bell' style='font-size:18px;'></span> Notifications</a>
                <ul class='shownotif dropdown-menu' style='white-space:normal;'></ul>
            </li>
        </ul>

        <ul class='navbar-nav px-3'>
            <li class='nav-item text-nowrap'>
            <li class='nav-item dropdown'>
                <button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                    <span data-feather='user'></span>";
                    echo $_SESSION['user_name'];
                echo "</button>
                <div class='dropdown-menu'>
                    <a class='dropdown-item' href='account.php'>
                        <i class='fas fa-user-cog'></i>
                        Account
                    </a>
                    <div class='dropdown-divider'></div>
                    <a class='dropdown-item' href='../../logout.php'>
                        <span data-feather='log-out'></span>  Log Out
                    </a>
                </div>
            </li>
            </li>
        </ul>
    </div>
</nav>";
}

else if($_SESSION['role'] == "admin"){
echo "        <nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
<a class='navbar-brand'>
    <img src = '../../img/logosolo.png'></img>       
    <span class='mb-0 h6' style='color:white;'>IICS Help Desk</span> 
</a>


<button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
    <span class='navbar-toggler-icon'></span>
</button>

<div class='collapse navbar-collapse' id='navbarSupportedContent'>

    <ul class='navbar-nav mr-auto'>

        <li class='nav-item active'>
            <a class='nav-link active' href='home.php'>
                <span data-feather='home'></span>
                Home <span class='sr-only'>(current)</span>
            </a>
        </li>

        <li class='nav-item'>
            <a class='nav-link' style='color:white;' href='documents.php'>
                <span data-feather='file-text'></span>
                Documents
            </a>
        </li>

        <li class='nav-item'>
            <a class='nav-link' style='color:white;' href='queue.php'>
                <span data-feather='users'></span>
                Queue
            </a>
        </li>
        <li class='nav-item dropdown'>
            <a class='nav-link dropdown-toggle' style='color:white;' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>
                <span data-feather='calendar'></span>
                Schedule
            </a>
            <div class='dropdown-menu'>
                <a class='dropdown-item' href='fschedule.php'>
                    <span data-feather='book-open'></span>
                    Faculty Schedule
                </a>
                <a class='dropdown-item' href='cschedule.php'>
                    <span data-feather='book-open'></span>
                    Class Schedule
                </a>
                <a class='dropdown-item' href='rschedule.php'>
                    <span data-feather='book-open'></span>
                    Room Schedule
                </a>
                <a class='dropdown-item' href='eschedule.php'>
                    <span data-feather='book-open'></span>
                    Exam Schedule
                </a>
            </div>
        </li>
        <li class='nav-item'>
            <a class='nav-link' style='color:white;' href='stats.php'>
                <span data-feather='bar-chart-2'></span>
                Statistics
            </a>
        </li>
        <li class='nav-item'>
            <a class='nav-link' style='color:white;' href='reports.php'>
                <span data-feather='layers'></span>
                Reports
            </a>
        </li>


    </ul>

    <ul class='navbar-nav px-1'>
        <li class='dropdown'>
            <a href='#' class='btn btn-primary btn-sm dropdown-toggle notif-toggle' data-toggle='dropdown'><span class='badge badge-danger count' style='border-radius:10px;'></span> <span class='fas fa-bell' style='font-size:18px;'></span> Notifications</a>
            <ul class='shownotif dropdown-menu' style='white-space:normal;'></ul>
        </li>
    </ul>

    <ul class='navbar-nav px-3'>
        <li class='nav-item text-nowrap'>
        <li class='nav-item dropdown'>
            <button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                <span data-feather='user'></span>";
                echo $_SESSION['user_name'];
        echo    "</button>
            <div class='dropdown-menu'>
                <a class='dropdown-item' href='cpanel.php'>
                    <i class='fas fa-sliders-h'></i>
                    Control Panel
                </a>
                <a class='dropdown-item' href='account.php'>
                    <i class='fas fa-user-cog'></i>
                    Account
                </a>
                <div class='dropdown-divider'></div>
                <a class='dropdown-item' href='../../logout.php'>
                    <span data-feather='log-out'></span>  Log Out
                </a>
            </div>
        </li>
        </li>
    </ul>
</div>
</nav>";
}
else if($_SESSION['role'] == "organizati"){
    echo "        <nav class='navbar navbar-expand-lg navbar-dark bg-dark'>
    <a class='navbar-brand'>
        <img src = '../../img/logosolo.png'></img>       
        <span class='mb-0 h6' style='color:white;'>IICS Help Desk</span> 
    </a>
    
    
    <button class='navbar-toggler' type='button' data-toggle='collapse' data-target='#navbarSupportedContent' aria-controls='navbarSupportedContent' aria-expanded='false' aria-label='Toggle navigation'>
        <span class='navbar-toggler-icon'></span>
    </button>
    
    <div class='collapse navbar-collapse' id='navbarSupportedContent'>
    
        <ul class='navbar-nav mr-auto'>
    
            <li class='nav-item active'>
                <a class='nav-link active' href='home.php'>
                    <span data-feather='home'></span>
                    Home <span class='sr-only'>(current)</span>
                </a>
            </li>
    
            <li class='nav-item'>
                <a class='nav-link' style='color:white;' href='documents.php'>
                    <span data-feather='file-text'></span>
                    Documents
                </a>
            </li>
    
            <li class='nav-item'>
                <a class='nav-link' style='color:white;' href='queue.php'>
                    <span data-feather='users'></span>
                    Queue
                </a>
            </li>
            <li class='nav-item dropdown'>
                <a class='nav-link dropdown-toggle' style='color:white;' data-toggle='dropdown' href='#' role='button' aria-haspopup='true' aria-expanded='false'>
                    <span data-feather='calendar'></span>
                    Schedule
                </a>
                <div class='dropdown-menu'>
                    <a class='dropdown-item' href='fschedule.php'>
                        <span data-feather='book-open'></span>
                        Faculty Schedule
                    </a>
                    <a class='dropdown-item' href='cschedule.php'>
                        <span data-feather='book-open'></span>
                        Class Schedule
                    </a>
                    <a class='dropdown-item' href='rschedule.php'>
                        <span data-feather='book-open'></span>
                        Room Schedule
                    </a>
                    <a class='dropdown-item' href='eschedule.php'>
                        <span data-feather='book-open'></span>
                        Exam Schedule
                    </a>
                </div>
            </li>
            <li class='nav-item'>
                <a class='nav-link' style='color:white;' href='stats.php'>
                    <span data-feather='bar-chart-2'></span>
                    Statistics
                </a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' style='color:white;' href='reports.php'>
                    <span data-feather='layers'></span>
                    Reports
                </a>
            </li>
    
    
        </ul>
    
        <ul class='navbar-nav px-1'>
            <li class='dropdown'>
                <a href='#' class='btn btn-primary btn-sm dropdown-toggle notif-toggle' data-toggle='dropdown'><span class='badge badge-danger count' style='border-radius:10px;'></span> <span class='fas fa-bell' style='font-size:18px;'></span> Notifications</a>
                <ul class='shownotif dropdown-menu' style='white-space:normal;'></ul>
            </li>
        </ul>
    
        <ul class='navbar-nav px-3'>
            <li class='nav-item text-nowrap'>
            <li class='nav-item dropdown'>
                <button type='button' class='btn btn-dark btn-sm dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                    <span data-feather='user'></span>";
                    echo $_SESSION['user_name'];
            echo    "</button>
                <div class='dropdown-menu'>
                    <a class='dropdown-item' href='cpanel.php'>
                        <i class='fas fa-sliders-h'></i>
                        Control Panel
                    </a>
                    <a class='dropdown-item' href='account.php'>
                        <i class='fas fa-user-cog'></i>
                        Account
                    </a>
                    <div class='dropdown-divider'></div>
                    <a class='dropdown-item' href='../../logout.php'>
                        <span data-feather='log-out'></span>  Log Out
                    </a>
                </div>
            </li>
            </li>
        </ul>
    </div>
    </nav>";
}
?>