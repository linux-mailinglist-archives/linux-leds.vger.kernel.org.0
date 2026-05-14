Return-Path: <linux-leds+bounces-8102-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GOyDvqrBWrHZgIAu9opvQ
	(envelope-from <linux-leds+bounces-8102-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 13:03:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F3540BE9
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 13:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41081301F9CD
	for <lists+linux-leds@lfdr.de>; Thu, 14 May 2026 11:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EE339BFF2;
	Thu, 14 May 2026 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGPNu/3d"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3562B3AA4F9
	for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 11:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756557; cv=pass; b=Pc2R3c15WU6cJ0HFlpL6HuaYQR/pTRURMxbIfCn3khLOZIvbtdP2nFJf8vSMn9ACcj1ZFmgU2xsi8CXd5cYbILfaCaaiSaCOUmlOvFY3n3lptP7HD3E9v7PyAZ/1KPDoVaRiRSzi+eihdSNVkt+NL706rqKvTgVvYG3HVTMnE9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756557; c=relaxed/simple;
	bh=tTANvWS++S8dmZe0A400N9GhVkjP3EIwsRNdKPwmo0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cx9wZxWx/Wl6nE0e/UDdjJoNdlIt53Hcc9OWOll8d0pnaCXosd0eVder5/FQsr/2kOVXkNwvEVGDCfRhJE4QcvaB9N6b3+kSpSpZup22X81JRJc6gYmdw1HSeLb6Ryy0IqPxiEH/HsWfqjMzlMbyrHjAgZDMNOmqqFGv0rnTCUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGPNu/3d; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f0ad52830cso11473979eec.1
        for <linux-leds@vger.kernel.org>; Thu, 14 May 2026 04:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778756553; cv=none;
        d=google.com; s=arc-20240605;
        b=ZatM4JPMKa5kcSwhBs/xETvpmEDPaVibOpThlRUwUSEevLepLCM6wH944Gks8qgFqw
         z5RKY9qgAsLe4JePY2gjprxykCYxBWh696R5EHrR+aYW/qlat2Lj0co3xaWUgfIuSotY
         2PQnUpHPc+aaZpTknbG16LC7fcAhffLNXDvoIzZbDxZWtYUJMJs8tcdaXURJCN96zY3C
         8BnDt+qZBGpORF7TGEvcpYBW4GF6PWemBk+qfpDoMr36YQuD1UQkaDv2T6pmyHd5E8AH
         6ekqFzfw+0pxY/wwTCpv1gNjVKCzpRacO1d+uMVEfykczoRJShsYUfM95iamartYJ5h7
         mq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iFlA7ahvx0S8rLHLuIcAFdQvz7cq3f9DtoYibLki3x8=;
        fh=/4gniljq7iuVq2+meS54LinuwDic37oBEGK1Zbig7O0=;
        b=aU0T/hP8FAM/fmY+jVTOi8wFbbdvsc5gx/g0psO+udbAxNwL4Xg7xUe9Gix6LltFRv
         xddmXJJvJ2+rsoPWj9MC73W1uU/ZvqlOYRpy4n4e71uksVnAwDpCu31ffHOufo2nEGCv
         1rn4cXzrWkk4Hih8likXvsUBewMEEUvBWPwl7UW0iQfEeO9ZcYUYWASjkh+uNjG3fPNk
         bKZEz9KsZV9bBwy2tbMPz+Y6WIPAUx82NWz2F7a3lkH+Zqt8y0Vf0/roEw91y3jL4fnD
         7gz2GSglFaaOI72Oxj7j4Wdiqfgxx1LdKqpEOvM3+fOSDaQk3wZ3mXVYSUFNZbRRNZnU
         uBJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778756553; x=1779361353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFlA7ahvx0S8rLHLuIcAFdQvz7cq3f9DtoYibLki3x8=;
        b=CGPNu/3d7sq3vNdij6j/CxQ0nCtDKXiq1ACjh4l9T4xp0vl+3Fiewaup1A0g0A3Qep
         BQEtHxmGxrxKt+WA1uEnMLxuJXNRiqSsxIP1NnBlBJWWNlxCvbkFG/iHPxunnSA2sY6O
         Lx3/WIpuQinWibQDrmcveTot4eE4TdL+arXbWnHZj9VsrflPY7Z7hnj5XZvquSIUXN0s
         Q7UI2UjQ1ZET5IEs9Sy5HGLSv0Avdz7VhJpyesWCeBSYndoUYMbYtMJUiaO+UlJiEwFO
         SFltQJZAnW9hjNu/570A+t7P9cFV8x5PyOZ9wx1ST1NyAWSNLihhCWByfJMiYT+uxtg8
         ad5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756553; x=1779361353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFlA7ahvx0S8rLHLuIcAFdQvz7cq3f9DtoYibLki3x8=;
        b=krtXEKfGBEG5SktCRjYFqq0r26hWnPbxsjiY6MhdpGLnjFFXhu0iQTvtoJiNIhhCCa
         Nnx1bYBQMYfqwZeYeJAp2BpHPHmPzdOsWgzZ3ZcV0d1G+U8kRUGYWPFTMEAKTRqpqQRL
         qmLV0FrrFCsbNpOnM/BSchyVOsB8ByjK1N1X8T7hwCPotZg5sTDKJ84/m0t//z/y2SyB
         GenmeGN4z8oqY1N12pP//qnWlmtiNNWnwao+e6lHZDCgrik4EW9VHe5SfLIK6jEaXq+b
         8J5Fi5ko2FIm/7ZW7WIhpnxrc0BgxmuFez75aaizpXiD+UAQusi1weDRjQ9eYQg9ch2U
         Q1eQ==
X-Forwarded-Encrypted: i=1; AFNElJ9iNjgZGXM278EFPIuDuxq6XBB9i5Fp0J3i4IKmDvRCtr1w3vqy/BERRHTAVuuO9qiKs5e78W/WMcwm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+QyRv4Zc1ypOFGQzIQaGFaLJZcY9npt9t+nsEqP6EJZzjAlE
	xPgOCXoDCnMuvytqP/sPOmZ9qcYkODijyjDIo00ZeQcCB9kQ2uMnoT0xnX6/ok++wX90tqoaGsM
	xoP09kQF+f+wWMkoTpHchV+swvE6vjm0=
X-Gm-Gg: Acq92OFxBhSJnkUowhwV3khzmlnyURs9EvB2qam47NrSrYyo0L98tn36BO+QuTFEDXX
	Kpr6bVSD29/HRJUrrpgi8xT/1qhWn/VYI0/t2wySDa43aAaGm3fvzMse4+rCwRRDMCVmaZu6jWA
	rV8/v8JA1kiMvHcw6kpWBO82cWitakWNuQscsDxjqhoj3USYgWvQj+NjjG4QTYTHWfPdc0SmC01
	VWpYgoj5vuzF1qmyJAD8uad/YVioNFhJ3UTxcyvrzlXKiQ24VorhhEyHA3SOvlEsdR4yRE9IfyC
	9SRpFWx2
X-Received: by 2002:a05:7301:19a9:b0:2e2:4979:ec7 with SMTP id
 5a478bee46e88-301181ab424mr4116737eec.10.1778756552923; Thu, 14 May 2026
 04:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502124055.22475-1-clamor95@gmail.com> <20260502124055.22475-3-clamor95@gmail.com>
 <20260514100205.GG305027@google.com>
In-Reply-To: <20260514100205.GG305027@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 14 May 2026 14:02:21 +0300
X-Gm-Features: AVHnY4LVmQBQeZ0RDRKsLccbPhcrmllxuUCFf_ZJCr0EMUw_cDDSD843lgfLqWI
Message-ID: <CAPVz0n0ZEe=k0L4AMFu39+DuGeaqzaF-Q-rP=kHSF4dePyu-fQ@mail.gmail.com>
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
X-Rspamd-Queue-Id: 5A5F3540BE9
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
	TAGGED_FROM(0.00)[bounces-8102-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qmqm.pl:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D1=87=D1=82, 14 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, 02 May 2026, Svyatoslav Ryhel wrote:
>
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > detection and common operations for EC's functions.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/mfd/Kconfig                     |  14 +
> >  drivers/mfd/Makefile                    |   1 +
> >  drivers/mfd/asus-transformer-ec.c       | 762 ++++++++++++++++++++++++
> >  include/linux/mfd/asus-transformer-ec.h | 162 +++++
> >  4 files changed, 939 insertions(+)
> >  create mode 100644 drivers/mfd/asus-transformer-ec.c
> >  create mode 100644 include/linux/mfd/asus-transformer-ec.h
> >
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 7192c9d1d268..5aa4facfd2df 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -137,6 +137,20 @@ config MFD_AAT2870_CORE
> >         additional drivers must be enabled in order to use the
> >         functionality of the device.
> >
> > +config MFD_ASUS_TRANSFORMER_EC
> > +     tristate "ASUS Transformer's embedded controller"
> > +     depends on I2C && OF
> > +     help
> > +       Support ECs found in ASUS Transformer's Pad and Mobile Dock.
> > +
> > +       This provides shared glue for functional part drivers:
> > +         asus-transformer-ec-kbc, asus-transformer-ec-keys,
> > +         leds-asus-transformer-ec, asus-transformer-ec-battery
> > +         and asus-transformer-ec-charger.
>
> A 760 line driver deserves more than just a list of leaf drivers.
>
> > +       This driver can also be built as a module. If so, the module
> > +       will be called asus-transformer-ec.
> > +
> >  config MFD_AT91_USART
> >       tristate "AT91 USART Driver"
> >       select MFD_CORE
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index e75e8045c28a..fd80088d8a9a 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -10,6 +10,7 @@ obj-$(CONFIG_MFD_88PM805)   +=3D 88pm805.o 88pm80x.o
> >  obj-$(CONFIG_MFD_88PM886_PMIC)       +=3D 88pm886.o
> >  obj-$(CONFIG_MFD_ACT8945A)   +=3D act8945a.o
> >  obj-$(CONFIG_MFD_SM501)              +=3D sm501.o
> > +obj-$(CONFIG_MFD_ASUS_TRANSFORMER_EC)        +=3D asus-transformer-ec.=
o
> >  obj-$(CONFIG_ARCH_BCM2835)   +=3D bcm2835-pm.o
> >  obj-$(CONFIG_MFD_BCM590XX)   +=3D bcm590xx.o
> >  obj-$(CONFIG_MFD_BD9571MWV)  +=3D bd9571mwv.o
> > diff --git a/drivers/mfd/asus-transformer-ec.c b/drivers/mfd/asus-trans=
former-ec.c
> > new file mode 100644
> > index 000000000000..75aa7ab99387
> > --- /dev/null
> > +++ b/drivers/mfd/asus-transformer-ec.c
> > @@ -0,0 +1,762 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/device.h>
>
> Should we sort the '#include' directives alphabetically? For instance,
> 'device.h' should typically appear before 'gpio/consumer.h'.
>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/mfd/asus-transformer-ec.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > +
> > +#define ASUSEC_RSP_BUFFER_SIZE               8
> > +
> > +struct asus_ec_chip_data {
> > +     const char *name;
> > +     const struct mfd_cell *mfd_devices;
>
> Use global `static const structs` instead.
>
> Also, please do not pass MFD registration data through another
> registration API like DT.  It opens the gates to too much hackery.  I'm
> not saying that _this_ driver would do such a thing, but it's easier
> just to keep the blanket rule in place.
>
> > +     unsigned int num_devices;
> > +     bool clr_fmode; /* clear Factory Mode bit in EC control register =
*/
> > +};
> > +
> > +struct asus_ec_data {
> > +     struct asusec_info info;
>
> You have 'data' and 'info' which a) using non-forthcoming nomenclature
> and doesn't tell me anything and then you b) put 'info' in the device's
> driver_data attribute which is very confusing.  driver_data should be
> for what we call ddata which I assume is expressed as 'data' here.
>
> > +     struct mutex ecreq_lock; /* prevent simultaneous access */
> > +     struct gpio_desc *ecreq;
>
> If I hadn't seen the declaration, I'd have no idea this was a GPIO
> descriptor.  Please improve the nomenclature throughout.
>
> > +     struct i2c_client *self;
>
> Again, please use standard naming conventions:
>
> % git grep "struct i2c_client" | grep "\*self" | wc -l
> 0
>
> % git grep "struct i2c_client" | grep "\*client" | wc -l
> 6304
>
> % git grep "struct i2c_client" | grep "\*i2c" | wc -l
> 903
>
> > +     const struct asus_ec_chip_data *data;
>
> 'data', 'priv' and 'info' should be improved.
>
> > +     char ec_data[DOCKRAM_ENTRY_BUFSIZE];
>
> An array of chars called 'data'.  This could be anything.
>
> > +     bool logging_disabled;
>
> This debugging tool is probably never going to be used again.
>
> Keep it local.
>
> > +};
> > +
> > +struct dockram_ec_data {
> > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > +};
> > +
> > +#define to_ec_data(ec) \
> > +     container_of(ec, struct asus_ec_data, info)
> > +
> > +/**
> > + * asus_dockram_read - Read a register from the DockRAM device.
> > + * @client: Handle to the DockRAM device.
> > + * @reg: Register to read.
> > + * @buf: Byte array into which data will be read; must be large enough=
 to
> > + *    hold the data returned by the DockRAM.
> > + *
> > + * This executes the DockRAM read based on the SMBus "block read" prot=
ocol
> > + * or its emulation. It extracts DOCKRAM_ENTRY_SIZE bytes from the set
> > + * register address.
> > + *
> > + * Returns a negative errno code else zero on success.
> > + */
> > +int asus_dockram_read(struct i2c_client *client, int reg, char *buf)
> > +{
>
> Have you considered using Regmap for register access instead of
> implementing custom functions?  Remaps already deals with caching and
> locking mechanisms that you'd get for free.
>
> This looks like it would be replaced with devm_regmap_init_i2c().
>

I don't see any instances regmap handling 256 bit registers.

> > +     struct device *dev =3D &client->dev;
> > +     int ret;
> > +
> > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > +     ret =3D i2c_smbus_read_i2c_block_data(client, reg,
> > +                                         DOCKRAM_ENTRY_BUFSIZE, buf);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > +             dev_err(dev, "bad data len; buffer: %*ph; ret: %d\n",
> > +                     DOCKRAM_ENTRY_BUFSIZE, buf, ret);
> > +             return -EPROTO;
> > +     }
> > +
> > +     dev_dbg(dev, "got data; buffer: %*ph; ret: %d\n",
> > +             DOCKRAM_ENTRY_BUFSIZE, buf, ret);
>
> Please remove all of these debug messages.
>
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_dockram_read);
> > +
> > +/**
> > + * asus_dockram_write - Write a byte array to a register of the DockRA=
M device.
> > + * @client: Handle to the DockRAM device.
> > + * @reg: Register to write to.
> > + * @buf: Byte array to be written (up to DOCKRAM_ENTRY_SIZE bytes).
> > + *
> > + * This executes the DockRAM write based on the SMBus "block write"
> > + * protocol or its emulation. It writes DOCKRAM_ENTRY_SIZE bytes to th=
e
> > + * specified register address.
> > + *
> > + * Returns a negative errno code else zero on success.
> > + */
> > +int asus_dockram_write(struct i2c_client *client, int reg, const char =
*buf)
> > +{
> > +     if (buf[0] > DOCKRAM_ENTRY_SIZE)
> > +             return -EINVAL;
> > +
> > +     dev_dbg(&client->dev, "sending data; buffer: %*ph\n", buf[0] + 1,=
 buf);
> > +
> > +     return i2c_smbus_write_i2c_block_data(client, reg, buf[0] + 1, bu=
f);
> > +}
> > +EXPORT_SYMBOL_GPL(asus_dockram_write);
> > +
> > +/**
> > + * asus_dockram_access_ctl - Read from or write to the DockRAM control=
 register.
> > + * @client: Handle to the DockRAM device.
> > + * @out: Pointer to a variable where the register value will be stored=
.
> > + * @mask: Bitmask of bits to be cleared.
> > + * @xor: Bitmask of bits to be set (via XOR).
> > + *
> > + * This performs a control register read if @out is provided and both =
@mask
> > + * and @xor are zero. Otherwise, it performs a control register update=
 if
> > + * @mask and @xor are provided.
> > + *
> > + * Returns a negative errno code else zero on success.
> > + */
> > +int asus_dockram_access_ctl(struct i2c_client *client, u64 *out, u64 m=
ask,
> > +                         u64 xor)
> > +{
> > +     struct dockram_ec_data *priv =3D i2c_get_clientdata(client);
> > +     char *buf =3D priv->ctl_data;
> > +     u64 val;
> > +     int ret =3D 0;
> > +
> > +     guard(mutex)(&priv->ctl_lock);
> > +
> > +     ret =3D asus_dockram_read(client, ASUSEC_DOCKRAM_CONTROL, buf);
> > +     if (ret < 0)
>
> Could we check for errors using 'if (ret)' instead of 'if (ret < 0)' here=
,
> unless a positive return value has a specific meaning we need to handle?
>
> > +             goto exit;
> > +
> > +     if (buf[0] !=3D ASUSEC_CTL_SIZE) {
> > +             ret =3D -EPROTO;
> > +             goto exit;
> > +     }
> > +
> > +     val =3D get_unaligned_le64(buf + 1);
> > +
> > +     if (out)
> > +             *out =3D val;
> > +
> > +     if (mask || xor) {
> > +             put_unaligned_le64((val & ~mask) ^ xor, buf + 1);
> > +             ret =3D asus_dockram_write(client, ASUSEC_DOCKRAM_CONTROL=
, buf);
> > +     }
> > +
> > +exit:
> > +     if (ret < 0)
> > +             dev_err(&client->dev, "Failed to access control flags: %d=
\n",
> > +                     ret);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_dockram_access_ctl);
> > +
> > +static void asus_ec_remove_notifier(struct device *dev, void *res)
> > +{
> > +     struct asusec_info *ec =3D dev_get_drvdata(dev->parent);
> > +     struct notifier_block **nb =3D res;
> > +
> > +     blocking_notifier_chain_unregister(&ec->notify_list, *nb);
> > +}
> > +
> > +/**
> > + * devm_asus_ec_register_notifier - Managed registration of notifier t=
o an
> > + *                               ASUS EC blocking notifier chain.
> > + * @pdev: Device requesting the notifier (used for resource management=
).
> > + * @nb: Notifier block to be registered.
> > + *
> > + * Register a notifier to the ASUS EC blocking notifier chain. The not=
ifier
> > + * will be automatically unregistered when the requesting device is de=
tached.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int devm_asus_ec_register_notifier(struct platform_device *pdev,
> > +                                struct notifier_block *nb)
> > +{
>
> Hand-rolling devres managed resources is usually reserved for subsystem
> level API calls.  Why do the usual device driver .remove() handling work
> for you?
>
> > +     struct asusec_info *ec =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct notifier_block **res;
> > +     int ret;
> > +
> > +     res =3D devres_alloc(asus_ec_remove_notifier, sizeof(*res), GFP_K=
ERNEL);
> > +     if (!res)
> > +             return -ENOMEM;
> > +
> > +     *res =3D nb;
> > +     ret =3D blocking_notifier_chain_register(&ec->notify_list, nb);
> > +     if (ret) {
> > +             devres_free(res);
> > +             return ret;
> > +     }
> > +
> > +     devres_add(&pdev->dev, res);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_asus_ec_register_notifier);
> > +
> > +static int asus_ec_signal_request(const struct asusec_info *ec)
> > +{
> > +     struct asus_ec_data *priv =3D to_ec_data(ec);
> > +
> > +     guard(mutex)(&priv->ecreq_lock);
> > +
> > +     dev_dbg(&priv->self->dev, "EC request\n");
> > +
> > +     gpiod_set_value_cansleep(priv->ecreq, 1);
> > +     msleep(50);
> > +
> > +     gpiod_set_value_cansleep(priv->ecreq, 0);
> > +     msleep(200);
> > +
> > +     return 0;
> > +}
> > +
> > +static int asus_ec_write(struct asus_ec_data *priv, u16 data)
> > +{
> > +     int ret =3D i2c_smbus_write_word_data(priv->self, ASUSEC_WRITE_BU=
F, data);
> > +
> > +     dev_dbg(&priv->self->dev, "EC write: %04x, ret =3D %d\n", data, r=
et);
> > +
> > +     return ret;
> > +}
> > +
> > +static int asus_ec_read(struct asus_ec_data *priv, bool in_irq)
> > +{
> > +     int ret =3D i2c_smbus_read_i2c_block_data(priv->self, ASUSEC_READ=
_BUF,
> > +                                             sizeof(priv->ec_data),
> > +                                             priv->ec_data);
> > +
> > +     dev_dbg(&priv->self->dev, "EC read: %*ph, ret =3D %d%s\n",
> > +             sizeof(priv->ec_data), priv->ec_data,
> > +             ret, in_irq ? "; in irq" : "");
> > +
> > +     return ret;
> > +}
>
> No abstractions for the sake of it.  All this goes away with Regmap anywa=
y.
> > +
> > +/**
> > + * asus_ec_i2c_command - Send a 16-bit command to the ASUS EC.
> > + * @ec: Pointer to the shared ASUS EC structure.
> > + * @data: The 16-bit command (word) to be sent.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int asus_ec_i2c_command(const struct asusec_info *ec, u16 data)
> > +{
> > +     return asus_ec_write(to_ec_data(ec), data);
> > +}
>
> Is this wrapper function strictly necessary? We should try to avoid
> superfluous abstractions that do nothing but call another function.
>
> > +EXPORT_SYMBOL_GPL(asus_ec_i2c_command);
> > +
> > +static void asus_ec_clear_buffer(struct asus_ec_data *priv)
> > +{
> > +     int retry =3D ASUSEC_RSP_BUFFER_SIZE;
> > +
> > +     while (retry--) {
> > +             if (asus_ec_read(priv, false) < 0)
> > +                     continue;
> > +
> > +             if (priv->ec_data[1] & ASUSEC_OBF_MASK)
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +}
> > +
> > +static int asus_ec_log_info(struct asus_ec_data *priv, unsigned int re=
g,
> > +                         const char *name, char **out)
> > +{
> > +     char buf[DOCKRAM_ENTRY_BUFSIZE];
> > +     int ret;
> > +
> > +     ret =3D asus_dockram_read(priv->info.dockram, reg, buf);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (!priv->logging_disabled)
> > +             dev_info(&priv->self->dev, "%-14s: %.*s\n", name,
> > +                      buf[0], buf + 1);
> > +
> > +     if (out)
> > +             *out =3D kstrndup(buf + 1, buf[0], GFP_KERNEL);
> > +
> > +     return 0;
> > +}
> > +
> > +static int asus_ec_reset(struct asus_ec_data *priv)
> > +{
> > +     int retry, ret;
> > +
> > +     for (retry =3D 0; retry < 3; retry++) {
> > +             ret =3D asus_ec_write(priv, 0);
> > +             if (!ret)
> > +                     return 0;
> > +
> > +             msleep(300);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int asus_ec_magic_debug(struct asus_ec_data *priv)
> > +{
> > +     u64 flag;
> > +     int ret;
> > +
> > +     ret =3D asus_ec_get_ctl(&priv->info, &flag);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     flag &=3D ASUSEC_CTL_SUSB_MODE;
> > +     dev_info(&priv->self->dev, "EC FW behaviour: %s\n",
> > +              flag ? "susb on when receive ec_req" :
> > +              "susb on when system wakeup");
> > +
> > +     return 0;
> > +}
> > +
> > +static int asus_ec_set_factory_mode(struct asus_ec_data *priv, bool on=
)
> > +{
> > +     dev_info(&priv->self->dev, "Entering %s mode.\n", on ? "factory" =
:
> > +              "normal");
> > +
> > +     return asus_ec_update_ctl(&priv->info, ASUSEC_CTL_FACTORY_MODE,
> > +                               on ? ASUSEC_CTL_FACTORY_MODE : 0);
> > +}
> > +
> > +static int asus_ec_detect(struct asus_ec_data *priv)
> > +{
> > +     char *model =3D NULL;
> > +     int ret;
> > +
> > +     ret =3D asus_ec_reset(priv);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     asus_ec_clear_buffer(priv);
> > +
> > +     ret =3D asus_ec_log_info(priv, ASUSEC_DOCKRAM_INFO_MODEL, "model"=
, &model);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     ret =3D asus_ec_log_info(priv, ASUSEC_DOCKRAM_INFO_FW, "FW versio=
n", NULL);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     ret =3D asus_ec_log_info(priv, ASUSEC_DOCKRAM_INFO_CFGFMT, "Confi=
g format", NULL);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     ret =3D asus_ec_log_info(priv, ASUSEC_DOCKRAM_INFO_HW, "HW versio=
n", NULL);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     priv->logging_disabled =3D true;
> > +
> > +     ret =3D asus_ec_magic_debug(priv);
> > +     if (ret)
> > +             goto err_exit;
> > +
> > +     priv->info.model =3D model;
> > +     priv->info.name =3D priv->data->name;
> > +
> > +     if (priv->data->clr_fmode)
> > +             asus_ec_set_factory_mode(priv, false);
> > +
> > +err_exit:
> > +     if (ret)
> > +             dev_err(&priv->self->dev, "failed to access EC: %d\n", re=
t);
> > +
> > +     return ret;
> > +}
> > +
> > +static void asus_ec_handle_smi(struct asus_ec_data *priv, unsigned int=
 code)
> > +{
> > +     dev_dbg(&priv->self->dev, "SMI interrupt: 0x%02x\n", code);
> > +
> > +     switch (code) {
> > +     case ASUSEC_SMI_HANDSHAKE:
> > +     case ASUSEC_SMI_RESET:
> > +             asus_ec_detect(priv);
> > +             break;
> > +     }
> > +}
> > +
> > +static irqreturn_t asus_ec_interrupt(int irq, void *dev_id)
> > +{
> > +     struct asus_ec_data *priv =3D dev_id;
> > +     unsigned long notify_action;
> > +     int ret;
> > +
> > +     ret =3D asus_ec_read(priv, true);
> > +     if (ret <=3D 0 || !(priv->ec_data[1] & ASUSEC_OBF_MASK))
> > +             return IRQ_NONE;
> > +
> > +     notify_action =3D priv->ec_data[1];
> > +     if (notify_action & ASUSEC_SMI_MASK) {
> > +             unsigned int code =3D priv->ec_data[2];
> > +
> > +             asus_ec_handle_smi(priv, code);
> > +
> > +             notify_action |=3D code << 8;
> > +             dev_dbg(&priv->self->dev, "SMI code: 0x%02x\n", code);
> > +     }
> > +
> > +     blocking_notifier_call_chain(&priv->info.notify_list,
> > +                                  notify_action, priv->ec_data);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static ssize_t dockram_read(struct file *filp, char __user *buf,
> > +                         size_t count, loff_t *ppos)
> > +{
> > +     struct i2c_client *client =3D filp->private_data;
> > +     unsigned int reg, rsize;
> > +     ssize_t n_read =3D 0, val;
> > +     loff_t off =3D *ppos;
> > +     char *data;
> > +     int ret;
> > +
> > +     reg =3D off / DOCKRAM_ENTRY_SIZE;
> > +     off %=3D DOCKRAM_ENTRY_SIZE;
> > +     rsize =3D DOCKRAM_ENTRIES * DOCKRAM_ENTRY_SIZE;
> > +
> > +     if (!count)
> > +             return 0;
> > +
> > +     data =3D kmalloc(DOCKRAM_ENTRY_BUFSIZE, GFP_KERNEL);
> > +
> > +     while (reg < DOCKRAM_ENTRIES) {
> > +             unsigned int len =3D DOCKRAM_ENTRY_SIZE - off;
> > +
> > +             if (len > rsize)
> > +                     len =3D rsize;
> > +
> > +             ret =3D asus_dockram_read(client, reg, data);
> > +             if (ret < 0) {
> > +                     if (!n_read)
> > +                             n_read =3D ret;
> > +                     break;
> > +             }
> > +
> > +             val =3D copy_to_user(buf, data + 1 + off, len);
> > +             if (val =3D=3D len)
> > +                     return -EFAULT;
> > +
> > +             *ppos +=3D len;
> > +             n_read +=3D len;
> > +
> > +             if (len =3D=3D rsize)
> > +                     break;
> > +
> > +             rsize -=3D len;
> > +             buf +=3D len;
> > +             off =3D 0;
> > +             ++reg;
> > +     }
> > +
> > +     kfree(data);
> > +
> > +     return n_read;
> > +}
> > +
> > +static int dockram_write_one(struct i2c_client *client, int reg,
> > +                          const char __user *buf, size_t count)
> > +{
> > +     struct dockram_ec_data *priv =3D i2c_get_clientdata(client);
> > +     int ret;
> > +
> > +     if (!count || count > DOCKRAM_ENTRY_SIZE)
> > +             return -EINVAL;
> > +     if (buf[0] !=3D count - 1)
> > +             return -EINVAL;
> > +
> > +     guard(mutex)(&priv->ctl_lock);
> > +
> > +     priv->ctl_data[0] =3D (u8)count;
> > +     memcpy(priv->ctl_data + 1, buf, count);
> > +     ret =3D asus_dockram_write(client, reg, priv->ctl_data);
> > +
> > +     return ret;
> > +}
> > +
> > +static ssize_t dockram_write(struct file *filp, const char __user *buf=
,
> > +                          size_t count, loff_t *ppos)
> > +{
> > +     struct i2c_client *client =3D filp->private_data;
> > +     unsigned int reg;
> > +     loff_t off =3D *ppos;
> > +     int ret;
> > +
> > +     if (off % DOCKRAM_ENTRY_SIZE !=3D 0)
> > +             return -EINVAL;
> > +
> > +     reg =3D off / DOCKRAM_ENTRY_SIZE;
> > +     if (reg >=3D DOCKRAM_ENTRIES)
> > +             return -EINVAL;
> > +
> > +     ret =3D dockram_write_one(client, reg, buf, count);
> > +
> > +     return ret < 0 ? ret : count;
> > +}
> > +
> > +static const struct debugfs_short_fops dockram_fops =3D {
> > +     .read   =3D dockram_read,
> > +     .write  =3D dockram_write,
> > +     .llseek =3D default_llseek,
> > +};
>
> You should not be giving userspace free reign over device memory.
>
> If you switch to Regmap, you can use regmap-debugfs.c for this.
>
> > +static int control_reg_get(void *ec, u64 *val)
> > +{
> > +     return asus_ec_get_ctl(ec, val);
> > +}
> > +
> > +static int control_reg_set(void *ec, u64 val)
> > +{
> > +     return asus_ec_update_ctl(ec, ~0ull, val);
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(control_reg_fops, control_reg_get,
> > +                      control_reg_set, "%016llx\n");
> > +
> > +static int ec_request_set(void *ec, u64 val)
> > +{
> > +     if (val)
> > +             asus_ec_signal_request(ec);
> > +
> > +     return 0;
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(ec_request_fops, NULL, ec_request_set, "%llu\=
n");
> > +
> > +static int ec_irq_set(void *ec, u64 val)
> > +{
> > +     struct asus_ec_data *priv =3D to_ec_data(ec);
> > +
> > +     if (val)
> > +             irq_wake_thread(priv->self->irq, priv);
> > +
> > +     return 0;
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(ec_irq_fops, NULL, ec_irq_set, "%llu\n");
> > +
> > +static void asus_ec_debugfs_remove(void *debugfs_root)
> > +{
> > +     debugfs_remove_recursive(debugfs_root);
> > +}
> > +
> > +static void devm_asus_ec_debugfs_init(struct device *dev)
> > +{
> > +     struct asusec_info *ec =3D dev_get_drvdata(dev);
> > +     struct asus_ec_data *priv =3D to_ec_data(ec);
> > +     struct dentry *debugfs_root, *dockram_dir;
> > +     char *name =3D devm_kasprintf(dev, GFP_KERNEL, "asus-ec-%s",
> > +                                 priv->data->name);
> > +
> > +     debugfs_root =3D debugfs_create_dir(name, NULL);
> > +     dockram_dir =3D debugfs_create_dir("dockram", debugfs_root);
> > +
> > +     debugfs_create_file("ec_irq", 0200, debugfs_root, ec,
> > +                         &ec_irq_fops);
> > +     debugfs_create_file("ec_request", 0200, debugfs_root, ec,
> > +                         &ec_request_fops);
> > +     debugfs_create_file("control_reg", 0644, dockram_dir, ec,
> > +                         &control_reg_fops);
> > +     debugfs_create_file("dockram", 0644, dockram_dir,
> > +                         priv->info.dockram, &dockram_fops);
> > +
> > +     devm_add_action_or_reset(dev, asus_ec_debugfs_remove, debugfs_roo=
t);
> > +}
>
> Why is this being controlled via debugfs?
>
> Use the correct kernel APIs instead.
>
> If this is just for development, keep it and all of the extra verbose
> printing in the BSP tree.  It does not belong in the upstream kernel.
>
> > +static void asus_ec_release_dockram_dev(void *client)
> > +{
> > +     i2c_unregister_device(client);
> > +}
> > +
> > +static struct i2c_client *devm_asus_dockram_get(struct device *dev)
> > +{
> > +     struct i2c_client *parent =3D to_i2c_client(dev);
> > +     struct i2c_client *dockram;
> > +     struct dockram_ec_data *priv;
> > +     int ret;
> > +
> > +     dockram =3D i2c_new_ancillary_device(parent, "dockram",
> > +                                        parent->addr + 2);
> > +     if (IS_ERR(dockram))
> > +             return dockram;
> > +
> > +     ret =3D devm_add_action_or_reset(dev, asus_ec_release_dockram_dev=
,
> > +                                    dockram);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     priv =3D devm_kzalloc(&dockram->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     i2c_set_clientdata(dockram, priv);
> > +     mutex_init(&priv->ctl_lock);
> > +
> > +     return dockram;
> > +}
> > +
> > +static int asus_ec_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct asus_ec_data *priv;
>
> Could we use a clearer, more specific name for the private data variable
> instead of the generic term 'priv'? Using something like 'ddata' is usual=
ly
> preferred.
>
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_I2C_=
BLOCK))
> > +             return dev_err_probe(dev, -ENXIO,
> > +                     "I2C bus is missing required SMBus block mode sup=
port\n");
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->data =3D device_get_match_data(dev);
> > +     if (!priv->data)
> > +             return -ENODEV;
> > +
> > +     i2c_set_clientdata(client, priv);
> > +     priv->self =3D client;
> > +
> > +     priv->info.dockram =3D devm_asus_dockram_get(dev);
> > +     if (IS_ERR(priv->info.dockram))
> > +             return dev_err_probe(dev, PTR_ERR(priv->info.dockram),
> > +                                  "failed to get dockram\n");
> > +
> > +     priv->ecreq =3D devm_gpiod_get(dev, "request", GPIOD_OUT_LOW);
> > +     if (IS_ERR(priv->ecreq))
> > +             return dev_err_probe(dev, PTR_ERR(priv->ecreq),
> > +                                  "failed to get request GPIO\n");
>
> "get" or "request"
>
> > +     BLOCKING_INIT_NOTIFIER_HEAD(&priv->info.notify_list);
> > +     mutex_init(&priv->ecreq_lock);
> > +
> > +     asus_ec_signal_request(&priv->info);
> > +
> > +     ret =3D asus_ec_detect(priv);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to detect EC versi=
on\n");
> > +
> > +     ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> > +                                     &asus_ec_interrupt,
> > +                                     IRQF_ONESHOT | IRQF_SHARED,
> > +                                     client->name, priv);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to register IRQ\n"=
);
> > +
> > +     /* Parent I2C controller uses DMA, ASUS EC and child devices do n=
ot */
> > +     client->dev.coherent_dma_mask =3D 0;
> > +     client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> > +
> > +     if (IS_ENABLED(CONFIG_DEBUG_FS))
> > +             devm_asus_ec_debugfs_init(dev);
> > +
> > +     return devm_mfd_add_devices(dev, 0, priv->data->mfd_devices,
> > +                                 priv->data->num_devices, NULL, 0, NUL=
L);
> > +}
> > +
> > +static const struct mfd_cell asus_ec_sl101_dock_mfd_devices[] =3D {
> > +     {
> > +             .name =3D "asus-transformer-ec-kbc",
> > +     },
> > +};
> > +
> > +static const struct asus_ec_chip_data asus_ec_sl101_dock_data =3D {
> > +     .name =3D "dock",
> > +     .mfd_devices =3D asus_ec_sl101_dock_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(asus_ec_sl101_dock_mfd_devices),
> > +     .clr_fmode =3D false,
> > +};
> > +
> > +static const struct mfd_cell asus_ec_tf101_dock_mfd_devices[] =3D {
> > +     {
> > +             .name =3D "asus-transformer-ec-battery",
> > +             .id =3D 1,
>
> Why doesn't PLATFORM_DEVID_AUTO already do the right thing?
>
> > +     }, {
> > +             .name =3D "asus-transformer-ec-charger",
> > +             .id =3D 1,
> > +     }, {
> > +             .name =3D "asus-transformer-ec-led",
> > +             .id =3D 1,
> > +     }, {
> > +             .name =3D "asus-transformer-ec-keys",
> > +     }, {
> > +             .name =3D "asus-transformer-ec-kbc",
> > +     },
> > +};
> > +
> > +static const struct asus_ec_chip_data asus_ec_tf101_dock_data =3D {
> > +     .name =3D "dock",
> > +     .mfd_devices =3D asus_ec_tf101_dock_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(asus_ec_tf101_dock_mfd_devices),
> > +     .clr_fmode =3D false,
> > +};
> > +
> > +static const struct mfd_cell asus_ec_tf201_pad_mfd_devices[] =3D {
> > +     {
> > +             .name =3D "asus-transformer-ec-battery",
> > +             .id =3D 0,
> > +     }, {
> > +             .name =3D "asus-transformer-ec-led",
> > +             .id =3D 0,
> > +     },
> > +};
> > +
> > +static const struct asus_ec_chip_data asus_ec_tf201_pad_data =3D {
> > +     .name =3D "pad",
> > +     .mfd_devices =3D asus_ec_tf201_pad_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(asus_ec_tf201_pad_mfd_devices),
> > +     .clr_fmode =3D true,
> > +};
> > +
> > +static const struct mfd_cell asus_ec_tf600t_pad_mfd_devices[] =3D {
> > +     {
> > +             .name =3D "asus-transformer-ec-battery",
> > +             .id =3D 0,
> > +     }, {
> > +             .name =3D "asus-transformer-ec-charger",
> > +             .id =3D 0,
> > +     }, {
> > +             .name =3D "asus-transformer-ec-led",
> > +             .id =3D 0,
> > +     },
> > +};
> > +
> > +static const struct asus_ec_chip_data asus_ec_tf600t_pad_data =3D {
> > +     .name =3D "pad",
> > +     .mfd_devices =3D asus_ec_tf600t_pad_mfd_devices,
> > +     .num_devices =3D ARRAY_SIZE(asus_ec_tf600t_pad_mfd_devices),
> > +     .clr_fmode =3D true,
> > +};
> > +
> > +static const struct of_device_id asus_ec_match[] =3D {
> > +     { .compatible =3D "asus,sl101-ec-dock", .data =3D &asus_ec_sl101_=
dock_data },
> > +     { .compatible =3D "asus,tf101-ec-dock", .data =3D &asus_ec_tf101_=
dock_data },
>
> Could we use the match table's data field to store an 'enum' or integer I=
D
> instead of passing platform data via the '.data' field? We could then use=
 a
> 'switch' statement in the C code to select the correct 'mfd_cell' array.
>
> > +     { .compatible =3D "asus,tf201-ec-pad", .data =3D &asus_ec_tf201_p=
ad_data },
> > +     { .compatible =3D "asus,tf600t-ec-pad", .data =3D &asus_ec_tf600t=
_pad_data },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, asus_ec_match);
> > +
> > +static struct i2c_driver asus_ec_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "asus-transformer-ec",
> > +             .of_match_table =3D asus_ec_match,
> > +     },
> > +     .probe =3D asus_ec_probe,
> > +};
> > +module_i2c_driver(asus_ec_driver);
> > +
> > +MODULE_AUTHOR("Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>");
> > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > +MODULE_DESCRIPTION("ASUS Transformer's EC driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mfd/asus-transformer-ec.h b/include/linux/mf=
d/asus-transformer-ec.h
> > new file mode 100644
> > index 000000000000..0a72de40352e
> > --- /dev/null
> > +++ b/include/linux/mfd/asus-transformer-ec.h
> > @@ -0,0 +1,162 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __MFD_ASUS_TRANSFORMER_EC_H
> > +#define __MFD_ASUS_TRANSFORMER_EC_H
> > +
> > +#include <linux/notifier.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct i2c_client;
> > +
> > +struct asusec_info {
> > +     const char *model;
> > +     const char *name;
> > +     struct i2c_client *dockram;
> > +     struct workqueue_struct *wq;
> > +     struct blocking_notifier_head notify_list;
> > +};
> > +
> > +#define DOCKRAM_ENTRIES                      0x100
> > +#define DOCKRAM_ENTRY_SIZE           32
> > +#define DOCKRAM_ENTRY_BUFSIZE                (DOCKRAM_ENTRY_SIZE + 1)
> > +
> > +/* interrupt sources */
> > +#define ASUSEC_OBF_MASK                      BIT(0)
> > +#define ASUSEC_KEY_MASK                      BIT(2)
> > +#define ASUSEC_KBC_MASK                      BIT(3)
> > +#define ASUSEC_AUX_MASK                      BIT(5)
> > +#define ASUSEC_SCI_MASK                      BIT(6)
> > +#define ASUSEC_SMI_MASK                      BIT(7)
> > +
> > +/* SMI notification codes */
> > +#define ASUSEC_SMI_POWER_NOTIFY              0x31    /* [un]plugging U=
SB cable */
> > +#define ASUSEC_SMI_HANDSHAKE         0x50    /* response to ec_req edg=
e */
> > +#define ASUSEC_SMI_WAKE                      0x53
> > +#define ASUSEC_SMI_RESET             0x5f
> > +#define ASUSEC_SMI_ADAPTER_EVENT     0x60    /* [un]plugging charger t=
o dock */
> > +#define ASUSEC_SMI_BACKLIGHT_ON              0x63
> > +#define ASUSEC_SMI_AUDIO_DOCK_IN     0x70
> > +
> > +#define ASUSEC_SMI_ACTION(code)              (ASUSEC_SMI_MASK | ASUSEC=
_OBF_MASK | \
> > +                                     (ASUSEC_SMI_##code << 8))
> > +
> > +/* control register [0x0a] layout */
> > +#define ASUSEC_CTL_SIZE                      8
> > +
> > +/*
> > + * EC reports power from 40-pin connector in the LSB of the control
> > + * register.  The following values have been observed (xor 0x02):
> > + *
> > + * PAD-ec no-plug  0x40 / PAD-ec DOCK     0x20 / DOCK-ec no-plug 0x40
> > + * PAD-ec AC       0x25 / PAD-ec DOCK+AC  0x24 / DOCK-ec AC      0x25
> > + * PAD-ec USB      0x45 / PAD-ec DOCK+USB 0x24 / DOCK-ec USB     0x41
> > + */
> > +
> > +#define ASUSEC_CTL_DIRECT_POWER_SOURCE       BIT_ULL(0)
> > +#define ASUSEC_STAT_CHARGING         BIT_ULL(2)
> > +#define ASUSEC_CTL_FULL_POWER_SOURCE BIT_ULL(5)
> > +#define ASUSEC_CTL_SUSB_MODE         BIT_ULL(9)
> > +#define ASUSEC_CMD_SUSPEND_S3                BIT_ULL(33)
> > +#define ASUSEC_CTL_TEST_DISCHARGE    BIT_ULL(35)
> > +#define ASUSEC_CMD_SUSPEND_INHIBIT   BIT_ULL(37)
> > +#define ASUSEC_CTL_FACTORY_MODE              BIT_ULL(38)
> > +#define ASUSEC_CTL_KEEP_AWAKE                BIT_ULL(39)
> > +#define ASUSEC_CTL_USB_CHARGE                BIT_ULL(40)
> > +#define ASUSEC_CTL_LED_BLINK         BIT_ULL(40)
> > +#define ASUSEC_CTL_LED_AMBER         BIT_ULL(41)
> > +#define ASUSEC_CTL_LED_GREEN         BIT_ULL(42)
> > +#define ASUSEC_CMD_SWITCH_HDMI               BIT_ULL(56)
> > +#define ASUSEC_CMD_WIN_SHUTDOWN              BIT_ULL(62)
> > +
> > +#define ASUSEC_DOCKRAM_INFO_MODEL    0x01
> > +#define ASUSEC_DOCKRAM_INFO_FW               0x02
> > +#define ASUSEC_DOCKRAM_INFO_CFGFMT   0x03
> > +#define ASUSEC_DOCKRAM_INFO_HW               0x04
> > +#define ASUSEC_DOCKRAM_CONTROL               0x0a
> > +#define ASUSEC_DOCKRAM_BATT_CTL              0x14
> > +
> > +#define ASUSEC_WRITE_BUF             0x64
> > +#define ASUSEC_READ_BUF                      0x6a
> > +
> > +/* dockram comm */
> > +int asus_dockram_read(struct i2c_client *client, int reg, char *buf);
> > +int asus_dockram_write(struct i2c_client *client, int reg, const char =
*buf);
> > +int asus_dockram_access_ctl(struct i2c_client *client,
> > +                         u64 *out, u64 mask, u64 xor);
> > +
> > +/* EC public API */
> > +
> > +/**
> > + * cell_to_ec - Request the shared ASUS EC structure via a subdevice's=
 pdev.
> > + * @pdev: EC subdevice pdev requesting access to the shared ASUS EC st=
ructure.
> > + *
> > + * Returns a pointer to the asusec_info structure.
> > + */
> > +static inline struct asusec_info *cell_to_ec(struct platform_device *p=
dev)
> > +{
> > +     return dev_get_drvdata(pdev->dev.parent);
> > +}
>
> This is both misleading and already exists.
>
> > +
> > +/**
> > + * asus_ec_get_ctl - Read from the DockRAM control register.
> > + * @ec:  Pointer to the shared ASUS EC structure.
> > + * @out: Pointer to the variable where the register value will be stor=
ed.
> > + *
> > + * Performs a control register read and stores the value in @out.
> > + *
> > + * Return: 0 on success, or a negative errno code on failure.
> > + */
> > +static inline int asus_ec_get_ctl(const struct asusec_info *ec, u64 *o=
ut)
> > +{
> > +     return asus_dockram_access_ctl(ec->dockram, out, 0, 0);
> > +}
> > +
> > +/**
> > + * asus_ec_update_ctl - Update the DockRAM control register.
> > + * @ec:   Pointer to the shared ASUS EC structure.
> > + * @mask: Bitmask of bits to be cleared.
> > + * @xor:  Bitmask of bits to be toggled or set (via XOR).
> > + *
> > + * Performs a read-modify-write update on the control register using
> > + * the provided @mask and @xor values.
> > + *
> > + * Return: 0 on success, or a negative errno code on failure.
> > + */
> > +static inline int asus_ec_update_ctl(const struct asusec_info *ec,
> > +                                  u64 mask, u64 xor)
> > +{
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, mask, xor);
> > +}
> > +
> > +/**
> > + * asus_ec_set_ctl_bits - Sets bits of the DockRAM control register.
> > + * @ec:   Pointer to the shared ASUS EC structure.
> > + * @mask: Bitmask of bits to be set.
> > + *
> > + * Sets bits of the control register using the provided @mask value.
> > + *
> > + * Return: 0 on success, or a negative errno code on failure.
> > + */
> > +static inline int asus_ec_set_ctl_bits(const struct asusec_info *ec, u=
64 mask)
> > +{
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, mask, mask);
> > +}
> > +
> > +/**
> > + * asus_ec_clear_ctl_bits - Clears bits of the DockRAM control registe=
r.
> > + * @ec:   Pointer to the shared ASUS EC structure.
> > + * @mask: Bitmask of bits to be cleared.
> > + *
> > + * Clears bits of the control register using the provided @mask value.
> > + *
> > + * Return: 0 on success, or a negative errno code on failure.
> > + */
> > +static inline int asus_ec_clear_ctl_bits(const struct asusec_info *ec,=
 u64 mask)
> > +{
> > +     return asus_dockram_access_ctl(ec->dockram, NULL, mask, 0);
> > +}
>
> We don't typically allow abstraction for the sake of abstraction.
>
> > +int asus_ec_i2c_command(const struct asusec_info *ec, u16 data);
> > +int devm_asus_ec_register_notifier(struct platform_device *dev,
> > +                                struct notifier_block *nb);
> > +#endif /* __MFD_ASUS_TRANSFORMER_EC_H */
> > --
> > 2.51.0
> >
> >
>
> --
> Lee Jones

