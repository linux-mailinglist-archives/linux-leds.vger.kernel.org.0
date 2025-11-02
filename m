Return-Path: <linux-leds+bounces-5958-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA32C29317
	for <lists+linux-leds@lfdr.de>; Sun, 02 Nov 2025 18:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AF1A84E5E91
	for <lists+linux-leds@lfdr.de>; Sun,  2 Nov 2025 17:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627721F4169;
	Sun,  2 Nov 2025 17:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG0TWCOQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718382D9EEA
	for <linux-leds@vger.kernel.org>; Sun,  2 Nov 2025 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762103065; cv=none; b=h/AOkm9tkuwM4RQbcFZn5k5C6252iS1++8ws/q92KgeYDEdJDESSAFJ2eSx7Mo8V/sIOANZn+3rXxmcMvgmHT0levD9kPSKcX/wScos12U2HqNq5+Rve8Yqn2llDR340Ll6Hkj4LZwmNtld0p57IPLKZGZfuQNuAz+XVGSNs+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762103065; c=relaxed/simple;
	bh=vyQLJCtfjj2jEYkxlQugiaOJCaF8NeWmOQHI93urWZY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZLJq/o29GUjWIk6ClRa3b+YUshof9ci26AV0EW0v+FREmYEvxrFe+a9ssoBHB4L9r3lmFlzPtzZuXQCPRGHj6rFaAxzTp6jvgbjqXmNIY8bI8t4sharUb3+aQrc7IjqfnxyZbjnmIW816bFlgnTQ6eFCn7b1x2B/Po7p8TzASRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG0TWCOQ; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so42689486d6.1
        for <linux-leds@vger.kernel.org>; Sun, 02 Nov 2025 09:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762103062; x=1762707862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z3l5FabC6Wue+JyDseU2McmCU9WI5nFdYRwq6f0VfGk=;
        b=fG0TWCOQCexSGkklcbU/bT4S2d1edRxg3CNZlg7R+kOw4b9kuhehOerZRsCMjjsPCe
         T7cYWNyDcNM2q3zVfK3XZ0aL2WV7wG1+0RPPZAMN9KDEY+eTm4kOLBFutNrEQH56Fa9y
         KHPMCP4Q/nS0j8BBQ1eY8vXOMU5+99BTYuYV+P+MGsC1wMJWvXoIeO3j/6LiuwtN16au
         9Om3d1CweGF0HYilMN0c+/vXF9cw5hFF1lWEzaWk1k9t3C6SRcLDzKEtyuyLpFcElK9s
         g1sK1yc1uuwhgH6M2+/3rt0dVmqxVUAcynThJe3RbVuHnKJTsLvYXxxld/tYWSoF8002
         l5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762103062; x=1762707862;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3l5FabC6Wue+JyDseU2McmCU9WI5nFdYRwq6f0VfGk=;
        b=ML/9qnd/0xT85BeisgtBEHzodrI9gXPoYy6DjxP9qHwhUI7wnwD9TUHcxbfPYHUKxV
         db5/fDMyeYqH3jMojdYeGg8nttjt90mCl/G7eAya5IUY5qadR3gvZNGv0yZk5an4MRoa
         uu0+QbqzI7f2S9zYkWdTAZg0k3p9yB7QWrfI/eEU4/IJVZ4SVAlRzcz6rZ68Rca9JmeX
         ClRCJ0Oas7aOCTVc050hmEEK3OzQiPIP4iV2AdZWcG7V47AZdwmEX0KrztpcsGvncS3S
         VKrug6pq+Nv2w7VPNK8v2QGu+/RHobHgyzUfU1s2XZuOTif06TeVDXDhb9p8OKr8CMvy
         oBHA==
X-Forwarded-Encrypted: i=1; AJvYcCWSZXjNsL7UMXJYRNmNbmH4MJ8glU4W9OpmQW0mSB0FWyHRvIRQ8yTh4r3a5dnWEQhnKQbtBpety0La@vger.kernel.org
X-Gm-Message-State: AOJu0YwzsP25DDoEBpDUby/LzHDCxoEqtXWiFZ+sziNeQsc1dGz43T1g
	VwLIhDhFF8nwREquyXYrYl8EgvQhq/qmMrnTXGQHK+/dxYFnZj7IIOOn
X-Gm-Gg: ASbGncuQjlHaoYfQeTOs/lpQW0adNJ3na0Fw2uQV+7z9l3hS5FAZj3CndIf04Q3tJNG
	FlFXIjV8+yFvhN+NrnUlzMUXmMHdW7jtK7UqBLitDPXIuGrdYKSCxcxwT9OP6Qd32aj25uqUVsk
	e1w2vYlXtbrD/rd2XyJai9tguN+f/hEuzvjV464D258BP9pPecfEHw94QTJ86LnjttKirJ+rUJf
	Ocqt1cjNYkRjSWqTjlMbDcVqXPD60L3CrteOWh3V7VxLrqDnqSdefvg7STW0ITk74KfVd8gW/4K
	s+3BIne6Y9LTPit0z2/LJabdXtoapSjsBpMm0Xsay+KP53gDnk/jC3DHqLE1kPGrQX/Emsglh+B
	KvyAfajIeGg7EIx8t4XPO7OoT8Wk8EO622ck1LRVggFLHs9mEd1XUex9Q6kNG0DnQHAdgjMNPrV
	ecRLotTvaZ5D/aysh9iasBlGy0F5dfnHLCkbXebM1Obuw0OcPRYLFvBHU3fGM=
X-Google-Smtp-Source: AGHT+IGLvOKUbG44rku/4CiPUgESZnyeJjkO5Wrc0TYg+nlsQ3Pw+YqFWdpwB2v9SUxqXpIn1HPyVw==
X-Received: by 2002:ad4:5962:0:b0:765:1642:2ca0 with SMTP id 6a1803df08f44-8802cf71717mr121696756d6.8.1762103061931;
        Sun, 02 Nov 2025 09:04:21 -0800 (PST)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88052d193bcsm13004006d6.6.2025.11.02.09.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 09:04:20 -0800 (PST)
Date: Sun, 02 Nov 2025 12:04:18 -0500
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_4/7=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAHp75VdaPVcKhLSCOiUw+0cqNq6pkxZqVpd2Bk-q-9dNV=+kqA@mail.gmail.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com> <20250926141913.25919-5-jefflessard3@gmail.com> <aQSEWGg50VHIECoM@smile.fi.intel.com> <B4CFA18F-CE12-4257-AAD0-FA9B744A1E29@gmail.com> <CAHp75VdaPVcKhLSCOiUw+0cqNq6pkxZqVpd2Bk-q-9dNV=+kqA@mail.gmail.com>
Message-ID: <579BBFAF-5046-407F-90E9-85C64545C161@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 1 novembre 2025 13 h 06 min 55 s HAE, Andy Shevchenko <andy=2Eshevchenko=
@gmail=2Ecom> a =C3=A9crit=C2=A0:
>On Fri, Oct 31, 2025 at 7:17=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
><jefflessard3@gmail=2Ecom> wrote:
>> Le 31 octobre 2025 05 h 41 min 44 s HAE, Andy Shevchenko <andriy=2Eshev=
chenko@intel=2Ecom> a =C3=A9crit :
>> >On Fri, Sep 26, 2025 at 10:19:05AM -0400, Jean-Fran=C3=A7ois Lessard w=
rote:
>
>=2E=2E=2E
>
>> >> +static inline void tm16xx_set_seg(const struct tm16xx_display *disp=
lay,
>> >> +                              const u8 hwgrid, const u8 hwseg, cons=
t bool on)
>> >> +{
>> >> +    assign_bit(hwgrid * display->num_hwseg + hwseg, display->state,=
 on);
>> >
>> >Do you need an atomic call here? Perhaps __assign_bit() would suffice,
>>
>> Keeping assign_bit(), it's required here=2E Two distinct concurrency sc=
enarios
>> exist:
>> - Bitmap: Multiple LED triggers (network, timer) + userspace write to
>>   display->state concurrently -> need atomic ops
>> - Hardware: Mutex serializes different hardware operations (flush_init,
>>   flush_display, keypad polling) that can race
>> The mutex doesn't eliminate bitmap concurrency needs, they're orthogona=
l
>> concerns=2E
>
>Okay, but the below bitmap_read() is non-atomic=2E And in general the
>bitmap API is not atomic=2E
>

The atomic assign_bit() protects read-modify-write operations from concurr=
ent
modifications=2E Reads are non-critical since every write schedules a flus=
h work,
providing eventual consistency=2E This is a valid optimization pattern and
doesn't=20
require atomic reads=2E

>> >> +}
>
>=2E=2E=2E
>
>> >> +                            ret =3D fwnode_property_read_u32_array(=
child,
>> >> +                                                                 "s=
egments", segments,
>> >> +                                                                 TM=
16XX_DIGIT_SEGMENTS * 2);
>> >
>> >> +                            if (ret < 0)
>> >> +                                    return ret;
>> >
>> >Why '< 0'? Here it's definitely not a counting call, so it should neve=
r return
>> >positive in this case=2E
>>
>> Keeping if (ret < 0)=2E While usage with non-NULL buffer won't return p=
ositive
>> values, fwnode_property_read_u32_array() documentation explicitly state=
s it can
>> return count when buffer is NULL=2E Using < 0 is the defensive, API-com=
pliant
>> pattern that matches the function signature=2E
>
>Okay, it's fine to keep this way=2E
>

Acknowledged=2E

>=2E=2E=2E
>
>> >> +                            ret =3D fwnode_property_read_u32_array(=
child, "reg", reg, 2);
>> >> +                            if (ret < 0)
>> >
>> >Ditto,=2E
>> >
>>
>> As per above=2E
>>
>> >> +                                    return ret;
>
>=2E=2E=2E
>
>> >> +    INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
>> >> +    INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
>> >
>> >devm-helpers=2Eh have something for this case, I believe=2E
>>
>> Cannot use devm_work_autocancel()=2E The shutdown sequence requires spe=
cific
>> ordering: (1) unregister LEDs to stop triggers, (2) clear display state=
, (3)
>> flush pending work, (4) turn off display=2E This sequence prevents hard=
ware
>> access races when triggers attempt to update the display during removal=
=2E Manual
>> INIT_WORK with explicit flush/cancel in remove() provides this control=
=2E
>
>Do you mean that the removal order is not symmetrical to the probe one?
>At bare minimum this needs a comment in the code (as summary above) to
>explain why devm_*() are not being used=2E
>

Acknowledged=2E I'll add a code comment summarizing the non-devm rationale=
 for
both work queues and LED registration: explicit sequencing prevents LED
triggers from accessing hardware post-removal=2E

>=2E=2E=2E
>
>> >> +    main->max_brightness =3D display->controller->max_brightness;
>> >> +    device_property_read_u32(dev, "max-brightness", &main->max_brig=
htness);
>> >> +    main->max_brightness =3D umin(main->max_brightness,
>> >> +                                display->controller->max_brightness=
);
>> >
>> >Hmm=2E=2E=2E Why 'u' variant of macro?
>> >
>> >> +    main->brightness =3D main->max_brightness;
>> >> +    device_property_read_u32(dev, "default-brightness", &main->brig=
htness);
>> >> +    main->brightness =3D umin(main->brightness, main->max_brightnes=
s);
>> >
>> >Ditto=2E
>>
>> Correct for unsigned brightness values=2E umin() is the appropriate mac=
ro for
>> unsigned types to avoid type conversion warnings=2E
>
>But are you in control of all the variable types? If so, why not align
>the types?
>

brightness and max_brightness are u32 (unsigned)=2E Using umin() is the
appropriate macro for unsigned comparisons=2E If type definitions change i=
n the
future, the compiler will flag any incompatibilities=2E

I think the overall design is now pretty sound=2E I would like to get sure=
 we are
not gold-plating and that we stay focused on actual issues=2E

>=2E=2E=2E
>
>> >Given a comment about propagating fwnode, why do we need all this? Doe=
sn't led
>> >core take care of these properties as well?
>>
>> Manual handling is necessary because:
>> 1=2E default-brightness: Not implemented in LED core
>
>Oh, indeed, I mixed this with default-state=2E But the side question
>here is what prevents us from implementing it? I suspect there were
>discussions in the past, but I haven;t dug the lore archive to see if
>any indeed happened=2E
>

default-brightness could be added to LED core as a separate enhancement=2E=
 For
this TM16xx driver, manual handling is necessary given the same considerat=
ions
as max-brightness=2E Any future LED core changes can be addressed independ=
ently=2E

>> 2=2E max-brightness defaulting: If DT property is absent, default to
>>    controller->max_brightness
>> 3=2E Ceiling enforcement: When DT property IS present, clamp to not exc=
eed
>>    hardware limits (controller->max_brightness)
>>
>> LED core only reads max-brightness optionally, it doesn't handle defaul=
ting or
>> hardware ceiling enforcement=2E
>
>Yep, thanks for elaborating=2E
>

I'll add a code comment about defaulting and hardware ceiling enforcement=
=2E

>=2E=2E=2E
>
>> >> +            ret =3D led_classdev_register_ext(dev, &led->cdev, &led=
_init);
>> >
>> >Why not devm_led_*()?
>>
>> Intentional non-devm design documented in commit notes=2E Explicit unre=
gistration
>> before removal immediately stops LED triggers, preventing them from acc=
essing
>> hardware post-removal=2E devm_led_*() would require complex brightness =
callback
>> state tracking to handle trigger activity during remove()=2E Explicit u=
nregister
>> is cleaner and eliminates this race=2E
>
>Right, so I think the summary of this needs to be commented on in the
>code (as well)=2E
>

I'll add code comment explaining the non-devm rationale for LED registrati=
on=2E

>=2E=2E=2E
>
>> >> +    ret =3D linedisp_attach(&display->linedisp, display->main_led=
=2Edev,
>> >> +                          display->num_digits, &tm16xx_linedisp_ops=
);
>
>> >If we haven't yet devm for this, it can be
>> >1) introduced, OR
>> >2) wrapped to become a such (see devm_add_action_or_reset() usage)=2E
>> >
>>
>> While devm_add_action_or_reset() could wrap linedisp_detach(), the over=
all
>> shutdown still requires explicit ordering across multiple subsystems (l=
inedisp,
>> LEDs, workqueues, hardware)=2E Using devm for just one component while =
manually
>> managing others adds complexity without benefit=2E The current explicit=
 approach
>> keeps all cleanup logic together in remove() for clarity=2E
>
>Okay, I need to have a look at this again when you send a new version,
>but I want to finish reviewing this one=2E Sorry it takes time=2E
>

Thanks for the thorough review of the core driver patch=2E Before I finali=
ze v6
with these changes and added code comments, would you be able to review th=
e
remaining patches in the series (keypad/I2C/SPI bus support)? Comprehensiv=
e
feedback now will help ensure v6 addresses all architectural concerns
systematically, rather than discovering issues after resubmission=2E

Thanks,
Jean-Fran=C3=A7ois


