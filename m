Return-Path: <linux-leds+bounces-8182-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DbnL8zbCmog8wQAu9opvQ
	(envelope-from <linux-leds+bounces-8182-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:28:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2D569B3E
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 11:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57A503006445
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 09:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD563E558C;
	Mon, 18 May 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESY+xpJZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861693D5645;
	Mon, 18 May 2026 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096520; cv=none; b=IACjQ5GP83dqu1lTdVQdmDx90JYE1d9i/hFlE70aHBLSBuy7G8/+XPHSY9RADUJNIgoSYRCLAdN3OOCK5evSBmRgZ/Rlfw4pHRM396lAekBQqDySMEWS07LMI7M3h4Ql4XLj2aVmZwkEPg+W8P3QpR4saeS8TNizcxYfvJDdO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096520; c=relaxed/simple;
	bh=7jiJVFaVHqEpa/vY/b3zqTBK38U2WD0zOHsbX172uxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dahGcXgZmLhZaYDaE7m1VeOguTJxNM2Cp0UQkZdUCbAiP0U4D/yu9SPnHm2VippfPX2F/cCE4PK21bmou+7usqxLIRuNEaBCniCoF2U2NUo91s5u1TvBRKZrq5qI+ReZCnSHjZdNsbCHtucBaTxjyccuua/1gtcObhwVoWfxCjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESY+xpJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868EFC2BCB7;
	Mon, 18 May 2026 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779096520;
	bh=7jiJVFaVHqEpa/vY/b3zqTBK38U2WD0zOHsbX172uxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ESY+xpJZgiiW4dRX8xsLvNDZmYnhOex4lRiGucdsAAVVJtLaDyolBvPLJSdT8VfIW
	 tckw9m8JIdJKD5ofNEYNKcKoqL6AyHGgQ8QbbM3vv8RO4uLRccRI4juJk2casLeUZq
	 QpuS6UrR10ckEjX9x1Ko6iWj0BEkwLRNt3R2xWIcsAaeAvzg5PWgiTqLxvLxc5K3Ve
	 cRX71Qfiut2MUbDlDb0TbAqauT35lOXrnhnX2nteQVbwmena0k2Ss2JF22zbsb3a6+
	 /hvcbfD/anLXCJ5qvgofQzBIaCQ6x4U7ho8U+pg0y5RvxVkKD0ImFMO8YFfoNyEf6P
	 Q9j3aLarx5boA==
Date: Mon, 18 May 2026 10:28:33 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Rob Herring <robh@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org, Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260518092833.GR305027@google.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
 <20260517074306.30937-3-clamor95@gmail.com>
 <CAPVz0n3gLYXab4H+DihfTkdBkGPqTvmoFVY1Cwuafd70KPtYbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n3gLYXab4H+DihfTkdBkGPqTvmoFVY1Cwuafd70KPtYbA@mail.gmail.com>
X-Rspamd-Queue-Id: 6AB2D569B3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8182-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 17 May 2026, Svyatoslav Ryhel wrote:

> нд, 17 трав. 2026 р. о 10:43 Svyatoslav Ryhel <clamor95@gmail.com> пише:
> >
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> > Additionally, optimize functions used only by platform data.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/iio/light/lm3533-als.c      | 123 +++++--------
> >  drivers/leds/leds-lm3533.c          |  60 ++++---
> >  drivers/mfd/lm3533-core.c           | 257 +++++++++-------------------
> >  drivers/video/backlight/lm3533_bl.c |  52 ++++--
> >  include/linux/mfd/lm3533.h          |  51 +-----
> >  5 files changed, 202 insertions(+), 341 deletions(-)

Please snip replies.

[...]

> > -static int lm3533_device_led_init(struct lm3533 *lm3533)
> > -{
> > -       struct lm3533_platform_data *pdata = dev_get_platdata(lm3533->dev);
> > -       int i;
> > -       int ret;
> > -
> > -       if (!pdata->leds || pdata->num_leds == 0)
> > -               return 0;
> > -
> > -       if (pdata->num_leds > ARRAY_SIZE(lm3533_led_devs))
> > -               pdata->num_leds = ARRAY_SIZE(lm3533_led_devs);
> > -
> > -       for (i = 0; i < pdata->num_leds; ++i) {
> > -               lm3533_led_devs[i].platform_data = &pdata->leds[i];
> > -               lm3533_led_devs[i].pdata_size = sizeof(pdata->leds[i]);
> > +               dev_err(dev, "failed to set boost ovp\n");
> > +               goto err_disable;
> >         }
> >
> > -       ret = mfd_add_devices(lm3533->dev, 0, lm3533_led_devs,
> > -                             pdata->num_leds, NULL, 0, NULL);
> > +       ret = devm_mfd_add_devices(dev, 0, lm3533_child_devices,
> > +                                  ARRAY_SIZE(lm3533_child_devices),
> > +                                  NULL, 0, NULL);
> 
> Question to Lee Jones. Would you find acceptable if the driver will
> build cell list dynamically based on the nodes in the device tree?
> This is LED controller after all, not all leds can be populated and
> same LED control bank can be linked to all LVLEDs for example.
> 
> If you are ok, would this implementation satisfy you?

Generally not.  Create the non-dynamical information statically
(obviously not 'const'), then you can add dynamic data as you go.

>         struct mfd_cell lm3533_cells[LM3533_CELLS_MAX];
>         u32 count = 0, reg;
>         int ret;
> 
>         device_for_each_child_node_scoped(lm3533->dev, child) {
>                 if (!fwnode_device_is_available(child))
>                         continue;
> 
>                 if (count >= LM3533_CELLS_MAX)
>                         break;
> 
>                 if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
>                         lm3533_cells[count].name = "lm3533-als";
>                         lm3533_cells[count].id = PLATFORM_DEVID_NONE;
>                         lm3533_cells[count].of_compatible = "ti,lm3533-als";
> 
>                         lm3533->have_als = true;
>                 }
> 
>                 if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
>                         ret = fwnode_property_read_u32(child, "reg", &reg);
>                         if (ret || reg > LM3533_HVLED_ID_MAX) {
>                                 dev_err(dev, "invalid backlight reg %d\n", reg);
>                                 continue;
>                         }
> 
>                         lm3533_cells[count].name = "lm3533-backlight";
>                         lm3533_cells[count].id = reg;
>                         lm3533_cells[count].of_compatible =
> "ti,lm3533-backlight";
> 
>                         lm3533->have_backlights = true;
>                 }
> 
>                 if (fwnode_device_is_compatible(child, "ti,lm3533-leds")) {
>                         ret = fwnode_property_read_u32(child, "reg", &reg);
>                         if (ret || reg < LM3533_HVLED_ID_MAX ||
>                             reg > LM3533_LVLED_ID_MAX) {
>                                 dev_err(dev, "invalid LED reg %d\n", reg);
>                                 continue;
>                         }
> 
>                         lm3533_cells[count].name = "lm3533-leds";
>                         lm3533_cells[count].id = reg - LM3533_HVLED_ID_MAX;
>                         lm3533_cells[count].of_compatible = "ti,lm3533-leds";
> 
>                         lm3533->have_leds = true;
>                 }
> 
>                 count++;
>         }
> 
> >         if (ret) {
> > -               dev_err(lm3533->dev, "failed to add LED devices\n");
> > -               return ret;
> > -       }
> > -
> > -       lm3533->have_leds = 1;
> > -
> > -       return 0;
> > -}

[...]

-- 
Lee Jones

