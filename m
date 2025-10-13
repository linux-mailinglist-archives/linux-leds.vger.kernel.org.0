Return-Path: <linux-leds+bounces-5748-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F66BD249A
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 11:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678E63A3679
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 09:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAE72FD7D8;
	Mon, 13 Oct 2025 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWZ/5+Sl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2E2FD7B9
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760347659; cv=none; b=N3I9LB22Iv5YbRD227LqI+cxtDT+QVEx32/+dI0XHdOp0Xm3qcl6bqSVNv174yWjopqFIjdrAMTHi7hO5MKl8+FtaHc6cc2uLjd/LgRA0GpFwSMGBf5ARXkl6RmaJGRyRo5pWQIrgvBOQwjsAk8gxxJNIonZSeNaIyJVHlvw5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760347659; c=relaxed/simple;
	bh=Vnu9qF1W+mtePyJT46244Xk0nYQav+1PFrImO+uiBpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMdFf44JBlEVQ+QlwFVwYpX9vrOt1B97FSh2w4dn6P/ZREBAD9vIp5DJnyfUVpbO9mKQ0XfT1fvhK4L2VFl/T8owZWoknU5R42lZHmItSUQRW7yLES9jp8bs9q9ZJ0s1ixFCwwQGX3T+GMo3e3WIErwzkM9CbgZgZanvFYfH4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWZ/5+Sl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5797c8612b4so4955690e87.2
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760347656; x=1760952456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSTsG2geMiXZZ54sKPHqUYbwVwZADjPORMJscfDPZgg=;
        b=jWZ/5+SljpEk8QizK6qM0TG2OT6docRYqUXFzt+x95jYvOnNrmmT7zioksz6h8wUEG
         QJWTj/SExgnOGFXuyQiBZXsR73urnrb84UOTMd8t/GNhcUsfmUSeGGGkXQIs0X+o6CAh
         NECFMEmve/PvMzAc5HpXqlitNn9BEbaMbDPb9rxE5SA5aAnCmkb6I+Lc04sPG7dJlz30
         o6M5AygU50aC/Yr9rbBZnyfGujoZVyuF+57VMEPM687PTKWTz9pZLPVNmpLdsD4pd9e+
         J9QFDE2plJzI5eOg9tU3z9QkKDyaI+pcJEzRADffESa6n9ENzDtNN0q/5wo1Q571lvnp
         pWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760347656; x=1760952456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSTsG2geMiXZZ54sKPHqUYbwVwZADjPORMJscfDPZgg=;
        b=FB+P7rj+N1EOVSEDgajni9Ysnk7cdbL8ycNmpbBdTiBTAOtAlGn7TwpXToxFTivskA
         Vvj9mTeBMVfJqp8zGsTPZ3PhnhOE0H6TRpR4cmr1HdNr/QO1kEbVPcOtJWHDdbYYX8Fu
         WHVHJ89fH5AlhplcDhIRkAJ3Jsa0hzvFZlUEwA9B6p10bC1IYCnAbx3plsI8zMEgBq1i
         RkoDkm4D21MFpd7qbpOCgpi8RLuE0mBnYc2+NZ8Nw1gemCqasnhAFZuVTKa6K8uqyRe5
         2E7JSn/ZNiklGbPxgBFkwqKeuR+pLcyLG5sdiJ2N93tNdasvu+ziaylAdFWaCprAvE2E
         wjbA==
X-Forwarded-Encrypted: i=1; AJvYcCWAXJSIM/ys+fSIkUoVtUnMnwFRlK6eqLu9SxdRNf9+yF8AX4WCHNHPuOIY0f5vazeeDpBRGC1RTOnY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt4f0r1yLI0t5Qpa6a234ALIdNIOItmdODgQzN3d+giLlWhnWz
	M1EVwRfcFWl+JYUJfjEk1aKx2L1TK4XeEOQDwn01HwHoY4wxRtQ5wl9f
X-Gm-Gg: ASbGnct8/CXmXRlJbGp7/ZMuh6xLBDUl5xrZKw6QvK2FR6ZkiKjB6GxwENn5sce5q4n
	JHyy2JegAE8l4t/waXshnsGbN5OhXOuMLYL2+LkQya5pm8rr8ajD4XG/idgI+MpioVRjAOxG6uz
	iWSLuTDphOQxdmM1iW1tLm9D0CD5fWRIcKn+lI9rAPwlZFXLCLygR3oij6yixXwFpxTeVrrwcuE
	IsFBkwS1EeY9pr++57J6XgcbrNuzWPbIbF0u6dwu+PGAQrnNWduZ5dkuXG0Ac812P2s5oySwrWR
	9xsvHkVbZCHT2tz8zMOccxJuh8NpUp0hcd/306Edb3Im8k5YQz5FtRholMj0CsaniMoBlNQJ6iY
	uUvw8FWtxOPNFYbsEjTmnYd33Sbd9rgGi0MCKOq5ee1ExeEnvvVGERqY/RHbC/Jktt3yQ5Jjv8J
	Wzbos9ljx72sY8QZsykIkNjzYOdmT7Do3Y7Q==
X-Google-Smtp-Source: AGHT+IEqb5UWThw0zJL0ngTJbT7pv4o6411sYhb14KLtxUGEsvK5SpnsWbVBznfiz/L/V7BnIrIUsw==
X-Received: by 2002:a05:6512:3b9a:b0:57f:6da2:6a1a with SMTP id 2adb3069b0e04-5906db01c1emr5500852e87.48.1760347655259;
        Mon, 13 Oct 2025 02:27:35 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577c1bsm3920293e87.106.2025.10.13.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:27:34 -0700 (PDT)
Message-ID: <d2295506-bf70-4142-8537-0fdf9cb04a30@gmail.com>
Date: Mon, 13 Oct 2025 12:27:33 +0300
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/13] mfd: bd71828: Support ROHM BD72720
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Lee Jones <lee@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <93142a80d90a0ac80b27090d0c83914675aad94d.1759824376.git.mazziesaccount@gmail.com>
 <20251009161847.GE2890766@google.com>
 <8ea507eb-f78c-4a16-882b-112e277fa1b6@gmail.com>
 <20251010150317.07bfdbe8@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251010150317.07bfdbe8@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas!

First of all, thanks for taking a look at this!

On 10/10/2025 16:03, Andreas Kemnade wrote:
> On Fri, 10 Oct 2025 15:09:07 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>>>> +static int bd72720_get_secondary_regmap(struct i2c_client *i2c,
>>>
>>> Does this 'secondary' have a specific purpose or a better name?
>>
>> I am not entirely sure. When I asked this from the designers they just
>> told me that they needed more than 255 registers so they added another
>> slave address... (I'm not sure what would have been wrong with using a
>> page register). So, I assume they just placed stuff that didn't fit in
>> first 255 register there. But yeah, it looks like most of the registers
>> there are related to the charger. So, perhaps it isn't completely
>> misleading to use "charger regmap"? The data-sheet seems to be just
>> using "Register map 1" and "Register map 2" in the tables listing these
>> registers. I kind of like using something which maps easily to the
>> data-sheet, but I really have no strong opinion on this.
> 
> just another idea: What about one regmap with custom functions covering
> both these adresses? Maybe that could even be added to the regmap
> functionality, maybe with a 0x100 offset for the second range.
> That way the rest of the code only needs to real with one regmap
> and properly defined registers.

Interesting idea.

I suppose you mean something like implementing custom remap_read() and 
regmap_write() - which would practically select the I2C adapter to use 
based on the register address - and then doing same thing as the 
regmap_i2c_smbus_i2c_write() / regmap_i2c_smbus_i2c_read() do?

I suppose this would mean duplicating the functionality provided by the 
regmap_i2c_smbus_i2c_write() and the regmap_i2c_smbus_i2c_read(), which 
are static. It'd also mean we'll lose the 1 to 1 mapping between the 
register addresses in driver and addresses in the data-sheet. I agree 
this wouldn't be such a huge thing if we used offset like 0x100 though.

I am still leaning towards using two different regmaps though, as it 
seems like a more 'standard' solution. I assume people are more familiar 
with providing platform data to "MFD sub drivers" than custom regmaps 
accessing different I2C slave addresses.

But yeah, thanks for this suggestion! It opened up some completely new 
paths in my brains! :)

Yours,
	-- Matti

