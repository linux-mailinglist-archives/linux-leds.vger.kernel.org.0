Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B569B2710AA
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 23:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgISVd6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 17:33:58 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:34707 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgISVd6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 17:33:58 -0400
X-Greylist: delayed 453 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 17:33:58 EDT
Received: from desktop ([188.192.134.246]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxmFk-1kgLeO2JF0-00zErM for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020
 23:21:22 +0200
From:   "Adrian Schmutzler" <mail@adrianschmutzler.de>
To:     <linux-leds@vger.kernel.org>
Subject: How to name multiple LEDs of the same type and color
Date:   Sat, 19 Sep 2020 23:21:22 +0200
Message-ID: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
X-Mailer: Microsoft Outlook 15.0
MIME-Version: 1.0
Thread-Index: AdaOydadnqmtch4wRDaZ0Q2v/NO3Fw==
Content-Language: de
Content-Type: multipart/signed;
        protocol="application/pgp-signature";
        micalg=pgp-sha256;
        boundary="=-=o/i14u9pJrxRKA=-="
X-Provags-ID: V03:K1:RVAumkL/z4bWra7RAyDXkAVEYHmJdp3gnlmfFhYr7QDkpTG8AX8
 UMddHyCWPxzFJdlOmJUp1GkaTwVFVdux8R6VmetsLjjm3XWyYu10wZEstVlbDvyZjnO2Fzn
 uBpJNkH5SYiCHJNt3/T22rsZ6SZOa/Txc54aMg+ZVFPCSOcX/QeEE94t3pdli6dMlczhNBf
 wUQepT7VjvjE9dOSa0Tgw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtZZT0y96wU=:Mplw+TG8lGHF1w1SILpw4K
 B0/LiycXGA8+Utmqpai1LCd36w+OaMKA/E0XcfRYSPA16iilnMONSGm/LPua8OVxAjl1zvBzE
 ZBTviB9BPvI4Ar5/eN0d0y8lGt0husuOzC0h07JyEcFgtkNzJW+HFEucZZykLDIVsXbV+aRWM
 f7rbzGZHKuQpNrHCPtZ6+UiV1HrbyJrRimY1rT+f/XZImVblM8DQ76lhIWy4U5vsfI85q2Xuj
 gFvFnNfT9LjnAxVPfA1mxaOXLyLyM3vaUEtWqDe2+lPL/uAfSOCqYba4+6k5uM41zFH+JnlR0
 vO0hYwuwhGQleynL6xGTBVigDeBaZJHuUxRN0vdc9qzAN9OJCE+pyiwtl8UvXli35G79VMALL
 4va1Lv2w7UouPn881suyXWBL1ZnNXkRQ3sqSmCLal0E9231iyGfvbLEHUJ/5A8CHuw7orajnL
 mQM2mc4vRPym4m+8w5nxuBFLoc8RzXjskAiQ+OBK7Ov+7qlSpuFc4Ypmz8aKQcHy/NxNVchkl
 /Aydw3uDT0K/aB7oDceHUig2oztzLuMa+c4a3t1c+vLhhdraKC0k5rEk0qpCu0naEoHOzP3zV
 UFSRYcEzELvO5fPcoMC4uH6egWU9VYCB1ITRdelD7WDf/KL7NRqW3vIPNBq8G+EHvUyLsk8FZ
 OxfJZKi/pAgUhE99bSRH9/VW58kkjxTza7skufMf7HPTraGJ+X5NJ/BHJMZR6mZQ/2rUMGk6d
 zckFPNb9AkJHW98V42h5mo2FBtiS+TcSuOJJFxkGvO9YFsFaUPVWfTXWvHRiP/opmMhxREWqH
 4xXV0EgFrp1kxFivzIRMj3B7BGztTKB6fO3Ni4Xpl/6yU18PL0H5HTIhYfwgzq0RhG3jf5p8Y
 s5gfVJfI1jJraR0m4Biw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a multipart message in MIME format.

--=-=o/i14u9pJrxRKA=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I wonder what would be the correct way to deal with a set of LEDs with the =
same color/function combination, e.g.

	leds {
		compatible =3D "gpio-leds";

		link1 {
			function =3D LED_FUNCTION_RSSI;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 13 GPIO_ACTIVE_LOW>;
		};

		link2 {
			function =3D LED_FUNCTION_RSSI;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 14 GPIO_ACTIVE_LOW>;
		};

		link3 {
			function =3D LED_FUNCTION_RSSI;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 15 GPIO_ACTIVE_LOW>;
		};
	};

or

	leds {
		compatible =3D "gpio-leds";

		lan1 {
			function =3D LED_FUNCTION_LAN;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 11 GPIO_ACTIVE_LOW>;
		};
		lan2 {
			function =3D LED_FUNCTION_LAN;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 11 GPIO_ACTIVE_LOW>;
		};
		lan3 {
			function =3D LED_FUNCTION_LAN;
			color =3D <LED_COLOR_ID_GREEN>;
			gpios =3D <&gpio 11 GPIO_ACTIVE_LOW>;
		};
	};

These nodes will automatically create names like green:lan, green:lan_1, et=
c.

Is there a way to force a certain numbering scheme, e.g.
green:lan1, green:lan2, etc.
?

(For the RSSI leds, we currently even have stuff like ...:green:rssilow, ..=
.:green:rssimedium, etc. in the label now)

How does this match into the color/function concept?

Thanks for some pointers ...

Best

Adrian

--=-=o/i14u9pJrxRKA=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEESgN6p2H3WoMOAf81oNyKO7qxAnAFAl9mdk8ACgkQoNyKO7qx
AnDjMBAAkkC6fGfuTS+hYAzaXV3I/y9UnLJprbrLyywTmSGXH9XdQ6HEK63cTp+l
DDkX8JpfN+q0Q2yDs2B62MbGnH+IiG6wiSPQxJyWHmHo218edCknr3cB4v1k4V91
St3WaJnrE9fV7gjPxLXs02dADbvFnwdvAHJ8avM6fXsxqkuoUQ0zEneUK/2zEIuR
NusxF1Wk3TPEzNcIiKfhUZJ3HItj6iOnsT3TICC6VJFL1yr2uS2fKuaC7ARd18mv
lTWZSK25P0A784LAs6a3fkcEJeqsmwwiq40QNttqRZp/TnnkDGeLUinYaTHLrgyB
OgY++9ols3kz0FM2+zh8Hza3R0PVdDlRBpYl/LeI+9jTtynI+/57M4j9+P3t3PXR
rZeI00mUBLz5j1jPXCPbV8asQG+PcaSXaqYXReIxvuPr0g5wXwWyug0w7z8nCASj
hEmxDHmwF+xRIx7IB+/DqVQJ1yPuC9FKUxP917KycExGWYB1SuoL4mkt4hrv2ChW
d+cdcWX/fJytTinVHvt4uRezP6/k7gr13xAJybRyK0Pq77Qq1Nib/1PZGiklcR0r
B9rqFoizfvrB7ARikAUgLA2MmpVWjgDOR+jvELb6YexTbWZnEh5RQnQKjyTcjxoh
nHSa+NGwbQuGTLVQQea9o70L40AwgfV6T00OpLxcCDgl+snICZo=
=LMPj
-----END PGP SIGNATURE-----


--=-=o/i14u9pJrxRKA=-=--

