Return-Path: <linux-leds+bounces-8286-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCurGH4+D2pNIQYAu9opvQ
	(envelope-from <linux-leds+bounces-8286-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 19:18:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2137D5AA0FC
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 19:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC71A300611D
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 17:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF845383309;
	Thu, 21 May 2026 17:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="S3teQ5mq"
X-Original-To: linux-leds@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E63672A0;
	Thu, 21 May 2026 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779383760; cv=none; b=YFBiv6lpdEzfNz/4jA/3+PYqVhnRoE/VsfmAnHut91Ut/mN1RHtGLAwb0lkTyN6H/AseF3SEiLztVMhtOSxA+QR0n4E31xum1IYQCZ7+R1b+tP3dEG4I4YXJ9eqVZT0JLDsF4nWYrkl8yYWJcfxdVYYcyzG3Fj55hOt32JNVA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779383760; c=relaxed/simple;
	bh=Y04Dv5n+4mXV2AbSkQc9EL9gUcOViM+qzZbOUemTr1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b44G1yaWYvAxkRs/cJXVn/aCy/KpYe7EhXbaQJDF6z1sGtEaw448JVUKAB48rNeoRDGUiuiNOrOBLnu6NSEuSvmjHI0rH+iHXHoD9nhGrTBk5cPT7JB6GAo+J8ltrHQKS/HisEmPCQvetLChFU22QCWpbmkREFXy1J4OvZYP18Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=S3teQ5mq; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qU8DsnALlfX9lzYOTZK+4hKWSV+rnvkhJM26ub8AM3M=; b=S3teQ5mqmdO7DdHE/4nzszMYTb
	jvJM57nuoxVRDempi46/ukOWDD+HtY4k1NA48ztyYOIqZwq5ScAIsGjkfjTq8/ouwdqawFgteIcqG
	8oPCUQ5cwGRCbV82RaBN/tnzuCuCcnjOaCRWQPqV6mEH/YOMVUAiq1U9AC2E+QKY4CUY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQ6zZ-0043rv-A8; Thu, 21 May 2026 19:15:29 +0200
Date: Thu, 21 May 2026 19:15:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mike Marciniszyn <mike.marciniszyn@gmail.com>
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
Message-ID: <3523c429-c752-4216-8ec4-2ea47a5631fc@lunn.ch>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
 <20260520200337.204431-4-mike.marciniszyn@gmail.com>
 <74576086-f51f-41ef-b0ef-c4e0373a06c4@lunn.ch>
 <ag8RN5-J1peL5xhg@PF5YBGDS.localdomain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag8RN5-J1peL5xhg@PF5YBGDS.localdomain>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8286-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2137D5AA0FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 10:05:43AM -0400, Mike Marciniszyn wrote:
> On Wed, May 20, 2026 at 10:37:01PM +0200, Andrew Lunn wrote:
> > > +/**
> > > + * fbnic_set_phys_id - Used to strobe the MAC LEDs in a recognizable pattern
> > > + * @netdev: Interface/port to strobe the LEDs for
> > > + * @phys_id_state: State requested by the call
> > > + *
> > > + * This function can really be broken down into two parts. There are the
> > > + * ACTIVE/INACTIVE states which really are meant to be defining the start
> > > + * and stop of the LED strobing. There is also the ON/OFF states which are
> > > + * used to provide us with a way of telling us that we should be turning
> > > + * the LED on and/or off.
> > > + *
> > > + * We translate these calls and pass them off to the MAC layer. They will
> > > + * be used to initialize a strobe, then on and off will be used to cycle
> > > + * between the patterns, and finally we will restore the original LED state.
> > > + *
> > > + * We will return 2 when we are requested to go active. This will tell the
> > > + * call that it will need to call back to turn on/off the LED twice every
> > > + * second.
> > > + *
> > > + * Return: blink in half second intervals on success, negative value on failure
> > > + */
> >
> > Could you drop this for the moment. Ideally, we want the LED core to
> > be implementing this somehow, so that all devices using the core get
> > this functionality, rather than put it in every driver.
> >
> 
> The driver does exploit the LED core.

The driver does make use of the LED core, but it is not using the LED
subsystem to do phys_id. Ideally, we want either the LED core, or
maybe a netdev helper to expose a function which can be used as the
ethtool op. The driver itself does nothing, except expose its LEDs to
the core. We than have a function any driver with LEDs can use. A
generic solution.

> The actually interface to the
> LEDs are simple on/off settings.  The strobing follows the OCP spec
> to alternate between the "below" speed color (amber for fbnic) and the "at"
> speed color (blue for fbnic).

You appear to need a specific implementation of phys_id. What i'm
asking is that you first implement MAC LEDs as Linux currently defines
them. A simple clean implementation. Once that is merged, we can
figure out how to implement what OCP required, in a generic way that
any vendor can use.

> 
> The only complication is the the CSR bit for the activity LED is 1 implies
> off and zero implies on.  The activity LED flashes automatically
> based on actual network activity provides it is set to 0 (on).
> 
> The return to the LED core gives the count of the number of cycles per
> second and each cycle alternates between amber and blue.  The driver
> is a slave to the ETHTOOL_ID_* phys_id state from the LED core based
> on that timing.
> 
> I'm not sure what else would need to go into the LED core?

An LED driver should first expose an simple on/off method. If it
supports acceleration, it can then optionally expose its acceleration
capabilities. 


> > > +static int fbnic_led_hw_ctl_set(struct led_classdev *led_cdev,
> > > +				unsigned long flags)
> > > +{
> > > +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> > > +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> > > +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> > > +	u32 supported_modes;
> > > +
> > > +	supported_modes = fbnic_led_get_supported_modes(fbd, led_idx);
> > > +
> > > +	if (flags & ~supported_modes)
> > > +		return -EINVAL;
> > > +
> > > +	/* Turn on activity LED only when both the TX and RX flags are set. */
> > > +	if (led_idx == FBNIC_LED_ACTIVITY && (flags & supported_modes) &&
> > > +	    flags != supported_modes) {
> > > +		dev_warn(fbd->dev,
> > > +			 "Invalid activity LED mode(s): 0x%lx\n", flags);
> > > +		return -EINVAL;
> >
> > How does this happen? It should be that the core will not ask you to
> > do something you cannot do, if you have answered -EOPNOTSUPP in
> > fbnic_led_hw_ctl_is_supported().
> >
> 
> Will need to investigate this.
> 
> > > +static int fbnic_led_brightness_set_blocking(struct led_classdev *led_cdev,
> > > +					     enum led_brightness brightness)
> > > +{
> > > +	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
> > > +	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
> > > +	int led_idx = fbnic_led_get_idx(fbd, ldev);
> > > +
> > > +	mutex_lock(&fbd->led_mutex);
> > > +	if (!brightness) {
> > > +		fbd->leds[led_idx].enabled_modes = 0;
> > > +		fbd->leds[led_idx].strobe_mode = 0;
> > > +	} else {
> > > +		u32 mode;
> > > +
> > > +		switch (led_idx) {
> > > +		case FBNIC_LED_ACTIVITY:
> > > +			fbd->leds[led_idx].enabled_modes =
> > > +				BIT(TRIGGER_NETDEV_TX) | BIT(TRIGGER_NETDEV_RX);
> > > +			break;
> > > +		default:
> > > +			mode = fbnic_led_get_link_speed_mode(fbd);
> > > +			fbd->leds[led_idx].enabled_modes = mode;
> > > +			break;
> > > +		}
> > > +	}
> >
> > This looks odd. led_brightness_set() is simply used to set the LED to
> > on or off. The netdev trigger will use it to software blink the LEDs
> > when asked to do something which cannot be offloaded to the hardware.
> >
> > And when the LED is being used to show NUMLOCK, or Morse code crash
> > dump, network activity should not intervene.
> >
> 
> Will need to investigate this.
> 
> > > diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> > > index 53b7a938b4c2..c6b1130f9159 100644
> > > --- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> > > +++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
> >
> >
> > > @@ -623,6 +623,53 @@ static bool fbnic_pmd_update_state(struct fbnic_dev *fbd, bool signal_detect)
> > >  	return false;
> > >  }
> > >
> > > +u32 fbnic_get_link_speed(u8 link_speed)
> > > +{
> > > +	switch (link_speed) {
> > > +	case FBNIC_FW_LINK_MODE_25CR:
> > > +		return SPEED_25000;
> > > +	case FBNIC_FW_LINK_MODE_50CR2:
> > > +	case FBNIC_FW_LINK_MODE_50CR:
> > > +		return SPEED_50000;
> > > +	case FBNIC_FW_LINK_MODE_100CR2:
> > > +		return SPEED_100000;
> > > +	default:
> > > +		return 0;
> > > +	}
> > > +}
> > > +
> > > +static void fbnic_set_led_state(struct fbnic_dev *fbd, int state)
> > > +{
> > > +	mutex_lock(&fbd->led_mutex);
> > > +
> > > +	/* alternating amber,blue IDs device every half second */
> > > +	switch (state) {
> > > +	case FBNIC_LED_OFF: /* amber on, blue off */
> > > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_ON;
> > > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_OFF;
> > > +		break;
> > > +	case FBNIC_LED_ON: /* amber off, blue on */
> > > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_OFF;
> > > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_ON;
> > > +		break;
> > > +	case FBNIC_LED_RESTORE:
> > > +		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode =
> > > +			FBNIC_STROBE_DISABLED;
> > > +		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode =
> > > +			FBNIC_STROBE_DISABLED;
> > > +		break;
> > > +	case FBNIC_LED_STROBE_INIT: /* a no-op */
> > > +		/* Initialization is a no-op; LED toggling happens on ON/OFF */
> > > +		goto out_unlock;
> > > +	default:
> > > +		goto out_unlock;
> > > +	}
> > > +
> > > +	fbnic_led_update_csr(fbd);
> > > +out_unlock:
> > > +	mutex_unlock(&fbd->led_mutex);
> > > +}
> > > +
> >
> > This appears to be something different to trig-netdev and sys class
> > LED control of the LED. Please could you move this out into another
> > patch. Add clean support for the LED first, and them mess it all up in
> > follow up patches adding all your vendor specific stuff. We can then
> > think about if some of that can be moved into the LED core/trig-netdev
> > somehow.
> >
> 
> This IS the slave to the LED core ID mechanism.
> 
> If I'm understanding your suggestion the ethtool id, this routine and
> the fbnic_led_update_csr() need to be a separarate patch?

I'm saying start KISS. All the LED core really needs is on/off. It
will then blink the LEDs as required.

The next step is to then expose whatever acceleration the hardware
provides, so that in some configurations software blinking is not
needed, the hardware does it.

Then we can think about whatever OCP requires and how we can do a
generic implementation.

	Andrew

