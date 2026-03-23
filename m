Return-Path: <linux-leds+bounces-7432-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGhLIfWEwWnqTgQAu9opvQ
	(envelope-from <linux-leds+bounces-7432-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:22:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE32FB333
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 19:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 385AD3027D98
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 18:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F35A3CA498;
	Mon, 23 Mar 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdmLDwPR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84743C9EC8
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289534; cv=none; b=iqXOzdsOKk7vMDhXjmRXiQaCJG96tfRrViejiyJSB2eNoJ3R0rQIhzTexUP6rmKBNh8uwDa57JQSgtpu5/RLEQm8736kJcvdCVxr99rVyWabe/8q4UaWRchfK7tDAKYxUj9fZnkKjs9azwvDNq5JycjTWuGZSVYy3Pu03pdVDXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289534; c=relaxed/simple;
	bh=xF2bAPNppAbfTBIBcDCV+LZAzGseQQW9IhFcftMAsW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A/6UaKUsYm/FX+nwihw1tFbA45krBdPY+lapLJV9ro1RMLPIbcc1s2mYShztGBklf5ZcFEZtNTuJqHI8CqFyQZxAzxWMFZP+UDdGeHRErifaYcbcYyBokAtR6KAK1KrOL92t2cOwVXMNlWrGwRIups1/ReV1Xdx5GOboo6n9Qj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdmLDwPR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso36729015e9.0
        for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774289531; x=1774894331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CIyRKh/yzbhrSofJPevkwLbR5QRnYf8Ol5laJ4H1+4U=;
        b=YdmLDwPRAFDXjri6eNne1/45dZWmLd/XyM6dddFTLm5BGMW4TPmdzqaJwOxN9crkI1
         Wlg7vZlv7r6AlucbmnxyJ2DhzpOUeFux6Q22QItATdBKLCZFIfWSrTv4ZuqeVn5guyS3
         3HR+GRcEhgQkB5dtulXl8FLyZhd9GpnYOgUnRF9p0zxTSP3MGPn+RuNDoAqohCNUc1n8
         xt2UIgZDqMlXR6WW5cn3JqT59fM5P6RYTM3MOP4TSmUEvy3crQn8ZROLNAGcubKp4kAW
         SesBncEzWVnj54lAXJtg6FJy4hYPjLFwEPDmIT7lwrRPn03dkYIHaZZTIL7C8uPrqMVt
         rP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774289531; x=1774894331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIyRKh/yzbhrSofJPevkwLbR5QRnYf8Ol5laJ4H1+4U=;
        b=A0cQEIblwgOQFvSkEjc97O5jLhD24J0dUqQE5Rlxp8FMQhG9irnyH+o1RueSAkPHAc
         gqdiI5WD2Zqb7z1pGvnC2TQ53OV9lcyAGH2IV2LWD7u+oZRpP5sHe61yQ7sO9sZvJEhq
         9acqr8wMdkpgrUjCSJrReXP7dmTl5GCJ7MjWF80ajFEoLNk1mLh9eaqoVW8gOzwYqQYY
         2pD9fvvpVGyJCAvUao1gA26pN2gVyNRknNj4P2Q0Fz+KwlrYkhVJPBOin6krn7s2SfQd
         YknU/A90pdRUMO/6um1FEjdIN3GgzSLWu1jrrd7yYe20VbCn9uZ0gnw/LnhlHUbZJlss
         9QUA==
X-Forwarded-Encrypted: i=1; AJvYcCXOCeFTIy4FUTyhZ1hmD7fCru/wVolQ8jFhNqtJaDWFaIqnv+ub3BykH99QWXbXjARElVNy9SX+xpAx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzddjrs3zTQaVjdIBudUI/C/oNxQNfmGFIPtTRXXNYlHXLEgLkj
	lPUQorly4+Xj8UrHIaDOGBwBF3Rnh3g35aYNwofTdijxKn4GDjYe3M2K
X-Gm-Gg: ATEYQzyC4i4lFL/hwdEZUF6PAMcucDuAlMM2KTgyvy6e0kC1xfR3m1RzgYCibMwX0EL
	98WgKPuPhin+Yo9LkJLVyMJxNJw84JEYZYy5a9YNupIJEGoW+MbE/kcZjhOw93utkc6qSdFj/on
	M+ElxPqt1TqtbYKJKvvywBaAhQ22XvYC3LXy+GStZDXsre5P55W7a6kjrhyHSBTH9868XawDLW9
	r/QzNukuntyvqXZLHrBYBdYFXJj3HymHs6F+knqo0+/eQ+rlnwGx1xGjq/3s+pGUk65ahfplxfC
	mzc/X5Z1tGGlP9sRC+nvtt5tgYbRJB10PCPkC4YuGG5GX7vLd1eW5sA/mvhNNGAqlUgfN4cMB7z
	5XnKrXSACTTBl5FPK4BhGNlTBUKAWKwTvshGPOTXrVnFRR4nuEv1CgbKBcmEU0VTIDIOfpoCyFM
	/tKS5icPC/EmZGyWhrYiUxJMbcK1Xvy+YxLS8=
X-Received: by 2002:a05:600c:a418:b0:485:3423:727d with SMTP id 5b1f17b1804b1-486ff03f502mr147150825e9.26.1774289530991;
        Mon, 23 Mar 2026 11:12:10 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6e9646sm386325e9.19.2026.03.23.11.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:12:10 -0700 (PDT)
Message-ID: <9a6cc642-aa66-4358-9ad7-9e4cc381a07a@gmail.com>
Date: Mon, 23 Mar 2026 19:12:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com
References: <20260314230107.65444-1-W_Armin@gmx.de>
 <20260314230107.65444-2-W_Armin@gmx.de>
 <e43fc3be-7cee-432b-90cb-7fbc4af2fa68@gmail.com>
 <ea41ff3c-4ee1-4fe4-a348-0c7f28fbd20b@gmx.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <ea41ff3c-4ee1-4fe4-a348-0c7f28fbd20b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7432-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,vger.kernel.org,tuxedocomputers.com,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03AE32FB333
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 11:22 AM, Armin Wolf wrote:
[...]
>>> led-class-multicolor.h
>>> index db9f34c6736e..67ac0ac0fd54 100644
>>> --- a/include/linux/led-class-multicolor.h
>>> +++ b/include/linux/led-class-multicolor.h
>>> @@ -9,10 +9,33 @@
>>>   #include <linux/leds.h>
>>>   #include <dt-bindings/leds/common.h>
>>>   +#define LED_USE_MAX_BRIGHTNESS 0
>>> +
>>> +/**
>>> + * struct mc_subled - Color component description.
>>> + * @color_index: Color ID.
>>> + * @brightness: Scaled intensity.
>>> + * @intensity: Current intensity.
>>> + * @max_intensity: Maximum supported intensity value.
>>> + * @channel: Channel index.
>>> + *
>>> + * Describes a color component of a multicolor LED. Many multicolor 
>>> LEDs
>>> + * do no support gobal brightness control in hardware, so they use
>>> + * the brightness field in connection with 
>>> led_mc_calc_color_components()
>>> + * to perform the intensity scaling in software.
>>> + * Such drivers should set max_intensity to LED_USE_MAX_BRIGHTNESS
>>
>> I'd just mention here that the field needs to be left initialized to 0,
>> to let the LED subsystem to adjust it to max_brightness. Note that in
>> case of max_brightness we allow for the same - if it is 0, then
>> led-class.c adjusts it to legacy LED_FULL (255).
>>
> OK, do you think that having LED_USE_MAX_BRIGHTNESS makes sense?

Not really, let's drop it.

-- 
Best regards,
Jacek Anaszewski


