<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);
Route::post('/student/register',[AuthController::class, 'StudentRegister']);
Route::post('/admin/register',[AuthController::class, 'AdminRegister']);





   Route::post('login2', [AuthController::class, 'login2']);
   Route::post('register', [AuthController::class, 'register']);

    Route::middleware(['auth:api', 'isAdmin'])->group(function () {
        Route::post('/teacher/register',[AuthController::class, 'TeacherRegister']);


        Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);
    });

