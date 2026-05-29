Return-Path: <linux-leds+bounces-8377-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI+MD1mQGWpTxggAu9opvQ
	(envelope-from <linux-leds+bounces-8377-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 15:10:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D32A602B08
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 15:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70EB13011351
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 13:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A3A324B06;
	Fri, 29 May 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLOeNaY+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7CE3128B2;
	Fri, 29 May 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060245; cv=none; b=Nv5RFobVaOjByFrun8H+KzNdgY1W8gD1doOo8p2OGs/VxiXkV7kjZSdwmBmzf5Ht3JUzIWiI0WQOV+Pxsp+pTxS9lvf8L0GoJ3k2Lum+pXiKYIljxd3+nhejDQ0Vid5ksLS2uV+MjoS25L9VxRgei40ZhNT6VjuOob+6SyYCxSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060245; c=relaxed/simple;
	bh=zuzinPcFhRl9plRyoeXIwzrcl/6M6IK0u2t05etneN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h4YBHaaNjM5Bmdq6yvdEAgFBWenRDdUPEQ/mDa5uvzb4HBJXAPvcU13GfvMiD9ZHQQ+IvnEPxXJ/FdAXT/mJvta28ytREimqAw3QZghqnhyruMGDgImoLnKim9P8Arv3U1P4vvfP6Qt6OfUD5/Ktitk2t71R32oFqxXp0eFOiFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLOeNaY+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5F21F00893;
	Fri, 29 May 2026 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060242;
	bh=tC9HqkQy8s8fCowmxdJQZ9JYQ14fcgNVnaNweKmAX5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mLOeNaY+LFPu3SP40WdO2KaINV+FYH004qBTmn1FtKJB81vr3GaeMS+zXZ2GLc+7g
	 Jb6Y2Fzb6OXFGL9y16tZdu1odcIA8Atb87zT6MhQVOL1gwDsa5JEEsM/vsH6CpBbNZ
	 6jXOArmVUaFWwm300UxV0flUbB4hP8IzDnFecLWxP+re32gb/Rab7G+RvvaUvSSNLZ
	 QT8cVVWpcT4PrlCJPeISJV0SDOXxHdyJSK7lSRV8ONlcrmfF7DsauYAVdzennX+qUG
	 IXWcnDLuiLQB81wMlInxRv7f36RnEfu1wqtz2YOVrThqQr1wDtWWP9AD850L0BNa2k
	 kynlbPBjctgqA==
Date: Fri, 29 May 2026 14:10:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260529141031.62703eff@jic23-huawei>
In-Reply-To: <CAPVz0n1u0z35rP8vUKjAzW_mrPm9yeMjK_-nKbyctUvQik6ECw@mail.gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
	<20260528135123.103745-3-clamor95@gmail.com>
	<20260528155001.2bcb7003@jic23-huawei>
	<CAPVz0n0qCekQVGGyAyBuYv+RKC6bpydYBLJNGfPrgTYjtOJOuA@mail.gmail.com>
	<20260529100819.1823ebb3@jic23-huawei>
	<CAPVz0n0VHdUo5oHdALgcerLsykdz-2n7c+jxYHrMOV7Ra5x_qQ@mail.gmail.com>
	<20260529114828.5a87c732@jic23-huawei>
	<CAPVz0n1u0z35rP8vUKjAzW_mrPm9yeMjK_-nKbyctUvQik6ECw@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8377-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D32A602B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> > > > > >         if (device_property_present(dev, "ti,resistor-value-ohm"))
> > > > > >                 ret = device_property_read_u32();
> > > > > >                 if (ret) //corrupt property in some fashion
> > > > > >                         return ret;
> > > > > >         } else {
> > > > > >                 //set default
> > > > > >         }
> > > > > > If there is no default then check it unconditionally.  
> > > > >
> > > > > default value is LM3533_ALS_RESISTOR_MIN and if no property is present
> > > > > clamp will ensure that als->r_select will be set to
> > > > > LM3533_ALS_RESISTOR_MIN  
> > > >
> > > > I don't see that default in the binding doc and relying in the 0 being clamped
> > > > isn't particularly readable - I'd set it explicitly.
> > > >  
> > >
> > > Oh, ye, my bad. Schema enforces one of props to be present and if pwn
> > > is present then resistor is ignored. What if I move resistor reading,
> > > clamping and conversion under !als->pwm_mode check? Then resistor must
> > > be present and hence must be checked unconditionally.  
> >
> > Sounds good.
> >  
> > >
> > > Additionally, I can comment original lm3533_als_setup with #if 0
> > > #endif then git formatting will be much cleaner and easier to review,
> > > and once we all come to result I will just remove entire commented
> > > block and Lee can pick clean commits.  
> >
> > No don't do that.  If you flatten the two helpers as a precursor patch
> > then the changes in here will be easier to review anyway.
> >  
> 
> By "flatten the two helpers" you mean incorporate
> lm3533_als_set_input_mode and lm3533_als_set_resistor into
> lm3533_als_setup first and then convert it to use DT? I am asking,
> just to be sure.
> 

yes

> > > > > > > @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_device *pdev)
> > > > > > >       indio_dev->channels = lm3533_als_channels;
> > > > > > >       indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
> > > > > > >       indio_dev->name = dev_name(&pdev->dev);
> > > > > > > -     iio_device_set_parent(indio_dev, pdev->dev.parent);  
> > > > > >
> > > > > > I'm not sure why this was there in the first place.  Hence not sure if it
> > > > > > is safe to remove.
> > > > > >  
> > > > >
> > > > > This is directly related to OF conversion. The iio_device_set_parent
> > > > > bound indio_dev to parent, and it causes problems with OF now since
> > > > > als output has its own node and binding it to parent if wrong. Same
> > > > > story for backlight and leds btw.  
> > > >
> > > > Is there any risk anyone was using the canonical path to get to the iio dev?
> > > > /sys/bus/platform/devices/..../iio\:deviceX
> > > > This is technically an ABI change be it a subtle one.
> > > >  
> > >
> > > Linux kernel has no users of this driver, and it is in "stale" state
> > > for more then 2 years (maybe even longer). I have cc'd Johan Hovold.
> > >
> > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> > >
> > > This this 2 y. o. discussion and there were no actions ore movements.
> > > I assume this driver in its current form has no more users. This does
> > > not mean that it cannot be revived though.  
> >
> > So, just to check, are you a user of this code or is this more trying to
> > help out with old code?
> >  
> 
> I am not insane enough to get myself into all this conversion if I did
> not need it. This is one of 2 remaining gaps in support of LG
> P880/P895 I own and support. I would really like to finally mainline
> all the patches I have locally since maintaining them becomes quite
> troublesome with time and additional patches layering on top.

Excellent! There are some odd people out there who do start on this
sort of thing despite no personal use case :)

Jonathan




