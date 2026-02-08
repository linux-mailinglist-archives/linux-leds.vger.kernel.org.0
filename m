Return-Path: <linux-leds+bounces-6890-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIeTOjiKiGlbqwQAu9opvQ
	(envelope-from <linux-leds+bounces-6890-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 14:06:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6455C108B04
	for <lists+linux-leds@lfdr.de>; Sun, 08 Feb 2026 14:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04BAD3008526
	for <lists+linux-leds@lfdr.de>; Sun,  8 Feb 2026 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EBF2749E0;
	Sun,  8 Feb 2026 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7EhQkTh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06E258CDF
	for <linux-leds@vger.kernel.org>; Sun,  8 Feb 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770555954; cv=none; b=JQRmJ9ZiOQ46aDiP/pVGMgAl3k1eK5zJC/sDjBNOa95tFJnaUuEwwdx2CU9jOpIB+ZMemGAkMpGjUlmuWxPo0km4AA5N201xc55gnuLUzhAAUzHYeEByBO/i7dkDWQs+naC0zAMTUUoHxzGAvlI1rKRBqWXL9Qu1o/nSd4ZKwnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770555954; c=relaxed/simple;
	bh=osT0EUva0gXZ1pK88EukUzwSiu7f4mThiV/KwigTGzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LkseUiRZ2SapQ19qIFxgyZ1qL8r/0k2Zqp4YetK99+J1Y4l8M1aI0Xn5QDEn0ctSh9cxI21oB/u6E3zv6AzKZXC1hfGg9dg2ATwNKMmw3SC7VuRQAVzjAJlwSDEZ8mbFYgzR98uzzScVG04avAeO2pFDOngYNJZIj9Kz6njZIe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7EhQkTh; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so39467885e9.2
        for <linux-leds@vger.kernel.org>; Sun, 08 Feb 2026 05:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770555953; x=1771160753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S6ZaHSw9LpRz01vg6acbUDvWM+cc8+yuVQwbsTXMnoc=;
        b=J7EhQkThA2l+rof3AOzI/crRVbSKPsQ3H1oU5Cl77W8vHcmN64O4AW36/L0bBRuYao
         QA1NJCRLmSI7GzB51Sz1funRAp2CG3svzIxhcwGgnGFkx51hK+drRRm6aEagZYEZvBh8
         FgoJFbogl6kj7vZ88/Qg+r2GfszxFt2Eh5YPT7L2rZbtll8h5oEOuJT2pWOQuBX5dniJ
         W+3ZgdEuSqtruad4O3g75HBhtOWYQFXCfUzp9oyaGfkpmpEyDhmgEvNNSulny1rj5vd3
         xlLpRusLQNtvNGtiDwAr6zWXveOzhbRNtCmvfGKLeQugIS1CWKAk/6BdjmBR/a4ZFE4A
         TzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770555953; x=1771160753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6ZaHSw9LpRz01vg6acbUDvWM+cc8+yuVQwbsTXMnoc=;
        b=DcEk/wvLjY4iC29bNFqbAEQNv909jeyaxp06erOGOtzPGBpHjeVRhF5e9JgJ3nkOEe
         xGFuRIbcoDceQbKJxHZHDzdVA2zHOU/59U27+lHChJboYJCymAHbHWu1YRQoL4UvPcgS
         WjJHLFYZD6aKOSczz7co/7lGUzOZH3T8qPlb8EQT5EHrkkqnOKuXxdHpONaJjcgYtZ4o
         RWbADboVNWKuXXBjUiLqUmWyrBLYVpbeaE2kDGQRiF0J5iFmLcelbC58lBxwKJG14yHs
         5ycui3d3F/Yxd+0l6npC8gR0BEVpPplqitNj+FS4Ltb2+8qCuo4Win28dQTsGszXaeSf
         ZLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdlDV/9/YzyWP4g3ftxL9SmPOWGgRKgwH8xPK3SzjEQxIQhpvW1zLMvkWCYrgChpYLqUphkfww8nGI@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFFIW39yNil7zilLj2bY2dwypkByrunGASr/EOLjyfN7xQqKw
	g2rr0GGIkAw1aaZbaerwlnDek3f6YC+Sq+FRxlCSSnImcWr+Tr9gW/oj
X-Gm-Gg: AZuq6aIiXB4fiF7OA2wQJ5X9isjU+by7eOt1lmbVcmXPNcCTLmWZE8a6c8vDuxj3xuK
	7BiXHDBqzRol5rxE2xvhmC+6pKeiNQ/2ltBp8LZi2Vb6jQR9k9LtWcPcWGMJn2hYYDuwVF30Uiv
	xewgied6H/n1hTcfycFgbuPiisWyO1FQWQGWsLKgPr8rbJhVeEAwrFB9Nj7cLgd9foYcY/hI/sS
	AdXgli+JzxX81VXJe1n2/Jb6ZN95KT3RMJYmDaaIRvet73BwlgmNVMaGLFeIdqh/c8EDn5sqjDI
	G0NmHeh3/mzqmTVKR1sOVQ8Wc0gFHbROx4eN80qUIu6fYO38h1LNiM9QnAe7Sk2B7MpoRU2eBSI
	7xe6jqxoPrMWOtd0hVPfCQU6JyVcOu4d62SiXjCOwoXkAJ9O9Dfgnax0oznQvPvu3gjQHurnWqj
	Jx1GtKjoxVR2WE/SBazPjSUsE=
X-Received: by 2002:a05:600c:4f54:b0:47d:403e:9cd5 with SMTP id 5b1f17b1804b1-4832020df4emr103964445e9.11.1770555952781;
        Sun, 08 Feb 2026 05:05:52 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2110sm19201164f8f.3.2026.02.08.05.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 05:05:52 -0800 (PST)
Message-ID: <0033b0b2-1eb3-4486-abe4-62d25f10b22c@gmail.com>
Date: Sun, 8 Feb 2026 14:05:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] dt-bindings: leds: document Samsung S2M series
 PMIC RGB LED device
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
 <20260126-s2mu005-pmic-v2-2-78f1a75f547a@disroot.org>
 <20260206133837.GA157817-robh@kernel.org>
 <DG7XJ6T9I7HU.1UVHH2QWX31O1@disroot.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <DG7XJ6T9I7HU.1UVHH2QWX31O1@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6890-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacekanaszewski@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,disroot.org:email]
X-Rspamd-Queue-Id: 6455C108B04
X-Rspamd-Action: no action

Hi Kaustabh,

On 2/6/26 14:56, Kaustabh Chakraborty wrote:
> On 2026-02-06 07:38 -06:00, Rob Herring wrote:
>> On Mon, Jan 26, 2026 at 12:37:09AM +0530, Kaustabh Chakraborty wrote:
>>> Certain Samsung S2M series PMICs have a three-channel LED device with
>>> independent brightness control for each channel, typically used as
>>> status indicators in mobile phones. Document the devicetree schema from
>>> this device.
>>>
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
>>>   .../bindings/leds/samsung,s2mu005-rgb.yaml         | 34 ++++++++++++++++++++++
>>>   1 file changed, 34 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
>>> new file mode 100644
>>> index 0000000000000..6806b6d869ff7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/samsung,s2mu005-rgb.yaml
>>> @@ -0,0 +1,34 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/leds/samsung,s2mu005-rgb.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: RGB LED Controller for Samsung S2M series PMICs
>>> +
>>> +maintainers:
>>> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
>>> +
>>> +description: |
>>> +  The Samsung S2M series PMIC RGB LED is a three-channel LED device with
>>> +  8-bit brightness control for each channel, typically used as status
>>> +  indicators in mobile phones.
>>> +
>>> +  This is a part of device tree bindings for S2M and S5M family of Power
>>> +  Management IC (PMIC).
>>> +
>>> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
>>> +  additional information and example.
>>> +
>>> +allOf:
>>> +  - $ref: common.yaml#
>>
>> This looks a bit lacking. Don't you need 3 child nodes for each or
>> reference to the multi-color schema?
> 
> 	rgb {
> 		compatible = "samsung,s2mu005-rgb";
> 		label = "notification:rgb:indicator";
> 		color = <LED_COLOR_ID_RGB>;
> 		function = LED_FUNCTION_INDICATOR;
> 		linux,default-trigger = "pattern";
> 	};

Having label together with color and function doesn't make sense.
Please read label documentation in [0].

[0] Documentation/devicetree/bindings/leds/common.yaml

-- 
Best regards,
Jacek Anaszewski


