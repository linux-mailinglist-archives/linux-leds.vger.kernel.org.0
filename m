Return-Path: <linux-leds+bounces-5887-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B38E5C0CF6F
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 11:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9611A4E619F
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 10:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29926B777;
	Mon, 27 Oct 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd33ZkFi"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAAA1DFF0
	for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561042; cv=none; b=mgULNLGltF+qkhZGTtDdS2DQodFLxG6FtX/xmbdwBYmYh1jWHl+aumCckaXRTJOOKawoMkzOSQCdrcbyfyEsdORzCKeSAJLjo9WkOYAkCLDgRqo6U6STWmTefwy2yJk2REc5qcrnfW0pHLT1wD2X+RW8DOlPSzcz4cxkiMKlv+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561042; c=relaxed/simple;
	bh=SqZ0Ub745WWb3ZeyhwmiHZeS8d01xTOY/Qojh9ScUdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JeZmO17WxS4eEFB8Af3/o07y9HVLUdp4aqyB5eQ++aq+mBe5G+ICSKPouImTeeMj/+UilsZRCMiIFminyHdmqGS9p1t/Wl+mDSeyKxrfK+5Auw0KTGG0AZdpntZsPRsS5GLAM0UesHJP9+T4VstdomEd4DOAS82gJbR7eyovDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd33ZkFi; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so652603566b.2
        for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761561039; x=1762165839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+t/oTmZjxhzW3SWsg5D/3k7ryEIEHaxHipwLWpbI60=;
        b=hd33ZkFiXaYLiNJgs5vod1PJuWbeOcQHlPTdmM9XNSHMiGobxPQbFR1WJoaclcbOH6
         LmAq06mazq8ByagF6BVAoUodPtdWAiglBKxE67DFh6Jn5ecbZLUbeXabQgbWMRDk7ChE
         IfPqbChGH2kSAI0LKrU0kwfM9uodJp8DRQvP18IGFwwZe4WP0N/bhhg0MSif8t0CiY4W
         0Rw7R41AXT+f3TXhN3OGcvdlCHh07poD4DylE2vKLRAq1FLIFbkKHE6ZjoD3/+yED1sq
         +Oky2aKwK2QFgzJ7SAnAZGB7DJ/jbhni56Q7hvoLpeU/8SENae4PdNw6t9hG9Vyn//kG
         yXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761561039; x=1762165839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+t/oTmZjxhzW3SWsg5D/3k7ryEIEHaxHipwLWpbI60=;
        b=px76Pb+wPkxNiyqvw3CamDPRejYvHBEQWreV4LQv9bNMRZZKsUS/wxjCjMQjPJgcyI
         /yk1+OS8KMFD2+9uItA9vFgfWaZK0SkKHkq6YwEt6DxHAyctjQU98rmfOESt991kpfp4
         XpTgvef2DHnS5VEbp/yZX60ijGrVYD6mBRieiOP2oXcSmPQHNz/CUmYwP1ErOJDkXe2G
         Dj18QSpYA5bdwQa96gYlULvr9k4I4tE3wjU1mIwvw/T8kZJGhqwB6EPdmn9ntmt0Dg/8
         h1Ve22tMUBhEG5tq25WX8BYZsOezSynLzB7q2DNnbcDlnl0jCh74COnemZBfAY72Jh8U
         x0mg==
X-Forwarded-Encrypted: i=1; AJvYcCWVB8Qk49SPMOo20i4siJ4J78+fiSQNMmW7FIQr2nvzYjRUsVs7SebTHhrJL1aKdaQ2IhVb5+c+gVsp@vger.kernel.org
X-Gm-Message-State: AOJu0YwevZNQsGbGGeqANAF17LFJe4Xwy4mdReb9I5qETIwVCTbKLXDR
	KvL4r6qLVTIyLzd6sxpT8VfYaOwXcfAK1C/8KdgnnPKImqmCd8CZapsBd5/tyltbSNTpDOiqC4z
	Ws9sLdhNfXdTCRsw9chvI5A0JGwtq6Mk=
X-Gm-Gg: ASbGnctS9pIOEGDCUHkOjWNKPAE9sMWhg8vCxnGdttZt27Lka5mhLD1sN0qFBXPcZDa
	kEw4SixCg5WkegLxKep93PsageeaMKtGDxm4DzrHel/HTE9Q/44q1EsBzHZ1XSz8+9VQqdIqfHQ
	XK93ut4Fei1rfNBmyL8fj38nDTjXxM/l+cXjGIrWarox6nYgeEZGMB3gWEv2HAAle32i1kezh/0
	+1kimWGZL7tBMErOaa8+Wb9DaWmLjx8/z/8Tc2Srw+S1sM5n24uyd1R1YpixKm/MPhwYA8=
X-Google-Smtp-Source: AGHT+IHLxFJ3SPEDNoyMay98zhNlSRUKkyfFmuSirmfTIVuYNM52PHBBa3Zie8g2ZOnRY/ZMCMowauQRHmA5eHcm2CY=
X-Received: by 2002:a17:907:9448:b0:b04:626e:f43d with SMTP id
 a640c23a62f3a-b64751284f6mr3751346266b.47.1761561038573; Mon, 27 Oct 2025
 03:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com> <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
 <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com> <c32970a8-c1d1-4130-839b-981bca5373f3@kernel.org>
In-Reply-To: <c32970a8-c1d1-4130-839b-981bca5373f3@kernel.org>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 27 Oct 2025 18:29:01 +0800
X-Gm-Features: AWmQ_bmSyDTyEE0NzC1P6-5KqVAikLVF9X2J_Ed-gcKZn6A6nKVOVFcs4LVP9Cc
Message-ID: <CAK6c68iV2qUFEp_ujWwKYFmgt261rvQNK8Jo5Wjt-dCRbG_BVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99706 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 4:38=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2025 07:58, Junjie Cao wrote:
> > On Sun, Oct 26, 2025 at 9:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 26/10/2025 13:39, Junjie Cao wrote:
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  enable-gpios:
> >>> +    description: GPIO to use to enable/disable the backlight (HWEN p=
in).
> >>> +    maxItems: 1
> >>> +
> >>> +  awinic,dim-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select dimming mode of the device.
> >>> +        0 =3D Bypass mode.
> >>> +        1 =3D DC mode.
> >>> +        2 =3D MIX mode.
> >>> +        3 =3D MIX-26k.
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 1
> >>> +
> >>> +  awinic,sw-freq:
> >>
> >> Please use proper units, see:
> >> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas=
/property-units.yaml
> >> and other examples
> >>
> >> Same everywhere else.
> >>
> >
> > ACK
> >
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Boost switching frequency in kHz.
> >>> +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500=
, 1700]
> >>> +    default: 750
> >>> +
> >>> +  awinic,sw-ilmt:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Switching current limitation in mA.
> >>> +    enum: [1500, 2000, 2500, 3000]
> >>> +    default: 3000
> >>> +
> >>> +  awinic,iled-max:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Maximum LED current setting in uA.
> >>> +    minimum: 5000
> >>> +    maximum: 50000
> >>> +    multipleOf: 500
> >>> +    default: 20000
> >>> +
> >>> +  awinic,uvlo-thres:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: UVLO(Under Voltage Lock Out) in mV.
> >>> +    enum: [2200, 5000]
> >>> +    default: 2200
> >>> +
> >>> +  awinic,fade-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Fade In/Out Time(per step) in us.
> >>> +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
> >>
> >> Why would this be fixed setting? This really looks like runtime, drop.
> >>
> >
> > Yes, it is fixed. I am quoting this from the datasheet.
>
> Fixed per board.
>
>
> > AW99706B provides Fade in/out mode to transform backlight from one brig=
htness
> > to another or turn on/off backlight with a fixed slope. Writing 0b00 in=
to
> > RAMP_CTR (CFG 0x06) to enter Fade in/out mode, and the the slope of cur=
rent
> > transition can be set in FADE_TIME (CFG 0x06).
> >
> >>> +    default: 16
> >>> +
> >>> +  awinic,slope-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Slope time in ms.
> >>
> >> Slope of what?
> >>
> >
> > Ramp time in slope mode, it is retained from downstream drivers, it wil=
l
> > be more clear in the next version.
> >
> >>> +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
> >>> +    default: 300
> >>> +
> >>> +  awinic,ramp-ctl:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select ramp control and filter of the device.
> >>> +        0 =3D Fade in/fade out.
> >>> +        1 =3D Light filter.
> >>> +        2 =3D Medium filter.
> >>> +        3 =3D Heavy filter.
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 2
> >>> +
> >>> +  awinic,brt-mode:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: >
> >>> +      Select brightness control of the device.
> >>> +        0 =3D PWM.
> >>> +        1 =3D IIC.
> >>> +        2 =3D IIC x PWM.
> >>> +        3 =3D IIC x PWM(P-ramp).
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 1
> >>> +
> >>> +  awinic,onoff-time:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description: Turn on/off time(per step) in ns.
> >>> +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
> >>
> >> Not a DT property.
> >>
> >
> > It is mandatory in the downstream driver, I keep it.
>
> Huh? I don't care about downstream driver. Again, not a DT property. You
> cannot add here runtime properties and when, we tell you that, you just
> ignore our review.
>
> NAK
>

My apologies for the misunderstanding and my poorly worded previous
comment. I absolutely did not intend to ignore your review.

I mentioned the "downstream driver" only to explain why I had originally
included the property.

I now understand your point clearly. I will remove them in the next
version.

Thanks for your fast reviews and for clarifying this principle for me.

>
> >
> > The following is the description about it,
> >
> > If the value in ONOFF_CTR(CFG 0x08 [4:3]) is 0b00, the turning on/off r=
amp of
> > AW99706B is soft start and fast end. In this mode, the ramp time can be
> > programmed by ONOFF_TIME (CFG 0x08 [2:0]).
> >
> >>> +    default: 2000
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - enable-gpios
> >>> +
> >>> +unevaluatedProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +    i2c {
> >>> +        #address-cells =3D <1>;
> >>> +        #size-cells =3D <0>;
> >>> +
> >>> +        aw99706@76 {
> >>> +            compatible =3D "awinic,aw99706";
> >>> +            reg =3D <0x76>;
> >>> +            enable-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
> >>
> >> Where are other properties from common.yaml? Looks like you re-invente=
d
> >> some parts.
> >>
> >
> > Sorry, I forgot it, when writing the bindings, I used ktz8866.yaml as a
> > template. I  should have dropped the common.yaml. This driver does
> > not require other properties in common.yaml.
>
>
> I don't care about driver much, but anyway it should use common.yaml.
> Please read the feedback very carefully.
>

ACK

Regards,
Junjie

