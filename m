Return-Path: <linux-leds+bounces-4196-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A9A56E57
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 17:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE740167E9A
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 16:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A03240608;
	Fri,  7 Mar 2025 16:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM3Clv7b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54A21C162
	for <linux-leds@vger.kernel.org>; Fri,  7 Mar 2025 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741366249; cv=none; b=cV1pcWWMuLtqyJFuPVRiyLHFkZe1Moch8/fxo/yPlg9hkE05UOM3ZVUI48j3VMPYipnNe01YWpwKiZChTWQNOXkeFGxiKipDVKvHU3vgCIcL8omOoo+mf6Ogz3CeuF7qOXssyaGR8hU4dDb7zP6KL8e4wtSisUSXR+wo2dCXO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741366249; c=relaxed/simple;
	bh=jj7dx71kMu9MkyZWfYeYweZt7N0XXCoXl2tEtTomwSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qQMFDVvGeeW9yuemodkoB9JLy7Laj1DSYMNHze1xZph/Jtg72UvAboYDk5Evvmm5x8RC048eIGKDLhEb4cNaflQxktEO5YGIQ7IFG/QebyQfn+ry2woXFV4Bnhhph+fSb/bAFrl/WTFaBAlaDWMIqhyNjc2crQzdODZZAb0u6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM3Clv7b; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac25d2b2354so125497166b.1
        for <linux-leds@vger.kernel.org>; Fri, 07 Mar 2025 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741366246; x=1741971046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzAYnfrrq+6Rme6B+Rynna6LB2QKY/LMmZNNcKZufyM=;
        b=eM3Clv7bT3abmZ2+327fZrvBMnpeck6OkeDS06SiZw1r8IxRtDvV3zMfqqrjco6+NA
         bAl4KVB+O0YlkT5rRknANMl9DQSw6pft0hkFC2dVvdjkNyUIttAOZpDKPJ+HA3eQr3ar
         pvn0C2B5LCRagIn1oc+Bu+C32btz23X7Ht6QI2wJ4a1YWhXm3+DYj2jXMZcCCFhuGMnX
         2RklQcKcJMqMPSXwHDgZpWDeX8QnAodrv79CONp8bEnDCWx75MR6hkN9xfIwxe0TqEy8
         Wi2bg1/BVxnxb4MFr4JRMq6zA9RSAxc0GK8mcsaoonW+MZX9Cg4kiDNzFn3+CUiELDMv
         YBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366246; x=1741971046;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzAYnfrrq+6Rme6B+Rynna6LB2QKY/LMmZNNcKZufyM=;
        b=Mpqv0s8ikXxEYY5VTTg1ceRli1iEsNbAOTntxWAMjLh3xias1asoS+Y121iuWL5Wd2
         BR4cc8HnxQLevrceZ0EqYmpQFvkta5XGhxiLEG5mGh5C4api0bBHTdLhG6hZzpQPspHH
         G6uZS3zgMrdxksGIaZWfoLc+eGBHtgiT8xVKiAxqKYf85lC/AkTuceXwnvRH2meFFtxF
         mOS7DiJ7flM+0K+rz2uR3YbQTH90yUVUY9SHlsQc8V5yn+PFdY7rUTWxJEg9vMcKEhXe
         j91leX0alV1XNoEG1FAkpN3oCZB7n+Dl8Z41NOILwBatpY91V9uv58bO4k+Ly7PTX9wO
         2vXw==
X-Forwarded-Encrypted: i=1; AJvYcCXh0KwdKpzphklDCJ3UUPvOuxxNCVW9nN7f6Tr1w1WPRmtf/IqDzLkAvzXwR+wOqVuxWQNBFxO7ipiB@vger.kernel.org
X-Gm-Message-State: AOJu0YzSn9PG5ygWkctM828AfVycKghTg+PneoAgzMO+/TcNzIaqbUlD
	N0Ep6v3lHbAhlWZoC88tCSyJR8R5xd67hx3o+Jul5lPxpElPa+JtDyXcKQ==
X-Gm-Gg: ASbGncst1vRCkio9NGTe9ligLBNHDscF6mNuvBeQqbr6mGDNqph8qFeaOHnrpDIfV9k
	2CuKTN5byNfde2tpn7ViJf7RV2y05jQd+W5LBs3Q9sJ1xn1EHtEJymhhKkJnRLmpg5vKUWkrFvb
	3qi4LaRXsOhRbnLEk6CS4CUqTaLX61RLeHTMzLPg1CCw+rKAj+UZhJXOEnRT/sPQmoE9S3kPeB2
	Gmw4cYVY+UVtVLvHrgXEgMhKVjopC+z0+EcabZtX/KfKApkToqzRbhOXbdQ4IyyUYTkhjjisRvD
	lAT7MpMNd8keZccaISt9PDNUT4hKDK663T/T0kjQVU9S72b+xfzW5xvMfQ==
X-Google-Smtp-Source: AGHT+IGSttZmJwSOUpc7WBJVDikQ0kX2Z2UrwuDM1EwKFiQJ/jFBgyqrNF78amSzVGKvFqW80L/S2A==
X-Received: by 2002:a17:907:7ba4:b0:ac1:e2e0:f8d8 with SMTP id a640c23a62f3a-ac2525e052dmr516999466b.10.1741366245388;
        Fri, 07 Mar 2025 08:50:45 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239488445sm301337666b.72.2025.03.07.08.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:50:44 -0800 (PST)
Message-ID: <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
Date: Fri, 7 Mar 2025 17:50:43 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
Content-Language: en-US
To: Craig McQueen <craig@mcqueen.au>, linux-leds@vger.kernel.org
References: <20250306225524.318562-1-craig@mcqueen.au>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250306225524.318562-1-craig@mcqueen.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Craig,

On 3/6/25 23:55, Craig McQueen wrote:
> If the text "default" is written to the LED's sysfs 'trigger' attr, then
> call led_trigger_set_default() to set the LED to its default trigger.
> ---
>   drivers/leds/led-triggers.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index b2d40f87a5ff..f2bc3bb5062d 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>   		goto unlock;
>   	}
>   
> +	if (sysfs_streq(buf, "default")) {
> +		led_trigger_set_default(led_cdev);
> +		goto unlock;
> +	}
> +
>   	down_read(&triggers_list_lock);
>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>   		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {

Makes sense for me, this would be the second half of the feature that is
now available only from DT level.

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

