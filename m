Return-Path: <linux-leds+bounces-5885-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EAC0C042
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 07:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 887614E5B91
	for <lists+linux-leds@lfdr.de>; Mon, 27 Oct 2025 06:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D152D77E5;
	Mon, 27 Oct 2025 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7bwThEk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3722BEFE1
	for <linux-leds@vger.kernel.org>; Mon, 27 Oct 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548350; cv=none; b=Ygp+Eq5UCZ9D0+jQ3CEjxHThPcbwSbMeC+zCYgk+xvp7JMikaMvIbuDvg6yQIvMSJx2/ei70eVpcNMDNX4lwRnVT7pMhuwdcGjxuw9G8tsRuxac985wdR0KDr896m5R+/W6U+eK2SJTGAVQ5FFLH5Ps+nRuOmKibqy0SvenAIZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548350; c=relaxed/simple;
	bh=yLiitsiaftwnng1FNqD31hBY5W7XwCrFjEgrC73eW6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGVzojBb6GkAODUeU6jx3j+9TsOGWlJxZWU4XZjSP1rj3QZa320GnsbqEQ2VVwPLWj9cLcwaIKw35FprX5uu6xkopRmbIjLTAw5E9A0EPC+Y8U8XIZ/DJkozurAU05OqlkVRGdgiMXzrH804aZsjjzbuUCBMpTKuQu0DDTj7hkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7bwThEk; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-63e0abe71a1so8474364a12.1
        for <linux-leds@vger.kernel.org>; Sun, 26 Oct 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761548344; x=1762153144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gORW6RzMgWR3pCXy5E9wgSn/fbVRWV9iD4rw/Tx62iw=;
        b=f7bwThEkW9kjmiTOYSGIJ71YsxMgBRGmTYslYhyophh2krXzvwXp8qHIKRkrkpkbLD
         7q9F5uxzBl4UQ7CUtSmqnniRTRYdT/9+EfU2X0mQTr81FJi0dtol+skzjwTlb4urZvdd
         M5ICewhXmhwOaOtpImVT695PADN6AycMZbVmzOoaBHKiJdyIgPU0+ziiMfZmXbpDgO58
         OxTL7+fxJtkaIWWF3oV2t5frp/gfN0rCaIIB5yFzx5Xm+GQ1QaIRAGVx5j40QeYvUjcK
         D+9n5DE06dB6NOdxtTUWtR0AuO9LRTLAS4Qq0J/QGJVxcQh25g/HuNkisdW5+ZhaHnJU
         1zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761548344; x=1762153144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gORW6RzMgWR3pCXy5E9wgSn/fbVRWV9iD4rw/Tx62iw=;
        b=ijYpxcJiK4WY5R2MIfiNVBlLep9A73x8lWD831/pquX8djiQd853WnyIAwukum+Urv
         mkkLcQpfbpeEILWwjt7Caz4/kwILKftcKQAK8fpzj0QO75HOwQOWS+zgg/QHf8y35+6w
         56HI1/nCxOMENE2a8BsD7BtAZXcWvXLWeigCg5SywZaus7SGaGQIvD826hKuJrQqtZ6+
         SyU2sPfGnGwoMDPd/FKz2e3dWcIuL73J8qRCIZV1EQbQZal2QD9ET+08BcMRu1bugETi
         Af9vMjiaY3d5aPA3airxvMXDCsoAJaED26ALAPwXPb56Q240cNWgpo6WLGJPpRKQSzra
         Pgeg==
X-Forwarded-Encrypted: i=1; AJvYcCU0tdiEjYKMAWd9fFpB4aLy+NqO8CLwabCQpOIE8NFOujiWDjHDkwhhv/qif1ZKhumKrlDUmROfUKz2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k9MmkTKANDB0CDxMpdEUm9e9iqXTCebgQkXldS+6yUBlerWy
	DbOlvIocUcX58mz38JwTAxi8baRGoNvYLpuQTHpgy5wERu9MCDpNPx29FELbGXtE6N29SU/J3Y5
	Ck1vqbIECIC+ZVOGgWX2yZ0uDzLo5/S8=
X-Gm-Gg: ASbGncsZlxsH/9QC1QjpGYC2hIV62ZgLa4J1oB1S3tT9zj3Au8IdbO8q8vtdxIFfl4I
	CiSNrjmNQ4+esBYbfjzjSZe42eKnOeWMtJ2Xpi1V/cP4ehSHcHlaAhTcju/aLXIG433+EypJoy/
	xC+5eS1rhsTWe5CuXhmTukhZGxvh2fx1+A+y7Qo1IfDWsdQtY3cmsx/gqdQ90WE3NXCVgIOvwbr
	hUsRr1wFwup+sR6J/f5UVnokkRIDDhd3bEdzAj91YVpTWepYIW67ogQUkFH08oHr+2wFL+eAWHZ
	WwL6XQ==
X-Google-Smtp-Source: AGHT+IGj1lyRw0Om+NZfHG7wsV5wmbuah2URTGrz7PyOIc3h8h8uykLzVDyCv3r2N4k1sj1rNHO4xIqOF9SGnYYISNI=
X-Received: by 2002:a05:6402:1941:b0:634:cb54:810e with SMTP id
 4fb4d7f45d1cf-63e3e586b6cmr12920258a12.31.1761548343474; Sun, 26 Oct 2025
 23:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-2-caojunjie650@gmail.com> <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
In-Reply-To: <c17c10d4-cc1f-46fd-8719-e7bb9ffa91ba@kernel.org>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Mon, 27 Oct 2025 14:58:51 +0800
X-Gm-Features: AWmQ_bn4pyB-a8JGS6VOEXrwwtzP__Kqn7eL_CWe8p8AnY7T1FRYBRpGwHrdOZQ
Message-ID: <CAK6c68gqHMR-FpH3MY9E_9R+V0J75V9zOii=x81e+bRcnBYOig@mail.gmail.com>
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

On Sun, Oct 26, 2025 at 9:48=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/10/2025 13:39, Junjie Cao wrote:
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  enable-gpios:
> > +    description: GPIO to use to enable/disable the backlight (HWEN pin=
).
> > +    maxItems: 1
> > +
> > +  awinic,dim-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select dimming mode of the device.
> > +        0 =3D Bypass mode.
> > +        1 =3D DC mode.
> > +        2 =3D MIX mode.
> > +        3 =3D MIX-26k.
> > +    enum: [0, 1, 2, 3]
> > +    default: 1
> > +
> > +  awinic,sw-freq:
>
> Please use proper units, see:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
> and other examples
>
> Same everywhere else.
>

ACK

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Boost switching frequency in kHz.
> > +    enum: [300, 400, 500, 600, 660, 750, 850, 1000, 1200, 1330, 1500, =
1700]
> > +    default: 750
> > +
> > +  awinic,sw-ilmt:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Switching current limitation in mA.
> > +    enum: [1500, 2000, 2500, 3000]
> > +    default: 3000
> > +
> > +  awinic,iled-max:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Maximum LED current setting in uA.
> > +    minimum: 5000
> > +    maximum: 50000
> > +    multipleOf: 500
> > +    default: 20000
> > +
> > +  awinic,uvlo-thres:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: UVLO(Under Voltage Lock Out) in mV.
> > +    enum: [2200, 5000]
> > +    default: 2200
> > +
> > +  awinic,fade-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Fade In/Out Time(per step) in us.
> > +    enum: [8, 16, 32, 64, 128, 256, 512, 1024]
>
> Why would this be fixed setting? This really looks like runtime, drop.
>

Yes, it is fixed. I am quoting this from the datasheet.
AW99706B provides Fade in/out mode to transform backlight from one brightne=
ss
to another or turn on/off backlight with a fixed slope. Writing 0b00 into
RAMP_CTR (CFG 0x06) to enter Fade in/out mode, and the the slope of current
transition can be set in FADE_TIME (CFG 0x06).

> > +    default: 16
> > +
> > +  awinic,slope-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Slope time in ms.
>
> Slope of what?
>

Ramp time in slope mode, it is retained from downstream drivers, it will
be more clear in the next version.

> > +    enum: [8, 24, 48, 96, 200, 300, 400, 500]
> > +    default: 300
> > +
> > +  awinic,ramp-ctl:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select ramp control and filter of the device.
> > +        0 =3D Fade in/fade out.
> > +        1 =3D Light filter.
> > +        2 =3D Medium filter.
> > +        3 =3D Heavy filter.
> > +    enum: [0, 1, 2, 3]
> > +    default: 2
> > +
> > +  awinic,brt-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: >
> > +      Select brightness control of the device.
> > +        0 =3D PWM.
> > +        1 =3D IIC.
> > +        2 =3D IIC x PWM.
> > +        3 =3D IIC x PWM(P-ramp).
> > +    enum: [0, 1, 2, 3]
> > +    default: 1
> > +
> > +  awinic,onoff-time:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Turn on/off time(per step) in ns.
> > +    enum: [250, 500, 1000, 2000, 4000, 8000, 16000]
>
> Not a DT property.
>

It is mandatory in the downstream driver, I keep it.

The following is the description about it,

If the value in ONOFF_CTR(CFG 0x08 [4:3]) is 0b00, the turning on/off ramp =
of
AW99706B is soft start and fast end. In this mode, the ramp time can be
programmed by ONOFF_TIME (CFG 0x08 [2:0]).

> > +    default: 2000
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - enable-gpios
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        aw99706@76 {
> > +            compatible =3D "awinic,aw99706";
> > +            reg =3D <0x76>;
> > +            enable-gpios =3D <&tlmm 88 GPIO_ACTIVE_HIGH>;
>
> Where are other properties from common.yaml? Looks like you re-invented
> some parts.
>

Sorry, I forgot it, when writing the bindings, I used ktz8866.yaml as a
template. I  should have dropped the common.yaml. This driver does
not require other properties in common.yaml.

Regards,
Junjie

