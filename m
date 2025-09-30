Return-Path: <linux-leds+bounces-5626-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50304BABDDA
	for <lists+linux-leds@lfdr.de>; Tue, 30 Sep 2025 09:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AFAB18873A0
	for <lists+linux-leds@lfdr.de>; Tue, 30 Sep 2025 07:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AAC2BE051;
	Tue, 30 Sep 2025 07:40:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914922BF016
	for <linux-leds@vger.kernel.org>; Tue, 30 Sep 2025 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759218040; cv=none; b=a4jpsrkeleZc8nFZ4vJecor9V7hJ9XjRe9d37oDlSp5jrbEQOcDUQuXj9bdqnGcSgsgj2kze6e4mN9o9/C7wsmcsQb2Tb1W4dO2Od8Lf23sLtqKg8tzWHILgZzUFb1YrM8V3U+3fA4DD7Hhqm5AycMa2bSbIt68aERf9fiPqTp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759218040; c=relaxed/simple;
	bh=2Z51Vo0xsqWYUMvSkxTt20h8sXfSDUfaV6whn3Jzwgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n72BKVYjNBAsGW6LQpfRJOnl44ntz2VmWCV3UYxENU6D6dEfwlrnAVNlX6r8fIm78n3pQR60C4qEjXWqkgzI/NH05T1UFyAUIxQIjj+sC7+riVY4N6XpETyBle0Yxq2Ua7mNBT+sZPNM4iDa0QWe/pdoQYZZT9SPzLNFrV0G2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1v3UyM-00076x-HE; Tue, 30 Sep 2025 09:40:30 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Steffen Trumtrar <kernel@pengutronix.de>,  Pavel Machek
 <pavel@kernel.org>,  Mark Brown <broonie@kernel.org>,
  linux-leds@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] leds: add support for TI LP5860 LED driver chip
In-Reply-To: <20250916153412.GA3837873@google.com> (Lee Jones's message of
	"Tue, 16 Sep 2025 16:34:12 +0100")
References: <20250911-v6-14-topic-ti-lp5860-v3-0-390738ef9d71@pengutronix.de>
	<20250911-v6-14-topic-ti-lp5860-v3-2-390738ef9d71@pengutronix.de>
	<20250916153412.GA3837873@google.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 30 Sep 2025 09:40:28 +0200
Message-ID: <875xd0jslv.fsf@pengutronix.de>
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


Hi,

On 2025-09-16 at 16:34 +01, Lee Jones <lee@kernel.org> wrote:

> > +#include <linux/gpio.h>
> > +#include <linux/led-class-multicolor.h>
> > +#include <linux/module.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <linux/platform_data/leds-lp5860.h>
> > +
> > +static struct lp5860_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
> > +{
> > +	return container_of(mc_cdev, struct lp5860_led, mc_cdev);
> > +}
> > +
> > +LP5860_SHOW_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> > +LP5860_STORE_MODE(r_global_brightness_set, LP5860_REG_R_CURRENT_SET, LP5860_CC_GROUP_MASK, 0)
> > +DEVICE_ATTR_RW(r_global_brightness_set);
> 
> How is this different to /sys/class/leds/<led>/multi_intensity?
> 
> # echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
> red -
>     intensity = 138
>     max_brightness = 255
> green -
>     intensity = 43
>     max_brightness = 255
> blue -
>     intensity = 226
>     max_brightness = 255
>

the LP5860 has a register for setting the maximal brightness that holds for all LEDs in the matrix. multi_intensity and max_brightness is only for that one multicolor LED, right? And I can only manipulate the max_brightness of that one multicolor LED instance.
If I'm wrong, I'd be happy to not have to add the sysfs files.

> 
> (...)
> 

I addressed all the other comments for my v4.


Thanks,
Steffn

-- 
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

