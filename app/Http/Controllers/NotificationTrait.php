<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

trait NotificationTrait
{
    use ApiResponseTrait;


    public function sendNotificationAnas($title,$FCM,$body)
    {
        $SERVER_API_KEY = 'AAAA4AOgXcY:APA91bFw82bnLOPmY3RF4GrGoLXWn74w66UqLj16lM9U4y_kdBYmD0h9RyksrYU64mi8CXO28nTdptiNGNnu25KSVvgECug1ppid7yuk50aV07fEXojHox2XqifCqqT_4sUw2eOKRfXV';

        $token_1 = 'f4h8qrOUQkCWdH7vB6JPCj:APA91bGPmC3A3Dn1uZil_LH38tOeNPwQXadqWYtoRsH_NCMLVzuqLo5_0w182FWb5f0BvZrKy1fWHfKR7JDGf0UjMeuzTfVJgWY4myVVkPS0CRppTkmkivRxLf4ldMi67mcKrgHLcNUc';

        $data = [

            "registration_ids" => [
                $token_1
            ],

            "notification" => [

                "title" => $title,

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

    public function sendNotification($title,$FCM,$body)
    {
        $SERVER_API_KEY = 'AAAA4AOgXcY:APA91bFw82bnLOPmY3RF4GrGoLXWn74w66UqLj16lM9U4y_kdBYmD0h9RyksrYU64mi8CXO28nTdptiNGNnu25KSVvgECug1ppid7yuk50aV07fEXojHox2XqifCqqT_4sUw2eOKRfXV';

       // $token_1 = '';

        $data = [

            "registration_ids" => [
                $FCM
            ],

            "notification" => [

                "title" => $title,

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

        dd($response);
    }
}
