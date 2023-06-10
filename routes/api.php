<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;




//............................registe routes.............................................
//Owner routes
Route::middleware(['auth:api', 'isOwner'])->group(function () {
    Route::post('/admin/register',[AuthController::class, 'AdminRegister']);
});

//Admin routes
Route::middleware(['auth:api', 'isAdmin'])->group(function () {
    Route::post('/student/register',[AuthController::class, 'StudentRegister']);
    Route::post('/teacher/register',[AuthController::class, 'TeacherRegister']);
});


//............................Login and Logout route...................................
Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::post('logout', [AuthController::class, 'Logout']);
});

//.....................................................................................


//Owner routes
Route::middleware(['auth:api', 'isOwner'])->group(function () {

});


//Admin routes
Route::middleware(['auth:api', 'isAdmin'])->group(function () {


});


//Admin or Owner routes
Route::middleware(['auth:api', 'isAdminOrOwner'])->group(function () {
    //Attendance routes
        Route::Post('/storeattendance', [\App\Http\Controllers\AttendanceController::class, 'store']);
        Route::get('/Ashowattendance/{id}', [\App\Http\Controllers\AttendanceController::class, 'showforadmin']);

    //About Us Routes
        Route::post('/admin/create_school', [\App\Http\Controllers\SchoolController::class, 'store']);
        Route::get('/admin/show_school/{id}', [\App\Http\Controllers\SchoolController::class, 'show']);
        Route::post('/admin/update_school/{id}', [\App\Http\Controllers\SchoolController::class, 'update']);


    //Notices Routes
    Route::Post('/storenotice', [\App\Http\Controllers\NoticeController::class, 'store']);
    Route::get('/Ashownotice/{id}', [\App\Http\Controllers\NoticeController::class, 'showforadmin']);


});



//Parent routes
Route::middleware(['auth:api', 'isParent'])->group(function () {

    Route::get('/Pshowattrndence/{id}', [\App\Http\Controllers\NoticeController::class, 'showforparent']);
    Route::get('/Pshowattendance/{id}', [\App\Http\Controllers\AttendanceController::class, 'showforparent']);

});

//Student routes
Route::middleware(['auth:api', 'isStudent'])->group(function () {
    Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);
    Route::get('/Sshowattendance/{id}', [\App\Http\Controllers\AttendanceController::class, 'showforstudent']);

});

//Students or Parents routes
Route::middleware(['auth:api', 'isStudentOrParent'])->group(function () {

});

//Teacher routes
Route::middleware(['auth:api', 'isTeacher'])->group(function () {

});

//Student or Parent or Teacher routes
Route::middleware(['auth:api', 'isStudentOrParentOrTeacher'])->group(function () {

});




//old admin routes.............................................................................

/*
 *

Route::post('admin/login', [AuthController::class, 'AdminLogin']);






Route::group(['prefix' => 'admin', 'middleware' => ['auth:admin-api', 'scopes:admin']], function () {
    // authenticated staff routes here
//    Route::post('/student/register',[AuthController::class, 'StudentRegister']);
//    Route::post('logout',[AuthController::class, 'AdminLogout']);


    //Student routes
    Route::get('/index', [\App\Http\Controllers\StudentController::class, 'index']);
    Route::get('/index', [\App\Http\Controllers\StudentController::class, 'index']);
    Route::put('/update_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'update']);
    Route::delete('delete_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'destroy']);
    Route::get('/show_by_grade/{grade_id}', [\App\Http\Controllers\StudentController::class, 'showByGrade']);
    Route::get('/show_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'show']);


});





//Subject Routes
Route::get('/subjects', [\App\Http\Controllers\SubjectController::class, 'index']);
Route::get('/subject/{id}', [\App\Http\Controllers\SubjectController::class, 'show']);
Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);
Route::post('/update_subject/{id}', [\App\Http\Controllers\SubjectController::class, 'update']);
Route::get('/delete_subject/{id}', [\App\Http\Controllers\SubjectController::class, 'destroy']);
Route::get('/search_subject/{name}', [\App\Http\Controllers\SubjectController::class, 'searchByName']);

//Gender Routes
Route::get('genders', [\App\Http\Controllers\GenderController::class, 'index']);
Route::post('/create_gender', [\App\Http\Controllers\GenderController::class, 'store']);
Route::get('genders/{id}', [\App\Http\Controllers\GenderController::class, 'show']);
Route::put('genders/{id}', [\App\Http\Controllers\GenderController::class, 'update']);
Route::delete('genders/{id}', [\App\Http\Controllers\GenderController::class, 'destroy']);

//Teacher Routes
Route::get('/teachers', [\App\Http\Controllers\TeacherController::class, 'index']);
Route::get('/teacher/{id}', [\App\Http\Controllers\TeacherController::class, 'show']);
Route::get('/delete_teacher/{id}', [\App\Http\Controllers\TeacherController::class, 'destroy']);
Route::get('/subject_teachers/{id}', [\App\Http\Controllers\TeacherController::class, 'subjectTeacher']);
Route::get('/search_teacher', [\App\Http\Controllers\TeacherController::class, 'searchByName']);
Route::post('/teacher/register', [\App\Http\Controllers\AuthController::class, 'TeacherRegister']);
Route::post('/update_teacher/{id}', [\App\Http\Controllers\TeacherController::class, 'update']);





//Schedule Routes
Route::post('/create_schedule', [\App\Http\Controllers\ScheduleController::class, 'create']);
//Route::post('/show_schedule', [\App\Http\Controllers\ScheduleController::class, 'showClassroomSchedule']);
Route::get('/index_schedule', [\App\Http\Controllers\ScheduleController::class, 'index']);

//Post Routes
Route::post('/create_for_student', [\App\Http\Controllers\PostController::class, 'createForStudent']);
Route::post('/create_for_classroom', [\App\Http\Controllers\PostController::class, 'createForClassroom']);
Route::post('/create_for_grade', [\App\Http\Controllers\PostController::class, 'createForGrade']);
Route::post('/create_for_school', [\App\Http\Controllers\PostController::class, 'createForSchool']);
Route::get('/get_posts', [\App\Http\Controllers\PostController::class, 'getPosts']);

//Classroom routes
Route::post('/create', [\App\Http\Controllers\StudentClassroomController::class, 'create']);

//Parent Routes
Route::get('/search_parent', [\App\Http\Controllers\ParenttController::class, 'search']);


//employee
Route::get('/employees', [\App\Http\Controllers\EmployeeController::class, 'index']);
Route::get('/employee/{id}', [\App\Http\Controllers\EmployeeController::class, 'show']);
Route::get('/delete_employee/{id}', [\App\Http\Controllers\EmployeeController::class, 'destroy']);
Route::post('/create_employee', [\App\Http\Controllers\EmployeeController::class, 'store']);
Route::post('/update_employee/{id}', [\App\Http\Controllers\EmployeeController::class, 'update']);

Route::post('/login', [\App\Http\Controllers\AuthController::class, 'login']);


 *
 */
