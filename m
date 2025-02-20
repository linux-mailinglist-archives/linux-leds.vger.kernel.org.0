Return-Path: <linux-leds+bounces-4021-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D93A3DB63
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 14:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8942D19C1BB7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 13:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89AF288A2;
	Thu, 20 Feb 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gY/zMtGf"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EA1F4262
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740058473; cv=none; b=Zlkf3HmcuVow9GbtEv5HzrUNBqnwylo/0K9CAKDjyG8yvvUqeBSk81SxvRX6GgqnB1Nmcf6+hfDlOXHnMm9xH7QopG+MADZtSdEXF9M3W70ISTkwT0MNfKB1dnJRh7tfWRHK3pRNl9rkm8AxUT5pfriYJOBatqyB9gyD8YntRyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740058473; c=relaxed/simple;
	bh=mbjhWxn0gIHkhae6KcA0uGmiFtPWrkCHtVNUiezRsh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6W//p/QIoaXuQH1RjQ16Qn9o2hC2UBsRcqlPzg7sfsyCb3oBOSEVNNIiiPS1JZuAfR3h1n9ep5ohISDCq3/55eYcKLfiVoFMKBdWHTRWxvHVeArXT+dnuklGQ9agDOt0LX1tnmxuVw/Cn4JAWWsbavyTxQqZ7yHTIQ3gFznpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gY/zMtGf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740058470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpe9Quo1s+SP9DnKsSoyHLlxt0k91X+LXCmw4gTOOKE=;
	b=gY/zMtGfToULZp+pfNPx8Qm08/UoFWNdeODAOPXiIU3WQfTe0kjY/3y/jlXcbGocRBSjX+
	RGoJRCAGMrr9NH7yGtOXdyL9GgRz4a1+0Rr8a+3M+NLOifTCxLzlcnpgvnkgWA/ez38JkO
	jcjYH2JDbGC1Z+PPE0WfL/inq302TFk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-Wh4s8RDAPBmmASUa6mr5Dw-1; Thu, 20 Feb 2025 08:34:29 -0500
X-MC-Unique: Wh4s8RDAPBmmASUa6mr5Dw-1
X-Mimecast-MFC-AGG-ID: Wh4s8RDAPBmmASUa6mr5Dw_1740058468
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5dc5b397109so708601a12.2
        for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 05:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058468; x=1740663268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpe9Quo1s+SP9DnKsSoyHLlxt0k91X+LXCmw4gTOOKE=;
        b=evAj8NhBCAAmDq1P2V4bO7Qhik7iFK/+sswFuI7QHG5WBd8BBnex6BSg7J28KQWuqE
         ujgpPhz0SXLSnrJMdFavChbI4TrvO/GFdcYX7jOugozgKOP4VN1cfHuobWjS7fRWYKc/
         9kJpCec789DUBZnOdKo6TNj9xq7kPBfDjVC/lK672k8mfUDsKTs6R6yOC6vZFuainfE/
         SIethTTCv4H6bDq8pcAB00jVaXBXGWRR0Z+N6B8rB/Z/VXCNTAYUSjx4G5OA/L+g8es4
         7TAUR7AgbzbsE/Dft8uBddjqcuh9/TyJwmng60UhdRK+6heQFT3Ad0ydkhVeetmmajX9
         afgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK4E1NESXgoqy4wEV/BxtK4qa4QUQZi1NpWjPF4rvkU11ibaVF0yml/4HfXSjRpiF4OFN8L2Vp3lL1@vger.kernel.org
X-Gm-Message-State: AOJu0YycwZ7ZLY2+cXt2/Dt4RsxrHkH9B803kI7I9cjWEx/s4bOxSNQp
	cB+VeK5dWvVXiEzZDTBdvpihZQvDAzIb7ss45J+hng7GI0rvoy5VUwjL12pPGgb5UaiqAMRJ1jN
	VqdDvqwtNfMsndc93uGvvnko7zT2t0j6byzbZhcgNV2AQJ7yNESSj5baxqU4=
X-Gm-Gg: ASbGncvM7q8zIJKZBNpGCZK9JzI0AiqKat9sRc83YbQxaHaqwXusEV2GFrnIUdSrjs4
	w+U5U9ZJUhqOaCIiro5uNrLaZ3dFvokuB9iOddgtAjhSRxRtj9qfoKCneGFTAFDYYI5w7BMdMUp
	24OIyV5dBV7NHw4fe4LJQrDOIGwznwhj6N1L3IGc2mVwsSWPpA0ScWzpaITiN08NV0ek92R9aQH
	9Mo6wyPZ/E1VSzbO9XTNW+ZHxTKdJO8ow3n96LHSnJuLqWFi7HAyDwqGbkLFdesTilq9N7XKfvg
	xJfCZyY9lhVDEK5QEvjwsVxWW/waB0fDQvhqv1l+5aQXFlyCW2qNUwmL2806cDVtZ5tnbCaNsF8
	4ii/3eIe4w9CmG+qYdkYCCnacuJ1PCRzWmUDa+WpzH+pyzgsaMomcdzI=
X-Received: by 2002:a05:6402:50c8:b0:5dc:a44d:36bd with SMTP id 4fb4d7f45d1cf-5e089521896mr6687201a12.8.1740058468227;
        Thu, 20 Feb 2025 05:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrMMvpdIYDE0hc305IFelUzPFSffEQITX4Pg3cxW3iLkAuxxVeDMxJdbM0acd4ZLXs4W5Idg==
X-Received: by 2002:a05:6402:50c8:b0:5dc:a44d:36bd with SMTP id 4fb4d7f45d1cf-5e089521896mr6687181a12.8.1740058467789;
        Thu, 20 Feb 2025 05:34:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm12058464a12.58.2025.02.20.05.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:34:26 -0800 (PST)
Message-ID: <80041ba8-0791-488e-a2d6-f66ac6c51393@redhat.com>
Date: Thu, 20 Feb 2025 14:34:25 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] leds: Fix LED_OFF brightness race
To: Remi Pommarel <repk@triplefau.lt>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <19c81177059dab7b656c42063958011a8e4d1a66.1740050412.git.repk@triplefau.lt>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <19c81177059dab7b656c42063958011a8e4d1a66.1740050412.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Feb-25 12:23 PM, Remi Pommarel wrote:
> While commit fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
> successfully forces led_set_brightness() to be called with LED_OFF at
> least once when switching from blinking to LED on state so that
> hw-blinking can be disabled, another race remains. Indeed in
> led_set_brightness(LED_OFF) followed by led_set_brightness(any)
> scenario the following CPU scheduling can happen:
> 
>     CPU0                                     CPU1
>     ----                                     ----
>  set_brightness_delayed() {
>    test_and_clear_bit(BRIGHTNESS_OFF)
>                                          led_set_brightness(LED_OFF) {
>                                            set_bit(BRIGHTNESS_OFF)
> 					   queue_work()
>                                          }
>                                          led_set_brightness(any) {
>                                            set_bit(BRIGHTNESS)
> 					   queue_work() //already queued
>                                          }
>    test_and_clear_bit(BRIGHTNESS)
>      /* LED set with brightness any */
>  }
> 
>  /* From previous CPU1 queue_work() */
>  set_brightness_delayed() {
>    test_and_clear_bit(BRIGHTNESS_OFF)
>      /* LED turned off */
>    test_and_clear_bit(BRIGHTNESS)
>      /* Clear from previous run, LED remains off */
> 
> In that case the led_set_brightness(LED_OFF)/led_set_brightness(any)
> sequence will be effectively executed in reverse order and LED will
> remain off.
> 
> With the introduction of commit 32360bf6a5d4 ("leds: Introduce ordered
> workqueue for LEDs events instead of system_wq") the race is easier to
> trigger as sysfs brightness configuration does not wait for
> set_brightness_delayed() work to finish (flush_work() removal).
> 
> Use delayed_set_value to optionnally re-configure brightness after a
> LED_OFF. That way a LED state could be configured more that once but
> final state will always be as expected. Ensure that delayed_set_value
> modification is seen before set_bit() using smp_mb__before_atomic().
> 
> Fixes: fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
> Changes for v1 to v2:
>   - Use smp_mb__before_atomic().

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/leds/led-core.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f6c46d2e5276..e3d8ddcff567 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -159,8 +159,19 @@ static void set_brightness_delayed(struct work_struct *ws)
>  	 * before this work item runs once. To make sure this works properly
>  	 * handle LED_SET_BRIGHTNESS_OFF first.
>  	 */
> -	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags))
> +	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags)) {
>  		set_brightness_delayed_set_brightness(led_cdev, LED_OFF);
> +		/*
> +		 * The consecutives led_set_brightness(LED_OFF),
> +		 * led_set_brightness(LED_FULL) could have been executed out of
> +		 * order (LED_FULL first), if the work_flags has been set
> +		 * between LED_SET_BRIGHTNESS_OFF and LED_SET_BRIGHTNESS of this
> +		 * work. To avoid ending with the LED turned off, turn the LED
> +		 * on again.
> +		 */
> +		if (led_cdev->delayed_set_value != LED_OFF)
> +			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
> +	}
>  
>  	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
>  		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
> @@ -331,10 +342,13 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
>  	 * change is done immediately afterwards (before the work runs),
>  	 * it uses a separate work_flag.
>  	 */
> -	if (value) {
> -		led_cdev->delayed_set_value = value;
> +	led_cdev->delayed_set_value = value;
> +	/* Ensure delayed_set_value is seen before work_flags modification */
> +	smp_mb__before_atomic();
> +
> +	if (value)
>  		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
> -	} else {
> +	else {
>  		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
>  		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
>  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);


