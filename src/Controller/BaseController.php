<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BaseController
{
    /**
     * @Route("/health_checker", name="health_checker")
     */
    public function healthChecker()
    {
        return new Response('I`m alive');
    }
}
