Return-Path: <linux-leds+bounces-6198-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5DC6C88B
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 04:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 35B1A2B614
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 03:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8872E5B27;
	Wed, 19 Nov 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUhuJhFr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D22DFF04;
	Wed, 19 Nov 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522042; cv=none; b=tGjJdhcWLfhGZqli5F281+VJCodxwmAykWgycKXJ+LmV2znDMQ3tMkdE3mxqB/Nqa0XVJfdaHM/2BBsN4XujQu2aJZB9Q6zDXcRbZfeaLHz2b6OA13w+ZKu627lI/mwulPPVjXZfeyCKLKwZv/346QCoJslWxFSIU0viPSA13fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522042; c=relaxed/simple;
	bh=ShSdZ7QKer5LMw9bQOqMv3b5WIV69hePDG+tXNhunck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLLRw0p6Yz27+kn5RhOd45EBYlhaSmpa5iFAzdN0GzGXoBZ6sIL80eZK7n9mC/VsYhSFIevCy0L5jKsS+qldH3G3Dv0twYw0EtD/K9rcjzAYEdl2vxBPWVVR6SpPqfk5UnMjUKFTrucfdW+DtY97okrVKWek2fPBKr9bl4sWtdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUhuJhFr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0C9C19425;
	Wed, 19 Nov 2025 03:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522041;
	bh=ShSdZ7QKer5LMw9bQOqMv3b5WIV69hePDG+tXNhunck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUhuJhFrNANKjnfBuUSbas6bHohUxbzDD7brqUza+OwjX+I/v3cZzOg80/2Fe39Aq
	 FzQaTkUfpI7DXJk71oxeP/1mpqlXnBkPOUB5iDnIru6kgYOlXQ8RWeoyHdiXh0S4Up
	 VIkCmpWFIf35LhDjVqBTqJclOayhDUKA3K/SDPoDvZ+3nIP/TJxDGHJHOvfU5uMcGd
	 M6dpQpMr7GKNgtJNg0BGuRSj/UdqdXPcswjrJeIAgou/ZmsNx0U4UOcbuu3PL+dHV9
	 VnDkxUODuNx9M0v1RQAoxvHQyptbUkPmwj5hJo1XZYt/HsARsPN4vV5UEDmMXEJmH0
	 JzxZXQq5Q3ijg==
Date: Tue, 18 Nov 2025 21:18:50 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
Message-ID: <mrdp2ljtmoazowz37zcbirrvrozohnlgtyvwzqedoa3xnbnh6p@4nulist6gmxg>
References: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>
 <7d46k5kmygmgjje3pc3jfebestkksbnq55q44urljkrmtrvwa7@6mxkt7zlmoid>
 <d10f7383-1eeb-44d2-a34f-15e76c3451fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d10f7383-1eeb-44d2-a34f-15e76c3451fe@oss.qualcomm.com>

On Wed, Nov 19, 2025 at 10:17:44AM +0800, Fenglin Wu wrote:
> 
> On 11/19/2025 12:27 AM, Bjorn Andersson wrote:
> > On Tue, Nov 18, 2025 at 10:48:03AM +0800, Fenglin Wu via B4 Relay wrote:
> > > From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > 
> > Sorry, I didn't find the chance to answer your reply yesterday, and then
> > you sent v2, so I'll have to continue the discussion here.
> > 
> > > The PWM signal from the LPG channel can be routed to PMIC GPIOs with
> > > proper GPIO configuration, and it is not necessary to enable the
> > > TRILED channel in that case. This also applies to the LPG channels
> > > that mapped to TRILED channels. Additionally, enabling the TRILED
> > > channel unnecessarily would cause a voltage increase in its power
> > > supply. Hence remove it.
> > > 
> > > Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
> > >    indicates the channel is being used as a LED and this PWM API would
> > >    never get called. Instead, remove the code line which enables TRILED
> > >    in lpg_pwm_apply() and update the commit text to explain it clearly.
> > > 
> > I understand that in your case you're routing the PWM signal to a GPIO,
> > and in that case the TRILED output should be kept disabled.
> > 
> > But what if I have my load connected to the TRILED and I describe my LPG
> > channel as a PWM channel? Is this an invalid use case?
> This is not a valid case. If a load (typically an LED) is connected to any
> channel of theTRILED module, it means the LPG channel is used for driving an
> LED, and sub-nodes for the LED devices must be defined. Otherwise, the PWM
> signal will be gated by the TRILED module. Enabling a TRILED channel not
> only opens the PWM gate but also activates an internal current sink to
> manage the load. If you need to output PWM as a control signal, for example
> for fan control, the hardware should connect the fan control input to a PMIC
> GPIO. The PWM signal from an LPG channel can be routed there, rather than
> using a TRILED channel.

Thanks for elaborating, I think this is an okay stance to take in the
question. Let's document it (like you propose below) and make the change
you're proposing.

> > With this patch,
> > everything will look like it's working, except silently my signal won't
> > come out.
> > 
> > I presume there's no additional configuration on the LPG-side for your
> > use case. We just configure the GPIO to tap into the PWM-signal through
> > the pinmux settings?
> That's correct.
> > 
> > Also, if for some reason the triled was enabled by bootloader, you will
> > now leave it enabled forever. This perhaps isn't a big issue though...
> In that case, I would assume that the bootloader should also be customized
> to not enabling any LED if there is not a physical LED device connected to
> the TRILED channel.
> > 
> > Perhaps none of this matters in practice, and we should just proceed
> > with your approach. If that's the case, then we should at least document
> > the behavior.
> 
> Does it look good if I push a change in the DT binding document to explain
> this?
> 
> --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> @@ -13,6 +13,10 @@ description: >
>    The Qualcomm Light Pulse Generator consists of three different hardware
> blocks;
>    a ramp generator with lookup table (LUT), the light pulse generator and a
> three
>    channel current sink. These blocks are found in a wide range of Qualcomm
> PMICs.
> +  The light pulse generator (LPG) can also be used independently to output
> PWM
> +  signal for standard PWM applications. In this scenario, the LPG output
> should
> +  be routed to a specific PMIC GPIO by setting the GPIO pin mux to the
> special
> +  functions indicated in the datasheet.

I like this. How about continuing this sentence with ", the TRILED
driver for the channel will not be enabled in this configuration."?

That way we make sure the decided TRILED behavior is documented as well.

Regards,
Bjorn

> 
>  properties:
>    compatible:
> 
> > Regards,
> > Bjorn
> > 
> > > - Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com
> > > ---
> > >   drivers/leds/rgb/leds-qcom-lpg.c | 4 +---
> > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > > index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..e197f548cddb03d079c54c4a0f402402c5d047e2 100644
> > > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > > @@ -2,7 +2,7 @@
> > >   /*
> > >    * Copyright (c) 2017-2022 Linaro Ltd
> > >    * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
> > > - * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > >    */
> > >   #include <linux/bits.h>
> > >   #include <linux/bitfield.h>
> > > @@ -1247,8 +1247,6 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > >   	lpg_apply(chan);
> > > -	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
> > > -
> > >   out_unlock:
> > >   	mutex_unlock(&lpg->lock);
> > > 
> > > ---
> > > base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
> > > change-id: 20251114-lpg_triled_fix-44491b49b340
> > > 
> > > Best regards,
> > > -- 
> > > Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > 
> > > 

