Return-Path: <linux-leds+bounces-8027-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOAwBJl+/GnXQgAAu9opvQ
	(envelope-from <linux-leds+bounces-8027-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:59:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C93C4E7DF6
	for <lists+linux-leds@lfdr.de>; Thu, 07 May 2026 13:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6549A3001A54
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2026 11:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7E3EC2CA;
	Thu,  7 May 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoeV5LsB"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7D73DCD9A
	for <linux-leds@vger.kernel.org>; Thu,  7 May 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155151; cv=none; b=Iz8H/c8rWU1nPS3LAN/024ISxQfeU2KHcdBcfu/SQ+uF4Ss+8u/mSlcIObb42Zt9yGYAr/cP3/wDIdNr3+5LYv44HCmA/xBk+LobWjUIT1VaPYJOcesvRMhIb2+itf/qYmucDSVyMqRXCiId4KmpvTe0QGx/O/BYlPoRJ+CEoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155151; c=relaxed/simple;
	bh=72k8zF2LRM8TqLBoZ9B4gJ5JpYdx4ik3Zp/1hgMnqbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRcMTzAAw/4yb9tC4lbrWS6AiEezhpyYr/IIB+22SwoFuTQqD3dYJuNa19C8/PaoHot5XU0POwHkdndfQPd3uYAWsTjq6av5o1OSzeQljHyVaiRJL/azUOeaHwtq6XhI1xDN1eRYz87Uqz9lC21hXz74U1Ssiul8DkpuITy2DYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoeV5LsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2241FC2BCB2;
	Thu,  7 May 2026 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778155150;
	bh=72k8zF2LRM8TqLBoZ9B4gJ5JpYdx4ik3Zp/1hgMnqbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoeV5LsBkK9EUIz7GeNudJkW588zQUqOgePddRE3mUeIJ/Z4/ZJPMfQ6I4/qV4j7N
	 Z2NQbrfdEOaZzHlxvlrc/5Bhn5wWwC1Uh3emHS1FFem2WyGrRDwXiuyLxYAMCbMx2s
	 MXpwWDqNS/gnuRWmkB7JhSoftVaGeITanfKvlkX/ikkVDFMNE/6gqouKdyOJNwQE/G
	 KdsRePhmWkvAPCeoflGBrKG77u20gbm/lWlUmRfgA8LVR3wDrfqf202qYGSSBxTRQP
	 dr1vlm+gaJb0VJIultrOPBd1bIUvBkOjP6lm61UWzg0h+ahI41nDXANxyXJjDzJ66C
	 YBVef3qd5JXbQ==
Date: Thu, 7 May 2026 12:59:07 +0100
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: core: Fix race condition for software blink
Message-ID: <20260507115907.GF305027@google.com>
References: <20260423113638.2079302-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423113638.2079302-1-craig@mcqueen.au>
X-Rspamd-Queue-Id: 3C93C4E7DF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8027-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mcqueen.au:email]
X-Rspamd-Action: no action

On Thu, 23 Apr 2026, Craig McQueen wrote:

> led_set_brightness() function: Change handling of software blink to
> avoid race conditions when stopping blink and setting brightness.
> 
> Triggers may call led_set_brightness(LED_OFF),
> led_set_brightness(LED_FULL) in quick succession to disable blinking and
> turn the LED on. If the delayed work task has not yet disabled blinking
> by the time the second call occurs, then the brightness also needs to be
> changed in the delayed work task.
> 
> Signed-off-by: Craig McQueen <craig@mcqueen.au>
> ---
>  drivers/leds/led-core.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)

I think this needs more eyes on it and to be thoroughly tested by others.

> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 385e78af1dac..073c547068cc 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -303,24 +303,31 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
>  
>  void led_set_brightness(struct led_classdev *led_cdev, unsigned int brightness)
>  {
> -	/*
> -	 * If software blink is active, delay brightness setting
> -	 * until the next timer tick.
> -	 */
> -	if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
> +	if (brightness) {
>  		/*
> -		 * If we need to disable soft blinking delegate this to the
> -		 * work queue task to avoid problems in case we are called
> -		 * from hard irq context.
> +		 * If software blink disable is pending, also queue brightness setting.
> +		 * If software blink is active, delay brightness setting
> +		 * until the next timer tick.
>  		 */
> -		if (!brightness) {
> -			set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> +		if (test_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags) ||
> +		    test_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
> +			led_cdev->delayed_set_value = brightness;
> +			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
>  			queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
> -		} else {
> -			set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
> -				&led_cdev->work_flags);
> +			return;
> +		} else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
>  			led_cdev->new_blink_brightness = brightness;
> +			set_bit(LED_BLINK_BRIGHTNESS_CHANGE, &led_cdev->work_flags);
> +			return;
>  		}
> +	} else if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
> +		/*
> +		 * If we need to disable soft blinking delegate this to the
> +		 * work queue task to avoid problems in case we are called
> +		 * from hard irq context.
> +		 */
> +		set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
> +		queue_work(led_cdev->wq, &led_cdev->set_brightness_work);
>  		return;
>  	}
>  
> -- 
> 2.52.0
> 
> 

-- 
Lee Jones

