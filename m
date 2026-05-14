Return-Path: <linux-leds+bounces-8109-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DsiNUnvBWpWdgIAu9opvQ
	(envelope-from <linux-leds+bounces-8109-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 17:50:33 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CB54447D
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 17:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3190230125C5
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 15:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0729128505E;
	Thu, 14 May 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmTbH3cC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017E30E859;
	Thu, 14 May 2026 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773810; cv=none; b=PNhFiz9lj4Bd+tkRh18/DzfZR9d9ApLBCiQD3CCE4MOXvz79ooNM1b3wnP+kaG1B1tbp5uTiud+lP4gfrLofcQUn5ZUH82g1SdWDysDOwupPXLpAEkWIN7R7OgnowuUmfhz57DNU5En/q4aEq+l7avWi2zLsh5UoFNVOonHR6rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773810; c=relaxed/simple;
	bh=1nNqnj/Z74+jrGwiCUrWSxU4szu7Y9DXWID3BEZGL7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiwATyqs8QPa7r10SSY4jA3LupKFeVlcNsViKOzsBjWutHviu+m8aI0uyR611vKBzvV3b2Gb9oo9YMdQ0IBbGRavEmShijUhHxTh8ZwqX8PfpTV0VCtcdKZET2QPe4PgqIT25Rv18DdJ31kw3TqwrAsQP6wxMEzZT1oG7tILpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmTbH3cC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE274C2BCB3;
	Thu, 14 May 2026 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778773809;
	bh=1nNqnj/Z74+jrGwiCUrWSxU4szu7Y9DXWID3BEZGL7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmTbH3cCzkXkD63Tq3UJ70RYG1wDcY8lY3nJZuWCp1+MBnYWKQdvsX0kKdRoIkRaM
	 bJngmjDtTPHYNutlBeduOMz0nY7uH+3a5i9JnRd0axQxTZqLNoJDFMweDKIxUmXA4q
	 GNRjw9qEsWy0hFffx/rAmGeQIxRS27+96kcD3XIXFjTya0OetlabYmvbZwjPcthjGl
	 GQbPBbkgLjTNyzDoqzUpvoulRmq8Bi+7rFnYq+yM+EW2zXZ2VSGNp2ySuzJ4kpDf8C
	 krtzb4mMRumZPROgQMbHNjoqy1y6iQlsRqXEfJZw+9WGwLyFSakuMscoyN/YeWN8Us
	 HBL1J6Uv5yuFg==
Date: Thu, 14 May 2026 16:50:04 +0100
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
Message-ID: <20260514155004.GO305027@google.com>
References: <20260502124055.22475-1-clamor95@gmail.com>
 <20260502124055.22475-3-clamor95@gmail.com>
 <20260514100205.GG305027@google.com>
 <CAPVz0n07EKiF=Gi=Po0zFVSuU=g4pbhJam7VHgiQsPTwtT2wQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n07EKiF=Gi=Po0zFVSuU=g4pbhJam7VHgiQsPTwtT2wQg@mail.gmail.com>
X-Rspamd-Queue-Id: 7D3CB54447D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8109-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 14 May 2026, Svyatoslav Ryhel wrote:

> чт, 14 трав. 2026 р. о 13:02 Lee Jones <lee@kernel.org> пише:
> >
> > On Sat, 02 May 2026, Svyatoslav Ryhel wrote:
> >
> > > From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > >
> > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > detection and common operations for EC's functions.
> > >
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > > ---
> > >  drivers/mfd/Kconfig                     |  14 +
> > >  drivers/mfd/Makefile                    |   1 +
> > >  drivers/mfd/asus-transformer-ec.c       | 762 ++++++++++++++++++++++++
> > >  include/linux/mfd/asus-transformer-ec.h | 162 +++++
> > >  4 files changed, 939 insertions(+)
> > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h

[...]

> > > +     unsigned int num_devices;
> > > +     bool clr_fmode; /* clear Factory Mode bit in EC control register */
> > > +};
> > > +
> > > +struct asus_ec_data {
> > > +     struct asusec_info info;
> >
> > You have 'data' and 'info' which a) using non-forthcoming nomenclature
> > and doesn't tell me anything and then you b) put 'info' in the device's
> > driver_data attribute which is very confusing.  driver_data should be
> > for what we call ddata which I assume is expressed as 'data' here.
> >
> 
> asusec_info is shared among all child devices and is exposed while
> remaining elements of this struct are for internal use only.

Our terminology for that is usually ddata, that gets stored in
'struct devices' device_data attribute.

> > > +     struct mutex ecreq_lock; /* prevent simultaneous access */
> > > +     struct gpio_desc *ecreq;
> >
> > If I hadn't seen the declaration, I'd have no idea this was a GPIO
> > descriptor.  Please improve the nomenclature throughout.
> >
> > > +     struct i2c_client *self;
> >
> > Again, please use standard naming conventions:
> >
> > % git grep "struct i2c_client" | grep "\*self" | wc -l
> > 0
> >
> > % git grep "struct i2c_client" | grep "\*client" | wc -l
> > 6304
> >
> > % git grep "struct i2c_client" | grep "\*i2c" | wc -l
> > 903
> >
> 
> ok, noted.
> 
> > > +     const struct asus_ec_chip_data *data;
> >
> > 'data', 'priv' and 'info' should be improved.
> >
> > > +     char ec_data[DOCKRAM_ENTRY_BUFSIZE];
> >
> > An array of chars called 'data'.  This could be anything.
> >
> 
> Do you have a comprehensive list of name conventions you find suitable?

Anything descriptive that alludes to the type of data being held there.

There are 100's of good examples, but a handful of generic / bad ones.

> > > +     bool logging_disabled;
> >
> > This debugging tool is probably never going to be used again.
> >
> > Keep it local.
> >
> > > +};
> > > +
> > > +struct dockram_ec_data {
> > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > +};
> > > +
> > > +#define to_ec_data(ec) \
> > > +     container_of(ec, struct asus_ec_data, info)
> > > +
> > > +/**
> > > + * asus_dockram_read - Read a register from the DockRAM device.
> > > + * @client: Handle to the DockRAM device.
> > > + * @reg: Register to read.
> > > + * @buf: Byte array into which data will be read; must be large enough to
> > > + *    hold the data returned by the DockRAM.
> > > + *
> > > + * This executes the DockRAM read based on the SMBus "block read" protocol
> > > + * or its emulation. It extracts DOCKRAM_ENTRY_SIZE bytes from the set
> > > + * register address.
> > > + *
> > > + * Returns a negative errno code else zero on success.
> > > + */
> > > +int asus_dockram_read(struct i2c_client *client, int reg, char *buf)
> > > +{
> >
> > Have you considered using Regmap for register access instead of
> > implementing custom functions?  Remaps already deals with caching and
> > locking mechanisms that you'd get for free.
> >
> > This looks like it would be replaced with devm_regmap_init_i2c().
> >
> 
> I will consider this, thank you.
> 
> > > +     struct device *dev = &client->dev;
> > > +     int ret;
> > > +
> > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > +     ret = i2c_smbus_read_i2c_block_data(client, reg,
> > > +                                         DOCKRAM_ENTRY_BUFSIZE, buf);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > +             return -EPROTO;
> > > +     }
> > > +
> > > +     dev_dbg(dev, "got data; buffer: %*ph; ret: %d\n",
> > > +             DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> >
> > Please remove all of these debug messages.
> >
> 
> Why debug messages cannot be preserved? They are specifically marked as dev_dbg

It's a general convention.

After initial development, they tend to just litter the code-base.

Debug prints can be useful higher up the stack though.

[...] 

> > > +/**
> > > + * devm_asus_ec_register_notifier - Managed registration of notifier to an
> > > + *                               ASUS EC blocking notifier chain.
> > > + * @pdev: Device requesting the notifier (used for resource management).
> > > + * @nb: Notifier block to be registered.
> > > + *
> > > + * Register a notifier to the ASUS EC blocking notifier chain. The notifier
> > > + * will be automatically unregistered when the requesting device is detached.
> > > + *
> > > + * Return: 0 on success or a negative error code on failure.
> > > + */
> > > +int devm_asus_ec_register_notifier(struct platform_device *pdev,
> > > +                                struct notifier_block *nb)
> > > +{
> >
> > Hand-rolling devres managed resources is usually reserved for subsystem
> > level API calls.  Why do the usual device driver .remove() handling work
> > for you?
> >
> 
> This is used by 3 subdevices: serio, keys and charger, so this just
> seems cleaner way to register and deregister notifier.

Clean to me would be to use the infrastructure that's put in place
already.  Unless I am missing the point of all of this.

[...]

> > > +     int ret;
> > > +
> > > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_BLOCK))
> > > +             return dev_err_probe(dev, -ENXIO,
> > > +                     "I2C bus is missing required SMBus block mode support\n");
> > > +
> > > +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->data = device_get_match_data(dev);
> > > +     if (!priv->data)
> > > +             return -ENODEV;
> > > +
> > > +     i2c_set_clientdata(client, priv);
> > > +     priv->self = client;
> > > +
> > > +     priv->info.dockram = devm_asus_dockram_get(dev);
> > > +     if (IS_ERR(priv->info.dockram))
> > > +             return dev_err_probe(dev, PTR_ERR(priv->info.dockram),
> > > +                                  "failed to get dockram\n");
> > > +
> > > +     priv->ecreq = devm_gpiod_get(dev, "request", GPIOD_OUT_LOW);
> > > +     if (IS_ERR(priv->ecreq))
> > > +             return dev_err_probe(dev, PTR_ERR(priv->ecreq),
> > > +                                  "failed to get request GPIO\n");
> >
> > "get" or "request"
> >
> 
> request is gpio's name, request gpio

Ah yes.  Maybe use 's to help with that.  Right now is just reads strangely.

[...]

-- 
Lee Jones

