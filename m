Return-Path: <linux-leds+bounces-8593-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L2+KEqabL2qlDAUAu9opvQ
	(envelope-from <linux-leds+bounces-8593-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:28:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F42683CAF
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 08:28:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cTMHsIa5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8593-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8593-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF1B3026F0C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2026 06:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD1B3B0AFC;
	Mon, 15 Jun 2026 06:25:39 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B933A0E80
	for <linux-leds@vger.kernel.org>; Mon, 15 Jun 2026 06:25:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504739; cv=pass; b=uPfYB2z/vNnU8qYKd/J9+F7DQDboSPeimC7Ad61UOIw37Ad53GrAMHVVCaqxQdPYLB33lig1TEgdhYOiUI8vk431ab9dnQTkP4z9gIWIjvhWIcV6/eI0+VzHgwNSupow9PLkBNR1r4spqGV+ruaG8Hd5FJE792IkpeXcLWHDK1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504739; c=relaxed/simple;
	bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dVVazHO8dbQ8920yXGs50LO1LukhZ2yBi9hFHIIbqPYeXPzbr4rTnrEypE5w4pCiGPj3Klx1OMvw7poynNA0VUhzBR20YvCxcv4JMGwsZ92fHdvfa5mSXiTNmx1Tu7D55EJv+rMl9IGdm2GKP+lqErqS0QgeeMRJWZj6Y7l3iio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTMHsIa5; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b932e4bf1so334566eec.0
        for <linux-leds@vger.kernel.org>; Sun, 14 Jun 2026 23:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504737; cv=none;
        d=google.com; s=arc-20240605;
        b=FJgmIb3lna0bYLkvO1u7Z9btM8UsgSN53clatv3rNhTNGrlyuT2KWHMmLHAVSKvb4a
         /nRnJVVPeJ05ZSNNZvf03klMWrzcCK54B64U6w9KwyooWMOf4D9XmqBAsZQMukZ3YgBc
         YhNuB2/y9hi7iaqVNBF8UEFzMQRX4p9iY7zGbD/4FCS7CF2YtHGQgbBsd2fQU8/UFbu7
         HPXEsyPWV5v8aG26ywOiZTqat85E/jrTk55wmxmC8VEfrm14GpjRFbMNLJZ5e8KdiZc5
         JKfkjtrrm8ipPI72Agcxyfw8YduknLn7fRDUXI+JtUt4JkgmORvkzGH6q6YjjgkrZC42
         XESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        fh=A6c6lG2tRMpVo4ymfdFLMXZEwoICTLlPGBWnwV4pbhw=;
        b=j4DWBlU8SJ8tqMnW6jW5Be+PqLYXYQOzij81g/LXR1AaR5bwCGdUYxYrfoahtu+hn4
         WSebCgxX9oYQdN9QH5sFds85dLBstjscYhiV93jEFfHnOLPkng/kTELIB8hacqE7TON0
         17x7Bsl7xUmG+N1lC0RyRhuz7nh+3qMuM/RDF1fk4YRlo/yufn8Benb2HCUxHnxkvZcn
         yO6t80CF+80NOo/FS+d01YsKvef3OsM8W/11y9rTZNVFQjwC0i9eQDuoFmazxLxSSpsD
         DnrTG7xKuc2oJfaA7VQsvunMeEy1rVKPZvmOYH8Dtx8gqJ2ag/PziNR1McXFq2JzIJvR
         +rjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504737; x=1782109537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        b=cTMHsIa5P/7U2nvFp1XtT4YU52P9TZl+jkyLhai9jXpPqmHGWWivrdB4lNMpD/aIDw
         oMTv+HKPnnWV11vmD2KxwZ13u6Cd4ZLlVWCK5CqDz5po2hb95mjRYg+FohYJCQoktGRF
         0SzTvDsbhwIPLb9Upp9AKKAOlE2aHewDTeFX7rVP+mMwMzEdTTsXs4PB9pCu9V+8g+0j
         1VKTho5e/u7Yb50GJy3djZoDVgWFQehJhGJpedTZ9BqMA8/aBbGQ8dfVByHyUOSNLM0m
         5jA560dDpYP+g8y0BE99TvMmltMRBljwT0b/hg4I/za0XBU85tqtyaUFrNyKiumeyegJ
         QZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504737; x=1782109537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cTBQJdmyijZHrpb9w8OjvsAHRwSnSuXQJu22SvXmwsU=;
        b=R3RKuHyP0x/Gr6Hk+4qjzjyZkd77b/PlB6do7uDle4gcVHrdtev7dzIosbtyhXeBR/
         NiUUsZxK0JfxUcOZlbRV89NcZl1kXSOHYrZis+c1mRyesHjktXLgjEr6hIBTA6Nsh9y9
         CX0UZw8TCIoFT4Avz9k60ZbGYEyNdih2Xgqkbw2TQjPnH/7CWo4tALalt/+WoqMlkqIb
         /dhAfieTEriG5U4CaJjY7GpVfbw6ms3N3udwXcx5lL27vZ3a9d8qz64CcVdZo33Q/CP5
         A3In+0L+IF+WMaYXBe5QE0HVn2F7eXNW8X0g0fjU2TNXFl2nFJuuLJj7DFkw1XN1X0Av
         NHmQ==
X-Forwarded-Encrypted: i=1; AFNElJ92osVyU8StypI/htlMzlMytJM+iPzfOhOuWKPXccZvwKuJPZ+eNmfxR7XkOwjZ7rdtlVAJCI44MFV9@vger.kernel.org
X-Gm-Message-State: AOJu0YxLRsddPsIrDZm9D34U0IUDTU5vFgp7wLbofeQvOa53NuXzgXC5
	+wpeOf1XX9ugsts12F7UAlL94tyr/Ohr6We/EJZiQWMJh9Xyfi8uu4G3bGOgPT1VWjrJUnIXfJt
	de5rK1mddDIwsxzdh5U+C/69YGfzl9bw=
X-Gm-Gg: Acq92OFagLv3UgPvA/5d6O7uxvviEELU6iRCFL6KlIErIn8pByqgmzQFgmM+wgDr1Lc
	zE+sBoezIFlp90ccEjUQfUTFQ2BrkstY7sW+NX80z29eY3V1IrmglfUBwBTDlh0J+iZjmeTZV+i
	+lVzi1HMoIJRv8NWdD85PMS1O4Meh8KSOyQO9APEkXcAyarkdoeoyWCGwljvEVGrhG0sLzXztLd
	syZScvdQPX4Hxt8Tes9iczxbXT9n1m667henjufgcIdH4ZTgjoBuCwwvq4kBHqGq5EOPJFbbHdf
	iaNHj0le
X-Received: by 2002:a05:7300:2d09:b0:304:3c33:7ad4 with SMTP id
 5a478bee46e88-3093a514e9cmr4694274eec.13.1781504737180; Sun, 14 Jun 2026
 23:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520182124.117863-1-clamor95@gmail.com> <20260527151432.GE671544@google.com>
In-Reply-To: <20260527151432.GE671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:25:26 +0300
X-Gm-Features: AVVi8Cfj4CFtRay_yHgb9x-k9rdyWbOqU0lnoe6TjkW8GjWPr84WyPCoGmkU928
Message-ID: <CAPVz0n33PRWgLHqaD_wVr+Dji+22Bm2gCdA1cSMLuKHYJ4T5iw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pavel@kernel.org,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8593-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1F42683CAF

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 18:1=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > The initial goal was only to add support for the CPCAP used in the Mot
> > Tegra20 board; however, since the documentation was already partially
> > converted, I decided to complete the conversion to schema too.
> >
> > The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> > from TXT to YAML while preserving the original structure. Mot board
> > compatibility was added to the regulator and core schema. Since these
> > were one-line patches, they were not separated into dedicated commits;
> > however, the commit message notes this for both cases.
> >
> > Finally, the CPCAP MFD was slightly refactored to improve support for
> > multiple subcell compositions.
>
> Once you've fixed the DT issues that Rob pointed out, I'll merge the set.

Hello Lee! This patchset already contains fixes Rob pointed to. May
you please merge it?

> --
> Lee Jones

