Return-Path: <linux-leds+bounces-1268-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1D87F1BB
	for <lists+linux-leds@lfdr.de>; Mon, 18 Mar 2024 22:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFB1AB21FDD
	for <lists+linux-leds@lfdr.de>; Mon, 18 Mar 2024 21:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02365916D;
	Mon, 18 Mar 2024 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQ/7N97f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F209859169
	for <linux-leds@vger.kernel.org>; Mon, 18 Mar 2024 21:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710795958; cv=none; b=uucgbSM0hPUW/nVGGp+Rw5ahucqrw7TRIambuuxcjqE7jzCef1StjaHEQlmy+v6Odgl8UKpP+WQC2GVKf+L8qYQugHgR5cD6r74HYOc1nTdGBu0IDArO+etf6FHbaekrMXS/NQs3cIQuc5pUjlinLg1lLb7pUxlNLcJvuwwDeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710795958; c=relaxed/simple;
	bh=zaBAcarcGW/S1Pd5iADa1/uPK6hwjuWzIRp3TYxobqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZiydUxmVxQuoZxcN7hJ57C3R/O3YYIFFIWdt0laPp+cEGaOmOZqlWhQFjzXtIA5DixW5cozCR1NgP8EmXXOa2BqY68eQtl3o2RwCsua9UDN86cw3swqcPBx+vQcS/zmp3bOc/FWxouD37gah3by4ZNU20WmjrrgINAWhB2frcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQ/7N97f; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-512f892500cso5252890e87.3
        for <linux-leds@vger.kernel.org>; Mon, 18 Mar 2024 14:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710795955; x=1711400755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPWEpKfQATl7MH+qynGh4E/Ld12wrpXlxe++ZcdCt/U=;
        b=jQ/7N97fwvDAI0UGjfbqjKGVn+P3HQYh7iunYBwKvPfLAuXfZ33ZN7GMCFHergFMJR
         W56TZjzwBMzE4hdjJA+8UhtXhcVz++LTT24tBT0bx1Cwyf6TsN/S4wReaPhuWWROSFIT
         sdicuFYa9//Jv5/1ZmDxrREQZ6vl6zyXkzXUUZX06IPpaAx0PyPjoDxixv+LyyXTGH+u
         lULe6k/Vz82MWtzp0DITLQmtcIfvDtqtymq9g6QDLR0LMx/M4GSlZtLnm7lgWC6Osb/d
         9E/vLviTDmoMkjjGDdJE8OAEQZnzdqjjktkpAlXeUnq8cw0RlgHHSkDzGji0lzcG5slq
         cPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710795955; x=1711400755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPWEpKfQATl7MH+qynGh4E/Ld12wrpXlxe++ZcdCt/U=;
        b=TiaWGSHBMweRXtmXf/DSyGDIFSjQLRY6DbUH+2AGdTbeqAWW4iAK7/A0K8Wn1ETBKW
         a3qsTJS1tm+zXnnEdfHCC6LV1Keo8tMuijC5D4j+5EddVS1O1UzkkUtVMtJA9Gup9Yw7
         WH/OheL9MB4n9Qy5utiEfiLDc+29Qd7f7rMlLcr9vz0ZiU3iinoKwraLO+2Vg4vDoDVn
         0Q5m2ojLxO5Y8+FF2IloTrEojhblEeVZyzveVLqh1v9TyYw5bEszdoOf4x5Lc25h2YRy
         XAkS6AbBmrr16mg5Jw3BA2vUV5+zZs/Ggi/K5422Gl08b3QtA4OEDODpRyKvPg3nzAjU
         /RQg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJbPmPb3g74kRqtb8/vpRTiyPW1rHD8tPU1IETJiGGYaM2DunM6J8AMsZFtrsR0V25Kq/lrrTbd3z3X0T3Z+ZLFde9O2xUJks5Q==
X-Gm-Message-State: AOJu0Yx8jippQjb9X7yKf7WMODx5yz2yb54ci9iGjNVGKEZCBj4tM96G
	aSUIHDqGr+ggATpLQc3VrAdYo42pKsWx2okbbQlgA6dqdC8HwLMm
X-Google-Smtp-Source: AGHT+IHAjIqRrI/Si26muQYNE+qMAR8+WXXd7U+UboB9MNapx0VXj+1jrmFrIVWL4CyQHXBDPOzqbA==
X-Received: by 2002:a05:6512:3e1b:b0:513:e7a0:5aa5 with SMTP id i27-20020a0565123e1b00b00513e7a05aa5mr5252838lfv.51.1710795954910;
        Mon, 18 Mar 2024 14:05:54 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id ck26-20020a170906c45a00b00a45cabd9b5asm5207254ejb.111.2024.03.18.14.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 14:05:54 -0700 (PDT)
Message-ID: <f40a0b1a-ceac-e269-c2dd-0158c5b4a1ad@gmail.com>
Date: Mon, 18 Mar 2024 22:05:53 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 0/2] leds: Add led_mc_set_brightness() and
 led_mc_trigger_event() functions
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc: Kate Hsuan <hpa@redhat.com>, linux-leds@vger.kernel.org
References: <20240309190835.173703-1-hdegoede@redhat.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20240309190835.173703-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

On 3/9/24 20:08, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch-series adding led_mc_set_brightness() and
> led_mc_trigger_event() functions for changing multi-color LED colors
> from inside the kernel.
> 
> This is a preparation series for adding a new trigger to
> drivers/power/supply/power_supply_leds.c which changes the color
> of a RGB LED depending on if the battery is discharging (LED off)
> charging (LED red) or full (LED green)
> 
> This is marked as RFC since the power_supply_leds.c changes have not
> been written yet and as such this is compile-tested only atm.
> The main goal of this RFC is to gather review feedback on the
> chosen approach in these 2 patches.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>    leds: core: Add led_mc_set_brightness() function
>    leds: trigger: Add led_mc_trigger_event() function
> 
>   drivers/leds/led-class-multicolor.c |  1 +
>   drivers/leds/led-core.c             | 31 +++++++++++++++++++++++++++++
>   drivers/leds/led-triggers.c         | 20 +++++++++++++++++++
>   include/linux/leds.h                | 26 ++++++++++++++++++++++++
>   4 files changed, 78 insertions(+)
> 

LGTM.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

