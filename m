Return-Path: <linux-leds+bounces-7803-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEQrFduD6GkNLQIAu9opvQ
	(envelope-from <linux-leds+bounces-7803-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 10:16:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B744353C
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 10:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02AEF3004C50
	for <lists+linux-leds@lfdr.de>; Wed, 22 Apr 2026 08:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A6F3988F1;
	Wed, 22 Apr 2026 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhdkYqdw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8F438D016
	for <linux-leds@vger.kernel.org>; Wed, 22 Apr 2026 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776845623; cv=pass; b=daNjKLbh0tgREsiFaXS+UzGBbDcghKxCMSQ8k/6TsYWUlQFJ9i88j3nnsZn3mqeEdYC8FFlHc9MGCUVWlrRjDIJNPvZxPyam5R7ghEbEL38E1nEZAFi6LadlimJa+GK+o7xiIIqUWqqcvJU76dX7h1q1bQ90ozq5aU0iwEtRwvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776845623; c=relaxed/simple;
	bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZkK7wxCRDSRZaKyUFsGOGRQQXzB7nfpX1QghzTaNCnjwJ0TfVOonL4h7fngKLkRZ9hRnqWG8q1CEFf/ia3iSqnsFmgvL0tltvbgicgwSZIYrKk7VeQeCDFDVLkjusNuEdQ6KwX1H5qUr3EErz2uwgR8VlkusBZfw9x9r48x4hI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhdkYqdw; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so41209065e9.0
        for <linux-leds@vger.kernel.org>; Wed, 22 Apr 2026 01:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776845617; cv=none;
        d=google.com; s=arc-20240605;
        b=eEgz5xhTeZwGB/Oh2h+H52rzF78uiTUna7JGj7+XqMnxJK+pgbTegyneE2dMjneYld
         s6QOuos+Ya1ZnOU8a1ljMpmIvZe850XT6J7Bu/ZW0Px3bbAtYf5UImPY4ezf/LO2S7Fn
         PaA8YvzIFQpoM1lcJsBIvuesY6pW8mE5hfSwCwU5BtWqB7keDwDmfE7AaNOG1T5qD9ia
         ZHAiwQ0haaGhwBs9nyXQaJEtYFalb32/L4TFGaXRCHZU3vLaL6Ij+2GJV8h1WM2DbTv0
         PQnTGhYgsCyLsAgwrbTpMvdjUqYy6Dmhe7WttbCO16sjQRBgR0W6BhfKYmeaWuTaP9PB
         beSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        fh=iXpqFR8xDL/u/s7hzFwVx0gyK+S0f+JoaEq6bkAgQ6M=;
        b=PxIPSD6Q1EDb7zYR3R5+JI2DB/XVWyGAAoby2uxs8v3GAXCDi0/Mm31scQz5jiBlc7
         4VbSdJN37mul1Q0Y7R5xDdVe11wqs9mdcFPz+xTEaa6LaZQDb3i6bcbnkMi8k9VBCMRr
         j9LMQb/n1I0mIx2ToqlcmTbrXmJ5Sd9sdgvEt41PZ2sVaA0WmRRm0JRdfeu8sN+vi9Vf
         YBwJvlXFW/h7+GHISiug5IljlaJDrgRLrQ3JCiKJsFHg4mC7AwGXOpZA4g6leyC9RwWJ
         /q9B/Q7+MlUlmeHCbrPe4NNKnH0Bt+hkgxY8DA1BDbmxM+ZOcDV+3Vlhim4h0DuXuaaZ
         t/1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776845617; x=1777450417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=IhdkYqdwbGvyeUKZWE3AJJxXWaQIWiZtNGRyLt5NlcBIloJdXxD8kYLA7GZdIoH9up
         C0oQQDq/9kox5oSTmte5rc4G4dagdgNTOkDgt5e3vWCAjyqpKvyRrffd8OJvWL8EQeGi
         ul0MPHIM1OkA0TeBIVThsN5iudqfNW4UwhfwI8sqdWdUmGIHIwgK+OCu6LQVIFExTquO
         QbfQCshAAzgAzP8nhhIGFX3nOeUgtGOjrAidowi5ZrlgGxBBrPpQzuoD0vKW0egw4UO3
         mOfiYOMXoG28pf4oYR8jHDBpyGgaJiLJtNPo8kxj37A17RhsU4mnvA8oqmhC+jGDFces
         bDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845617; x=1777450417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIgsPc4+kmuoMSdWhQjkUm5DAqyTydWXud0EIQp+wts=;
        b=bGo4G2OiOoNnBxhqHI6melpKGGbAygeGvBBoVKicCNvnVeer4Kad7ZfN0Je1nurThw
         DMzS5byHXCSyN7SEaZW2eEPxKrNIKxGDcvOgO9w6s9cekYoI/9qF/m5SKsAjpByuJ3c/
         RoSpHt0yuVDVFTLGk6V3W/tNSX2MNgUFOhzdwZFd9Uti3z4uVWAuUBc5/RcQlZMX4lln
         RV6a+i8ll0WmDBJq0Qn/piY+ychQEyJQ+RDLaPzmC1G3HQ+StFlWtmcLssXZDkMVncPA
         h1ke9JUkapPOcDCBu0GCpHNWCn643s+TgWhn0tehEd6pmvMRggzYgqp05ha6VvD1EPgg
         TO3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wckmC33OQk37QQEJLjsLrGJIEFTzxDs0msrleeoPuWqyc+GTXKEs8esdBN0Zf4ESCGXOKW14IS88m@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmgFwNkFObcxM15oPhK/Z9LhvuLCDZ/d4GIETM1IR1UiLNs03
	F/Kh72xZbyfBn0tvmtWHn/pf7G9T+TwUYCy1tyYbeuyW3a3F4/8+V+SKFH/cN0NAMTE/n6S+8OM
	+V+xeEGeNmKKfFvOFqJwsmcWYCpwCb6k=
X-Gm-Gg: AeBDietnkR+0AUNi9shqfiW873xeAM2RVp5FSki2Ngt/M13XknK3YL5YALNAUYLl2pA
	+CHLP5zTrlvMSJ+ctMhN+GcY0L5HKZxR/WY8YUwSg4VIHzaCFXegXXM4nrb5trXzc8rLMLcDRFy
	zLO5cAsCZPsY0i3yTJ/iY9msqYpiiamIEMTg7BTyR3T6B8vqQx3eydxiYvGElKeZL/jts718+Mw
	u747WT3+IEvBhs1IvOCJa4yf56a6loIYYjBVd8mTjhf/cDumBK0u9ppE6J1eUwkK17/q9QvIVcX
	Bj2OqCskhuMOVH9mZNM=
X-Received: by 2002:a05:600c:c0cf:b0:489:1f3e:5f6f with SMTP id
 5b1f17b1804b1-4891f3e62a7mr115275205e9.12.1776845617219; Wed, 22 Apr 2026
 01:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-6-clamor95@gmail.com>
 <aeepbB72uWDxvnE_@kekkonen.localdomain> <CAPVz0n1sNoJv=JcAZdv3srRY0vecrRO0spnqg58-VLnYdkfPSw@mail.gmail.com>
 <aefXJebe2F4Z193F@kekkonen.localdomain> <CAPVz0n111oHa2UdJ9LO8PTYcRuAmUem6tQdPKABRq1YHH8ZDgw@mail.gmail.com>
 <aeiAq_eep_fqwewN@kekkonen.localdomain>
In-Reply-To: <aeiAq_eep_fqwewN@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 22 Apr 2026 11:13:25 +0300
X-Gm-Features: AQROBzBoeRBOPowp3OnCxGEpCKHgoXA68JG6VLytQ68roGoPnIj5MHCz_olxf0M
Message-ID: <CAPVz0n13wS1TnF_z-muwtnP0BK6FKiu4-6h5k6s6hm3p4i=0_w@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-7803-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F04B744353C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D1=81=D1=80, 22 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:0=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Wed, Apr 22, 2026 at 09:29:51AM +0300, Svyatoslav Ryhel wrote:
> > Noted. Any changes required into the other patches of the patchset?
>
> Please see my reply to the bindings.
>

I am closely monitoring all your replies, and I will apply everything
we have agreed on. I assume other patches from this patchset which you
did not leave comments need no adjustments?

> --
> Regards,
>
> Sakari Ailus

