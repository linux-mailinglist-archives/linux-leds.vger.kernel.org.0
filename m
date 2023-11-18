Return-Path: <linux-leds+bounces-30-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE37EFF82
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 13:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC8BE1C20323
	for <lists+linux-leds@lfdr.de>; Sat, 18 Nov 2023 12:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CDF17C1;
	Sat, 18 Nov 2023 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="k1NekQyW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4FED61;
	Sat, 18 Nov 2023 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700310696; x=1700915496; i=wahrenst@gmx.net;
	bh=Z1OND/AiiDHMqRaOoZ7TJNhdG8OOj1E5sq3ErQeKSO0=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=k1NekQyWizA2ODr1KtmjCAGKbbLs1V4ug/lMHooAmxgUuOpEUAsrjekXYmKb21wC
	 C8EAxesi36ldpP1OYOGBLZCrwwLvxn2t/X7cG1kEGLxTQWFQQWSFlcQtS2z9k2khl
	 jSJ0oajxCaWYnQ80KZrtoadCxWsAZetmxcGlC/9YAJgewxmDAmwOvTo7gcBCDv6+x
	 mnCsphtWhLscMhr41uThDeksq/gaY+f31TGjonCMuleN/1RCluUMVtn3GIaxPqCEx
	 HBQc7P4rWjRCIiZqcT0FnalYqWYHeamE5FptGM0NhHmP7BPpSo69RFskl3d61oFTp
	 BkhnPCpKohAzSrFi6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNY8-1rdOBc2fey-00ZMYB; Sat, 18
 Nov 2023 13:31:36 +0100
Message-ID: <4233bd69-e5e4-49e9-96d9-b52492061ef8@gmx.net>
Date: Sat, 18 Nov 2023 13:31:34 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: gpio: Add kernel log if devm_fwnode_gpiod_get
 fails
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
References: <20231105154940.97688-1-wahrenst@gmx.net>
 <20231105154940.97688-2-wahrenst@gmx.net>
 <ZUjLuTPppvI9xlOD@smile.fi.intel.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZUjLuTPppvI9xlOD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tj8WAVX5BKrSoeM5bVyEFlq5A0r+sg6RDDr6WZMNUQrbmFaAFZ0
 Km3Og5Z/Y3OSr/nJ/xsP/euHSlOhbVpAl2ln2rcxSCVaSm6dI9ZL5d+SyFj4hSCBNOb7dC7
 SlclEfIB9EVcjxo8VFKd7iu0otjtDV8DgdkbY/oS5hRS3bnSzb+5iJT43ViMbY9Yp7eUDj7
 Lhnhwv50aQp/Pgn2/cLhw==
UI-OutboundReport: notjunk:1;M01:P0:Fm6udvCQFgU=;b2G1j5SlSd9ehNQWxfvbL+M+Dtb
 advx1UZUjtjRfxW90WZK/TYEg7OOqjUarYQ9WjNI3lVK62s6QvJ9zGQdwioRhY/K8WhrRyCrW
 WgRAbHH/IQX+/Q9O4/xu0Q9bnKy83/kQAHsWZch7fjc5PeRJsKIVwZlwr1UE/kMcW6p88idiA
 3LORtsYrL24jbwgyMLQOzoE2AYVDx+IsXRgIYS7Gde4HClMUHn6PHMSOWuf0XIg8kudVnSUV5
 dUYzMt8ssQYcHQq1BWw0uqM4zBweeCk+MfmXvBblApu8G5LzXD6FSnyPalsais/hcXTvnf9Gn
 HDXfrzBPGR+T2l1mixPBoZqH++m/kcIiRrXRdI+clyIC4w0V8z6iLumfID6TgJWDizuUalowe
 /luYD9nE3Yp/d9PNw4TZGQSiwmfCi1ffUS4TmOZj85GUs27jProqYVBNhNkI2tbGL87CQ+lCk
 V4bn+3c5OQyTRL67vc3zC1e3eQF9LJFYe7h0NixBBGSQrhTLgOn6Q6SleP88fKWbj7BgEhgVc
 krQgnfL6JrgBJAUuyHUIg6ySbD8r3YoGiHGVv74uvGVhFuVTeWr7pKYO1Nk7lSddl6bV+/9zM
 ib3gHyK3i53lYlYPh95dr5rx09ykrfN7nX8aZ035OPX0QZqrkjJJ3rT3ZiUsZCK7jsfQMqM9l
 rysdIRZB1AY/ZwZmHcszMuq6320Ad/1ifwV6HoVhdeG7XWcrahAq1Nm7yADgLgvNEvX3J0/25
 3T1JYzlCsUO4aBu1XXQRxmVjA8URY4Dh7i2ILkEOlruZwLqDLaXjUv4n6O4aX2RoS04/1HMlp
 K+h0KziDusgH7Vpm0X8cWiiMPaKz0pxSEq6vR0qp8dGbfw43+UX5P7QPz3uZX8z9t9j8TleYH
 B5GyTiTPb3WEp2klMwoPEdUUN1yu7MUqQoivcusBpQS9d2PtbmdX7vd2fJDGT4VRqR1gw6XEK
 bWdaM5t5hmBcwjndfsPy3dM4Pao=

Hi Andy,

Am 06.11.23 um 12:19 schrieb Andy Shevchenko:
> On Sun, Nov 05, 2023 at 04:49:39PM +0100, Stefan Wahren wrote:
>> In case leds-gpio fails to get the GPIO from the DT (e.g. the GPIO is
>> already requested) the driver doesn't provide any helpful error log:
>>
>>      leds-gpio: probe of leds failed with error -16
>>
>> So add a new error log in case devm_fwnode_gpiod_get() fails.
> ...
>
>>   		led.gpiod =3D devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
>>   						  NULL);
>>   		if (IS_ERR(led.gpiod)) {
>> +			dev_err(dev, "Failed to get gpio '%pfw': %ld\n",
>> +				child, PTR_ERR(led.gpiod));
> Perhaps %pe ?
i notice that i need to use dev_err_probe because of EPROBE_DEFER
anyway. So i will drop the second parameter in the next version.
>
>>   			fwnode_handle_put(child);
>>   			return ERR_CAST(led.gpiod);
>>   		}


