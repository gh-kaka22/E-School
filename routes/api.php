<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::post('login', [AuthController::class, 'login']);

Route::post('/student/register',[AuthController::class, 'StudentRegister']);
Route::post('/admin/register',[AuthController::class, 'AdminRegister']);



Route::post('register', [AuthController::class, 'register']);




//Admin or Owner routes
Route::middleware(['auth:api', 'isAdminOrOwner'])->group(function () {
    Route::post('/teacher/register',[AuthController::class, 'TeacherRegister']);


});

//Parent routes
Route::middleware(['auth:api', 'isParent'])->group(function () {



});

//Student routes
Route::middleware(['auth:api', 'isStudent'])->group(function () {
    Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);

});

//Students or Parents routes
Route::middleware(['auth:api', 'isStudentOrParent'])->group(function () {
    Route::post('/teacher/register',[AuthController::class, 'TeacherRegister']);
});

//Teacher routes
Route::middleware(['auth:api', 'isTeacher'])->group(function () {

});

//Student or Parent or Teacher routes
Route::middleware(['auth:api', 'isStudentOrParentOrTeacher'])->group(function () {

});

//Admin routes
Route::middleware(['auth:api', 'isAdmin'])->group(function () {

});

//Owner routes
Route::middleware(['auth:api', 'isOwner'])->group(function () {

});



