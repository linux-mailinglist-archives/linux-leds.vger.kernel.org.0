Return-Path: <linux-leds+bounces-6921-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PeBGb4Pi2l/PQAAu9opvQ
	(envelope-from <linux-leds+bounces-6921-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 12:00:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8762A119EB0
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 12:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07913300C352
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 11:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26CB361655;
	Tue, 10 Feb 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB5Zvk76"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C340315760
	for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 11:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721208; cv=pass; b=NhLqSVrs/HDFILmNRqwMg/oiXYkRtEo3szLh7qo5aqFLmrA9vsaWMKCqgl4yMEm3+8Bn6dWSDBb8r87QFsgm9fEezfXkdqcuWVtsz638LThBBPAdqp5tcl4chZICNmcxO4ClN7KTLDox9r52EkxYve7D+ylFeE8TOyqD5tSjoQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721208; c=relaxed/simple;
	bh=1OYwpF7TO7xoKHzCuy52J4aRjvgLTtucW1e1JzBZV/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dL1icsC77AOavZVekkmkrcOEsqZG2foZYUSx0k3FuKdcPAfcj258VKpGZspm0mDG8Pm6ereQ7+pb37f3bB/1CJFCSwWnASfCLvRhPOoWmIksHeVFWmc7vpva6zEsw52gIlYiN7xemF8nR5ots2Vx5lwPo4j15D3efHUTzNsfy5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB5Zvk76; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4362507f0feso2668480f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 03:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770721205; cv=none;
        d=google.com; s=arc-20240605;
        b=HitT0bUKILRkEHL/EAklX/u63I0t2/P1hyfdkYh2hB0nJSKM5NrndgKzdCA3fkok1h
         yX7E77xhPfBLiihrUG7Pe9HIdwM2kYdxtKlt1wz1NnWopGd2OQJc7AN4MtlfWAoThr+a
         T1CuYTYwZkdiqm97WlT9g1yv5ofz/o5WE6iR6wTOF0UKavPljZZJh4OA0NSimFt0I+ad
         P7rb6VNYpSWeIkM9L213ZaeBVzUQiss5Zmu+MZkFT6QcA/m1nWLsVqf012Yncmn/fjeN
         5b5PhPD/bq+Mf7fNf2hftkaJ7UPxoY2bK8/lwi72vXnsiMVVaA6cuemcOfMyj4hJgdSJ
         pzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfSBwZ5L6uqnAzvcQ05vMPY2K5kDs14EhIIFhtKNvQM=;
        fh=tlsEtKELq7B8cqZz/X5vQl4FSgk0eKMImEMiEtm5eiU=;
        b=B4FZxJGj1ik4/Kkf54BGnDXVlmFlWEB54GXLA5vEeJJcjqHBf4JS3BbwwGguiQJ70m
         dPuNqHD9ZeaeOhEtx7gZwY14lPHtMDXAV9fNRIxsU9k+9W/ULTagAtw0tDbKj1Rd6vmX
         VwM2/a/pTnK+2JSI+hkUMTGLjSMWBZKZKUsTV/RnDUJX9QNT1kyo9eFq3cIq2DhI9T4B
         q2Iqyh41DkZxNEISb5V9m4qfUZbYyznmkLzZKqzSaF+BJBZMKl38pRvWeuFqXDzGkCFN
         d6TJtHMstiDlcGkzxk3nBUxolqTj+bY+TDYEfkSp+OR8kRGzPE6uH6l4eKdpPKLFIiV6
         kmpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770721205; x=1771326005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfSBwZ5L6uqnAzvcQ05vMPY2K5kDs14EhIIFhtKNvQM=;
        b=IB5Zvk76VicVMOwP5OTF/oc7e2kErV3U3/Z8I2dJzS8UzMScFyV6fILwusyIvugkAi
         bsYQlBd7/VZYsx2dxt1iCQAo3DTZOLJA4ls+e4a/xV+oqCA0SXmFfwLoy0YY8OtfV0BX
         lunMzkjiHvk5lqRF427yB+uAP8t4ARoplWh7XfzS5GNfJkQq9/sGj4VKAdOfpthtJ/J4
         xCKB9g27f1mJHwljbsZ8zJzZ6LaZz/LIKQzstixgGD8SlfVJI71D6aHpcEMFUbbKKjoN
         ScE4W6gNG9wLGZarv4lah+ED/DPqrQm1hx29hCqfLlxaWMP5jQwWo6VJDV/bcOFa8Pwu
         j9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770721205; x=1771326005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfSBwZ5L6uqnAzvcQ05vMPY2K5kDs14EhIIFhtKNvQM=;
        b=KucyEsEzLdXJR8CsHQp/SW/RrCc8ymO8TITBQtReu4G2f2utOvddXD5FfNXKtagJgL
         iGj5dYCgujwvl/puarIT1IyBFOp8Jl4Z5aGhkq9zsZOJzO0XWMBtyY9jlLy2YkJyKEa8
         nUy+x3VjDcY/TXEYhRhcwt4JwabErhbYZokQkWhs4l9Vy3skYlzLkQDJ8aw5JU3+6j8Y
         /dFeeu7WM/mwEgKGCq+joR8/gm2M2anju1y7oXl/RGlkvcBshS+mKylys63+P8OsKnWQ
         1GxaPgsr4e0LYng9XeUnJLlgy3uiKXeIaVa2s+31e3/uzsD4wzYyTh0aQ28XvJVKmXdf
         x3Og==
X-Forwarded-Encrypted: i=1; AJvYcCXEk7PY9WlnU27TvUhBJx+QL9GlVS1Paame10TmUjHyd4qNvqC0Fga1EndKRKHiMwcGKVbgV1ajY9ym@vger.kernel.org
X-Gm-Message-State: AOJu0YxZiaAxRwUo1p3k0cXAOWmYyjSeFE4AOJZcigtH/jv2+zH1SVde
	ThX5hhCMaob5CYVwYOfpuT/3N5zQ7/THt6cp10GxFWNKtMBAZ/gNjMldTgHv49xD4g0XknY5pjP
	XC8ugWc+hDCiBjEs4y4lyvNjH/cYr5+c=
X-Gm-Gg: AZuq6aJAlRivWqEKWMsJak7Cw4ZQvkset7KSJFEQAD2je10aZ0lDqPKWsnRdpXha9XK
	qcrtIfKdaKcDcgr3aG3ew8I2QW7P0IqOQwFtDptyPGprOUDdrDhtxnZJOT4LvM0xAhhYoSy2upn
	WlaghgL4s8ftgLkQY+2aHM4jeAc3HI88U6rzzpOeux8k0siicM3gUS4DU0fkW4gx72Ym+psvpFx
	aotlC1yi//YQSSrOB/FrkzhoVSLvd99OWZedjpfTkG5rw4D8MHBYWgurOFy0Ss0B2PL0uwRwI9n
	4sjlqEOl
X-Received: by 2002:a05:6000:22c4:b0:436:38a7:b486 with SMTP id
 ffacd0b85a97d-4377a5021c6mr2312017f8f.8.1770721204589; Tue, 10 Feb 2026
 03:00:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104407.116426-1-clamor95@gmail.com> <20260209104407.116426-4-clamor95@gmail.com>
 <20260210-sexy-grumpy-sambar-44edd2@quoll> <CAPVz0n3fizf=r58Fr4YQ6pnjHq5p-7yFz95obss6w6x0bfgnDg@mail.gmail.com>
 <d1973810-d3f5-4ed7-ba0f-6bf93c1c7f3d@kernel.org>
In-Reply-To: <d1973810-d3f5-4ed7-ba0f-6bf93c1c7f3d@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 10 Feb 2026 12:59:53 +0200
X-Gm-Features: AZwV_QjgDJzQTiiKU4SQZozTCvRGlQSh-OCg1lxd7C4cK92P8FnftCEFnLl9FiU
Message-ID: <CAPVz0n1foyy9g7MAurSAyLCUHTzrPPu0ceqy9YpcDA9uzgjGng@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: mfd: document ASUS Transformer EC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-6921-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8762A119EB0
X-Rspamd-Action: no action

=D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:48 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On 10/02/2026 10:37, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:22 =
Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Mon, Feb 09, 2026 at 12:44:01PM +0200, Svyatoslav Ryhel wrote:
> >>> Document embedded controller used in ASUS Transformer device series.
> >>>
> >>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/mfd/asus,ec.yaml      | 152 ++++++++++++++++=
++
> >>>  1 file changed, 152 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/asus,ec.yam=
l
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/asus,ec.yaml b/Doc=
umentation/devicetree/bindings/mfd/asus,ec.yaml
> >>> new file mode 100644
> >>> index 000000000000..1d1a62761b71
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
> >>
> >> EC do not go to MFD, but to dedicated directory (there is such).
> >>
> >
> > Noted
> >
> >>> @@ -0,0 +1,152 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mfd/asus,ec.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: ASUS Transformer's Embedded Controller
> >>> +
> >>> +description:
> >>> +  Several Nuvoton based Embedded Controller attached to an I2C bus,
> >>> +  running a custom ASUS firmware, specific to the Asus Transformer
> >>> +  device series.
> >>> +
> >>> +maintainers:
> >>> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    oneOf:
> >>
> >> Drop oneOf
> >>
> >
> > Noted
> >
> >>> +      - enum:
> >>> +          - asus,ec-pad  # Pad part of Asus Transformer
> >>> +          - asus,ec-dock # Dock part of Asus Transformer
> >>
> >>
> >> Compatibles are way too generic. "ec" basically means you document all
> >> Asus EC, which is for sure not true. You need specific compatible for
> >> this specific model.
> >>
> >
> > Asus were not so generous to provide more specific data, they call
> > there controllers asusdec and asusped in their sources.
>
> Look how other ECs are called. Your device is not "", but e.g.
> "Transformer".
>
> >
> >> Missing blank line.
> >>
> >
> > noted
> >
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  request-gpio:
> >>
> >> gpio is deprecated. gpios, look at any other binding.
> >>
> >
> > noted
> >
> >>> +    maxItems: 1
> >>> +
> >>> +  asus,dockram:
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +    description: I2C device used to access power related functions.
> >>> +
> >>> +  asus,clear-factory-mode:
> >>> +    type: boolean
> >>> +    description: clear Factory Mode bit in EC control register
> >>
> >> Why would this be a static/fixed property over lifecycle of all device=
s?
> >>
> >
> > Specify pls.
>
> Provide rationale why we need to clear it every time, not once. Or any
> other rationale why we would accept that property.
>

Cause it is done by original Asus code and Asus did not provide
schematic or any data apart from downstream source regarding this EC.

> >
> >>> +
> >>> +  battery:
> >>> +    type: object
> >>> +    $ref: /schemas/power/supply/power-supply.yaml
> >>> +    unevaluatedProperties: false
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: asus,ec-battery
> >>> +
> >>> +    required:
> >>> +      - compatible
> >>> +
> >>> +  charger:
> >>> +    type: object
> >>> +    $ref: /schemas/power/supply/power-supply.yaml
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: asus,ec-charger
> >>> +
> >>> +      monitored-battery: true
> >>> +
> >>> +    required:
> >>> +      - compatible
> >>> +
> >>> +  keyboard-ext:
> >>> +    type: object
> >>> +    description: top row of multimedia keys
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: asus,ec-keys
> >>> +
> >>> +    required:
> >>> +      - compatible
> >>> +
> >>> +  led:
> >>> +    type: object
> >>> +    additionalProperties: false
> >>> +
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: asus,ec-led
> >>> +
> >>> +    required:
> >>> +      - compatible
> >>> +
> >>> +  serio:
> >>
> >> All of these children are pointless - no resources. Drop all of them,
> >> it's btw explicitly documented rule in writing bindings.
> >>
> >
> > They are all needed to be able to disable them individually from the
> > device tree if needed.
>
> They should not be disabled from DT, so they are not valid here. The
> given EC for given device is fixed/static. Does not change.
>

Have you considered a possibility that function may be
disabled/unrouted within the controller. By the vendor.

>
> Best regards,
> Krzysztof

