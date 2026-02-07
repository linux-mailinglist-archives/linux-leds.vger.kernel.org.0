Return-Path: <linux-leds+bounces-6885-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNVOB5Z1h2lNYQQAu9opvQ
	(envelope-from <linux-leds+bounces-6885-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 18:25:42 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5005106B27
	for <lists+linux-leds@lfdr.de>; Sat, 07 Feb 2026 18:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDD7B3004DDD
	for <lists+linux-leds@lfdr.de>; Sat,  7 Feb 2026 17:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB7833A9E5;
	Sat,  7 Feb 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5HDNnOg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9D333727
	for <linux-leds@vger.kernel.org>; Sat,  7 Feb 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770485138; cv=pass; b=CAxZ9ku5wDWZBnWjyz4g+kSzTWBoBcWCt3Riu3rT3pNB/OGqug22MCtkKeYt9W2dfaso8H5zsjREozKXOY03sG8RY89mDHKwvXiD+vA2fKUxYdrkIiWM0Xpcp2S5KxDV8Iqu2qkl7BRynewdoayHjRhXi3+qmu3q2GhZLslPHJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770485138; c=relaxed/simple;
	bh=HEIODAx2+Jyjm0uU9ELdLTTbA84lSwuzGWDVhw7tp58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TnvqNM3Kv2dwMTSwCfcgId5ROpABfNIDvz5Qq0KU3wMkqfYyzXPPx8c25NCWasIzHjiVqX4uGXveu5fAjm0yDOsG07QiMS/NKe1SQ32B/cBUX7jKLTYggLy3FNNqF144GSx05P63ltDOosVaqkk+hyHr7CaCEfrgNhh4BACnA3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5HDNnOg; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48068127f00so29111165e9.3
        for <linux-leds@vger.kernel.org>; Sat, 07 Feb 2026 09:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770485137; cv=none;
        d=google.com; s=arc-20240605;
        b=TXWyHIUvuZrDa6OgSCG6pQh8L+IsIJVlSgGwo1Lq36gq5BRarMGpfBDmRw/laQMtak
         YzUu9ET4L5m6F8ouqIPkduK8ax91tc3nZ4auGgHQLbhIpJQpcj5ph/gJmVW92X4K4EXq
         c2vZaCNVj2MZ/ea+kdpYnJ9XrnZF2LRC93tZIKENL8GJn5G5pZ8CTA3oVER7Qp6OTJCK
         iz7dD0tUrF/MQkZJ18utc2HkchvCZqcOl1QeEqBXXksloAF1iJKoQrGOO0j5WOVRmxbo
         R318OBiF6n3fKY1fShODQkA6ATfOxNek4DQ9qrme/RKBMqGKkjwW6i+GG2m9IerkANoz
         ULfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI2SyZ4XJiIDdMOpKUZsjQ6ZCYdtN4FvLlZEhJIfteQ=;
        fh=jAVY7AJDOfnJbKWLt+e95avELAMeTXoAPHnujsqU+xE=;
        b=CI1+8qq3YRdalUaqEUQatsmpBU7yNtf905wn8QdnoaiORlkL6QSP5ET9gt03Pa8gvf
         rELt0Gw332yEJ+TpvU/uIAikcgowKeEFRGpR0KDkvwBxp8em0lNUNd9kOF5wz3WAo65c
         ukT6bIAhT3MOAFaSX1uCXX4NVN+nUWTDvWBuaAoBTiDU4/uGs3JuYhZkWbVGMuoKqM/P
         Y5tWcMTGgECHpbtVu3MvEfuyer+nQo9zzI9Yz4X8xO1NgijyxvCPmHGqF0Vmoc04YFrI
         cUK8pi3ea5QSrIbtBG/UH3bONlSStS7YobyTluSgMwJq1zL5msL968HYVic6Yj0QYeJ+
         h/RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770485137; x=1771089937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI2SyZ4XJiIDdMOpKUZsjQ6ZCYdtN4FvLlZEhJIfteQ=;
        b=X5HDNnOgmYojYmhxFSXk5RZ0YjP8oC0DqFnGB6dDKUql4/Qe97IJwHBVdPHRR7lyxa
         AZXGPrbbytIvtHXgDtWnpF+AqktHR3RGBTFjKAYvoZAjt5+yUSCbbKl7aEse2Vvyf4He
         V/XNxvM/aefGXoS7JJhERpOTwLoXP5tZH6QCur6HM980py7diD1fpnx3IfnzJ8jNXkUR
         KAj/PGMn4jgWR13z2inFXANj+W6SIzP0iAwU+SSRnXKnVMm2fDKjG27LcoK84AoUZugz
         pT7vK/TQjPJZpRCmSLinuNX0qCAkCL1kLTqcAGjk+UYP+qi7YSd49F9Ef7Fcqb/s/LO7
         SZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770485137; x=1771089937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sI2SyZ4XJiIDdMOpKUZsjQ6ZCYdtN4FvLlZEhJIfteQ=;
        b=XhUs2m3G/6MzAREeLpkEDnS6VH2FY6a14kKMtPyhxOyJFTW9r04KPARdRHDaI2mRbg
         n69fZhOTkIcjXf4jOEZzSBbxXbVQjQCpfWaxeNOWPgCeHS5lLwOMQu1bXmet8Y02hJaZ
         kIiEGJufoI7BGQHDqknWCTboASrZyKuL+pyGGclSIOC9+qeaUp0dODK+dVlIpppGDU51
         oXWYYnPOT//Y/JC+ubQIuf1b32nA07OWzfZHzs5taWZ6Zy390n04zcEall8EnjgqKfF+
         Gzga6/d9OTDdMz7+iy+K91N/1kvzNkn0C23nYcQgkqw9JEDgn+taRkAiT3X9+ScnmnM2
         zw3A==
X-Forwarded-Encrypted: i=1; AJvYcCUPMxzJlM5H5uc2Ck4U4cV2PzzzvNnZBUE0FT9KD3tHI6OCgbtbxCLYv/Yj1Av4ExkD0v8f8GWYKOl5@vger.kernel.org
X-Gm-Message-State: AOJu0YyeTB0zSfsI0FTTrouzLp1SpjUSLLXBmVCsrudYy7GLa8JiFB70
	/mhXq2zLNKHE6PUthi4mkYALSpM809XT1Njk4jeScDAZbipwm7JbWTo+btJ6d3PVtLmSSobcny9
	nJiSRTV7yJgTuiOM5+vPXPdCK06oQnnY=
X-Gm-Gg: AZuq6aIX/fYAIj92J86kwjWqTpQrvLtW7sful8tldTBzJekJbVDyLe829hDevJWgRmN
	WRPJWqp984dfxw29f6pyG3OB00kVsbMH0+3BpGH5DS3/+t2tCBUjonGX6mAcdEaCYylg05UojRz
	S7NYkoo6T2U5UOtuoSt8MzhM01CP5suVnzkdos6kNz0/M7iToVhLLnVSIRNoXFF1JOaoLLUvmfe
	Fv4aHuy8ynDp2wSqC32ZmPnuNk2nPV+NntIubjAFItMPB0+zaTiDW9xZLh/mQQHZpljofQP
X-Received: by 2002:a05:600c:3b20:b0:47a:9560:ec28 with SMTP id
 5b1f17b1804b1-4832020df6amr86248735e9.13.1770485136527; Sat, 07 Feb 2026
 09:25:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-2-clamor95@gmail.com>
 <20260206230922.GA254792-robh@kernel.org> <CAPVz0n3EGCSLUX7jTLve0x0z4uW1yexViCwkSQLY2d_4r4qkjg@mail.gmail.com>
 <db9115ca-2c8f-4b5e-89ce-f3b934071a59@baylibre.com>
In-Reply-To: <db9115ca-2c8f-4b5e-89ce-f3b934071a59@baylibre.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 7 Feb 2026 19:25:25 +0200
X-Gm-Features: AZwV_Qhk8RolsJvtdrDUiFlMwGmOTQ98t3Sh6iWn13yc2G3IUcR3Ke69B4Ocad0
Message-ID: <CAPVz0n2KwqPw88JVcPzhTQ2n+GKzahkrEThjjrqm0CSdjKTEOw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator: convert
 to DT schema
To: David Lechner <dlechner@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6885-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5005106B27
X-Rspamd-Action: no action

=D1=81=D0=B1, 7 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:19 David=
 Lechner <dlechner@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 2/7/26 3:20 AM, Svyatoslav Ryhel wrote:
> > =D1=81=D0=B1, 7 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 01:09 R=
ob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Fri, Feb 06, 2026 at 07:28:35PM +0200, Svyatoslav Ryhel wrote:
> >>> Convert devicetree bindings for the Motorola CPCAP MFD regulator subn=
ode
> >>> from TXT to YAML format. Main functionality preserved.
> >>>
>
> ...
>
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - motorola,cpcap-regulator
> >>> +      - motorola,mapphone-cpcap-regulator
> >>> +      - motorola,xoom-cpcap-regulator
> >>> +
> >>> +  regulators:
> >>> +    type: object
> >>> +
> >>> +    patternProperties:
> >>> +      "$[A-Z0-9]+^":
> >>
> >> I thought it was said on the last version to list the names. Consideri=
ng
> >> you already have them below, better to put them in schema than prose.
> >> And pretty much all regulator bindings define the names.
> >>
> >
> > What exactly do you propose? All those names will not fit into a
> > single unbreakable line (more than 125 columns in length btw). Patch
> > checker will complain about this. Duplicate pattern properties for
> > every few names? Please be a bit more specific. Thank you!
>
> Making checkpatch happy is not a hard requirement. If you have to
> go over 125 characters for technical reasons, no one is going to
> complain.
>
> I already gave an example on the last version. It is just a regex
> expression. (And note that you didn't fix the $ and ^ either. ^
> means beginning of the line and $ means the end of the line. So
> the pattern currently won't match anything.)
>
> patternProperties:
>   "^(SW1|SW2|SW3|SW4|SW5|...)$":
>
>
> And I hope it is obvious that you are meant to replace ... with the
> rest of the names separated by |.
>

David, thank you for your suggestions and I did not want to offend you
nor Rob, or ignore. Using this large string IMHO feels a bit wrong. No
offence, I will use it if required. At the same time I was
experimenting with possible representation and come up with smth like
this:

    patternProperties:
      "^SW[1-6]$":
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

        required:
          - regulator-name
          - regulator-enable-ramp-delay
          - regulator-min-microvolt
          - regulator-max-microvolt

      "^V(CAM|CSI|DAC|DIG|FUSE|HVIO|SDIO|PLL|RF1|RF2|RFREF)$":
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

        required:
          - regulator-name
          - regulator-enable-ramp-delay
          - regulator-min-microvolt
          - regulator-max-microvolt

      "^V(WLAN1|WLAN2|SIM|SIMCARD|VIB|USB|AUDIO)$":
        type: object
        $ref: /schemas/regulator/regulator.yaml#
        unevaluatedProperties: false

        required:
          - regulator-name
          - regulator-enable-ramp-delay
          - regulator-min-microvolt
          - regulator-max-microvolt

Will this be acceptable? It passes checks

