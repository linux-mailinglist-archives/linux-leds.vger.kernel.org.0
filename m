Return-Path: <linux-leds+bounces-9080-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PFhYN9Y6Vmp31wAAu9opvQ
	(envelope-from <linux-leds+bounces-9080-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:34:14 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC6475531F
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 15:34:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=egSKewjS;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-9080-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-9080-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DACA2315F1E1
	for <lists+linux-leds@lfdr.de>; Tue, 14 Jul 2026 13:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C493859F3;
	Tue, 14 Jul 2026 13:27:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111CB34AB00
	for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 13:27:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035643; cv=pass; b=fntKKSwcKPhfYlPEBBP2F5xL9i+ogcKStk0oigTCtaYCWlIfdaJcDc1iDKQMY6pcyYWo4vpMlWYt4utxRZ64vjH9HQRTvXhWfHO+oUdlzbzQOcPceLO2ls8wOa9O77iwn9NX0bSZbyy4PB62nio26gAbKbxpTdRT/aCsKx4HTuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035643; c=relaxed/simple;
	bh=Hqx+/2gwUQf5oktWMVU1iaI86zBAPEpohyRmf9hMejs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDGmVzPsBx7VJwTYOzDd8viyav0gYsjfekBUToqayzdVwEKRTkvQHmcIEP4NGfxOPOvwcLCEyxWG6KKMNsW59Zw+9CORD3HIx9uSgyUKq+fU7R2RqHGRAi0ex6QGnja6b5KOkFA8I/nXIH+WwXER4mfKYcoK4iyrOlvQa5ixol8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egSKewjS; arc=pass smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so913367a91.2
        for <linux-leds@vger.kernel.org>; Tue, 14 Jul 2026 06:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035641; cv=none;
        d=google.com; s=arc-20260327;
        b=pa1y42/km8PAhw7K5u2C+Qm51mn/7rReDLv8fJsKmmnJsOkEeuWyPepb8aRvn4MusN
         Tf6IwNdZh5QuICjK/UoL6+2gzDmRtCAAoRRqhacT01anIDmaCsN6BMHtiabAZPR53U1i
         Na91rpC8c21ICnoN3NNqvlIilWmxUd+RGEOwIblkA0vrIKiaceV55ZtgL2yI8QKooNYJ
         ZikeE2R3irRO3TvKrlgYmvEXtI3v8RHh5u5rSwAzZWZdQBqfGHoXmdRr+Tql1FXL7zOz
         oqAhII+m7GLJgCV7RlCp1wWm2hdPqnDV746zC0p86Q0eImgTHkoRQm6kclEDKxEY8VhU
         vPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        fh=YAuW3MkWbVjR3IdtTXi31MzrSl19ymBXgoLLR0C4eUA=;
        b=Kw6y/N32rvlx3ClTUfg5YeUBVrGEQnXAjxCssk72a1vDVwgpwWg3kLXcmQ2Z9r7EW/
         S0OJQpeHAzS4UDYwduPgx/9Wn2FzoXFxtJjRiTgB4Ah0bd3RrTr7SJkBpBu59g9wNfPO
         RNOXFLK+n8OasPkBa4TRabL1lcDe9Awg1Gi/qYF3Y+m8ehjHuAMHZ9aKzJPClJ/c3des
         lwiY+gqmXx7drxh5eF7RtB42es92bEs4j8ELsX5JhuAVTUptUNTj97FECdtkEnjmc0Wi
         nxC1voPLJqlnoUmo2dpGmabG9TipNmVTt3Jc5aBuqjh+N9yN7hBo7G9+2ztRbh5K4YBw
         vYyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035641; x=1784640441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        b=egSKewjSB9QKWsQQJRVJxdBUYM87L3b2NzHjTXY2e4Lyrhp2z86pdRrS8fcXMNTw3m
         EXgJDomP8VGJNhY6mFQX3GG4onLh2IeZQaS7sh1lgkvjgT2vWxMR/eICi0cUg8kz7xv2
         r5c9voSjZr145JyTG74rT2ZgPcvogC5asUowiQ+oum+MXEuQzsLme9xiAk28xOZruLIa
         +YMgud91p92rVOdeACWN8wzl7tVSMLbF2oYYaUdUrr/qqq88DJE4ZN5Ni1h7BTnQBNMM
         i2OG54H6DA//CUQ08xfVEiYxayqkjHU5Y+uzlQcbs9v61CbLoF8FD7MaKOJ9oij+Jcvp
         T+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035641; x=1784640441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSq/mUWM2YvpW32XDTn1fQtxRJbdlACjQCMNg3wpfiM=;
        b=Y3X+dJGrVkQ/CXMlwv6SfSZBMA395Pt1U5/SoR6jA4cbT3YhHfNLC+JJwr8KlvYcFF
         tjozJ7Y25R451TYHENI9IRrU1rG/6SoikqXzg8V+oEtDJmm7020lP821ETi/pNvUxvUU
         jeW6ME0Iaak25Qm4esaJA1Vbs801/ty+Wj/2CMrsNaDVWfX8G3n8Qz9S4PBrJiGRopVN
         91XJZC5/l28KDHHU6YPKETD9N0BqXYmi1W9/dGL9tDJeCzX+oGk4Grtuj9wWPimGYILn
         TokgenXNdfLoyXH1Vccp6eFJY6o9rB0vFrRyd95GVYtT89CnF9S262dry5PTHa+Igz7R
         qzxA==
X-Forwarded-Encrypted: i=1; AHgh+RpdWzSVt06mRSYLQ1OZgrKjwz8quCQgPLor343zpwYhTOM/AWufNUUACPnpXgjyBAafNGYqYmlsN/zI@vger.kernel.org
X-Gm-Message-State: AOJu0YxljJ0GiKXxtA9Il452QPVB4JCl0ONCVWls8/1IUGZXUFkPtKAm
	bZaexxChtV72MhITgjuez4bWHkaPhD2Lk2xBPVxnVlQrB7U4wb6JYGm/+DO+rSRfRG3fc3+Mn+p
	f3Mb6wYH9/ScUWAiUPkUzlXyL+qUf24k=
X-Gm-Gg: AfdE7ckUjTtaenyp8K0YsDGV5kcdqmnZmehjKfaPJqDcqHEG+ecNJL6LZ+YRwwxUDus
	FqEEpOI+Vh3cwBnAJkFqZXWoveKZBUFFa/t9HWl9Wzp5mPgWCqZWRIiy9Xl90N617HOeqbcxwYt
	UsOhxweAZb8+b/0l5/YspHZgerd0GVHzbIWQ8IuDc6vaktPNlgm+4NCPK60Tr0YjUkPPcOx79lu
	2QpvUOPMtSbgwOHdjDAG2IAm4+yP+uTS54769RGDItpcQyuQB3TnwkjEcLrGz1t8iRMOtzTqUR/
	Ejg337Xxz4JZ/wF9XTJpE1VqgddpEQ==
X-Received: by 2002:a05:6a20:d70a:b0:3c0:b55a:80ff with SMTP id
 adf61e73a8af0-3c11063d595mr14450342637.24.1784035641387; Tue, 14 Jul 2026
 06:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-2-clamor95@gmail.com>
 <akeFmMQ_S1Y18hlu@hovoldconsulting.com>
In-Reply-To: <akeFmMQ_S1Y18hlu@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 16:27:08 +0300
X-Gm-Features: AUfX_myw9KUnmAWsWcXDIJL61TlrVu8UIEI1kefy-2iSBs3h-OI28TD8pRQoND4
Message-ID: <CAPVz0n23=F2Q2fSJJx1E_mST2zhomKcvhKtOy-Af3aoq-pZ-Zw@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] dt-bindings: leds: Document TI LM3533 LED controller
To: Johan Hovold <johan@kernel.org>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-9080-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EC6475531F

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:49 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:18AM +0300, Svyatoslav Ryhel wrote:
> > Document the LM3533 - a complete power source for backlight, keypad and
> > indicator LEDs in smartphone handsets. The high-voltage inductive boost
> > converter provides the power for two series LED strings display backlig=
ht
> > and keypad functions.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Jonathan Cameron <jic23@kernel.org> #for light sensor
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for backl=
ight
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@36 {
> > +            compatible =3D "ti,lm3533";
> > +            reg =3D <0x36>;
> > +
> > +            enable-gpios =3D <&gpio 110 GPIO_ACTIVE_HIGH>;
> > +            vin-supply =3D <&vdd_3v3_bat>;
> > +
> > +            ti,boost-ovp-microvolt =3D <24000000>;
> > +            ti,boost-freq-hz =3D <500000>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            backlight@0 {
> > +                compatible =3D "ti,lm3533-backlight";
> > +                reg =3D <0>;
> > +
> > +                default-brightness =3D <113>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <0 1>;
> > +            };
> > +
> > +            led@2 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <2>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <0 1>;
> > +            };
> > +
> > +            led@4 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <4>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <2>;
> > +            };
> > +
> > +            led@5 {
> > +                compatible =3D "ti,lm3533-leds";
> > +                reg =3D <5>;
> > +
> > +                led-max-microamp =3D <23400>;
> > +                led-sources =3D <3 4>;
> > +            };
> > +
> > +            light-sensor {
>
> Doesn't the binding (or dts) checker complain about this node not having
> an address?
>

No it does not

> > +                compatible =3D "ti,lm3533-als";
> > +
> > +                interrupt-parent =3D <&gpio>;
> > +                interrupts =3D <80 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +                ti,pwm-mode;
> > +            };
> > +        };
> > +    };
> > +...
>
> Johan

