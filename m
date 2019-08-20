Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1D8958E0
	for <lists+linux-leds@lfdr.de>; Tue, 20 Aug 2019 09:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbfHTHue (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Aug 2019 03:50:34 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:60363 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbfHTHud (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Aug 2019 03:50:33 -0400
Received: from [192.168.202.100] (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id B0AB51A20EE1;
        Tue, 20 Aug 2019 10:50:30 +0300 (EEST)
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
From:   Oleh Kravchenko <oleg@kaa.org.ua>
Openpgp: preference=signencrypt
Autocrypt: addr=oleg@kaa.org.ua; prefer-encrypt=mutual; keydata=
 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
 WVdfrwbus0lVCELNSvCIW2IktSytUxjQfmjBMw==
Message-ID: <9bedff0d-afc2-3078-9025-3b6b18ca7b4c@kaa.org.ua>
Date:   Tue, 20 Aug 2019 10:50:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ
Content-Type: multipart/mixed; boundary="7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7";
 protected-headers="v1"
From: Oleh Kravchenko <oleg@kaa.org.ua>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Message-ID: <9bedff0d-afc2-3078-9025-3b6b18ca7b4c@kaa.org.ua>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>
In-Reply-To: <4d64d64a-cc21-cee0-eb37-441bc3a14caf@gmail.com>

--7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7
Content-Type: text/plain; charset=utf-8
Content-Language: uk-UA
Content-Transfer-Encoding: quoted-printable

Hello Jacek,
thanks for your review.

18.08.19 16:41, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5:
> Hi Oleh,
>=20
> On 8/8/19 10:32 PM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>  .../bindings/leds/leds-el15203000.txt         | 47 ++++++++++++++++++=
+
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el1520=
3000.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.tx=
t b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..4c2245babfdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,47 @@
>> +Crane Merchandising System - el15203000 LED driver
>> +--------------------------------------------------
>> +
>> +This LED Board (aka RED LEDs board) is widely used in
>> +coffee vending machines produced by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible : "crane,el15203000"
>> +- reg :
>> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +- spi-max-frequency : (optional)
>> +	see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Optional LED sub-node properties:
>> +- label :
>> +	see Documentation/devicetree/bindings/leds/common.txt
>=20
> Please change this label description to the below:
>=20
> - function: see Documentation/devicetree/bindings/leds/common.txt.
> - color: See Documentation/devicetree/bindings/leds/common.txt.
> - label: See Documentation/devicetree/bindings/leds/common.txt (depreca=
ted).
>=20
>> +- linux,default-trigger :
>> +	see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>=20
> #include <dt-bindings/leds/common.h>
>=20
>> +led-controller@0 {
>> +	compatible =3D "crane,el15203000";
>> +	reg =3D <0>;
>> +	spi-max-frequency =3D <50000>;
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +
>> +	/* water pipe */
>> +	pipe@50 {
>=20
> s/pipe/led/
>=20
>> +		reg =3D <0x50>;
>> +		label =3D "red:pipe";
>=20
> label is now deprecated.
>=20
> Please use function and color:
>=20
> 	function =3D "pipe";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>=20
>> +	};
>> +
>> +	/* screen frame */
>> +	screen@53 {
>=20
> s/screen/led/
>=20
>> +		reg =3D <0x53>;
>> +		label =3D "red:screen";
>=20
> 	function =3D "screen";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>> +	};
>> +
>> +	/* vending area */
>> +	vend@56 {
>=20
> s/vend/led/
>=20
>> +		reg =3D <0x56>;
>> +		label =3D "red:vend";
>=20
> 	function =3D "vend";
> 	color =3D <LED_COLOR_ID_RED>;
>=20
>> +	};
>> +};
>>
>=20

--=20
Best regards,
Oleh Kravchenko



--7VVo0gBggUnk7uEpCQyGksCKKYXlbzIg7--

--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEC/TM5t+2NenFhW0Q0xNJm20pl4wFAl1bpj4ACgkQ0xNJm20p
l4zizA//f+xOlcTL6wuAms+uDHTIEV7eZvmNi9JQRM8ComiiCMnJPuIk9pBROwFw
skJW8UqYvbnOJWfq8nxW3dOLsV1rS6BxX/m9AtVpRiEUy3GXG/MJfXKmuLb0fueM
jJUS14abb9aAcqk/WUYMrnqyQcUDI0rvrE5AMBKiDGE4YWhYIlgLqRjIZ+B/1BRT
p3uUHoLnAXLe21fkVjYPDc8gQ5qnKkUgwKn6d51tA6R/slP6EoaSmVl2USIt73B4
llbCgOUbdIz63q3o959bKEoPmlYONTQ0B+pQoacuhcG9EAvsCF+7c0Vg/7tcPxN4
WaJptuMv2djrGiclXS+U0BaZ8I9VewvJ4LOaRCSwAvNru3TYgFn7wOYRPC4zwnrV
rD7Oq/WHZjsNCi3+YbkT1DVb+sC904Jm08PhrmkwYE26NgDXtDx1ir2N8zN/ZPer
ELoxSVpKVj0lqW0ACu5SiaFuVMXltDnKnD9A/TbRvci1E5vIpeMm6HGREIvIJfX6
ks69wIKOHVe5qerEJo+S4Di8y8LfOfbYow79Mz5CmnTCWn/wSMr9IzTiWpLsua7m
CYnlsSQzM/JeIWNLeTpPf2T3yYjfZeW5YBeBYctI8NIkegzeP2P8OTNrSrcgEg16
3dgjj7V3zWfEFWQKJ3oGR3KEA5qrFq6asE4m0QlyHUO0hIM3gXg=
=jj1J
-----END PGP SIGNATURE-----

--T0c3I8eUnDKZFbPalo8pDAdG6SZftypdJ--
