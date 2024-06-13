Return-Path: <linux-leds+bounces-1895-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0F907480
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9CAF28165B
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6338273FC;
	Thu, 13 Jun 2024 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkXvFmC+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE4C8C7
	for <linux-leds@vger.kernel.org>; Thu, 13 Jun 2024 14:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287323; cv=none; b=C775+u4VuKPLggzf1tep0eX/hRf+GecfvyOruuODEQPjMKzMA/y5Gs6MaT3XI2q4URkeFAcwZ8Uqg/tjB+N3IT+S+Bt0Jy/GOc7hBRbxxWqu8F+w4WrkQiqXhfJkUt33jYa86ftgZ98CI+HeDoVbj9EEDL8bQ3YxBzd8dFe26ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287323; c=relaxed/simple;
	bh=4kWri0Hbcwh5byTTiW1BMVCPQOSUZ1vJUenp+9AeVJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCRaUkAuOnkYEkhj9NmKZnpNHcYTXvbzuzZywMZ7Bg8eKpnwsubwzPXXuix4hc92H+nxFcO89H4fA5RVAugoohpmhZB6BR3W71P2CsG/d+lrk1fbyy1eHC4SjRPDvosCQVTYY5exJ61uYyOO+r2ZgQgFOtfY26ONrvZ9BqK5tuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkXvFmC+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C57AC2BBFC;
	Thu, 13 Jun 2024 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718287323;
	bh=4kWri0Hbcwh5byTTiW1BMVCPQOSUZ1vJUenp+9AeVJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkXvFmC+gDj3BhZS9nyDEjnDB0d4WqidKZ8cd702eOOfo0uML0qtOqu2MCHRAogKa
	 ErouRjgcVoIzNsYMrir3EI8N/Iw7OKHMGxN3pgryjCqKWu3H1bjUCgWeBR3hO+D31P
	 RUo0DPURZx//RWMiwOf2uwrCWWYOJyO6ziUpYrfWLLlE1fOzyuVttwV+wSvD0btKk1
	 VcHv6n1XUQuXLqzzhcExp1pP+stRodK56ZqTcF7EKO/u/VunlV9091KZBWqOiZck6V
	 KlU4aub0KMM/uK4tZhBWkx07YJlUrQh1aQTBLLt2DifK+RytM2UEpaofTNvUcuaebl
	 ExsAdRNSvGchQ==
Date: Thu, 13 Jun 2024 15:01:59 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [RFC 1/2] leds: trigger: input-events: Replace led_on with a
 flags field
Message-ID: <20240613140159.GD2561462@google.com>
References: <20240601195528.48308-1-hdegoede@redhat.com>
 <20240601195528.48308-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240601195528.48308-2-hdegoede@redhat.com>

On Sat, 01 Jun 2024, Hans de Goede wrote:

> Replace the led_on boolean with a flags field, using bit 0 for FL_LED_ON,
> this is a preparation patch for adding further flags.

I'm generally okay with the principle.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/leds/trigger/ledtrig-input-events.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-input-events.c b/drivers/leds/trigger/ledtrig-input-events.c
> index 1de0176799f9..94d5580ea093 100644
> --- a/drivers/leds/trigger/ledtrig-input-events.c
> +++ b/drivers/leds/trigger/ledtrig-input-events.c
> @@ -17,14 +17,16 @@
>  
>  #define DEFAULT_LED_OFF_DELAY_MS			5000
>  
> +/* To avoid repeatedly setting the brightness while there are events */
> +#define FL_LED_ON					0

FL is non-obvious.

FLAGS_LED_ON?

> +
>  struct input_events_data {
>  	struct input_handler handler;
>  	struct delayed_work work;
>  	spinlock_t lock;
>  	struct led_classdev *led_cdev;
>  	int led_cdev_saved_flags;
> -	/* To avoid repeatedly setting the brightness while there are events */
> -	bool led_on;
> +	unsigned long flags;
>  	unsigned long led_off_time;
>  	unsigned long led_off_delay;
>  };
> @@ -42,7 +44,7 @@ static void led_input_events_work(struct work_struct *work)
>  	 */
>  	if (time_after_eq(jiffies, data->led_off_time)) {
>  		led_set_brightness_nosleep(data->led_cdev, LED_OFF);
> -		data->led_on = false;
> +		clear_bit(FL_LED_ON, &data->flags);
>  	}
>  
>  	spin_unlock_irq(&data->lock);
> @@ -95,10 +97,9 @@ static void input_events_event(struct input_handle *handle, unsigned int type,
>  
>  	spin_lock_irqsave(&data->lock, flags);
>  
> -	if (!data->led_on) {
> +	if (!test_and_set_bit(FL_LED_ON, &data->flags))
>  		led_set_brightness_nosleep(led_cdev, led_cdev->blink_brightness);
> -		data->led_on = true;
> -	}
> +
>  	data->led_off_time = jiffies + led_off_delay;
>  
>  	spin_unlock_irqrestore(&data->lock, flags);
> -- 
> 2.45.1
> 

-- 
Lee Jones [李琼斯]

