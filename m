Return-Path: <linux-leds+bounces-2254-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D373792E25E
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 10:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114FB1C212E4
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 08:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC2915AAC2;
	Thu, 11 Jul 2024 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WjU07k5D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CAF15A87F;
	Thu, 11 Jul 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686655; cv=none; b=juZsDX3gKNm+V02DqoyCBAinm23iwA/uEqvfp2qi3dmBDuyZIZB9u6LADlx9gkTSbMS1yIVU/q+FwmkNpHEGcnCbwBfsqfDnn/tBOO4eJt1REwSAMCC4hsjU3VafL1kDJ45YtVzHYU7mLaaUIkzPNEldD93LMlbgDAKfAVW2F+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686655; c=relaxed/simple;
	bh=Co2hf2aFg/DDh/+imxd7qZkGobFIm1pn0931psX820w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uALoet+VnGdW6r8jpE2yaHx3RH4/dIy/UWbl5mMGtpJpVJ1jKpoo0tJ3Jsf2EgGNGiohApKLYGfOTWPtkZ6QLKJwnyPAMX1paERQJsgdm5+CVXDru6ZxNA0VxF4KhNkWvI61NycdjEXo1Qy2FcvyRPosjCbcSF1/2qyYW4vgWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WjU07k5D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D20BC116B1;
	Thu, 11 Jul 2024 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720686654;
	bh=Co2hf2aFg/DDh/+imxd7qZkGobFIm1pn0931psX820w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WjU07k5Dz6CrXTYARn1OTYxm1Yp+jqTA19ZewguJZNZ0APFX0Gdt4zcWKUBlD7Pgf
	 dTmdTpV3kcL5zBTAhj0TQU0+YZOSg0Qe1yY3MfSBKgYtKHdH7r75he+AjziZdn7jCh
	 oSP3KyhYd06S/Gw1+DYDhEUwF9opRal8iEq7PlCtwA1uxxm/GfDEzsQ6OgZDynSsBz
	 DvdtlMqdxHXdClfke6ICfLQLC8uYQseuDDV1Nblw5hNSccWITlgNFSr1sYVlMCPcv3
	 JKKKbMzZeLJ4p1Twsbamtl0u/XYSYNSOrIdnqs6t7ixczAi5UFHbzo6eydqNGFvsQN
	 3/eypiXMNUW3A==
Date: Thu, 11 Jul 2024 09:30:50 +0100
From: Lee Jones <lee@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v2 2/4] leds: pca9532: Use PWM1 for hardware blinking
Message-ID: <20240711083050.GK501857@google.com>
References: <20240617143910.154546-1-bastien.curutchet@bootlin.com>
 <20240617143910.154546-3-bastien.curutchet@bootlin.com>
 <b88d211f-3c5b-4428-bd94-3d089c56ed22@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b88d211f-3c5b-4428-bd94-3d089c56ed22@bootlin.com>

On Wed, 10 Jul 2024, Bastien Curutchet wrote:

> Hi Lee,
> 
> On 6/17/24 16:39, Bastien Curutchet wrote:
> 
> > +static int pca9532_update_hw_blink(struct pca9532_led *led,
> > +				   unsigned long delay_on, unsigned long delay_off)
> > +{
> > +	struct pca9532_data *data = i2c_get_clientdata(led->client);
> > +	unsigned int psc;
> > +	int i;
> > +
> > +	/* Look for others LEDs that already use PWM1 */
> > +	for (i = 0; i < data->chip_info->num_leds; i++) {
> > +		struct pca9532_led *other = &data->leds[i];
> > +
> > +		if (other == led)
> > +			continue;
> > +
> > +		if (other->state == PCA9532_PWM1) {
> > +			if (other->ldev.blink_delay_on != delay_on ||
> > +			    other->ldev.blink_delay_off != delay_off) {
> > +				dev_err(&led->client->dev,
> > +					"HW can handle only one blink configuration at a time\n");
> 
> I'm having some second thoughts about this dev_err().
> 
> It was dev_dbg() in V1, but based on your suggestion, I changed it to
> dev_err() because an error was returned after.
> 
> I've worked more with this patch since it got applied, these error messages
> appear frequently, though they don’t seem to be 'real' errors to me as the
> software callback is used afterwards and the LED blinks at the expected
> period.
> 
> Don't you think a dev_dbg() would be more appropriate in this case ? Or
> perhaps a comment instead of a message ?

If it's not an error, then don't return an error message.

Maybe drop the message for a comment and return -EBUSY instead?

> > +				return -EINVAL;
> > +			}
> > +		}
> > +	}
> > +
> > +	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> > +	if (psc > U8_MAX) {
> > +		dev_err(&led->client->dev, "Blink period too long to be handled by hardware\n");
> 
> Same comments for this dev_err()
> 
> > +		return -EINVAL;
> > +	}
> 
> 
> Best regards,
> Bastien

-- 
Lee Jones [李琼斯]

