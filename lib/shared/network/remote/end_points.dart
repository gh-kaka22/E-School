import 'package:untitled/modules/teachers/add/add_teacher.dart';

///REGISTER
const RegisterStudent='student/register';
const LOGIN='login';
const RESETPASSWORD='resetPassword';

///STUDENTS
const GETSTUDENTS='students/index';
const GETSTUDENTSBYGRADE='show_by_grade';
const GETSTUDENTSBYGRADEANDCLASSROOM='show_by_classroomAndGrade';
const SHOWSTUDENTBYID='show_student';
const UPDATESTUDENT='update_student';
const CREATCLASSONESTUDENT='createOneStudent';
const EditCLASSONESTUDENT='classroom/update/student';

///TEACHER
const UPDATETEACHER='update_teacher/';
const ADDTEACHER='teacher/register';
const SHOWTEACHERS='teachers';
const SEARCHTEACHER='search_teacher';
const SHOWTIMETABLETEACHER='show_teacher_schedule';
///NOTICES
const ADDNOTICE='/storenotice';
const SHOWNOTES='/Ashownotice';
///SUBJECTS
const ADDSUBJECT='create_subject';
const GETSUBJECTS='subjects';
const SHOWSUBJECT='/subject';
const UPDATESUBJECT='update_subject';
///ADMINS
const ADDADMIN='admin/register';
const SHOWADMINS='/admin/index';
const SHOWCOMPLAINTS='admin/complaints';
const SOLVECOMPLAINTS='admin/complaints';

///CLASSROOMS
const ADDCLASSROOM='create_classroom';
const GETCLASSROOMS='classrooms/index';
const GETCLASSROOMSOFAGRADE='classrooms/showByGrade';
const CLEARCLASSROOM='/classrooms/clear';

///SCHOOLYEARS
const ADDSCHOOLYEAR='create_schoolyear';
const GETSCHOOLYEARS='schoolyears';

///ATTENDANCE
const ATTENDANCE='storeattendance';
const SHOWATTENDANCE='Ashowattendance';

///EXAMS
const ADDEXAM='exams/store';
const SHOWEXAMS='exams/show_for_admin';
const GETSTEUDENTBYINDEX ='students/index';
const ADDEXAMSCHEDULE='exams_schedule/create';
const GETEXAMSCHEDULE='exams_schedule/index';
const GETEXAMSCHEDULEBYGRADE='/exams_schedule/showByGrade';
///TIMETABLES
const ADDTIMETABLE='create_schedule';
const SHOWTIMETABLE= 'show_schedule_classroom';

///ABOUT
const ADDSCHOOL='admin/create_school';
const SHOWSCHOOL='admin/show_school/1';
const UPDATESCHOOL='admin/update_school/1';

///BOOKS
const ADDBOOK ='addbook';
const SHOWBOOKS = 'admin/showbooks';
const UPDATEBOOK = 'updatebook';
const DELETEBOOK = 'deletebook';

///FILES
const ADDFILE='upload_file';
const SHOWFILE ='show_files_classroom';

///POSTS
const CREATESCHOOLPOST='create_for_school';
const CREATEGRADEPOST ='create_for_grade';
const CREATECLASSROOMPOST = 'create_for_classroom';
const GETPOSTS = 'posts';
const TOGGLELIKE = 'like';
const GETLIKES = 'show_all_likes';
const GETCOMMENTS = 'show_all_comments';
const CREATECOMMENT = 'create_comment';
const EDITPOST = 'edit_post';
const DELETEPOST = 'delete_post';
const EDITCOMMENT = 'update_comment';
const DELETECOMMENT = 'delete_comment';

///Employee
const ADDEMPLOYEE='create_employee';
const SHOWEMPLOYEE='employee/index';
const GETEMPLOYEE='/employee/1';
const EDITEMPLOYEE='update_employee/1';

///STATS
const STATS='admin/stats';

///Result
const SHOWRESULTFORSTUDENT='show_result';

///RESULTS
const CALCULATE='calcResult';
const UPGRADE ='upgrade_students';
const RANKING='show_students_results';