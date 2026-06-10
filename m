Return-Path: <linux-leds+bounces-8553-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C9LGFwZ4KWpMXQMAu9opvQ
	(envelope-from <linux-leds+bounces-8553-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:43:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96266A547
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 16:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WFfICjz2;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8553-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8553-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6916329CB4A
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jun 2026 14:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08763C1097;
	Wed, 10 Jun 2026 14:32:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D0267B05
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:32:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101953; cv=pass; b=t/r9F/gKQgB93xlZXXScMjHsEyw9VwB0PyceGY6lqcqJ5tXgUGQSROlHBwa3e8K/p1TkgxMiOR4Wr80oBObHM2AqT3Kr5shBGGYc/t9PqCB3TtYPjn5UpBHLEJW5tJBzq2cdxRzcCnRYWbRhK55MICyUvefi0/hF4BK7nO4GCYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101953; c=relaxed/simple;
	bh=ES4Wwnm7LDTekDfxBkRjueXtU+JExOHrirYIoXL7mMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqoHqdCzT8k3seltqwwaNK+IJIjZgwwS1bXaDj/5QtPfgpi5Q+nQZlSRz1X5j+TYPFQpUVEmYxrMQHKUhfSrdGkqxEFL73syjE2AAOQ7fznjiLvN3j6YzFUbqxfxTtqiR65ZVv0KbnL3seZSxl2cS9j/TUi3aT/VsRWiULdyuRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFfICjz2; arc=pass smtp.client-ip=74.125.82.170
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30749947917so2882208eec.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781101951; cv=none;
        d=google.com; s=arc-20240605;
        b=hlUvblQ/AhmYKJHXvhLbpL1Ksp1tJLfBy1fs760Q7k9eGqpqIOwB02w7N944pozLR9
         dpH8T71lGKdUa8mvCFyinUxHUpZsBbowfhiiSLXFbei+HSAtN95SOK8TmSakV6H+Udcl
         pfu7UE4k6j8zSCkpfwV8H9WCO9tGCawkDp1+mVT8mUsljPcOk0fFXXTrrKk68mgaW+q3
         kATIs861sUS8DcmzHfAiBwOuO44GmYGZnKLbLrd4pWGg++Wjmd970TGu3a1BJR0lJUP2
         YZr8y+vygio0StIRA4VBxSCKZgXv0EP93USVNAGgcDabLIOAYPkJCYA1a5t3y6LNda/Z
         95BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        fh=r3t02SDJET+lGLnbs2OkD67wZ13j/XUV92K91PpjVwQ=;
        b=lKjqd8P6zxSQtAqbSebOCcny92k2fSV30YIblK5l4v/72MiCpPvpuPrbmjHmyw21dZ
         tkzTNYJOFD/7Td+YwUGuALZp2CmDBaWnpQ34ISZJJFaBN9JGsANf1NDDv60BXWt8/hDF
         /Pu/rh7nfZwaaT/tedq2AGXYxVJNN7HmITkRjf1Phomtqbov+p94dK6b3YDoyGmczkSW
         QgsOH6QEpXEW9uk7NVvHcCtQG9TOBsEQuIDSLxOLQE56Z9O9uT5Bows19f9tw0MCQCC/
         071BOazJLriB8to59fFvpKV5demQNaniDdicnEMXPyLDwt1gZVWogqBpiZTITuwDDKTi
         QskQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781101951; x=1781706751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        b=WFfICjz241T2kl0XBGu8welhc92Wlr0xtBHWITgpIxMHe5DxxLf3s5BWWcXF40Xct6
         DrvQRQNtctSuTLpSt0XKQtpeKOMV/lQcK/UvwFeXNjn58A0px0zqWy+yvwvzd5LMmEYX
         mgPRZFEgtH8pZsOaQdbUlGyeI/lmOxLN9cIAZLWnYPpLijeRi/9z+aVo5dChJ3yYHZWx
         TtiLfrcb3JcHBjf/RXCLb4KPIBxjVQ0LTSWoe9A9ENoedrCLZMrUGAR5UZPoW5xv1ta0
         LI5J7MH/UfQFJ2bFvddlrEMHUSicdIIpUCEsQ2tt4o2yFLWF7f3YdQP7G4W0Fa3Xbp2O
         V1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781101951; x=1781706751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYlaQ1NUVVCcD2TPrqOfDsKTXd5iB9hu+Glwj3KNaZ4=;
        b=nLAR7pmd+ru9mRY347eudg3LAX42j/zPcSmFGVhgPhHLOhBa4h1PlR+hrBJYqvLrNt
         Oq6SBYmES5mLr287Tvj1Efw9vOb4Dhdjy88UTtQJ5UqpWXSb38JQnF58ES/TXrTYjXXl
         FpzvCyoxAnap2Ba8yibohrCKFOkcFPDGWzTEXZEIgWRhJtqQwzNfFXPBSFmqdxP0Ulgw
         b0BEQI5UAs0pvRX55230oGbMVkvR9KF9oePgDi+rnZcChD41Y5nddwehpVH9SH7UjpE8
         SugrNAWQJmQAK5PLROEywM9lbGa93/Plip+dZUSreF3SuyzjP7OOU/6UuhuLAVomEGbZ
         c8Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/jyaiar2/AGRV/J35X+FtR16rVuFCLtc0BegpmuSawavZkdiAQA6zGJaLm+tKzd8MWUhgKBJIulFYE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xpdXDOaUiKEAvfZuwLau8hDV7ZUYzKyDitrqLMq/ln1pNUua
	7rIRN4SlJRIOakbF2RF+2PFzmK2YlKucYERv0B4s4fRzdkTKleK5wA96EdX+nCJnaPTZWGASVGK
	qNRb/Z5g/bsV5yy6+Xetz38lcpStdQl4=
X-Gm-Gg: Acq92OERLWLaHHS6FutUM/YlxsezyvHC3+sGg9Ele1UmFdfWe9Q9AzD0q1QaMtoB2Zf
	j11UiIEB3YdSeElFSbwY3eAeNA0KAb2EEzqbxzKOZIO1Lx2A8+eE11KUzFmyomvi5kjAXnhhi3V
	KXYuyEQBOOfh6KnEOhPW5BDeHhIJ1+Fqj0V32CHqJ/oh2n/f1dSA58KI5OiYMBAJ7LIAE7Kggpf
	C5kbYUa4i/W/f9NGGrui7/BaeCi1UvAf83fdGu1Q44ufkJJWanOaCyR9Cfj3zm4ISxh1ToZwHNR
	nv4DcDnKas7SW+5XhVQ=
X-Received: by 2002:a05:7300:7304:b0:2be:2cfe:68b7 with SMTP id
 5a478bee46e88-3077b3c7767mr18495535eec.11.1781101951047; Wed, 10 Jun 2026
 07:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-3-clamor95@gmail.com>
 <aiPDzdKuccdLIvlF@ashevche-desk.local> <CAPVz0n2rdgw8Xr3uxVdQGwrHTNFqK4SKQDFU2FEB8LzLwPhQ_A@mail.gmail.com>
 <aihjVZ9xvM2BRFu4@ashevche-desk.local>
In-Reply-To: <aihjVZ9xvM2BRFu4@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:32:19 +0300
X-Gm-Features: AVVi8CeI8hlh1GbQ3AYGIMwG28HB2xx8su6lqiYAmfvLYDOtgithK37JF5bkrak
Message-ID: <CAPVz0n1fHWCpHN93v-dKfzGYhvB-dC1E3JgQmXpvfr6bGNLqcA@mail.gmail.com>
Subject: Re: [PATCH v4 02/14] mfd: lm3533: Remove driver specific regmap wrappers
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8553-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE96266A547

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:02=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 10:22:43AM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 6 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 0=
9:53 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Sat, Jun 06, 2026 at 07:57:26AM +0300, Svyatoslav Ryhel wrote:
>
> ...
>
> > > > +     ret =3D regmap_assign_bits(als->lm3533->regmap, LM3533_REG_AL=
S_ZONE_INFO,
> > > > +                              LM3533_ALS_INT_ENABLE_MASK, enable);
> > >
> > > In cases like this perhaps leaving mask would be fine and together wi=
th
> >
> > I prefer to remove intermediate variables it the helper allows to
> > directly pass needed value.
> >
> > >         struct regmap *map =3D als->lm3533->regmap;
> >
> > next patch drops lm3533 so there will be als->regmap which IMHO is
> > more logical instead of passing entire lm3533 to child devices.
>
> Still it's longer than map. A local variable may help with making lines
> shorter.
>

Introducing and assigning a local variable for a single use regmap
operation seems excessive especially since next patch removes operator
chaining leaving only als->regmap.

> > > this be nice one-liner:
> > >
> > >         ret =3D regmap_assign_bits(map, LM3533_REG_ALS_ZONE_INFO, mas=
k, enable);
> > >
> > > >       if (ret) {
> > > >               dev_err(&indio_dev->dev, "failed to set int mode %d\n=
",
> > > >                                                               enabl=
e);
> > >
> > > In many cases it won't increase LoC count.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

