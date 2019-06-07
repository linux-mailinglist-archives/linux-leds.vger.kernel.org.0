Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D4A39774
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 23:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730879AbfFGVNg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 17:13:36 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:50253 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730540AbfFGVNg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 7 Jun 2019 17:13:36 -0400
Received: from [192.168.202.115] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 8D4D31A20B58;
        Sat,  8 Jun 2019 00:13:32 +0300 (EEST)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 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
Message-ID: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Date:   Sat, 8 Jun 2019 00:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw
Content-Type: multipart/mixed; boundary="jma27az7xXsVgKEAJG0WTPwlycTek1aX2";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org
Message-ID: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
In-Reply-To: <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>

--jma27az7xXsVgKEAJG0WTPwlycTek1aX2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Dan,

On 08.06.19 00:04, Dan Murphy wrote:
> Oleh
> But this is not really max_brightness now this is a feature and now
> does not make sense in this context
>>>
>>> You may need to use something different for this property or expose
>>> a file in the driver.
>>>
>>>
>> Protocol for this board define 0x32 as brightness level.
>> This behaviur needed to keep backward compatibity.
>>
>>
> Backwards compatibility to what?
With old/new boards.
>
> This is a new driver there should be no DT that has this compatible or
> definition.
>
> I will let Rob ack or nack this node.
>
> Dan
>



--jma27az7xXsVgKEAJG0WTPwlycTek1aX2--

--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAlz61IYACgkQ0xNJm20p
l4y/iA/8Ck/1WHpVG4Tova/HZpzK87OMD9taPMrVURA2vDwrbyRmc/MCPr3yEqJT
fDEHt4wzZRLb+PErrVyXuimnqjOkLKzCnwi3wDeKmUyhkPKsiJ9QIirYBqA6dYJo
Li5yvxW87hlBAooNKvJ/ZAtBailxBCkp9qMTU6PQyyIdrMUg8cG/rGep/ygMmbFJ
VEnm8GapSLMIhUonI1bhTeBapzCrMSr6z6bXu35kIx+24ZATk2LrHJcjAGV0kxs3
Skf41EIHRTWuAJJVZwfsQybKzslbBbUHiJ7czQADAOh9NzMTP3LCk+6PEFsxBwAi
ZSlb0Qng1HciBLBz0Mc3bZMHHezIq59F84AKeBWmvh2poxsQMXlmdjv63tnUduN/
B5zR9x7kvoyF4RzSQRn/fMnJiRkiY5/qQGKgmywOQbJ9nwTXdW7+OkFxGsy6Ital
JW8wnADHoXGazH10bH7XKCf8kBl0X1iK6wdoc/4uKgVXGwlx3oOCW5uqluQxZ2dS
7KRvqg8foaEdaDT9g5pfCb4zGTMSL5SmYGeHluPW2WvroKfzluAYa/Hx+Woc2GsC
SIdztyQGWDvI22Vmg5e605HYIvq717bpsclyvFh3qzuCKXALumAWEjIyTIPdpq30
mDvc17DUE+mw3WsuhegXilPCDJP22Oc0KAlXkWipG7R+MTBGjDM=
=3+8B
-----END PGP SIGNATURE-----

--8Tiw7FwXHHa9HiO7faFqfqq436VaB2VTw--
