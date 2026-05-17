Return-Path: <linux-leds+bounces-8175-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAqXED6cCWpHhQQAu9opvQ
	(envelope-from <linux-leds+bounces-8175-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:45:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A159E560943
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C8263009530
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067B735E1AF;
	Sun, 17 May 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDWJ91Bb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB035BDB2
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014695; cv=pass; b=sZYPbV3IIldjTez6/Mr79YQRHKH7rblNACEPChv27b43+SLMxIrhRpVdQddeo4Q/xBwyOevqbWg/uZbNSzh8FjP2lOXqwAFLvfCV0/BYAgNljz20XdWxmcXwFbg5rtMDgPVtNYc1V2W1xkrI7g5b3pPeqK1C79V/71rDSoXe8Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014695; c=relaxed/simple;
	bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfAr+JuRrqDNHfX9n8h4WC5lq/Fzf0aJRVuNijKBoeqZzEvwbsRUCw7VXFkB8Rv4kKNccKmVciRzcSCxeYpQHO6c+ANe2jN0BDyykPdigpDgTLBiOBTvqmjUGlkynuvSwWAG7t1s9NyCFmYBtbw/sSr2KXnT6aI1vVUlA8Ay0uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDWJ91Bb; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-303dbfbec77so21230eec.0
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 03:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779014694; cv=none;
        d=google.com; s=arc-20240605;
        b=dlsw31D0d+WxBcxhHNSA4Z9cszJmPkVXafVA7/px+ffZ4uciF5WBz8SFugv16rJS7i
         ngguIxZOraNZ5Yt+VtU1uIzvO9efXMdARjwC4VxCIWVZjzXhyNJ/9XzW/5sXvosSoXjZ
         BTTKbzub1pPLxkPzr5AzuPHW6uEPIgAA0Ypp+69J9/cYSTBfVOn7F7LyYV7nqvEhSxNk
         dF1Oa+kMI2naSulXej5NjzsW/u/QyHr7tueejflNZF4y7jPpBXyoLuzepWzBARSo/UE2
         l6Uq/YS0kkRZU/ue3wDiRsL7X0g/KXFXBa8Zv7KB1msJ3Jc7eaIs2RRQKJaRBaGWp6Go
         bQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        fh=Z/DfBeHaoqPJlx1R0oR5gLqqGh1h20BpCX14TTlYaL8=;
        b=ZEsmKBM84IqqK0bCADznFFvHHSl5IH2lgT+FlGulfG5R5D+skcW+89QR04xG/gk1G1
         rwyxDvsD1f8CzPsNx7IAe52GxXriI1HTcImva2CNEAOuPVm36/J4GHdWE0lSXKapCYWG
         ougkyXCe1wggGcPz7VGcWmzK0h5Ru6FzB4yoIteI53Z0SrVi5xg68nbpCyYztojybgBh
         AN6Uj/scqIDDMyEXaiVV5fzANabMEkl++dEnZ0Rff9RY8RZGjXOCQBMkNZ6qeGz5cOe5
         GoGtvsRpt2XRL+puqdvoDZuBAvQpaJLc+/fh6xMvUa51H+fo2YEBEbqtmejWXp00RqeR
         OBSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014694; x=1779619494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        b=oDWJ91BbKlEmtbnEIPmaQuFMaf28jEa+z48mE6988VcnS+WHxZRsv35sS5Vb2HwRGX
         oP1mRwHV0q+aR8MRE83r111QZ5rsPh9b8RBpjZ6/hpq3mm8299Zym7OU0DuNsxOTuGvY
         gQWywgDBj0pCyv7ahPlQlQXMPMFnZP8MrngRDyw2jeg53erPwhSXBZF5RzMgg3SGtTCR
         hwRgEFuyZ8CcZ03Ycq1W6KSUhb78InX8gZSXIPl1JUNCQL5J64RR7gbTqpFrCXM3H2eC
         63LRFEj0uiTbpnipujDJBo250uVVpKXg3+vbFoSvroO48s/kak1BtTKrL2hiXLc4ZFeB
         DDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014694; x=1779619494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hM1fGuSM6Fo3EiKs9ZLHcJmX57N7AvndiFQcnsXzrXE=;
        b=CeI/OJz4wrCZOj3RqQQfA2ubrQOt9bTsUxihKc7DzKEU/JGqzmKeB+r3ejgos9NxQC
         O/jRIcAZQrCa3DFnLgsvPf4wdpYZ6nyAI8pcwzsDuXoNT6pqDs6vZr8mUjJ/uhfJEkzt
         M4IXEdXPPetGlP6+qiIAnNDrUIk2R0F5Q9uxOVZ60vXrVXog1vFxqRRYjGEYSI46vZ5z
         65eOyUsW891mLFwEw6el3G0nha9a5V8w6kTxKaz1XKa40cYZgHsT/NHTAhJ3Ol9dWUvI
         qT9FJ96HFHi2nBrY17ZaQOarALxLS3aBIoIjT0j0ZcdQRFItDF4BTzuzTOadKIbAswHk
         o3GA==
X-Forwarded-Encrypted: i=1; AFNElJ8H/5XDrSguQiuoaAcAUF9Wwsd7qcYBIENp2Pctc4YrD6p8O6cRu4FwgOQQisp6JeWzNtsf46pqa39Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzLlLwcKEITZ4w3Ar3EiAD1bO30//UdWQ3XG0brJhUIBgsqmAo/
	xMwW/6Nd5w+YwJNX0Z+O3McXkQz43H6UWnnsZAanGmMlFNpFXjv5oU4tLNMRqiNKluL9GPXxqTw
	+i+0YMbqFCWKGMwNNKobDe5q75idLOnQSyDWv
X-Gm-Gg: Acq92OGB3eqpBZkV++wiQ/nnaifyIm86aIMWASZADp2EZr/GcMsJGGzVFi+p9J1/vzC
	YoOp/nPEbybk7Ux89M6lBOc9znKJGoQNLvjjU4grW3IuGNzOFDexEPy9TIet7RYyPrdKA7sr/mV
	yqjM3qdG1OMBfG/mcUSDGKKi7S5WEHUQb5fOyJYz6eFGoaVDjf9JyYZPRWpOswsf1X7Rf5AoQIm
	xBB2PRebJK1pPzb/k8OjSwO04NaNEJOu2AbF/iL3iutyJArvFzYlOR0OvcYwhfIew2tKm+w7Fn/
	SVdT+quDYfYC8Ahcl3g=
X-Received: by 2002:a05:7300:641b:b0:2ef:83d4:647f with SMTP id
 5a478bee46e88-3039865213amr4762888eec.25.1779014693685; Sun, 17 May 2026
 03:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com>
 <agmWVdi3TkBb2cxV@ashevche-desk.local> <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
 <agmbFQHezUl5Nydn@ashevche-desk.local>
In-Reply-To: <agmbFQHezUl5Nydn@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:44:42 +0300
X-Gm-Features: AVHnY4JnKOSw1H09HcRgWGFJYaj6RZPBdJ63zUWme_H-q0TpGJTcjfCXnVmnBUA
Message-ID: <CAPVz0n2VAUBNJOLXiGEaRn-x1esd6qeheXa=Br69cZnqmZ1QGg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] mfd: lm3533: convert to OF bindings, improve support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A159E560943
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8175-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
0 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 01:34:32PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
13:20 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> > > > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 10:59 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > > > > Convert LM3533 to OF bindings, add missing VIN supply, add supp=
ort for
> > > > > > setting mapping mode and LED sources based on device tree.
> > > > >
> > > > > How is this being different to
> > > > > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gma=
il.com/
> > > > > ?
> > > >
> > > > I have decided to have a fresh look, this is continuation.
> > >
> > > Then it should be something like v4?
> >
> > That was more than a year ago, lets start fresh. Those patches are
> > gone, though I did add many of suggestions from there.
> >
> > > > > What about this comment
> > > > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.co=
m/
> > > > > ? Have you talked to Bjorn A and Johan?
> > > >
> > > > No, but since grep -r "lm3533_platform_data" * gives 0 results ther=
e
> > > > are no platform_data users of lm3533.
> > >
> > > Johan was against driver removal (while it sounds logical due to abov=
e) and
> > > referred to some other patches from somebody else. I think you need t=
o
> > > synchronise with the people to have a clear roadmap that all stakehol=
ders
> > > are agree with. With that, the split and other technical issues can b=
e solved
> > > during the normal process.
> >
> > And this discussion was 2 years ago, and
> >
> > "This device is used in a bunch of Sony phones and Bjorn A posted a
> > series adding devicetree bindings a few years ago"
> >
> > They have had more than enough time, don't you think? You would
> > definitely know if there were any activity since you are IIO reviewer
> > and would be included, were there any activity?
>
> At least it's polite to Cc them your version.
>

I assume yes, I have added Johan but there is no email for Bjorn A.

> --
> With Best Regards,
> Andy Shevchenko
>
>

