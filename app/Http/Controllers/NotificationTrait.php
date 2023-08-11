<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

trait NotificationTrait
{
    use ApiResponseTrait;


    public function sendNotification(Request $request)
    {
        $SERVER_API_KEY = 'AAAA4AOgXcY:APA91bFw82bnLOPmY3RF4GrGoLXWn74w66UqLj16lM9U4y_kdBYmD0h9RyksrYU64mi8CXO28nTdptiNGNnu25KSVvgECug1ppid7yuk50aV07fEXojHox2XqifCqqT_4sUw2eOKRfXV';

        $token_1 = 'd3C7SHF5TGuNsx5iVmWRT7:APA91bEzk30YTLQSwTJ8hfUxcdJxi2mZ4bv9PxU676jUNzVlQPTl9mS9fsekiqqgr5xJMT3HlgcxnvSzPrD1BXsUqRgNAGKrrg7NqhA_DEx8Wp2kFy07U1Bg7MYiBbfD7Ta4wMDnc4iQ';

        $data = [

            "registration_ids" => [
                $token_1
            ],

            "notification" => [

                "title" => 'Omarain 3mk',

                "body" => 'ازا عم يوصلو بعات سكرين واتس',

                "sound"=> "default"

            ],

        ];

        $dataString = json_encode($data);

        $headers = [

            'Authorization: key=' . $SERVER_API_KEY,

            'Content-Type: application/json',

        ];

        $ch = curl_init();


        $ch=curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');

        curl_setopt($ch, CURLOPT_POST, true);

        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        return $this->apiResponse('s',$response);
    }

    public function sendNotificationMarks($FCM,$body)
    {
        $SERVER_API_KEY = 'AAAA4AOgXcY:APA91bFw82bnLOPmY3RF4GrGoLXWn74w66UqLj16lM9U4y_kdBYmD0h9RyksrYU64mi8CXO28nTdptiNGNnu25KSVvgECug1ppid7yuk50aV07fEXojHox2XqifCqqT_4sUw2eOKRfXV';

       // $token_1 = '';

        $data = [

            "registration_ids" => [
                $FCM
            ],

            "notification" => [

                "title" => 'New Mark',

                "body" => $body,

                "sound"=> "default"

            ],

        ];

        $dataString = json_encode($data);

        $headers = [

            'Authorization: key=' . $SERVER_API_KEY,

            'Content-Type: application/json',

        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);

        return $this->apiResponse('s',$response);
    }
}
