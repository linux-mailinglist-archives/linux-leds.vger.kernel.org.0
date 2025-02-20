Return-Path: <linux-leds+bounces-4015-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343BA3D644
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 11:16:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16D2817B9C8
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 10:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D2C1F03E8;
	Thu, 20 Feb 2025 10:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVNMrGyc"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FBE1F03E5
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 10:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046554; cv=none; b=dA31cOjCF+yteu0ZKjjVVykdhbp5VPhtVf71903mK+ulkDclre+H1iLZilF34aPGHRzmR1O5SMWN/yJg7g4wcVVioftGIchyQ3gSOr5Ta3LBQP1s9cWlzEtOQpPlaS1gVHTHIeUAqj1JRerkIrkKisRXur8M7OHPFYSXS/f2bmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046554; c=relaxed/simple;
	bh=9NdHty/qXXHevrqZTlhaGK+GjngNvreBPr3m97uQbS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1201A6pXy6uKxJnLJqR0JYB9N4PidEl3e3oZRPlsBXXfW/+A8ApeQt+gkHwi7QZBwjw2C0oOLMKoak3zJrdX62P+XS1SgSeWJ7EnRLj9D0vqGv+qwFqG4zAZ9rWHgjmeRhZAkwbaypca9swHUpnmMNjuLqDwS44irQPpZwx254=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WVNMrGyc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740046551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0lOieDFJGuf9n9Z9p1RYtcsNxHaDLi5VEtVsV6J0yw=;
	b=WVNMrGyczXomSmi6VAI1U0PDIZiWrvJHeikJYJEdPka+P7bcmeNY2bxgI4CTdfW9kAhpFJ
	qGHSEQMIY0X4uq4qdYEp6FmUAMBHS/yyIHnJpuaOKHze9SgAQr2u0aTeHLRFBghF4Efy+i
	pAfB1REOAtBqntTF02yQbZqB9xHSHOw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-cuH1XyS8Nj68o2eE6sbFnA-1; Thu, 20 Feb 2025 05:15:49 -0500
X-MC-Unique: cuH1XyS8Nj68o2eE6sbFnA-1
X-Mimecast-MFC-AGG-ID: cuH1XyS8Nj68o2eE6sbFnA_1740046549
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ab7f6f6cd96so138080766b.2
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 02:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046548; x=1740651348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0lOieDFJGuf9n9Z9p1RYtcsNxHaDLi5VEtVsV6J0yw=;
        b=lQY228SlrAl8dpf9SOurVANkeyQV2kvy6jr8afMXxnuinh1bJ5BZayCHCn3v2rC526
         tJwnxQzPSCKxwG1/p5rtqkvMsS6suNbR8v6giMBQQ5GHUkAOPXLFKl+vm27vmWHd66aZ
         4EyK9syMU4RW76AIoD3WSztmmRVLlLYLs9y9Vdwl2wkJ+jAbh33VjTbs4J9WD7YauPbX
         h2WGLoz8IAP5djs86v1TJnUhed/0yOHuAFBAVHFhy94ZWxZ8FQ10M26fCj/E1r/cptMW
         KwrDVnsCrDUgQeC9xoQbdxl38x651CLl6vyHKG76kRh9ygPqtm3MJ+OynNol+4WMnp/C
         lqyg==
X-Gm-Message-State: AOJu0Ywi50347JgRexQqaUscBM9dSyWsjs0QaJ9RxTMXbSM9b82X2bMO
	3SwE9DDaBR0xUjZVww7lTGVF67gkWa07WgedFatjlEJD2HcJ02G9tMvCik6c+btIm90no87W1wl
	oVqOpJEQ5yhdyt9AXOv3FDKxjs+h2mihS9SPuTPv6pcFMXIzJr7rAW5bO/1U=
X-Gm-Gg: ASbGncsy419LFByIXIZBo48WIAeUaIGIWGZSDSVeUr6VpukntksmXZKlDztwCkXrOLV
	Ce88TsYQv/1WP61aUzDFa9u9+yMVFjdhsVggzpQFfxOxNEFjRq7K8gCA7VRzeqfsz1LAyuT76J2
	KkVjxsR9AEYjFRTbdL35xs25UMchWAm7C/g+Ax//CSCczr+kg11+sp34aNqDSRdHwLs9xG81j0T
	TFDv/nf4PVLNDWmivW1hYOMdGceH524T20mZ3VL5yLL2IQ/v1KOBmajucDvIeIzXE/tSk75OxSM
	JV2EfLu4Za56lnZRy9WCRTIsh9lyRrk9YTXl7aMUryceDo24TEVCJaoMCQHjLo1huScUDFbue2h
	soYzjuwxpd+BjnUPE+USedgn4OB3b43qQkaH8s+5K+kZ7XlJMVF5k1KU=
X-Received: by 2002:a17:907:890d:b0:ab7:b589:4f9e with SMTP id a640c23a62f3a-abbf3cb9821mr204653666b.39.1740046548563;
        Thu, 20 Feb 2025 02:15:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsci5hMHI8bHshKq0WmvJmdBW2u6ItgvalIOqwsQQPyPAwE35l+KG7VmzL+LgVw3fVRYVE0A==
X-Received: by 2002:a17:907:890d:b0:ab7:b589:4f9e with SMTP id a640c23a62f3a-abbf3cb9821mr204650166b.39.1740046548098;
        Thu, 20 Feb 2025 02:15:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8915db0dsm908550666b.145.2025.02.20.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:15:47 -0800 (PST)
Message-ID: <56f42c2e-94e9-4cb8-8046-2b9ef02995e0@redhat.com>
Date: Thu, 20 Feb 2025 11:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Fix LED_OFF brightness race
To: Remi Pommarel <repk@triplefau.lt>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <26a2690e77671cfe687c5614613fbb6f079f7365.1739959820.git.repk@triplefau.lt>
 <e8ab8707-5ed3-44e6-b52b-a1d6131e7c51@redhat.com> <Z7br2g8Rc9Tkcsle@pilgrim>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z7br2g8Rc9Tkcsle@pilgrim>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Feb-25 9:46 AM, Remi Pommarel wrote:
> On Wed, Feb 19, 2025 at 12:52:36PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 19-Feb-25 11:41 AM, Remi Pommarel wrote:
>>> While commit fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
>>> successfully forces led_set_brightness() to be called with LED_OFF at
>>> least once when switching from blinking to LED on state so that
>>> hw-blinking can be disabled, another race remains. Indeed in
>>> led_set_brightness(LED_OFF) followed by led_set_brightness(any)
>>> scenario the following CPU scheduling can happen:
>>>
>>>     CPU0                                     CPU1
>>>     ----                                     ----
>>>  set_brightness_delayed() {
>>>    test_and_clear_bit(BRIGHTNESS_OFF)
>>>                                          led_set_brightness(LED_OFF) {
>>>                                            set_bit(BRIGHTNESS_OFF)
>>> 					   queue_work()
>>>                                          }
>>>                                          led_set_brightness(any) {
>>>                                            set_bit(BRIGHTNESS)
>>> 					   queue_work() //already queued
>>>                                          }
>>>    test_and_clear_bit(BRIGHTNESS)
>>>      /* LED set with brightness any */
>>>  }
>>>
>>>  /* From previous CPU1 queue_work() */
>>>  set_brightness_delayed() {
>>>    test_and_clear_bit(BRIGHTNESS_OFF)
>>>      /* LED turned off */
>>>    test_and_clear_bit(BRIGHTNESS)
>>>      /* Clear from previous run, LED remains off */
>>>
>>> In that case the led_set_brightness(LED_OFF)/led_set_brightness(any)
>>> sequence will be effectively executed in reverse order and LED will
>>> remain off.
>>>
>>> With the introduction of commit 32360bf6a5d4 ("leds: Introduce ordered
>>> workqueue for LEDs events instead of system_wq") the race is easier to
>>> trigger as sysfs brightness configuration does not wait for
>>> set_brightness_delayed() work to finish (flush_work() removal).
>>>
>>> Use delayed_set_value to optionnally re-configure brightness after a
>>> LED_OFF. That way a LED state could be configured more that once but
>>> final state will always be as expected.
>>>
>>> Fixes: fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
>>> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
>>
>> Thanks, patch looks good to me:
>>
> 
> Actually two additionnal remarks here. The first one is that now more
> than before, delayed_set_value store should be seen before work_flags
> modification on other CPUs. That means that a smp_mb__before_atomic()
> is needed before the two set_bit().
> 
> The second one is that delayed_set_value can be bigger than a single
> byte, so theoretically store tearing can happen and
> set_brightness_delayed_set_brightness() could be called with an invalid
> value. WRITE_ONCE/READ_ONCE could prevent that but because the
> smp_mb__before_atomic() ensures that the "last" delayed_set_value is
> valid I don't mind having very seldom intermediate invalid values.
> 
> So I think a v2 with smp_mb__before_atomic() is needed here, what do you
> think ?

Doing a v2 with smp_mb__before_atomic() sounds good to me.

Regards,

Hans


