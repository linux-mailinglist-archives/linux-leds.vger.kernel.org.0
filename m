Return-Path: <linux-leds+bounces-6826-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PYKNSTigWmDLQMAu9opvQ
	(envelope-from <linux-leds+bounces-6826-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:55:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D59D8A99
	for <lists+linux-leds@lfdr.de>; Tue, 03 Feb 2026 12:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E48A93028EC5
	for <lists+linux-leds@lfdr.de>; Tue,  3 Feb 2026 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C53C33AD93;
	Tue,  3 Feb 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCyAVNgX"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF54334685
	for <linux-leds@vger.kernel.org>; Tue,  3 Feb 2026 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119713; cv=pass; b=eeDqDPOEuEEXe93Pa6rAUuyIPBQd/dwK2dwQwgZFN7qGG8S3pQy/3h5u7mqHcUEcJGT5RLnrw0dT6U7oleOVeZnsIX/XbUHZK0ksgODmWohhSw0409g6EOUOuLA8uTtW5PN0YX5mmqirkzCiXpa4HBePfgCJbF3i1g0XpntSLCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119713; c=relaxed/simple;
	bh=9O0t3nOqWgtzHoOehLwVH3QJcXMOzB1ELLyYtURrIuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0mraj/csg5haJ8FsCaqgUAWzsxUbjzCUiUhyQFX4Wvq2730IE/k9AP/ZF5RjATuA7PCMtwQFR1ZGNBV2O4A/GYD00blmsi1HuWORbI7Oo08MzlHu0hg6k8bvkPMBAuvwoqIvBK8/y8k51ccXrmJF0T5K1dxeU0JX3/Mhzo7JrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCyAVNgX; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3805045f8f.1
        for <linux-leds@vger.kernel.org>; Tue, 03 Feb 2026 03:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770119710; cv=none;
        d=google.com; s=arc-20240605;
        b=hm2IlcWyyq8ySs1zoNXlrgnr/HSWdzaAts9FFb3lYKQJONYN5BfZtxNs3mx07IaWIu
         dUbPV4UT1/HQ5jLmY483jtLHB0EQUIJaJGpEhUU9sLq4LmKXC/HQRL9gweo7dFQSssOM
         YhxuOa6Ahi3rLll1tAsALdoDUhdfpWueA5kWgFPqhbd+P/mF7aBD3m+RwpDdv3m5RR9I
         tHmuwOWDfU4LiiQ9PlhxPYjAxRfhN1ovYBRinHjRy6yjukBayeMbmp7bQB/Lmk31jE6Z
         0ECOGjfKN4za/VGwmgAWnGJ4gTfX6KJi79pIStiFdBcX+y8GNrKEizlqpJaUg/h53KgS
         PBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJ2rGVAn9aB3hsANmqfw/I2Kf6J6nYb+RtHOxOIJw0I=;
        fh=dcFiOLzX6OkkI4DoyX4cfFMgR8R3vISkZsDAYhpvkws=;
        b=cNUwH20fsKBQbdM2p2Fo5vCtFS8/hoq+EH7YzFLqT9P57MeE27fDfQn/3HZoEV8Wcu
         ahcvjzF/IRXGVIMajLx38+j+eWYHLVM83/QnCdwz6bm0Nw+tay0BdYFnFqBuPKzzmhhj
         kt18b5H7p8BvnvmkHtUXVJxxmkEh9Jy/DiwdlvFv4B0xG9w29lMgErs9pX286LMlivz9
         e4zdaxzM3OIy1pa+QmpMGkSWhEf+K0maQ/03YWCR4+lnGgUOEpBMre+lU+x9k2Cf/72f
         2mKjuDL995Nvw0bZNfncJSO4fzM5NQ/DVJCsPntgWwzn6/Bznr2x3J0c1P0m0Us5Y8la
         vdCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770119710; x=1770724510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ2rGVAn9aB3hsANmqfw/I2Kf6J6nYb+RtHOxOIJw0I=;
        b=MCyAVNgXL7nwa1l+j+PMLHiJK29uguooa6k9wvZGwna76kxD/t0qVYQbK9Mll7WidJ
         ZPcRlwB6qJ8qw0nIQHtlSxKh2FzzMfTNsX+LvGUaOWIGBAxVBWTEeKuB3lAvoBtxcEC7
         qwkIdURKccIDoWNbXifcEuR9L77pRHmnA4agCs4bmBUlEqkcnMmpjlEaYmGKPOhUNdBZ
         T+nv5tjL29a3zsW8ET2PEe27hA4ZXUxNigCfpxlSEhqe/01xzLNogfLhPNAfr5bikbdx
         KMHwbD1++UT/r1DXuMag6MNtH1Qcy0jflsuN/SCFhAdfz6v4WD5GFsNI9GlXYTdDX3rh
         oFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770119710; x=1770724510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJ2rGVAn9aB3hsANmqfw/I2Kf6J6nYb+RtHOxOIJw0I=;
        b=NK4za3ttYrkxZJTrPpbKpTy+unpkAnLXjBPzAlio1DrphOH/h4XrHejujKDqVh12pU
         F12MoxkVj5AFEYtmXpo+dqwtIA9uR+zWQO7C10PCIx/Q+UPdqU59MM/OFbTqlg8E9wAG
         WY87v511Xpe2qxeFU9PMd5PYELLDzrwyCYFpkb0xpJTpm82PqHbhrSuXVwt+eMfaEppR
         Q5yZZ3OKFvbvFOLBPWdfdzWdnrsOyGG5sfcLQSyAGUDpwmbnK9MBcsSdwJe+NkJydX8W
         sXaDEO25brqwaM6gt29R11peEuTijrV9LKC8bhfLxVLdBELK1IO7ZSY7fk1XD5nsRG6M
         NAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyrcbDBf2zH7Y43b4KLjl123NcQxsWr1/ueQBhO3odTY7HDR5YHjUPi7RsU9wE88oNX0+pBwJG6KWf@vger.kernel.org
X-Gm-Message-State: AOJu0YxaexBxWftikKOEUGZDv912z3d1pRFQF64g/VwK7ZUTBDOPF5nH
	AzjUKQsjqRG9LkDLhjbHlPwbE3VGtCmmi9/IFUlcX/rcAGTW+jnuoObhDioCDkCqOl6GMoHQUNe
	Ceyy69PgqcBi3aN7eFLj4xtgjF1eI+I8=
X-Gm-Gg: AZuq6aI0i2NB1pBp4j841JYkfifm0jzjzg4bmldSPuePHRVRm/Gggxc9Td3Nb4QHXfl
	ajB3Mx1uZCaD+mZSeM9bdEai4TBgChHhNttrRZ9oQgggbsjWvD23n7MmbXeyzXozzKALEsxKYxb
	AfPv8xQfEXhH/FggyrlwsCcAD0+Gi0hot7AYMMesNfK3f+AXdpMqnnReF1IVvD/qZ7OtgQ9k3ZQ
	MbXVz4E71QXsiIfdonq/pjSSiHF1V5bkjt9zi44Cj/LERSXEb90eB7mpnr48rEaMbgcyeG/
X-Received: by 2002:a05:600c:34ce:b0:47d:25ac:3a94 with SMTP id
 5b1f17b1804b1-482db491e61mr217693765e9.17.1770119709814; Tue, 03 Feb 2026
 03:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201104343.79231-1-clamor95@gmail.com> <20260201104343.79231-3-clamor95@gmail.com>
 <2026020350-unrevised-humming-7a42@gregkh>
In-Reply-To: <2026020350-unrevised-humming-7a42@gregkh>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 3 Feb 2026 13:54:58 +0200
X-Gm-Features: AZwV_Qgw0b1U_6kBWSx9OhS-IJWxhPVx8BmrGdD1Vb7TZ1z_SuHtAUlbzg5ifu4
Message-ID: <CAPVz0n35NkEXjur-oJhW6Yxwme_KMLdYCnRAtjHEWSPEVrSUXQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6826-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 41D59D8A99
X-Rspamd-Action: no action

=D0=B2=D1=82, 3 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:41 Greg =
Kroah-Hartman <gregkh@linuxfoundation.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Feb 01, 2026 at 12:43:36PM +0200, Svyatoslav Ryhel wrote:
> > --- /dev/null
> > +++ b/drivers/misc/asus-dockram.c
> > @@ -0,0 +1,327 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * ASUS EC: DockRAM
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mfd/asus-ec.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/types.h>
> > +#include <linux/unaligned.h>
> > +
> > +struct dockram_ec_data {
> > +     struct mutex ctl_lock; /* prevent simultaneous access */
> > +     char ctl_data[DOCKRAM_ENTRY_BUFSIZE];
> > +};
> > +
> > +int asus_dockram_read(struct i2c_client *client, int reg, char *buf)
> > +{
> > +     int rc;
> > +
> > +     memset(buf, 0, DOCKRAM_ENTRY_BUFSIZE);
> > +     rc =3D i2c_smbus_read_i2c_block_data(client, reg, DOCKRAM_ENTRY_B=
UFSIZE, buf);
> > +     if (rc < 0)
> > +             return rc;
> > +
> > +     if (buf[0] > DOCKRAM_ENTRY_SIZE) {
> > +             dev_err(&client->dev, "bad data len; buffer: %*ph; rc: %d=
\n",
> > +                     DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > +             return -EPROTO;
> > +     }
> > +
> > +     dev_dbg(&client->dev, "got data; buffer: %*ph; rc: %d\n",
> > +             DOCKRAM_ENTRY_BUFSIZE, buf, rc);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(asus_dockram_read);
>
> No documentation for these new public symbols?
>

These functions are mainly used in communication between the dockram
device, asus-ec and its subdevices. Export is used here because all
mentioned devices can be built as modules. I can add descriptions of
functions into header if needed, but they should never be used outside
of dockram-EC complex. Same applies to 2 export functions in the EC
MFD.

>
> > +static BIN_ATTR_RW(dockram, DOCKRAM_ENTRIES * DOCKRAM_ENTRY_SIZE);
> > +static DEVICE_ATTR_RW(control_reg);
>
> You did not document your new sysfs files in Documentation/ABI/ which is
> required.
>
> Also, why do you need a brand new user/kernel api at all?  Who is going
> to use this and for what?
>

These api were used mainly for debugging/logging purposes and descend
from original downstream EC driver. I can both add documentation into
ABI or remove them if that is absolutely necessary.

> thanks,
>
> greg k-h

