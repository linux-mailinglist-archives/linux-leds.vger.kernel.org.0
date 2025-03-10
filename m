Return-Path: <linux-leds+bounces-4219-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 351CBA5A4C4
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 21:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E34A188B1A8
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 20:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE371DF24A;
	Mon, 10 Mar 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9vhmpwa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A81CB332
	for <linux-leds@vger.kernel.org>; Mon, 10 Mar 2025 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637903; cv=none; b=DeBZYAoqFafMgyWAMkwLbAWCFdmEiwgqjWvJpNXLgjqKmf0Lkw3h44Tri4IyTmGWfiA4Q61jQ1WHat5QoJtclzpL/xss9XGhBgsRr1CUxiQL2eEHwI0wXh6QH0pzFoARr3uyU/pSUoT2Q/Lu3OCZy9LAFz3dU4aGfd50JDvnMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637903; c=relaxed/simple;
	bh=QMXL4XRMMj+KCWBCYxhaw7vX9n5PbFNVb0Ir/6BW5pQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UwoTiQoD2NPHLq/7UAUamy2qTjqD6+7gFCwVvK6HDr053b3lR4LT6QUpAxraVN5vQIupxK+oG0v/zR2CTAYxuKgPgAoyS0XHsfZhL3BF7MVtP5Z5Eg7zNG3Jad73GXg9RqpXM+pbQPaTHXUfWwMAw0nJCFwkVwEVfrYOa+APeRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9vhmpwa; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac29fd22163so248658566b.3
        for <linux-leds@vger.kernel.org>; Mon, 10 Mar 2025 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741637900; x=1742242700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j7OUFWXSgaQxV7EszR81qQwqa2D/ipQaey5q6klFC1Q=;
        b=Q9vhmpwatKGp0OHB67iTyv8PmAblaqC85TFQ0I7K3x/mEr95b44KWyNja4emzC6Ui2
         KdUmGCalGwarRLvVYSA7KhDFPLJXgrdUuxpLNRYf70jlz4O0/eB6tfqmq1oSxoudpKXh
         6H/pQTRD811drukd7fsToCnQTqenYzGlbHBKd69LDb3nhcy9bq0K8f3sVLmhtKHePito
         umIQtgKgEVuKDrQKfVe/WVvOrJRZtOeYPm+sMHNPfEOB9rwgbnPUbAjwfmhLl/rv4Hgh
         VvutNtEh69kgomXd7vcu184XvxqubOPUQwuQ2CG044RfUqxxSgBAyUqcTpKv1FmFGzkh
         HN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637900; x=1742242700;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7OUFWXSgaQxV7EszR81qQwqa2D/ipQaey5q6klFC1Q=;
        b=lYlWdd1Wwsu6OIJILp+H8BKM77ZqqZ4cYQXXjwQWHPDwweChLJOxbm493WwqIxOcHO
         v2+qGYfF7vzQ5QMg/cMZFS34VJzdATyiWZUAPiaW2/0iXa+OLI7+6IlDUfYSXMy+b6ye
         +LYkRYGPlqAizJtjuwusvlcIYl5VJCkdbd/mz27vSLYz7k1NsfYO2tY44e5ugJ9hu0BQ
         BpLMi+HsB9e8U1104QgUY+8HcXqh1eHAAqj7cuq+8MDGkAdzFSP4FhKh46M7eVQeAJKl
         2BYODuSMMR6lOmXomKaBsh3e6qlwWgL50FNWIC+qoWARgTxTc7MsUjJnq21K+LS+f5Wx
         D2QQ==
X-Gm-Message-State: AOJu0Yzej/w0FQ6k3QHrPw6tXsLJoriLbLsLFi9IfgZY7XzesdG5yYWx
	258I5DhhV2Nt/fuEtL00pghPpu2TdpwzQr25LUZoNzkcmLY4jpgD48VzwA==
X-Gm-Gg: ASbGnct9ArpTn3uieodH8ncLZKpmslYPiTxuW41qiVakxdYPqxxQv82U/PhsZEnY9YY
	kRASZqswePAsYxK3EPs3gLFuPbAyE8xxAwPMZA71htM/eTFqvx9kte22Tn7BL9Z2n13w4P2O/nM
	aI/Allhv7RMy2Ry13hikqsug5Unp60WyEFxwvsfQJAxOiZBPQ+eq//FcE6Nq5wROvGj7Y7DQAPs
	ArjQXUlxWY+spjbCZKhSnV5QYuADmIrsj+odEofOKTlode8QvQTQycKfDvc2TWAZvl5mcyFXpJU
	clwvq9IvzUDrFXrUQ4jU+sDK958bM5oYQ4rlS9RMxcNxgfGr57h76dza8Q==
X-Google-Smtp-Source: AGHT+IGX0fTcnriB5BhVYiCVAh0qYdJHAqCt9YfZwglVFNMAwl6aIp2UwWP2scJldUnjejI33jB/DQ==
X-Received: by 2002:a17:907:3608:b0:abf:6bf6:a397 with SMTP id a640c23a62f3a-ac252a9e1afmr1573128266b.15.1741637899982;
        Mon, 10 Mar 2025 13:18:19 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a385e16dsm199125466b.34.2025.03.10.13.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 13:18:19 -0700 (PDT)
Message-ID: <a5a1b224-8f9f-4b66-ab7e-fe388a82ecc5@gmail.com>
Date: Mon, 10 Mar 2025 21:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds <linux-leds@vger.kernel.org>
References: <20250306225524.318562-1-craig@mcqueen.au>
 <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
 <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
 <1957aae44d5.c26ebfad443381.7757757126392409874@mcqueen.au>
 <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
Content-Language: en-US
In-Reply-To: <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/25 19:50, Jacek Anaszewski wrote:
> 
> 
> On 3/9/25 12:33, Craig McQueen wrote:
>> On Sat, 08 Mar 2025 04:10:49 +1100 Jacek Anaszewski  wrote:
>>   > On 3/7/25 17:50, Jacek Anaszewski wrote:
>>   > > Hi Craig,
>>   > >
>>   > > On 3/6/25 23:55, Craig McQueen wrote:
>>   > >> If the text "default" is written to the LED's sysfs 'trigger' 
>> attr, then
>>   > >> call led_trigger_set_default() to set the LED to its default 
>> trigger.
>>   > >> ---
>>   > >>   drivers/leds/led-triggers.c | 5 +++++
>>   > >>   1 file changed, 5 insertions(+)
>>   > >>
>>   > >> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led- 
>> triggers.c
>>   > >> index b2d40f87a5ff..f2bc3bb5062d 100644
>>   > >> --- a/drivers/leds/led-triggers.c
>>   > >> +++ b/drivers/leds/led-triggers.c
>>   > >> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, 
>> struct
>>   > >> kobject *kobj,
>>   > >>           goto unlock;
>>   > >>       }
>>   > >> +    if (sysfs_streq(buf, "default")) {
>>   > >> +        led_trigger_set_default(led_cdev);
>>   > >> +        goto unlock;
>>   > >> +    }
>>   > >> +
>>   > >>       down_read(&triggers_list_lock);
>>   > >>       list_for_each_entry(trig, &trigger_list, next_trig) {
>>   > >>           if (sysfs_streq(buf, trig->name) &&
>>   > >> trigger_relevant(led_cdev, trig)) {
>>   > >
>>   > > Makes sense for me, this would be the second half of the feature 
>> that is
>>   > > now available only from DT level.
>>   > >
>>   > > Reviewed-by: Jacek Anaszewski jacek.anaszewski@gmail.com>
>>   > >
>>   >
>>   > But after re-thinking it - we need to return -EINVAL in case
>>   > LED class device does not define default trigger, so that the user
>>   > had proper feedback.
>>   >
>>   > So, led_trigger_set_default() needs to be extended to return error
>>   > in case of !led_cdev->default_trigger or !found.
>>
>> In systems I've worked on, some LEDs have a default trigger, while 
>> others don't. I.e. it seems normal for an LED to have a default 
>> trigger of "none". I don't think of this as an error condition, but a 
>> normal operation to set an LED's trigger back to "none".
>>
>> The not-found case is an interesting corner case. It might be that a 
>> kernel module that provides a trigger is presently not loaded, so the 
>> trigger is not currently available -- but will be available if the 
>> kernel module is loaded again.
> 
> Fair enough.
> It would be good to add this description to the entry related to
> "trigger" file in Documentation/ABI/testing/sysfs-class-led.
> 

Forgot to answer to the below sequence.

>> 1. LED has a default trigger "moduletrigger".
>> 2. Module that provides that trigger "moduletrigger" is unloaded.

Now led_trigger_unregister() is called, the trigger is being removed
from trigger_list and LED class devices having it set, have their
trigger property set to NULL.

>> 3. LED has trigger set to something else, "othertrigger".

LED class device trigger property is being initialized with a pointer
to the related struct led_trigger.

>> 4. led_trigger_set_default() is called for that LED.
>>      Will the LED's trigger be effectively "none", or stay at 
>> "othertrigger"?

Will stay at "othertrigger", since led_trigger_set_default() will end up
in !found state.

>> 5. Module that provides "moduletrigger" is loaded again.
>>      Will the LED be connected to its default trigger "moduletrigger", 
>> or remain at "none"?

Will remain at "othertrigger". led_trigger_register() would set default
trigger for LED class device only if no trigger is set for the LED,
and the name matches LED's default trigger


-- 
Best regards,
Jacek Anaszewski


