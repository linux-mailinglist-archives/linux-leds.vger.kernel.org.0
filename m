Return-Path: <linux-leds+bounces-1753-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D20AE8D62DB
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 15:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C02C1F243C7
	for <lists+linux-leds@lfdr.de>; Fri, 31 May 2024 13:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C721476026;
	Fri, 31 May 2024 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ao1VJfh6"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BC158A12
	for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717161684; cv=none; b=Oayh3MmWUYEkSNfm2R0Tl0ibc4t0OQnrOS1+kpQzEsU8HQW24M+Dej1tay2AxPlUML5damMJ/vt2bKUfgjPwJyCcYgHeM1ctcXpADh/UgSpUwhqCNXwlQ2jqj614nFlkaOxV+sua6HJKkpxNSndgGBL7DKkfvtwObh9nmH6kbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717161684; c=relaxed/simple;
	bh=BGxzdP1LU6/rLSPmLtADgtL4qNfC9pzy+cIzsaqjp7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq8uBg1FmrFN6AD4YuPP2dSeBnHQ24pOnfQRoK8bRIkrQnmDUruQjHu5ftbTU7RIGxF2l8Zd26x4EYFUQhEY+RUYzldLwITA9cPaSGCqMc2k8tCdOnHLtWgiOvrE/Y8aN6+vJmJfPdFGObPnQGbnSVQjEG8sJlOB4bPmDCT2ckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ao1VJfh6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717161682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sQVKLcWxao+N5Q5pGL2UjNphknqTq2DjrXrXkSkpiWY=;
	b=Ao1VJfh6+IuAxYpvJbrpilubdI890YVmViEqLdwgLHgwC3sF5QHh7e/er8XC5lFRrm5zr7
	DJzLglm/1QMs4/5hvXsrDUDRxlVZ0CzGyON209u0Q84WEIL2WutL0eauIvRfoon3ffMp4K
	QYyngJvsrp79izmb6CedxLpcY8qAQWM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58--dN9eawLMJ6P-akzLKus2w-1; Fri, 31 May 2024 09:21:21 -0400
X-MC-Unique: -dN9eawLMJ6P-akzLKus2w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6266ffd419so79776666b.1
        for <linux-leds@vger.kernel.org>; Fri, 31 May 2024 06:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717161679; x=1717766479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQVKLcWxao+N5Q5pGL2UjNphknqTq2DjrXrXkSkpiWY=;
        b=jZqoljv3bCeqhzX/WfN+9N0aJZ20f3o6cH2zkgVk6ZmlWhMtwSSMgxmBBC6xPBY22g
         gntKLkHds1TNwW/PwNDULNKgsOo4gbedR4GT7326v25oaNp3hZefxKaSRH5IsTR5NWDW
         DARW13kqR+Nd5EOMX5uOMUdFAn86V/ff8BKz4aHC0pdS3qpM4wg4PPpoJlqwpOZdEV52
         IiInWavHBvLQpAyvoJ3RhhxI2GdHOWuy8WpdJQ8XY/o1y2s3U/V8Xzv34J95kCz2ObbG
         A6ZvkAZQMNqudfS1Scyp6Z/wXvzIB55fVZQqDTAAZtrTMAcLoH8e2DlDf2mKP5DcMow8
         uB3g==
X-Forwarded-Encrypted: i=1; AJvYcCU0+Bq356OtFqWuLXK7UkGN5qGw55nhujMswcXa16hdueYFvBcGqPpC2SesO1uiu6IpM/x/clN7hKZZeYWyM2IWoTQb61oIOt0ytg==
X-Gm-Message-State: AOJu0YxhpeLpihxwjOFJ1BljdJW+PXh12++Ckceg7BBZEsqQbeaqJK7t
	GZftxzTlAECxZZKfJT37bCqHJiV1B4kr3ZsVfG4mv87u0bEAea+p3tEDRVWnmRP8UMygD4M8NA8
	y4q0LIhOgmQKIuY7Ub4h/0DVsg235mwmGKfEucYnKjF2JlQc0g898lzGq5Fk=
X-Received: by 2002:a17:906:2b52:b0:a65:f74b:9c82 with SMTP id a640c23a62f3a-a681ff4502amr130278666b.19.1717161678900;
        Fri, 31 May 2024 06:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9y4AB1mWRlhxrEBdQgWUHLIXUYNT7bkS0gRgQO37XHZjO6QKmp3jxSFrFEBZWdkALjovEPw==
X-Received: by 2002:a17:906:2b52:b0:a65:f74b:9c82 with SMTP id a640c23a62f3a-a681ff4502amr130276266b.19.1717161678424;
        Fri, 31 May 2024 06:21:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73f9a63sm86899166b.68.2024.05.31.06.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 06:21:17 -0700 (PDT)
Message-ID: <41f08583-ad6e-4a48-be3c-964a34af83a5@redhat.com>
Date: Fri, 31 May 2024 15:21:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] power: supply: power-supply-leds: Add activate()
 callback to triggers
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Kate Hsuan <hpa@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240510194012.138192-1-hdegoede@redhat.com>
 <20240510194012.138192-4-hdegoede@redhat.com>
 <Zj5-gmaS4-IglyW4@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zj5-gmaS4-IglyW4@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/10/24 10:07 PM, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 09:40:12PM +0200, Hans de Goede wrote:
>> Add an activate() callback to the power-supply LED triggers so that
>> the LED being activated will properly reflect the current power-supply
>> state for power-supply devices which are already fully registered
>> when the trigger gets activated.
>>
>> This fixes e.g. wrong LED state (1) when the LED gets registered
>> after the power-supply device.
>>
>> 1) Until the psy driver has a reason to call power_supply_changed()
>>    which may take quite a while
> 
> ...
> 
>> +static int power_supply_led_trigger_activate(struct led_classdev *led_cdev)
>> +{
>> +	struct power_supply_led_trigger *psy_trig =
>> +		container_of(led_cdev->trigger, struct power_supply_led_trigger, trig);
> 
> Second time same container_of(), perhaps a helper [macro]?

Ack, fixed for v2.

Regards,

Hans



> 
>> +	/* Sync current power-supply state to LED being activated */
>> +	power_supply_update_leds(psy_trig->psy);
>> +	return 0;
>> +}
> 


