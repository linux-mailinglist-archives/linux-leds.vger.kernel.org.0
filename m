Return-Path: <linux-leds+bounces-5957-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D91C283BE
	for <lists+linux-leds@lfdr.de>; Sat, 01 Nov 2025 18:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF15E18909EB
	for <lists+linux-leds@lfdr.de>; Sat,  1 Nov 2025 17:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE42327AC2E;
	Sat,  1 Nov 2025 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHo98+zq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C012D244668
	for <linux-leds@vger.kernel.org>; Sat,  1 Nov 2025 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762016855; cv=none; b=Ae1weMkJMKnUlS28yqq4f46zmvDK79w4nbsHgwhM26DBVzXaxJVHb1xJKYK7/xXe/TgCt2LzyNJdebeGb5EhY1No94nbnImyv5V3tfQNXVy75gMH7oNd6nowg0bglSFxarV/dFR7n/9bxK0Vo5I/PlVv5SvE84sv8+sn+zdbwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762016855; c=relaxed/simple;
	bh=9PKLqVSpqbJZCM4LUPMSSnMa4TBcwj8ckL4x2FdwcsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDNfBrnYSI/G/eu1bF59WnYrnpp5R37hHPntc+e/eitsTbs6YneJRGQYwC6ZMC6OlQHB2FpMBwjiBkVTPU6eRNbcjW2Xs2TU2U9QwrzADGClLwxNpzy2Ux5c+inW5rnGcpTzaSqP692oZByiB/fi2ieS8iJdeSK1PfB8O5f3bDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHo98+zq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b4f323cf89bso741094666b.2
        for <linux-leds@vger.kernel.org>; Sat, 01 Nov 2025 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762016852; x=1762621652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwqU3yflKRW5oNlu8dwjZBgSW+w2OUOQ9FQXOEjEFOk=;
        b=MHo98+zqOSOa81bA4guxEBQ1cbvJn/YNc+pJWnhgzMbvThST2OAS+wex2X0Ueks21q
         rkjQBx5vXEx9TqSdyAmM5GYrk/aaGvmW828nYHX4e8gb64FPH3D5k66kXZBqgOCtzSAn
         JjYsu1+xjhJlZ0WpRnGDwdQuU6oIGXceFizXGsg2LuE8ATaOBAAv0CM+CHT4kPBhAI28
         DXRDk7dZ4AkP+XE2SfEPib8E/W0QKzS3GE4DddKqzzP1WlUXxLLiUkmz0FNkTVtsD45T
         EdBVE/3bC3asc8BZhM2oz8bTM8jcVouBofeUiUQmJKQga/1uS08vAGRt7RSBuHCaNGKD
         rd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762016852; x=1762621652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwqU3yflKRW5oNlu8dwjZBgSW+w2OUOQ9FQXOEjEFOk=;
        b=H5GvpCstiqknSgORk5FdBMtvHtxxcc3Gx6qoFwLNELUOnj+8cleA9WFxeNjTSZCxme
         NyiJLHJ7xhE3Dkd/JBl3xHqlZD92vsajBfJX0Uo2J1T7v16y92hCbn8ic1MP/6fxHjHe
         hC3R1Jpm+4AUy7oOFwZIRY2KKfPcmTK+WxflCKRlvxj3+VhmJnc7wVHMjcZyIjNXvpqj
         2KqYzglXdwiGWlQLMJe0I0l04nWclyxN1b6ka72dEuMX0rI2Lo2mEzIY6DiPO9PNMYtR
         S1xUpmSny5hKn8jQpilgi8DpZ+YqrCzKRag9qv+8qRozxWh64TXcHij6LQsEyJDWbp9f
         K5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ckMco+zdixWkVV+cOh+mF2KDE3dw9qzvIjnVqEw4UYafKaTdxBp2ePohFAMdaLik25jh5U0iAxY2@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJJGy2Dk/VXRZALDihPShIKZtv+n3AH8HyJIQ+0k1J7mesHMj
	rOJEcI1pvh109hZ4pLpvFxtq/XhkqUHMlotcjoKvbe7+x8xvbMuiDxkOPdV/Nv2Uak6UntS7eTD
	o9HEVKL22xIiKaL2vbzggrVx9G8fewrE=
X-Gm-Gg: ASbGncvRfXxRqiRLKFfCxbIUjjJBV0oMlUiqVWaIK+LBoB6DcailhHLsgZ0mTldAgR6
	j89Gyf0j38PxBHOn/2T+ntLN4D5NAdYiBGLLZ4KAvxBY18bBcO08BOpMAT6TAnrasX21P0t9zES
	Jx18KRad2jgK0zImN24Xyy6ameiIZt2E+KP/HBKkfSJgcXe6NuTScU/BhL0IaH5a/PhW7UxpTR8
	XbUAgOFY7bd6P9EUlkIxEhPr9K9Nb3Q+O9NsAo/LThLMokzoU69xXKWiuc=
X-Google-Smtp-Source: AGHT+IGIlqSDf+EXTXyrGJ57kthTyg/wYcJhKTwOBBUkRF0PYtYHzhxvKOPRUBbMMuqTOOiN++zzRQYKu4gUy0r7nQs=
X-Received: by 2002:a17:907:7f2a:b0:b57:2ffa:f17e with SMTP id
 a640c23a62f3a-b7070132a9dmr778193366b.19.1762016851893; Sat, 01 Nov 2025
 10:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926141913.25919-1-jefflessard3@gmail.com>
 <20250926141913.25919-5-jefflessard3@gmail.com> <aQSEWGg50VHIECoM@smile.fi.intel.com>
 <B4CFA18F-CE12-4257-AAD0-FA9B744A1E29@gmail.com>
In-Reply-To: <B4CFA18F-CE12-4257-AAD0-FA9B744A1E29@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 1 Nov 2025 19:06:55 +0200
X-Gm-Features: AWmQ_bnnewjUkrk43oqtm7eYsVsIg2AkzJTKhqnM9WyLndyacL6QFEAoC2l5gV8
Message-ID: <CAHp75VdaPVcKhLSCOiUw+0cqNq6pkxZqVpd2Bk-q-9dNV=+kqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	Paolo Sabatino <paolo.sabatino@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 7:17=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
> Le 31 octobre 2025 05 h 41 min 44 s HAE, Andy Shevchenko <andriy.shevchen=
ko@intel.com> a =C3=A9crit :
> >On Fri, Sep 26, 2025 at 10:19:05AM -0400, Jean-Fran=C3=A7ois Lessard wro=
te:

...

> >> +static inline void tm16xx_set_seg(const struct tm16xx_display *displa=
y,
> >> +                              const u8 hwgrid, const u8 hwseg, const =
bool on)
> >> +{
> >> +    assign_bit(hwgrid * display->num_hwseg + hwseg, display->state, o=
n);
> >
> >Do you need an atomic call here? Perhaps __assign_bit() would suffice,
>
> Keeping assign_bit(), it's required here. Two distinct concurrency scenar=
ios
> exist:
> - Bitmap: Multiple LED triggers (network, timer) + userspace write to
>   display->state concurrently -> need atomic ops
> - Hardware: Mutex serializes different hardware operations (flush_init,
>   flush_display, keypad polling) that can race
> The mutex doesn't eliminate bitmap concurrency needs, they're orthogonal
> concerns.

Okay, but the below bitmap_read() is non-atomic. And in general the
bitmap API is not atomic.

> >> +}

...

> >> +                            ret =3D fwnode_property_read_u32_array(ch=
ild,
> >> +                                                                 "seg=
ments", segments,
> >> +                                                                 TM16=
XX_DIGIT_SEGMENTS * 2);
> >
> >> +                            if (ret < 0)
> >> +                                    return ret;
> >
> >Why '< 0'? Here it's definitely not a counting call, so it should never =
return
> >positive in this case.
>
> Keeping if (ret < 0). While usage with non-NULL buffer won't return posit=
ive
> values, fwnode_property_read_u32_array() documentation explicitly states =
it can
> return count when buffer is NULL. Using < 0 is the defensive, API-complia=
nt
> pattern that matches the function signature.

Okay, it's fine to keep this way.

...

> >> +                            ret =3D fwnode_property_read_u32_array(ch=
ild, "reg", reg, 2);
> >> +                            if (ret < 0)
> >
> >Ditto,.
> >
>
> As per above.
>
> >> +                                    return ret;

...

> >> +    INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
> >> +    INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
> >
> >devm-helpers.h have something for this case, I believe.
>
> Cannot use devm_work_autocancel(). The shutdown sequence requires specifi=
c
> ordering: (1) unregister LEDs to stop triggers, (2) clear display state, =
(3)
> flush pending work, (4) turn off display. This sequence prevents hardware
> access races when triggers attempt to update the display during removal. =
Manual
> INIT_WORK with explicit flush/cancel in remove() provides this control.

Do you mean that the removal order is not symmetrical to the probe one?
At bare minimum this needs a comment in the code (as summary above) to
explain why devm_*() are not being used.

...

> >> +    main->max_brightness =3D display->controller->max_brightness;
> >> +    device_property_read_u32(dev, "max-brightness", &main->max_bright=
ness);
> >> +    main->max_brightness =3D umin(main->max_brightness,
> >> +                                display->controller->max_brightness);
> >
> >Hmm... Why 'u' variant of macro?
> >
> >> +    main->brightness =3D main->max_brightness;
> >> +    device_property_read_u32(dev, "default-brightness", &main->bright=
ness);
> >> +    main->brightness =3D umin(main->brightness, main->max_brightness)=
;
> >
> >Ditto.
>
> Correct for unsigned brightness values. umin() is the appropriate macro f=
or
> unsigned types to avoid type conversion warnings.

But are you in control of all the variable types? If so, why not align
the types?

...

> >Given a comment about propagating fwnode, why do we need all this? Doesn=
't led
> >core take care of these properties as well?
>
> Manual handling is necessary because:
> 1. default-brightness: Not implemented in LED core

Oh, indeed, I mixed this with default-state. But the side question
here is what prevents us from implementing it? I suspect there were
discussions in the past, but I haven;t dug the lore archive to see if
any indeed happened.

> 2. max-brightness defaulting: If DT property is absent, default to
>    controller->max_brightness
> 3. Ceiling enforcement: When DT property IS present, clamp to not exceed
>    hardware limits (controller->max_brightness)
>
> LED core only reads max-brightness optionally, it doesn't handle defaulti=
ng or
> hardware ceiling enforcement.

Yep, thanks for elaborating.

...

> >> +            ret =3D led_classdev_register_ext(dev, &led->cdev, &led_i=
nit);
> >
> >Why not devm_led_*()?
>
> Intentional non-devm design documented in commit notes. Explicit unregist=
ration
> before removal immediately stops LED triggers, preventing them from acces=
sing
> hardware post-removal. devm_led_*() would require complex brightness call=
back
> state tracking to handle trigger activity during remove(). Explicit unreg=
ister
> is cleaner and eliminates this race.

Right, so I think the summary of this needs to be commented on in the
code (as well).

...

> >> +    ret =3D linedisp_attach(&display->linedisp, display->main_led.dev=
,
> >> +                          display->num_digits, &tm16xx_linedisp_ops);

> >If we haven't yet devm for this, it can be
> >1) introduced, OR
> >2) wrapped to become a such (see devm_add_action_or_reset() usage).
> >
>
> While devm_add_action_or_reset() could wrap linedisp_detach(), the overal=
l
> shutdown still requires explicit ordering across multiple subsystems (lin=
edisp,
> LEDs, workqueues, hardware). Using devm for just one component while manu=
ally
> managing others adds complexity without benefit. The current explicit app=
roach
> keeps all cleanup logic together in remove() for clarity.

Okay, I need to have a look at this again when you send a new version,
but I want to finish reviewing this one. Sorry it takes time.

--=20
With Best Regards,
Andy Shevchenko

