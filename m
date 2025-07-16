Return-Path: <linux-leds+bounces-5082-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3EB07B8C
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 18:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A524188D023
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jul 2025 16:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4258F2F5479;
	Wed, 16 Jul 2025 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aT7Z2p38"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E62F5466;
	Wed, 16 Jul 2025 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752684726; cv=none; b=Jlhvjyg4PBl1P4xohsoDYtzJqqf+mvfufZ/qNrL0soPrCLBRITVImQPs23evgRwkOgEgqp94StyBIKXXiSsX0QvuqigSNlh4MwewpxPPUCTyB1xvGr7Xs9dtjejpu0vu12d1s+7W0oNr6bS04mlArnnbqU1MLzWNbjLG/wivSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752684726; c=relaxed/simple;
	bh=c0KFAemiEAizQp2k38W1DuW2PQBYBlNlBSNl4rQu5Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEhOcDNQ/EkWsFlXEfum9FoeHFGf61vkt5gvDJ9Bc8alMQNlXUdMViy+yBqkaoZ/lkIbDVu5Zf7ln6hNqCeWyLQCJRfv9QqRVBpomC8GTE/f8jKmx1zR5fnxMOn/9IPOvT5CzDfh+UEedJ3g3jsQWto7tpnLbRM5umT7+Dx3Do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aT7Z2p38; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1752684717; x=1753289517; i=w_armin@gmx.de;
	bh=c0KFAemiEAizQp2k38W1DuW2PQBYBlNlBSNl4rQu5Qk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aT7Z2p38CfjeXl6Mmw7esrto1w5FZbGkF68bV+FRaWPQQ4zYZ/ZJvkUbERqzLRyu
	 qZ/FOe1w9fRHxmJN8ZkI7EnjcWn8vcUqzswG7BwyerfjMoA+slg9ufkY3slOFgaHI
	 4JeQDr9Z2eihDDB/Nn3omqip2BUeS5x64tu8tRoJW+CTxwz27fCrCNxrfm8/yQVMw
	 38jF97088LfHUz2m22zelQBOY/jwFicq6gscsI61r7qUCShm15NxIjSYxy+cQbu3R
	 Iz3e/49RWIclnXW+E56qdWNpQqxEmTkMYj6Vi6eSD0F8pMPtWBCZmtGa6PogpLlKj
	 m0Ml4UTUUKzpiR+WQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel7v-1v9m9I1omb-00o4dP; Wed, 16
 Jul 2025 18:51:57 +0200
Message-ID: <20213956-f1f9-4eba-84d0-a4ea5fc745bd@gmx.de>
Date: Wed, 16 Jul 2025 18:51:54 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH 3/3] Documentation: laptops: Add
 documentation for uniwill laptops
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 linux-leds@vger.kernel.org, lee@kernel.org, pobrn@protonmail.com
References: <20250712112310.19964-1-W_Armin@gmx.de>
 <20250712112310.19964-4-W_Armin@gmx.de>
 <533f0f95-69d1-4151-9987-84b7702179d2@oracle.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <533f0f95-69d1-4151-9987-84b7702179d2@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kKNpbXcZsNKqp3RQzdjpeMMr5vFRtbkY4YCdoB87SYhLP9UTKXf
 48VUcQn2QN8eLMps59JNhbwm6/U82ghSkYf6j8XfByK6wmYQtvzZFOb130E8cD/+QB/7DaE
 n/qQZy9bipkcxR2bvgGBw2AVAql8BWcxW0MOi+NkfCoQl7Bhud9uHtV5YkvxhPFE0EU8Fvd
 kfpVjY2jfJjxAF9xtVz0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0Pi65zeo9Ik=;bUDGapkUCcufhIjeIvb04i/II65
 d5pry77HQQVwOmbfosYC309LoaUrEJ5fLgjaNjFU2Ps6oxoF/LA7dPAI4Pru3xZhz9HnUCx73
 +l8neb8V5QtxOhqiOpfVDTnR9WnhAbAS1LVumlLrUt9OPYLM8350yohAG65b8VqTsbwsg/rDO
 p/JaGm9jHXJt/8eyZz3NpMcINt42xI01Fk7ECok1n4TbqxHvAhfOtZD403zZJcWOipdrCEeri
 7Z+rcA85Umz4X2XGG1ix/V+So0flacMFlwNMzf/0Z7nQ9jhMarpyMgyEhfqEoeuSjz1+S2V3s
 9nIw4vlAO0THnixltspy2mLjl3MFTbmFMKH7rfclYEWpUvNZQw7kN6dfP5dIw5+rEA/x5Lw0g
 hNytPolseel7vxLp3gfxL+2n+Gi7PdkaaEHWKxERVQuY93629WedPHMaTEtWCQfanWvKqfwNl
 9TxWOORtGfSsyIcA2rAsamjCN1qRwFsTxAsQ8Efw9SM0kt8ljb0scS4V3AoiPDLsj9TGMYBrl
 wUaF2c+BSdSesiIA00zMH2CcPZCDET/aJNSgwsqSNwk/G2A0hyIG4jKYt2TjVsA68yrtlilAv
 fbU8UXdRIFgqXfcIPWIXL4YP8ZzQiY3nmZAOpNtR7HXlteOsWAntW5qstQUzrK1ROEWO2juXk
 5QO6bHo8NSf/DafVtXlcazh4pxy1v7m+124qMA9s8rIlKoTCk0QAtFoBevjubb7UqXwyv+8kR
 hedInLCYlKrSJmRawgsZpF3x47MXMB/vTiCP6dbKi/+nrKfvYg9yBxgo+qH69sXV5ahROU41S
 hkUivRSRZVpB1NYJBG4MQQUySWsPw7998Su/bcP/7v9tsZNejUnbtrJWePpPt78BEE3exlxyV
 v0Vn3iuOZgcewneGDKz4mEkEnj0vwYFpPvxAUOuQG8DKsxjTvpC2pYGYUCweMuaPP7kQCx6ne
 cCkfEmWdTBuVP7vJxDpOoka3o1czSm5UATUyMufpTun39P8PB4+xber1IfNNrREpwDyFQR8yr
 6gfm9Mr2MIENs2kC9MATFeqG6tM+1Bnm0BFgoF310yMHlW5RqS7Qkn8/qLHN41AMdbNkl+rWa
 AbuVp9lmtAIPWm7o6I666HWVbRltEFaI2ynv6XkGbl84l/vbrO6CZ9QLfOYf3KlLbDdue9lUv
 9EQt3ynQT/ImsMH8Haq9C+H69EWZdY8vzvBy2IIbxO6pTtk0PoGK5SCcenQSaW8B5cGW/BA4F
 lW0HH/iVVvtc4KqJzMQa7/X2sV3vhJAp671yOch9Fo66d8ESeJbAnWLmFdg1JalFSXRvCSnOc
 dcpNGko8IU8M2/Ty48Ut60BaVrAqFKQcme8R2q7gXAvACQObe+FQgQPEwOQIadD9BXln9KhDA
 FW26ZBVIAKi2HW6oN8woqgygFXaqMciVAAMi/H9UwW6WmLsmgeIy/mEAzgJ5eel2vrhlnhmOi
 Ynj6GwojWzY2Q4B9CXWQ25dOIFaDp2haAoCIG6leqfAwvavux8oUL8Dgn9UtVgS3M2Pip7GFS
 Ko0xOoOb1y7LwyRNKQpFTvrB2qkpaejsX/rSmnj4a5pSVmjvR9id8D4g+hVrbuCQ/gDVzIHYA
 lrPCcC0hK/v9fBDhS8sJ6PniJ2wAO5+qhMm0JjdkWCQyMWtP2tMX/d1uUPYi30Ju54pbWdZb7
 +Ud+UjBjpJJ3XR13C4+fwnbydsSfGg4xCF3eeOToYGYijDaRTv08QRR69uQkcuSqITKtKneAh
 wNChCNa7sUYy/id3pTA3cbtminDVh5/az6YVc7hpu43nWhRgxGCTAZFgZZCxalaWkaMXYcpIT
 ErL2NcNuIRgrtq/3fF9V/GJ+haCM+Pudd+ZbIcjvwTx6RxBQXHCnFhmUtJPeSHgnCYwB7KObk
 UB7No2QlcQfRSdkh+on9m1OFxPO+bFFtGxrMS00ai7BWjPoHykKRtZJViSiX7eOQeFixYI1pc
 u2WRJ67SCgerXRZZQxWbBoSk/5imzTRhpqpxYdbsp4bCOxyatBoYFZvFT5/zxbD/yyRr893+h
 tdNOK8XDSgYaHZK64xd82dRGra8La+hTBeWsTMLSrKK2qIM5xnJH2nxN7HcexdBrmrcLdjB+p
 DvX+WyvyHjWxi9UFVc8voV2f03VuCBZ09BBtlhwDce03n7rOrRVwvc6LwI9i2EzH5FUCCEZUJ
 Px3KoxuNBjXolBkIwyIHEz2PUjXMqSmwKKt9DsoTDpsIdtPZVtBllOS5zOus7Ag2dPJmTIhWV
 qx9Yx0PNMmotJ5a60+jGj/P2bsCp80FSCBwcbXPWW5UBqxD0tAhZ/s3xvdelChaIUKaNW5qGS
 jlSUoO5L57CZWJXBF50os7KraL9W4Yn13JeHwSY+DgRU3xxEvwUEjDYYOTdxf7Xkq2a5SXiHy
 PCqxukgh2ZvQGV4vX1bn9rpO8CRWqMUHgTeVyZDA63h390XBcp2drEf9a7/Gd+yBXMOGcAtT7
 Mhg0en3dMAzNiEkQUiwzmauEStMCiST9N2W5LSLlV2FX4MMB1Y+q/z07vPWWLIjFSxk2F0ziu
 Usjptruoa4IcKhx+Y6gJRjGQv3kscg7hcPDrMfGHzslgAJOU8C3LUVdx7Rv/8PhRC0cRr12Uw
 DuxKnBd9iUuUiatTYtAchkmOzNhd3satyPPtg8p7g+RKmJ2UQTpiDTmsinsVrqz63mWWieF5t
 LQC/vS+SOY+UrzkcSovg004CCwzTAj46hBbJSwA32BlYzlMVxPqxgqW1Xhg54G0XBcf2IHqu/
 zZn1+zK7ZrRSBrsgJo57oigccoB6MHw/FNgksA2U+cL6ldhHBFN3Iu+m9LWLAXvZERH8Vh1uE
 zjm//OjvK3jx7yleOJzFJQ+kGMIZQa3YJPODKkEGEjV0qL8KITPBBeSE4se9E9tZsj06fU9YN
 6eza24aiyWFLFavYC2wWkXPLlmcpbHylqs47h1Bz52KCFqXeeOGfR+IHh/zoQc+M9KRjzz98X
 me8wjJMFadT04cmDBzw49KIu7+FH7gKbKv3pa19NnVAkLUuN7HetVPglu06d+hRoWCKGjm84H
 Wv4xw+0el7hTVItfG3+clFBZbX/+bTCHNZsLEVGH9/+2JP9Lz7AiaoVieOioMz+cCueFGhX5G
 grYBrhX4JL92xL+l8Drag2I24BzB4K4Whm87+joEaTJO46je8XEAwLysVjU0YHso2qZp8EFYg
 m34p0hiR9W4KwMCAbUJikDdkEdJiutAfLUdEIPGUXRbmKKcyOcnwsuvvgpok9jrB86jZl8QeN
 9A1miS75atnJC5ol0wZLqUO+9QzZHeyPXmtFqFxdCZQq1/mRGeSdqrqCzveReNRiAy/QnAkV5
 U6lW6VTccHtqWRe1wR+kduMwOyJZP4lTZWZWJpMamAerOp5lTVH5nOMyvs4qorwY7VKirtO21
 UplndcQVesUxucbcTM4/Fr7O4IbNU5/7+2/eFlKa9rYl0ih+JUlHpMsKS1DgjT56zqubtrvFv
 fUeXrpUrKsyPHt1LcBYIPN39i4DIsZpub+w6hgiLJPdLvobzEy/AySXi7++xPs4O6kQDolWS4
 ArAXW/2CubCxValQDnrN48lr0vvh88p9IDlYGB+bB33pAn7To2XEIwdHBC39RHSGkhEet0VJ7
 5yKLEOA2Xvk4YWgE9DpLlCMILEsI7jfGiD3Ye7KaCkVFYkhZCyy0ycGmg==

Am 12.07.25 um 14:54 schrieb ALOK TIWARI:

> On 7/12/2025 4:53 PM, Armin Wolf wrote:
>> Add documentation for admins regarding Uniwill laptops. This should
>> help users to setup the uniwill-laptop and uniwill-wmi drivers, which
>> sadly cannot be loaded automatically.
>>
>> Reported-by: cyear <chumuzero@gmail.com>
>> Closes:=20
>> https://urldefense.com/v3/__https://github.com/lm-sensors/lm-sensors/is=
sues/508__;!!ACWV5N9M2RV99hQ!MfQKq-XQLt4Lj_zRVzpbw1q-Y2RgiAMwHHbA8oE3H1FH_=
iL99Vb9H29zjLtdHf1xmTUNkT6ZM-xUiZmfJew$
>> Closes:=20
>> https://urldefense.com/v3/__https://github.com/Wer-Wolf/uniwill-laptop/=
issues/3__;!!ACWV5N9M2RV99hQ!MfQKq-XQLt4Lj_zRVzpbw1q-Y2RgiAMwHHbA8oE3H1FH_=
iL99Vb9H29zjLtdHf1xmTUNkT6ZM-xU2Vmgr2k$
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 Documentation/admin-guide/laptops/index.rst=C2=A0=C2=A0 |=C2=A0 =
1 +
>> =C2=A0 .../admin-guide/laptops/uniwill-laptop.rst=C2=A0=C2=A0=C2=A0 | 6=
8 +++++++++++++++++++
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
>> =C2=A0 3 files changed, 70 insertions(+)
>> =C2=A0 create mode 100644=20
>> Documentation/admin-guide/laptops/uniwill-laptop.rst
>>
>> diff --git a/Documentation/admin-guide/laptops/index.rst=20
>> b/Documentation/admin-guide/laptops/index.rst
>> index db842b629303..6432c251dc95 100644
>> --- a/Documentation/admin-guide/laptops/index.rst
>> +++ b/Documentation/admin-guide/laptops/index.rst
>> @@ -17,3 +17,4 @@ Laptop Drivers
>> =C2=A0=C2=A0=C2=A0=C2=A0 sonypi
>> =C2=A0=C2=A0=C2=A0=C2=A0 thinkpad-acpi
>> =C2=A0=C2=A0=C2=A0=C2=A0 toshiba_haps
>> +=C2=A0=C2=A0 uniwill-laptop
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst=20
>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..29f6ee88063b
>> --- /dev/null
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -0,0 +1,68 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +
>> +Uniwill laptop extra features
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +On laptops manufactured by Uniwill (either directly or as ODM), the=20
>> ``uniwill-laptop`` and
>> +``uniwill-wmi`` driver both handle various platform-specific features.
>> +However due to a design flaw in the underlying firmware interface,=20
>> both drivers might need
>
> might need or may need (optional)
>
>> +to be loaded manually on some devices.
>> +
>> +.. warning:: Not all devices supporting the firmware interface will=20
>> necessarily support those
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 drivers, please be careful.
>> +
>> +Module Loading
>> +--------------
>> +
>> +The ``uniwill-laptop`` driver relies on a DMI table to automatically=
=20
>> load on supported devices.
>> +When using the ``force`` module parameter, this DMI check will be=20
>> omitted, allowing the driver
>> +to be loaded on unsupported devices for testing purposes.
>> +
>> +The ``uniwill-wmi`` driver always needs to be loaded manually.=20
>> However the ``uniwill-laptop``
>> +driver will automatically load it as a dependency.
>> +
>> +Hotkeys
>> +-------
>> +
>> +Usually the FN keys work without a special driver. However as soon=20
>> as the ``uniwill-laptop`` driver
>> +is loaded, the FN keys need to be handled manually. This is done by=20
>> the ``uniwill-wmi`` driver.
>> +
>> +Keyboard settings
>> +-----------------
>> +
>> +The ``uniwill-laptop`` driver allows the user to enable/disable:
>> +
>> + - the FN and super key lock functionality of the integrated keyboard
>> + - the touchpad toggle functionality of the integrated touchpad
>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
>> +
>> +Hwmon interface
>> +---------------
>> +
>> +The ``uniwill-laptop`` driver supports reading of the CPU and GPU=20
>> temperature and supports up to
>> +two fans. Userspace applications can access sensor readings over the=
=20
>> hwmon sysfs interface.
>> +
>> +Platform profile
>> +----------------
>> +
>> +Support for changing the platform performance mode is currently not=20
>> implemented.
>> +
>> +Battery Charging Control
>> +------------------------
>> +
>> +The ``uniwill-laptop`` driver supports controlling the battery=20
>> charge limit. This happens over
>> +the standard ``charge_control_end_threshold`` power supply sysfs=20
>> attribute. All values
>> +between 1 and 100 percent are supported.
>> +
>> +Additionally the driver signals the presence of battery charging=20
>> issues thru the standard ``health``
>
> thru -> through
>
Will fix.

Thanks,
Armin Wolf

>> +power supply sysfs attribute.
>> +
>> +Lightbar
>> +--------
>> +
>> +The ``uniwill-laptop`` driver exposes the lightbar found on some=20
>> models as a standard multicolor
>> +LED class device. The default name of this LED class device is=20
>> ``uniwill:multicolor:status``.
>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for=20
>> details on how to control the various
>> +animation modes of the lightbar.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3efec7a99262..fe302a610fe6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25495,6 +25495,7 @@ M:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de=
>
>> =C2=A0 L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>> =C2=A0 S:=C2=A0=C2=A0=C2=A0 Maintained
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 Documentation/ABI/testing/sysfs-driver-uniw=
ill-laptop
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/admin-guide/laptops/uniwill-laptop.=
rst
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/uniwill-laptop.rs=
t
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-laptop=
.c
>
> Thanks,
> Alok
>

