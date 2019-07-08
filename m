Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B984162B4A
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 00:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbfGHWAx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 18:00:53 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:51311 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732609AbfGHWAw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 8 Jul 2019 18:00:52 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 70D721A20D15;
        Tue,  9 Jul 2019 01:00:49 +0300 (EEST)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
 <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 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
 WVdfrwbus0lVCELNSvCIW2IktSytUxjQfmjBMw==
Message-ID: <8d0d6893-212c-41c4-fef8-76417eb45399@kaa.org.ua>
Date:   Tue, 9 Jul 2019 01:00:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tuVwC7vXDQC154OScIk7SqSwo2OoGLS0z"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tuVwC7vXDQC154OScIk7SqSwo2OoGLS0z
Content-Type: multipart/mixed; boundary="6CJQn8LyOBh1euZbVpjEi03j7IdW3TRTR";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Message-ID: <8d0d6893-212c-41c4-fef8-76417eb45399@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
 <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
In-Reply-To: <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>

--6CJQn8LyOBh1euZbVpjEi03j7IdW3TRTR
Content-Type: text/plain; charset=UTF-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,

11.06.19 22:52, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> On 6/11/19 2:01 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> I just want to clerify - for now LEDs board has 2 from 3 LEDs with e=
ffect function.
>>>>
>>>> 1. Screen frame led is just blinking, so blink_set() is fit well to =
this.
>>>> 2. Pipe led actually consist from 3 leds and when effect is enabled =
next pattern is used:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> LED1=C2=A0 >=C2=A0=C2=A0 OFF=C2=A0 ON=C2=A0=C2=A0 ON=C2=A0=C2=A0 ON
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> LED2=C2=A0 >=C2=A0=C2=A0 OFF=C2=A0 OFF=C2=A0 ON=C2=A0=C2=A0 ON
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> LED3=C2=A0 >=C2=A0=C2=A0 OFF=C2=A0 OFF=C2=A0 OFF=C2=A0 ON
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----^----^----^----^----> time=

>>>
>>> Pattern trigger applies to a single LED so it won't fit for this
>>> pattern.
>>>
>>> Currently we don't support patterns spanning on multiple LEDs,
>>> so you would have to come up with your own solution.
>>>
>>> What I can recommend is a trigger that would be created by your drive=
r
>>> and would activate this sequence.
>>
>> Yes, please.
>>
>> While adding custom files to sysfs may appear easier, we'll need
>> "led-specific-triggers" for other reasons.
>=20
> For what reasons exactly?
>=20
> This is similar to the generic hw trigger support proposed by
> Marek Behun. In the reply to that patch I asked some questions [0].
> So far the mechanism looks too me awkward and not introducing any
> novelty besides requiring one more step - setting the trigger.
>=20
>> And for the record... Handling 3 LEDs as one is not something usual in=

>> the LED subsystem; I guess it makes sense in your specific case, but
>> hopefully noone will copy that design.
>>
>> (I guess they are not individually controllable?)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Pavel
>>
>=20
> [0] https://www.spinics.net/lists/linux-leds/msg12269.html
>=20

I just figure out that this Pipe LED actually consist from 5 LEDs, not 3 =
:)
And supports next level 'brightness' from SPI driver:
- '0' Off
- '1' On
- '2' Cascade (waterfall down)
 -'3' InverseCascade (waterfall up)
- '4' Bounce
- '5' InverseBounce

Please advice, can I proceed with sys attribute file to set '2'..'5' leve=
ls?

--=20
Best regards,
Oleh Kravchenko


--6CJQn8LyOBh1euZbVpjEi03j7IdW3TRTR--

--tuVwC7vXDQC154OScIk7SqSwo2OoGLS0z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl0jvQcACgkQ0xNJm20p
l4z+bQ/7BsitGgZAEgQwn8HvL8QnOlFOQ0ydv1RZJFScZ+jtLw1mRU5Azw2lNDZk
pz7/Jb8gSDb/yOb7mnK36iN3TTnoWFdOKnA4e4OxcGu/8W9YBqhx9esXXAZtjab0
DkcdI1PyErWrPm3sUYzdwG70LGFC5qqQ6Pjc1lsVEdH7J0oFOr9LbZIplcQ2Arnd
Z55pXd23COu6amIKGxymZEQiTraoaYP8DmnLLHdCRX+wXmYskLicZseg4YKdIR5D
aOkCUaXjZG/5JcmIqaUeWfRDG/TrY6nvWjZzK+7yEwpV6B/hmObu+loAEmVYZvHx
tCikBbVQN1DEq5K8oIjTdyjrIxxiU/cWTyv3pXMevkyv2Eu0Ka8XfH7jOuBtG9J2
FBgdfhyZZVLXlZvX/ezzUURdaNo/ADiXGZyxQ/qjMGXiyXlbvh5YmONXmBivQ1ug
clVsszOcO4U1iFBBqGEvBbeIn/YsTm/HartPyjPjVFROjKizGVFv8C3J+6Po89w2
W1rZOH9RhR5XWLjW0g4Ygh5Ke3A+O92Ee1YJlM3x53QC8n8NCEmrMCSpsN/saZO2
3eNKwIMDEOfPktXfg9RqeNTwQTFZAXrhalsXPrOGhQ/HdBHuMs+uoQ9UipCTwBHc
W45pS1tvx2GWtxK+Jcp3aivinu/vhfNY3D8xXdXZlrL5HJDdOfg=
=64D3
-----END PGP SIGNATURE-----

--tuVwC7vXDQC154OScIk7SqSwo2OoGLS0z--
