Return-Path: <linux-leds+bounces-8280-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDmWBM8eD2pSGAYAu9opvQ
	(envelope-from <linux-leds+bounces-8280-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:03:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F755A7DDE
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 695F93237AAB
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 14:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A5B2F4A0C;
	Thu, 21 May 2026 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5jbsdTg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC4340A6F
	for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372353; cv=none; b=kjIDo97SVg0RUbZaKhyCII63K/ApAfolOGx3ViXhd5Fwnu0qxcIXoYc3AUJbNzwfKYqXFdCmsF2+jydZBASnf5Ikcqk750Omzs0OOIsQULATidUJecUA9NQGv22RQdIcgfNTO0VNGjVJ0AjZw/rSqjx6tjYIepC+Qh4ZYHQY6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372353; c=relaxed/simple;
	bh=Qdrj70/7Fw9KpEAD7Q1c+H4tNdtMLmaZEEcLMxmrK38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8DEEj+hIqZEhPqovxE2FSDNGG6pbkqXGwHGaz8xjk1Qfgc6X2gOoFKWmgRMkTYbteqMayCSjih0YxV81AeWTv875Rf3V0VCb3SM29nx3FZWRrE/1QtpUp/B4dWVJmhwa9eg8i5knXWuCQ7D/Mf582Nxc2dpOmK6qR8Q7dtLzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5jbsdTg; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd01481e592so888466466b.2
        for <linux-leds@vger.kernel.org>; Thu, 21 May 2026 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779372348; x=1779977148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPQl7cGyYLeedVT42x9toU1ulCeWeEYHpuhQ0U+w0E4=;
        b=C5jbsdTg2rCu7Yd97r1TiygVK9nFjhp+0iFQKLaAEGWBKEWuWoW3g3VSC0Zh3Iwhfq
         8bwlvFMUQNz+910lV43w9dFkb2m/aEZlqUvHzQ5mVwxgvqekBhFq9XIl4i3ZqeQm4LNb
         nRBtr+5ErmUaHSJ1WGYLTU4cc4m3CNZ0N5z5UUWe+CosYaDVAQHr6QjNKK1YptoVbL77
         f2lTJu9q3Aw3uocC6AVanpdmJeOgRspmNG04GcZP9ymgUoNqGdG7mxARKLTktlIdrSx/
         2Zlowz1c58AYgAoAYXa3uE03VG27SZgsXQPMsf4kqg2t8mUuZ05riwfvbNWlwxwxyhvz
         ykHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372348; x=1779977148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPQl7cGyYLeedVT42x9toU1ulCeWeEYHpuhQ0U+w0E4=;
        b=XK1BdvCNqBFEKp7+iJzfcL6YyW7y0it4hvFU91Jr9VL1IsVLoabg6zTZtk3BFFcuaZ
         sP3hSeaavx19BZw44rQFIbCkNg3ewPPbvIZ7vC8x+OCxth4Jx1ZN1g9ORdyzBGW0yotP
         LE2WnajS8jGdhZheDbTmiGa8R8BtctUgLV5S7PhEM8UGWrcWkBiKXYKqTxtxsc6vN3s/
         g4IxIlQlFt5R+DYkZkFt25d/upVJoLflGikdqGBV57fLLp3RYL6DkBaAlls8aHoWP7TK
         4YB6rL2ZBvbsTht6ezZRsoQh7OWZTFcE3MxV6aQZqXO6xoGeS5s4IlOC82mq0SbHNTNh
         91tg==
X-Forwarded-Encrypted: i=1; AFNElJ8X1OMwJRBiCxvRw5f7XYVurXiSq/951f+PFafl1mQG8nXoCG+bOAGhmaiWrE6JkxaDpc1VktykoVDF@vger.kernel.org
X-Gm-Message-State: AOJu0YyDuLDfn2iXTftzGTdvlZf0aJb3aXVp+eEr0DxOOOhXQVPViP70
	OJ+yUtmJ1o9kSB49wDwNyUqvuo5fn816zffYpeDX5v1NBIuq/OLJopMn
X-Gm-Gg: Acq92OFKTwiITN5aJ8v+Rtiap+jl/L53Ashyu3WX8idh58jVVdJVDRYpYM+xYlQBJvY
	8vdOriy/u95768kCaOzCbkeXKRhUqBD+XpUiLTVX51XL++z3T3urizEjbGQiaEjMi69ve+Zw3Q5
	M6o3Rbc2wgjwiGGl5JJGOYtMPZaASuxG1pTTXltD8a+j6ITD3DIV9HgijGcxLL15L2p92Z0Dtye
	/JnPMfdk4Jq+akMgGgKKiay3fLLtKcecsKF6PUTuEugOjmv6TyzL3boOun1o9rubfRqr+GZWUi0
	W424dw8tS25AqiAt/LbrjfOh1hnLSw58CxvOOFR39IGLXxEI+E2IUdmvu1zVukjFYYXNBbdnSOC
	f9LJKPSjXnX0pLFftRtMGXINKEwFrzqRFtjgQ5XgRaFIw/Ezd6ddD1OSj4wyiVFEaSyjNZIZOs4
	k6SbkIfJ5inCe55Q/N4GsWEwdmEG7QN6+UpMLskw/JOlkUZC0h9fOz4QHn7vvsRY8fdwF3oKtHv
	IThrA==
X-Received: by 2002:a17:907:869f:b0:bd4:b787:cbc1 with SMTP id a640c23a62f3a-bdc13a703f5mr194274366b.12.1779372348026;
        Thu, 21 May 2026 07:05:48 -0700 (PDT)
Received: from PF5YBGDS.localdomain ([163.114.130.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8789134esm51514766b.6.2026.05.21.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:47 -0700 (PDT)
Date: Thu, 21 May 2026 10:05:43 -0400
From: Mike Marciniszyn <mike.marciniszyn@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net: eth: fbnic: Add led support
Message-ID: <ag8RN5-J1peL5xhg@PF5YBGDS.localdomain>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-4-mike.marciniszyn@gmail.com>
 <74576086-f51f-41ef-b0ef-c4e0373a06c4@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74576086-f51f-41ef-b0ef-c4e0373a06c4@lunn.ch>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8280-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikemarciniszyn@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,PF5YBGDS.localdomain:mid]
X-Rspamd-Queue-Id: 69F755A7DDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 10:37:01PM +0200, Andrew Lunn wrote:
> > +/**
> > + * fbnic_set_phys_id - Used to strobe the MAC LEDs in a recognizable pattern
> > + * @netdev: Interface/port to strobe the LEDs for
> > + * @phys_id_state: State requested by the call
> > + *
> > + * This function can really be broken down into two parts. There are the
> > + * ACTIVE/INACTIVE states which really are meant to be defining the start
> > + * and stop of the LED strobing. There is also the ON/OFF states which are
> > + * used to provide us with a way of telling us that we should be turning
> > + * the LED on and/or off.
> > + *
> > + * We translate these calls and pass them off to the MAC layer. They will
> > + * be used to initialize a strobe, then on and off will be used to cycle
> > + * between the patterns, and finally we will restore the original LED state.
> > + *
> > + * We will return 2 when we are requested to go active. This will tell the
> > + * call that it will need to call back to turn on/off the LED twice every
> > + * second.
> > + *
> > + * Return: blink in half second intervals on success, negative value on failure
> > + */
>
> Could you drop this for the moment. Ideally, we want the LED core to
> be implementing this somehow, so that all devices using the core get
> this functionality, rather than put it in every driver.
>

The driver does exploit the LED core.   The actually interface to the
LEDs are simple on/off settings.  The strobing follows the OCP spec
to alternate between the "below" speed color (amber for fbnic) and the "at"
speed color (blue for fbnic).

The only complication is the the CSR bit for the activity LED is 1 implies
off and zero implies on.  The activity LED flashes automatically
based on actual network activity provides it is set to 0 (on).

The return to the LED core gives the count of the number of cycles per
second and each cycle alternates between amber and blue.  The driver
is a slave to the ETHTOOL_ID_* phys_id state from the LED core based
on that timing.

I'm not sure what else would need to go into the LED core?

> > +static int fbnic_led_hw_ctl_set(struct led_classdev *led_cdev,
> > +				unsigned long flags)
> > +{
> > +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> > +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> > +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> > +	u32 supported_modes;
> > +
> > +	supported_modes = fbnic_led_get_supported_modes(fbd, led_idx);
> > +
> > +	if (flags & ~supported_modes)
> > +		return -EINVAL;
> > +
> > +	/* Turn on activity LED only when both the TX and RX flags are set. */
> > +	if (led_idx == FBNIC_LED_ACTIVITY && (flags & supported_modes) &&
> > +	    flags != supported_modes) {
> > +		dev_warn(fbd->dev,
> > +			 "Invalid activity LED mode(s): 0x%lx\n", flags);
> > +		return -EINVAL;
>
> How does this happen? It should be that the core will not ask you to
> do something you cannot do, if you have answered -EOPNOTSUPP in
> fbnic_led_hw_ctl_is_supported().
>

Will need to investigate this.

> > +static int fbnic_led_brightness_set_blocking(struct led_classdev *led_cdev,
> > +					     enum led_brightness brightness)
> > +{
> > +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> > +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> > +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> > +
> > +	mutex_lock(&fbd->led_mutex);
> > +	if (!brightness) {
> > +		fbd->leds[led_idx].enabled_modes = 0;
> > +		fbd->leds[led_idx].strobe_mode = 0;
> > +	} else {
> > +		u32 mode;
> > +
> > +		switch (led_idx) {
> > +		case FBNIC_LED_ACTIVITY:
> > +			fbd->leds[led_idx].enabled_modes =
> > +				BIT(TRIGGER_NETDEV_TX) | BIT(TRIGGER_NETDEV_RX);
> > +			break;
> > +		default:
> > +			mode = fbnic_led_get_link_speed_mode(fbd);
> > +			fbd->leds[led_idx].enabled_modes = mode;
> > +			break;
> > +		}
> > +	}
>
> This looks odd. led_brightness_set() is simply used to set the LED to
> on or off. The netdev trigger will use it to software blink the LEDs
> when asked to do something which cannot be offloaded to the hardware.
>
> And when the LED is being used to show NUMLOCK, or Morse code crash
> dump, network activity should not intervene.
>

Will need to investigate this.

> > diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> > index 53b7a938b4c2..c6b1130f9159 100644
> > --- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> > +++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
>
>
> > @@ -623,6 +623,53 @@ static bool fbnic_pmd_update_state(struct fbnic_dev *fbd, bool signal_detect)
> >  	return false;
> >  }
> >
> > +u32 fbnic_get_link_speed(u8 link_speed)
> > +{
> > +	switch (link_speed) {
> > +	case FBNIC_FW_LINK_MODE_25CR:
> > +		return SPEED_25000;
> > +	case FBNIC_FW_LINK_MODE_50CR2:
> > +	case FBNIC_FW_LINK_MODE_50CR:
> > +		return SPEED_50000;
> > +	case FBNIC_FW_LINK_MODE_100CR2:
> > +		return SPEED_100000;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static void fbnic_set_led_state(struct fbnic_dev *fbd, int state)
> > +{
> > +	mutex_lock(&fbd->led_mutex);
> > +
> > +	/* alternating amber,blue IDs device every half second */
> > +	switch (state) {
> > +	case FBNIC_LED_OFF: /* amber on, blue off */
> > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_ON;
> > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_OFF;
> > +		break;
> > +	case FBNIC_LED_ON: /* amber off, blue on */
> > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_OFF;
> > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_ON;
> > +		break;
> > +	case FBNIC_LED_RESTORE:
> > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode =
> > +			FBNIC_STROBE_DISABLED;
> > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode =
> > +			FBNIC_STROBE_DISABLED;
> > +		break;
> > +	case FBNIC_LED_STROBE_INIT: /* a no-op */
> > +		/* Initialization is a no-op; LED toggling happens on ON/OFF */
> > +		goto out_unlock;
> > +	default:
> > +		goto out_unlock;
> > +	}
> > +
> > +	fbnic_led_update_csr(fbd);
> > +out_unlock:
> > +	mutex_unlock(&fbd->led_mutex);
> > +}
> > +
>
> This appears to be something different to trig-netdev and sys class
> LED control of the LED. Please could you move this out into another
> patch. Add clean support for the LED first, and them mess it all up in
> follow up patches adding all your vendor specific stuff. We can then
> think about if some of that can be moved into the LED core/trig-netdev
> somehow.
>

This IS the slave to the LED core ID mechanism.

If I'm understanding your suggestion the ethtool id, this routine and
the fbnic_led_update_csr() need to be a separarate patch?

> 	Andrew

