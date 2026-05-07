Return-Path: <linux-leds+bounces-8042-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNCiMmXq/GkMVQAAu9opvQ
	(envelope-from <linux-leds+bounces-8042-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 21:39:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF34EE206
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 21:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1A4B3001CDC
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE1A42EED0;
	Thu,  7 May 2026 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CspOxCzI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9060039F193
	for <linux-leds@vger.kernel.org>; Thu,  7 May 2026 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778182751; cv=none; b=bzruFe6K2CgHqwzxyYOYXoAkhkYvVVb6iY7TIBHigv3RqolVi8DrPOBIoFrS6DvcH0BaMLqkbLLHq77AomDaCbzVmxmcs0EFYcfxddszc+afv+0xPTPV+33WASq2fP389OPAbDYzuXwdITMU0sD6sDRCwMoevXYT3vj5pJ25LDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778182751; c=relaxed/simple;
	bh=jKnGNKLqkB8e0df/XKOKodfYrWmIj9cCVvEjPQpZrkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tc3RIhbIdLUm4FIJ1VvktiuzZqBLReHteQQKOUyiNizrAqvI4SepIslZgk2xa9hYJBScWTYQQ2pGtLbf7ybHncLRa6kZgV4Rc6I1cW2f5ofzDxhmiqwy9cAyjov4aZ/4cu77j9Iqo+WdQUBiVB8zxcUJkWoFdq+BeX8IE9Q7lWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CspOxCzI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bc66ad3742fso214156166b.1
        for <linux-leds@vger.kernel.org>; Thu, 07 May 2026 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778182749; x=1778787549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=CspOxCzIqfROLf+4CckaCs5hMw3yebEWWKkwREfo/8CzFRLP6/EMaVHyvXWHv2JkQ0
         wFjsyX0WqYdCOdpuQeAHg5oO1p9+wJd9bv8aL/8z0DdCA79ET8YEASxuKGGnYIzQutDP
         iNGgLC+au7l+P42D5SHkjuxez8eSXoNUGk9gQh4p0EWdfPlEtXKFOxPmKNGAj2zJQUTB
         74YXUPABMCj2b2KjwbBGW/OJzPtu9NRzL+2qEent+58w2XMvSvFf+PBhUwDPFI4USwd5
         MsoI2k0Q6rvMK/2Gsb7kCI+bNaelvHUkUzAlfzlW4bEoNqteFqtiNnTXJGKnWAA/FJsB
         jQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778182749; x=1778787549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtUJyWhJ561fYSVag2QyjsbPKhV41JyyzBoUWpnRnL0=;
        b=cA39uR9UeEqYXc1CpFN6BZZSlJCbm54qR4OGImyhJnjFSN+Czc3mNUlvNJ5UB1OA9a
         VnuEn2PZss0zfd6wccyykgoA/QWFLzMlBkEYAmBbHxsEuerQgUJYDKzrUti7DsVSY5vO
         ywED/YHEMB8o9IDjqdg2JfwfQXCRZ+ZRqv10VbbYH/iMukns6Dg5yS7JKqb3MaSc2Hdf
         GSmNdgI/acOOzBo3IdgFTbteNVmDo/7Dw1/5u4za1vHIiUfwAyJ4wPv9uGeKZ/vjDdu9
         G6eW3xfjz163OOk3kz0QCNLkGSFysWDaaO0tGQTGYv2Vd1N5ofSePa0kudw4W8++LALD
         sWpw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wz4zbSDF9FQsFhr4E4hcezCAr9WqPTdNB6L94C7L/Jj3hPHA4BndygsMdCw5ptdbJ58IycpZV6Qhs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jzDiMcFqwMdvkfK4h/fHH5wuB29bJeWE3Mmli+y2IUO+OEHX
	y3L9s5F63Zr4mp8ErkMTl+Wa18CSQHrYyeWBFlyDjQA6FHOvMuqpm7MI
X-Gm-Gg: AeBDieuW6WkaPS0b5QYDPIekABqzjYeLzPs+0DxtlxPOuzxDU3eTbTcZbCrReovK3ws
	e2mR8RIU9jDtogvcJAYjJw4wDpltuQ/vcZozIbPVvo+hEiX/PJpfm4aosVHHotncnrLL3Ad7IHZ
	pZwnqycPVakcaKPoXawzM3mUq+sDG8x9ixcUP6eiaA9POdK4yp2icUcqibWmd3BHIkTPdqHyQl1
	XqVRmT6GABfozOEi1KFoGgtmfzSE1yrpRXkcQZqqSuzWYNa3ZN0R2s74gdb/H3z0cdrcJgtrwp6
	tUMn/wrH3QZbU2KL7LUYZPEhdSRnPY4t9sphXCxIwc0ilMjLcuCJfbscrfiOrZtpcen6oODEJSq
	/gaU5dBBkJCkGumVf+nXzuVInLzbQj90R05Wa+YBSlxp4buzNN0XFTuiOHnXr9twjcirQObgwYS
	0RGc2DoZtmFm36FmBCPE1A/+DkZYUkpZbfAKTEwnbLx0HXDQ==
X-Received: by 2002:a17:906:6a26:b0:b9d:e301:20db with SMTP id a640c23a62f3a-bc56e316a92mr576277166b.25.1778182748538;
        Thu, 07 May 2026 12:39:08 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca578b332fsm20347966b.33.2026.05.07.12.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 12:39:07 -0700 (PDT)
Message-ID: <80d85385-f5af-44e3-b9ed-d4489542d4da@gmail.com>
Date: Thu, 7 May 2026 21:39:05 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] leds: flash: add support for Samsung S2M series
 PMIC flash LED device
To: Lee Jones <lee@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Nam Tran <trannamatk@gmail.com>, =?UTF-8?B?xYF1a2FzeiBMZWJpZWR6acWEc2tp?=
 <kernel@lvkasz.us>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260424-s2mu005-pmic-v5-0-fcbc9da5a004@disroot.org>
 <20260424-s2mu005-pmic-v5-7-fcbc9da5a004@disroot.org>
 <20260507164654.GS305027@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260507164654.GS305027@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CDBF34EE206
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8042-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,bootlin.com,lwn.net,linuxfoundation.org,gmail.com,lvkasz.us,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Lee,

On 5/7/26 6:46 PM, Lee Jones wrote:
> On Fri, 24 Apr 2026, Kaustabh Chakraborty wrote:
> 
>> Add support for flash LEDs in certain Samsung S2M series PMICs.
>> The device has two channels for LEDs, typically for the back and front
>> cameras in mobile devices. Both channels can be independently
>> controlled, and can be operated in torch or flash modes.
>>
>> The driver includes initial support for the S2MU005 PMIC flash LEDs.
>>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>   drivers/leds/flash/Kconfig          |  12 ++
>>   drivers/leds/flash/Makefile         |   1 +
>>   drivers/leds/flash/leds-s2m-flash.c | 358 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 371 insertions(+)
>>
>> diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
>> index 5e08102a67841..be62e05277429 100644
>> --- a/drivers/leds/flash/Kconfig
>> +++ b/drivers/leds/flash/Kconfig
>> @@ -114,6 +114,18 @@ config LEDS_RT8515
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called leds-rt8515.
>>   
>> +config LEDS_S2M_FLASH
>> +	tristate "Samsung S2M series PMICs flash/torch LED support"
>> +	depends on LEDS_CLASS
>> +	depends on MFD_SEC_CORE
>> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> 
> The `|| !V4L2_FLASH_LED_CLASS` part of this dependency makes it
> unconditionally true. Was this intended? Perhaps this dependency can be
> removed entirely.
This is for a reason to allow building the driver if
V4L2_FLASH_LED_CLASS is turned off, or build it as a module
if V4L2_FLASH_LED_CLASS=m. You will get nice explanation from
Google AI if you type just
"V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS".

See e.g. [0], which fixes undefined symbol error by adding this.

[0] 
https://git.paulk.fr/projects/linux.git/commit/drivers?h=sunxi/cedrus/jpeg-nv16&id=dbeb02a0bc41b9e9b9c05e460890351efecf1352

-- 
Best regards,
Jacek Anaszewski


