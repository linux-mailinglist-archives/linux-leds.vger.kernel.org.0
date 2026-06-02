Return-Path: <linux-leds+bounces-8426-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pa1JP6xHmr7JAAAu9opvQ
	(envelope-from <linux-leds+bounces-8426-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:35:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3663462CB28
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 12:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1FB0300463C
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 10:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA803D6491;
	Tue,  2 Jun 2026 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgdcvLgs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEDE3D566E
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396317; cv=pass; b=OXa7Bu8g84Y/z1gYrQGvGaeV44Ay7MXwxscVmfr8AUB2dMhlwgayRh1q03UKJCjEFzbkaxemdbsOvoTpcJJ4zdpPhNxwOS+hx2s3lDMhUtz13QweG9tgvDGY4kARSr79ac0hptIbZA+Gx8TSfhnOagV2d/GauarzxeMezq6KjXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396317; c=relaxed/simple;
	bh=FrPJKUKAeNpDp2O8s3b0xd97pGYPIKC59ry1jtVER0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTyFvXpxmKYTwwkTxTgi05igA5mvd09iFGIFHoBR+EUwhHQjWKYk/hQaxU2Y1Zsrnu3BNvLyTm0JeQ/BO/7JNC8eWwS1UowD3wwlFXoIg/xhS8UhqQF1RlxCRV9EcVFv8ix8SM9gjkDjqvnGT1R6ugj04dPU6ziRNk9dOHd4b30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgdcvLgs; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304cf518c9dso7558662eec.1
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 03:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780396315; cv=none;
        d=google.com; s=arc-20240605;
        b=EZlyqtfh9ZCTxClk5qglRJ2bIYi9L7vTqh+qMEV2PaR4TMj5jS3qYL0+kQ2d9yU7FV
         GarZSeKDE5cV3d2krs940GuLm5lyCM+uxz2SQapT/BFUax+USR+X5+Rin66g9w4RkrRl
         DSv566uKsd2OkhGoRja5JEtyb0uSLeRawH6SgSYLtR7XAh08nJcbD7hZjNcAoT2yz7ZO
         2VKUuvcHfU33mQRjdH+2kg9DAxZy4DHNYMsGLzfS0xkQanl6yBlMTL4sfuAi0FvB7EDJ
         uRnG7tUM9pHYvEXULTt4GknwaGZCmDsPzMZN3a6LRXOxw9wIVI1uJg+z3rKmYmIqBY91
         K3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        fh=S+AD4Ap6U48+IKUmnOeomVjOr7Z0AAdCzUL5ARo3i1w=;
        b=LRp4e5N/pTbZOFJKuNfkdAK2HHqEJM9OueMPHlPDIlN8BWRbGJ9/3g6GMV1mRKhpl8
         CIUjwu/0dWHUEQFcUi//WPo42qDL6nq+Q/jfokwFR0IFfh27BzirZLj6kT3wyDMJE9J9
         WA1kmEMbhOCU2Rl3oVpKig/XVs5rCN4odUxb1ApIpuTIOuwRKCL/918uYhWwnBrsDvgG
         IKkWveqlEEAbZg0N3VnQOB3hPuu8hKqo1JbU9CVq8rd4WDx3ASSigXMPtMZSZ1ZE8ndL
         zEKBW39R3VZVOnOuEFn+dzpWbusqWQOtN9ZI1aRvnGgNLm/0l7pd+88S+6rpssU+oD3E
         kPHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780396315; x=1781001115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        b=kgdcvLgsZ3uILaWfcIBvtHl1005DoEY8tGo67hlFEfjapWwGze3khJCdXZVrRKnA5h
         37CEtBPX6b8X0AaK1mntR77AtOfQ7CnhjfrTLJkgB7WDAz4Y/g/BYmJIegvqnORr9bq5
         n4OWtbMTtq/mjZcJIJcbF+jusrW4PmKgWNJhp8HOEGxYqPKN/UJEzHEriS9U5IkVSd/X
         a+n0v00qp7WOv4PuvEdollon2e7UV0qZEw4J8/TKa/gk16Yk+R6ZtCJeo0qvmGh4xIYN
         My3s/VQXDMREfLQ0j0hnhT0u5c0lkmltuEnWw+FvVO2NdGut68L28anjbQPSB74A/WSt
         icGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780396315; x=1781001115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDdI0YPykfuK0xhOe7sArc4RNqAa0Hyds1kbH01jcws=;
        b=Xsqzes1h3BnD+6agc9j5b64O5EY3NfRFyqUSV371Amz889j5RYdPfteH3cMeWevKoI
         UASDryFb8hy6Klc4NF5aMLl3yfDeQ5DpVoNl9k3wZ9zu8eFkEAZ23LsDhJAWWeMd7eHU
         0nCWcFjMjX7iDMDhEFAtGFuft4fL/e4ZPzKqkM7dgmn4Oj8rePRQaOqKMElCWXg2q7ql
         AZdY7joFckglAQ5qk55ReGi+qchAcg1h0+H6V7qYpHyI5e777YptuATdk2X2euBLC/NL
         6x2Y4wSR5HWJRn2eXMc8RPa+v/IA08WykHZjIlnKTXuWnU+BtQlHthUEUo67hdVKp29B
         M9ig==
X-Forwarded-Encrypted: i=1; AFNElJ9b79U4MHziwdk9EC+2yb4I0W2pabKjLJmCupo6A+3mtNlPMC+5z3aJ6dMRkBsaD6qZN6aOt9AuMQ+T@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDIgAVdqCPfS7m/QcA9hNJRp7ktiF4hRW3cT6IFOJpV5qHmCd
	aQuvdVED/Dc9/SowsVbEgU6uhxsjmXRgaIY6hisrwYymQj8z3/NIHfeRQ+SJ8IfKUEv5pb8sjL9
	eFc64MCLgqy1i+IspSoOcCnmYe6HWAfI=
X-Gm-Gg: Acq92OGyHC81UZIDG/QY/USqcJvuCifqLtO/uUawRhVowbp28J+JzjmlKq0M+LzCnpp
	04BgyKOcqW0V71UMma7sN7b+zcnWGvwqB438Z46Nu/h3QS6Zod4S1fjO/EO93D+sTgauOzEsGwb
	GhQax24zDtvTCEFv6ICB4oUBayprNTGQmoYn/tdxScMAgRQecXWtMLkV36tVMrCPmRDV1VRUgQR
	rpIUGDOgVnxJ3iur0JyI8ErmoK55NUv6CsSmLiw0G9cuzhQeUAgXkbMPtgMwy2wbzbZPPiRuPfn
	nkaf83/vOluAmX7B0MZuaY3iEwcQlw==
X-Received: by 2002:a05:693c:2c86:b0:2c1:7793:7bbb with SMTP id
 5a478bee46e88-304fa64c553mr7093613eec.27.1780396315135; Tue, 02 Jun 2026
 03:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-6-clamor95@gmail.com>
 <ah6TGjRNnDpQGO60@ashevche-desk.local>
In-Reply-To: <ah6TGjRNnDpQGO60@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 13:31:44 +0300
X-Gm-Features: AVHnY4LWQiJbbknL3YlvePeYbIxJnooafI1v7YVQtfA6307ubpWpYRL37q4rijM
Message-ID: <CAPVz0n21RGAaJc1sda4xyp1h0z+6R6FJ4=XWdOtB1mgtV8=RUA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3663462CB28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8426-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Action: no action

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:24=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jun 01, 2026 at 06:18:25PM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
>
> ...
>
> > @@ -57,6 +60,9 @@ struct lm3533_als {
> >
> >       atomic_t zone;
> >       struct mutex thresh_mutex;
> > +
> > +     bool pwm_mode;
> > +     u32 r_select;
> >  };
>
> Have you run `pahole`? Does it agree with the layout you made here?
>

Noted.

> ...
>
> > -     als->irq =3D lm3533->irq;
> > +     als->irq =3D platform_get_irq_optional(pdev, 0);
>
> > +
>
> Redundant blank line.
>

Simplifies code perception, whatever.

> > +     if (als->irq =3D=3D -EPROBE_DEFER)
> > +             return -EPROBE_DEFER;
>
> What about other error codes when IRQ is found by can't be retrieved for =
some
> reasons? IIRC we check against ENXIO in similar cases
>

Then we treat it as no IRQ. Original implementation cares only if IRQ
is present or no.

>         als->irq =3D platform_get_irq_optional(pdev, 0);
>         if (als->irq =3D=3D -ENXIO)
>                 als->irq =3D 0;
>         if (als->irq < 0)
>                 return als->irq;
>
> ...
>
> > +     led->pwm =3D 0;
>
> Isn't it 0 by zalloc ?

It is, thanks.

>
> > +     device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->=
pwm);
>
> ...
>
> >  #define LM3533_BOOST_FREQ_MASK               0x01
> >  #define LM3533_BOOST_FREQ_SHIFT              0
> > +#define LM3533_BOOST_FREQ_MIN                500000
> > +#define LM3533_BOOST_FREQ_MAX                1000000
>
> HZ_PER_KHZ  (since you included units.h)?
>

500 * HZ_PER_KHZ
1000 * HZ_PER_KHZ

You meant this? Sure.

> ...
>
> > +     nchilds =3D device_get_child_node_count(dev);
> > +     if (!nchilds || nchilds > LM3533_CELLS_MAX) {
> > +             dev_err(dev, "num of child nodes is not supported\n");
> > +             return -ENODEV;
>
> Why not dev_err_probe() here and elsewhere? It looks inconsistent with th=
is
> patch.
>

I must have overlooked it, thanks. WDYM elsewhere, this is the only occuran=
ce.

> >       }
>
> ...
>
> > +     device_for_each_child_node_scoped(lm3533->dev, child) {
>
> > +             if (!fwnode_device_is_available(child))
> > +                     continue;
>
> Do we need this check?
>

This is nice to have if the node is disabled. If we assume that there
are no disabled nodes, I can remove it.

> ...
>
> > +                             dev_err(dev, "invalid LED node %s\n",
> > +                                     fwnode_get_name(child));
>
> %pfw
>

Noted.

> ...
>
> > +     ret =3D sysfs_create_group(&dev->kobj, &lm3533_attribute_group);
>
> No way. You should use .dev_groups.
>

I did not change how driver does this, just swapped lm3533->dev to
dev. I will set is back as it was.

> > +     if (ret) {
> > +             dev_err(dev, "failed to create sysfs attributes\n");
> >               goto err_unregister;
> >       }
>
> ...
>
> Can you think on how to split this change to smaller steps? I believe it'=
s
> possible.
>

No, I am done with tinkering with this patchset. It is broken enough
and it has inflated enough.

> --
> With Best Regards,
> Andy Shevchenko
>
>

