Return-Path: <linux-leds+bounces-8336-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGRLIS7QF2ohRwgAu9opvQ
	(envelope-from <linux-leds+bounces-8336-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 07:18:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC215ECAFD
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 07:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 230D430BF890
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 05:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7893C313522;
	Thu, 28 May 2026 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O31d1GGs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D80214204
	for <linux-leds@vger.kernel.org>; Thu, 28 May 2026 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945493; cv=pass; b=OodGYYd9l88tRO/d3chFt5jBwK+MBpsJN5kH2MGlyzxSP/EcJ/39dqfKdZuCa/SZL9Vw4LmhaLBfGGtRn0ZHNyjQeR3J7cWv1jMMOJPkps2OdJ2ojrvAsn8nZQEv3Y0o+Capul3eCIsJwDSddKxobMWpCaO0u9s+3xTBsU7+XIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945493; c=relaxed/simple;
	bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl6ZFI0h46mw4sbA5OVTNPAjM18wFZCOlWmr4KgqFlEciiAPoV1H466BOOH5ptLmrXJQ2ikiSC8XuSzvoB6/fIHvJeEiluNmKzjuJUvVJVGugpQGFS5PWkvhBOvWvgYaaulDxaogs+QY3JtBFQjC8dG47laoBjxJDTxi5nI1CG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O31d1GGs; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137335bc3caso3466983c88.0
        for <linux-leds@vger.kernel.org>; Wed, 27 May 2026 22:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945491; cv=none;
        d=google.com; s=arc-20240605;
        b=YpE3o/kwVAKYBSqc1hri3u5MB3sWmyekVgUNGgv1xm1wVPbhr0lsupZxnoMdEbwee+
         RCoiPp/6MTWwUtHT7gqguWQjzxFxN5aceh30unwLab0Un0rw7dCZLv7TkUKuf+rPR9I6
         AU29SS1y5EmGMsrvSMHpm+llGeKSXPHO3FThOvG+iJheXBhxiF+CIQaE8fj0T5oAczod
         RSwseA984GjZOgx8UZu8l02cpgiG1MzQOCSypUb9WWCUnc9HSuBTorWg8aT91lCxC6XG
         BQXr1FUaiY1Qj7WB+YL0bdJDCBxA7ayzTt5hBOuQe9vua3LEgswzDHQo5eo7TrxXdA0a
         QsVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        fh=rcazh38orUZWoXZ8gtbf4PisReIxjSImXxD2UtjPISo=;
        b=fBVTFuxpBdnNbDHTlFa59UGbYVD55W8zjKjYb44L4qYGr45pH9wlPjpO0GnKJs1uft
         Db7oUvxLG9vyScpF+ieoq8ydlwRFjAQn9i9iTSfN9oBk3p0pBMr2Y3Fnafg5EG19RCgb
         hcnBTywVyI3uLo/bsaIGepe24Eo6kc3I0LShyDbLs/dijWOudTgi/2GuFQ399eO+m5J7
         TMtqVdLEToUVesVY4V26Lt7lPrnN1JubDcwguaPcGa2iarcxHuomB8gvmLIkPAgjR1yt
         xrbFhS7rgLyg4k0vHraZlDqewe5Ai0aSaJurpEZ6Vz4xNgfieldvpSbGrTjqkyMCC0Px
         3GGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945491; x=1780550291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        b=O31d1GGsez0AtaRwSwqxBrHeSyVWjhLE/UAWc88iBOgcgGt0N1ZCoGtjI0nbHHxc6y
         FJcKH4nDnVs0ySg+3OXXaOQW0QM7BC9bRwuVdI4IUx3EXhAip6JbcALoPdRfCprNBLhd
         u69R3Y78pm3MPbu9ii+UJlAz8JL5RVDOQZTA2LyutjJIFJhodsPtozCEHkv+AvDG2nDP
         UCZez+o6x83DNaXTG3Qekw20De616Zgy8TINZeLHn2H5VOkecU2iEJ7B7S7y5WkHs0M0
         cB9GdSskoGpbdTz4wjq6dK6fIR/J5rpDGzbfmdR25z515oegdRPaUoMr2jWgbAdSWhjW
         Fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945491; x=1780550291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        b=g9oVOEadE1/s4b76hD5fY+tUMpHLr/oh7NE7sOCzIMZaAjtplPIgQGcGVedBZcOYLg
         k+HwAZz4bLmpNQtsgMOno8W845jWGX6x/9DKOvZDsNDmOOtz0rRIHkBOvoykbDMDbx7d
         ntBui4CzlXu0uueqqK03r0/N3PAx/JK9hMTj6KZQwjG5btJu58qeagVAmnqLcavGViBE
         A+sVbyV2jfFHVymzlK3GvfCHyHnEp6TOzODsGQPLwwZ6mXoonKMvJ1viwemo8znMfkF8
         60gay9eRjJwUKYyHRCNm27jUbZoAm6AdYFIj1JOGDbDun3JESTd4qc7DQpIcAGePzxdl
         DKAg==
X-Forwarded-Encrypted: i=1; AFNElJ+lmVijnLRBwiderL+NwcGNOJ0lONZtgYjsgaQ/2qFbRV94AQnamQg+zqu0TDMh7xlzSWlirUHkrYdH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+yM8itManBuvQo/3oBd2NFOx96LF7nQZGnqF7tv2X83/8sEbo
	4rEMg5CbzQ84xE/1ILq5ZAW1NjmO5P5RqdX0Satia7OSx5G121q1AasCOTInV1RIWhxsUFipRcV
	kRqrEIhFOFasEwkgFbaJnde5jXVGV++M=
X-Gm-Gg: Acq92OGPOZeRHslneN6CkjO/XRAh5gm876ZGaqdK2jfPrnMuJY8dQDk0+1AQv14rACD
	WIJ2eAg8xyGq8/IdRqU/eRFEdpzRaFHJCMKr4g2oofk83BaMVdMovBKktsHBW9UAsX4EVPDDL9R
	sTpZiz0kSN26ICeh+igsyJOZnTI4LWNhvwGD/clSPD0lkE59Tvkk+mLqMHp9+BNjc8u5r0hAMXQ
	ad6Fk/BVGgXGGdqel+3hxdm/Sbxdc51az3XQ0Eqcd6wteCI1mKMUxZbvAW/U5SpopTGrZW4w0p6
	46g8edKBvl3JwrHJmubG16dNop7NPQ==
X-Received: by 2002:a05:693c:2285:b0:2f2:6dde:df66 with SMTP id
 5a478bee46e88-3044905daafmr13410331eec.22.1779945490943; Wed, 27 May 2026
 22:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520182124.117863-1-clamor95@gmail.com> <20260527151432.GE671544@google.com>
In-Reply-To: <20260527151432.GE671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 08:17:59 +0300
X-Gm-Features: AVHnY4IwFtKSnlUuqqQMSGRUcAGiZFh32kg3QDjdUxx72WXz6drvM_0v5ARcn1g
Message-ID: <CAPVz0n2b2LphZgw7FeqMTw1gfKuMdagQ9pt-GJ4sziC5Atx9mA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8336-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DBC215ECAFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
>

That is already done. The address-cells and size-cells props were
removed from the main node in this iteration.

> --
> Lee Jones

