Return-Path: <linux-leds+bounces-9085-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dlpQJaBBVmot2QAAu9opvQ
	(envelope-from <linux-leds+bounces-9085-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 16:03:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B59755752
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 16:03:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ibm/XjI/";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9085-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-9085-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6867030644DD
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 14:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C816736D4F1;
	Tue, 14 Jul 2026 14:00:28 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6EC370D54
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 14:00:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037628; cv=pass; b=TXIc4krB4vrhITwpNrNaMQB4vk+PeZX2R2p+yFWrtoIssL53p0aEW+x1LaTGIbB93XCXlRFigyqp/i1/4WCWYk5gwf511God97f01v8kyIIigMY+7GmANS9ZKPppYD/g42nDuRLVtI4As188vf7LbscKfrC89Qf/5gIiOlb7tgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037628; c=relaxed/simple;
	bh=T9DIDFm3lzuegkQEDN325v2/6T2Fm7otzgZ6GevR3nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtRn7vadtjs9ql4oG5c8VbsL6uM4nlzyaJhnm4x3pcfMeIBoGX1MsfJLjUHmSt/xuGrE8JdYv33PiPvV8e1Oiiuj/RYI5BG90ew92JyXAylhPDGTjc/b56btkvpZvP0kNPPkgH2m25QVsKW6kV9ocqzGacS7rq/yNGurwXY3QYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibm/XjI/; arc=pass smtp.client-ip=209.85.215.181
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso2547100a12.0
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 07:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037627; cv=none;
        d=google.com; s=arc-20260327;
        b=CcGPL75CccUXVkNy5ioEKf7JH5p4E5+lqjALAIeVNMNl7gCfD8algCl0ZTGwwMPuhd
         N7h011B/uQWspjIdAUVCEb2FzCl069WWk1jU2Ggx/XkpK2g5xVowl5m5cqvoCmIVmMfF
         f/veYntKQSA83sDqTCbME7QIAzrG33XjeZNacvnHtT6OQe+sF95eeZLUHNfmiIrf9S1H
         n3Yeo3V+NhjyiZNw22TMUaeEQ+2kL/L8CqihkzGWSCxFaY9aFOfPn0y1Oxudw3RmTNFK
         pOhWbxqBfV2oqFDXrIcQVmF4gNDryyGUq5cFdML0lBf60WIX3eCiNchshKA+gITWecfs
         yIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        fh=3LNADc7sGynilpRFpdi9yoh1ISzNbgvdaeKUfNm0Ga8=;
        b=nEGeodkEZQYA9+JxlKZvSNUETQSfnq9kStCxyoku71uAFjzhqzK4O221pXpqoR7GsW
         0TNhRVqZki26jkFZh51ok332rdjdi70c+AuhNiwNt+JEqUVxeXbj1sabIZbp7svhFpZ/
         SqEK3Y3ryr8Ue5fVuEKSJUUQRcArrClaR6Sv34PGxSSw1V7PxMCQOgpyUnjefBwb7QA1
         u4CE9Sf0dYGHtj5FSqF+/+Tjylib1Tb93kBta9/4Gbx33PV3SkmHkmq0n1MKDdT7sC9m
         c7iF7V7bJODTojuPQbekmER7aXLhClZuJ6xy3zrBH87FzfZWnuI2fwirmU7gKaBOTdC7
         0xXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037627; x=1784642427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=Ibm/XjI/UF9zGxfKyTvCLeNx0Z8KAuQRc5hxmnVoiqbgj12rW/N74Zc8//Z70MGCYc
         s32dsQpdaYE6UgSdO1VLG4Ly05kYJPcrDNYGj7H0P6SXqbUkg6sasau7TJeuMu0CYJA/
         4GWc8UxZ+z5hm4E2ur0j7iJJvdxU+jbFXCsSVWOZViELOWaKQJE4JNeBKY8+nsEZjy2N
         oodjSRD4rTxP73j2T3GmMEkb/VBD3+N2SS/28TfjxTnXDXjnskUXTiuYm6T0bw0Hk8Uv
         J0S1TuF/6wjGTXuN7UNconlyJMW6bodw0ltWL5uo8UmTxedVStJ5ErsdcCcRO21KOsY4
         klEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037627; x=1784642427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=Fk0kHcAstp3ZCjd7OvO9kzNf5X2RvwV1taeiwevxHSrzkbnV0aQ2Ad41GpnN3yUVHt
         CZ+8WoR4hPiDWeSs4yqAeyUSoUt7h5yNiXqTT7uvBRiMwG7R+vyTPizU0TTEeggQKtLj
         Q7LcLVzYlICe2VSwto/ybYjkq4X4AsPypXGbs1FlDcl0yM5M5svd7dChOjQX9Ggwul80
         nqTHaylez0MlqVNJ1kHC6W+6I1aTVyMVUMfGSmM7mYLpgix+IGutSLCsz85PHWAZYyFv
         8/yUEHvTdEklBJqYg5QEn8/zpcQhiqickKG/ggviTJcv+6JPnTURWr4FaZPF1Sp62w0Z
         Rqjw==
X-Forwarded-Encrypted: i=1; AHgh+RqbuiFxBLhPdC06wskqAcUde1RZ3cAgrhlmTvVz5K8wklXu3KH6blZ0rCRucM91C6lVfp1gZx+mxXGm@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfMJSj8nXxdcu2eO9zWiwMUAgCgYrzyJ6nPT+NLpxmINp9Izd
	gqBJ3bPc0POqmQATEWDuPJO0mdxy+RF9nZ39O2M4qWAvLbxMtKpHiRvsEEnCpFWvpha86pbBIjr
	vQEFc4kRxbOPC3AA6OSCxKcBWOopsgmE=
X-Gm-Gg: AfdE7cleKCVKnOGgnrD7gyp3Y3pK2TtrhZhFl50o964cbqfCEV8twG+wnOwz/gtXrII
	e99AZGkAII8MMwvM4eKxORVx9CBzkHw89aO64XFAQ3ibP5xyZvpldrASgEZGIrUPuiO9u/lxlRj
	oZjj87KomRYoA1vGJCnyc2NpuwLJxmT14MKrj/VMOoZLsF39D9fiPLam5Y7uoFrOzdByz58wwOV
	0qr6QaWatNXzWLhSciqu4GnsB9t1DZQYEMhY+X4l3Cd1H3UZen9OXE/fiMMfE2789a8Toyza79C
	5XTPjwNYy9hNL7g8mH6WQ/2Yn8bv0yLUTiPqRJH/
X-Received: by 2002:a05:6a20:72a8:b0:3c0:9c18:d5ad with SMTP id
 adf61e73a8af0-3c3572b5794mr2798444637.74.1784037626720; Tue, 14 Jul 2026
 07:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-10-clamor95@gmail.com>
 <akeYWRF-wIlrHTF5@hovoldconsulting.com>
In-Reply-To: <akeYWRF-wIlrHTF5@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 17:00:15 +0300
X-Gm-Features: AUfX_mwnssZkuxVf2843X6HTYGv-SRm_VXHXZEuLPu7vTjXTmj8SvtNozHDr9W4
Message-ID: <CAPVz0n2EGy3uWwUfumvRxr2M_Z9ZMZ5f9=RO=S5vUsGk=ejcJQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] mfd: lm3533: Add support for VIN power supply
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9085-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0B59755752

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:09 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:26AM +0300, Svyatoslav Ryhel wrote:
> > Add support for 2.7V-5.5V VIN power supply.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > -static void lm3533_enable(struct lm3533 *lm3533)
> > +static int lm3533_enable(struct lm3533 *lm3533)
> >  {
> > +     int ret;
> > +
> > +     ret =3D regulator_enable(lm3533->vin_supply);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to enable vin power supply\n=
");
> > +             return ret;
> > +     }
> > +
>
> No delay needed?
>

I have not found any in the datasheet, if you are aware of the delay
duration needed please elaborate.

> >       gpiod_set_value(lm3533->hwen, 1);
> > +
> > +     return 0;
> >  }
>
> Johan

