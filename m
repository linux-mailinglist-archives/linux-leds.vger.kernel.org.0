Return-Path: <linux-leds+bounces-6828-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGfQADjkgWmDLQMAu9opvQ
	(envelope-from <linux-leds+bounces-6828-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 13:04:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F825D8BD8
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 13:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABC7D303E4B4
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 12:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DDD33CEBF;
	Tue,  3 Feb 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdzPS04D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D828C31AA96
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120107; cv=pass; b=FmSVuLQpBVepMuuHtoOhbSP6BPeqeVJlpC93XvOWYzYZi9bO2xGCoMXw0Le918IJwjtB7/WrMsl62SyFOmsHGdjs86x8/WsfIjQcgGHjZ8BwBUz8+89uIHEVh0q9rY7Dz4MqJs/JZyC2P/g78An7Fc6FMMwvlqIDa53vArbmTD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120107; c=relaxed/simple;
	bh=KgIolBAt6/FrgaPpJwLax8SGQvAvtZV5AB2VrW6pIuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANeLvfgLip7OEY1Wg4aTaKd1ADTUPDCzeb5lwCYuYXkmU94jFmhN894NglU9IcGNU3STFSh4gk8CwH0XHsg4Z6yTDJ6w/9UKGwsCGGMvbrfNH//3ld4zHIotI14AZvQhscTrGm7H75lAhkkmdQlXx/MRTNNNpEDqxAUAEms0LHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdzPS04D; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so4749516f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 04:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770120104; cv=none;
        d=google.com; s=arc-20240605;
        b=CED5h6Ly+KuVJS2SzCJEsuPF678gRMDIt4z6TJFUfkaZDKd2b6LF8UGMA3B0Wf3Jt7
         CUQBLCy5VqQm/Ym5pYXH3lxlqyRK+HRIKWMTuod5njRyNzMuDfaZ92fOTADA9vBdU5v1
         Y2HCaSJEIqUeAlq6nM1V7z6lOHIfpy0JwXMRjq85o4cnDtF6ancfVTOCF6+U0n+dt4Yk
         uVRSJ48oVzY/w5R2HgpyDRdOb9nCHu/SXROoxIz9mQ4aQ3WUOP8QE9Ir9fnuOK4Z62Q7
         ylgkDtkVDk/0GXwyU5iL4homhRpKJEPNpvAnpEzG4hQwKuyLSWFjhqnruA4aiBatfpP+
         dSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j2VFmkjkyUco8JpC8ERq9+9wVbEgE55aH092lxEE7AA=;
        fh=cSEpCVyvSY9aTlbo5QuiNRTP4J4CM0iElV3slD4LY3A=;
        b=icrWBnC+0BUbjfZgse2NAXz9kVlsgO2JqjDbl9dJMqVFIDqxk5YW6AMZB6ug0a7MQP
         Zx5K1w4BaaSU2FmZ90y1dlrjejsejOYE7E8KqBOqQnfmJaM/iCTITMAPvwp1hyk7imQ1
         BEbhxZX2j6i5FKGKPvlKXmQd4dJIZoI08O5kVs5cQJDPBghkpuZOfF98f2vJSXGpRN1+
         sYe0i1VluiGnHBL/ws6Kdu0U1UEa40bAIKdQbAc561nsiuw0lxBRqVKq1FRBOwVe95uz
         /6TjdmQitz1uNfYkguI+SEJerpntL/nJpuGXKx7YIg6aGg3IIj9TQad0X0g6R75tKEII
         w6rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770120104; x=1770724904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2VFmkjkyUco8JpC8ERq9+9wVbEgE55aH092lxEE7AA=;
        b=GdzPS04DgJWbVhGdA2GLpyD8YFmtcjDo0w9k/VpyWJJdd4iucnSGHa5kANfD5xlCq3
         dRpMLqpGB6czdTfsSaBp9QXOFEodZu8Q/Zr7gCdCXkRTDBR/a2nX6lJeMccHDkWeGmnh
         St/H7SbdgVyC68OlR8eFBdd4ar9PSRRx9R5iPjJBPzm4bO3SRw0I2P7IH7CC42csFy5N
         1u9LzhMnOlg3WwT0oEwd0MGlLlaeNuGGWJtYCdZesXVBPdt4a3jKWdfH/DL5yEuTdbXV
         M9yt0/8MQHqyC7+RNyO4YMajTtUFqpgLhLv8WnJ2HRgt+EHfgfDR9qLCYs1akpxRVX4l
         MeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120104; x=1770724904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j2VFmkjkyUco8JpC8ERq9+9wVbEgE55aH092lxEE7AA=;
        b=kpD85Z0W12wPjhOjD+wmqYFv+rS7O2IZADvf17WUwEXORS+AOqCjGVRVpOMUoBq8jQ
         7thIbRdGKbpsfozg3/NrNmeIc2cl9GC/8y5EUGyRYeaYiUHYt4qz5wrGjX4z6nd3A5Xl
         nl79X2O2tqq65OVLLPjJja02C081HL3pINVss6YqL7Azxp6psV96ar1U5pJfVvigjeeK
         +VhFR2qVWZ/KUrcI8TX2RBxFlC9K8TrRw5qJd+XQMqQ3GXm5KuI0zvPA5UZl8zu7fERg
         ySkcMtnvNra9Thit++CNII/iYmLxvCFBN6a+6TciRk2v/+lRa8MSOmdk+Ux7DR5pvRqs
         zsmw==
X-Forwarded-Encrypted: i=1; AJvYcCWCpDKh9FaKjvJmqenYZMFTAfZ5WpgM/6s5L2DUXE3mVE90YhQpDlleJ3kaF+7MPSuL+0TTMYumed7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yzavm2HiMhKd46t07HiXKg9u4NpNudVnjaUyT8V0YZs3W9w3C81
	VdTwK/LY0a97NS/R5za/tS91mhvV45dUUSNm63TWdltesx0XmW1AghNgXzgglnu/jozBcOMTdDK
	w75hCUsDuFAWxfXpCD+8zB+yc52J/Oxk=
X-Gm-Gg: AZuq6aK6NbsVyRDBdGgYtsh10yGt+p9/v7TBWrQqb/z2LE/DjP06ZqZOLVlmNKuKPcD
	bH1/J2H9KFZf3dqKUlHfxSl4f49KEUpHvMy0WLrWTsLx7yGudxFvPtzlv4wR6fBosNWEaAghauA
	k0Kk+L6Z+kbDYggAX1bU4xSb4N2+19Tuc8pJpgeWLFv0oMY0Ljp7Q+HnzvOYrTo/I6WwaxahXFQ
	HG5/BC0pGtAPptltNNghZdMd7qtpwdwQ6+kegGK6WHtQ1f/hO1t6iva8WVVQCBB2GTqdje6
X-Received: by 2002:a5d:64c9:0:b0:431:a43:ee88 with SMTP id
 ffacd0b85a97d-435f3aaf7cemr23688957f8f.42.1770120103900; Tue, 03 Feb 2026
 04:01:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201104343.79231-1-clamor95@gmail.com> <20260201104343.79231-3-clamor95@gmail.com>
 <2026020350-unrevised-humming-7a42@gregkh> <CAPVz0n35NkEXjur-oJhW6Yxwme_KMLdYCnRAtjHEWSPEVrSUXQ@mail.gmail.com>
 <2026020346-ashamed-campfire-b483@gregkh>
In-Reply-To: <2026020346-ashamed-campfire-b483@gregkh>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Feb 2026 14:01:31 +0200
X-Gm-Features: AZwV_Qgr0pBQ1wVH0-u5VwU9YYr35W4aVL8W6PTRUnVQKr-nmLWu36hzeAruxuU
Message-ID: <CAPVz0n2i1r03R=yO4XnQpKFggixfcn_Ni4vGZrfDyEOTJHDi+w@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] misc: Support Asus Transformer's EC access device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6828-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,rere.qmqm.pl,agorria.com,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 8F825D8BD8
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:00 Greg =
Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Feb 03, 2026 at 01:54:58PM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:41 G=
reg Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Feb 01, 2026 at 12:43:36PM +0200, Svyatoslav Ryhel wrote:
> > > > --- /dev/null
> > > > +++ b/drivers/misc/asus-dockram.c
> > > > @@ -0,0 +1,327 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * ASUS EC: DockRAM
> > > > + */
> > > > +
> > > > +#include <linux/device.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/mfd/asus-ec.h>
> > > > +#include <linux/mod_devicetable.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/slab.h>
> > > > +#include <linux/string.h>
> > > > +#include <linux/sysfs.h>
> > > > +#include <linux/types.h>
> > > > +#include <linux/unaligned.h>
> > > > +
> > > > +struct dockram_ec_data {
> > > > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > > > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > > > +};
> > > > +
> > > > +int asus_dockram_read(struct i2c_client *client, int reg, char *bu=
f)
> > > > +{
> > > > +     int rc;
> > > > +
> > > > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > > > +     rc =3D i2c_smbus_read_i2c_block_data(client, reg, DOCKRAM_ENT=
RY_BUFSIZE, buf);
> > > > +     if (rc < 0)
> > > > +             return rc;
> > > > +
> > > > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > > > +             dev_err(&client->dev, "bad data len; buffer: %*ph; rc=
: %d\n",
> > > > +                     DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > > > +             return -EPROTO;
> > > > +     }
> > > > +
> > > > +     dev_dbg(&client->dev, "got data; buffer: %*ph; rc: %d\n",
> > > > +             DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(asus_dockram_read);
> > >
> > > No documentation for these new public symbols?
> > >
> >
> > These functions are mainly used in communication between the dockram
> > device, asus-ec and its subdevices. Export is used here because all
> > mentioned devices can be built as modules. I can add descriptions of
> > functions into header if needed, but they should never be used outside
> > of dockram-EC complex. Same applies to 2 export functions in the EC
> > MFD.
>
> Then you should properly document this :)
>

Noted

> > > > +static BIN_ATTR_RW(dockram, DOCKRAM_ENTRIES * DOCKRAM_ENTRY_SIZE);
> > > > +static DEVICE_ATTR_RW(control_reg);
> > >
> > > You did not document your new sysfs files in Documentation/ABI/ which=
 is
> > > required.
> > >
> > > Also, why do you need a brand new user/kernel api at all?  Who is goi=
ng
> > > to use this and for what?
> > >
> >
> > These api were used mainly for debugging/logging purposes and descend
> > from original downstream EC driver. I can both add documentation into
> > ABI or remove them if that is absolutely necessary.
>
> Debugging should not be in sysfs, please put this type of stuff into
> debugfs instead if you really need it.
>

Noted. Thank you.

> thanks,
>
> greg k-h

