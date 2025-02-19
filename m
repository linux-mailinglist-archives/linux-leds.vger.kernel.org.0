Return-Path: <linux-leds+bounces-3998-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2796A3BD81
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 12:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A283AD3E8
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 11:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8332A1DE4F8;
	Wed, 19 Feb 2025 11:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etCCUItu"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624B286291
	for <linux-leds@vger.kernel.org>; Wed, 19 Feb 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965966; cv=none; b=hGQZEhA31YLRwwVVoxz00sCI+vW4lYcjBAQhuGvxoumAZJm3ZUBXi8yLkQ+DbQWmr9qXGSWDlcekXdePuqMor47l698RY1u6+hCgHQ6Cfm62ZaT3JasXZSUnFTPQeqnDYG50CpHyfCKSyuIwqA62JEohY6PAOJlq1eVjz8Wooeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965966; c=relaxed/simple;
	bh=DmpRWBvTeHpMLmcLB30Y78LsSa726ehxRbtI3Q0bpdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kov6pqruf9ZJZmCvWMZ9ajklhRdLQfUoLDZ1WCH25iUv7FWtW/yfn0B4Xb07H3FihFCDpUe5f1v7f5NFdJthRxdqBLWhHgsgAQlzID2wBB5l5ae5LR/dhdcZryjGIKUZ98HV6i/4AUqf0Y4jFXI7O02zgPskyeEAXnUs/s9ot0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etCCUItu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739965961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0l43jcuRTe/JnKpnujNfpMjKKdPC1RsFhRXjnYVGt9o=;
	b=etCCUItuF6W8OC1DWg9h/gnfOgCquvEFAPfJDsp7KrWWSIZ4Zp7sG9kRa9+SGPk1mvhX5U
	JndUFf1k4PzZDBTlAICyCHO0WpTBkUXyZw1QuCp5TuIs+eeknY7KIb8yXvrAJdYH7NHhqo
	fEo+uiRIsAzwy9Xc1zf8/8GtfEZbE0U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-m6jlas9sN3-TgI-K7gPgjA-1; Wed, 19 Feb 2025 06:52:40 -0500
X-MC-Unique: m6jlas9sN3-TgI-K7gPgjA-1
X-Mimecast-MFC-AGG-ID: m6jlas9sN3-TgI-K7gPgjA_1739965959
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so816515566b.2
        for <linux-leds@vger.kernel.org>; Wed, 19 Feb 2025 03:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739965958; x=1740570758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0l43jcuRTe/JnKpnujNfpMjKKdPC1RsFhRXjnYVGt9o=;
        b=VTGQnLvb3Hf5OF2P1ZvMoZ2FDFHptXel/Jn5sWUms/n37SMGv3MIT6K29aBi3B94X1
         w72dwhZBzMjdP0pWSFbat2h8PfWc6DguhgBslhB92r+GzeM5Pq7+DEd5HjZ87PjJDgUq
         bmD+dNFjSSNch7eWJq+YeVj0K9N3pOZg6GKLN36xW+zIxCJEMZvYe+NSVxsUO+8bzUr8
         Bd6NfPzUl4PMQVfVEcEP9jKbvy/lxw7ahBal24c7t7c/BevMLl1S+BY/kyPrp0P2v+NE
         3Fjv4oT25DkoRsEA0N29fKrAsjVbRShMOuDB0NH/vNq971StldiQUFLOdYdLUh0UsGJS
         z02w==
X-Forwarded-Encrypted: i=1; AJvYcCX0CsImr2mukVPXp+jyhxzKK7Fd0NVklXuqpmXFMi73rL/c6K1Wy97rqmXXL5Xb2QXvcFseUwItjzii@vger.kernel.org
X-Gm-Message-State: AOJu0YxFx/mCFTkoAULi8TbTc2SLlIUyoTW+3u6dschBgQxa1quRYpCK
	OB8wyYc8e/suPmfj+eaI11O6q1+Q1q5jGAkWyDAVXZyLJzeF1nLw0xqMCsPHXCgJprH5r8iB7o7
	Vj7k2D2Np8948l+xOWyHuIgqOGuc1jUOEiIRdfovQ0Ts0EdJBzudNFT/J5XfPmMWcIW8=
X-Gm-Gg: ASbGncvRqWnMJwkxUynQI+V6sx6WbcHM5bUrQmSxAsxym8iJzNFKzwIVxeYrtKFFl/R
	Ctuk2b2e41s6xCCn10Ff+IQAGn6QEAUVdx4K7Lk2BdsSbp58xPr/R/DURjaD1Ftls5rU96H/u+u
	tt7Q9WgIH22Qnmy2x3vJYz0ijcUZIePp46bXxkyBXBFdRHW8txYh8slxXMU3D1ZwkMBNSoRooxS
	Q+n/v3/YkvRMKGP7TvsbTDzeKIDboQtyeUBf5KirihYNh0+K+lK1ZOB0leAncuWsilu0LwAz0xb
	yQCv9VPtPdKNyOFYR8gcxJYZAz9c8bhtLBtEiD0XXmOhIfID7JdHpuN3vJOcx+c+RXbiMMVzQwB
	i4kBMcp4sP4CCQ8AulpQEMMbfegjsjnbUoej5nDHhATyyz0XW6GBKBM4=
X-Received: by 2002:a17:906:3290:b0:ab7:d801:86a7 with SMTP id a640c23a62f3a-abb709837ebmr1502584666b.3.1739965958240;
        Wed, 19 Feb 2025 03:52:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCQf4tBgGYTYh6uqafk9PkVwhUXMuHaCdHzZmEclHc14qn06Xn+1RCAKn6mVZCHH6IY18n2w==
X-Received: by 2002:a17:906:3290:b0:ab7:d801:86a7 with SMTP id a640c23a62f3a-abb709837ebmr1502583166b.3.1739965957805;
        Wed, 19 Feb 2025 03:52:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba19bd1dbsm517666666b.30.2025.02.19.03.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 03:52:37 -0800 (PST)
Message-ID: <e8ab8707-5ed3-44e6-b52b-a1d6131e7c51@redhat.com>
Date: Wed, 19 Feb 2025 12:52:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: Fix LED_OFF brightness race
To: Remi Pommarel <repk@triplefau.lt>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <26a2690e77671cfe687c5614613fbb6f079f7365.1739959820.git.repk@triplefau.lt>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26a2690e77671cfe687c5614613fbb6f079f7365.1739959820.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Feb-25 11:41 AM, Remi Pommarel wrote:
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
> final state will always be as expected.
> 
> Fixes: fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> While the race does seem to be very thin, it is very easy to trigger it
> on my setup with the following command:
> 
>  $ echo "pattern" > /sys/class/leds/<device>/trigger
>  $ echo "3 200 40 200 3 200 3 200" > /sys/class/leds/<device>/pattern
>  $ sleep 1
>  $ echo 0 > /sys/class/leds/<device>/brightness
>  $ echo 30 > /sys/class/leds/<device>/brightness
> 
> The issue happens 8 out of 10 times, not sure why this is the case,
> maybe two consecutive set_bit() on one CPU are likely to appear as
> one just after a previous test_and_clear_bit() on another due to
> the full memory barrier implied by this atomic operation ?
> 
>  drivers/leds/led-core.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index f6c46d2e5276..528f53bf13a9 100644
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
> @@ -331,10 +342,11 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
>  	 * change is done immediately afterwards (before the work runs),
>  	 * it uses a separate work_flag.
>  	 */
> -	if (value) {
> -		led_cdev->delayed_set_value = value;
> +	led_cdev->delayed_set_value = value;
> +
> +	if (value)
>  		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
> -	} else {
> +	else {
>  		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
>  		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
>  		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);


