Return-Path: <linux-leds+bounces-8557-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3mgLAP16KWpnXgMAu9opvQ
	(envelope-from <linux-leds+bounces-8557-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:55:57 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2366A787
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:55:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Vgfd9sSR;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8557-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8557-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC543337B941
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 14:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7983A40B386;
	Wed, 10 Jun 2026 14:41:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D33F3EBF04
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:41:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102470; cv=pass; b=VK4wN4dGnrZt8+2FB9x2JUHyOFbu250LsobaqUDvJ0uuiI/nwszWQRZdNDqnKO0zHy9VC7wwJgIwA8tW95ZFSxDSj+NWeB2Z7O89gvsnMkfeffQHRw/8ax519Y02QfqKCAZfyJ7TgSC01tDYvVkIA8RwqNBa1AyhSgdcCgRr1As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102470; c=relaxed/simple;
	bh=YCrTVgxtNb3/Puhd+VuNFi+8Y/zMnTomZfUQA67oTaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r46Sg7KzTrLztmq0sp8ETfEdgGekBhybmM69GYUwiLPZGa32B8MJrRzEE+hg4KZt3/Toi2PXMsfrl0RrpMDo7rXoyCYBiiE9O9Xud4cZryEjMjRDrkAvDsdfVxkC57pNXghkdE1DC4bqK4XeJFBqQyjz/a4t55Nj6rLOkaaDLA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vgfd9sSR; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3075ce9c05aso906282eec.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102468; cv=none;
        d=google.com; s=arc-20240605;
        b=c81E6Pi9JSu5k82d1t1Iev4K6itxF+joIEKb4DUBSzurlKcJVfCbGM1CtQpy53FRjC
         rS31GT3plRQjXA/vhhC6HRg/x6KRp8SrDwOcuRULKp33rfVpmi2tTFMvbCIeqa1qMKJD
         V8f8Xvmpw+MZxSVfUsk53dlIGT9BKH/Tu/VwfkFXaD/ebb63NOKSGitshfRfsAFFss/I
         cFr/7Lm0kEU40tGziyTGEFKQPsTDSclIWk0bjuFSZ/EG9cVscZHhNzT5NFR0joSuI4h0
         EcnmcYK6sZxadgZAqkQ4QEOY1tLFE0FYT3b8btvsazEQe0uaYCs9N/iIylfa1bBbn3nI
         xu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        fh=vgRVb46PsQ7mDN2w6XiDsiJhlsxjdq/1Tyn1JUMugWg=;
        b=M/3EicVP1AeIMkQ0X36JUdHESh0AdG90V7cA0lv5rmK+QkYhemmNEWI5kB48k3ulMH
         39MskuK/yQ3xoiOmWh440J/munRt34o0HLmjHcZ5LLpmyD6x43pa0FIUHHED3yhHc9cQ
         jSCz1FNpNo1bM1VW549Obm1EFIVO1Mmvvg+deyyQeJXSXxPnhrNKUsNjdMD8WgZ+TAFi
         m1XR0lSEe9V2tuFts+0V55SKdaaXNUANWgG1Kxevgkr0n6FJzYQz6Kh4D/0EhccvjNUJ
         DvdjsZ+v/En5mOOUMoO5NbKhTfC9j0h534aF5l+2bE4HksosHUWYq0BfuR9pT+5BOw7J
         yasQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102468; x=1781707268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        b=Vgfd9sSRIbk1PrSD2RgZpjXEoLqyOM46SOXwm3pspFkanQeV9n4y9HO3MvedRjXjqp
         1BEJVCKeyVVosa7InrIRhm67iKI1RCYWa3VzvMhcsCn/o+mxl+hbkJA9I35rZnf3TQqB
         E94GRyTNSV7osQqRMsmZ4gGekB25epjLVtln5NyyHQa/cDxTACpqsbMNayM3ogwSC+Qb
         wU16SIHJ5PgnE+ZYw2e7jrEvLZ/nCfJR3BwECDoUF8nZRovd1AH5ZaLjh6V8w4fR6/S8
         3qnVcvY40ulWhMRJpyG6Q+sjQjcYiGizwIq87WzPpfnVodfSbOk0aqZBSRpmZUEeD1G8
         4RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102468; x=1781707268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pji6N0wT5lk6iw8ewt/c1NaXvzId0tCzXut761rthuw=;
        b=FHyJaqyuVHPPEFEeF056DFgvQbJr1f9Q6mHyhYm66u+eHEcIjpIC1spAsmAyUtpsaj
         2Cwi4lyF7OjtqkBOzY0d6h3lXgyhRfHAhsH5Pel1ie4TrKBLg3ud3Axf5BTRlSlfz7xK
         YmKCooian2M0AWeKfmCZsGq0cWdg0vboywt8yjG/3vY9Xsa4Gy4CO98ok0b+MMAXJivC
         V6fOsCRMf3cJVwQODJEqcQCt72L7b3NpzpQ4TVuwKdISo6RxuBw2P5xlY9ozxtY6oCgo
         7vMwzieyYU+MofYHl1F4pTHQLYnfhTFceSjq7UpCD4ah4eUGMeZPk8D9HhnnMI2zcCsH
         Vl9w==
X-Forwarded-Encrypted: i=1; AFNElJ+aktQYtoNcHGeQsywVOM3hhqyvQU/l24Uy+NtHvorjJkkoViPLIKFToM8Cj4+HteLTZuauyDzrItsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yztjfy8RyT5AM4HMYiGFHSN4VKA/G30D96Y5awJKXYjx9kLRQhZ
	C86v7x4607yGwA6ZtHglPntiMqfUqEvXRIElzN2pZ/PYMcpnERCbmiePBGDrOVHm3Gky6QFgvk1
	w8KWc0KkomswBybjRk8Gkpbx/a7d1ZOk=
X-Gm-Gg: Acq92OFQqkrfQJwHVuc19qc0SVJXxGAP3ibsfS9vd/EGEsD3tFAEGtKekw0UJ8IK/ff
	od2NlZ8hbexJ4tfOQlhS3QMX8Yrq5ZQ2B2jXIqcAMlt2G+FR2zK2sO5wU4XheIdaDV5PWrh1sIT
	Rrfk50BhyoGMJ4PFbd87le0Wb2kLBR01HldFIfkayvxxCfeg9N5mmDtYIBVGyugBcXWW7h/OlkW
	+mbmdbtvgXyUFMKxlIXf4rKuOp1egdT8hS3IqqvixobnWPcK7tYb2pFNtNjxg6IAU709SGOXhY7
	xRt5OeTx2Di7yNE6dbo=
X-Received: by 2002:a05:7301:678e:b0:2de:c5ca:c1f3 with SMTP id
 5a478bee46e88-3077aeef992mr17016589eec.4.1781102468242; Wed, 10 Jun 2026
 07:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-11-clamor95@gmail.com>
 <aihm315UtdqJclhh@ashevche-desk.local>
In-Reply-To: <aihm315UtdqJclhh@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:40:56 +0300
X-Gm-Features: AVVi8CcyvQrrDJA2ZF-oz3jxiSwxgRbJF6e_otLwcACmPvI2rKDir5j4hVf0fFQ
Message-ID: <CAPVz0n01ymfYGH+_MgfHvWqzg+tczLi8E-1q=rZ5cHu+uJrpdg@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8557-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67C2366A787

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:17=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:34AM +0300, Svyatoslav Ryhel wrote:
> > Missing coherent_dma_mask assigning triggers the following warning in
> > dmesg:
> >
> > [    3.287872] platform lm3533-backlight.0: DMA mask not set
> >
> > Since this warning might be elevated to an error in the future, set
> > coherent_dma_mask to zero because both the core and cells do not utiliz=
e
> > DMA.
>
> Hmm... I am not sure about this. The entire kernel has only two drivers t=
hat
> do that, and thanks to their commit messages one of them pointed out to t=
he
> commit from 2018. So, if no other devices suffer from this, I think it ha=
s to
> be a better way of achieving the same.
>

If mfd framework warns that DMA mask is not set then this must be
addressed. Why then there is such warning at the first place if mask
can be just skipped. Then warning would be just a debug message. What
is warning today can become error tomorrow.

> --
> With Best Regards,
> Andy Shevchenko
>
>

