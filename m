Return-Path: <linux-leds+bounces-4800-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A4AAD9CF7
	for <lists+linux-leds@lfdr.de>; Sat, 14 Jun 2025 15:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C8173BB05A
	for <lists+linux-leds@lfdr.de>; Sat, 14 Jun 2025 13:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529A92D662B;
	Sat, 14 Jun 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYxcvOI/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA172D5C84;
	Sat, 14 Jun 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749908323; cv=none; b=QoLUO1sc9kEJdf6w+j9rWFuMAoW5xYJto9x9Z9UrhD+165pWlur+wfVMPvwO2jxQd0mDaY0a2U6PBiDBp/qn0VgGI36csSRRCaCsZ+flr1dCpV3L7CQQSJ8GfLenrhZ1mwpeBTGsALvqEF41Wh4Lg0m56qNXs5iCF4QgLCy8vu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749908323; c=relaxed/simple;
	bh=7Ozfa+ex7HK9nkvv2liN1KglsIO2+4FNzeR0rzoUHTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYeDy6wDBn4SO5VS8I4cqM8vukxl3Amfmusco2kxsV/QEFO6/COnhN+Cx8Ix9UhyqNAKYdF+vpXT1izOEnGXXL2yKtfBloHaxQb81iN7/BGcOgENFLkyprZKZa7sYANx1mWw1zmBrURjqwAjHJ4tik6AetB8UJwwjgBPOiXzwA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYxcvOI/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54998f865b8so2756124e87.3;
        Sat, 14 Jun 2025 06:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749908319; x=1750513119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmJp+4JNsHsw1NM+e+aq3AlfBaqi9xS8EIKqS5kpKAI=;
        b=JYxcvOI/AFJpJ0dQ6gJ1eUkPHOKleY1Fq2GqGQO7AVbiNvOGrhE/5vQKwbQuZbL6CY
         1bI2mfBf9S4rNq/6iUwa2glt9vfgZR90QrqXNClP8KcTklPldhjAsVyPUI0GrnacPO7z
         OaaGeSxdL4qmk8mcjpCM6vTUr/jsjDHW53+wXIGfhT4sLmqIHh0R5MK6oYi0TkKvDC69
         uVPydLXd2j1tCw4CtqIF9q0+yOfllNVITZS8WCheFtlvkLvS4wjsSR/FxrL98L7xdgcX
         WwN41xq/FyT5v3sQJjbyxWSNd7kdI2SSl9fVSVBvzrWcYe7ORpWLmob5rTbdl/Hp8SD2
         oamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749908319; x=1750513119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmJp+4JNsHsw1NM+e+aq3AlfBaqi9xS8EIKqS5kpKAI=;
        b=g9BI+Z8AlJgRrlUFqhTFbHOfUACh6BrINtXVTTm88ItItk2hZePsYy4h/KagXNuH3g
         xVHIeuQCs9xfUkewmjppZgN+1Q8OPNgoyvSo0YsBAE5lP/tnr/K81avTk5aVh74Cl5cH
         4zgo1dMaU42PlgP7jm5RUmfxVnZHLflndIGXwyDojHtzlDjClRIldDosVJ7cGQ+OVJGK
         /06QaN1ZSEFLwc2I1Zdb3uPqTgk6Wh1uuDpYd3UyE9u4Voz1c/D5T1hs4183Ot3QnQa1
         Nl0akBUI3OSetuxoAx5io1Qfz0z4+ljwPcAFMPElBCgvfuKiuZgSSSWS6s4fzCYN6X9e
         f01w==
X-Forwarded-Encrypted: i=1; AJvYcCUCsizix7JsB8TDjbnypwyemptY6iccTCyF1f+0H0l7yokfKtjASrHdmOcoo0GYltPiooSiY0m/Sh2F7A==@vger.kernel.org, AJvYcCUx4fkyRtx/o4G4rDHIUakx3+34O9gXe6HBVeWFx87UMjJAwa9CNuOfzNv5Ws5e+9lyzvcUhgotnzS3@vger.kernel.org, AJvYcCWYHEoN815+ICOSoV4aDzjCxrb2chI63m/wYRjWk2rmbqMG0YfLJ/e1ISX2zoGY7S69uWKATPfcmf9YKJTk@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7v61SN4zd8MVNMwE/u1FY1DHLmMRczOrkMWT18viVefKzZ8hu
	lqxKfFvWvKkTmr4Vdghl/OqW2zFc/94+yHsPyB95c06m0DiSxUG8vKLA
X-Gm-Gg: ASbGncvJ81SFTZQIGYyPU6QoNOPe4sDXcNC0/bmjlO4BUpY8V6YKN0ejXFGumbckz1F
	5AqhZf8UC0IRxNpP6bskWvDrrl/D5eUi5cbVPlqHltQxd0f/CnmkRcHhZIZSDXKEa5k6JfNWq+J
	EJv7ICPpHf0IYdezvwLzPyHFuMlRMGsAnjcsNMRmVbfZLf8H+Sw/dZxHzDAjRpt63NAavjGPSka
	A5DXApOStDfogPFGRrMdHnb7Eva1AoWrDuduL6osUQnwJCNOBpY+ZYI8r8SGNE7VfQVLHzs4kgP
	BZsVqG5XqatOqGz2RUr1AEWogVgBiq0kID75cd49mYwhVTaHbPTToALQvsb4mZoCdI56y3+YkJc
	=
X-Google-Smtp-Source: AGHT+IHlwMznP1G4dk0aq6MmaRDYzsnL+CsCVLC4vzRhJtyrmCm3oOsjxbhcGrQjIOJTRKPr0riA6g==
X-Received: by 2002:a05:6512:b0a:b0:553:522f:61bb with SMTP id 2adb3069b0e04-553b6e7d451mr730123e87.12.1749908319132;
        Sat, 14 Jun 2025 06:38:39 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1fd7aesm827354e87.258.2025.06.14.06.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 06:38:38 -0700 (PDT)
Message-ID: <851e68e1-f358-49c6-8147-912d582c6a00@gmail.com>
Date: Sat, 14 Jun 2025 15:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/2] leds: leds-lp50xx: Handle reg to get correct
 multi_index
To: Lee Jones <lee@kernel.org>
Cc: Johan Adolfsson <johan.adolfsson@axis.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@axis.com
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
 <20250526-led-fix-v4-1-33345f6c4a78@axis.com>
 <2bb62450-df35-4063-ac5e-60bc1ef8f5e7@gmail.com>
 <20250612105341.GC381401@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250612105341.GC381401@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 12:53, Lee Jones wrote:
> On Mon, 26 May 2025, Jacek Anaszewski wrote:
> 
>> Hi Johan,
>>
>> On 5/26/25 16:54, Johan Adolfsson wrote:
>>> mc_subled used for multi_index needs well defined array indexes,
>>> to guarantee the desired result, optionally use reg for that.
>>>
>>> If devicetree child nodes is processed in random or reverse order
>>> you may end up with multi_index "blue green red" instead of the expected
>>> "red green blue".
>>> If user space apps uses multi_index to deduce how to control the leds
>>> they would most likely be broken without this patch if devicetree
>>> processing is reversed (which it appears to be).
>>>
>>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dts has reg set
>>> but I don't see how it can have worked without this change.
>>>
>>> If reg is not set, the previous behavior is kept, index will be in
>>> the order nodes are processed.
>>
>> This is a bug and I don't see any value in keeping buggy code.
>> Just expect reg to be present and make sure that all in-tree
>> dts files using these bindings use them in a proper way.
>>
>> To not break existing users of stable releases, if any of them
>> implement DT subnodes without 'reg' property, we can just not mark this
>> commit with "Fixed" tag, so that it wasn't applied to stable releases.
>> Although I am not sure if we should not fix it there as well.
>> I'm leaving it to Lee.
> 
> We cannot assume that a patch won't end up in LTS just by omitting the
> Fixes: tag.  Sasha's AUTOSEL tooling it still likely to pick it up if we
> describe the commit as a fix, which we do and is correct.
> 
> I see no reason not to apply it.  If users are relying on broken
> semantics, then those should be fixed also.
> 
> Is everyone happy with this patch as-is?

Nope, we should require presence of proper 'reg' value then.

>>> If reg is out of range, an error is returned.
>>> reg within led child nodes starts with 0, to map to the iout in each bank.
>>>
>>> Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
>>> ---
>>>    drivers/leds/leds-lp50xx.c | 8 +++++++-
>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
>>> index 02cb1565a9fb..8067aaa916bf 100644
>>> --- a/drivers/leds/leds-lp50xx.c
>>> +++ b/drivers/leds/leds-lp50xx.c
>>> @@ -476,6 +476,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>>>    			return -ENOMEM;
>>>    		fwnode_for_each_child_node(child, led_node) {
>>> +			int multi_index = num_colors;
>>>    			ret = fwnode_property_read_u32(led_node, "color",
>>>    						       &color_id);
>>>    			if (ret) {
>>> @@ -483,8 +484,13 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>>>    				dev_err(priv->dev, "Cannot read color\n");
>>>    				return ret;
>>>    			}
>>> +			ret = fwnode_property_read_u32(led_node, "reg", &multi_index);
>>> +			if (ret == 0 && multi_index >= LP50XX_LEDS_PER_MODULE) {

Here we should fail if 'reg' is not present too.

>>> +				dev_err(priv->dev, "reg %i out of range\n", multi_index);
>>> +				return -EINVAL;
>>> +			}
>>> -			mc_led_info[num_colors].color_index = color_id;
>>> +			mc_led_info[multi_index].color_index = color_id;
>>>    			num_colors++;
>>>    		}
>>>
>>
>> -- 
>> Best regards,
>> Jacek Anaszewski
>>
> 

-- 
Best regards,
Jacek Anaszewski


