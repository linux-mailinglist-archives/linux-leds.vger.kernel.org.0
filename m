Return-Path: <linux-leds+bounces-7600-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIhxAveZy2kcJgYAu9opvQ
	(envelope-from <linux-leds+bounces-7600-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 11:55:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EC3676D0
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 11:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 962E0301C8C0
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 09:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABA73ED5B7;
	Tue, 31 Mar 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP2y0eY0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E513ECBF9;
	Tue, 31 Mar 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950455; cv=none; b=cWNXAsTKJAAdyHSBK6MhGhFV9+f2PRA07RUwtZSpRCj6/nQxvwlTGDVYSXHSsynQ3FavoVUWuKlvXDOe5HObyDy6r5wB7Frxg3qylVX8mN4O9petuJniqtFAsQ59kiGwLrw6gqLdwh0w2gcbQMseMUezRDAQNlZxS/nOyXEnRNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950455; c=relaxed/simple;
	bh=EcX0Yg4bZkI1v+jjGy4d1d1Mla2TQPnb8PUkaf26FjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3ZJ5y2mRknSZ3XmYWyvBcbHYnBeX8BAl6wHoHtyas3LkAU/pU0Jli6KplAKP58tK1JOGXWkbHRfyN567Hb1mkoiNPQVrwhC/FOhEZTWFktdSP9KnXz6NlwykHCdA9A9bzDqjZg3aBiVsDWzbw+0aeka8F04WmbaJLPqToJbsfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP2y0eY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643B2C2BCB0;
	Tue, 31 Mar 2026 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774950455;
	bh=EcX0Yg4bZkI1v+jjGy4d1d1Mla2TQPnb8PUkaf26FjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RP2y0eY0KOxDZBQhLz2vZ8GqbL8F4Nv+l9iMGljdVJYPlnMdojRv/2Jzn6Vic4EwA
	 Z5L3/W16X3+UZm8gpXwJbpqlt3M19qb31YqqYtSYW/v7hEqithqKJKa88BdaVjuHJy
	 lPLEp5mC9PnNK5N9ZHRj3XHAzxPa4mplGNVnDRcDMQXFQq5EaGljHf78fbh/37d3IE
	 O9ua1LfvYFwx5covCEt+o/H3NErfPl7UQQbY8OMSFzbd8Lw+Kgz77UP2iMEVTLoFD/
	 EEJxN/WlUQS7iskP9lQEC0GEEtaFIFgeifjVcyaXe4NZqCTz5VSMClRLANSpZQ/EVT
	 7ZIT8pzm89y1Q==
Date: Tue, 31 Mar 2026 10:47:30 +0100
From: Lee Jones <lee@kernel.org>
To: Tobias Deiminger <tobias.deiminger@linutronix.de>
Cc: pavel@kernel.org, eajames@linux.ibm.com, j.weitzel@phytec.de,
	riku.voipio@iki.fi, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: pca9532: don't stop blinking for non-zero
 brightness
Message-ID: <20260331094730.GC3241346@google.com>
References: <20260321102121.1563365-1-tobias.deiminger@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260321102121.1563365-1-tobias.deiminger@linutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7600-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Queue-Id: E64EC3676D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026, Tobias Deiminger wrote:

> pca9532 unexpectedly stopped blinking when changing brightness to a
> non-zero value. To reproduce:
> 
>  echo timer > /sys/class/leds/led-1/trigger   # blinks
>  echo 255 > /sys/class/leds/led-1/brightness  # blinking stops, light on
>  cat /sys/class/leds/led-1/trigger            # still claims [timer]
> 
> According to Documentation/leds/leds-class.rst, only brightness = 0
> shall be a stop condition:
> 
> > You can change the brightness value of a LED independently of the
> > timer trigger. However, if you set the brightness value to LED_OFF it
> > will also disable the timer trigger.
> 
> Therefore add a guard to continue blinking when brightness != LED_OFF,
> similar to how pca955x does it since 575f10dc64a2 ("leds: pca955x: Add
> HW blink support").
> 
> Signed-off-by: Tobias Deiminger <tobias.deiminger@linutronix.de>
> ---
> 
> Notes:
>     A more advanced solution was to not simply return early on
>     set_brightness, but actually support blinking at arbitrary brightness.
>     This would however require conditional fallback to SW blinking, since
>     PCA 9532 doesn't support routing PWM 0 (dim) and PWM 1 (blink) in
>     series. The bugfix here keeps it simple. Optional SW blinking could be
>     tried in a separate patch.
> 
>  drivers/leds/leds-pca9532.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 0344189bb991..3de20e087334 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -184,6 +184,8 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
>  
>  	if (value == LED_OFF)
>  		led->state = PCA9532_OFF;
> +	else if (led->state == PCA9532_PWM1)
> +		return 0; /* non-zero brightness shall not stop HW blinking */

Comments should start with a capital letter.

Also, as the final 'else' statement uses braces, should we perhaps take the
opportunity to add braces to all branches of this conditional block?

>  	else if (value == LED_FULL)
>  		led->state = PCA9532_ON;
>  	else {
> 
> base-commit: b2c87f5e98cd88095dbc6802197526703d5e4e48
> -- 
> 2.47.3
> 
> 

-- 
Lee Jones [李琼斯]

