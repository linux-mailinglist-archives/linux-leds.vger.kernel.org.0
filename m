Return-Path: <linux-leds+bounces-5746-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462BBD228B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 10:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843DF1899649
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 08:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517242FB608;
	Mon, 13 Oct 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b="VaaJ/2+F"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD9034BA41;
	Mon, 13 Oct 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.243.197.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345741; cv=none; b=dghHzVAoaoabP0KGo+lDyIPOEhadcM7KEbERAqU4K6VKL7wPw1Oyi5YMLfxPgFw35nz9HL7kQVq4/cpyYkm4l6l8d0eQ/swcKz2rPxQ9kfdVHpiigj1A1g8SGVwjAgurTV6DFC53+mtfOxiuRDiSptJCeJMknF8oo+G5fLskdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345741; c=relaxed/simple;
	bh=o5seUCJtivNGWArJ7uKirtNugIYIcisVModvsY2Dfkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mP4cPNuu3HBrDFcXLc9YsXrOleEiVGQnEQ9QXU9J77/7Xj8xeAvYvCvAMNX1ITXsk5hA2NCTF4QGu0zeOZUVGLhdNFWiXhJjti8OWdUg2Z9AoE/eY+u8EoxIuBw2Pg2UZ8M2ehujPUHHMnhrVpm1bm6fQwCcbGn2pXOE2yVl9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li; spf=pass smtp.mailfrom=klarinett.li; dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li header.b=VaaJ/2+F; arc=none smtp.client-ip=212.243.197.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=klarinett.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=klarinett.li
Received: from localhost (localhost [127.0.0.1])
	by mail.hostpark.net (Postfix) with ESMTP id 15B55162FB;
	Mon, 13 Oct 2025 10:55:30 +0200 (CEST)
Authentication-Results: mail0.hostpark.net (amavis); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=klarinett.li
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klarinett.li; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from; s=
	sel2011a; t=1760345729; bh=o5seUCJtivNGWArJ7uKirtNugIYIcisVModvs
	Y2Dfkk=; b=VaaJ/2+Fjx/piV0zzNS3XtAd9rOMgRmolhN6TVVZ7S91p63ybPb9M
	k9XOQUba9ToNLKxlPgmDKYnXFY4YbuRpI44k7vJf2Le+RfDLNnlqQRqnZ+6nRe1M
	cqHQTLDwcRq4VL7TbBWkf99dB4RPB1txnxAS1JKenvEquApMctmWP4=
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id p3ezNfMLZ4UJ; Mon, 13 Oct 2025 10:55:29 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.hostpark.net (Postfix) with ESMTPSA id 63477162C7;
	Mon, 13 Oct 2025 10:55:28 +0200 (CEST)
From: Christian Hitz <christian@klarinett.li>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Christian Hitz <christian@klarinett.li>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: leds-lp50xx: allow LED 0 to be added to module bank
Date: Mon, 13 Oct 2025 10:54:42 +0200
Message-ID: <20251013085514.512508-1-christian@klarinett.li>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <6f6fbebf-bdb6-402d-8aa1-9f33eae914ed@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 11 Oct 2025 14:16:16 +0200 Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Hi Christian,
> 
> On 10/8/25 14:32, Christian Hitz wrote:
> > From: Christian Hitz <christian.hitz@bbv.ch>
> > 
> > led_banks contains LED module number(s) that should be grouped into the
> > module bank. led_banks is 0-initialized.
> > By checking the led_banks entries for 0, un-set entries are detected.
> > But a 0-entry also indicates that LED module 0 should be grouped into the
> > module bank.
> > 
> > By only iterating over the available entries no check for unused entries
> > is required and LED module 0 can be added to bank.
> > 
> > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> > Cc: stable@vger.kernel.org
> > ---
> >   drivers/leds/leds-lp50xx.c | 10 ++++------
> >   1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index 94f8ef6b482c..d50c7f3e8f99 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -341,17 +341,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
> >   	return ret;
> >   }
> >   
> > -static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
> > +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
> >   {
> >   	u8 led_config_lo, led_config_hi;
> >   	u32 bank_enable_mask = 0;
> >   	int ret;
> >   	int i;
> >   
> > -	for (i = 0; i < priv->chip_info->max_modules; i++) {
> > -		if (led_banks[i])
> > -			bank_enable_mask |= (1 << led_banks[i]);
> > -	}
> > +	for (i = 0; i < num_leds; i++)
> > +		bank_enable_mask |= (1 << led_banks[i]);
> 
> Probably the first idea was to have a bitmask indicating which bank
> to enable, but it ended up in having array of bank ids in DT with no
> related adjustment in the driver.
> 
> This patch deserves Fixes tag.

This code has not changed since the inital introduction of this driver.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")

> 
> >   
> >   	led_config_lo = bank_enable_mask;
> >   	led_config_hi = bank_enable_mask >> 8;
> > @@ -405,7 +403,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
> >   			return ret;
> >   		}
> >   
> > -		ret = lp50xx_set_banks(priv, led_banks);
> > +		ret = lp50xx_set_banks(priv, led_banks, num_leds);
> >   		if (ret) {
> >   			dev_err(priv->dev, "Cannot setup banked LEDs\n");
> >   			return ret;
> 
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> -- 
> Best regards,
> Jacek Anaszewski

Sent using hkml (https://github.com/sjp38/hackermail)

