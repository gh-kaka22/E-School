<?php

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;











//Post Routes
Route::post('/create_for_classroom', [\App\Http\Controllers\PostController::class, 'createForClassroom']);
Route::get('/delete_post/{post_id}',[\App\Http\Controllers\PostController::class, 'deletePost']);

//............................registe routes.............................................
//Owner routes
Route::middleware(['auth:api', 'isOwner'])->group(function () {
    Route::post('/admin/register',[AuthController::class, 'AdminRegister']);
    Route::get('/admin/index',[\App\Http\Controllers\AdminController::class, 'index']);
    Route::get('/admin/show/{id}',[\App\Http\Controllers\AdminController::class, 'show']);

});



//............................Login and Logout route...................................
Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:api')->group(function () {
    Route::post('logout', [AuthController::class, 'Logout']);


    //Likes and Comments Routes
    Route::get('/like/{post_id}',[\App\Http\Controllers\LikeController::class, 'store']);
    Route::get('/show_all_likes/{post_id}',[\App\Http\Controllers\LikeController::class, 'index']);
    Route::get('/show_all_comments/{post_id}',[\App\Http\Controllers\CommentController::class, 'index']);
    Route::get('/delete_comment/{comment_id}',[\App\Http\Controllers\CommentController::class, 'destroy']);
    Route::post('/create_comment',[\App\Http\Controllers\CommentController::class, 'store']);
    Route::post('/update_comment',[\App\Http\Controllers\CommentController::class, 'update']);

    //Posts
    Route::get('/get_posts', [\App\Http\Controllers\PostController::class, 'getPosts']);
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
    //registe routes
    Route::post('/student/register',[AuthController::class, 'StudentRegister']);
    Route::post('/teacher/register',[AuthController::class, 'TeacherRegister']);


    //About Us Routes
        Route::post('/admin/create_school', [\App\Http\Controllers\SchoolController::class, 'store']);
        Route::get('/admin/show_school/{id}', [\App\Http\Controllers\SchoolController::class, 'show']);
        Route::post('/admin/update_school/{id}', [\App\Http\Controllers\SchoolController::class, 'update']);


    //Attendance routes
        Route::Post('/storeattendance', [\App\Http\Controllers\AttendanceController::class, 'store']);
        Route::get('/Ashowattendance/{id}', [\App\Http\Controllers\AttendanceController::class, 'showforadmin']);


    //Notices Routes
    Route::Post('/storenotice', [\App\Http\Controllers\NoticeController::class, 'store']);
    Route::get('/Ashownotice/{id}', [\App\Http\Controllers\NoticeController::class, 'showforadmin']);



    //get numbers of students,teachers,Admins to show it in the dashboard
    Route::get('/admin/getnumber',[\App\Http\Controllers\AdminController::class, 'getAdminCount']);
    Route::get('/student/getnumber',[\App\Http\Controllers\StudentController::class, 'getStudentCount']);
    Route::get('/teacher/getnumber',[\App\Http\Controllers\TeacherController::class, 'getTeacherCount']);



    //Exams Routes
    Route::Post('/exams/store', [\App\Http\Controllers\ExamController::class, 'store']);
    Route::get('/exams/show/{id}', [\App\Http\Controllers\ExamController::class, 'showForStudent']);
    Route::Post('/exams/show_for_admin', [\App\Http\Controllers\ExamController::class, 'showForAdmin']);



    //Schedule Routes
    Route::post('/create_schedule', [\App\Http\Controllers\ScheduleController::class, 'create']);
    Route::post('/show_schedule_classroom', [\App\Http\Controllers\ScheduleController::class, 'showClassroomSchedule']);
    Route::get('/index_schedule', [\App\Http\Controllers\ScheduleController::class, 'index']);



    //Subject Routes
    Route::get('/subjects', [\App\Http\Controllers\SubjectController::class, 'index']);
    Route::get('/subject/{id}', [\App\Http\Controllers\SubjectController::class, 'show']);
    Route::post('/create_subject', [\App\Http\Controllers\SubjectController::class, 'store']);
    Route::post('/update_subject/{id}', [\App\Http\Controllers\SubjectController::class, 'update']);
    Route::get('/delete_subject/{id}', [\App\Http\Controllers\SubjectController::class, 'destroy']);
    Route::get('/search_subject/{name}', [\App\Http\Controllers\SubjectController::class, 'searchByName']);


    //School Years Routes
    Route::get('/schoolyears', [\App\Http\Controllers\SchoolYearController::class, 'index']);
    Route::post('/create_schoolyear', [\App\Http\Controllers\SchoolYearController::class, 'store']);
    //Route::get('/delete_schoolyear/{id}', [\App\Http\Controllers\SchoolYearController::class, 'destroy']);



    //Student Routes
    Route::post('/update_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'update']);
    Route::get('/students/index', [\App\Http\Controllers\StudentController::class, 'index']);
    Route::delete('delete_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'destroy']);
    Route::get('/show_by_grade/{grade_id}', [\App\Http\Controllers\StudentController::class, 'showByGrade']);
    Route::get('/show_student/{student_id}', [\App\Http\Controllers\StudentController::class, 'show']);
    Route::post('/show_by_classroomAndGrade', [\App\Http\Controllers\StudentController::class, 'showByClassroom']);


    //Classroom Routes
    Route::post('/create_classroom', [\App\Http\Controllers\ClassroomController::class, 'store']);
    Route::get('/classrooms/index', [\App\Http\Controllers\ClassroomController::class, 'index']);
    Route::get('/classrooms/showByGrade/{grade_id}', [\App\Http\Controllers\ClassroomController::class, 'showByGrade']);
    Route::post('/createOneStudent', [\App\Http\Controllers\StudentClassroomController::class, 'create']);

    //files Routes
    Route::post('/upload_file',[\App\Http\Controllers\FileController::class, 'upload']);
    Route::post('/show_files_classroom',[\App\Http\Controllers\FileController::class, 'showForClassroom']);

    //Posts Routes
    Route::post('/create_for_student', [\App\Http\Controllers\PostController::class, 'createForStudent']);
    Route::post('/create_for_grade', [\App\Http\Controllers\PostController::class, 'createForGrade']);
    Route::post('/create_for_school', [\App\Http\Controllers\PostController::class, 'createForSchool']);




});



//Parent routes
Route::middleware(['auth:api', 'isParent'])->group(function () {
    //show attendence
    Route::get('/Pshowattendance/{id}', [\App\Http\Controllers\AttendanceController::class, 'showforparent']);

    //show notices
    Route::get('/Pshownotice/{id}', [\App\Http\Controllers\NoticeController::class, 'showforparent']);

});

//Student routes
Route::middleware(['auth:api', 'isStudent'])->group(function () {

    //show attendence
    Route::get('/Sshowattendance', [\App\Http\Controllers\AttendanceController::class, 'showforstudent']);

    //show notices
    Route::get('/Sshownotices', [\App\Http\Controllers\NoticeController::class, 'showforstudent']);


    Route::get('/student/profile', [\App\Http\Controllers\StudentController::class, 'showProfile']);
    Route::get('/student/home', [\App\Http\Controllers\StudentController::class, 'showHome']);
    Route::post('/show_schedule', [\App\Http\Controllers\ScheduleController::class, 'showClassroomScheduleStudent']);

    //Exams
    Route::Post('/exams/show_for_student', [\App\Http\Controllers\ExamController::class, 'showForStudent']);

});

//Students or Parents routes
Route::middleware(['auth:api', 'isStudentOrParent'])->group(function () {

});

//Teacher routes
Route::middleware(['auth:api', 'isTeacher'])->group(function () {
    //get Schedules
    ///
    Route::get('/teacher/getschedule',[\App\Http\Controllers\ScheduleController::class, 'showTeachersSchedule']);


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






});







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
