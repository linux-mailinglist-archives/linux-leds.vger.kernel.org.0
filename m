Return-Path: <linux-leds+bounces-8196-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGw2JtzpCmqR9QQAu9opvQ
	(envelope-from <linux-leds+bounces-8196-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:28:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 437B356AB69
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 12:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A70A2302BCE0
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 10:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47A83E5571;
	Mon, 18 May 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4VCjgKQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1E83E9C07
	for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100082; cv=pass; b=HBTM6kwvauUlGkL5SGwNq+LiEG0szeQ78CtNg2NibLnl8s5QmdItNGeHv6RPbSvHjTwBQX+4ZSpFMBQ3b+4ETyteJ9XRFdrCgoQMCxbYIqLNF3/L4b7CKKw9Mbk1NBUGXAF/J3mOD003uHyakMaM+GJk19LcvJ5Y+oi6oqyz3EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100082; c=relaxed/simple;
	bh=de/RGNl8I6Jd7XzCUxqk4t5+7GUeTAKsKoZdeyJFxBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pNmsCowquE4Pboumq1s1eM25NjzYixiVr/0747pAB2uFLgjOwxivoBp11d7ccFn3jskULQaFvbGK9iJna0PK2gMA86Db9m5l4ZtHWOVNkt6vnOLpxJnvfoE0f91sc/c0aIjV/zvVK7uZjOFCKb3Z7IqMbZd2reZWHJqt7vTQ9H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4VCjgKQ; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2469537eec.1
        for <linux-leds@vger.kernel.org>; Mon, 18 May 2026 03:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779100074; cv=none;
        d=google.com; s=arc-20240605;
        b=PFWFkgiP2Q60D2aSHkgtoNS+2YrkXdLbxdI6MgDcj/Uz79knzjAXsM2xZMDpWcU4qG
         VTtW5mtE+Rx41l52uw+u4gL85NdYOiRdLrmvkUy9CYYay/EcEASU0aA0b/jKpyZ9TbGQ
         cPtp3CqlFHAhctcFSXvVyofMiMBvzI+qdsnwfzqlSpG10QODWqfJCJTTh8dKdoe5g2cr
         fwhu8dYtLkNTP7qw1RXyKCiUHlGbpEY8DaefAHDYfe6WJfN9dY2mM6vIOwlwC+WHddNC
         UVbp/mxH0aYuEwy9glkNVjF9EZBgAkEczyhXy/CgIwvWj4gSpUHXvWg+9P2kaQBc2QtX
         8ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDtWok6ghcbMOh+aRUPuJcRSWIrIOfWKuyRB73ATInw=;
        fh=fTXhpLSm02u9+vm55qkFDFfLUyv17AU3+j4MM54c1h4=;
        b=QQcCZ0FXvTVwMG3ukNuH0kx4gdMExFKKOH2OIwpbjUixbX/D2Md9kgBn1QNx5ALOeX
         ZgS6kWu7uSXC/5U0RzkT4w5kuPRAxKY76mqg+LKLVaH1E272YQLD7Y59VyInqPJGRjZL
         Cr+itA1CwLagmsCiS82C76QkHP9jihQoO+CK8AV1XBvaS4v/FmId1oLqtx1svKOkgaNL
         /E2W2D1otG5wUkbjBHo8Uyex0DA/1J+b7V2JkJBZRjGFM3JSQ0lMEjNI9r4hfeZja+C8
         +AbJMEiRBFtSG5wDEMQRAVw+pvsM9cIxHcWWuydvjHbeuPdyQmiASJWg4gmEzuyROFYI
         6fRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779100074; x=1779704874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDtWok6ghcbMOh+aRUPuJcRSWIrIOfWKuyRB73ATInw=;
        b=j4VCjgKQipWlMtiav+oRaPR0f0v1nvfzZapNCxenZbUZ3Mt3Rn7gmUEXq4oi7jkUIb
         4HgX5uvcMi0RszlVOneYbNm1DM+mJU/JrJR0h0GO8g4bukkzMC7zMlBHjCSOgPkhMpTV
         c4wzllyPVJm2XMA+DbO43unohFkJBR7zJC8kPgscsLXOrQoLc889x8CXLMCrjb7k7adz
         Gsbumo9YHGirJUU0vfb33Y11pt7G3APC6WK3KmfUzHGeFwpngQRJCoM4161ft4aApt6w
         Kt1L2d49HbFBUptVzh8i1FeIDgJkVcLkQkauv8bG7uF5x1ddFs4dXIs3THiHDz4MjsjJ
         8/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100074; x=1779704874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDtWok6ghcbMOh+aRUPuJcRSWIrIOfWKuyRB73ATInw=;
        b=Ap00dutcxWd5Q9E5J6HbKpNc4fEXhGETZAAX1vs1Jnz9JUS6sjpAwIt/ejRFvnlLar
         cPnixz4LRXmNdtEoWtTFWP9shgqbOnbOmSu0G8jSHGkSKMZx/Cbnv1dEOSNb9aYe1O3J
         J5nc6OanVIZ31eNs8X0qWO5FWxKM9ed01UUsyv0SKO/OT2aXvsZ5U4OyYK9668lD9KGq
         Wxlo6XtfGSK5MBG1JBOyhAmZ4LdIfVhXKP2MNHMGzXJZGLZVTQIFkvOHxTNpRRbpo5Kx
         iOdqNd7/vSDlBJRB3h9dzozWmCsLLHJWpQEJ2C9OeZ5eOfiMAy85ZdGsiSisCRfTZGSn
         6jww==
X-Forwarded-Encrypted: i=1; AFNElJ9+hohjakDsJqmaJtK3u4dvFbC7JHQiU8zeI2OY135gasL8SNkKiDxAOuiQXibvya3PUPxS5XjTPn7Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg3SL6iLTVg2HoBJnyGbdigOmhA6cS8EtHHDwSEHW074YBdEQd
	eRypcSIL/IHxz5G3UrQFCvLqXgcfYv4odruYi7x0KqZxVKnqLCdmxSplykKttjBkkqXjb5sbUbb
	mvvl5WKRPqw5I4Mgv4GRqygoM1eRabw0=
X-Gm-Gg: Acq92OHGWQA8Q40M/evoswni7wWQac77YJPEaVglRZntRgYHxDze+ftGRxZFAg4K2AD
	4Z1i6D218pw2xjHmOTdtyTihNwfat+eemxadqVtWWl3cZq7YwBif6/vKpkzr8yqBA+qg4UqS6kI
	A/ik4Qdy8j6ZOqbBUsvIesQ75w8fdIYEoimqpm6i0/LTYi6hJn8CoRYxzGFrmGadsdX8AoYUoLg
	DgWpEeojCGjDo+W23Sd6BdzCBFDAOumfi8dF3slMogFSiQ14WZM4fqVlb3w1kAEslk2a+/iKhud
	lZ3XOZBS
X-Received: by 2002:a05:7300:8b95:b0:2e0:1f09:d924 with SMTP id
 5a478bee46e88-3039813cab5mr6740822eec.5.1779100073932; Mon, 18 May 2026
 03:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502124055.22475-1-clamor95@gmail.com> <20260502124055.22475-3-clamor95@gmail.com>
 <20260514100205.GG305027@google.com> <CAPVz0n07EKiF=Gi=Po0zFVSuU=g4pbhJam7VHgiQsPTwtT2wQg@mail.gmail.com>
 <20260514155004.GO305027@google.com> <CAPVz0n1drWV6zMzOx93gHNaw+Tt0M9oAF2RyKW6tZcC2gF_HAQ@mail.gmail.com>
 <20260518101328.GS305027@google.com>
In-Reply-To: <20260518101328.GS305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 18 May 2026 13:27:42 +0300
X-Gm-Features: AVHnY4Kz1QJoA09br8muwyHJF2ZDsix5B0qlI6Cm2ua-EB9O61W3wDAYlVInIYQ
Message-ID: <CAPVz0n0imF_ESoGMJSrEX7NOnBShFj8wehDtQKXZV_DMcGqq=A@mail.gmail.com>
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
X-Rspamd-Queue-Id: 437B356AB69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8196-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qmqm.pl:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

=D0=BF=D0=BD, 18 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:1=
3 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, 14 May 2026, Svyatoslav Ryhel wrote:
>
> > =D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
18:50 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, 14 May 2026, Svyatoslav Ryhel wrote:
> > >
> > > > =D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 13:02 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Sat, 02 May 2026, Svyatoslav Ryhel wrote:
> > > > >
> > > > > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > > > >
> > > > > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer T=
F201,
> > > > > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF=
101 dock
> > > > > > and TF600T, P1801-T and TF701T pad. This is a glue driver handl=
ing
> > > > > > detection and common operations for EC's functions.
> > > > > >
> > > > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.=
pl>
> > > > > > ---
> > > > > >  drivers/mfd/Kconfig                     |  14 +
> > > > > >  drivers/mfd/Makefile                    |   1 +
> > > > > >  drivers/mfd/asus-transformer-ec.c       | 762 ++++++++++++++++=
++++++++
> > > > > >  include/linux/mfd/asus-transformer-ec.h | 162 +++++
> > > > > >  4 files changed, 939 insertions(+)
> > > > > >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> > > > > >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
> > >
> > > [...]
> > >
> > > > > > +     unsigned int num_devices;
> > > > > > +     bool clr_fmode; /* clear Factory Mode bit in EC control r=
egister */
> > > > > > +};
> > > > > > +
> > > > > > +struct asus_ec_data {
> > > > > > +     struct asusec_info info;
> > > > >
> > > > > You have 'data' and 'info' which a) using non-forthcoming nomencl=
ature
> > > > > and doesn't tell me anything and then you b) put 'info' in the de=
vice's
> > > > > driver_data attribute which is very confusing.  driver_data shoul=
d be
> > > > > for what we call ddata which I assume is expressed as 'data' here=
.
> > > > >
> > > >
> > > > asusec_info is shared among all child devices and is exposed while
> > > > remaining elements of this struct are for internal use only.
> > >
> > > Our terminology for that is usually ddata, that gets stored in
> > > 'struct devices' device_data attribute.
> > >
> > > > > > +     struct mutex ecreq_lock; /* prevent simultaneous access *=
/
> > > > > > +     struct gpio_desc *ecreq;
> > > > >
> > > > > If I hadn't seen the declaration, I'd have no idea this was a GPI=
O
> > > > > descriptor.  Please improve the nomenclature throughout.
> > > > >
> > > > > > +     struct i2c_client *self;
> > > > >
> > > > > Again, please use standard naming conventions:
> > > > >
> > > > > % git grep "struct i2c_client" | grep "\*self" | wc -l
> > > > > 0
> > > > >
> > > > > % git grep "struct i2c_client" | grep "\*client" | wc -l
> > > > > 6304
> > > > >
> > > > > % git grep "struct i2c_client" | grep "\*i2c" | wc -l
> > > > > 903
> > > > >
> > > >
> > > > ok, noted.
> > > >
> > > > > > +     const struct asus_ec_chip_data *data;
> > > > >
> > > > > 'data', 'priv' and 'info' should be improved.
> > > > >
> > > > > > +     char ec_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > >
> > > > > An array of chars called 'data'.  This could be anything.
> > > > >
> > > >
> > > > Do you have a comprehensive list of name conventions you find suita=
ble?
> > >
> > > Anything descriptive that alludes to the type of data being held ther=
e.
> > >
> > > There are 100's of good examples, but a handful of generic / bad ones=
.
> > >
> > > > > > +     bool logging_disabled;
> > > > >
> > > > > This debugging tool is probably never going to be used again.
> > > > >
> > > > > Keep it local.
> > > > >
> > > > > > +};
> > > > > > +
> > > > > > +struct dockram_ec_data {
> > > > > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > > > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > > > +};
> > > > > > +
> > > > > > +#define to_ec_data(ec) \
> > > > > > +     container_of(ec, struct asus_ec_data, info)
> > > > > > +
> > > > > > +/**
> > > > > > + * asus_dockram_read - Read a register from the DockRAM device=
.
> > > > > > + * @client: Handle to the DockRAM device.
> > > > > > + * @reg: Register to read.
> > > > > > + * @buf: Byte array into which data will be read; must be larg=
e enough to
> > > > > > + *    hold the data returned by the DockRAM.
> > > > > > + *
> > > > > > + * This executes the DockRAM read based on the SMBus "block re=
ad" protocol
> > > > > > + * or its emulation. It extracts DOCKRAM_ENTRY_SIZE bytes from=
 the set
> > > > > > + * register address.
> > > > > > + *
> > > > > > + * Returns a negative errno code else zero on success.
> > > > > > + */
> > > > > > +int asus_dockram_read(struct i2c_client *client, int reg, char=
 *buf)
> > > > > > +{
> > > > >
> > > > > Have you considered using Regmap for register access instead of
> > > > > implementing custom functions?  Remaps already deals with caching=
 and
> > > > > locking mechanisms that you'd get for free.
> > > > >
> > > > > This looks like it would be replaced with devm_regmap_init_i2c().
> > > > >
> > > >
> > > > I will consider this, thank you.
> > > >
> >
> > It seems that regmap does not fit for this purpose, but I might switch
> > to plain i2c_smbus_read_i2c_block_data
>
> Can you explain why Regmap doesn't work for you?
>
> Regmap is just a wrapper about i2c_smbus_read_i2c_block_data() and friend=
s.
>

Honestly, it seems that this will cause more hassle. Regmap has max
bit size of reg 64 which will require use of regmap_read/write_raw and
obviously no regmap bit update operations will be possible. If this
chip was a plain 8 bit register i2c device, obviously I would use
regmap.

I have removed most of custom functions in favor for i2c smbus block
helpers and left only asus_dockram_access_ctl since it is used in many
places.

> > > > > > +     struct device *dev =3D &client->dev;
> > > > > > +     int ret;
> > > > > > +
> > > > > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > > > > +     ret =3D i2c_smbus_read_i2c_block_data(client, reg,
> > > > > > +                                         DOCKRAM_ENTRY_BUFSIZE=
, buf);
> > > > > > +     if (ret < 0)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > > > > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d=
\n",
> > > > > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > > > > +             return -EPROTO;
> > > > > > +     }
> > > > > > +
> > > > > > +     dev_dbg(dev, "got data; buffer: %*ph; ret: %d\n",
> > > > > > +             DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > > > >
> > > > > Please remove all of these debug messages.
> > > > >
> > > >
> > > > Why debug messages cannot be preserved? They are specifically marke=
d as dev_dbg
> > >
> > > It's a general convention.
> > >
> > > After initial development, they tend to just litter the code-base.
> > >
> > > Debug prints can be useful higher up the stack though.
> > >
> >
> > I am fine with removing all debugs and logging but I strongly would
> > like to keep EC model and firmware version along with susb and factory
> > status. That may be quite useful in identifying EC used and its
> > behavior without need in rebuilding the kernel and digging huge piles
> > of downstream code in order to find how to dump these values.
>
> Yes, you can keep this sort of thing as INFO.
>

Noted. I have send v7 with your suggestions applied. Change log is in
the cover commit.

> --
> Lee Jones

