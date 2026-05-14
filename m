Return-Path: <linux-leds+bounces-8110-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNmBEx3zBWq3dgIAu9opvQ
	(envelope-from <linux-leds+bounces-8110-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 18:06:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF0354476C
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 18:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD95300A3AE
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8E232AAB2;
	Thu, 14 May 2026 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GC6KzMUx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B80324B2C
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774781; cv=pass; b=ObnSRmXwk+v2Lwh7Ur1ewAYeDxKArEex/OrsDJlepJ141oBEBbyhIXqqdxb80Cc8qFWNSh7TKbGvH6sCnM71PnU3S/hxzCJuDBI1Os5jGHWipXvpdf/v5dQxP+OBjhqwDl50RBwuEyvdBpYZh0xnLVnRFaXylDJz4Y8rw0sMdLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774781; c=relaxed/simple;
	bh=j9suRQuZuobzCfpiZ7wiScmRD3rs3krl5OXZLh/OmjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOilVRcK+LXqCe+hSAFIPrII1tEeAnseFxUdL5t81lELZhKOFIF51r8NQ4mFCLliCpeAzJB6gajKWtsxB5YkMWzyMqv77M40ywh5JSH9KiwIvJg3eELRaCDg8EhRXImNf1BWBTKG0cmD53129svtmd/lnJEIY2iLn5AMSfNJBEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GC6KzMUx; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f7020a928eso11441469eec.1
        for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 09:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778774779; cv=none;
        d=google.com; s=arc-20240605;
        b=OKI+idS2oWF1KAzf+SyRINN3+uypxyhUmAv+8F60/gDTpoZpUKi2GdaeNVevd9cIL2
         g757X9XB6POA4ulOIH8hubZbOUSBIGk7KOxlh/rW+KNe4DYa38oCnXeuGrTDsWhA17bQ
         TVrXaIIFLgfB/H0na+z8+CiEgF0nITkU35qoqIzSeFQy0xA6AWY3PIFkPd7/tJE+xdHE
         Ffi0MIgnIJQMAnNbUsAy3inYxH0+Z9g8KKwCTB/L/+lLKEw9sfxwd7SHV0s6XH9ecb8u
         3hzoz3cW9OLjyiRuRW1CdybnFFUEJ6d1uX1HO+xWnSJGPz9l3Y5e9eqoDpgZbM8f1PdA
         5ROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0dhYlRWsR1wORqN5bM52V5SF0FAyiyXKcrtdAzo1AJk=;
        fh=ikhlVaTs6Rzm2XHoREOWXLEVCBI+awJ9daIexQUBbvI=;
        b=P0uF45wOK5rr05rtd1IP7VGvvu3v34n+AWLiT3k9KuRg9usmHEOsF7aOm5uHXW7JrQ
         xhnEYKxW8TijB08iMVY5lca7zZpiBGYOOo3RZFzVweOQHcE0twD2ipchOik40GLz5Ti4
         X91WpG49lXPZq/YN6u7NixgCZBUQ6ttTOjahP/I42iB0FU7FlSQAIvQeWUNwxjfAkw0m
         QqwOACDJIVcRBhkY8wLtId2F3Xr6l/JenMimRWlzyvy1RCZT9+u2rQPUMKCqqugVgAPv
         v30uKEUaHtOdtRiySzyPnTjvk3RRkc5xiF84cTtZ56+hZR+7yorRZTUbJONk94lePmqo
         FHuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778774779; x=1779379579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dhYlRWsR1wORqN5bM52V5SF0FAyiyXKcrtdAzo1AJk=;
        b=GC6KzMUxwJh0oiH+0Lc5KrXdp+xIRu0tME70I+M9HcltVKdgm21kwMtpByK3eeJez+
         5IsCH3i+zw41a49n9h1+Mr6TbMQciSOrJlpfxbpgqWk85zrl+apYMUaqFzr7X6ZZY5Su
         ULyM7gdNKVZyAJ9DsIHBlST2Ihp5ZVTI6c1TQ9daFh6th4ghlnDy+v3EmaKYQgaD9GJ4
         Cl0zjAshXrfIUJYp2qETqHT4vkvnSgb4JvfuBICYvjvkRKh84Bc8QU2Ln/YeL5iyQbUv
         WS7ozQObakWQ6nrVkPf5ColSKFRDEsOwaKJNccbwabBUNO0tE9Xnmlfli0C7jEFe5dNC
         9MAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778774779; x=1779379579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dhYlRWsR1wORqN5bM52V5SF0FAyiyXKcrtdAzo1AJk=;
        b=KwvC2ijjNbe8OAlvLVMg2J8av43QzvKqe5oBKxPwbk10PVB4NkUzLa5c9AppH8PkBT
         v5gPqLx5Gk+6EsXE/nhTgWejphrl4xGIHYXkDTbHKnRin1zmS45nuOInw2x48vnrCt1P
         t+/sYaNAHfddYRRrok3pvJGtqli3dUZ8ASgyWDTVbUiesjZW4/Wm2e+I92ZNib/cCqkT
         u/8q0BknrHs/Knc/IraTTwUUbgdii6qF7EFiN6MMl6mV16kIIWbdbTkW9nSmTfezdIGX
         DeeZ5jjrGVS2lKGSGb1MlWNBbHX4MsTv3CMWdiS2OgOeyDspJki6dDSkHI5sodjHlWTg
         PQxA==
X-Forwarded-Encrypted: i=1; AFNElJ/XNEDlT6PwOO3ecPryBI64tTlz7I7rIK/guX/qTMeJhL16pZFnJcDA0xDdnDqgRaYucrJnEC98dHZv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjf7AVdcWZlMYTxBvACPr9HxO+lK5Oai8/xJYvSYRufWs3Zlf7
	aROjm+LCEQC15HOLZMuORxDir+oaamv12Kya5n1Cv3atlib/4n/k5+cBdOOkA1s4NC2sDQl6O+/
	C/5GBKxPtYJjySB9UkLCOPoOBZ6qWMDg=
X-Gm-Gg: Acq92OFCX/P37AOUPFllTuCzzWf0nvO35eA491H61xK1twcB1CeddYcADaprfhzMZaG
	tYCSVghOx7xXeQjhGFq7hv6YMAvyuL86JD194HFJxKS3evHEBFktg49y21K6SSU54EY0y9m+jNv
	rRVqHEm56qThK/dFcy2bAty93ykTNld2uFbAQ/crLqraoNO2ZqPHjq+GICKVaZ/M+jZoQo2Moxl
	j0ZzJSqdYvd0Pc0CBATDSGK3+r03oij8ouyVGgGbDfgJSU78upTRQ8HF5va3e8CUrRoLVP8geYE
	re4cEjnq
X-Received: by 2002:a05:7301:1284:b0:2ed:6f94:9d96 with SMTP id
 5a478bee46e88-30398678a67mr33356eec.19.1778774778431; Thu, 14 May 2026
 09:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502124055.22475-1-clamor95@gmail.com> <20260502124055.22475-3-clamor95@gmail.com>
 <20260514100205.GG305027@google.com> <CAPVz0n07EKiF=Gi=Po0zFVSuU=g4pbhJam7VHgiQsPTwtT2wQg@mail.gmail.com>
 <20260514155004.GO305027@google.com>
In-Reply-To: <20260514155004.GO305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 14 May 2026 19:06:06 +0300
X-Gm-Features: AVHnY4KX7e3C_PI4mMFwkKQnYlMIPyqlXz9PTdJKjX9gmozOvafe-GkWXdVoCPw
Message-ID: <CAPVz0n1drWV6zMzOx93gHNaw+Tt0M9oAF2RyKW6tZcC2gF_HAQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ABF0354476C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8110-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 18:5=
0 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 14 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
13:02 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sat, 02 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > >
> > > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201=
,
> > > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 =
dock
> > > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > > detection and common operations for EC's functions.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > ---
> > > >  drivers/mfd/Kconfig                     |  14 +
> > > >  drivers/mfd/Makefile                    |   1 +
> > > >  drivers/mfd/asus-transformer-ec.c       | 762 ++++++++++++++++++++=
++++
> > > >  include/linux/mfd/asus-transformer-ec.h | 162 +++++
> > > >  4 files changed, 939 insertions(+)
> > > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
>
> [...]
>
> > > > +     unsigned int num_devices;
> > > > +     bool clr_fmode; /* clear Factory Mode bit in EC control regis=
ter */
> > > > +};
> > > > +
> > > > +struct asus_ec_data {
> > > > +     struct asusec_info info;
> > >
> > > You have 'data' and 'info' which a) using non-forthcoming nomenclatur=
e
> > > and doesn't tell me anything and then you b) put 'info' in the device=
's
> > > driver_data attribute which is very confusing.  driver_data should be
> > > for what we call ddata which I assume is expressed as 'data' here.
> > >
> >
> > asusec_info is shared among all child devices and is exposed while
> > remaining elements of this struct are for internal use only.
>
> Our terminology for that is usually ddata, that gets stored in
> 'struct devices' device_data attribute.
>
> > > > +     struct mutex ecreq_lock; /* prevent simultaneous access */
> > > > +     struct gpio_desc *ecreq;
> > >
> > > If I hadn't seen the declaration, I'd have no idea this was a GPIO
> > > descriptor.  Please improve the nomenclature throughout.
> > >
> > > > +     struct i2c_client *self;
> > >
> > > Again, please use standard naming conventions:
> > >
> > > % git grep "struct i2c_client" | grep "\*self" | wc -l
> > > 0
> > >
> > > % git grep "struct i2c_client" | grep "\*client" | wc -l
> > > 6304
> > >
> > > % git grep "struct i2c_client" | grep "\*i2c" | wc -l
> > > 903
> > >
> >
> > ok, noted.
> >
> > > > +     const struct asus_ec_chip_data *data;
> > >
> > > 'data', 'priv' and 'info' should be improved.
> > >
> > > > +     char ec_data[DOCKRAM_ENTRY_BUFSIZE];
> > >
> > > An array of chars called 'data'.  This could be anything.
> > >
> >
> > Do you have a comprehensive list of name conventions you find suitable?
>
> Anything descriptive that alludes to the type of data being held there.
>
> There are 100's of good examples, but a handful of generic / bad ones.
>
> > > > +     bool logging_disabled;
> > >
> > > This debugging tool is probably never going to be used again.
> > >
> > > Keep it local.
> > >
> > > > +};
> > > > +
> > > > +struct dockram_ec_data {
> > > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > +};
> > > > +
> > > > +#define to_ec_data(ec) \
> > > > +     container_of(ec, struct asus_ec_data, info)
> > > > +
> > > > +/**
> > > > + * asus_dockram_read - Read a register from the DockRAM device.
> > > > + * @client: Handle to the DockRAM device.
> > > > + * @reg: Register to read.
> > > > + * @buf: Byte array into which data will be read; must be large en=
ough to
> > > > + *    hold the data returned by the DockRAM.
> > > > + *
> > > > + * This executes the DockRAM read based on the SMBus "block read" =
protocol
> > > > + * or its emulation. It extracts DOCKRAM_ENTRY_SIZE bytes from the=
 set
> > > > + * register address.
> > > > + *
> > > > + * Returns a negative errno code else zero on success.
> > > > + */
> > > > +int asus_dockram_read(struct i2c_client *client, int reg, char *bu=
f)
> > > > +{
> > >
> > > Have you considered using Regmap for register access instead of
> > > implementing custom functions?  Remaps already deals with caching and
> > > locking mechanisms that you'd get for free.
> > >
> > > This looks like it would be replaced with devm_regmap_init_i2c().
> > >
> >
> > I will consider this, thank you.
> >

It seems that regmap does not fit for this purpose, but I might switch
to plain i2c_smbus_read_i2c_block_data

> > > > +     struct device *dev =3D &client->dev;
> > > > +     int ret;
> > > > +
> > > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > > +     ret =3D i2c_smbus_read_i2c_block_data(client, reg,
> > > > +                                         DOCKRAM_ENTRY_BUFSIZE, bu=
f);
> > > > +     if (ret < 0)
> > > > +             return ret;
> > > > +
> > > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > > +             return -EPROTO;
> > > > +     }
> > > > +
> > > > +     dev_dbg(dev, "got data; buffer: %*ph; ret: %d\n",
> > > > +             DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > >
> > > Please remove all of these debug messages.
> > >
> >
> > Why debug messages cannot be preserved? They are specifically marked as=
 dev_dbg
>
> It's a general convention.
>
> After initial development, they tend to just litter the code-base.
>
> Debug prints can be useful higher up the stack though.
>

I am fine with removing all debugs and logging but I strongly would
like to keep EC model and firmware version along with susb and factory
status. That may be quite useful in identifying EC used and its
behavior without need in rebuilding the kernel and digging huge piles
of downstream code in order to find how to dump these values.

> [...]
>
> > > > +/**
> > > > + * devm_asus_ec_register_notifier - Managed registration of notifi=
er to an
> > > > + *                               ASUS EC blocking notifier chain.
> > > > + * @pdev: Device requesting the notifier (used for resource manage=
ment).
> > > > + * @nb: Notifier block to be registered.
> > > > + *
> > > > + * Register a notifier to the ASUS EC blocking notifier chain. The=
 notifier
> > > > + * will be automatically unregistered when the requesting device i=
s detached.
> > > > + *
> > > > + * Return: 0 on success or a negative error code on failure.
> > > > + */
> > > > +int devm_asus_ec_register_notifier(struct platform_device *pdev,
> > > > +                                struct notifier_block *nb)
> > > > +{
> > >
> > > Hand-rolling devres managed resources is usually reserved for subsyst=
em
> > > level API calls.  Why do the usual device driver .remove() handling w=
ork
> > > for you?
> > >
> >
> > This is used by 3 subdevices: serio, keys and charger, so this just
> > seems cleaner way to register and deregister notifier.
>
> Clean to me would be to use the infrastructure that's put in place
> already.  Unless I am missing the point of all of this.
>
> [...]
>
> > > > +     int ret;
> > > > +
> > > > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_=
I2C_BLOCK))
> > > > +             return dev_err_probe(dev, -ENXIO,
> > > > +                     "I2C bus is missing required SMBus block mode=
 support\n");
> > > > +
> > > > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     priv->data =3D device_get_match_data(dev);
> > > > +     if (!priv->data)
> > > > +             return -ENODEV;
> > > > +
> > > > +     i2c_set_clientdata(client, priv);
> > > > +     priv->self =3D client;
> > > > +
> > > > +     priv->info.dockram =3D devm_asus_dockram_get(dev);
> > > > +     if (IS_ERR(priv->info.dockram))
> > > > +             return dev_err_probe(dev, PTR_ERR(priv->info.dockram)=
,
> > > > +                                  "failed to get dockram\n");
> > > > +
> > > > +     priv->ecreq =3D devm_gpiod_get(dev, "request", GPIOD_OUT_LOW)=
;
> > > > +     if (IS_ERR(priv->ecreq))
> > > > +             return dev_err_probe(dev, PTR_ERR(priv->ecreq),
> > > > +                                  "failed to get request GPIO\n");
> > >
> > > "get" or "request"
> > >
> >
> > request is gpio's name, request gpio
>
> Ah yes.  Maybe use 's to help with that.  Right now is just reads strange=
ly.
>
> [...]
>
> --
> Lee Jones

