Return-Path: <linux-leds+bounces-7621-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDDDGJ/ZzGnnWwYAu9opvQ
	(envelope-from <linux-leds+bounces-7621-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 10:38:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDDD376F13
	for <lists+linux-leds@lfdr.de>; Wed, 01 Apr 2026 10:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0034302EE9F
	for <lists+linux-leds@lfdr.de>; Wed,  1 Apr 2026 08:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674633ACA7E;
	Wed,  1 Apr 2026 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9tFyAQL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C9738E118
	for <linux-leds@vger.kernel.org>; Wed,  1 Apr 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032682; cv=none; b=MgUu/NVA412O2G88xwTFuSZZ5v52AsdSUj6fXNe3M7X7AmC6n+N6hR1/5qHkIE2zeJ6YodS/9/oDyZroiPM462yDOp9OzI0NxnhHTmH5UNf0F27ssHDcZD4x8P7VkTlTBAnrbTyQoz9sXFdTBjsOuQVQuiSXOVcdDJ+pEQOsQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032682; c=relaxed/simple;
	bh=B8I4yikU+NXuSEW/XgDJSCcfrf0nd87qDy9j71SJckc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RapznoXIMU7okNwRfCyLQrm2sJJ0d1aQLYM9oo1+v59QcVXsCTyy0b0ZYfpH7nLol5uNpNvPtdQh+OMd0Gvj6bCNJEsIzw0WQL8CfIO1/UzdJgCyVQUxrwS7ht7JBKb/wMIf3lKiB2xVVUTKwK4rzIjAFs6mZnPsq6dLql5pxWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9tFyAQL; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c54c68db4dso5868727eec.0
        for <linux-leds@vger.kernel.org>; Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032680; x=1775637480; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=T9tFyAQLceqhj1pVO3dKpfWrIue4qYzoojdy9sCWCsvcU6DYwDrqIdxsE7i84psWT0
         ar7mYx8LAaaD2/xcq7S6Hoi/9xCj3R61f2AdOR9R+b7VorIwFVVUnHnmFRhBQ05Anj50
         8MV0BhedbPLcHpXHBsI9fEWUlk6coTfvKR8lrtLsmvhU3zVeaiKsEvu1GwCdYofraLsZ
         2WlEi5wKJ0f0vZ+319B4d8zWXuHKbnz4VfZP2nTTKtDYVqLSxP7LRF5pfaTNUUm9qwt7
         DWWNM1BgZxsGodg4M8zbR+kI1TCgBdAnsCNUDE5mJiGOss8QudiYcHo6agu+5d7+mS04
         A6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032680; x=1775637480;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfYASLH7ozZo7u+Nlu8ufwQ22D1dNhEzAgYthYuO2cU=;
        b=Ovm9+oKPz0sSp04sHMhG5WH+WcQoumcWhwyQSKZvg5pik18ZWD4X9nPaSCMuP8ILFG
         E7AGvpZdkGhRcp52xbzQ0UgpMgdVpUjD8pfp/PsmpqNudxCSohMJmTj1ekIAMiJjo1t7
         NSh/tXOAhJ8uJdWf6jJPc9QNLP43TCkApFZVVlpDWxb6XbYGNrA7U2U4TwDvNYGGnnHi
         cfXAOLrAG2wsai0yT5VH4AL/Do7GXhp9daM9u1X+ZPi3wdhDp0wikNURatYk0IkaMZoH
         HDpShO8+7VoaGqsNXFJKyezYrU+zDC/J7OJcvo3HoloY6uZyN/sdZysl8T/W4VJuAkbW
         Tegg==
X-Forwarded-Encrypted: i=1; AJvYcCW5b2t9ne7wzcsgKK95bWM/lApjTumq6FyNDuUQR2b02lFBB8j4lcHOw6eolj5zhbpABx74hQoFjukD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYbDIilCn7FJCxj5n1NRecBqkLp5oILmk6nvXhQMqfdHW1fXh
	CjkLjDiQMKVVSJ8K5dMh3PhMTHAL/gVIdJPYIXy9lnvO4kmswIid4p+1
X-Gm-Gg: ATEYQzwfikw/LJWrTxsrqvqwVUOsKCuM3rAIKGV7p6HBM0b+7a8xs3gKmRAnei+2IMe
	cvs2OoRPNXmeq5R9pA4lqj22HVjFY8gAQYYT+/iv8FV4uqgWJ/3FFxWPTlw6ktxjLEaU8yaPSgy
	2/tHOdjanf6J2tSWtxpeW5/b5x4SK4UdawR6TgyoKqc6gkMmJOxGKYKyqIleXBOsw7qjtB5AI9X
	iQ9jFpayLJ3eoyQ/pFCc/2iBu/4zHZmOx6lgrA/ZEdPmPnZdHA2sUfIyEYwvBOqoTCr6CsxZJsm
	737cYTAT8U/+GSnT//SOn3nUrMXDuHXfyUZN6R8IAaG7C2vSGX5CiEwEPA3j8ZpAxtsmagr/OOy
	gsJhvzobxhFWcPlyWdEaCGpI4B0+QCsuotnnQY6EB22NOBBYYpMXVr2ekSLt3mtOOYIEk6wnTi1
	LHEBU8k/DDLQ11y6gv+6alU1qLjTm4LPn++28EhL02XEKhfG9Bl9bmg/FWL2NygRvk8FkA2dJ56
	zwcXw==
X-Received: by 2002:a05:7301:fa0d:b0:2c4:4276:709f with SMTP id 5a478bee46e88-2c930c7652cmr1518985eec.1.1775032680036;
        Wed, 01 Apr 2026 01:38:00 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm12175823eec.5.2026.04.01.01.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 01:37:58 -0700 (PDT)
Message-ID: <d4fb2b66-85ae-4de4-b3dd-54260c73fd06@gmail.com>
Date: Wed, 1 Apr 2026 01:37:54 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
From: Rudraksha Gupta <guptarud@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
 <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
 <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Language: en-US
In-Reply-To: <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7621-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ixit.cz,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0CDDD376F13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Dmitry,

>>> +    vreg_flash: regulator-flash {
>>> +        compatible = "regulator-fixed";
>>> +        regulator-name = "VREG_FLASH_3P3";
>>> +        regulator-min-microvolt = <3300000>;
>>> +        regulator-max-microvolt = <3300000>;
>>> +        gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>>> +        enable-active-high;
>>> +        pinctrl-0 = <&flash_led_unlock>;
>>> +        pinctrl-names = "default";
>>> +    };
>>> +
>>> +    led-controller {
>> It looks like the nodes are not sorted. Could you please make sure that
>> they are sorted alphanumerically (if there is no node address)?
>
> Thanks for your feedback! Could I request this comment/change be noted 
> in 
> https://lore.kernel.org/all/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com/ 
> instead? As this seems to be the only comment remaining, it will be 
> easier for me to reorganize the DTS in the fuel gauge patch series 
> rather than this one, as the fuel gauge patch series depends on this 
> one. It also won't spam others in the mailing list who don't care 
> about the reorganization of the DTS.
>
I have made the changes here: 
https://lore.kernel.org/all/20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com/


> Thanks,
>
> Rudraksha
>

