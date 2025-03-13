Return-Path: <linux-leds+bounces-4248-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD12A6050F
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 00:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059C419C2B84
	for <lists+linux-leds@lfdr.de>; Thu, 13 Mar 2025 23:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4881F76B3;
	Thu, 13 Mar 2025 23:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2Kcskcq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E96D18DB0B
	for <linux-leds@vger.kernel.org>; Thu, 13 Mar 2025 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741907260; cv=none; b=WmSrJ3DQwAMiEN7Ubc3kNJH8LlQiYi9jShQCHK6i3d3TH54lvcShjivsdUKypHJkYb2rjeOiwuLNavIS6XRKRR3JaHYaICtLmkYow6oPIH37ee3EodMH5Rfp7q10asOBWNW1jcFFc9vHd911khI3WhAIR0WDFGaRYrCvi+jsDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741907260; c=relaxed/simple;
	bh=q50fXSQYD+SKRPyvyIBvMaPNVgYNUf4CbBZun+Cpa0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaVB6WptSg/TiOGyWv21Xy8Mp0x4KGQYKN5EK19nmn0B0b8VUxPNUwuxQt37tFWIgTfxlzhTC6QrFBWdDBqHH8TO+w8mF0IAjEuDa84AD31UEEwoSujg3dS7wTPXM/7zEuSwR1im9x/UozUqrqxIy0VWe0wLgTTXBr/+HkeGEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2Kcskcq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac25520a289so271086966b.3
        for <linux-leds@vger.kernel.org>; Thu, 13 Mar 2025 16:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741907256; x=1742512056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cLQ9luP5wUZBPEKa8wH/ilY8aCZ5HbAhkcmh7+77rdQ=;
        b=B2KcskcqbFP0RVhkpJUdQvqnI82WboH6XCOCXFDifnlxViPCUWNTo4NF+WBHbwIgd1
         V+2pm7zs25jM8NxAnElBilPm01c2DMqPDoZkkay0JSxtae0h32VuK10+k0csVlvxIQBh
         nyYvbMuURrDh741xa0LT/L2vInN7uhOrfQHuINJ4YOJ3u26wv6CvKc9QE3xnS6XDLT77
         upFBAneydMNmo8iQuTiv/IpVkmTj739CiYXakWnlOzTSn9q1yJsbPosHSRUtvKiVrOMb
         n31iPg0mESJl7k6QQCWnngXhXk+5Dt5fiSpdXx6hjpj86KIXmw4ZiG564oF3Rc0He60d
         xDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741907256; x=1742512056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cLQ9luP5wUZBPEKa8wH/ilY8aCZ5HbAhkcmh7+77rdQ=;
        b=JGKwzhOFhigIiJD0umRmmLz9RMCwbQp8PPlyS4/3p6GFfST9eObQoZ35/600eUrT37
         Iaklsgz5QmcbbQIn8E5Ex7vM7rM/czVDgaHjQO/qD6C+s/1l98lOTsgcWFw9MyXq2EML
         mrgmdDrwPABk1MCGu0p9AMu/oT5NuILhM1YfBTxx/Ws2nLddtw+i1NWNevdy34NnxJTg
         TnAoDknIF8Cct8V90ljNlx6fexKOHfTw4yyhiNndu41XfH0aOm9aeHzWNjewdMYyxtVY
         7dsonwmEgsd4UMqirnkgPGZQ3Ht2k8sYJXNVHH6zTiiHIAACaTSKmp5qfAwWtWaw5chS
         6m8Q==
X-Gm-Message-State: AOJu0YzD3IieGSxZPXhjeSshDZTfYf5CybBoN0Ba2GKxpwrVCkKZj5lQ
	TEzCNZQeTw/8Lg5VP/zwKaKjZjngwB6g4NQvP6qzxYL8lkoPVEAdVsujBw==
X-Gm-Gg: ASbGncsuJ46/MjJHhF7cUWdTjZP4AWmi5qRXZRjLO5u9ScKXYjoQHyHkOlrXHqy972Z
	Boq1xttHiWDTpFRQwNnQ1pPcXMkrUUvjwYBYJkBPTArd54Vem5nA3/D5W9GJtF/rBvrrtpwB5KG
	EJHJjrgbu0ZGEgXphmDQM97vRMhPJvyFtps5MDTgEufJrBCYB81t6bY08Ukm6n4y8HnyKwX6q9r
	QGRb0KjapYaSjxx5Uto3+2aZ5oUcTJgC/xdCmbYk5zpwHpWScD6fK+ap5NwYqRKEfOUBiCabVIx
	Z9ucnvmhs1WnAaAdeJsOHlCzeXI/KZoEGuq5v4garoF2iyqe8RrVDfZIKQ==
X-Google-Smtp-Source: AGHT+IFpzI1orL730UwmiPiVPdJq/Soxmkafwf+N9RHSwKZizR3Ht/VOitI0b6dl1vMwDm5EoOYRIw==
X-Received: by 2002:a17:907:868c:b0:ac2:fd70:ddb2 with SMTP id a640c23a62f3a-ac3301e0af0mr33967466b.2.1741907256261;
        Thu, 13 Mar 2025 16:07:36 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3e0a1sm138894566b.140.2025.03.13.16.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 16:07:34 -0700 (PDT)
Message-ID: <97fddbbf-eedf-4f5a-88e2-ea176c5239e2@gmail.com>
Date: Fri, 14 Mar 2025 00:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: led-triggers: Improvements for default trigger
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds <linux-leds@vger.kernel.org>
References: <20250312011136.380647-1-craig@mcqueen.au>
 <982cd574-d0ca-4ce9-851c-f85d86a9b886@gmail.com>
 <1958cca1252.dee52fbe748038.1386257997277534271@mcqueen.au>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <1958cca1252.dee52fbe748038.1386257997277534271@mcqueen.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/13/25 00:56, Craig McQueen wrote:
> On Thu, 13 Mar 2025 06:40:35 +1100 Jacek Anaszewski  wrote:
>   > Hi Craig,
>   >
>   > Thanks for the update.
>   >
>   > On 3/12/25 02:11, Craig McQueen wrote:
>   > > Accept "default" written to sysfs trigger attr.
>   > > If the text "default" is written to the LED's sysfs 'trigger' attr, then
>   > > call led_trigger_set_default() to set the LED to its default trigger.
>   > >
>   > > If the default trigger is set to "none", then led_trigger_set_default()
>   > > will remove a trigger. This is in contrast to the default trigger being
>   > > unset, in which case led_trigger_set_default() does nothing.
>   > > ---
>   > >   Documentation/ABI/testing/sysfs-class-led |  6 ++++++
>   > >   drivers/leds/led-triggers.c               | 26 ++++++++++++++++++++++-
>   > >   2 files changed, 31 insertions(+), 1 deletion(-)
>   > >
>   > > diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
>   > > index 2e24ac3bd7ef..0313b82644f2 100644
>   > > --- a/Documentation/ABI/testing/sysfs-class-led
>   > > +++ b/Documentation/ABI/testing/sysfs-class-led
>   > > @@ -72,6 +72,12 @@ Description:
>   > >           /sys/class/leds/ once a given trigger is selected. For
>   > >           their documentation see `sysfs-class-led-trigger-*`.
>   > >
>   > > +        Writing "none" removes the trigger for this LED.
>   > > +
>   > > +        Writing "default" sets the trigger to the LED's default trigger
>   > > +        (which would often be configured in the device tree for the
>   > > +        hardware).
>   > > +
>   > >   What:        /sys/class/leds//inverted
>   > >   Date:        January 2011
>   > >   KernelVersion:    2.6.38
>   > > diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>   > > index b2d40f87a5ff..00c898af9969 100644
>   > > --- a/drivers/leds/led-triggers.c
>   > > +++ b/drivers/leds/led-triggers.c
>   > > @@ -49,11 +49,21 @@ ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
>   > >           goto unlock;
>   > >       }
>   > >
>   > > +    /* Empty string. Do nothing. */
>   > > +    if (sysfs_streq(buf, "")) {
>   > > +        goto unlock;
>   > > +    }
>   > > +
>   >
>   > Do we need this? It seems to be the same case as any other arbitrary
>   > string, for which we obviously don't have special handling.
> 
> I'll defer to you on this. I can remove it.

I don't see much gain in it, let's skip it.

>   > >       if (sysfs_streq(buf, "none")) {
>   > >           led_trigger_remove(led_cdev);
>   > >           goto unlock;
>   > >       }
>   > >
>   > > +    if (sysfs_streq(buf, "default")) {
>   > > +        led_trigger_set_default(led_cdev);
>   > > +        goto unlock;
>   > > +    }
>   > > +
>   > >       down_read(&triggers_list_lock);
>   > >       list_for_each_entry(trig, &trigger_list, next_trig) {
>   > >           if (sysfs_streq(buf, trig->name) && trigger_relevant(led_cdev, trig)) {
>   > > @@ -98,6 +108,9 @@ static int led_trigger_format(char *buf, size_t size,
>   > >       int len = led_trigger_snprintf(buf, size, "%s",
>   > >                          led_cdev->trigger ? "none" : "[none]");
>   > >
>   > > +    if (led_cdev->default_trigger && led_cdev->default_trigger[0])
>   > > +        len += led_trigger_snprintf(buf + len, size - len, " default");
>   > > +
>   > >       list_for_each_entry(trig, &trigger_list, next_trig) {
>   > >           bool hit;
>   > >
>   > > @@ -278,9 +291,20 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
>   > >       struct led_trigger *trig;
>   > >       bool found = false;
>   > >
>   > > -    if (!led_cdev->default_trigger)
>   > > +    /* NULL pointer or empty string. Do nothing. */
>   > > +    if (!led_cdev->default_trigger || !led_cdev->default_trigger[0])
>   > >           return;
>   > >
>   > > +    /* This case isn't sensible. Do nothing. */
>   > > +    if (!strcmp(led_cdev->default_trigger, "default"))
>   > > +        return;
>   >
>   > This is rather validation of the default trigger name obtained from DT,
>   > which, if at all, should be done after parsing DT property in
>   > led_classdev_register_ext(). I'd skip it anyway.
> 
> In a separate patch I've submitted for the uleds driver, I want to add the
> ability for users to set a default trigger for a userspace LED. Maybe I should
> add extra validation of the trigger name in that uleds driver patch.

I'd do that even in a separate patch.

>   > > +    /* Remove trigger. */
>   > > +    if (!strcmp(led_cdev->default_trigger, "none")) {
>   > > +        led_trigger_remove(led_cdev);
>   >
>   > This will be handled be led_trigger_set() called from
>   > led_match_default_trigger() below.
> 
> I added this because users should have a way to get led_trigger_set_default()
> to reset a LED's trigger to none, i.e. to have a default trigger of "none".
> 
> If led_cdev->default_trigger is NULL then the function exits early, so that
> doesn't achieve it.
> 
> Without the proposed change, if led_cdev->default_trigger is "none", then
> it will look for a trigger literally named "none", and won't find it, so it will
> follow the !found code path, which isn't helpful.
> 
> So, it seems beneficial to add explicit handling of "none" to remove any
> existing trigger.

Makes sense.

>   > > +        return;
>   > > +    }
>   > > +
>   > >       down_read(&triggers_list_lock);
>   > >       down_write(&led_cdev->trigger_lock);
>   > >       list_for_each_entry(trig, &trigger_list, next_trig) {
> 

-- 
Best regards,
Jacek Anaszewski


