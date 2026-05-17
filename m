Return-Path: <linux-leds+bounces-8173-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d/SeLcyZCWpPhQQAu9opvQ
	(envelope-from <linux-leds+bounces-8173-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:34:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719D5607EC
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 12:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7008A3009F3B
	for <lists+linux-leds@lfdr.de>; Sun, 17 May 2026 10:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE23353EE0;
	Sun, 17 May 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcJJW2TY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338091F3B85
	for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014085; cv=pass; b=PXtcd9iwdQ9Wqmjio/BDiHfUFE/Gzip80JThJaIsbe65Wrv0QVdo5pyCzq4xek81+tWulIu37JPBYfbQgV9OXk+FcOiYuqLkxS3RCnIs6+ndpwiVxgcvrxPo2+xGya/9D7trBtYl8vHySb57R1rkc3JmEn0O7E6iWl0mC4FiAy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014085; c=relaxed/simple;
	bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPgiYhxCtdWg9AkUeU6Ctf2rs2umALFYdNVZBcbcNT012QvndE8TohDdv65qzk7EfuhOMc6UwbTlm/xMRWPsjsetkgwkeu0IBGssC4LN8pv+m/CQdsPdIto1empODSxHVL2hyy9Cq7P+rXVMz8F6yHZ68ydUsgX647sGS25R9SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcJJW2TY; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f7020a928eso1707096eec.1
        for <linux-leds@vger.kernel.org>; Sun, 17 May 2026 03:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779014083; cv=none;
        d=google.com; s=arc-20240605;
        b=jX1evQ4HYtRcFtsWO7ezmDEn4slAoCdCWp+800C92a6kF3r3LCODxsDRTJ/rV4hifa
         KeZUfg+wAvaQzWvCCghIsWnQv/tQDrSIH9GNZQ4TJBSxhIKyYQiyimg8xuuSYLsO/Wzq
         qx1IAaeR9JztzTJx60CPm2N5DR7W0fbji5CYJi9J8WwXVUhQi4XUQd24r0Lr0ex70bOn
         MhEpYBxC8TAwLKbVD1kHpZJqWcT9f+4Otb0qeCuxMl02hIupCCZOjHLz4+IsnkcDXWMs
         iuOrVYFWiNtqgj/JE9gM2NYy/VAzDo9WpRleWcIpz2h0K6sOmub6ed9wbvTWawoDe58j
         L26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        fh=IBlH4pdbmrM4dr2MMyJSZ6QPL/Ay9DqWrgyS27IW9xE=;
        b=V/R3yZiQEHeN+Ga09jYE8+CZpWOslvoYJ9vRiWDmeCgwhHzAFqbf6jjlEzDI6oSeSD
         8/XaxeXTgHzw9KVD3HAOVUoY1zexFOs/CX53ruyjZYH4hGrIO2hpmnF4PdBmup7jM0f2
         qNwkOoVkSSsPfDDaBH5BjiSeWtxy1ck4DW9QhNxjKamv8G0qwjIrH/iC+Vbe9BLjDT8G
         qQkl0IKgHcgemM+jXM/hdSaBaOHsT2vbyzOiOZhsaT5xPeNW3BmZ2w/YUdllKioJQt+Z
         Ei1pvTs6K2tvDGbYj8o9DKlV8aK7Yt0pWKDeK+KezV0szwgS30I/hmWqoVjTN8QEOQ3T
         pc+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014083; x=1779618883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        b=NcJJW2TYmk9QsK4GzkxjqOBIQ7SsvqUYeBfbkpTrUHcbjLIxIUNtdkTIECFVixcjAr
         RsbRx2qlJRCuvt6/lnOjF1W1e9Kh36ZvRDOZcID+7XF469K6XV97DVe2yCqfNGAS9Bnp
         x09bP5L7iMYHWb2JYhoRRxVCkkWME1Y6WQR4hGOB8gnaexhCLJKz3F7/YFH2iuRX3XkO
         aT9gPuCbMiHGojqQJA03TQoLw2KuM+FUHy+2nTMp5L/opA44BDn4IYWOMciGESFemCuI
         6lT2S4qw4bSj+BnhUI1Z4U8qQXj0NH1ygxxi6PnE1Kb29SxliQNyxvytn5escOHKtHjj
         4j8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014083; x=1779618883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTJbFc77QasgjHvHoJgTMqvmWisdPMyl0OLuKjBSzuM=;
        b=T43tvGHWv8g5Clm/N46PoFYEEHYXl7C4Sgxg91jo7ecvXKAlzVG3Jq8RNepe8QrSJy
         zsV1XQEslE2Uy7bezeZmQR5IPHb3W/G2kAr4FKGccDbJovOCu7ecqvR0xRmFti45rwoZ
         fr70vJIxl0lN4splgHZzlwqGeZ71Zmu17AwqzTAfI0GAghi/U+TSgYyQN+6pX6TphS6K
         9JjdiBIP6SNIODxHwRC64o5gCvCVU0Dj8DwZmeXHbRWIZw8s3x0VmvssT6uycJiO6MWj
         LBA80zzYJ+++PCyaLIbntFzByVy+QqHiegn9bxg82IeTajT/Cv4EWjiLYsrHlJVlrVpf
         Ftaw==
X-Forwarded-Encrypted: i=1; AFNElJ8j1j1uyWAvH7upq4AKxhpdMYV4q2BzGJKf2OC62RwxMi+HA80IlrCA72DzywTFm3NDBKgON36vOZb0@vger.kernel.org
X-Gm-Message-State: AOJu0Yywc6UA2kHy6D8+/LNVK4L+dgn+SU6i6Q2D6A5EfAG6T9pRRd+q
	Pp4uM3FPF0C+gk8VDrpCxuU8ahbb5EGJfy58hAcFJtQyfk/OkEZ6hfwIduWh3LjH2GwkVjXrKCp
	Q2mX/j0t3F2sjrkCTLq5zIHhpsu3zz1o=
X-Gm-Gg: Acq92OEzk03sN/NDiaGY+e+bwWgNU/YJZcXoOq9sEHZssu5XtS/QNKafvYCEdbYDKsk
	GIUeilQ8qMc7QmW9hJD19MOA2tcgWaDdc9TUHYvv/DD3MelEVlT/QCO9qclQ80jsjM3eGqBQpzg
	jua/SmeLi4e1kbkHXM0mFkfHWs6+8hTuQZHhbyD9xrCyzZ2WjHSQyhSmSrk8lsUqzCYn7dhQsKP
	XIZf6lQZQ0mr7MWiuf1r/RSgHS5IpIrRgkCWcc/bKIzwYiuZ/iivuoq2h/x+xai8CHWO2d967eN
	UfFlUIGUVUCjb5f+43M=
X-Received: by 2002:a05:7300:b586:b0:2e1:e5c0:7992 with SMTP id
 5a478bee46e88-303982ac675mr4634265eec.8.1779014083372; Sun, 17 May 2026
 03:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <agl1T8O6kwP7SFZ1@ashevche-desk.local>
 <CAPVz0n0tfbwa1AbgO4eKrmNunHvmTFLDqXDFd1=VfLayuafH8w@mail.gmail.com> <agmWVdi3TkBb2cxV@ashevche-desk.local>
In-Reply-To: <agmWVdi3TkBb2cxV@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:34:32 +0300
X-Gm-Features: AVHnY4L5_rkIuV0CHLrjLCbs5l5KmhnavBVglVDy6x95ohpe8OW3F3iZSgNhyEI
Message-ID: <CAPVz0n3Kn5VVxWxCgq2EcRiOaLWnB85hD+-S2Eou=H1PyycJCQ@mail.gmail.com>
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
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4719D5607EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8173-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:2=
0 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 01:13:22PM +0300, Svyatoslav Ryhel wrote:
> > =D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
10:59 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > On Sun, May 17, 2026 at 10:43:00AM +0300, Svyatoslav Ryhel wrote:
> > > > Convert LM3533 to OF bindings, add missing VIN supply, add support =
for
> > > > setting mapping mode and LED sources based on device tree.
> > >
> > > How is this being different to
> > > https://lore.kernel.org/lkml/20250218132702.114669-1-clamor95@gmail.c=
om/
> > > ?
> >
> > I have decided to have a fresh look, this is continuation.
>
> Then it should be something like v4?
>

That was more than a year ago, lets start fresh. Those patches are
gone, though I did add many of suggestions from there.

> > > What about this comment
> > > https://lore.kernel.org/lkml/ZmBcvtLCzllQDWVX@hovoldconsulting.com/
> > > ? Have you talked to Bjorn A and Johan?
> >
> > No, but since grep -r "lm3533_platform_data" * gives 0 results there
> > are no platform_data users of lm3533.
>
> Johan was against driver removal (while it sounds logical due to above) a=
nd
> referred to some other patches from somebody else. I think you need to
> synchronise with the people to have a clear roadmap that all stakeholders
> are agree with. With that, the split and other technical issues can be so=
lved
> during the normal process.
>

And this discussion was 2 years ago, and

"This device is used in a bunch of Sony phones and Bjorn A posted a
series adding devicetree bindings a few years ago"

They have had more than enough time, don't you think? You would
definitely know if there were any activity since you are IIO reviewer
and would be included, were there any activity?

> --
> With Best Regards,
> Andy Shevchenko
>
>

