Return-Path: <linux-leds+bounces-1041-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE10686A468
	for <lists+linux-leds@lfdr.de>; Wed, 28 Feb 2024 01:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D85DD1C2373A
	for <lists+linux-leds@lfdr.de>; Wed, 28 Feb 2024 00:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8F0366;
	Wed, 28 Feb 2024 00:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="qLatxXAR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B5184F;
	Wed, 28 Feb 2024 00:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.89.224.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709080040; cv=none; b=nD+CKlV6SRuvNgTzTCASVffGHqn805ssjP7ryJ29XV8HuM4Jc8lGSjmnfpOOluy5r0Tk2wm4haq0C7LE62pupTBSfXMAAXyozsAJSWEB7pX0lBmH47pwp1NEHbzt1t2SbsoIqgN13EbRi0ktRJsKxLyJGhUU4W9vhkc2yi4R9vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709080040; c=relaxed/simple;
	bh=7XWXtmzTlOCcFSUL2YGPZAMO9WtMq3nsMLlRvvddB/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fuom7tO8+lyatzxzgkVoVI9wXFkgGOQoPY0h8liUo/1q/t608RJSNpWOf8+vDEgLVy+2zPY2D7qY/wOw3M4IfrnoNFzbjLbmoO+7zn43W/WRCLIv6Jw4c3PrTVw3K6a9Dlw+TnXlV431Dv5mFN0dAzg3P6Nz9bLvt0XfUWdEU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=qLatxXAR; arc=none smtp.client-ip=45.89.224.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8814D120031;
	Wed, 28 Feb 2024 03:27:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8814D120031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709080025;
	bh=WFSesTI6AKgWxIyZBgA4VNH7+YIxoCmy6FNQCkaJmb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=qLatxXAR7X400BA7yaSZOrZmgm+u/ztJ9pmTDuq1aWYlIaFhx4RHUzNm34Hn6N123
	 J5r/Yp1/TUxsLcoIts/B87901veNCOud1mqfa+skmLc2DFccMlynrXmoxMiCzjqpLt
	 7W8GUIA3LZrvC7hvMPkaCumqFnNmXjpRez5vlLIkvS9nEdDlHx6YUwvK2Gn1nXrbHb
	 6D7FSaAI0Cqp7qKt3ACruZAQWJFjqTnEU1yEb3fzaBl7ONsRHrfm1+SEc3pLGPor64
	 eOQcEzSdFyXqSNArd2DPIWd72YvRUPsj/kzBKOVIq8qxYeyQFExUjB6sn9Prff3+eU
	 bOu79fQjKuyHw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Feb 2024 03:27:05 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 28 Feb 2024 03:27:04 +0300
Message-ID: <4cc76f3a-dc64-4146-b8d6-761386a4abde@salutedevices.com>
Date: Wed, 28 Feb 2024 03:27:04 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
Content-Language: en-US
To: <andy.shevchenko@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
	<kabel@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Matti
 Vaittinen <mazziesaccount@gmail.com>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Aleksandr Mezin
	<mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
	<linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>, Lee Jones
	<lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-gpio@vger.kernel.org>,
	<intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-hwmon@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, "kernel@salutedevices.com"
	<kernel@salutedevices.com>
References: <20240222145838.12916-1-kabel@kernel.org>
 <Zde_s8iecR2ArKjC@surfacebook.localdomain> <20240223132641.3e2ba16c@dellmb>
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240223132641.3e2ba16c@dellmb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183791 [Feb 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Tracking_urls_end_caps}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;lore.kernel.org:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/27 23:49:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/27 23:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/27 18:14:00 #23853308
X-KSMG-AntiVirus-Status: Clean, skipped


On 2/23/24 15:26, Marek Behún wrote:
> On Thu, 22 Feb 2024 23:42:11 +0200
> andy.shevchenko@gmail.com wrote:
> 
>> Thu, Feb 22, 2024 at 03:58:37PM +0100, Marek Behún kirjoitti:
>>> A few drivers are doing resource-managed mutex initialization by
>>> implementing ad-hoc one-liner mutex dropping functions and using them
>>> with devm_add_action_or_reset(). Help drivers avoid these repeated
>>> one-liners by adding managed version of mutex initialization.
>>>
>>> Use the new function devm_mutex_init() in the following drivers:
>>>    drivers/gpio/gpio-pisosr.c
>>>    drivers/gpio/gpio-sim.c
>>>    drivers/gpu/drm/xe/xe_hwmon.c
>>>    drivers/hwmon/nzxt-smart2.c
>>>    drivers/leds/leds-is31fl319x.c
>>>    drivers/power/supply/mt6370-charger.c
>>>    drivers/power/supply/rt9467-charger.c
>>
>> Pardon me, but why?
>>
>> https://lore.kernel.org/linux-leds/20231214173614.2820929-1-gnstark@salutedevices.com/
>>
>> Can you cooperate, folks, instead of doing something independently?

Hello Andy

Thanks for pointing to my patch series
> 
> Thanks Andy for pointing to George's patch series.
> 
> I can drop the mutex_init() part and add just the debugfs part.

Hello Marek

I started to propose devm_mutex_init in December 2023. We tried to put 
it in devm-helpers.h firstly then we came to conclusion that 
linux/mutex.h would be a better place for it. Now I'm waiting for this 
series [1] to be merged because my patch depends on it. I'll let you 
know when I have an update.

[1] 
https://lore.kernel.org/lkml/20240222150540.79981-2-longman@redhat.com/T/
> 
> Marek

-- 
Best regards
George

