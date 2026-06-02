Return-Path: <linux-leds+bounces-8430-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PgivA53FHmrJUwAAu9opvQ
	(envelope-from <linux-leds+bounces-8430-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:59:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9B62DC6E
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:59:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D+i0zebN;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8430-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8430-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 204FA3006208
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 11:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04703BB668;
	Tue,  2 Jun 2026 11:59:19 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191323D7DF
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 11:59:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401559; cv=pass; b=F6bMFSLTiMaV1o98xyk3SF3uleY2tEEUuUcURms1sLBUEQLCi3lW+IxML7d9gGk0StaFKi4CY3YrDR0Tb97i67RqluqiYwO6T/PuXNm4WdYXgGzRNGbyazqWd40oJg6DRQTR5+tLFZ31KOO0vweT5s657uFNUkK9LNet5Nf9LMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401559; c=relaxed/simple;
	bh=Ylt5hXVNR3LTkhF9xMnTUwL+GT8ti/XzIGNIjpX5U+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHLUby19gr3WfHyl9kuGZRyW8SM9LiTTULR6VxFdoUq+A4q72h9C8lzjnvdxw53tQabKSo3ZA7p/Vtp87MQ1WHuzO3ZS7AjzX4v+zq6bhMZyYQ5tJLNBuv8lFc1ddIx99yr52IXwwL5f+GBNfsNa+Reba2GfhPkjfu0wBesJSjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+i0zebN; arc=pass smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304fb780deaso3574088eec.1
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 04:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780401558; cv=none;
        d=google.com; s=arc-20240605;
        b=Uzt9BJJ7AEXNNHXqGT+hezjA7gf9ZclzHciu5ENN6pL42vkWTY1OsgyEgoglgwnenI
         MgR8QVzz++zTPe2bTa5hpqMSiFTLo26EI7ENe4Qbfwhb9uIVx9Aw/yxBx2ETJ2Vbv5jZ
         XWKMDQClsMc4JQRJZoU7abkAWKzhcOqYoN8jnv9XE0exxeKY/jGI+zZY8G2xcQ4Bgugd
         ocXcSPL0JSutvqc6QDgkXnLmjyXLTRmupdOcs10aW5W7L8r9cSGV7x3HzVH1uy81eZ0+
         dPKqEH9EN/xZ0+FbPf4U9K6IvHdzKsqZna5PPQ7367YEd21f1AxGIgD10PNz016u1gnd
         bUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        fh=OHRQg2sgYyOtCCR4T4o/56nb756Uz+iV7IbWJD+LTM8=;
        b=M4fS5IlWmHeqxHlcJrxYVOkN0Fqhldh2kMOknLRoDgX4wrePuJHsNpMJZ4j2yurz6Z
         ND2WMswBHJPM6krOzPZslJWkaarQvcejpnZJxZvlIcIFxFzL/DpGdKp8BiHKjj7nMIZJ
         ea/KPb52Io6Sq2ta1nMYy5Pg+Uy9IWUL2/fjv4Ba4lRAMUplYbC/s2gLX5T1v3HPY64q
         USv/TX0u6VhMM77FwSWO9u3KV0sn5PoQd3N/VazZXpFx/PeQjeKYAyFe26PZEMvQZeRy
         NxW4eQNT/XozH6clKrobMtjn6azRRstqzlYWW01gdVibxC/hcrhKbAcfEu01h/QnXvKN
         PFxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401558; x=1781006358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=D+i0zebNudh0YjRVZbcwm2tiAX6+eLuVdjhng/hb2GBzm1G7Ny7UVck00J6L5iEqJF
         sRh26UJBKc2ea5QyZbGvw95QLpRT/yxnGqh0Cu0tSZxDcSpj/zTfI6KYRPMt8weZNIWz
         nJEYhhKbokyH5ooAzPhIaTqCRIVi4gqM7l4CFeA4jXoC7kUiasZ5guEpLD5+dbnL8LbS
         bzhuhyLkHAWsDruWQSg4K8D4OQ2gWhOr0MRgl5dtZdjQUcPImVPJd6WuWzRJHtSqyxF5
         YBygyqeZU99cYMYWm+9lwA9BrUe6kgYpQ3IR2McwgllSud3fyVl4b5cCVJv55MqLeNb2
         QOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401558; x=1781006358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=eniGZGJHU8RFBmg30CS5AH+3RS+75dSyjQbM6vPfHcxGuNdrE411qXcPRaLE3IFqL2
         iNxlXdLc72q+hsVK2GGH2P8bas80+Q1ZKqJPf9qPvg7HKYd4331Dhom6/aga+EhhvOwC
         rOJvPSSg7hrDl0KIV1slxDXqs138384Cd3Au5wkTMjlHZoWVhgFD2oAJeXs4gSzvM+I9
         cBGWCHtCnN8EneMU1sopt78WzY3ZxSF3oNIeB3T6dVM7MakR9qrstGKr3+N3RCkkZ0ri
         Wb5PbrL1E3QA9ZbbooLwKDiRnspbgB/wXpPCPXWVeMjwwGfwqUw6+0sly1nH07fpS4E6
         k0Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/YOjVtdDA0ntIgySyKd+FoTfgv1I6Mk3spGOBab5fx9yiJXL5SvHJBnaJnbhM03BEvUz7O18yxhN4Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6GVomKeSLVJfRg0xVmy0ox/F+8i6U2UGHJPZ0pyadr8y3xnMC
	h24MVPH2SkP88OP4+dF1jwso+4/NV8XmeoAgZA2uU7Y0GOU+UGDAfwvs2SOfBsonQ7BHi3YHPTy
	z7W6/NH675F77dUaZc6Be4YNYv6/IPiQ=
X-Gm-Gg: Acq92OH0k3PBLxyFa+7XZ8jjm5bFt8TxVN1KbNIKk494GrgVbs04dYhcZ1hZ3bEU682
	mnVuVQQSfPAkwIYubinOy9HNnmr7ROnwZDoyvp0br9kkxoXOPEiags8xKnsr2sMEOVMlC5ZEbJw
	7WLql54acUeCyMMZbkbYhOfwxUIBpaW3fI3k0GS5v6C4pByOFv6YrLTZUp/2HhBoFYqe4C/wvaG
	WgJcYtpb7To4vwqF1QdkAuE9+ienjjs6MVrqiHz5D28rwbBkf/9SNBuGQ/PlpgGyuafFeZixQ8E
	Mq1j/Z2+wUt+PpAM0jI=
X-Received: by 2002:a05:7300:e58b:b0:2ea:edc0:4fbe with SMTP id
 5a478bee46e88-304fa5230d9mr7590808eec.14.1780401557759; Tue, 02 Jun 2026
 04:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local> <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
 <ah65hfgoM67V6-iR@ashevche-desk.local>
In-Reply-To: <ah65hfgoM67V6-iR@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 14:59:06 +0300
X-Gm-Features: AVHnY4K2SWFA6Gct86VkeqymRy-YvpCnhDFWoUYjixtaQro8Ol55fBi-H9259ik
Message-ID: <CAPVz0n2V_a8Qf-yzsOipDRDtpH6h3ECJAXTYuavvMdj5-Fk=aw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8430-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06C9B62DC6E

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:07=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 02, 2026 at 01:19:00PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
1:09 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
>
> ...
>
> > > >       if (kstrtoul(buf, 0, &linear))
> > > >               return -EINVAL;
> > >
> > > Besides _assign_bits() in the below, side note here to unshadow error=
 codes:
> > >
> > >         ret =3D kstrtoul(buf, 0, &linear);
> > >         if (ret)
> > >                 return ret;
> > >
> > > (obviously in a separate change).
> >
> > Won't happen in this patches.
>
> You mean both suggestions or you are talking about kstrotoul() only? If i=
t's
> only about the latter, it's fine with me, but _assign_bits() makes sense =
to do
> in this patch as you already change the parameters enough to make it bett=
er.
>

only kstrotoul()

> ...
>
> > > >       ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTR=
LBANK_AB_BCONF,
> > > > -                              mask, val);
> > > > +                              CTRLBANK_AB_BCONF_MODE(id),
> > > > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) =
: 0);
> > > >       if (ret)
> > > >               return ret;
>
> ^^^ left for the context.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

