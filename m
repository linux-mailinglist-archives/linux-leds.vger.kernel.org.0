Return-Path: <linux-leds+bounces-8264-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPPtFoobDmpT6AUAu9opvQ
	(envelope-from <linux-leds+bounces-8264-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 22:37:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B8599D9A
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 22:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6DC23016B58
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C85372EDA;
	Wed, 20 May 2026 20:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tM8G90hX"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969DC372ED0;
	Wed, 20 May 2026 20:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779309446; cv=none; b=R553lmcS6v+ASyXpSe7hmZZYz1QdO6TtIfX2F565hbKnoNWSejd4Rm8Ld676wEGTMDIPRek0uVEw4HKts/6cjcmGzvzGGvM1pOV+7JFzpZ1xQ208ZI1u+H7I61ev1zJow0HMx7Zv5m16RaOv+jLpOE/yt28514X+I0JpkeC9Hv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779309446; c=relaxed/simple;
	bh=Yi70dB/jT91/u8tcFVwviOtAofrfiAfrDmEIEUS6P6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ3XJthY21G+gESUHMtobthcUSeWvN3+N+2okXUWcP83nHhF1WbttwXTIZGD8J5BwQNcv26a/ibJmlVdaG+sv4Xr0Bo7BtPTXvVvVLLTgCNGfXMN+wRhUGYHuIb+ZQkWTlAuhFXmSV73LIGuVG5oeRGp4boFq2udwDDLNxl62lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tM8G90hX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/jydwNDrtaG39ojIvvfIFNlq6g4H991wFtbH0rqz4Uc=; b=tM8G90hXYMVoob2lWMPUhwSKaR
	Xkif/sFjJMnNYo74mtArpRq0FoSCFHzxNbylJm8Ja3ROjUdNywRdnFu3rwsQNKTjMs5VH1mfgQHx6
	FF+zA5+wHYDg3vgiY/UN1Lw9XYdjlikPEE1+jVEyqyhwC72wZUTZiZkxvUC8ZBjCFyg0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wPnf3-003twE-N4; Wed, 20 May 2026 22:37:01 +0200
Date: Wed, 20 May 2026 22:37:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: mike.marciniszyn@gmail.com
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
Message-ID: <74576086-f51f-41ef-b0ef-c4e0373a06c4@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-4-mike.marciniszyn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520200337.204431-4-mike.marciniszyn@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8264-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lunn.ch:mid,lunn.ch:dkim]
X-Rspamd-Queue-Id: 003B8599D9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> +/**
> + * fbnic_set_phys_id - Used to strobe the MAC LEDs in a recognizable pattern
> + * @netdev: Interface/port to strobe the LEDs for
> + * @phys_id_state: State requested by the call
> + *
> + * This function can really be broken down into two parts. There are the
> + * ACTIVE/INACTIVE states which really are meant to be defining the start
> + * and stop of the LED strobing. There is also the ON/OFF states which are
> + * used to provide us with a way of telling us that we should be turning
> + * the LED on and/or off.
> + *
> + * We translate these calls and pass them off to the MAC layer. They will
> + * be used to initialize a strobe, then on and off will be used to cycle
> + * between the patterns, and finally we will restore the original LED state.
> + *
> + * We will return 2 when we are requested to go active. This will tell the
> + * call that it will need to call back to turn on/off the LED twice every
> + * second.
> + *
> + * Return: blink in half second intervals on success, negative value on failure
> + */

Could you drop this for the moment. Ideally, we want the LED core to
be implementing this somehow, so that all devices using the core get
this functionality, rather than put it in every driver.

> +static int fbnic_led_hw_ctl_set(struct led_classdev *led_cdev,
> +				unsigned long flags)
> +{
> +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> +	u32 supported_modes;
> +
> +	supported_modes = fbnic_led_get_supported_modes(fbd, led_idx);
> +
> +	if (flags & ~supported_modes)
> +		return -EINVAL;
> +
> +	/* Turn on activity LED only when both the TX and RX flags are set. */
> +	if (led_idx == FBNIC_LED_ACTIVITY && (flags & supported_modes) &&
> +	    flags != supported_modes) {
> +		dev_warn(fbd->dev,
> +			 "Invalid activity LED mode(s): 0x%lx\n", flags);
> +		return -EINVAL;

How does this happen? It should be that the core will not ask you to
do something you cannot do, if you have answered -EOPNOTSUPP in
fbnic_led_hw_ctl_is_supported().

> +static int fbnic_led_brightness_set_blocking(struct led_classdev *led_cdev,
> +					     enum led_brightness brightness)
> +{
> +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> +
> +	mutex_lock(&fbd->led_mutex);
> +	if (!brightness) {
> +		fbd->leds[led_idx].enabled_modes = 0;
> +		fbd->leds[led_idx].strobe_mode = 0;
> +	} else {
> +		u32 mode;
> +
> +		switch (led_idx) {
> +		case FBNIC_LED_ACTIVITY:
> +			fbd->leds[led_idx].enabled_modes =
> +				BIT(TRIGGER_NETDEV_TX) | BIT(TRIGGER_NETDEV_RX);
> +			break;
> +		default:
> +			mode = fbnic_led_get_link_speed_mode(fbd);
> +			fbd->leds[led_idx].enabled_modes = mode;
> +			break;
> +		}
> +	}

This looks odd. led_brightness_set() is simply used to set the LED to
on or off. The netdev trigger will use it to software blink the LEDs
when asked to do something which cannot be offloaded to the hardware.

And when the LED is being used to show NUMLOCK, or Morse code crash
dump, network activity should not intervene.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> index 53b7a938b4c2..c6b1130f9159 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c


> @@ -623,6 +623,53 @@ static bool fbnic_pmd_update_state(struct fbnic_dev *fbd, bool signal_detect)
>  	return false;
>  }
>  
> +u32 fbnic_get_link_speed(u8 link_speed)
> +{
> +	switch (link_speed) {
> +	case FBNIC_FW_LINK_MODE_25CR:
> +		return SPEED_25000;
> +	case FBNIC_FW_LINK_MODE_50CR2:
> +	case FBNIC_FW_LINK_MODE_50CR:
> +		return SPEED_50000;
> +	case FBNIC_FW_LINK_MODE_100CR2:
> +		return SPEED_100000;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static void fbnic_set_led_state(struct fbnic_dev *fbd, int state)
> +{
> +	mutex_lock(&fbd->led_mutex);
> +
> +	/* alternating amber,blue IDs device every half second */
> +	switch (state) {
> +	case FBNIC_LED_OFF: /* amber on, blue off */
> +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_ON;
> +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_OFF;
> +		break;
> +	case FBNIC_LED_ON: /* amber off, blue on */
> +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_OFF;
> +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_ON;
> +		break;
> +	case FBNIC_LED_RESTORE:
> +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode =
> +			FBNIC_STROBE_DISABLED;
> +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode =
> +			FBNIC_STROBE_DISABLED;
> +		break;
> +	case FBNIC_LED_STROBE_INIT: /* a no-op */
> +		/* Initialization is a no-op; LED toggling happens on ON/OFF */
> +		goto out_unlock;
> +	default:
> +		goto out_unlock;
> +	}
> +
> +	fbnic_led_update_csr(fbd);
> +out_unlock:
> +	mutex_unlock(&fbd->led_mutex);
> +}
> +

This appears to be something different to trig-netdev and sys class
LED control of the LED. Please could you move this out into another
patch. Add clean support for the LED first, and them mess it all up in
follow up patches adding all your vendor specific stuff. We can then
think about if some of that can be moved into the LED core/trig-netdev
somehow.

	Andrew

