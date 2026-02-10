Return-Path: <linux-leds+bounces-6915-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAkcA3j8imlyPAAAu9opvQ
	(envelope-from <linux-leds+bounces-6915-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 10:38:00 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9E118F67
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 10:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE276300AB1A
	for <lists+linux-leds@lfdr.de>; Tue, 10 Feb 2026 09:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914D534106D;
	Tue, 10 Feb 2026 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL5CIkkK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF6340280
	for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 09:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716277; cv=pass; b=H3rXXcZQGcQKVlA1wKdabMMrdQW3Cfv6GNN1Kj0v1OCgibnEDnflnbV7gFUqXCKlI/A9NLEGpiWIFgBKABFQqTyY8o4mWojlaYmdqT0Xwlhg9QMVJ+tBV70xePNGvBy5GimyGy3ooAGOFGpQyRa7doDg2d1/5affx3TKINNzzpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716277; c=relaxed/simple;
	bh=7DIMjFeeo3eAla/lQXJGSagwHaW1sDqxPorzkJ5QBmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yx/h912nWcqOdmliyC74pE6bEQi8ntvGHy/kfVBRPxHBHBh+XwlyC0jXZlmPyl51aXkgs5bKhNSO+E0V2Uw19CsHxj9IRDKdvJKHEwmvFIdVqVqY91nNEt/goT7MhCMLuA23MN2OZgoBW7O3ZUqCdLWG6/Vo/cW3YBS459Z2eKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL5CIkkK; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43591b55727so3411359f8f.3
        for <linux-leds@vger.kernel.org>; Tue, 10 Feb 2026 01:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770716274; cv=none;
        d=google.com; s=arc-20240605;
        b=APAtLGLCK5i7AZLmliz9BvKRPbokt5U/dyfRIq/VKkO+YdTW+VQsZNah9gVOC683LU
         tWtZhDWlKOCe9MULmXK/MrYLXodSFGaRc4fTY9eQanlhNb6jW6QHPmO0l2mnQJzX07RV
         4u/uEo3O55JCFdKbCguhAlWif1vAaWcIlHaarGrI2w7DLfdC+oe0//RngsgP9k/OiYqP
         cGy3FGq6rbvLRG2ktkGTUWblIfTfqJ+LkHhHiUqPew9CcDCD34EP2ggBMzEMUA803Cxw
         BcPXrxd1hwfFrkGvbM4xXRwQO+Pclrpt4iGGs0uw5+oyu7qdUBmTNXzDF20jt2cHrTkj
         5Hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u9Y37ln8xuGFDWitJXwAsleyIOk7cbpvtjoxWooyXWE=;
        fh=+0FrCl3ro/yTnx6MKfuEciEVq0evFf7DiWZKUM9g6H8=;
        b=QqfKae0qb1enx/d1Ch3zWmMosWfhQtEPSOGA3Vc5bL4fsvVK+DIQ2T4Ra9dsUEp7Jy
         4o+Sd0iZJma6Tc2QipVVxZyna5BJFBRVDRc45WvRMOGuPREExvHvA6z4Wzbi1x1Dq8lQ
         Ss8kGQijG8wr36h5QvoJXO1wub4+y4CObT28DphB+qKubadq3jeOQFjet+OJIFsfZcmt
         i4zw20KmEYq6dSpjgQkdMh1uoXp3AJWKMk0qbwtDPZ2L43NqNdqHWHB6VigNo3F93bA9
         s+Wws64L2X4GQSItCJOf+zp1l4BdiRSxPX1HuHSnxuBYcLYpVJs9DSKBwqNjb5o+wn++
         6EnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716274; x=1771321074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9Y37ln8xuGFDWitJXwAsleyIOk7cbpvtjoxWooyXWE=;
        b=CL5CIkkK5e2UxEC7ncV9OTJi2bZl+QdhePyt+67TuSigo1gDjCyMbV7q9S3UPR9/3K
         55KqN1UTcCBw8Fg+3njGkLNfZTuWEhfQVmkeyOaXOwdMlop7uV1/SpA5I9u2KQV0CChN
         wb1QOKo6OO6hpbkrETmxdRE0W3jd7Xe/kTpUA3pQuG0R3CMma4UJXUo512OYyOcl/rV7
         m317H8PGsd+So0hcIwnESjlK2yRB3idQYtx3+ntJ77oHK3hvWIlZJPlviimoIHNLSJTr
         qj3vkqD0Cirj/mvNz8tOSpkpuGaEFef7snlEMPmUaXuCtv94eWS64RcBZyIn0L2/+eld
         Eyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716274; x=1771321074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u9Y37ln8xuGFDWitJXwAsleyIOk7cbpvtjoxWooyXWE=;
        b=uOBrh8ABjjqvU9d+iIwfl1UHbo60MqzZoTlV0dMaRDd76QyCIAg29Jd5/brz0kk1sx
         rEg8NBFCrWkVa3PKsfUHLWLtI2bDKt7NgstOxPgqoCM0SruVpUOFWKqanUE3pJC8F2wi
         UllGDfLs2RMiiTYLOz8n4GxdZWwAa85oAjQPRH5NO+t0+YOFEzHwLZ9PY1asRWInHELT
         hug6o2ifKFPruMEKk4KYXBMSok5NC/S01xIs2D48PFLliWHLIW6K7OfyUcYEDTMa72Yg
         okQ1TIFnX2ItQ2rl7HKdokWHmCIHUh2AT4sjCXiSneyMZw0W0GTZzpBQ4RSr3a0qp/7E
         UOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvmgfM0D1/FDB8ivVcqDcfIScAPxzupHMRn/+KAmIo9CqdncmCv2BBeeIaiNWJyUgo2/cLwtSoF5vg@vger.kernel.org
X-Gm-Message-State: AOJu0YztMhTk+b51e/gVzaY8uq/qa3dqiOxAb31jb8dgLhtxEXK/Lbbc
	XX5/xkBFyFSWc6sWcKPerdOdT22ST73rKv5PRvrwWC3xEhnk0S0w+wlasPtkajhccyuMfGKr+6Q
	6b8oLUb1kvC5q9+78+ryZjvat7IkB7uU=
X-Gm-Gg: AZuq6aK2IqGqGaZi9957gDq7hxU2g3TKiuKZC1eBkM7FMcqKWAryfoKPHM6hVfLrwcs
	gH2uYg/LAVBknPyQqOqcuxl/fm8UXSJr1hlX75T7fo1s9M7XoAg7jAeff+ZImsvVx6+KM9fgz2N
	nQKo8NeP5p/sW1AupQusDaKgpeEA+7G4LKQVQDIQJLAs/3+SaaqAWGZcfImCHilW/TUPQmjL+P5
	bh+oX3SEJcr75BnF/ELVgUJU6+1p0wiwlOWM47JSahQRNZCv/37PI8y8rkqDpzmRVO4f6qpL+fV
	biDKjl2bdpRqi+vFSXQ=
X-Received: by 2002:a5d:5f88:0:b0:435:8e14:9877 with SMTP id
 ffacd0b85a97d-436293b11bcmr21266056f8f.60.1770716274221; Tue, 10 Feb 2026
 01:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209104407.116426-1-clamor95@gmail.com> <20260209104407.116426-4-clamor95@gmail.com>
 <20260210-sexy-grumpy-sambar-44edd2@quoll>
In-Reply-To: <20260210-sexy-grumpy-sambar-44edd2@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 10 Feb 2026 11:37:42 +0200
X-Gm-Features: AZwV_QgL826wb_3IChyEYnKxPyG1ZElirm7op-wvlPZ1EK88mg4sg0InNYKSJlk
Message-ID: <CAPVz0n3fizf=r58Fr4YQ6pnjHq5p-7yFz95obss6w6x0bfgnDg@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6915-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url]
X-Rspamd-Queue-Id: 99C9E118F67
X-Rspamd-Action: no action

=D0=B2=D1=82, 10 =D0=BB=D1=8E=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:22 Krzy=
sztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Feb 09, 2026 at 12:44:01PM +0200, Svyatoslav Ryhel wrote:
> > Document embedded controller used in ASUS Transformer device series.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/mfd/asus,ec.yaml      | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/asus,ec.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/asus,ec.yaml b/Docum=
entation/devicetree/bindings/mfd/asus,ec.yaml
> > new file mode 100644
> > index 000000000000..1d1a62761b71
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
>
> EC do not go to MFD, but to dedicated directory (there is such).
>

Noted

> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/asus,ec.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASUS Transformer's Embedded Controller
> > +
> > +description:
> > +  Several Nuvoton based Embedded Controller attached to an I2C bus,
> > +  running a custom ASUS firmware, specific to the Asus Transformer
> > +  device series.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
>
> Drop oneOf
>

Noted

> > +      - enum:
> > +          - asus,ec-pad  # Pad part of Asus Transformer
> > +          - asus,ec-dock # Dock part of Asus Transformer
>
>
> Compatibles are way too generic. "ec" basically means you document all
> Asus EC, which is for sure not true. You need specific compatible for
> this specific model.
>

Asus were not so generous to provide more specific data, they call
there controllers asusdec and asusped in their sources.

> Missing blank line.
>

noted

> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  request-gpio:
>
> gpio is deprecated. gpios, look at any other binding.
>

noted

> > +    maxItems: 1
> > +
> > +  asus,dockram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: I2C device used to access power related functions.
> > +
> > +  asus,clear-factory-mode:
> > +    type: boolean
> > +    description: clear Factory Mode bit in EC control register
>
> Why would this be a static/fixed property over lifecycle of all devices?
>

Specify pls.

> > +
> > +  battery:
> > +    type: object
> > +    $ref: /schemas/power/supply/power-supply.yaml
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: asus,ec-battery
> > +
> > +    required:
> > +      - compatible
> > +
> > +  charger:
> > +    type: object
> > +    $ref: /schemas/power/supply/power-supply.yaml
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: asus,ec-charger
> > +
> > +      monitored-battery: true
> > +
> > +    required:
> > +      - compatible
> > +
> > +  keyboard-ext:
> > +    type: object
> > +    description: top row of multimedia keys
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: asus,ec-keys
> > +
> > +    required:
> > +      - compatible
> > +
> > +  led:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: asus,ec-led
> > +
> > +    required:
> > +      - compatible
> > +
> > +  serio:
>
> All of these children are pointless - no resources. Drop all of them,
> it's btw explicitly documented rule in writing bindings.
>

They are all needed to be able to disable them individually from the
device tree if needed.

> Best regards,
> Krzysztof
>

