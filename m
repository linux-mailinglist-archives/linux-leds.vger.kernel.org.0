Return-Path: <linux-leds+bounces-8194-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKoYDMXmCmqJ9AQAu9opvQ
	(envelope-from <linux-leds+bounces-8194-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:15:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9756A85C
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5653301A916
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D56325483;
	Mon, 18 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW472Y2+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A931F9B8;
	Mon, 18 May 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099214; cv=none; b=Mcft4UOAU0N4TyBm8DEa/Il54WStP42wleFFpGyeWYg7p20hHXYkfLDqNBuzqCk/WVJJZ7bjdSWfJfpMjSlAmeL1ruq0K/8L4zrDx1gBavpC2MrlVbKyz1sBudBOdWDPXWYcSzuSX1Csoymt96NBb99NTSeLf/SBsQoTn8xEetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099214; c=relaxed/simple;
	bh=BQnBx6WnqKgG+17up62Cx3dfKsGKFlZElr3ORMxdMWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aqz/cg4pfv6imypxe0lGBa6sTJQhbhq5sL7oD/SAoAv51CN/xJbusqqVe6wyPm6YNbWu81lgyOR68k7fRyNVcMFepAj0W+/wiunCZkMlw3dUuya0VQxxVLm5EJ14YiPosD0k6Kofl9NAfJUJ5vf8jatEhvdqva1HdQwCusPie0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW472Y2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C92FC2BCB7;
	Mon, 18 May 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779099214;
	bh=BQnBx6WnqKgG+17up62Cx3dfKsGKFlZElr3ORMxdMWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aW472Y2+pFZ+EzChXNYWW6iOpgzrk5uXaaC7iqKp6atHhWSSU5/vCFwUmFtIuwPHO
	 rLkACdXJSVwwG5eZsX9BzO88mxSrnMe9zysXIxbapMu3XkRROtjRVqdiC1jRCUK5GF
	 QPOvJWAXFgQ92hvTO7+XzG6hoRH0arP8R5ztHUu9rAY/0EK7mL8nutdNN3daFNlgFs
	 y4xNolZ5BBOm9tCqbd8IYe6efWFui04gRqdhSP2UZf39kRzo2gbd2wQOnWiW4DJ/+R
	 +3KvrQMbk+hpSlHpmDrkOieHKswyEREcRtxVsR2A0UjvdZzAYW7eZBcwagLL7VQPnC
	 BGCy8qVYj9Urg==
Date: Mon, 18 May 2026 11:13:28 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
Message-ID: <20260518101328.GS305027@google.com>
References: <20260502124055.22475-1-clamor95@gmail.com>
 <20260502124055.22475-3-clamor95@gmail.com>
 <20260514100205.GG305027@google.com>
 <CAPVz0n07EKiF=Gi=Po0zFVSuU=g4pbhJam7VHgiQsPTwtT2wQg@mail.gmail.com>
 <20260514155004.GO305027@google.com>
 <CAPVz0n1drWV6zMzOx93gHNaw+Tt0M9oAF2RyKW6tZcC2gF_HAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1drWV6zMzOx93gHNaw+Tt0M9oAF2RyKW6tZcC2gF_HAQ@mail.gmail.com>
X-Rspamd-Queue-Id: 87A9756A85C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8194-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qmqm.pl:email]
X-Rspamd-Action: no action

On Thu, 14 May 2026, Svyatoslav Ryhel wrote:

> чт, 14 трав. 2026 р. о 18:50 Lee Jones <lee@kernel.org> пише:
> >
> > On Thu, 14 May 2026, Svyatoslav Ryhel wrote:
> >
> > > чт, 14 трав. 2026 р. о 13:02 Lee Jones <lee@kernel.org> пише:
> > > >
> > > > On Sat, 02 May 2026, Svyatoslav Ryhel wrote:
> > > >
> > > > > From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > > >
> > > > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > > > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > > > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > > > detection and common operations for EC's functions.
> > > > >
> > > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > > > ---
> > > > >  drivers/mfd/Kconfig                     |  14 +
> > > > >  drivers/mfd/Makefile                    |   1 +
> > > > >  drivers/mfd/asus-transformer-ec.c       | 762 ++++++++++++++++++++++++
> > > > >  include/linux/mfd/asus-transformer-ec.h | 162 +++++
> > > > >  4 files changed, 939 insertions(+)
> > > > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > > > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
> >
> > [...]
> >
> > > > > +     unsigned int num_devices;
> > > > > +     bool clr_fmode; /* clear Factory Mode bit in EC control register */
> > > > > +};
> > > > > +
> > > > > +struct asus_ec_data {
> > > > > +     struct asusec_info info;
> > > >
> > > > You have 'data' and 'info' which a) using non-forthcoming nomenclature
> > > > and doesn't tell me anything and then you b) put 'info' in the device's
> > > > driver_data attribute which is very confusing.  driver_data should be
> > > > for what we call ddata which I assume is expressed as 'data' here.
> > > >
> > >
> > > asusec_info is shared among all child devices and is exposed while
> > > remaining elements of this struct are for internal use only.
> >
> > Our terminology for that is usually ddata, that gets stored in
> > 'struct devices' device_data attribute.
> >
> > > > > +     struct mutex ecreq_lock; /* prevent simultaneous access */
> > > > > +     struct gpio_desc *ecreq;
> > > >
> > > > If I hadn't seen the declaration, I'd have no idea this was a GPIO
> > > > descriptor.  Please improve the nomenclature throughout.
> > > >
> > > > > +     struct i2c_client *self;
> > > >
> > > > Again, please use standard naming conventions:
> > > >
> > > > % git grep "struct i2c_client" | grep "\*self" | wc -l
> > > > 0
> > > >
> > > > % git grep "struct i2c_client" | grep "\*client" | wc -l
> > > > 6304
> > > >
> > > > % git grep "struct i2c_client" | grep "\*i2c" | wc -l
> > > > 903
> > > >
> > >
> > > ok, noted.
> > >
> > > > > +     const struct asus_ec_chip_data *data;
> > > >
> > > > 'data', 'priv' and 'info' should be improved.
> > > >
> > > > > +     char ec_data[DOCKRAM_ENTRY_BUFSIZE];
> > > >
> > > > An array of chars called 'data'.  This could be anything.
> > > >
> > >
> > > Do you have a comprehensive list of name conventions you find suitable?
> >
> > Anything descriptive that alludes to the type of data being held there.
> >
> > There are 100's of good examples, but a handful of generic / bad ones.
> >
> > > > > +     bool logging_disabled;
> > > >
> > > > This debugging tool is probably never going to be used again.
> > > >
> > > > Keep it local.
> > > >
> > > > > +};
> > > > > +
> > > > > +struct dockram_ec_data {
> > > > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > > +};
> > > > > +
> > > > > +#define to_ec_data(ec) \
> > > > > +     container_of(ec, struct asus_ec_data, info)
> > > > > +
> > > > > +/**
> > > > > + * asus_dockram_read - Read a register from the DockRAM device.
> > > > > + * @client: Handle to the DockRAM device.
> > > > > + * @reg: Register to read.
> > > > > + * @buf: Byte array into which data will be read; must be large enough to
> > > > > + *    hold the data returned by the DockRAM.
> > > > > + *
> > > > > + * This executes the DockRAM read based on the SMBus "block read" protocol
> > > > > + * or its emulation. It extracts DOCKRAM_ENTRY_SIZE bytes from the set
> > > > > + * register address.
> > > > > + *
> > > > > + * Returns a negative errno code else zero on success.
> > > > > + */
> > > > > +int asus_dockram_read(struct i2c_client *client, int reg, char *buf)
> > > > > +{
> > > >
> > > > Have you considered using Regmap for register access instead of
> > > > implementing custom functions?  Remaps already deals with caching and
> > > > locking mechanisms that you'd get for free.
> > > >
> > > > This looks like it would be replaced with devm_regmap_init_i2c().
> > > >
> > >
> > > I will consider this, thank you.
> > >
> 
> It seems that regmap does not fit for this purpose, but I might switch
> to plain i2c_smbus_read_i2c_block_data

Can you explain why Regmap doesn't work for you?

Regmap is just a wrapper about i2c_smbus_read_i2c_block_data() and friends.

> > > > > +     struct device *dev = &client->dev;
> > > > > +     int ret;
> > > > > +
> > > > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > > > +     ret = i2c_smbus_read_i2c_block_data(client, reg,
> > > > > +                                         DOCKRAM_ENTRY_BUFSIZE, buf);
> > > > > +     if (ret < 0)
> > > > > +             return ret;
> > > > > +
> > > > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > > > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > > > +             return -EPROTO;
> > > > > +     }
> > > > > +
> > > > > +     dev_dbg(dev, "got data; buffer: %*ph; ret: %d\n",
> > > > > +             DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > >
> > > > Please remove all of these debug messages.
> > > >
> > >
> > > Why debug messages cannot be preserved? They are specifically marked as dev_dbg
> >
> > It's a general convention.
> >
> > After initial development, they tend to just litter the code-base.
> >
> > Debug prints can be useful higher up the stack though.
> >
> 
> I am fine with removing all debugs and logging but I strongly would
> like to keep EC model and firmware version along with susb and factory
> status. That may be quite useful in identifying EC used and its
> behavior without need in rebuilding the kernel and digging huge piles
> of downstream code in order to find how to dump these values.

Yes, you can keep this sort of thing as INFO.

-- 
Lee Jones

