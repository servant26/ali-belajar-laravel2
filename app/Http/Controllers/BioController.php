<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BioController extends Controller
{
    //
    public function bio(){
        return view("pages.other.bio");
    }

    public function bioClient(){
        return view("pages.client.bio");
    }
}

