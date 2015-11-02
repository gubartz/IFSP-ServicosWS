<?php
namespace Auth;
use \Slim\Slim;
use \Lib\DB;
use \PDO;

class Auth extends \Slim\Middleware{
    protected $db;
    protected $headers;

    function __construct($headers) {
        $db            = new DB();
        $this->db      = $db->connect();
        $this->headers = $headers;
    }

    public function call() {
        if (strpos($this->app->request()->getPathInfo(), '/usuario/login') !== false) {
            $this->next->call();
            return;
        }

        if(isset($this->headers['Authorization'])){
            $tokenAuth = $this->headers['Authorization'];    
        }else{
            $this->app->response->setStatus(401);
            return;
        }

        $sth = $this->db->prepare("SELECT ra
                                     FROM usuario 
                                     WHERE token = :token"
                                 );

        $sth->bindParam(':token', $tokenAuth);

        $sth->execute();

        $result = $sth->fetchAll(PDO::FETCH_OBJ);
        if(!empty($result)){
            $this->next->call();
        }else{
            $this->app->response->setStatus(401);
            return;            
        }        
	}
}