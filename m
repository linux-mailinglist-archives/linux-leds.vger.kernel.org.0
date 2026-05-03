Return-Path: <linux-leds+bounces-7959-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBW7ORKS92lhjAIAu9opvQ
	(envelope-from <linux-leds+bounces-7959-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 20:21:06 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2154B6FBF
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 20:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8C4301E5AF
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 18:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31E93D16E3;
	Sun,  3 May 2026 18:19:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7583D092A
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832396; cv=none; b=DE3qrXLgsAYwxT3M3TrU/IlX2sdSMpFBcVJBmdIi/dnB2tdm4ikNwamQA195DuHf734QMqdju2SvwrXrQZK3uDX9Akk6bElvFPBFC3tgkFwNj9LHXSx+E/eRGfTujYtr7I1K2Vg9Oaj5fRluqdpyA6YXzHgmqCVYWS+3vvmnq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832396; c=relaxed/simple;
	bh=EwfUIgf1uwwZUx1klfb7s5OuRBYwXyEZ7OfAHCLmM6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d0KnAPVZn6hirQbzxPIuEwiAfZdAXhiVNkkX8VEWXnDSvZvy4lpd/GTAkDpTCxRyD3N54mHDbFhyCfmIqXr4JitsUISOMdSPmGxQY+EZ31GSUv5iJq5lUsUgLW575FwlLKW3GuyB6FgEO7+Rg2othgACa0FCwWvpkBT1ntpAYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wJbPt-0005PX-1M; Sun, 03 May 2026 20:19:45 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>,  Lee Jones <lee@kernel.org>,  Pavel
 Machek <pavel@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-leds@vger.kernel.org
Subject: Re: [PATCH v9] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <aae0901b-ebfd-4d40-9880-116b881c9a90@gmail.com> (Jacek
	Anaszewski's message of "Sun, 26 Apr 2026 14:41:09 +0200")
References: <20260424-v6-14-topic-ti-lp5860-v9-1-b44d7025d741@pengutronix.de>
	<aae0901b-ebfd-4d40-9880-116b881c9a90@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Sun, 03 May 2026 20:19:44 +0200
Message-ID: <87zf2gqrsv.fsf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Queue-Id: 5D2154B6FBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[s.trumtrar@pengutronix.de,linux-leds@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7959-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:url,pengutronix.de:mid,pengutronix.de:email]

On 2026-04-26 at 14:41 +02, Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

Hi,

> Hi Steffen,
> 
> On 4/24/26 3:28 PM, Steffen Trumtrar wrote:
> > Add support for the Texas Instruments LP5860 LED driver chip
> > via SPI interfaces.
> > The LP5860 is an LED matrix driver for up to 196 LEDs, which supports
> > short and open detection of the individual channel select lines.
> > It can be connected to SPI or I2C bus. For now add support for SPI only.
> > Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> > ---
> [...]
> > diff --git a/drivers/leds/rgb/leds-lp5860-core.c b/drivers/leds/rgb/leds-lp5860-core.c
> > new file mode 100644
> > index 0000000000000..648bf168f94bf
> > --- /dev/null
> > +++ b/drivers/leds/rgb/leds-lp5860-core.c
> > @@ -0,0 +1,231 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2025 Pengutronix
> > + *
> > + * Author: Steffen Trumtrar <kernel@pengutronix.de>
> > + */
> > +
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "leds-lp5860.h"
> > +
> > +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
> > +{
> > +	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
> > +}
> > +
> > +static int lp5860_set_dot_onoff(struct lp5860_led *led, unsigned int dot, bool enable)
> > +{
> > +	unsigned int offset = dot / LP5860_MAX_DOT_ONOFF_GROUP_NUM;
> > +	unsigned int mask = BIT(dot % LP5860_MAX_DOT_ONOFF_GROUP_NUM);
> > +
> > +	if (dot > LP5860_MAX_LED)
> > +		return -EINVAL;
> > +
> > +	return regmap_update_bits(led->chip->regmap,
> > +				  LP5860_REG_DOT_ONOFF_START + offset, mask,
> > +				  enable ? LP5860_DOT_ALL_ON : LP5860_DOT_ALL_OFF);
> > +}
> > +
> > +static int lp5860_set_mc_brightness(struct led_classdev *cdev,
> > +				    enum led_brightness brightness)
> > +{
> > +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
> > +	struct lp5860_led *led = mcled_cdev_to_led(mc_cdev);
> 
> You need mutex locking while accessing hw to avoid leaving the
> device in an inconsistent state in case of two parallel requests from
> different processes.
>

The hw is only accessed via regmap. It handles locking AFAIK or do I misunderstand you?


Best regards,
Steffen

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

