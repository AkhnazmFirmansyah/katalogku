<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

Route::apiResource('products', ProductController::class);
Route::get('/cek-db', function () {
    return response()->json(\App\Models\Product::all());
});