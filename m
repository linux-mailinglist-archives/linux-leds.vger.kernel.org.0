Return-Path: <linux-leds+bounces-4203-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F41A58758
	for <lists+linux-leds@lfdr.de>; Sun,  9 Mar 2025 19:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E7397A4456
	for <lists+linux-leds@lfdr.de>; Sun,  9 Mar 2025 18:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC7C1F09BE;
	Sun,  9 Mar 2025 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/ksVpJ5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B22556E
	for <linux-leds@vger.kernel.org>; Sun,  9 Mar 2025 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741546230; cv=none; b=Q3gGpLz0RHsg9Rm3y+2KL7jTD9Q2EA3Nq1P5GIkSxzdjdkzllCVpAeGnIcBnmC3+MugSWOLAgp4eJvlY8W8+vw0idWEBFYMHvV93IBb5ZICoIc/bwwUerduckx6GzAiD8auvQpnlO2o9PHzN6x5c3r0tfI7augvcCAARuMr7PTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741546230; c=relaxed/simple;
	bh=X4Ce/0M1dYviIFSANh1Di89oVIV1Qe5XdY6WEQW08rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JWcAyzJk1oRPCaA+wzR67XlFCFxRfh6zt9mGHjeg9RxqXDO5aNkBtptHmCcI0E9hLrH6I0IKYT+mn2O0AlJ7ZQDqBAu2+y1ywaXruB3FocCSYE6u0tAwUIK0kHdsnnFExOej/Mx5fQu2bxJwtvuhvXmVQECdwbSTdBWaqk/j1Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/ksVpJ5; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf615d5f31so685771766b.2
        for <linux-leds@vger.kernel.org>; Sun, 09 Mar 2025 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741546227; x=1742151027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HM8EnvSzQ0ziWefGr0XbvnpD/wEeTZ00Rf/ZAwmVpVo=;
        b=M/ksVpJ5nLGMIAK8fuVFFZL3NuEld00mrKfrjPW/scsfpJE5wDj0hkMtBSnHklxqfq
         OcZHVeVQorYRLGjpO1+yvYLJq/9yyFY+Tf8szvkgRaoQ0FjyzITcK7D1Oxi4YiNYNy1E
         dLkisNgkgYQ+gwV4yOx3+GuusVLMyfvkFE1KEhk0Oy4e4AURTZml22xEE9xv5kjMXhU7
         5sSG6wVDbKzWV/B9ptB/I8oxM1nqomRCeeBNHCnW2TVzvZZMtkMblLZ/qts2UpNe8rOA
         afI6x6IB9eSwGi10raek73hSowWHa4Qdf2r8DEj2+o24Sd+0oRRBjqmpFjt7SlddsH48
         tv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546227; x=1742151027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM8EnvSzQ0ziWefGr0XbvnpD/wEeTZ00Rf/ZAwmVpVo=;
        b=pcrqWl05C50hirbgyYtQ+L5hx1m+t72Ewwyb6rbcRtcyDCQF6e4fLmTr4UjrKC5wqZ
         /Y2XlXZREsKTvAm032/WSuNqeo7wyjaFg9liWUv6vrdCdR+Bu8L0BhIZMr55BB40531y
         hk9sHe34RLVVVb+5CqQNTKNxHruH7jJsZBH9ulfnrK98Zrww4WPaOsW1pWHi6OW//PLl
         42v4uOxjLBYfvK+zfs5+hGTL7bectRn157c3YAcM8unlU6FfMlDdoTfrTng3YrY74x7e
         aS3Q5FUOFMFs7iul/mpxV/P1JcZm2oNDjthpDDyzJ0tvi5oqBBC0KEPz+env6y/Lab/E
         fk6Q==
X-Gm-Message-State: AOJu0YxWn4JrDkr80vyGfCCv8444K3OvpqVTYa4N/8rXWMFw6SEKdttk
	TZ6ZSVlICXR7Ka8GHBCskOpqi3on+zbAx6EBD0ayAxki8Ib8Xa1rHPV4kw==
X-Gm-Gg: ASbGncs3C2hjrKlqGwfKL+jkhcCaWOrxUkPAEdKc/w/kJ6D5wUm8bTGRGySRWWXfSX2
	U7ARrHfJmbo0Mqw5aWJ0MQFW66NzfsqwyQC5xkO512F3dFSDqiHCT5pldkmPoI8I+pk//vBw++y
	gDMY3P1AI7W9DowUbGBOjcya/WYc3JsrW7+TxddBu5Wc+zKnzgvw1DdlxFAozyy/hLhc+6+6nWX
	VWSTWU2zJlt6SG5ADpXM24XZskNCxNRgRLh7qqWqcuV0e2J/tBOmjXPLGvrorn9SBJ8Z3P/CTC2
	Aj9DarlKe26P8ZtcXAb0G3r7QWHHngMxmbzAqHzsVIkVp2Kc0ALyUFp//BsQTRTNHKB3
X-Google-Smtp-Source: AGHT+IG+6sgQfynLMJfY5rRYvLJ8znhH5fto8GBVnRRKXk8dYODQlV3iJ7N2+zl/3spfwdYgeY0sBg==
X-Received: by 2002:a17:907:3e02:b0:abf:6de9:54ba with SMTP id a640c23a62f3a-ac252628ed6mr1289157666b.15.1741546226831;
        Sun, 09 Mar 2025 11:50:26 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988f192sm631533866b.158.2025.03.09.11.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 11:50:25 -0700 (PDT)
Message-ID: <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
Date: Sun, 9 Mar 2025 19:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] led-triggers: accept "default" written to sysfs trigger
 attr
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds <linux-leds@vger.kernel.org>
References: <20250306225524.318562-1-craig@mcqueen.au>
 <7ba6f144-0e5c-1d35-5ae0-9dc54751364b@gmail.com>
 <3c63272f-681b-5fa1-0319-497343fb7acc@gmail.com>
 <1957aae44d5.c26ebfad443381.7757757126392409874@mcqueen.au>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <1957aae44d5.c26ebfad443381.7757757126392409874@mcqueen.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/9/25 12:33, Craig McQueen wrote:
> On Sat, 08 Mar 2025 04:10:49 +1100 Jacek Anaszewski  wrote:
>   > On 3/7/25 17:50, Jacek Anaszewski wrote:
>   > > Hi Craig,
>   > >
>   > > On 3/6/25 23:55, Craig McQueen wrote:
>   > >> If the text "default" is written to the LED's sysfs 'trigger' attr, then
>   > >> call led_trigger_set_default() to set the LED to its default trigger.
>   > >> ---
>   > >>   drivers/leds/led-triggers.c | 5 +++++
>   > >>   1 file changed, 5 insertions(+)
>   > >>
>   > >> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>   > >> index b2d40f87a5ff..f2bc3bb5062d 100644
>   > >> --- a/drivers/leds/led-triggers.c
>   > >> +++ b/drivers/leds/led-triggers.c
>   > >> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct
>   > >> kobject *kobj,
>   > >>           goto unlock;
>   > >>       }
>   > >> +    if (sysfs_streq(buf, "default")) {
>   > >> +        led_trigger_set_default(led_cdev);
>   > >> +        goto unlock;
>   > >> +    }
>   > >> +
>   > >>       down_read(&triggers_list_lock);
>   > >>       list_for_each_entry(trig, &trigger_list, next_trig) {
>   > >>           if (sysfs_streq(buf, trig->name) &&
>   > >> trigger_relevant(led_cdev, trig)) {
>   > >
>   > > Makes sense for me, this would be the second half of the feature that is
>   > > now available only from DT level.
>   > >
>   > > Reviewed-by: Jacek Anaszewski jacek.anaszewski@gmail.com>
>   > >
>   >
>   > But after re-thinking it - we need to return -EINVAL in case
>   > LED class device does not define default trigger, so that the user
>   > had proper feedback.
>   >
>   > So, led_trigger_set_default() needs to be extended to return error
>   > in case of !led_cdev->default_trigger or !found.
> 
> In systems I've worked on, some LEDs have a default trigger, while others don't. I.e. it seems normal for an LED to have a default trigger of "none". I don't think of this as an error condition, but a normal operation to set an LED's trigger back to "none".
> 
> The not-found case is an interesting corner case. It might be that a kernel module that provides a trigger is presently not loaded, so the trigger is not currently available -- but will be available if the kernel module is loaded again.

Fair enough.
It would be good to add this description to the entry related to
"trigger" file in Documentation/ABI/testing/sysfs-class-led.

> 
> 1. LED has a default trigger "moduletrigger".
> 2. Module that provides that trigger "moduletrigger" is unloaded.
> 3. LED has trigger set to something else, "othertrigger".
> 4. led_trigger_set_default() is called for that LED.
>      Will the LED's trigger be effectively "none", or stay at "othertrigger"?
> 5. Module that provides "moduletrigger" is loaded again.
>      Will the LED be connected to its default trigger "moduletrigger", or remain at "none"?
> 

-- 
Best regards,
Jacek Anaszewski


