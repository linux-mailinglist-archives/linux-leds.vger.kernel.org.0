Return-Path: <linux-leds+bounces-4298-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2EA65D5D
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 19:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79EBA7AF217
	for <lists+linux-leds@lfdr.de>; Mon, 17 Mar 2025 18:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638F71E51EC;
	Mon, 17 Mar 2025 18:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SORkjOOL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AD91E521C
	for <linux-leds@vger.kernel.org>; Mon, 17 Mar 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742237767; cv=none; b=W0KvURREcErckjc1bQ9rcqG4BrllejsKjNqCZZTAstEdUzGHVeWSH1EOExLOVNgTmCySj3a9z7+tzCK+zMF93hSO4833gPE39B7ri1DdNh3vt2WEwztOkOFPcUKeJrAR4Cf05ac053GvjZNzlx34FXBO2oA++MD5GQ7oMyMB1N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742237767; c=relaxed/simple;
	bh=G16bE+jIXrppJUipYTmNX4zPQerWISG/wQSjJxSRoB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgeOAD3vnP0aeqa1G0r3QEgHAAClTeQHbtY9snA4SoxRitOYR2ltTki8gEEZu0YhnYa1SZtRK0bpIfV2FoYr/SaPJ9qTHOy6WG9VysU/mfj5thd2fxMlwzj8dRlpxkHSp6S1qqJM9FzuZ3NiNHweuXG3lw64wLcDZkjsVSSxSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SORkjOOL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso7134270a12.0
        for <linux-leds@vger.kernel.org>; Mon, 17 Mar 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742237764; x=1742842564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNVzTKw/jW57UewLxth/wJ6bqJsO6nXSu+KhdnWmBPQ=;
        b=SORkjOOLJ8VMF42/sgPfcp6ZLO7TQcF1HWibzOctlwNBJ3jBoQAeofccUmjIfyT1CC
         YMZJhQQHbeiavFKPA8yVX6loJApF5tElARzEaXvvFq7+RUZCO7gLkbWE4EjMWzSK92kY
         p0zhXRRLaX/rKkt2L1UKWkno6/EcffS0k8z4AbCfIWCK70ORW3MkuTMflYART49oFlmN
         /NOZc6KEMxi7EGAzwPbpsLNaAS51Y2hXUmCYVzL/Q9w4KdYARWIN0oS2u/IK6Wp6xxnH
         GjayL+S1ucTzp1PkE9qnqWq7ArjpYvMlAq7Agbfss7pALBzJciTDZaft3jdkcsUEMgQk
         GLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237764; x=1742842564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNVzTKw/jW57UewLxth/wJ6bqJsO6nXSu+KhdnWmBPQ=;
        b=m9iYK56xfhQv78KGIHrmX/gW9fm3j7f11Mh4oH1pkXked7fr/RK+lOUSsBBlWOdRlY
         xuDP1vVf+ZOX9PMbKw0tVPrkCQlXxId1XIwTC2bOu2J1FVURqi0JWAoOAOSmXLUY7Tmo
         QFH/daw3VznB5Pn0gcPl7Je40PalCvri1boUHjOaZ4SUfitLAjk697RlGaysDkDe7uMM
         6MvvEROsjyozdbcfWT9YnibD8dWLpFSKNGGxeR8AMLpdD5L2roI8eeYimRwWNj0nD79S
         v6ddYwADTBNdHu/YTmNZbMYOk9j4kh+VfvCfjpsTQAHDlauFf5hn+fckB/UIaCt8mKmV
         FyhQ==
X-Gm-Message-State: AOJu0YxoKIgaoL8gdtslYMekncZ3cu9JfHJ/DFnsyyIlzlrIiIgXoCX2
	DAzhwZVDQoBreFuAGYHJggtwUPZzdIwb2hx2ghEnlRLhx3uTAAec
X-Gm-Gg: ASbGnctOiEoXnmqm4FGQ8SOfLKdh4qbgMNA7YKiJx79Uo+/MRTF0/tN6L5gAtxyuDrk
	DySMCb740O9Wr6U2iCJWNzKBySdGRUVILJB/lREf126o5B+F3oKMS6e/f3CgN/GU4j/obAxW+aJ
	kszN+zsD7S+57v5NNWAxxFGNg4ABpXkCGTq7CdoHZ/ZMiHK5eSIpFUFf4m6m0mtzpyWFPPpX+sc
	6tfBG2bu2wBAfKIgpdTX5Q+JZcrALBB+IVnZq2ortpOtLZXYoOCwGjt35xWVlp7QZmO6AHFW1CF
	B+w0EXL0k/4sEX8MyIMtfYYDFm7LDIonzfk611j46gxHpnYmXXxtgmDYLA==
X-Google-Smtp-Source: AGHT+IFPO51b1X9jZWOVRZSf3AmHGJrFEPF4SoZKcu6Jb5gG5/0etHjepIIz9TbTEMlNavs72+B8hw==
X-Received: by 2002:a05:6402:2786:b0:5e7:b081:7870 with SMTP id 4fb4d7f45d1cf-5eb1dee2601mr810496a12.9.1742237763472;
        Mon, 17 Mar 2025 11:56:03 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81697509csm6261928a12.30.2025.03.17.11.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 11:56:02 -0700 (PDT)
Message-ID: <d569be84-4b2e-491e-b7ff-37a84af5d0a8@gmail.com>
Date: Mon, 17 Mar 2025 19:56:01 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] leds: led-triggers: Improvements for default trigger
To: Lee Jones <lee@kernel.org>, Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
References: <20250313235626.402788-1-craig@mcqueen.au>
 <20250314075427.GG3645863@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250314075427.GG3645863@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 08:54, Lee Jones wrote:
> On Fri, 14 Mar 2025, Craig McQueen wrote:
> 
>> Accept "default" written to sysfs trigger attr.
>> If the text "default" is written to the LED's sysfs 'trigger' attr, then
>> call led_trigger_set_default() to set the LED to its default trigger.
>>
>> If the default trigger is set to "none", then led_trigger_set_default()
>> will remove a trigger. This is in contrast to the default trigger being
>> unset, in which case led_trigger_set_default() does nothing.
> 
> I can't take this without a SoB.
> 
> It would be nice to have Jacek's Reviewed-by at this point too.
> 
>> ---
>>   Documentation/ABI/testing/sysfs-class-led |  6 ++++++
>>   drivers/leds/led-triggers.c               | 13 +++++++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
>> index 2e24ac3bd7ef..0313b82644f2 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led
>> +++ b/Documentation/ABI/testing/sysfs-class-led
>> @@ -72,6 +72,12 @@ Description:
>>   		/sys/class/leds/<led> once a given trigger is selected. For
>>   		their documentation see `sysfs-class-led-trigger-*`.
>>   
>> +		Writing "none" removes the trigger for this LED.
>> +
>> +		Writing "default" sets the trigger to the LED's default trigger
>> +		(which would often be configured in the device tree for the
>> +		hardware).
>> +
>>   What:		/sys/class/leds/<led>/inverted
>>   Date:		January 2011
>>   KernelVersion:	2.6.38
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>> index b2d40f87a5ff..3799dcc1cf07 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>>   		goto unlock;
>>   	}
>>   
>> +	if (sysfs_streq(buf, "default")) {
>> +		led_trigger_set_default(led_cdev);
>> +		goto unlock;
>> +	}
>> +
>>   	down_read(&triggers_list_lock);
>>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>>   		if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
>> @@ -98,6 +103,9 @@ static int led_trigger_format(char *buf, size_t size,
>>   	int len = led_trigger_snprintf(buf, size, "%s",
>>   				       led_cdev->trigger ? "none" : "[none]");
>>   
>> +	if (led_cdev->default_trigger)
>> +		len += led_trigger_snprintf(buf + len, size - len, " default");
>> +
>>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>>   		bool hit;
>>   
>> @@ -281,6 +289,11 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>>   	if (!led_cdev->default_trigger)
>>   		return;
>>   
>> +	if (!strcmp(led_cdev->default_trigger, "none")) {
>> +		led_trigger_remove(led_cdev);
>> +		return;
>> +	}
>> +
>>   	down_read(&triggers_list_lock);
>>   	down_write(&led_cdev->trigger_lock);
>>   	list_for_each_entry(trig, &trigger_list, next_trig) {
>> -- 
>> 2.48.1
>>
>>

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski


