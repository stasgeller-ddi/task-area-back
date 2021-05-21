<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Swagger\Annotations as SWG;

/**
 * @SWG\Tag(name="base")
 */
class BaseController
{
    /**
     * @Route("/health_checker", methods={"GET"}, name="health_checker")
     *
     * @SWG\Response(response="200", description="Check health")
     */
    public function healthChecker()
    {
        return new Response('I`m alive');
    }
}
