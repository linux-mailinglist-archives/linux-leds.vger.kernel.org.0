Return-Path: <linux-leds+bounces-6938-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCXbJYjRjmnJFAEAu9opvQ
	(envelope-from <linux-leds+bounces-6938-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 13 Feb 2026 08:23:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6D13380E
	for <lists+linux-leds@lfdr.de>; Fri, 13 Feb 2026 08:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D4F13013FC5
	for <lists+linux-leds@lfdr.de>; Fri, 13 Feb 2026 07:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C10729ACFD;
	Fri, 13 Feb 2026 07:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myyQa0+0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F742874FF
	for <linux-leds@vger.kernel.org>; Fri, 13 Feb 2026 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967414; cv=pass; b=fOq+OobLWl0XmuQrPnbY/vAGVVT8N4Y5dj7Qkfvfm4nXnppRZk3y5Sj2b6wRQGZfrutolQl3q4WQ9Ps0WVx01Ya5MXflNvHPGAV86G1zpYdp3vUjcZapgZp+8lB/TWIIVZ7Vx9zcXEbEqB1trM0hiVWUPG5BRHIhlP7F7gytXIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967414; c=relaxed/simple;
	bh=MmyEyVaUK0nInRHofYHUBo4aN8wM9mt3v+WrEEIMH9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIxT6MqtsXBxHb9Z4/ObIZ8Y7ZtSh2h1pf9GBSp8wyUgcOiQMTgHS8aX48P3m2/WQU2wXFdACMBzY6Ab/+p8M9PnjA1qwm6eH7DPFGBlZIqPAxyQwdee/tw0gQ+HODiABWpUvjgqsHR0xSVbjt0qBNE8cDFNer9dMpwzVw+dbaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myyQa0+0; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483770e0b25so23985e9.0
        for <linux-leds@vger.kernel.org>; Thu, 12 Feb 2026 23:23:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770967410; cv=none;
        d=google.com; s=arc-20240605;
        b=g4OCPzjz/hzX7Uh2Ssc2nIDf5T1jTS3v1bmqKd2ce5A6FXCVdyMnwVauTOj1cd08td
         6pocyBvJV1qc+rfs638NZYXYmgylRxIZb9y9GZMOP6gtaz6RAX3UqKgDPsgCwaG6pCn4
         K6P2qg2Fy8DibfA6dFlinD9UeN/nYa5RE0m2qZDMq8SjaH3WffAvHXLlfT77d2NtzA2H
         r+fWGU9wnezwBLRWO7wfaW7TQ9TODnt1vgEQGiM3wL/MG1QFIb68EU6pcGgtZ4hVMpjZ
         OSUPl7YvHurIJlCf74hvtQ9FyIwHWyL1DJYPax4XpaGHv5+JxZXM0kAsx+nNUIUVwAyX
         ZDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VBWGvgMwD89B2tOYl/7fTry4UgR0kuVd41YN846Sbf0=;
        fh=lbChS7ebKvs43rrkDZ3yyKfu94STNRIX+ZAhC+QRQ/c=;
        b=NVolZMDz7IXHOt9LQqggS6cYCYuBOsMBX89+Nee3hUo5BvERYwJTZKXS8aEMwe8wFO
         QBp6PWV6EhulR08ReaUmVS15dWWlEZt+Hx3McGh7pjqupqc9D2B0ujza9ZmYOlk4df0E
         fXxAh1pRpj5r+Q5P05840UBtStWoXn8vNUJ/aRMCFGkPBOu5nFaka77CDbFB0aLHou9+
         f3cvnsc2oHHKxai3vNTlra67Q1YllYZ2kKmga/PociarQOgkjoXvyKoqofwEQN0lczEJ
         W0x1JDPklWfhkUoIqLr5qN3SNJK5fSm31PczG8qJCkKN8gPo8IFmnlqEdlsIbY+KNAni
         H+3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770967410; x=1771572210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBWGvgMwD89B2tOYl/7fTry4UgR0kuVd41YN846Sbf0=;
        b=myyQa0+0cdZ+6BCDWQ9XRyfq36ArqkIuxg3T0B0e0k3KTN7Fxgoza3JurNqt2hIZ73
         Z8KwemYutt8a8dmsYEa2cW5TON/PySdU4wGeWtt1jiX+oI8PKGY0C21vpyywSg04XAnM
         cAZkTinhBo7tp7ijknJZGHWS7qK4EW+9jQ0UykLEXXpPrW5XASJwMPNVDtBJm5zFeuCw
         kg83RWB/vx57hGCKzvOnJgXA/b2Xa2tWpYcQqB5NPd5nYEUK9CZ5Ff4uyOJdO5K2Oth6
         pVkInJIEja5yeUvaUK+jxWU4C5HbQdUhXNdKsMBGitLgviYxiCARAeZew8gezjZNy5vC
         iYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967410; x=1771572210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VBWGvgMwD89B2tOYl/7fTry4UgR0kuVd41YN846Sbf0=;
        b=Zk+41frZ2qy96gtn4pcJm+YG7GVduDwQKEeCZLmzbXFxAu3JyBceTRv8Y71Q7B6eH5
         dlq8eoP31vTM+1rBCqQwZisZdQxgQmtUx46mJeztaL9zQJSBbbTfvH1KlkGxZoCfj/8O
         Usi8BW6kIo+7LBK83jNW0srg2M4cNW1fcZAZuIniTTfHG6qYrvA/PYjeuyoH+hsPGMkK
         ZUMG5u8S4DFnRNBob3yuMglGf7HVhZv8CWSnFVoOFXxnLomKZ9JV4JrtNCfYuu93Y1OA
         XvrdnEagY03PsuPLS/98BfTHQ8n2yUa9AoSzHHbf2z388+6zyVhEzhDNORnRwv1mJiO+
         ZfJA==
X-Forwarded-Encrypted: i=1; AJvYcCV4fnAIL2ZU0SL2mFN0pGMlU9ZRcR8NxXwlqEGfIg3IeLUAIhXEzEOXtVFkF08DlxOq3HbGwJizjDtd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xNu+dXMgX/SaFBSz62b/XJiAFRqlLl0T6ghjMKpUiCEybuyN
	MnH6AxUhG58k9ICytdxjWj6P5Mts22IWLvcO7kXOB3epapSYdSfwLSSpLIFzspBvMrMrxPx7MHH
	Xdb+V4kzwRW8xaB1doON1brLSP9cP7LU=
X-Gm-Gg: AZuq6aLsRzTx1qXltonF3EsDQD2CuFCkHDKdWTssI9G3RPpM7rh0jq38/mxF56Sxege
	4rj+B8YkW8QDu8zqG9KnkwxfeTski5Ef6uPl0rpBOGmT6FUDCzgxyQObGRpVsDf8kOauZa1bKdb
	cm80JXidmFQTj02mMe6yP+bYS3sKdO5UO92lYGwapTtWhSGGFYJvDtFyidxaofgHaQpdHsaPQr2
	ZX9JP77y8RswEyk5Yf6Oeb5wRlK1vbUcfexlvTD+jpOgkXE54o+ue3IZcMH2rDsG4S7zPNjP0Ji
	x0ofT9Er
X-Received: by 2002:a05:600c:314b:b0:482:eec4:772 with SMTP id
 5b1f17b1804b1-483710962c5mr18176375e9.32.1770967409817; Thu, 12 Feb 2026
 23:23:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206172845.145407-1-clamor95@gmail.com> <20260206172845.145407-9-clamor95@gmail.com>
 <20260211212016.GA3910589-robh@kernel.org> <E5BC797C-4362-4C75-BCAC-7C32A51C4725@gmail.com>
 <CAL_JsqLcFAP7oP0KzLp7DfcCpz0DjsjoAW3PcfnWu2nc-dG1CQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLcFAP7oP0KzLp7DfcCpz0DjsjoAW3PcfnWu2nc-dG1CQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 13 Feb 2026 09:23:17 +0200
X-Gm-Features: AZwV_QgDJIV6_g_jAAOQ5PvTpgIhruzFFHa64dzcRToVwkVZEzE9kWpIOm1s5Xg
Message-ID: <CAPVz0n3oSpaW4w74Wxv9G_RUhCYX-WsnVexoAbp1tU6rkJ4nNw@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: motorola-cpcap: convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6938-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C4E6D13380E
X-Rspamd-Action: no action

=D1=87=D1=82, 12 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:19 Rob =
Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 11, 2026 at 11:30=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail=
.com> wrote:
> >
> >
> >
> > 11 =D0=BB=D1=8E=D1=82=D0=BE=D0=B3=D0=BE 2026=E2=80=AF=D1=80. 23:20:16 G=
MT+02:00, Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >On Fri, Feb 06, 2026 at 07:28:42PM +0200, Svyatoslav Ryhel wrote:
> > >> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to Y=
AML.
> > >>
> > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >> ---
> > >>  .../bindings/mfd/motorola,cpcap.yaml          | 411 +++++++++++++++=
+++
> > >>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
> > >>  2 files changed, 411 insertions(+), 78 deletions(-)
> > >>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,c=
pcap.yaml
> > >>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-c=
pcap.txt
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.ya=
ml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > >> new file mode 100644
> > >> index 000000000000..7e350721d9f6
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > >> @@ -0,0 +1,411 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: Motorola CPCAP PMIC MFD
> > >> +
> > >> +maintainers:
> > >> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > >> +
> > >> +allOf:
> > >> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    enum:
> > >> +      - motorola,cpcap
> > >> +      - st,6556002
> > >
> > >This does not match the only user in the kernel .dts files as
> > >"st,6556002" should be a fallback.
> > >
> >
> > Honestly, I would remove st,6556002 since it is not the only cpcap mode=
l which can be used, hence it cannot serve as a universal fallback. Some de=
vices use ST produced cpcap chips, others use TI and range of models varies=
 too. I guess I have to multiply commits.
>
> The "cap" name goes way back to at least 2G Motorola phones. There
> were whitecap and redcap chips for different 2G technologies which got
> replaced by patriot (red+white+blue I guess) for 2.5G.
>
> Dropping is fine with me, but then you have to update the .dtsi. If it
> was me, I'd just make the binding match because that's 1 patch instead
> of 2. You can still drop it on the new compatibles you are adding.
>

Yeah, you are right. I will preserve st,6556002 fallback for
motorola,cpcap while Mapphone and Mot would not require this fallback.
Thank you for suggestion and for the cpcap's origin.

> Rob

