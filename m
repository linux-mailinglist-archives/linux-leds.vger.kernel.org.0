Return-Path: <linux-leds+bounces-5281-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 839CBB3061F
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 22:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 703B41D20373
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 20:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7440F38A610;
	Thu, 21 Aug 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsT9CSRn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED7B38A60E;
	Thu, 21 Aug 2025 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807604; cv=none; b=ZTpvjh4vAV2iRt657Bv2JGWf7gz9XJFoMRUyjtUAjF2kcmsHsxl2BYJGggKFx1m2knl2t9aj1LaPbgueu5F7a2n/HgRKTXXNtD/zzoBLyyKpKEgcaSORvNiF+iGCxyju4Q09TDZkaa73vReVo5yOrEcPJlFwMoDzRIB0/bZtSm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807604; c=relaxed/simple;
	bh=fYLX9BPihwYh9pK73J82ZTceIaedsdb8EK2WMESmI0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuJ+kqyEumwiIfVrzIAhI7jXV6XTMux7BlqMzeTiJ6hBW/ldsX7QHoi6a50Qs3ZDc+y4PNo9sqksyoPWRp8EaEh8+7RHpk4YeSqJX1QsNCqFo+PuOUENeifRXvb9SNtDbOU8OQCCC+RqbgM6j0EN9YOZhd7ddJ06LqoDil++kL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsT9CSRn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so206542166b.3;
        Thu, 21 Aug 2025 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755807600; x=1756412400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRFzXVYttoiARGA6ikBUm8zIVVs1if7tMBaz/j/r/sU=;
        b=gsT9CSRnCQS6Iu1xW6wCLX7e8zEZed67g5cS5ncVKp8Uielz5wTqWiZXrfPbDwWuff
         q4sZiK9NyziqN79mcEGC6GYFwjyGr0AZC/cX4M27SE4NDhUfiiTS+zh0mpo9IPKQFoWP
         KG+sPIRog81oIwrpagbP77nxY+tzv7at/37YRKSIHmRLFR/IE3KP2mpjCVZMzhbs31gb
         +AfbyPKUX0HAEKR4iOgFG+9N3LvoRK5zrP92E+KD6bkFo1CdOKhChTNzP+lbQ9cIVihT
         o7NU2ghdvOq1GncD0/jFjwam7+eUdFRlfARuBU4ikFZ8jOasVsO4hnHs27Bndgv1WrCw
         6LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755807600; x=1756412400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRFzXVYttoiARGA6ikBUm8zIVVs1if7tMBaz/j/r/sU=;
        b=kK+2dhYebGdCCncp2XtumptOT3CxdNzg/7dOUDuCJsnHTRk9hRZ9NHBZ9y3Z3rImjo
         M02jS/uI3p4SJwOJxs8bpFh3JqvIfFYZQVX81B/VOl4Ciok3GVkJFDp56uxWoKU2x0li
         Yehx1KF6zo/ehnw9g5qXRCTbRz/VhVoFgC1fmQDCNmDwbMD1WI2hbkk4Yq9EYbjC52UL
         KC/LPG0xHUefW8AxOznaLxtFUIfXHI+o5HWG/eEgZOIFqlEosdnBaUNOozPD9nMWPqHa
         miqDJOCie8ztRLTHrjEq+qkTubh9RmxFZ7NeUs046koXAsWrSMY7Vo3osruQNgcGoqee
         YMqg==
X-Forwarded-Encrypted: i=1; AJvYcCW83qdN0QudLgQa+NAuXuIMU7YsDm+kVqg1oUbLd7JJ3h9kg1544hk2rhYdVEmZUwbKFH79yHn5HPg5oA==@vger.kernel.org, AJvYcCWpS3V4D5ri+W4Fatd2vCnXlbFPb3TJ9kWn+ArcoJoaBu8hH1XhIb9y35HAumCtEc6zGSeEhnHo9IuG@vger.kernel.org, AJvYcCXOchETTtrKndDEuxxeX/7dzizcqsIxLk69GOKmjtDI8rMcUgcKTVcmH8fLNGyLI8iNORN0QQgGi8vemXfP@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAJQB5oQrkS41kl9kE5nJpG8UhIyQVJ9+GPPFDS+Ms2XhivSw
	5TmqUu75Ba0u7nkbXyxggFCQGFtlto6N7cLiSwmRMqJwCorXQHgAHUzuMlbnl13Jb7fDyfvN8ht
	YFcW0VKoopzRq/4JFAR28dbiB9zUQfaQ=
X-Gm-Gg: ASbGncuRHLKq9DQXRkrUusBoV+DeRyraR3oyUH9DBPLurY8FkSEJ1ipN3agbTvdEFVB
	x/UHm2W+nx7s92eFdQj5gKMVfJ/476vHmW8HR09igVonSX6wbiqfR1XrQjv67vHyK8LI9UGDsb2
	2kKToKJAJQs7IxvBiOvHe4kCEBNqJRKRCxbjZy4IkpSA7fCpICGlPXuXP4j5RZUmmbY6OzBnvmC
	09RK2A=
X-Google-Smtp-Source: AGHT+IHtnskdYFN9tlxE7OJotoGiOfEq/L4xPWgMCWXwsDALIyI9EWXVocCRanWBsOXhWqSVf982HeufpLNJq64TYk8=
X-Received: by 2002:a17:907:3f88:b0:adb:229f:6b71 with SMTP id
 a640c23a62f3a-afe28ec5a6bmr41273866b.5.1755807599900; Thu, 21 Aug 2025
 13:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com>
 <20250820163120.24997-4-jefflessard3@gmail.com> <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com>
 <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com>
In-Reply-To: <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 23:19:23 +0300
X-Gm-Features: Ac12FXzJ7sFy9ltaX6O6DKtH1aWLuqAkwlby8msZwp-Muh0yl-1IKEX_Wf4sFak
Message-ID: <CAHp75Vcdp5fHPNAy=_iEFR6Fa5PEE4U++T5owE1mW_H2-y3ijA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] auxdisplay: Add TM16xx 7-segment LED matrix
 display controllers driver
To: =?UTF-8?Q?Jean=2DFran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Boris Gjenero <boris.gjenero@gmail.com>, Christian Hewitt <christianshewitt@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Paolo Sabatino <paolo.sabatino@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 10:04=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
> Le 21 ao=C3=BBt 2025 04 h 08 min 51 s HAE, Andy Shevchenko <andy.shevchen=
ko@gmail.com> a =C3=A9crit :
> >On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
> ><jefflessard3@gmail.com> wrote:

...

> >This patch is ~1800 lines. Can you split it to a few based on main
> >features (like the keyboard may be separated)? 2k is hard to review.
>
> I agree that 1800 lines is a lot to review at once. For v4, I plan to spl=
it the
> submission into separate patches and source files for better reviewabilit=
y
> and maintainability:
> - tm16xx.h / tm16xx.c (core driver)
> - tm16xx_keypad.c (keypad support)
> - tm16xx_spi.c (SPI glue)
> - tm16xx_i2c.c (I2C glue)
>
> I believe this will improve clarity without fragmenting the driver nor it=
s
> DT bindings.

Sounds good.

...

> >> Acked-by: Paolo Sabatino <paolo.sabatino@gmail.com> # As primary user,=
 integrated tm16xx into Armbian rockchip64
> >> Acked-by: Christian Hewitt <christianshewitt@gmail.com> # As primary u=
ser, integrated tm16xx into LibreElec
> >
> >I dunno what these tags may mean in the current context...
>
> These =E2=80=9CAcked-by=E2=80=9D tags follow kernel submission guidelines=
 to record approval
> from key users.
>
> Per Documentation/process/submitting-patches.rst:
> Acked-by: may also be used by other stakeholders, such as people with dom=
ain
> knowledge (e.g. the original author of the code being modified), userspac=
e-side
> reviewers for a kernel uAPI patch or key users of a feature.  Optionally,=
 in
> these cases, it can be useful to add a "# Suffix" to clarify its meaning:=
:
>
>         Acked-by: The Stakeholder <stakeholder@example.org> # As primary =
user

Ah, interesting. TIL.

...

> >> +#include <linux/bitfield.h>
> >> +#include <linux/bitmap.h>
> >
> >> +#include <linux/bitops.h>
> >
> >When bitmap,h is included, bitops.h is implied. But it's okay to include=
 both.
> >
> >> +#include <linux/delay.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/init.h>
> >> +#include <linux/input.h>
> >> +#include <linux/input/matrix_keypad.h>
> >> +#include <linux/leds.h>
> >> +#include <linux/map_to_7segment.h>
> >> +#include <linux/module.h>
> >
> >Missing mod_devicetable.h for the ID table definitions.
> >
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >
> >Cargo-cult? These two should be rarely used in a new code, for this
> >driver I'm pretty sure they need not to be used at all.
> >
> >> +#include <linux/property.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/spi/spi.h>
> >> +#include <linux/version.h>
> >> +#include <linux/workqueue.h>
>
> Thanks for pointing that out. For v4, I will revise includes to:
>
> #include <linux/bitfield.h>
> #include <linux/bitmap.h>

> #include <linux/i2c.h>

Probably not this in the core file.

> #include <linux/input.h>
> #include <linux/input/matrix_keypad.h>
> #include <linux/leds.h>
> #include <linux/map_to_7segment.h>
> #include <linux/module.h>
> #include <linux/mod_devicetable.h>
> #include <linux/property.h>
> #include <linux/spi/spi.h>

Nor this.

> #include <linux/workqueue.h>

...

> >> +#define TM16XX_DRIVER_NAME "tm16xx"
> >> +#define TM16XX_DEVICE_NAME "display"
> >
> >Not sure why we need these two.
>
> I will drop TM16XX_DEVICE_NAME since DT node name/label property should b=
e used.
>
> The TM16XX_DRIVER_NAME macro is standard practice for consistent string u=
sage
> in registration and module macros.
> If helpful, I can add a leading /* module name */ header comment.

Instead of an unneeded comment it seems better to use explicit string
literal in all cases (two?).

...

> >> +#define TM1650_CTRL_BR_MASK    GENMASK(6, 4)
> >> +#define TM1650_CTRL_ON         BIT(0)
> >> +#define TM1650_CTRL_SLEEP      BIT(2)
> >
> >Are they really bits and not an enum in the datasheet?
>
> These are respectively B0 and B2 according to the TM1650 datasheet:
> - B0: Off screen display / Open screen display
> - B1: fixed to 0
> - B2: Normal operating mode / Standby mode
> - B7-B4: brightness enum

I see, I would put a double names then

_OFF_OPEN // is it "open" or "on"? What's the difference?
_RUN_STANDBY

(find better names)

...

> >> +#define TM1650_CTRL_SEG_MASK   BIT(3)
> >
> >> +#define TM1650_CTRL_SEG8_MODE  0
> >> +#define TM1650_CTRL_SEG7_MODE  BIT(3)
> >
> >Same Q as per above case.
>
> B3 controls 8 vs 7 segment mode. I will make it clearer:
> #define TM1650_CTRL_SEG8_MODE  (0 << 3)
> #define TM1650_CTRL_SEG7_MODE  (1 << 3)

Hmm... Here it's clear and both are probably needed in the code, but
maybe it also makes sense to put similar for the above?

CTRL_OFF (0 << ...)
CTRL_OPEN
CTRL_RUN
CTRL_STANDBY

?

...

> >> +#define TM16XX_CTRL_BRIGHTNESS(enabled, value, prefix) \
> >> +       ((enabled) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (value)) | \
> >> +                     prefix##_CTRL_ON) : 0)
> >
> >Okay, but can you split it logically, perhaps making it only one line
> >(for the lines 2nd and 3rd)?
>
> I currently format it as a multi-line macro respecting 80-column limit, w=
ith
> conditional ternary expression on separate lines for readability. If you =
prefer
> a different formatting style or logical grouping, please advise, as I wan=
t to
> keep it consistent with kernel coding style.

We have a relaxed format and I don't mind that people use it. But the
main point here is readability / logical split. Also parameter names
can be shortened a bit (like value --> val, enable --> en{a} / on.

...

> >> +static char *default_value;
> >> +module_param(default_value, charp, 0444);
> >> +MODULE_PARM_DESC(default_value, "Default display value to initialize"=
);
> >
> >Do we need this? Why?
>
> This parameter was requested by community users to allow a boot message
> (e.g., =E2=80=9Cboot=E2=80=9D) before user space takes control of the dis=
play value. I believe a
> module parameter is appropriate here to maintain separation between drive=
r
> internals and user content, avoiding hardcoding display content in DT or =
code.

Currently we have a compile-time option and I don't think module
parameter is what we need. If somebody wants it, please make it a
separate patch with much better justification ("a user wants it"
doesn't work). DT most likely is also not the best choice as it's
about HW and not some policies.

TL;DR: please drop it for now (but if you wish something, use the
compile time option we have in Kconfig for that).

...

> >> +static int tm16xx_keypad_probe(struct tm16xx_display *display)
> >> +{
> >> +       const u8 rows =3D display->controller->max_key_rows;
> >> +       const u8 cols =3D display->controller->max_key_cols;
> >> +       struct tm16xx_keypad *keypad;
> >> +       struct input_dev *input;
> >> +       unsigned int poll_interval, nbits;
> >> +       int ret =3D 0;
> >
> >I don't see how this assignment is used.
>
> I will remove this unnecessary initialization.
>
> >> +       if (!display->controller->keys || !rows || !cols) {
> >> +               dev_dbg(display->dev, "keypad not supported\n");
> >> +               return 0;
> >> +       }
> >> +
> >> +       if (!device_property_present(display->dev, "poll-interval") ||
> >> +           !device_property_present(display->dev, "linux,keymap")) {
> >> +               dev_dbg(display->dev, "keypad disabled\n");
> >> +               return 0;
> >> +       }
> >> +
> >> +       dev_dbg(display->dev, "Configuring keypad\n");
> >> +
> >> +       ret =3D device_property_read_u32(display->dev, "poll-interval"=
,
> >> +                                      &poll_interval);
> >> +       if (ret < 0) {
> >> +               dev_err(display->dev, "Failed to read poll-interval: %=
d\n", ret);
> >> +               return ret;
> >> +       }
> >> +
> >> +       keypad =3D devm_kzalloc(display->dev, sizeof(*keypad), GFP_KER=
NEL);
> >> +       if (!keypad)
> >> +               return -ENOMEM;
> >> +       keypad->display =3D display;
> >> +
> >> +       nbits =3D tm16xx_key_nbits(keypad);
> >> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits, GFP_=
KERNEL);
> >> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, nbits,=
 GFP_KERNEL);
> >> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbits, GF=
P_KERNEL);
> >> +       if (!keypad->state || !keypad->last_state || !keypad->changes)=
 {
> >> +               ret =3D -ENOMEM;

> >> +               goto free_keypad;

(Hit send too early that time...) This goto is bad. It means
misunderstanding of the devm concept. See below.

> >> +       }
> >> +
> >> +       input =3D devm_input_allocate_device(display->dev);
> >> +       if (!input) {
> >
> >> +               dev_err(display->dev, "Failed to allocate input device=
\n");
> >> +               ret =3D -ENOMEM;

No, we do not spill an error message on ENOMEM. This is an agreement
in the kernel community for drivers.

> >> +               goto free_bitmaps;
> >> +       }
> >> +       input->name =3D TM16XX_DRIVER_NAME "-keypad";
> >> +       keypad->input =3D input;
> >> +       input_set_drvdata(input, keypad);
> >> +
> >> +       keypad->row_shift =3D get_count_order(cols);
> >> +       ret =3D matrix_keypad_build_keymap(NULL, "linux,keymap", rows,=
 cols, NULL,
> >> +                                        input);
> >> +       if (ret < 0) {
> >> +               dev_err(display->dev, "Failed to build keymap: %d\n", =
ret);
> >> +               goto free_input;
> >> +       }
> >> +
> >> +       if (device_property_read_bool(display->dev, "autorepeat"))
> >> +               __set_bit(EV_REP, input->evbit);
> >> +
> >> +       input_setup_polling(input, tm16xx_keypad_poll);
> >> +       input_set_poll_interval(input, poll_interval);
> >> +       ret =3D input_register_device(input);
> >> +       if (ret < 0) {
> >> +               dev_err(display->dev, "Failed to register input device=
: %d\n",
> >> +                       ret);

Use in all cases like this

  return dev_err_probe(...);

pattern.

> >> +               goto free_input;
> >> +       }
> >> +
> >> +       dev_dbg(display->dev, "keypad rows=3D%u, cols=3D%u, poll=3D%u\=
n", rows, cols,
> >> +               poll_interval);
> >> +
> >> +       return 0;

> >> +free_input:
> >> +       input_free_device(input);

> >> +free_bitmaps:
> >> +       devm_kfree(display->dev, keypad->state);
> >> +       devm_kfree(display->dev, keypad->last_state);
> >> +       devm_kfree(display->dev, keypad->changes);
> >> +free_keypad:
> >> +       devm_kfree(display->dev, keypad);
> >> +       return ret;

No way. We don't do that, If required it signals about exceptional
case (0.01% probability) or misunderstanding of devm:
- managed resources are managed by core, no need to call for free
- using managed resources in the contexts when object lifetime is
short is incorrect, needs to be switched to the plain alloc (nowadays
with __free() from cleanup.h to have RAII enabled)

Choose one of these and fix the code accordingly.

> >> +}

...

> >I stopped here, I believe it's enough for now (and I would wait for
> >the smaller changes per patch, perhaps 2 DT bindings patch + common
> >part (basic functionality) + spi driver + i2c driver + keyboard,
> >something like 6+ patches).
> >Also, split i2c and spi glue drivers to a separate modules, so you
> >will have 3 files:
> >
> >$main
> >$main_i2c
> >$main_spi
> >
> >Look at ton of examples under drivers/iio/
> >
>
> I plan to split source files for review but maintain a single unified ker=
nel
> module that handles both I2C and SPI buses. This avoids confusion and
> unnecessary duplication since the hardware and DT bindings are shared.
> If you intended splitting into separate loadable kernel modules for I2C
> and SPI, could you please clarify? I believe a single driver module bette=
r
> fits this hardware model.

Please, make two independent glue drivers. The common approach is
error prone. See, for example, this:
https://stackoverflow.com/q/79462895/2511795 (read about kernel
autoloading part).

--=20
With Best Regards,
Andy Shevchenko

