Return-Path: <linux-leds+bounces-8364-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEo9HQhmGWoBwAgAu9opvQ
	(envelope-from <linux-leds+bounces-8364-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:10:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09F6007DD
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 12:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 678C0301913E
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 10:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B27B35CB8C;
	Fri, 29 May 2026 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QH4EWJZk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6943403F1
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049285; cv=pass; b=UdQQlgI5Da3ra9Y11EM7R8IySfJ+dKgBHQJevgsqmezggQlbNnS9eVkbSTejP1K5ltyKfFl7741UWtUBx0i4tle1URACX5WWIECg+hCi1QJu9EthTyHV3bff3ZtY4YgGJNkCtGTdD99+kzAFDDrK6g3gQDGkzv2wNaV0CHA6a+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049285; c=relaxed/simple;
	bh=n8g9nbx/cd37EQYdG35MTeP1UwCovHHBH5OKJHp+X0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eo6YeJMhY8sBHpMTGh6WTSJF0n5a6Q2EqSJwOnSAMuLbEwIqyVlE3/jiI0GA82FOZwsT5b4IPgfN2CDAxF7Kq6oMmr59pvuAbIxqu0OEcmIpwvci6BZcH8UrTmkuK5Tk+0SPQY5V52N8L0FXDOm22xOy2688LLoKnengBiWyZlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QH4EWJZk; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304d8e3bb72so140208eec.1
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 03:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780049282; cv=none;
        d=google.com; s=arc-20240605;
        b=N+Bp/quH+ycYVibrzLsOqbE87I6E3ZMfwWulweYTPX8Cv4ByazOF+ca4tX5qPVC/bu
         iaI3WJ1msGJ1BcMBx/hbuMuHkg29XquKzOi1za5+55rS46r2E9LzWPNcqWNcSu8iRKn6
         u5uFh9x1jhfRbZeXDxfIXOhJ62VFatvPlwXlTPvI00l3lg7XkqYkSeE2Pg+Qoqf3gyA5
         7wKTeZaRoezgtxi149/9EYu1jCkzsIIfAumtJov845u3fJOR2ZqK02Z0qu8pdKP9B5Rs
         wA8/dNmSKjJmnRlAhpr5SaqUzx+8jF9KtqeoxG/nPs5XEcCloSPl6CBixVk5XzcHLdbq
         fvIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        fh=nQB2/LaKqhwPy9m8k90vINYvhGyLnp0q7zrRQrxLLjA=;
        b=VTCMr4qNScMQhXLlz8z6lZBoGQ6H1b6i8LiS/oPKGQgssBwNb+0F5usBP6weZC/Xms
         Jom9yedjf1D7eEiTKxP1wGKcw/NpxQglGyN2nWLtqokk61R1hU7EJC+PrKT1Sla1Pytc
         mARHIGoLVY5d89NW+UI2Q+hEsRLdW0i/JOmO/OrYvc0chiH4m9+2i8f7Wl5sK9e60uj3
         tiUivfemSPME0s0qihz4vuUrhptrJ7RfTuIXpKI49/ENIQQwahmKQAUULHtAG2kTgDLv
         vJNMMZyOKI9rPw8EyRAeNdDTPoZoykZDREw0ktQV/mo6sWhmywxRdG5eNMNFW+mFl5pu
         TF0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049282; x=1780654082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        b=QH4EWJZkM2Bz2/Mg0D+E46mMWqXeiRUbecZwePs2Hf0Ke45z0GnQXgMLZrfAbndRM6
         /SLcdaAIjjw+clpICOIglgob62aMWcsLxyAakx+yykiy/WBwkKl+is6jGpCCxiubC6sf
         6rkBt+TeMUfXH6yKv5Szv9/D7Qt8G3qdkJDdI4SxxLSqcmGwHNRvrmS7ehAFuwPSLJAL
         5xz6RDmFcmTzK1U2kiMcPVwKzwN1zQWcxxqQdxUpBXyHuh6Vu60KN8Qe+jXabz2hPjkk
         +WPJ0oyCmIhv75bzm1Sl/LbRS8Z93q8f5yk1Sw8eIYDoavWhu1EiK0nOpKFBUx7RNk4q
         ihcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049282; x=1780654082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFYmm3B1m2K2OFAsTX7e06En+33NHgtZEIHcXjaWAp4=;
        b=gOzoEUpOEg3F93Trvj/oP8xUWv09zHUQxnH7rusB6JWRgBppYiugBgoiwbExEIBKZM
         MmpelSBIEOxVTJ8WVsAGDGzUcednpo46W4d1MHdfa9ruegVeH0rEuicoycZERaieEPPL
         4Z8FhF1oUm8P+MZjJW380EMUrvB8LKyGaTtMNYNYUSNYbMefta1qZ7LBsAIWorZgoTUB
         H9mVYOrfzS0yvSvsiju9Y2OsGmoAmQB6L/XXIm+YySVWETNpU2i7o/oVaJPavUaWqj5A
         wXAcvA9KKC+sL45/U2ou5mk9m8XaXtt62kbgW4fLdwrsB0J8bXN0ROIfITkcLa4cA/1+
         1iHA==
X-Forwarded-Encrypted: i=1; AFNElJ+WYym9/Xbpf028XaM7wi8aSP0Vm/gFWPMc+gt1zs2Adc3fNdVsQj4CdIy6vqx6ifSeCWu5heFIIMmw@vger.kernel.org
X-Gm-Message-State: AOJu0YwevgQyn3MwqH11JjF6Sb3+NYWsUa6Avi2hIU7J9J2tg7ShslZW
	3E6hfHYl/YAqBTs6+bSbZN/5U2ICBTBkXX1y7ZwTTP4osYHMIIpT8PcsW74svmIy6/ypsI31Qvk
	mSUcH7bixVrt4KNej0TBPCxmNpfI/a5s=
X-Gm-Gg: Acq92OEv2ttstBT5oW/Cszbeyp8ba/u5JQvlUsuiaKHSMXVyhHTACXNJP0WO0svojFS
	xm6PmKDY3RKHcDkY0H0KQlfmRp1HeHQOi3Y9AVNae9231NEBjK47OLYlkKTSTLXAqaFKW9ExqkR
	tFwfClv2d1IU362UPiDV/gj09qUljHYvPGJB5AQQ3aB7EEOMXpF1h9/EQb4XvDoDwv/Uq66jxgn
	4GGOxS1hJsJNK/arUJx8AqxM5Kej5QyrQrJX8rkUTfMRGL+lHZ050LppG/e/ybCL8eKUto1fRyI
	OnBCnt7b+AZybK739s0=
X-Received: by 2002:a05:7301:6093:b0:304:aca:35c5 with SMTP id
 5a478bee46e88-304eb228f12mr937539eec.23.1780049281982; Fri, 29 May 2026
 03:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528135123.103745-1-clamor95@gmail.com> <20260528135123.103745-2-clamor95@gmail.com>
 <ahlhinOh3NxB7FY_@aspen.lan>
In-Reply-To: <ahlhinOh3NxB7FY_@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 13:07:50 +0300
X-Gm-Features: AVHnY4Ju4apl_6PVevGT822qLIzQw2MECBwLZ58e2K1CK8Q_oHMtYlAD2TA9TPk
Message-ID: <CAPVz0n3C8D+amSRkF=Koj6Niu6u8uz4LbMoRYEX32_ECm5-tSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED controller
To: Daniel Thompson <daniel@riscstar.com>
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
	TAGGED_FROM(0.00)[bounces-8364-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,riscstar.com:email]
X-Rspamd-Queue-Id: 2D09F6007DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 29 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:5=
1 Daniel Thompson <daniel@riscstar.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, May 28, 2026 at 04:51:18PM +0300, Svyatoslav Ryhel wrote:
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../leds/backlight/ti,lm3533-backlight.yaml   |  68 +++++++
> >  .../bindings/leds/ti,lm3533-leds.yaml         |  66 +++++++
> >  .../devicetree/bindings/leds/ti,lm3533.yaml   | 170 ++++++++++++++++++
> >  3 files changed, 304 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti=
,lm3533-backlight.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533-le=
ds.yaml
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3533.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3533=
-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm353=
3-backlight.yaml
> > new file mode 100644
> > index 000000000000..866b0fb8ed04
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3533-backli=
ght.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/ti,lm3533-backlight.=
yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3533 high voltage series LED strings
> > +
> > +description:
> > +  This is part of the TI LM3533 MFD device. It represents two high vol=
tage series
> > +  LED strings for display backlight controlled by the TI LM3533.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +allOf:
> > +  - $ref: /schemas/leds/backlight/common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ti,lm3533-backlight
> > +
> > +  reg:
> > +    description: Control bank selection (0 =3D bank A, 1 =3D bank B).
> > +    maximum: 1
> >    <snip>
> > +  ti,pwm-config-mask:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Control Bank PWM Configuration Register mask that allows to conf=
igure
> > +      PWM input in Zones 0-4
> > +      BIT(0) - PWM Input is enabled
> > +      BIT(1) - PWM Input is enabled in Zone 0
> > +      BIT(2) - PWM Input is enabled in Zone 1
> > +      BIT(3) - PWM Input is enabled in Zone 2
> > +      BIT(4) - PWM Input is enabled in Zone 3
> > +      BIT(5) - PWM Input is enabled in Zone 4
>
> This is optional and the drive implements a default (zero) that is not
> documented here.
>
> Is zero a sane default from a DT binding point of view?
>

Yes, if property is missing then PWM input is disabled which is
equivalent to setting all bits to 0.

>
> Daniel.

