Return-Path: <linux-leds+bounces-5449-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6796B49547
	for <lists+linux-leds@lfdr.de>; Mon,  8 Sep 2025 18:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89A667A7E82
	for <lists+linux-leds@lfdr.de>; Mon,  8 Sep 2025 16:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F07E3081A1;
	Mon,  8 Sep 2025 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FsFkAzVv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBFE2B9A5;
	Mon,  8 Sep 2025 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349033; cv=none; b=CtP88H29ANqqfrVH4VU9LEjrahUyu2PejZG7MrCE0xJsm5RZiDDNBlmtoM4dZ/jxqsqLlVY1AAwDK+vJSFpTsqeVdSjtLzyyAamPT9abhpMmZ07cfwGJaRDxpXltN0g44gyZoKUYPCDb21HtV9Ym57N2fdkoVkNsUMhooeRcJYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349033; c=relaxed/simple;
	bh=RMyJdv1l1+hY1H2HpdA1Gy0OrtaHNiTfDMc+NDYrCz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rU9DnEqZ2fUohSeRTPigVc62rkoUKv42/2khuembeLUrKjHNUtRA6NV+bM0wKEzs0yscadwcrIyXzaCnJyT3a7rwMicH4vO6q3pDbWDJIJTyKXsotpOFaann+JDHoAlMgP9NWkFg/IvYvtLLFjnAF55YKizHH60hmsB9dI5ELNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FsFkAzVv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1757349004; x=1757953804; i=w_armin@gmx.de;
	bh=RMyJdv1l1+hY1H2HpdA1Gy0OrtaHNiTfDMc+NDYrCz0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FsFkAzVvTD7H4FkWwn7VYELY3kSK4H0n6eJhxV7oUNczravzVtp89JN4ZBKINFDe
	 x2hM4GvIw2fPAiKG+2YTBd/lYmzMYFEU2lRqqHX/nqapxdzYBBYgplM3y15BgFOo2
	 jKSNgezozxPZChm0ssUS/fLXkGGy0FukN2aTURfTksm8Ac5UfviyG02L6NqZejzY1
	 n7eolf/Yozt6EUKhzohckiVmbkkqX4Prtq7IMRwpUsX20L6P3Wk94/Sx2iGg8tqIk
	 Gzr58VyTITpAqFhTeIl9Md1oTuUq4E1JxNzivoOQQSYvLll+lO+zfq4Sr3HjZDOEX
	 PlrourJS3H6hklftOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.122.8.1] ([176.5.138.108]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1urH2Z1scC-006Zhv; Mon, 08
 Sep 2025 18:30:04 +0200
Message-ID: <8400b8c2-5ee6-47db-889a-e3224010357d@gmx.de>
Date: Mon, 8 Sep 2025 18:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250831192708.9654-1-W_Armin@gmx.de>
 <20250831192708.9654-2-W_Armin@gmx.de>
 <cf5b6334-7558-4115-92e4-28b4b531490a@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cf5b6334-7558-4115-92e4-28b4b531490a@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GYXdCJphJoMRtf0+r/lN1tVGLflRLUqHqp4eh5tDhlwqAjz+YGD
 t24XCkGsY/Jog8O4IjWOgJwd7gh7H4iiLO5F3ghsM4pQEUVBA4v5emmGpUhlN2A9R1WZe0O
 w/Hb1ySzFkbhJVb+ikQoifaphb6rQi78VX/BiMWyAinoQ5ZbB92aJGTB0BlD4YH2KiCNYcb
 1O829IwwFjykyEUozvbOg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:owu+dUVo48U=;RBI/oHxCMFP+6a+/cMBe0TmdVTC
 HMN8fFRK/M+6EEjRr2+j3EdDOsFp13I8xpT9XjYhGdTXTs0DJROiNgHZZAFyAyti4xd3ZM8u/
 rZ6tcKo0s7dByph/S4zXqayFZtFFtQVvqj945o7brYXpNYtoFnkHssxSkdV7lZN4OIIkZ34P2
 19J8vkQ1GqnbeiOnHr3y9gvcRGW4xK+W7sTBfZsqXGEIv/JyDlF2EbtfRzzbCH66n4yvOh0d5
 6UEPuU4d9G8O++cOglMuB6n8XOxBC0LEoNQKebiFl7xivmF9SFIrTceqSU1sipHUQ6x/tPsGh
 115xhUmcwTexr4Na088ZFZZbm3IcIJiBGALPMN3imlUwicqhwZPPqi9zXvux7qOyFBFPnW3wH
 uhe+IKQYSnf7lU+FKWKfC9uZ+YBjH70aypKxJ/oO6OP1L7cmhxGrlp2/DmTC9RY+5Sg570Rq5
 feiUTSUWs8GzbiDlvskrNF+5dsrfPKsc6XDsgT+IYEHOY4qi5Fi4XnepTlUQPEELRFcodtpXT
 9WuFF0h06Xzq+DWtdYWjFE21Yk55v+y6zNegVB/FO9RIXzP/iRcF71DIqa8ggPT1K8I6PAgu6
 ShtDeYgIDfzF07ME62de89bUCmEmRTrr0+rVr1wuDZIu3GmoUUhOzEzXF2olLvbfto5oZAHDv
 K+jOWy84Kzeh9KgL9vngr6RJsCThaggAC7dohPm6aDxATDLtyIg5aonjuO9IwEPII7I+XJ4zj
 NP3jjND2ng5QjzQuAMu4l6Q6z80wNvMTZr+0wtPAwQ7PwZTlpeBu5PedNSiTfs7/WaFbR6Vbc
 TUIZeEggvSqJulQv6slxPQ6Yel2oUcyNbW4KFcasEsBTLfN/4MrC9gascYy11eMdBgOv/2KF8
 KBmJp6RFDpvRx++QB+rG8KFjEAgAfvGXTWHvfrqok3sejCnI/DR//VPZ8cmDCAOFpaJYdmM9G
 aORTKS4lxG9QuyToQJKBg+Qpf+gO4+CFTrAgzxegGCj0Bfx3U73EuMTYu4i3LL3SR3plxZ5JW
 umpt2BG/egdfYkdyTTv+8zLzB5HF7bvYNOEe84KcWfnGUXGoaCpHfng0IqEo+7IgxB/hAwaN5
 IgDdVCuuS56ayjaWZ2jLDXZawq5rgVJ3FW/YegGQ4dbxuJ7TwAfbuE2LjsF5+ufWtJjhSKtNq
 11ot/M8JaxREGNmXZTzLa7OpK80VdARKn/nUfll7ztAjo7lZbRkYoz4N8oMF6uyIrQxFIzhEN
 3qs0siZ5n1Hp6loxVLqCHgZI8wdxSmAxjquyUZPv2Oa+eT7gf9h7rhDTaZXIHW0tlU1O8TwY5
 jB1t0fzlNNOhgZ0eaT8d2OPDuni6ljw4oxeYjVtIDvRLex+biv1sYtXBxF47eBlzwUxSbPGaD
 5+QiSYlzo9a2m2zjd8xVSblMnIrKUqpYKP50IqJ/gBGsWSPkbQFesRt98W53ltqtAU8EMEDeG
 Q1YmSOQZ6f0a+q3t/IUjXDEfo1Dkvzn482JYmWbtsjb6uaQJIOeGOp4KoGht3ljup3ZX6mwYY
 DNoJPLled3+4CaychItw3t67rq9F0cAgSAisxR4nvMDr6wc70vOSVOje5EOXD109PTvz0WDZ6
 9gFNUdBJNiVN5sODiZQR3YBDChnIpNanKEfhaopr+w18rsBhFVAYdIYfTlk80P1d6Dg4sBGH6
 3RKFYgqqa9tdCE3xPKRjmdZuHs6pfxKWotYBjlCGQNm6tFGVykGpgzNlMAB6nfIU2bvFflaHD
 nGK++X0KhqKSvwZQ5gGzV1UaELEKyI2ZG2mQPuAXR0qXVP5VEO6LC2SQrMW33dGvNQF9gndBy
 vM3KFCka6dJay2xerHlryVFyjwToVXRUWq7vuygya6VJkLN1YQ/M8YiUTdm2W2pqNJhJfI1xZ
 9qfvM4LEJzMZZdAQa15bJCkXCXOjNVVvYpnrz3WkILJM77S2Flt3kkxIK5aJM5V5GmgzHmZ2E
 fREEgkL5C/T6TkkFwJUB0FK7UQ8ERmjdvYiylySl9x93jF1GQnWylwUDpkvbBKF3wPAp9iSGa
 PjC15h/qskckVSfEHoHaHmxaXAGDK+zUdZtWwauRqbCVRbDxv0AjNbQmXEb34ZMb3nfcP1bPA
 UEWJHkWq+6KlonnQQO4xBM0NBxRt3p0A1te6BFOrBEkA/U5khbPCVPjB717Q3393DLoaR2OhO
 nMnCy3FlHCai+4LABAUZHueC30WnqMx6O9WLL60wkOQp9abYiRC0kGqo1IN5XV0HlShPYgH4q
 Zv/jqK5i46cyJ/6bGAAjn09vp1zudfaGx+C1vUjyoOYk0JwAB72PG/dZLOgMXnQw4PSHzGzWd
 Clvdg3RyAIufmXlJ0xlxkBVCGJBdit9bwE6IJLajQSA9x56BS17ojPRiw9gddiukhhi4JxpSM
 FZukdnmhjBqoANYkMX2LPOShxhfeuhCdFd/VAOs5QtaIRC7I3G3sPxRZUpO7l+0HnI5D3WjC3
 0TWRiG/83ZoTFkcXo/7bZ+zdsJDwKfPmvTW//NQT3r0Qie6rikyW68vsuNo6epvMP+c11iDKi
 dF0TzAZHbXtxpCS9L9MV2jEPMuaG1ln6D0lU0DhiVq5dqShKv5/DhSl/9PeX4SbVm6anyqVUH
 YA4iYxoQT9gY183YlyI0ooJy0nfC8TDvCwVzClrgrQXwEKSkvO/oCxaIjx1/Ftj5KFJ05IC5E
 PuUjv+QZMH7/X0AHP6dAXHDszs+GLiy/ojKfAXaSB3nPRS3Dj+x89WVtZHCnLV4NP8NBMxZ2g
 ZxbtJkC4wVa75ih1kKU4OTID6KKje14CLk410IQLUPNwicLdSA5V55KmGj1gb+EhNaT4wmQ+F
 vgS1AgLmKfgGxyj/lrLrIDUolb5YvFXIaMcOeBnHeu2E69HrgFGNntuGP3IDyxHSuwpbzN7yA
 Ku7O7wTZvWpANUnkDiAyMI1SYX5nvvt14fDNt8FCsfsZ7Asm80deUkIoHA6IM1S6dWnOpM2Dc
 JUHlPM8eX1p1pEfC4VWBcJxSc5b7bmu+EYMTVAKOmbh2sh2HeKeKSanDoj9zJ02odU1tRrh2h
 MQnWYA+SfShgBec4F0EJ8+uFEYvtc9KXDAIoBhRr3TQoZA66x4hcg1+Xk6OPwv11vLqjHobKq
 ISApWmM3ucE+y3FEiZevVqcSeGLNAwTmN/Ynt7QjitVlHvBby/aWe29y18wyA+Hs7ja9nY2NH
 DBidvZTW2VFO/4y0OvZM+blYOQDyHsBTxFFn1c9TW72AJ1JtvwtoZlZIIchf6PxOA6d8VXF6c
 DuZPodv54tLqutEgjrPViuRZ2w1tmb7YhrNERfY7n1FBjCfn2TsE1n+VNVHnjsTLoNljQgunA
 dJSIa5xUfS4svccgp57vA0x3XR78rQTZ3oTICXN+smhygVlUlQ5e7ZA82wPWViJvn2hl73Ygv
 mMlvn5K15i9KaJ7gFyfqG3j0sEe3zH3a7Zhta0jdtbNFX1fnsI1XeIlzAfTd5j6OL2O0Y1wdy
 BN6EAqYIjAZSC0dfJm0g25uCTgwwUL2yfStY9iT/ygOO00tob+usP89pmH6ithQa3U4uMIqSS
 chZtKA6/NUKRtxjapJJLUR1RnIl4S5uKIHLg2kQTx7y6H3xqqmcPbClX8L/BJt4J819URhjYT
 //3GRzpIajslHvJdgS4j/t+BoJ9fdPRHqOlOzCedgPEYqtLhJmcokwUHdgJlQtyYXlNdy/NSr
 jW9hXStw8D4Qjgu37g3EtRMpVX3XDcC1t0KR7ywQXBDOs52qH0iu79tLIwYRS8GWyHW5NY5xt
 YpYfTL8LKSqveZtXMwsrLjNotBVc34jl6CK1bPRU1BPW8B9kYB3c2k9C8leiWXgafGRIpC7RS
 Y32cQg/SmDiNsXm43FJ81YVRw4RzGEBbgdZBS4gjiRgrEEGo7vEPoWoowvqKga2DQn+fNlZp7
 EXWFH7K6J+frnAh7glf7aBlZDACY5LzrROy+XXWUsucTfMmootN36pLckuqFawVvrYQoUeo2C
 0ifWFj2yj3ZdhMWBw8WlT+ZJeXFd7u4fFRCSbqFZtzbOr8+kRV58y0z8EpG6SSaabef4pisKq
 jSNi1h7MsBkLw+MtEWiZqZoN4bfRLMOCRMcvlMRAXcwRAN65/Ws2OTFfe7LNsT6sJxCgQyQd7
 IvZd4+7riD78Ej/RwBoJLlAmxw/pM9PHpiGmkV5k8KWHzb7B/WTcpKRWM6vjbH6A/PY/TpyLy
 lf8HlxPofZ4wiC1GeA3jvyWqD/CfIeeiM3FHigm03vNvNdiv8gyxd7OYp44/KQ9lKsyIg9zEa
 A2xBXQXhQpOXbyODhrCv2IY9svyE8ARxQWKpNWc93wVhIXKl95UAaDX3+JNHq1KkMs+e/j1HO
 5/kErXXsvy5IWtwnrggIKZxLZaW9IXuz6Zpg/akuz+3q4Aj3ZchrgSas7csUpZRh0Np8Oy2RY
 8GT6Dk8K5JmyHHz3WTIyXKOL52F7/KDcAq1/qUqW+7vUmKiUsq6B4QBwgYhslA+A2SFdSRSfm
 n/1DxetGKS6whIo1aq5Bl+REQzO+iI2IcWGC0sm1FigXIjQlPCrQ3rpm2dc5EBIF8Bi/T7KTY
 BZ7vjuKeSlZG3ETVjMo7QRMh/EIgnf2U3dBGuprSMjBC8v5x0aWvQ10Cug2W9M7wdi18Ja4R2
 BeziCpjRPoxvWp3i+URCsfoeRpmEQy8YaFy3pXfo+AknNb5i/Gzqxfk9oilqWWijPr2B/SGHw
 06FhwSNcmd4McQIttYsY2Fa/ir1uhhSar4kzJwNSspB7XOg8HQ==

Am 05.09.25 um 16:05 schrieb Werner Sembach:

> Hi,
>
> some more things i noticed, i didn't check the lightbar as i don't=20
> have a lightbar device at hand and I'm not sure if my devices support=20
> the battery threshold, but i commented on the rest
>
> Am 31.08.25 um 21:27 schrieb Armin Wolf:
>> Add a new driver for Uniwill laptops. The driver uses a ACPI
>> interface to talk with the embedded controller, but relies on a
>> ACPI WMI interface for receiving event notifications.
>>
>> The driver is reverse-engineered based on the following information:
>> - OEM software from intel
>> -https://github.com/pobrn/qc71_laptop
>> -https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>> -https://github.com/tuxedocomputers/tuxedo-control-center
>>
>> The underlying EC supports various features, including hwmon sensors,
>> battery charge limiting, a RGB lightbar and keyboard-related controls.
>>
>> Reported-by: cyear<chumuzero@gmail.com>
>> Closes:https://github.com/lm-sensors/lm-sensors/issues/508
>> Closes:https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>> Signed-off-by: Armin Wolf<W_Armin@gmx.de>
>> ---
>> =C2=A0 .../ABI/testing/sysfs-driver-uniwill-laptop=C2=A0=C2=A0 |=C2=A0=
=C2=A0 53 +
>> =C2=A0 Documentation/wmi/devices/uniwill-laptop.rst=C2=A0 |=C2=A0 198 +=
++
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 10 +
>> =C2=A0 drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 2 +
>> =C2=A0 drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 3 +
>> =C2=A0 drivers/platform/x86/uniwill/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 38 +
>> =C2=A0 drivers/platform/x86/uniwill/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c=C2=A0=C2=A0 | 1537 +=
++++++++++++++++
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 92 +
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 127 ++
>> =C2=A0 10 files changed, 2068 insertions(+)
>> =C2=A0 create mode 100644=20
>> Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> =C2=A0 create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/Kconfig
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/Makefile
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-acpi.c
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>> =C2=A0 create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop=20
>> b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..b8d55da113f8
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -0,0 +1,53 @@
>> +What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /sys/bus/platform/devi=
ces/INOU0000:XX/fn_lock
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 August 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.18
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allows userspace applicatio=
ns to enable/disable the FN lock=20
>> feature
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the integrated keyboard =
by writing "enable"/"disable"=20
>> into this file.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current enable status of the=20
>> FN lock functionality.
>> +
>> +What: /sys/bus/platform/devices/INOU0000:XX/super_key_lock
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 August 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.18
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Allows userspace applications to enable/disable the=
=20
>> super key functionality
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 of the integrated keyboard by writing=20
>> "enable"/"disable" into this file.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current enable status of the=20
>> super key functionality.
>> +
>> +What: /sys/bus/platform/devices/INOU0000:XX/touchpad_toggle
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 August 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.18
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allows userspace applicatio=
ns to enable/disable the touchpad=20
>> toggle functionality
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the integrated touchpad =
by writing "enable"/"disable"=20
>> into this file.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current enable status of the=20
>> touchpad toggle
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>> +
>> +What: /sys/bus/platform/devices/INOU0000:XX/rainbow_animation
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 August 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.18
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Forces the integrated light=
bar to display a rainbow=20
>> animation when the machine
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not suspended. Writing "=
enable"/"disable" into this file=20
>> enables/disables
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this functionality.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current status of the rainbow=20
>> animation functionality.
>> +
>> +What: /sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 August 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.18
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Causes the integrated light=
bar to display a breathing=20
>> animation when the machine
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has been suspended and is r=
unning on AC power. Writing=20
>> "enable"/"disable" into
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this file enables/disables =
this functionality.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current status of the=20
>> breathing animation
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>> diff --git a/Documentation/wmi/devices/uniwill-laptop.rst=20
>> b/Documentation/wmi/devices/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..e246bf293450
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/uniwill-laptop.rst
>> @@ -0,0 +1,198 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Uniwill Notebook driver (uniwill-laptop)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Many notebooks manufactured by Uniwill (either directly or as ODM)=20
>> provide a EC interface
>> +for controlling various platform settings like sensors and fan=20
>> control. This interface is
>> +used by the ``uniwill-laptop`` driver to map those features onto=20
>> standard kernel interfaces.
>> +
>> +EC WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +
>> +The EC WMI interface description can be decoded from the embedded=20
>> binary MOF (bmof)
>> +data using the `bmfdec<https://github.com/pali/bmfdec>`_ utility:
>> +
>> +::
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +=C2=A0=C2=A0 Description("Class used to operate methods on a ULong"),
>> +=C2=A0=C2=A0 guid("{ABBC0F6F-8EA1-11d1-00A0-C90629100000}")]
>> +=C2=A0 class AcpiTest_MULong {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(1), Implemented, read, write, Descript=
ion("Return=20
>> the contents of a ULong")]
>> +=C2=A0=C2=A0=C2=A0 void GetULong([out, Description("Ulong Data")] uint=
32 Data);
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(2), Implemented, read, write, Descript=
ion("Set the=20
>> contents of a ULong")]
>> +=C2=A0=C2=A0=C2=A0 void SetULong([in, Description("Ulong Data")] uint3=
2 Data);
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(3), Implemented, read, write,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 Description("Generate an event containing ULo=
ng data")]
>> +=C2=A0=C2=A0=C2=A0 void FireULong([in, Description("WMI requires a par=
ameter")]=20
>> uint32 Hack);
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(4), Implemented, read, write, Descript=
ion("Get and=20
>> Set the contents of a ULong")]
>> +=C2=A0=C2=A0=C2=A0 void GetSetULong([in, Description("Ulong Data")] ui=
nt64 Data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [out, Description("Ulo=
ng Data")] uint32 Return);
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(5), Implemented, read, write,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 Description("Get and Set the contents of a UL=
ong for Dollby=20
>> button")]
>> +=C2=A0=C2=A0=C2=A0 void GetButton([in, Description("Ulong Data")] uint=
64 Data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [out, Description("Ulong Data")] u=
int32 Return);
>> +=C2=A0 };
>> +
>> +Most of the WMI-related code was copied from the Windows driver=20
>> samples, which unfortunately means
>> +that the WMI-GUID is not unique. This makes the WMI-GUID unusable=20
>> for autoloading.
>> +
>> +WMI method GetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has=20
>> no function.
>> +
>> +WMI method SetULong()
>> +---------------------
>> +
>> +This WMI method was copied from the Windows driver samples and has=20
>> no function.
>> +
>> +WMI method FireULong()
>> +----------------------
>> +
>> +This WMI method allows to inject a WMI event with a 32-bit payload.=20
>> Its primary purpose seems
>> +to be debugging.
>> +
>> +WMI method GetSetULong()
>> +------------------------
>> +
>> +This WMI method is used to communicate with the EC. The ``Data``=20
>> argument holds the following
>> +information (starting with the least significant byte):
>> +
>> +1. 16-bit address
>> +2. 16-bit data (set to ``0x0000`` when reading)
>> +3. 16-bit operation (``0x0100`` for reading and ``0x0000`` for writing=
)
>> +4. 16-bit reserved (set to ``0x0000``)
>> +
>> +The first 8 bits of the ``Return`` value contain the data returned=20
>> by the EC when reading.
>> +The special value ``0xFEFEFEFE`` is used to indicate a communication=
=20
>> failure with the EC.
>> +
>> +WMI method GetButton()
>> +----------------------
>> +
>> +This WMI method is not implemented on all machines and has an=20
>> unknown purpose.
>> +
>> +Reverse-Engineering the EC WMI interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. warning:: Randomly poking the EC can potentially cause damage to=20
>> the machine and other unwanted
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 side effects, please be careful.
>> +
>> +The EC behind the ``GetSetULong`` method is used by the OEM software=
=20
>> supplied by the manufacturer.
>> +Reverse-engineering of this software is difficult since it uses an=20
>> obfuscator, however some parts
>> +are not obfuscated. In this case=20
>> `dnSpy<https://github.com/dnSpy/dnSpy>`_ could also be helpful.
>> +
>> +The EC can be accessed under Windows using powershell (requires=20
>> admin privileges):
>> +
>> +::
>> +
>> +=C2=A0 > $obj =3D Get-CimInstance -Namespace root/wmi -ClassName=20
>> AcpiTest_MULong | Select-Object -First 1
>> +=C2=A0 > Invoke-CimMethod -InputObject $obj -MethodName GetSetULong=20
>> -Arguments @{Data =3D <input>}
>> +
>> +WMI event interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The WMI interface description can also be decoded from the embedded=20
>> binary MOF (bmof)
>> +data:
>> +
>> +::
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
>> +=C2=A0=C2=A0 Description("Class containing event generated ULong data"=
),
>> +=C2=A0=C2=A0 guid("{ABBC0F72-8EA1-11d1-00A0-C90629100000}")]
>> +=C2=A0 class AcpiTest_EventULong : WmiEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, write, Description("ULong Data=
")] uint32=20
>> ULong;
>> +=C2=A0 };
>> +
>> +Most of the WMI-related code was again copied from the Windows=20
>> driver samples, causing this WMI
>> +interface to suffer from the same restrictions as the EC WMI=20
>> interface described above.
>> +
>> +WMI event data
>> +--------------
>> +
>> +The WMI event data contains a single 32-bit value which is used to=20
>> indicate various platform events.
>> +
>> +Reverse-Engineering the Uniwill WMI event interface
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> +
>> +The driver logs debug messages when receiving a WMI event. Thus=20
>> enabling debug messages will be
>> +useful for finding unknown event codes.
>> +
>> +EC ACPI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +The ``INOU0000`` ACPI device is a virtual device used to access=20
>> various hardware registers
>> +available on notebooks manufactured by Uniwill. Reading and writing=20
>> those registers happens
>> +by calling ACPI control methods. The ``uniwill-laptop`` driver uses=20
>> this device to communicate
>> +with the EC because the ACPI control methods are faster than the WMI=
=20
>> methods described above.
>> +
>> +ACPI control methods used for reading registers take a single ACPI=20
>> integer containing the address
>> +of the register to read and return a ACPI integer containing the=20
>> data inside said register. ACPI
>> +control methods used for writing registers however take two ACPI=20
>> integers, with the additional
>> +ACPI integer containing the data to be written into the register.=20
>> Such ACPI control methods return
>> +nothing.
>> +
>> +System memory
>> +-------------
>> +
>> +System memory can be accessed with a granularity of either a single=20
>> byte (``MMRB`` for reading and
>> +``MMWB`` for writing) or four bytes (``MMRD`` for reading and=20
>> ``MMWD`` for writing). Those ACPI
>> +control methods are unused because they provide no benefit when=20
>> compared to the native memory
>> +access functions provided by the kernel.
>> +
>> +EC RAM
>> +------
>> +
>> +The internal RAM of the EC can be accessed with a granularity of a=20
>> single byte using the ``ECRR``
>> +(read) and ``ECRW`` (write) ACPI control methods, with the maximum=20
>> register address being ``0xFFF``.
>> +The OEM software waits 6 ms after calling one of those ACPI control=20
>> methods, likely to avoid
>> +overwhelming the EC when being connected over LPC.
>> +
>> +PCI config space
>> +----------------
>> +
>> +The PCI config space can be accessed with a granularity of four=20
>> bytes using the ``PCRD`` (read) and
>> +``PCWD`` (write) ACPI control methods. The exact address format is=20
>> unknown, and poking random PCI
>> +devices might confuse the PCI subsystem. Because of this those ACPI=20
>> control methods are not used.
>> +
>> +IO ports
>> +--------
>> +
>> +IO ports can be accessed with a granularity of four bytes using the=20
>> ``IORD`` (read) and ``IOWD``
>> +(write) ACPI control methods. Those ACPI control methods are unused=20
>> because they provide no benefit
>> +when compared to the native IO port access functions provided by the=
=20
>> kernel.
>> +
>> +CMOS RAM
>> +--------
>> +
>> +The CMOS RAM can be accessed with a granularity of a single byte=20
>> using the ``RCMS`` (read) and
>> +``WCMS`` ACPI control methods. Using those ACPI methods might=20
>> interfere with the native CMOS RAM
>> +access functions provided by the kernel due to the usage of indexed=20
>> IO, so they are unused.
>> +
>> +Indexed IO
>> +----------
>> +
>> +Indexed IO with IO ports with a granularity of a single byte can be=20
>> performed using the ``RIOP``
>> +(read) and ``WIOP`` (write) ACPI control methods. Those ACPI methods=
=20
>> are unused because they
>> +provide no benifit when compared to the native IO port access=20
>> functions provided by the kernel.
>> +
>> +Special thanks go to github user `pobrn` which developed the
>> +`qc71_laptop<https://github.com/pobrn/qc71_laptop>`_ driver on which=
=20
>> this driver is partly based.
>> +The same is true for Tuxedo Computers, which developed the
>> +`tuxedo-drivers<https://gitlab.com/tuxedocomputers/development/package=
s/tuxedo-drivers>`_=20
>> package
>> +which also served as a foundation for this driver.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe168477caa4..99624393f271 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25903,6 +25903,16 @@ L:=C2=A0=C2=A0=C2=A0 linux-scsi@vger.kernel.or=
g
>> =C2=A0 S:=C2=A0=C2=A0=C2=A0 Maintained
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/ufs/host/ufs-renesas.c
>> =C2=A0 +UNIWILL LAPTOP DRIVER
>> +M:=C2=A0=C2=A0=C2=A0 Armin Wolf<W_Armin@gmx.de>
>> +L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>> +S:=C2=A0=C2=A0=C2=A0 Maintained
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/ABI/testing/sysfs-driver-uniwill-la=
ptop
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/uniwill-laptop.rst
>> +F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c
>> +F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.c
>> +F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/uniwill/uniwill-wmi.h
>> +
>> =C2=A0 UNSORTED BLOCK IMAGES (UBI)
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Richard Weinberger<richard@nod.at>
>> =C2=A0 R:=C2=A0=C2=A0=C2=A0 Zhihao Cheng<chengzhihao1@huawei.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index 6d238e120dce..a4c2ea69970d 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -74,6 +74,8 @@ config HUAWEI_WMI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a =
module, choose M here: the module
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be called huawei-wmi.
>> =C2=A0 +source "drivers/platform/x86/uniwill/Kconfig"
>> +
>> =C2=A0 config UV_SYSFS
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Sysfs structure for UV systems=
"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on X86_UV
>> diff --git a/drivers/platform/x86/Makefile=20
>> b/drivers/platform/x86/Makefile
>> index a0c5848513e3..a6271588e05a 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -109,6 +109,9 @@ obj-$(CONFIG_TOSHIBA_WMI)=C2=A0=C2=A0=C2=A0 +=3D to=
shiba-wmi.o
>> =C2=A0 # before toshiba_acpi initializes
>> =C2=A0 obj-$(CONFIG_ACPI_TOSHIBA)=C2=A0=C2=A0=C2=A0 +=3D toshiba_acpi.o
>> =C2=A0 +# Uniwill
>> +obj-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D uniwill/
>> +
>> =C2=A0 # Inspur
>> =C2=A0 obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)=C2=A0=C2=A0=C2=A0 +=3D ins=
pur_platform_profile.o
>> =C2=A0 diff --git a/drivers/platform/x86/uniwill/Kconfig=20
>> b/drivers/platform/x86/uniwill/Kconfig
>> new file mode 100644
>> index 000000000000..d07cc8440188
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
>> +=C2=A0=C2=A0=C2=A0 bool "Uniwill X86 Platform Specific Device Drivers"
>> +=C2=A0=C2=A0=C2=A0 depends on X86_PLATFORM_DEVICES
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say Y here to see options for device dr=
ivers for various
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Uniwill x86 platforms, including many O=
EM laptops originally
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 manufactured by Uniwill.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This option alone does not add any kern=
el code.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you say N, all options in this subme=
nu will be skipped and=20
>> disabled.
>> +
>> +if X86_PLATFORM_DRIVERS_UNIWILL
>> +
>> +config UNIWILL_LAPTOP
>> +=C2=A0=C2=A0=C2=A0 tristate "Uniwill Laptop Extras"
>> +=C2=A0=C2=A0=C2=A0 default m
>> +=C2=A0=C2=A0=C2=A0 depends on ACPI
>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_WMI
>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_BATTERY
>> +=C2=A0=C2=A0=C2=A0 depends on HWMON
>> +=C2=A0=C2=A0=C2=A0 depends on INPUT
>> +=C2=A0=C2=A0=C2=A0 depends on LEDS_CLASS_MULTICOLOR
>> +=C2=A0=C2=A0=C2=A0 depends on DMI
>> +=C2=A0=C2=A0=C2=A0 select REGMAP
>> +=C2=A0=C2=A0=C2=A0 select INPUT_SPARSEKMAP
>> +=C2=A0=C2=A0=C2=A0 help
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This driver adds support for various ex=
tra features found on=20
>> Uniwill laptops,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 like the lightbar, hwmon sensors and ho=
tkeys. It also supports=20
>> many OEM laptops
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 originally manufactured by Uniwill.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you have such a laptop, say Y or M h=
ere.
>> +
>> +endif
>> diff --git a/drivers/platform/x86/uniwill/Makefile=20
>> b/drivers/platform/x86/uniwill/Makefile
>> new file mode 100644
>> index 000000000000..05cd1747a240
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/Makefile
>> @@ -0,0 +1,8 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# Makefile for linux/drivers/platform/x86/uniwill
>> +# Uniwill X86 Platform Specific Drivers
>> +#
>> +
>> +obj-$(CONFIG_UNIWILL_LAPTOP)=C2=A0=C2=A0=C2=A0 +=3D uniwill-laptop.o
>> +uniwill-laptop-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D uniwil=
l-acpi.o uniwill-wmi.o
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> new file mode 100644
>> index 000000000000..3467677cc99f
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -0,0 +1,1537 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux driver for Uniwill notebooks.
>> + *
>> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg=
 and=20
>> Werner Sembach
>> + * for supporting the development of this driver either through=20
>> prior work or
>> + * by answering questions regarding the underlying ACPI and WMI=20
>> interfaces.
>> + *
>> + * Copyright (C) 2025 Armin Wolf<W_Armin@gmx.de>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/device/driver.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/fixp-arith.h>
>> +#include <linux/hwmon.h>
>> +#include <linux/hwmon-sysfs.h>
>> +#include <linux/init.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kstrtox.h>
>> +#include <linux/leds.h>
>> +#include <linux/led-class-multicolor.h>
>> +#include <linux/limits.h>
>> +#include <linux/list.h>
>> +#include <linux/minmax.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/notifier.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm.h>
>> +#include <linux/printk.h>
>> +#include <linux/regmap.h>
>> +#include <linux/string.h>
>> +#include <linux/string_choices.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/types.h>
>> +#include <linux/units.h>
>> +
>> +#include <acpi/battery.h>
>> +
>> +#include "uniwill-wmi.h"
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_1=C2=A0=C2=A0=C2=A0 0x0400
>> +
>> +#define EC_ADDR_BAT_POWER_UNIT_2=C2=A0=C2=A0=C2=A0 0x0401
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_1=C2=A0=C2=A0=C2=A0 0x0402
>> +
>> +#define EC_ADDR_BAT_DESIGN_CAPACITY_2=C2=A0=C2=A0=C2=A0 0x0403
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_1=C2=A0=C2=A0=C2=A0 0x0404
>> +
>> +#define EC_ADDR_BAT_FULL_CAPACITY_2=C2=A0=C2=A0=C2=A0 0x0405
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_1=C2=A0=C2=A0=C2=A0 0x0408
>> +
>> +#define EC_ADDR_BAT_DESIGN_VOLTAGE_2=C2=A0=C2=A0=C2=A0 0x0409
>> +
>> +#define EC_ADDR_BAT_STATUS_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x0432
>> +#define BAT_DISCHARGING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +
>> +#define EC_ADDR_BAT_STATUS_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x0433
>> +
>> +#define EC_ADDR_BAT_CURRENT_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0434
>> +
>> +#define EC_ADDR_BAT_CURRENT_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0435
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_1=C2=A0=C2=A0=C2=A0 0x0436
>> +
>> +#define EC_ADDR_BAT_REMAIN_CAPACITY_2=C2=A0=C2=A0=C2=A0 0x0437
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0438
>> +
>> +#define EC_ADDR_BAT_VOLTAGE_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0439
>> +
>> +#define EC_ADDR_CPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
43E
>> +
>> +#define EC_ADDR_GPU_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
44F
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0464
>> +
>> +#define EC_ADDR_MAIN_FAN_RPM_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0465
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_1=C2=A0=C2=A0=C2=A0 0x046C
>> +
>> +#define EC_ADDR_SECOND_FAN_RPM_2=C2=A0=C2=A0=C2=A0 0x046D
>> +
>> +#define EC_ADDR_DEVICE_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x047B
>> +#define WIFI_STATUS_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(7)
>> +/* BIT(5) is also unset depending on the rfkill state (bluetooth?) */
>> +
>> +#define EC_ADDR_BAT_ALERT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
0494
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_1=C2=A0=C2=A0=C2=A0 0x04A6
>> +
>> +#define EC_ADDR_BAT_CYCLE_COUNT_2=C2=A0=C2=A0=C2=A0 0x04A7
>> +
>> +#define EC_ADDR_PROJECT_ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x0740
>> +
>> +#define EC_ADDR_AP_OEM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x0741
>> +#define=C2=A0=C2=A0=C2=A0 ENABLE_MANUAL_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define ITE_KBD_EFFECT_REACTIVE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(3)
>> +#define FAN_ABNORMAL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(5)
>> +
>> +#define EC_ADDR_SUPPORT_5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
0742
>> +#define FAN_TURBO_SUPPORTED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(4)
>> +#define FAN_SUPPORT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(5)
>> +
>> +#define EC_ADDR_CTGP_DB_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 0x0743
>> +#define CTGP_DB_GENERAL_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(0)
>> +#define CTGP_DB_DB_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(1)
>> +#define CTGP_DB_CTGP_ENABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(2)
>> +
>> +#define EC_ADDR_CTGP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0744
>> +
>> +#define EC_ADDR_TPP_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x0745
>> +
>> +#define EC_ADDR_MAX_TGP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x0746
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_CTRL=C2=A0=C2=A0=C2=A0 0x0748
>> +#define LIGHTBAR_APP_EXISTS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(0)
>> +#define LIGHTBAR_POWER_SAVE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(1)
>> +#define LIGHTBAR_S0_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define LIGHTBAR_S3_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(3)=C2=A0=C2=A0=C2=A0 // Breathing animation=20
>> when suspended
>> +#define LIGHTBAR_WELCOME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(7)=C2=A0=C2=A0=C2=A0 // Rainbow animation
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_RED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0749
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_GREEN=C2=A0=C2=A0=C2=A0 0x074A
>> +
>> +#define EC_ADDR_LIGHTBAR_AC_BLUE=C2=A0=C2=A0=C2=A0 0x074B
>> +
>> +#define EC_ADDR_BIOS_OEM=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
74E
>> +#define FN_LOCK_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +
>> +#define EC_ADDR_MANUAL_FAN_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0751
>> +#define FAN_LEVEL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 GENMASK(2, 0)
>> +#define FAN_MODE_TURBO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +#define FAN_MODE_HIGH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define FAN_MODE_BOOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(6)
>> +#define FAN_MODE_USER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(7)
>> +
>> +#define EC_ADDR_PWM_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x075B
>> +
>> +#define EC_ADDR_PWM_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x075C
>> +
>> +/* Unreliable */
>> +#define EC_ADDR_SUPPORT_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
0765
>> +#define AIRPLANE_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define GPS_SWITCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(1)
>> +#define OVERCLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
>> +#define MACRO_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(3)
>> +#define SHORTCUT_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +#define SUPER_KEY_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(6)
>> +#define FAN_BOOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(7)
>> +
>> +#define EC_ADDR_SUPPORT_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
0766
>> +#define SILENT_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(0)
>> +#define USB_CHARGING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define RGB_KEYBOARD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define CHINA_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(5)
>> +#define MY_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(6)
>> +
>> +#define EC_ADDR_TRIGGER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x0767
>> +#define TRIGGER_SUPER_KEY_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(0)
>> +#define TRIGGER_LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(1)
>> +#define TRIGGER_FAN_BOOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BI=
T(2)
>> +#define TRIGGER_SILENT_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(3)
>> +#define TRIGGER_USB_CHARGING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 BIT(4)
>> +#define RGB_APPLY_COLOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(5)
>> +#define RGB_LOGO_EFFECT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(6)
>> +#define RGB_RAINBOW_EFFECT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(7)
>> +
>> +#define EC_ADDR_SWITCH_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x0768
>> +#define SUPER_KEY_LOCK_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(0)
>> +#define LIGHTBAR_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define FAN_BOOST_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(2)
>> +#define MACRO_KEY_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(3)
>> +#define MY_BAT_POWER_BAT_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(4)
>> +
>> +#define EC_ADDR_RGB_RED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x0769
>> +
>> +#define EC_ADDR_RGB_GREEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
076A
>> +
>> +#define EC_ADDR_RGB_BLUE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
76B
>> +
>> +#define EC_ADDR_ROMID_START=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0770
>> +#define ROMID_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 14
>> +
>> +#define EC_ADDR_ROMID_EXTRA_1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x077E
>> +
>> +#define EC_ADDR_ROMID_EXTRA_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x077F
>> +
>> +#define EC_ADDR_BIOS_OEM_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x0782
>> +#define FAN_V2_NEW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(0)
>> +#define FAN_QKEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>> +#define FAN_TABLE_OFFICE_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(2)
>> +#define FAN_V3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)
>> +#define DEFAULT_MODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(4)
>> +
>> +#define EC_ADDR_PL1_SETTING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0783
>> +
>> +#define EC_ADDR_PL2_SETTING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0784
>> +
>> +#define EC_ADDR_PL4_SETTING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0785
>> +
>> +#define EC_ADDR_FAN_DEFAULT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x0786
>> +#define FAN_CURVE_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5
>> +
>> +#define EC_ADDR_KBD_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x078C
>> +#define KBD_WHITE_ONLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)=C2=A0=C2=A0=C2=A0 // ~single color
>> +#define KBD_SINGLE_COLOR_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 BIT(1)
>> +#define KBD_TURBO_LEVEL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 GENMASK(3, 2)
>> +#define KBD_APPLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(4)
>> +#define KBD_BRIGHTNESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 GENMASK(7, 5)
>> +
>> +#define EC_ADDR_FAN_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
78E
>> +#define FAN3P5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define CHARGING_PROFILE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT=
(3)
>> +#define UNIVERSAL_FAN_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 B=
IT(6)
>> +
>> +#define EC_ADDR_BIOS_OEM_3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x07A3
>> +#define FAN_REDUCED_DURY_CYCLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(5)
>> +#define FAN_ALWAYS_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(6)
>> +
>> +#define EC_ADDR_BIOS_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
07A4
>> +#define FN_LOCK_SWITCH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(3)
>> +
>> +#define EC_ADDR_OEM_3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x07A5
>> +#define POWER_LED_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 GENMASK(1, 0)
>> +#define POWER_LED_LEFT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x00
>> +#define POWER_LED_BOTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x01
>> +#define POWER_LED_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x02
>> +#define FAN_QUIET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(2)
>> +#define OVERBOOST=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(4)
>> +#define HIGH_POWER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(7)
>> +
>> +#define EC_ADDR_OEM_4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x07A6
>> +#define OVERBOOST_DYN_TEMP_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(1)
>> +#define TOUCHPAD_TOGGLE_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(6)
>> +
>> +#define EC_ADDR_CHARGE_CTRL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x07B9
>> +#define CHARGE_CTRL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEN=
MASK(6, 0)
>> +#define CHARGE_CTRL_REACHED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
BIT(7)
>> +
>> +#define EC_ADDR_UNIVERSAL_FAN_CTRL=C2=A0=C2=A0=C2=A0 0x07C5
>> +#define SPLIT_TABLES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(7)
>> +
>> +#define EC_ADDR_AP_OEM_6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0=
7C6
>> +#define ENABLE_UNIVERSAL_FAN_CTRL=C2=A0=C2=A0=C2=A0 BIT(2)
>> +#define BATTERY_CHARGE_FULL_OVER_24H=C2=A0=C2=A0=C2=A0 BIT(3)
>> +#define BATTERY_ERM_STATUS_REACHED=C2=A0=C2=A0=C2=A0 BIT(4)
>> +
>> +#define EC_ADDR_CHARGE_PRIO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0x07CC
>> +#define CHARGING_PERFORMANCE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 BIT(7)
>> +
>> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>> +#define EC_ADDR_LIGHTBAR_BAT_CTRL=C2=A0=C2=A0=C2=A0 0x07E2
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_RED=C2=A0=C2=A0=C2=A0 0x07E3
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_GREEN=C2=A0=C2=A0=C2=A0 0x07E4
>> +
>> +#define EC_ADDR_LIGHTBAR_BAT_BLUE=C2=A0=C2=A0=C2=A0 0x07E5
>> +
>> +#define EC_ADDR_CPU_TEMP_END_TABLE=C2=A0=C2=A0=C2=A0 0x0F00
>> +
>> +#define EC_ADDR_CPU_TEMP_START_TABLE=C2=A0=C2=A0=C2=A0 0x0F10
>> +
>> +#define EC_ADDR_CPU_FAN_SPEED_TABLE=C2=A0=C2=A0=C2=A0 0x0F20
>> +
>> +#define EC_ADDR_GPU_TEMP_END_TABLE=C2=A0=C2=A0=C2=A0 0x0F30
>> +
>> +#define EC_ADDR_GPU_TEMP_START_TABLE=C2=A0=C2=A0=C2=A0 0x0F40
>> +
>> +#define EC_ADDR_GPU_FAN_SPEED_TABLE=C2=A0=C2=A0=C2=A0 0x0F50
>> +
>> +/*
>> + * Those two registers technically allow for manual fan control,
>> + * but are unstable on some models and are likely not meant to
>> + * be used by applications as they are only accessible when using
>> + * the WMI interface.
>> + */
>> +#define EC_ADDR_PWM_1_WRITEABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x1804
>> +
>> +#define EC_ADDR_PWM_2_WRITEABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x1809
>> +
>> +#define DRIVER_NAME=C2=A0=C2=A0=C2=A0 "uniwill"
>> +
>> +/*
>> + * The OEM software always sleeps up to 6 ms after reading/writing EC
>> + * registers, so we emulate this behaviour for maximum compatibility.
>> + */
>> +#define UNIWILL_EC_DELAY_US=C2=A0=C2=A0=C2=A0 6000
>> +
>> +#define PWM_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 200
>> +#define FAN_TABLE_LENGTH=C2=A0=C2=A0=C2=A0 16
>> +
>> +#define LED_CHANNELS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3
>> +#define LED_MAX_BRIGHTNESS=C2=A0=C2=A0=C2=A0 200
>> +
>> +#define UNIWILL_FEATURE_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(0)
>> +#define UNIWILL_FEATURE_SUPER_KEY_LOCK=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define UNIWILL_FEATURE_TOUCHPAD_TOGGLE BIT(2)
>> +#define UNIWILL_FEATURE_LIGHTBAR=C2=A0=C2=A0=C2=A0 BIT(3)
>> +#define UNIWILL_FEATURE_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(4)
>> +#define UNIWILL_FEATURE_HWMON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(5)
>> +
>> +struct uniwill_data {
>> +=C2=A0=C2=A0=C2=A0 struct device *dev;
>> +=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>> +=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>> +=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>> +=C2=A0=C2=A0=C2=A0 unsigned int last_charge_ctrl;
>> +=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=C2=A0 /* Pro=
tects the list of currently=20
>> registered batteries */
>> +=C2=A0=C2=A0=C2=A0 unsigned int last_switch_status;
>> +=C2=A0=C2=A0=C2=A0 struct mutex super_key_lock;=C2=A0=C2=A0=C2=A0 /* P=
rotects the toggling of the=20
>> super key lock state */
>> +=C2=A0=C2=A0=C2=A0 struct list_head batteries;
>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc led_mc_cdev;
>> +=C2=A0=C2=A0=C2=A0 struct mc_subled led_mc_subled_info[LED_CHANNELS];
>> +=C2=A0=C2=A0=C2=A0 struct mutex input_lock;=C2=A0=C2=A0=C2=A0 /* Prote=
cts input sequence during=20
>> notify */
>> +=C2=A0=C2=A0=C2=A0 struct input_dev *input_device;
>> +=C2=A0=C2=A0=C2=A0 struct notifier_block nb;
>> +};
>> +
>> +struct uniwill_battery_entry {
>> +=C2=A0=C2=A0=C2=A0 struct list_head head;
>> +=C2=A0=C2=A0=C2=A0 struct power_supply *battery;
>> +};
>> +
>> +static bool force;
>> +module_param_unsafe(force, bool, 0);
>> +MODULE_PARM_DESC(force, "Force loading without checking for=20
>> supported devices\n");
>> +
>> +/* Feature bitmask since the associated registers are not reliable */
>> +static unsigned int supported_features;
>> +
>> +/*
>> + * "disable" is placed on index 0 so that the return value of=20
>> sysfs_match_string()
>> + * directly translates into a boolean value.
>> + */
>> +static const char * const uniwill_enable_disable_strings[] =3D {
>> +=C2=A0=C2=A0=C2=A0 [0] =3D "disable",
>> +=C2=A0=C2=A0=C2=A0 [1] =3D "enable",
>> +};
>> +
>> +static const char * const uniwill_temp_labels[] =3D {
>> +=C2=A0=C2=A0=C2=A0 "CPU",
>> +=C2=A0=C2=A0=C2=A0 "GPU",
>> +};
>> +
>> +static const char * const uniwill_fan_labels[] =3D {
>> +=C2=A0=C2=A0=C2=A0 "Main",
>> +=C2=A0=C2=A0=C2=A0 "Secondary",
>> +};
>> +
>> +static const struct key_entry uniwill_keymap[] =3D {
>> +=C2=A0=C2=A0=C2=A0 /* Reported via keyboard controller */
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_CAPSLOCK=
,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_CAPSLOCK }},
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_NUMLOCK,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_NUMLOCK }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unlocks the super k=
ey */
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_SUPER_KE=
Y_LOCK_ENABLE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_SUPER_KE=
Y_LOCK_DISABLE,=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported in manual mode when toggling the airpla=
ne mode=20
>> status */
>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWI=
LL_OSD_RFKILL,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_RFKILL }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when user wants to cycle the platform p=
rofile */
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_PERFORMA=
NCE_MODE_TOGGLE,=C2=A0=C2=A0=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to adjust the brigh=
tness of the=20
>> keyboard */
>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWI=
LL_OSD_KBDILLUMDOWN,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_KBDILLUMDOWN }},
>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWI=
LL_OSD_KBDILLUMUP,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_KBDILLUMUP }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the micro=
phone mute=20
>> status */
>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWI=
LL_OSD_MIC_MUTE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_MICMUTE }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user locks/unlocks the Fn key =
*/
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_FN_LOCK,=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_FN_ESC }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the brigh=
tness of the=20
>> keyboard */
>> +=C2=A0=C2=A0=C2=A0 { KE_KEY,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWI=
LL_OSD_KBDILLUMTOGGLE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_KBDILLUMTOGGLE }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* FIXME: find out the exact meaning of those event=
s */
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BAT_CHAR=
GE_FULL_24_H,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BAT_ERM_=
UPDATE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Reported when the user wants to toggle the bench=
mark mode=20
>> status */
>> +=C2=A0=C2=A0=C2=A0 { KE_IGNORE,=C2=A0=C2=A0=C2=A0 UNIWILL_OSD_BENCHMAR=
K_MODE_TOGGLE,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {=20
>> KEY_UNKNOWN }},
>> +
>> +=C2=A0=C2=A0=C2=A0 { KE_END }
>> +};
>> +
>> +static int uniwill_ec_reg_write(void *context, unsigned int reg,=20
>> unsigned int val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 union acpi_object params[2] =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .in=
teger =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .type =3D ACPI_TYPE_INTEGER,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .value =3D reg,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .in=
teger =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .type =3D ACPI_TYPE_INTEGER,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .value =3D val,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D context;
>> +=C2=A0=C2=A0=C2=A0 struct acpi_object_list input =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .count =3D ARRAY_SIZE(param=
s),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D params,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 acpi_status status;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D acpi_evaluate_object(data->handle, "ECRW=
", &input, NULL);
>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> +
>> +=C2=A0=C2=A0=C2=A0 usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_=
US * 2);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int uniwill_ec_reg_read(void *context, unsigned int reg,=20
>> unsigned int *val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 union acpi_object params[1] =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .in=
teger =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .type =3D ACPI_TYPE_INTEGER,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .value =3D reg,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D context;
>> +=C2=A0=C2=A0=C2=A0 struct acpi_object_list input =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .count =3D ARRAY_SIZE(param=
s),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D params,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 unsigned long long output;
>> +=C2=A0=C2=A0=C2=A0 acpi_status status;
>> +
>> +=C2=A0=C2=A0=C2=A0 status =3D acpi_evaluate_integer(data->handle, "ECR=
R", &input,=20
>> &output);
>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (output > U8_MAX)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENXIO;
>> +
>> +=C2=A0=C2=A0=C2=A0 usleep_range(UNIWILL_EC_DELAY_US, UNIWILL_EC_DELAY_=
US * 2);
>> +
>> +=C2=A0=C2=A0=C2=A0 *val =3D output;
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static const struct regmap_bus uniwill_ec_bus =3D {
>> +=C2=A0=C2=A0=C2=A0 .reg_write =3D uniwill_ec_reg_write,
>> +=C2=A0=C2=A0=C2=A0 .reg_read =3D uniwill_ec_reg_read,
>> +=C2=A0=C2=A0=C2=A0 .reg_format_endian_default =3D REGMAP_ENDIAN_LITTLE=
,
>> +=C2=A0=C2=A0=C2=A0 .val_format_endian_default =3D REGMAP_ENDIAN_LITTLE=
,
>> +};
>> +
>> +static bool uniwill_writeable_reg(struct device *dev, unsigned int reg=
)
>> +{
>> +=C2=A0=C2=A0=C2=A0 switch (reg) {
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_AP_OEM:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_RED:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_OEM_4:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_RED:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>> +{
>> +=C2=A0=C2=A0=C2=A0 switch (reg) {
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CPU_TEMP:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_GPU_TEMP:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_MAIN_FAN_RPM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_MAIN_FAN_RPM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SECOND_FAN_RPM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SECOND_FAN_RPM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BAT_ALERT:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_PROJECT_ID:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_AP_OEM:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_RED:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_GREEN:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_AC_BLUE:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BIOS_OEM:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_OEM_4:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_CTRL:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_RED:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_GREEN:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_LIGHTBAR_BAT_BLUE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>> +{
>> +=C2=A0=C2=A0=C2=A0 switch (reg) {
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CPU_TEMP:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_GPU_TEMP:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_MAIN_FAN_RPM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_MAIN_FAN_RPM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SECOND_FAN_RPM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SECOND_FAN_RPM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_BAT_ALERT:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_1:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_PWM_2:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static const struct regmap_config uniwill_ec_config =3D {
>> +=C2=A0=C2=A0=C2=A0 .reg_bits =3D 16,
>> +=C2=A0=C2=A0=C2=A0 .val_bits =3D 8,
>> +=C2=A0=C2=A0=C2=A0 .writeable_reg =3D uniwill_writeable_reg,
>> +=C2=A0=C2=A0=C2=A0 .readable_reg =3D uniwill_readable_reg,
>> +=C2=A0=C2=A0=C2=A0 .volatile_reg =3D uniwill_volatile_reg,
>> +=C2=A0=C2=A0=C2=A0 .can_sleep =3D true,
>> +=C2=A0=C2=A0=C2=A0 .max_register =3D 0xFFF,
>> +=C2=A0=C2=A0=C2=A0 .cache_type =3D REGCACHE_MAPLE,
>> +=C2=A0=C2=A0=C2=A0 .use_single_read =3D true,
>> +=C2=A0=C2=A0=C2=A0 .use_single_write =3D true,
>> +};
>> +
>> +static ssize_t fn_lock_store(struct device *dev, struct=20
>> device_attribute *attr, const char *buf,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(uniwill_enable_disable_s=
trings, buf);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D FN_LOCK_STATUS;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_BI=
OS_OEM,=20
>> FN_LOCK_STATUS, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t fn_lock_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_OEM,=
 &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disable(v=
alue &=20
>> FN_LOCK_STATUS));
>> +}
>> +
>> +static DEVICE_ATTR_RW(fn_lock);
>
> The fn_lock register value does not automatically get updated by=20
> pressing the fn+esc key (unlicke the super_key_lock), so the driver=20
> needs to do that manually.
>
> Another posibility is: uniwill sometimes have a "config" and an=20
> "immediate" value for a setting, waybe we have the config value here=20
> (and have the immediate value for the super_key_lock)
>
> Also I realized: The value here is preserved on hot, but not on cold=20
> reboots, maybe this should be initialized by the driver for consistency?
>
fn_lock should not change when the users presses Fn + ESC, instead this se=
tting controls whether the EC will enter Fn lock mode when the user presse=
s
this key combination. Additionally, some models seem to allow users to cha=
nge those settings inside the BIOS itself, so i am against overwriting the
boot configuration when loading the driver.

>> +static ssize_t super_key_lock_store(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t coun=
t)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int state, ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 state =3D sysfs_match_string(uniwill_enable_disable=
_strings, buf);
>> +=C2=A0=C2=A0=C2=A0 if (state < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return state;
>> +
>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->super_key_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_ST=
ATUS, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We can only toggle the super key lock, so w=
e return early if=20
>> the setting
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * is already in the correct state.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (state =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRI=
GGER,=20
>> TRIGGER_SUPER_KEY_LOCK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t super_key_lock_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_ST=
ATUS, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disable(!=
(value &=20
>> SUPER_KEY_LOCK_STATUS)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(super_key_lock);
>
> I did not know what "super_key_lock" was supposed to mean at first, a=20
> more fitting name would be super_key_enable imho.
>
> Cold vs hot reboot volatility not tested, but wouldn't hurt to=20
> initialize imho as i don't trust uniwill to be consistent in this=20
> point across multiple device generations.
>
This sysfs attribute controls whether or not the super key can be locked u=
sing a key combination i forgot about. Initializing those settings
is something best done by userspace, i suggest to use a udev rule for that=
.

>> +
>> +static ssize_t touchpad_toggle_store(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_=
t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(uniwill_enable_disable_s=
trings, buf);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D TOUCHPAD_TOGGLE_O=
FF;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_OE=
M_4,=20
>> TOUCHPAD_TOGGLE_OFF, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t touchpad_toggle_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &v=
alue);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disable(!=
(value &=20
>> TOUCHPAD_TOGGLE_OFF)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(touchpad_toggle);
> What exactly does this do? Seems like a noop on my testing devices.=20
> Also is touchpad disable not already handled by userspace?

This settings controls whether or not the user can disable the internal to=
uchpad using a specific key combination.

>> +
>> +static ssize_t rainbow_animation_store(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char=
 *buf, size_t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(uniwill_enable_disable_s=
trings, buf);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D LIGHTBAR_WELCOME;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_LI=
GHTBAR_AC_CTRL,=20
>> LIGHTBAR_WELCOME, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap,=20
>> EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_WELCOME, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t rainbow_animation_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_=
AC_CTRL, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disable(v=
alue &=20
>> LIGHTBAR_WELCOME));
>> +}
>> +
>> +static DEVICE_ATTR_RW(rainbow_animation);
>> +
>> +static ssize_t breathing_in_suspend_store(struct device *dev, struct=
=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf,=
 size_t count)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(uniwill_enable_disable_s=
trings, buf);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D LIGHTBAR_S3_OFF;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_LI=
GHTBAR_AC_CTRL,=20
>> LIGHTBAR_S3_OFF, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return count;
>> +}
>> +
>> +static ssize_t breathing_in_suspend_show(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *buf)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_=
AC_CTRL, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disable(!=
(value &=20
>> LIGHTBAR_S3_OFF)));
>> +}
>> +
>> +static DEVICE_ATTR_RW(breathing_in_suspend);
>> +
>> +static struct attribute *uniwill_attrs[] =3D {
>> +=C2=A0=C2=A0=C2=A0 /* Keyboard-related */
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock.attr,
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_super_key_lock.attr,
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_touchpad_toggle.attr,
>> +=C2=A0=C2=A0=C2=A0 /* Lightbar-related */
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_rainbow_animation.attr,
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_breathing_in_suspend.attr,
>> +=C2=A0=C2=A0=C2=A0 NULL
>> +};
>> +
>> +static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct=20
>> attribute *attr, int n)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_fn_lock.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (supported_features & UN=
IWILL_FEATURE_FN_LOCK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn attr->mode;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_super_key_lock.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (supported_features & UN=
IWILL_FEATURE_SUPER_KEY_LOCK)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn attr->mode;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_touchpad_toggle.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (supported_features & UN=
IWILL_FEATURE_TOUCHPAD_TOGGLE)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn attr->mode;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 attr =3D=3D &dev_attr_breat=
hing_in_suspend.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (supported_features & UN=
IWILL_FEATURE_LIGHTBAR)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn attr->mode;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static const struct attribute_group uniwill_group =3D {
>> +=C2=A0=C2=A0=C2=A0 .is_visible =3D uniwill_attr_is_visible,
>> +=C2=A0=C2=A0=C2=A0 .attrs =3D uniwill_attrs,
>> +};
>> +
>> +static const struct attribute_group *uniwill_groups[] =3D {
>> +=C2=A0=C2=A0=C2=A0 &uniwill_group,
>> +=C2=A0=C2=A0=C2=A0 NULL
>> +};
>> +
>> +static int uniwill_read(struct device *dev, enum hwmon_sensor_types=20
>> type, u32 attr, int channel,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lon=
g *val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 __be16 rpm;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (type) {
>> +=C2=A0=C2=A0=C2=A0 case hwmon_temp:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (channel) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_read(data->regmap, EC_ADDR_CPU_TEMP, &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_read(data->regmap, EC_ADDR_GPU_TEMP, &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EOPNOTSUPP;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D value * MILLIDEGRE=
E_PER_DEGREE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case hwmon_fan:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (channel) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_bulk_read(data->regmap,=20
>> EC_ADDR_MAIN_FAN_RPM_1, &rpm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 sizeof(rpm));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_bulk_read(data->regmap,=20
>> EC_ADDR_SECOND_FAN_RPM_1, &rpm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 sizeof(rpm));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EOPNOTSUPP;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D be16_to_cpu(rpm);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case hwmon_pwm:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (channel) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 0:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_read(data->regmap, EC_ADDR_PWM_1, &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case 1:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D regmap_read(data->regmap, EC_ADDR_PWM_2, &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EOPNOTSUPP;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *val =3D fixp_linear_interp=
olate(0, 0, PWM_MAX, U8_MAX, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static int uniwill_read_string(struct device *dev, enum=20
>> hwmon_sensor_types type, u32 attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int channel, const char **str)
>> +{
>> +=C2=A0=C2=A0=C2=A0 switch (type) {
>> +=C2=A0=C2=A0=C2=A0 case hwmon_temp:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *str =3D uniwill_temp_label=
s[channel];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case hwmon_fan:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *str =3D uniwill_fan_labels=
[channel];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static const struct hwmon_ops uniwill_ops =3D {
>> +=C2=A0=C2=A0=C2=A0 .visible =3D 0444,
>> +=C2=A0=C2=A0=C2=A0 .read =3D uniwill_read,
>> +=C2=A0=C2=A0=C2=A0 .read_string =3D uniwill_read_string,
>> +};
>
> .visible should hide gpu temp sensor on devices that don't have a dgpu=
=20
> and therefore not gpu temp sensor (the value is stuck at 0 on these=20
> devices)
>
> also the number of fan might also not always be exactly 2
>
I see, i will introduce separate feature flags for each sensor.

>> +
>> +static const struct hwmon_channel_info * const uniwill_info[] =3D {
>> +=C2=A0=C2=A0=C2=A0 HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>> +=C2=A0=C2=A0=C2=A0 HWMON_CHANNEL_INFO(temp,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_T_INPUT | HWMON_T_LABEL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_T_INPUT | HWMON_T_LABEL),
>> +=C2=A0=C2=A0=C2=A0 HWMON_CHANNEL_INFO(fan,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_F_INPUT | HWMON_F_LABEL,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_F_INPUT | HWMON_F_LABEL),
>> +=C2=A0=C2=A0=C2=A0 HWMON_CHANNEL_INFO(pwm,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_PWM_INPUT,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 HWMON_PWM_INPUT),
>> +=C2=A0=C2=A0=C2=A0 NULL
>> +};
>> +
>> +static const struct hwmon_chip_info uniwill_chip_info =3D {
>> +=C2=A0=C2=A0=C2=A0 .ops =3D &uniwill_ops,
>> +=C2=A0=C2=A0=C2=A0 .info =3D uniwill_info,
>> +};
>> +
>> +static int uniwill_hwmon_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct device *hdev;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_HWMON))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 hdev =3D devm_hwmon_device_register_with_info(data-=
>dev,=20
>> "uniwill", data,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &uniwill_chip_info, NULL);
>> +
>> +=C2=A0=C2=A0=C2=A0 return PTR_ERR_OR_ZERO(hdev);
>> +}
>> +
>> +static const unsigned int=20
>> uniwill_led_channel_to_bat_reg[LED_CHANNELS] =3D {
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_RED,
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_GREEN,
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_BAT_BLUE,
>> +};
>> +
>> +static const unsigned int=20
>> uniwill_led_channel_to_ac_reg[LED_CHANNELS] =3D {
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_RED,
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_GREEN,
>> +=C2=A0=C2=A0=C2=A0 EC_ADDR_LIGHTBAR_AC_BLUE,
>> +};
>> +
>> +static int uniwill_led_brightness_set(struct led_classdev *led_cdev,=
=20
>> enum led_brightness brightness)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mc=
cdev(led_cdev);
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(led_mc_c=
dev, struct=20
>> uniwill_data, led_mc_cdev);
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D led_mc_calc_color_components(led_mc_cdev, b=
rightness);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Prevent the brightness v=
alues from overflowing */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX_BRIGH=
TNESS,=20
>> data->led_mc_subled_info[i].brightness);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap,=20
>> uniwill_led_channel_to_ac_reg[i], value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap,=20
>> uniwill_led_channel_to_bat_reg[i], value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (brightness)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D LIGHTBAR_S0_OFF;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_LI=
GHTBAR_AC_CTRL,=20
>> LIGHTBAR_S0_OFF, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap,=20
>> EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_S0_OFF, value);
>> +}
>> +
>> +#define LIGHTBAR_MASK=C2=A0=C2=A0=C2=A0 (LIGHTBAR_APP_EXISTS | LIGHTBA=
R_S0_OFF |=20
>> LIGHTBAR_S3_OFF | LIGHTBAR_WELCOME)
>> +
>> +static int uniwill_led_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct led_init_data init_data =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devicename =3D DRIVER_NAME=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .default_label =3D "multico=
lor:" LED_FUNCTION_STATUS,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devname_mandatory =3D true=
,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 unsigned int color_indices[3] =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_RED,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_GREEN,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_BLUE,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR=
))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The EC has separate lightbar settings for A=
C and battery mode,
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * so we have to ensure that both settings are=
 the same.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_=
AC_CTRL, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 value |=3D LIGHTBAR_APP_EXISTS;
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_LIGHTBAR=
_AC_CTRL, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The breathing animation during suspend is n=
ot supported when
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * running on battery power.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 value |=3D LIGHTBAR_S3_OFF;
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap,=20
>> EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_MASK, value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_M=
ULTI;
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.max_brightness =3D LED_M=
AX_BRIGHTNESS;
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAM=
E_CONFLICT;
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.brightness_set_blocking =
=3D=20
>> uniwill_led_brightness_set;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (value & LIGHTBAR_S0_OFF)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.=
brightness =3D 0;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.=
brightness =3D LED_MAX_BRIGHTNESS;
>> +
>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_subled_info[i]=
.color_index =3D color_indices[i];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->r=
egmap,=20
>> uniwill_led_channel_to_ac_reg[i], &value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make sure that the =
initial intensity value is not greater=20
>> than
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the maximum brightn=
ess.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX_BRIGH=
TNESS, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap,=20
>> uniwill_led_channel_to_ac_reg[i], value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->=
regmap,=20
>> uniwill_led_channel_to_bat_reg[i], value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_subled_info[i]=
.intensity =3D value;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_subled_info[i]=
.channel =3D i;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.subled_info =3D data->led_mc_subl=
ed_info;
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.num_colors =3D LED_CHANNELS;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_led_classdev_multicolor_register_ext(da=
ta->dev,=20
>> &data->led_mc_cdev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>> +}
>> +
>> +static int uniwill_get_property(struct power_supply *psy, const=20
>> struct power_supply_ext *ext,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_property psp,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 union power_supply_propval *val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D drvdata;
>> +=C2=A0=C2=A0=C2=A0 union power_supply_propval prop;
>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_HEALTH:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_get_pr=
operty_direct(psy,=20
>> POWER_SUPPLY_PROP_PRESENT, &prop);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!prop.intval) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
->intval =3D POWER_SUPPLY_HEALTH_NO_BATTERY;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D power_supply_get_pr=
operty_direct(psy,=20
>> POWER_SUPPLY_PROP_STATUS, &prop);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prop.intval =3D=3D POWE=
R_SUPPLY_STATUS_UNKNOWN) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
->intval =3D POWER_SUPPLY_HEALTH_UNKNOWN;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->r=
egmap, EC_ADDR_BAT_ALERT, &regval);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
Charging issue */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val=
->intval =3D POWER_SUPPLY_HEALTH_UNSPEC_FAILURE;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn 0;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D POWER_SUPPL=
Y_HEALTH_GOOD;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD=
:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->r=
egmap, EC_ADDR_CHARGE_CTRL, &regval);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D clamp_val(F=
IELD_GET(CHARGE_CTRL_MASK, regval),=20
>> 0, 100);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static int uniwill_set_property(struct power_supply *psy, const=20
>> struct power_supply_ext *ext,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 void *drvdata, enum power_supply_property psp,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 const union power_supply_propval *val)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D drvdata;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD=
:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val->intval < 1 || val-=
>intval > 100)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -EINVAL;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_update_bits(d=
ata->regmap, EC_ADDR_CHARGE_CTRL,=20
>> CHARGE_CTRL_MASK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval);
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static int uniwill_property_is_writeable(struct power_supply *psy,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct power_sup=
ply_ext *ext, void *drvdata,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power_supply_prop=
erty psp)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END=
_THRESHOLD)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>> +
>> +=C2=A0=C2=A0=C2=A0 return false;
>> +}
>> +
>> +static const enum power_supply_property uniwill_properties[] =3D {
>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_HEALTH,
>> +=C2=A0=C2=A0=C2=A0 POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +};
>> +
>> +static const struct power_supply_ext uniwill_extension =3D {
>> +=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> +=C2=A0=C2=A0=C2=A0 .properties =3D uniwill_properties,
>> +=C2=A0=C2=A0=C2=A0 .num_properties =3D ARRAY_SIZE(uniwill_properties),
>> +=C2=A0=C2=A0=C2=A0 .get_property =3D uniwill_get_property,
>> +=C2=A0=C2=A0=C2=A0 .set_property =3D uniwill_set_property,
>> +=C2=A0=C2=A0=C2=A0 .property_is_writeable =3D uniwill_property_is_writ=
eable,
>> +};
>> +
>> +static int uniwill_add_battery(struct power_supply *battery, struct=20
>> acpi_battery_hook *hook)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(hook, st=
ruct=20
>> uniwill_data, hook);
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_battery_entry *entry;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!entry)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D power_supply_register_extension(battery,=20
>> &uniwill_extension, data->dev, data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(entry);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->battery_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 entry->battery =3D battery;
>> +=C2=A0=C2=A0=C2=A0 list_add(&entry->head, &data->batteries);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int uniwill_remove_battery(struct power_supply *battery,=20
>> struct acpi_battery_hook *hook)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(hook, st=
ruct=20
>> uniwill_data, hook);
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_battery_entry *entry, *tmp;
>> +
>> +=C2=A0=C2=A0=C2=A0 scoped_guard(mutex, &data->battery_lock) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry_safe(en=
try, tmp, &data->batteries, head) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(entry->battery =3D=3D battery) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 list_del(&entry->head);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 kfree(entry);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 power_supply_unregister_extension(battery, &uniwill=
_extension);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int uniwill_battery_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY)=
)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data->battery_l=
ock);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&data->batteries);
>> +=C2=A0=C2=A0=C2=A0 data->hook.name =3D "Uniwill Battery Extension";
>> +=C2=A0=C2=A0=C2=A0 data->hook.add_battery =3D uniwill_add_battery;
>> +=C2=A0=C2=A0=C2=A0 data->hook.remove_battery =3D uniwill_remove_batter=
y;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_battery_hook_register(data->dev, &data-=
>hook);
>> +}
>> +
>> +static int uniwill_notifier_call(struct notifier_block *nb, unsigned=
=20
>> long action, void *dummy)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D container_of(nb, stru=
ct=20
>> uniwill_data, nb);
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_battery_entry *entry;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (action) {
>> +=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_BATTERY_ALERT:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->battery=
_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_for_each_entry(entry, =
&data->batteries, head) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pow=
er_supply_changed(entry->battery);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->input_l=
ock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sparse_keymap_report_event(=
data->input_device, action, 1,=20
>> true);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +static int uniwill_input_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data->input_loc=
k);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->input_device =3D devm_input_allocate_device(d=
ata->dev);
>> +=C2=A0=C2=A0=C2=A0 if (!data->input_device)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D sparse_keymap_setup(data->input_device, uni=
will_keymap,=20
>> NULL);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->input_device->name =3D "Uniwill WMI hotkeys";
>> +=C2=A0=C2=A0=C2=A0 data->input_device->phys =3D "wmi/input0";
>> +=C2=A0=C2=A0=C2=A0 data->input_device->id.bustype =3D BUS_HOST;
>> +=C2=A0=C2=A0=C2=A0 ret =3D input_register_device(data->input_device);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->nb.notifier_call =3D uniwill_notifier_call;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_uniwill_wmi_register_notifier(data->dev=
, &data->nb);
>> +}
>> +
>> +static void uniwill_disable_manual_control(void *context)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D context;
>> +
>> +=C2=A0=C2=A0=C2=A0 regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM,=20
>> ENABLE_MANUAL_CTRL);
>> +}
>> +
>> +static int uniwill_ec_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_I=
D, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 dev_dbg(data->dev, "Project ID: %u\n", value);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OE=
M,=20
>> ENABLE_MANUAL_CTRL);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_add_action_or_reset(data->dev,=20
>> uniwill_disable_manual_control, data);
>> +}
>> +
>> +static int uniwill_probe(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data;
>> +=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>> +=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 handle =3D ACPI_HANDLE(&pdev->dev);
>> +=C2=A0=C2=A0=C2=A0 if (!handle)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0 data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GF=
P_KERNEL);
>> +=C2=A0=C2=A0=C2=A0 if (!data)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>> +
>> +=C2=A0=C2=A0=C2=A0 data->dev =3D &pdev->dev;
>> +=C2=A0=C2=A0=C2=A0 data->handle =3D handle;
>> +=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, data);
>> +
>> +=C2=A0=C2=A0=C2=A0 regmap =3D devm_regmap_init(&pdev->dev, &uniwill_ec=
_bus, data,=20
>> &uniwill_ec_config);
>> +=C2=A0=C2=A0=C2=A0 if (IS_ERR(regmap))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(regmap);
>> +
>> +=C2=A0=C2=A0=C2=A0 data->regmap =3D regmap;
>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(&pdev->dev, &data->super_ke=
y_lock);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_ec_init(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_battery_init(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_led_init(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_hwmon_init(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return uniwill_input_init(data);
>> +}
>> +
>> +static void uniwill_shutdown(struct platform_device *pdev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D platform_get_drvdata(=
pdev);
>> +
>> +=C2=A0=C2=A0=C2=A0 regmap_clear_bits(data->regmap, EC_ADDR_AP_OEM,=20
>> ENABLE_MANUAL_CTRL);
>> +}
>> +
>> +static int uniwill_suspend_keyboard(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_KE=
Y_LOCK))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * The EC_ADDR_SWITCH_STATUS is marked as vola=
tile, so we have=20
>> to restore it
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * ourselves.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_SWITCH_STA=
TUS,=20
>> &data->last_switch_status);
>> +}
>> +
>> +static int uniwill_suspend_battery(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY)=
)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Save the current charge limit in order to r=
estore it during=20
>> resume.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot use the regmap code for that sinc=
e this register=20
>> needs to
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * be declared as volatile due to CHARGE_CTRL_=
REACHED.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 return regmap_read(data->regmap, EC_ADDR_CHARGE_CTR=
L,=20
>> &data->last_charge_ctrl);
>> +}
>> +
>> +static int uniwill_suspend(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_keyboard(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_suspend_battery(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, true);
>> +=C2=A0=C2=A0=C2=A0 regcache_mark_dirty(data->regmap);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int uniwill_resume_keyboard(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_SUPER_KE=
Y_LOCK))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_ST=
ATUS, &value);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if ((data->last_switch_status & SUPER_KEY_LOCK_STAT=
US) =3D=3D (value=20
>> & SUPER_KEY_LOCK_STATUS))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->regmap, EC_ADDR_TRIG=
GER,=20
>> TRIGGER_SUPER_KEY_LOCK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 TRIGGER_SUPER_KEY_LOCK);
>> +}
>> +
>> +static int uniwill_resume_battery(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 if (!(supported_features & UNIWILL_FEATURE_BATTERY)=
)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap, EC_ADDR_CHA=
RGE_CTRL,=20
>> CHARGE_CTRL_MASK,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->last_charge_ctrl);
>> +}
>> +
>> +static int uniwill_resume(struct device *dev)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev);
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 regcache_cache_only(data->regmap, false);
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regcache_sync(data->regmap);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_keyboard(data);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return uniwill_resume_battery(data);
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend,=20
>> uniwill_resume);
>> +
>> +/*
>> + * We only use the DMI table for auoloading because the ACPI device=20
>> itself
>> + * does not guarantee that the underlying EC implementation is=20
>> supported.
>> + */
>> +static const struct acpi_device_id uniwill_id_table[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { "INOU0000" },
>> +=C2=A0=C2=A0=C2=A0 { },
>> +};
>> +
>> +static struct platform_driver uniwill_driver =3D {
>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev_groups =3D uniwill_gro=
ups,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe_type =3D PROBE_PREFE=
R_ASYNCHRONOUS,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .acpi_match_table =3D uniwi=
ll_id_table,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D pm_sleep_ptr(&uniwi=
ll_pm_ops),
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 .probe =3D uniwill_probe,
>> +=C2=A0=C2=A0=C2=A0 .shutdown =3D uniwill_shutdown,
>> +};
>> +
>> +static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "Intel NUC x15",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)(U=
NIWILL_FEATURE_FN_LOCK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY_LO=
CK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOG=
GLE |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_BATTERY |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_HWMON),
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "Intel NUC x15",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D (void *)(U=
NIWILL_FEATURE_FN_LOCK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_SUPER_KEY_LO=
CK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOG=
GLE |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_LIGHTBAR |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_BATTERY |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNIWILL_FEATURE_HWMON),
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 { }
>> +};
>> +MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>> +
>> +static int __init uniwill_init(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 const struct dmi_system_id *id;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 id =3D dmi_first_match(uniwill_dmi_table);
>> +=C2=A0=C2=A0=C2=A0 if (!id) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!force)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn -ENODEV;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the device s=
upports all features */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported_features =3D UINT=
_MAX;
>
> in the future there might be mutually exclusive feature (for example=20
> when Uniwil repurposes EC registers)
>
> my suggestion would be to have a "force_supported_features" in=20
> addition that overwrites the supported_features list (also for devices=
=20
> that are in the list)
>
> so something like:
>
> if (!id && !force)
>
> =C2=A0 =C2=A0 return -ENODEV
>
> if (force)
>
> =C2=A0 =C2=A0 supported_features =3D force_supported_features
>
> else
>
> =C2=A0 =C2=A0 supported_features =3D (uintptr_t)id->driver_data;
>
Interesting idea, but i would prefer to keep the individual feature bit de=
finitions private. Because of this i suggest we
look into this idea once we actually encounter such a situation where we h=
ave conflicting feature bits.

Thanks,
Armin Wolf

>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Loading on a poten=
tially unsupported device\n");
>> +=C2=A0=C2=A0=C2=A0 } else {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported_features =3D (uin=
tptr_t)id->driver_data;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D platform_driver_register(&uniwill_driver);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_wmi_register_driver();
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform_driver_unregister(=
&uniwill_driver);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +module_init(uniwill_init);
>> +
>> +static void __exit uniwill_exit(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 uniwill_wmi_unregister_driver();
>> +=C2=A0=C2=A0=C2=A0 platform_driver_unregister(&uniwill_driver);
>> +}
>> +module_exit(uniwill_exit);
>> +
>> +MODULE_AUTHOR("Armin Wolf<W_Armin@gmx.de>");
>> +MODULE_DESCRIPTION("Uniwill notebook driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> new file mode 100644
>> index 000000000000..31d9c39f14ab
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> @@ -0,0 +1,92 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Linux hotkey driver for Uniwill notebooks.
>> + *
>> + * Special thanks go to P=C5=91cze Barnab=C3=A1s, Christoffer Sandberg=
 and=20
>> Werner Sembach
>> + * for supporting the development of this driver either through=20
>> prior work or
>> + * by answering questions regarding the underlying WMI interface.
>> + *
>> + * Copyright (C) 2025 Armin Wolf<W_Armin@gmx.de>
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/init.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/notifier.h>
>> +#include <linux/printk.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "uniwill-wmi.h"
>> +
>> +#define DRIVER_NAME=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "uniwill=
-wmi"
>> +#define UNIWILL_EVENT_GUID "ABBC0F72-8EA1-11D1-00A0-C90629100000"
>> +
>> +static BLOCKING_NOTIFIER_HEAD(uniwill_wmi_chain_head);
>> +
>> +static void devm_uniwill_wmi_unregister_notifier(void *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct notifier_block *nb =3D data;
>> +
>> + blocking_notifier_chain_unregister(&uniwill_wmi_chain_head, nb);
>> +}
>> +
>> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct=20
>> notifier_block *nb)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D blocking_notifier_chain_register(&uniwill_w=
mi_chain_head,=20
>> nb);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_add_action_or_reset(dev,=20
>> devm_uniwill_wmi_unregister_notifier, nb);
>> +}
>> +
>> +static void uniwill_wmi_notify(struct wmi_device *wdev, union=20
>> acpi_object *obj)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u32 value;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_INTEGER)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +
>> +=C2=A0=C2=A0=C2=A0 value =3D obj->integer.value;
>> +
>> +=C2=A0=C2=A0=C2=A0 dev_dbg(&wdev->dev, "Received WMI event %u\n", valu=
e);
>> +
>> +=C2=A0=C2=A0=C2=A0 blocking_notifier_call_chain(&uniwill_wmi_chain_hea=
d, value, NULL);
>> +}
>> +
>> +/*
>> + * We cannot fully trust this GUID since Uniwill just copied the WMI=
=20
>> GUID
>> + * from the Windows driver example, and others probably did the same.
>> + *
>> + * Because of this we cannot use this WMI GUID for autoloading.=20
>> Instead the
>> + * associated driver will be registered manually after matching a=20
>> DMI table.
>> + */
>> +static const struct wmi_device_id uniwill_wmi_id_table[] =3D {
>> +=C2=A0=C2=A0=C2=A0 { UNIWILL_EVENT_GUID, NULL },
>> +=C2=A0=C2=A0=C2=A0 { }
>> +};
>> +
>> +static struct wmi_driver uniwill_wmi_driver =3D {
>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe_type =3D PROBE_PREFE=
R_ASYNCHRONOUS,
>> +=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 .id_table =3D uniwill_wmi_id_table,
>> +=C2=A0=C2=A0=C2=A0 .notify =3D uniwill_wmi_notify,
>> +=C2=A0=C2=A0=C2=A0 .no_singleton =3D true,
>> +};
>> +
>> +int __init uniwill_wmi_register_driver(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 return wmi_driver_register(&uniwill_wmi_driver);
>> +}
>> +
>> +void __exit uniwill_wmi_unregister_driver(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 wmi_driver_unregister(&uniwill_wmi_driver);
>> +}
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h=20
>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> new file mode 100644
>> index 000000000000..2bf69f2d8038
>> --- /dev/null
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> @@ -0,0 +1,127 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Linux hotkey driver for Uniwill notebooks.
>> + *
>> + * Copyright (C) 2025 Armin Wolf<W_Armin@gmx.de>
>> + */
>> +
>> +#ifndef UNIWILL_WMI_H
>> +#define UNIWILL_WMI_H
>> +
>> +#include <linux/init.h>
>> +
>> +#define UNIWILL_OSD_CAPSLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x01
>> +#define UNIWILL_OSD_NUMLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x02
>> +#define UNIWILL_OSD_SCROLLLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x03
>> +
>> +#define UNIWILL_OSD_TOUCHPAD_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x04
>> +#define UNIWILL_OSD_TOUCHPAD_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x05
>> +
>> +#define UNIWILL_OSD_SILENT_MODE_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x06
>> +#define UNIWILL_OSD_SILENT_MODE_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x07
>> +
>> +#define UNIWILL_OSD_WLAN_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x08
>> +#define UNIWILL_OSD_WLAN_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x09
>> +
>> +#define UNIWILL_OSD_WIMAX_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x0A
>> +#define UNIWILL_OSD_WIMAX_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x0B
>> +
>> +#define UNIWILL_OSD_BLUETOOTH_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x0C
>> +#define UNIWILL_OSD_BLUETOOTH_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x0D
>> +
>> +#define UNIWILL_OSD_RF_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x0E
>> +#define UNIWILL_OSD_RF_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x0F
>> +
>> +#define UNIWILL_OSD_3G_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x10
>> +#define UNIWILL_OSD_3G_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x11
>> +
>> +#define UNIWILL_OSD_WEBCAM_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x12
>> +#define UNIWILL_OSD_WEBCAM_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x13
>> +
>> +#define UNIWILL_OSD_BRIGHTNESSUP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x14
>> +#define UNIWILL_OSD_BRIGHTNESSDOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x15
>> +
>> +#define UNIWILL_OSD_RADIOON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x1A
>> +#define UNIWILL_OSD_RADIOOFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x1B
>> +
>> +#define UNIWILL_OSD_POWERSAVE_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x31
>> +#define UNIWILL_OSD_POWERSAVE_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x32
>> +
>> +#define UNIWILL_OSD_MENU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x34
>> +
>> +#define UNIWILL_OSD_MUTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x35
>> +#define UNIWILL_OSD_VOLUMEDOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x36
>> +#define UNIWILL_OSD_VOLUMEUP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x37
>> +
>> +#define UNIWILL_OSD_MENU_2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x38
>> +
>> +#define UNIWILL_OSD_LIGHTBAR_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x39
>> +#define UNIWILL_OSD_LIGHTBAR_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3A
>> +
>> +#define UNIWILL_OSD_KB_LED_LEVEL0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3B
>> +#define UNIWILL_OSD_KB_LED_LEVEL1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3C
>> +#define UNIWILL_OSD_KB_LED_LEVEL2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3D
>> +#define UNIWILL_OSD_KB_LED_LEVEL3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3E
>> +#define UNIWILL_OSD_KB_LED_LEVEL4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3F
>> +
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE=C2=A0=C2=A0=C2=A0 0x40
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE=C2=A0=C2=A0=C2=A0 0x41
>> +
>> +#define UNIWILL_OSD_MENU_JP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0x42
>> +
>> +#define UNIWILL_OSD_CAMERA_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x90
>> +#define UNIWILL_OSD_CAMERA_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x91
>> +
>> +#define UNIWILL_OSD_RFKILL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0xA4
>> +
>> +#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED=C2=A0=C2=A0=C2=A0 0xA5
>> +
>> +#define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED=C2=A0=C2=A0=C2=A0 0xA6
>> +
>> +#define UNIWILL_OSD_FAN_BOOST_STATE_CHANGED=C2=A0=C2=A0=C2=A0 0xA7
>> +
>> +#define UNIWILL_OSD_LCD_SW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0xA9
>> +
>> +#define UNIWILL_OSD_FAN_OVERTEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xAA
>> +
>> +#define UNIWILL_OSD_DC_ADAPTER_CHANGED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0xAB
>> +
>> +#define UNIWILL_OSD_BAT_HP_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xAC
>> +
>> +#define UNIWILL_OSD_FAN_DOWN_TEMP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xAD
>> +
>> +#define UNIWILL_OSD_BATTERY_ALERT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xAE
>> +
>> +#define UNIWILL_OSD_TIMAP_HAIERLB_SW=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0xAF
>> +
>> +#define UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE=C2=A0=C2=A0=C2=A0 0xB0
>> +
>> +#define UNIWILL_OSD_KBDILLUMDOWN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xB1
>> +#define UNIWILL_OSD_KBDILLUMUP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xB2
>> +
>> +#define UNIWILL_OSD_BACKLIGHT_LEVEL_CHANGE=C2=A0=C2=A0=C2=A0 0xB3
>> +#define UNIWILL_OSD_BACKLIGHT_POWER_CHANGE=C2=A0=C2=A0=C2=A0 0xB4
>> +
>> +#define UNIWILL_OSD_MIC_MUTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0xB7
>> +
>> +#define UNIWILL_OSD_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0xB8
>> +#define UNIWILL_OSD_KBDILLUMTOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xB9
>> +
>> +#define UNIWILL_OSD_BAT_CHARGE_FULL_24_H=C2=A0=C2=A0=C2=A0 0xBE
>> +
>> +#define UNIWILL_OSD_BAT_ERM_UPDATE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0xBF
>> +
>> +#define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE=C2=A0=C2=A0=C2=A0 0xC0
>> +
>> +#define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED=C2=A0=C2=A0=C2=A0 0xF0
>> +
>> +struct device;
>> +struct notifier_block;
>> +
>> +int devm_uniwill_wmi_register_notifier(struct device *dev, struct=20
>> notifier_block *nb);
>> +
>> +int __init uniwill_wmi_register_driver(void);
>> +
>> +void __exit uniwill_wmi_unregister_driver(void);
>> +
>> +#endif /* UNIWILL_WMI_H */
>

