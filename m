Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 057518DF8E
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2019 22:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbfHNU6w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Aug 2019 16:58:52 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:58880 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729984AbfHNU6w (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 14 Aug 2019 16:58:52 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 3C9371A20EAD;
        Wed, 14 Aug 2019 23:58:48 +0300 (EEST)
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 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
 WVdfrwbus0lVCELNSvCIW2IktSytUxjQfmjBMw==
Message-ID: <f61e7a4e-89dc-26f1-b4fb-aa83ec7f24dc@kaa.org.ua>
Date:   Wed, 14 Aug 2019 23:58:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB
Content-Type: multipart/mixed; boundary="R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <f61e7a4e-89dc-26f1-b4fb-aa83ec7f24dc@kaa.org.ua>
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
 <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
 <e72f3669-1537-54ee-5ddd-ea77f9d13f07@kaa.org.ua>
 <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>
In-Reply-To: <4af185e2-95cf-4e21-f3f0-b35bd39441e3@gmail.com>

--R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

By the way,

14.08.19 23:53, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> On 8/14/19 10:16 PM, Oleh Kravchenko wrote:
>> Hello Jacek,
>>
>> 14.08.19 22:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
>>>>>>
>>>>>> All pattern is predefined, you can't change them at all.
>>>>>> I just tried to describe real things what happened in LED board.
>>>>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>>>>
>>>>> It makes me wonder how you figured out the values? If you have
>>>>> a documentation for this controller, could you share how the patter=
n
>>>>> settings are documented?
>>>>
>>>> I saw the code of firmware.
>>>> Not sure if I can find any documentation for it right now.
>>>
>>> Have you tried to alter the values? Or check what happens when
>>> the duplication is removed?
>>
>> What do you mean alter? It doesn't make any sense.
>> Board is accepts only brightness level from '0' to '5'.
>> I'm really confused :-)
>=20
> OK, I didn't analyze the driver thoroughly enough.
> Now everything is clear to me. Patterns are triggered just
> by writing two-byte command.
>=20
>>>>>
>>>>> For the first two we could do without sequence duplication.
>>>>
>>>> Ok, I will reduce it.
>>>
>>> Please hold on for a while. I will have some more remarks to the driv=
er,
>>> just collecting missing info for now to gain more complete view on th=
is
>>> device.
>>
>> Here is the full story:
>>
>> EL15203000 LEDs board (aka RED LEDs board, because it has only RED LED=
s).
>> It's provide access to 3 LEDs:
>>
>> - First LED (Screen) is a light tube around big 21" screen
>>   It's have 3 brightness levels:
>>   * OFF
>>   * ON
>>   * Breathing mode (8 seconds full cycle)
>=20
> OK, so this is LED string. We would need to bend rules to make it
> appearing as a single LED class device, but allowing non-synchronous
> blinking of LEDs in the string.
>=20
>> - Second LED (Vending area) is highlight coffee cap
>>   * OFF
>>   * ON
>> - Third LED (Pipe) is actually virtual, because consists from 5 LEDs
>>   * OFF for all 5 LEDs
>>   * ON for all 5 LEDs
>>   * Cascade
>>   * Inverses cascade
>>   * Bounce
>>   * Inverses bounce

Full cycle takes 8 seconds too.
So actually it's splitted into 10 stages, each takes 800ms.

> Similarly in case of this one. I will give you a feedback on how
> to define the patterns within few days.
>=20

Take you time.

--=20
Best regards,
Oleh Kravchenko



--R7oHU1g8zQgMohrnskBCfs8Ss0HWmt3kC--

--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1UdfcACgkQ0xNJm20p
l4wTYRAAnuyeM2RhtePIjmMjqjprwdokI8MJVZLfldB7OFNMjg60iBKSNH/AfTWz
T5RjYtrDptmtWNDl8jEDJmNKD4R0Vgg1hHZwS/I+RQs7KR6Ti3bHyJ58M3Xn8orM
a5K6cNbclUVqiG2N6VD3o4X3xzeWjs5PGeYmEg0p1GrYscPG/0DXHuHEfFLpVpWH
iVt20YOLQZxH6YZx8/GDPwtVW/+ztkt4KpwAty4Le1mPIMbpEYnW5thgdPxP9YcJ
rNEV7do/v6Vcx7ocD1ZEmBvravE+mwN1UEgwmp0lV31GFWaatMoHa9wpUW7iMgJ2
3DIEODnB1r4gFGMY5jViEIhGQSdOjO+rkip48huZV+78XLfIx2T70l76b8MutJvY
vmS+2juD9fg1ZgK393R+TMk0c4PAuv+HvciFWJeq9ZQCzoLR5ZZrwzdKcz/nk6kH
eC1Qn2WOrjRtATU6lDur0ubL1BRn2bLkaFO32lhYRawU9NJz+FzjDfB0nWyArA49
pabFjWnwXMsDWHp2+NODaekx7EUsSSzTZk5iWU7PeYDbbtlkajWTPuS2c6Umqf5G
Pmnf96aKYCLY7OhpEYuUGFPwCl1OJO9lzy3SM+dJG07qec64jA8IMtCfjUx5Vn+N
ZIVJDXiO/oh9JcPBY5pjoOTdsexlv8SqtF2arSlcWNSSsW9taas=
=v1le
-----END PGP SIGNATURE-----

--GtVYTrX15OJJRP5fbKQMvJOeYEhU69NaB--
