Return-Path: <linux-leds+bounces-4197-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6770A56EC4
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 18:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F124C169A52
	for <lists+linux-leds@lfdr.de>; Fri,  7 Mar 2025 17:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC05423F262;
	Fri,  7 Mar 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giN/5gNc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC6664C6
	for <linux-leds@vger.kernel.org>; Fri,  7 Mar 2025 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367455; cv=none; b=Cb2eynXj/RPZLJ+CrDz5G9Hu5lvuD34qKB3GeMaXA3B0DKBzVNjWuKIMOxee85wBfvi1SsNMqicotzhvtrSZNEo0oESDgAPgVxi4WlLkG3cP6nqejc+UwFIGW0CdPkQhV+LnTKYEwCt1VHIyN/DxX99c+hDk3rbn8QySuHB6zlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367455; c=relaxed/simple;
	bh=ONYowQ21CajVTevfced1RzaPfukVNFUpj3cERbCpvPY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PjvJz87f38y3x3C/UDdnfa19hve9eSq+x0c4yjdRSBaZSVIEBzWvF1rScqV930Z3mpaMNOR32j2akGeeZ9XxSiKb/iY4nYN86M1JiX0FwadE9Nmq5a/cIuY3aUoP3O0NyzR1d/gVIpUQ9vAaUs4dm5CXXzphMMjo+DCotkheL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giN/5gNc; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbd96bef64so327782666b.3
        for <linux-leds@vger.kernel.org>; Fri, 07 Mar 2025 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741367452; x=1741972252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9GWE9a4KzzowCZ//8InOwQzplXXDaLc1+h2aYuUNRg=;
        b=giN/5gNc56PXgVU3qJPbu7mnkZfbMC9/XHufGwLWBUHETwj8JGTzWJPb7DlyPNWiSZ
         3cjbWD07vZ3ACE8FHhcc+1N6WRnX218C9ioQc8Zm9FG+80F9h4Z7/I4/CvmdJXYDJ4PU
         IQ8TrgeDnQLdrt/1kkJCsGKhNvIzGeM+wbM9nDOVPD3DgbUKahm5phXmT/2QwlOSqgjd
         idhTmt/anHyaV0RD6eaCeM+y8egl0WW/9LUWqr3hjQ3lwZ9FMSFd9NyxvIG4UAf3NYLn
         5RUBUn+rJJhUuSP17zoyPSOQf3Gk+8AWLcCxkBy0PqCajDEv1Q+fnXEdyN81/9IyKfHj
         PEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741367452; x=1741972252;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9GWE9a4KzzowCZ//8InOwQzplXXDaLc1+h2aYuUNRg=;
        b=Xo+ioFFD+m+7aUDVRvFlqGAgWo/piiAge01GBPEGAdkFhHHnsql6HV9PpS33FbCitK
         d1wnwOqfS6/U9yNwG5VCPw+P4H703NMjsZzZWzY0QbR9Wi8GTs8t1fKaNWb4Xamk9/k1
         Z/gPtH0GDabELmDAOsZ0E3soNVQIJEC5IYP8z/KBfd2/aOF2gyulU9r34NcQy5l3ctqN
         HEdyin1TI2X8wDdnrxOydPVL0pnTsstJsvlsSK8wpjBm9PidMfwflF2Q27N22Z38d1RK
         WOuWD1avJNc423p5dcJkiX//kUYUtdLbV0TKILOIAUuBu2HAfwAVPDgaX6ccyj0qFI2j
         Qdtw==
X-Forwarded-Encrypted: i=1; AJvYcCV1qPZlYUHKFaxKOv6QBRw1QIxXC+CptKpIXKYcRQTSMKj581NJbLUFpfRv9gqufGmJzEnwuptTyQsh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0YVMzKlrA1QywxZr25H2jEhD37wCEB647zfVwZqnV4t6Evfm
	HR58GNQZ2WoyIKZXmAYWM3Bug8OLSFZD3jfhttNDGsWR4Lr094mVfm4vkA==
X-Gm-Gg: ASbGncvNOgqv5fcnTMzoB3HdSZSD2RpwPJ6xXw42nysOpgJcMFH5CyNl7nik+rO1fzW
	lZxRXKpYaLh/dVBWTaVHegMpZVgfqCwctT5gz3ui0piZ8bvwOkk5kjiYUsYaki2tvCkCOr2Sv7O
	HOxHsqVSh6ApGwxB8kWrjK0LU3NmkuRZxROc07TbpahFcrJ3cM0vHgExTGyuI8AO9J7fmJmLAuz
	nnNeYNg/QSi5MB6hVXbL8nV8D7icyJf+SH4bHDYZXjUiylBi0NzI1deWlONaQSUJ8mUvijC5Agw
	tnHqUr9I0IDZ1gCiFMaqYDgimvm7e1+mQ+FBc/2aj2pROnJIQHYUpjhp+w==
X-Google-Smtp-Source: AGHT+IHYNpQGJh0EMIDMrSI7Mxhm1fEiucl34klxZXb85sXsQqR/lTCe1Xbxn7IjIJUlsnwJse3a4g==
X-Received: by 2002:a17:907:6e8e:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac252628ecamr480911366b.14.1741367451503;
        Fri, 07 Mar 2025 09:10:51 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c74a9315sm2807580a12.46.2025.03.07.09.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 09:10:50 -0800 (PST)
Message-ID: <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
Date: Fri, 7 Mar 2025 18:10:49 +0100
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
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
To: Craig McQueen <craig@mcqueen.au>, linux-leds@vger.kernel.org
References: <20250306225524.318562-1-craig@mcqueen.au>
 <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
In-Reply-To: <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/7/25 17:50, Jacek Anaszewski wrote:
> Hi Craig,
> 
> On 3/6/25 23:55, Craig McQueen wrote:
>> If the text "default" is written to the LED's sysfs 'trigger' attr, then
>> call led_trigger_set_default() to set the LED to its default trigger.
>> ---
>>   drivers/leds/led-triggers.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>> index b2d40f87a5ff..f2bc3bb5062d 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct 
>> kobject *kobj,
>>           goto unlock;
>>       }
>> +    if (sysfs_streq(buf, "default")) {
>> +        led_trigger_set_default(led_cdev);
>> +        goto unlock;
>> +    }
>> +
>>       down_read(&triggers_list_lock);
>>       list_for_each_entry(trig, &trigger_list, next_trig) {
>>           if (sysfs_streq(buf, trig->name) && 
>> trigger_relevant(led_cdev, trig)) {
> 
> Makes sense for me, this would be the second half of the feature that is
> now available only from DT level.
> 
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 

But after re-thinking it - we need to return -EINVAL in case
LED class device does not define default trigger, so that the user
had proper feedback.

So, led_trigger_set_default() needs to be extended to return error
in case of !led_cdev->default_trigger or !found.

-- 
Best regards,
Jacek Anaszewski

