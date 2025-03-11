Return-Path: <linux-leds+bounces-4235-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0FA5CF36
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 20:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40542189A754
	for <lists+linux-leds@lfdr.de>; Tue, 11 Mar 2025 19:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF93D149C55;
	Tue, 11 Mar 2025 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn8RdRGA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789F263C74
	for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720963; cv=none; b=jyeIMuF0QMPFub/+OouD48I9gouTiAB8HCWFLXYpphkiOIq4HtYPAORDtdq8XD4lxBpp5uMlDsPJXmnaVwBBD6ghhkU/Udo3VPxvGOARv0j2uNmUv69O6wMpbj3PC/6h6lpH5MJelw0/szSYLzAU1CwzsASOwzUxbv3XNIQIUx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720963; c=relaxed/simple;
	bh=va/OihtWBWNRK9jy+ZhSegA6mlSeGxE7/81wTdUMisE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG98gH86c7saqMGKGNkLeIpjFx8rC0p6D2Ts61RwSJDNPuXElfidlM4qN9vf6p3J0+rYcqNKeD5G6HTwCecJCZ2YlVy41eopLoWRyxCCjC/jLp5K1StqC8BcTRksMKE3aqDCwFDiYe7Pps7zVYeDyEpphn2LcTAMVxu+XC4o/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hn8RdRGA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso1863986a12.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741720960; x=1742325760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzV7p+F4I/NWR3nBer1qNFcbUhdJ93vJXz7Dm7ZHLaw=;
        b=hn8RdRGA0HXnW65lK6d3zFiXs2DIDdE6x7xOmy5jgJRkKkoLMuDgZJ5JKoIFX66tvn
         fq1BPunjEUHMMJp/MuExzMrSYtfzrrIRc3+yCyPzmx9fG8AWSw+AJI3kgXilEua/vc1e
         +iCk3mfwbDNgnXdoKB1b5qsNjcu7nQJKwF731KU5oJvBOSZeeggTx4NuJxPc8M9Jfd1+
         gc7bxsrF022e2YvM6lu+TStsQ/nGkFBN+WcfwQnawHTIBUjyZJodOuKEZLW9O8LNs2WG
         s7zlrfvocAqTk597lWmbItop/po+lLfVLc+W+xe2aJ7Rma+Oi42AkPh+zNwy7IyEkkCG
         9HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741720960; x=1742325760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzV7p+F4I/NWR3nBer1qNFcbUhdJ93vJXz7Dm7ZHLaw=;
        b=C8Ung2Zk6fDHeJ6lXMVi0FJMmEjph5+jmk2RgVGUUohB7m8cIUkvKgoq+Mwgpa89gD
         E7BjMhBGN2apRdQfJQ3//alwYruxQwNppBlzoEAG+bUNAF5ArDas+LsEDlUz+da1huFV
         NiBVKEMV6t2VEr9v+l5uwYPJOcx83udxtk2wN5pAtOt0hrDzXdf5G1Zq03KAKR8unGyn
         5PfS9I0SD5EaZx62mlNCCVfPyNT3/KpGeDb3MCRtc8seUkBnrDPskYIvhjpBVXOCrKQM
         GnNB7ffiWGSo1s2SIpwr0ISii1ycOPD/dVhlwtbNcziERQvHR1Puo5F1XUNvCRh+aBcQ
         xCDA==
X-Gm-Message-State: AOJu0Yxb2copXsJLJetTHtWpAZGXditNxzeuGuG8hA0H8nnbJ20xGuSA
	wofoUjYmfx++HKAJf0dCUIpl+fkXtsGV/HSMSYXl+53qcjYrAWcDqiCn0A==
X-Gm-Gg: ASbGncsBfX34i+SHUKfjwbdhrRkEYcAdctsCQs2WEvxhdQ+w8krW6EzPZX+ClIOQ/MT
	AgBz0gGvpzW66gOmUhBY8qDzWJfVys0oglVNQnknzENpA+FdmGBAvhfsdQUkHKxqPI4deeSGG+n
	evzIDGD4e2AAvA6yUoaa/rF+DLyGW4gKE+xLH4+/3Ck567aH38PYa9kcy9cbdWV8nhH7KyrjET1
	cKy+bk2bvuEHuKuQXxP1CLkNNw9AG6l7kbJMzg7CG/BmvNbwFf0RlFvgC5mkUc17BCifPvBuqPF
	YyK/V6T9j6D2yT7czO8O0tmuJYGjTOGnfZ6xTOCsZXjxgPvyXZI4M0IuCA==
X-Google-Smtp-Source: AGHT+IFyFyNc+gC6JkxmQsyS+2hKAXfTXntZDUuswZWXEJu3gKwVsMhDQtiHdc7BxxXgXGLGKiB73w==
X-Received: by 2002:a17:907:724a:b0:ac1:e00c:a561 with SMTP id a640c23a62f3a-ac2b9de5016mr650108566b.18.1741720959956;
        Tue, 11 Mar 2025 12:22:39 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988bd34sm976220466b.140.2025.03.11.12.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 12:22:38 -0700 (PDT)
Message-ID: <f8fa68cf-e3fc-4718-9757-0603ae9162da@gmail.com>
Date: Tue, 11 Mar 2025 20:22:37 +0100
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
 <f1819943-ab2e-4a37-a4be-88a4a5f42437@gmail.com>
 <19584be9c55.108643cd88202.3290837959889396813@mcqueen.au>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <19584be9c55.108643cd88202.3290837959889396813@mcqueen.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/11/25 11:27, Craig McQueen wrote:
> On Mon, 10 Mar 2025 05:50:23 +1100 Jacek Anaszewski  wrote:
>   > On 3/9/25 12:33, Craig McQueen wrote:
>   > > On Sat, 08 Mar 2025 04:10:49 +1100 Jacek Anaszewski  wrote:
>   > >   > On 3/7/25 17:50, Jacek Anaszewski wrote:
>   > >   > > Hi Craig,
>   > >   > >
>   > >   > > On 3/6/25 23:55, Craig McQueen wrote:
>   > >   > >> If the text "default" is written to the LED's sysfs 'trigger' attr, then
>   > >   > >> call led_trigger_set_default() to set the LED to its default trigger.
>   > >   > >> ---
>   > >   > >>   drivers/leds/led-triggers.c | 5 +++++
>   > >   > >>   1 file changed, 5 insertions(+)
>   > >   > >>
>   > >   > >> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>   > >   > >> index b2d40f87a5ff..f2bc3bb5062d 100644
>   > >   > >> --- a/drivers/leds/led-triggers.c
>   > >   > >> +++ b/drivers/leds/led-triggers.c
>   > >   > >> @@ -54,6 +54,11 @@ ssize_t led_trigger_write(struct file *filp, struct
>   > >   > >> kobject *kobj,
>   > >   > >>           goto unlock;
>   > >   > >>       }
>   > >   > >> +    if (sysfs_streq(buf, "default")) {
>   > >   > >> +        led_trigger_set_default(led_cdev);
>   > >   > >> +        goto unlock;
>   > >   > >> +    }
>   > >   > >> +
>   > >   > >>       down_read(&triggers_list_lock);
>   > >   > >>       list_for_each_entry(trig, &trigger_list, next_trig) {
>   > >   > >>           if (sysfs_streq(buf, trig->name) &&
>   > >   > >> trigger_relevant(led_cdev, trig)) {
>   > >   > >
>   > >   > > Makes sense for me, this would be the second half of the feature that is
>   > >   > > now available only from DT level.
>   > >   > >
>   > >   > > Reviewed-by: Jacek Anaszewski jacek.anaszewski@gmail.com>
>   > >   > >
>   > >   >
>   > >   > But after re-thinking it - we need to return -EINVAL in case
>   > >   > LED class device does not define default trigger, so that the user
>   > >   > had proper feedback.
>   > >   >
>   > >   > So, led_trigger_set_default() needs to be extended to return error
>   > >   > in case of !led_cdev->default_trigger or !found.
>   > >
>   > > In systems I've worked on, some LEDs have a default trigger, while others don't. I.e. it seems normal for an LED to have a default trigger of "none". I don't think of this as an error condition, but a normal operation to set an LED's trigger back to "none".
>   > >
>   > > The not-found case is an interesting corner case. It might be that a kernel module that provides a trigger is presently not loaded, so the trigger is not currently available -- but will be available if the kernel module is loaded again.
>   >
>   > Fair enough.
>   > It would be good to add this description to the entry related to
>   > "trigger" file in Documentation/ABI/testing/sysfs-class-led.
>   
> 
> I tried to update that document. But I wasn't sure what the required
> format is, when I'm not adding a new attribute but (slightly) modifying
> the behaviour of an existing attribute. Should I add a note to the existing
> /sys/class/leds/<led>/trigger description, or should I add a new

Just extend existing documentation of the /sys/class/leds/<led>/trigger
file. The intention is to provide a description of the new use case
you're adding for that file.

Now I've come to the conclusion, that led_trigger_format() should add
also "default" as of the strings accepted by the file on write,
similarly as it adds "none". However "default" would never be displayed
in brackets, as the selected one of course. Instead the exact default
trigger or "none" would be put in brackets, as it is done currently.

That way it would be self-documenting from the user perspective.

> /sys/class/leds/<led>/trigger entry at the bottom of the document,
> describing the modified behaviour?
> 

-- 
Best regards,
Jacek Anaszewski


