@component('mail::message')
# New Message From Moosa Hospital Contact us Form

<table>
    <tr>
        <td>Name :</td>
        <td> {{$user->name}}</td>
    </tr>
    <tr>
        <td>Email :</td>
        <td> {{$user->email}}</td>
    </tr>
    <tr>
        <td>Subject :</td>
        <td> {{$user->subject}}</td>
    </tr>
    <tr>
        <td>Message :</td>
        <td> {{$user->message}}</td>
    </tr>
</table>

{{ config('app.name') }}
@endcomponent
