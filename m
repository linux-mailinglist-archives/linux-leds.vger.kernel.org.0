Return-Path: <linux-leds+bounces-5271-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48984B2F0AE
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 10:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E25E16445F
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1922E9ECC;
	Thu, 21 Aug 2025 08:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv1vLqgG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877B24DCF9;
	Thu, 21 Aug 2025 08:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763771; cv=none; b=jTeS5dQaJLcmtupdAktyphxrJ24HtH4fvhsZhNigY8DBeWgf4AoSW7RJ6/sy6cp3Cg/Po2yOZtpEy3rGyXHSxE8pCbqdEtBb+3g5T8inWRjiBGkrHua0hWR1WrMFvzA+ZFuTx9igPAIUtSdADtCfCFUtMuey31dN3RZBKXn0tvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763771; c=relaxed/simple;
	bh=sZtdi+kUG05mh/YJ8VpiOFN+Apg/5p4SC0jMJIHklZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kw4CMtfGKGnCTaU9fLbqeSpkHAR9H8F2FJ5ZaaV+AaJ7qWjxC6ojx/bp3jw9Fp1BGGryYy1AHpURmyJB8t34YH8du9m258Q8gzJLAC+rkn0qFDWMj2mmNEArHNPildLfcJsRUZf5hPXb6M82dQqyDdVjB/RQgtFDD45fvMYQKhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv1vLqgG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb78ead12so106873966b.1;
        Thu, 21 Aug 2025 01:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755763768; x=1756368568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6nPNJVRGZotvF4iRqmlkvBPB91vswDOp1GQJQVDfCY=;
        b=Kv1vLqgG2DcBuse7La+AacmhoY52FFVfwKwkRGgiPsTA6ir2RGqeZGH+ohQuXXGJYg
         nllUZL4dsTjhdKqJdKx02/GneIb+LEwyXj9sU1f+krUGZFx8dpf1nDmXukteTW3mj0yJ
         SvfX1ng5byviJgBDnUs1Mz/HBBoKkqG7KFIiy3hWXEg9VlQWIxi0jjwzuqM2vZvvrGsa
         0qyq9Pj1rOWhlolPDuuUV2XhqAvRIJorw1bUxT4KwP5yPS8k2Tsdbu+tYJFpxvRSwU/6
         vbMb4kUnUdufZNG7aXulj9/G+XsMv1i+F9F6ei9my1Z+t2RRowjJAtn1iP6KIhLLoXCq
         ldVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763768; x=1756368568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6nPNJVRGZotvF4iRqmlkvBPB91vswDOp1GQJQVDfCY=;
        b=dYIwspSiYEK4C6Y+WewXNAUZzDy/PQ9Ta8ZofqXignkQncl5RIjZAoGjjeCM/qOILU
         JcD6dCDhT/xwRWA9EWmu2hBdcfhfClKxeYtQyHXSqhbK4epsSsXxzszDOpytctHLAeWN
         MKn4H4Yz/8W6Vo3CVQUNZYfaB5OIB2t2TJwilCqgJBLtxttbu9bsW1dOR+0KbjtDQkDw
         YwK4DnhvID80h8AM9wS7FtixTyO2gbPpCQ4XgYhtpyrdlyPqPRvR3aSvOuHnwoSP3V//
         /gLF+czfLnkov98GcFoXS3ukf85pXHILaXh584CFMp7z0QAiyo6ESVILcbnfoWBg2jCF
         SU0A==
X-Forwarded-Encrypted: i=1; AJvYcCWZZU5aWZW5lwUS6ZUjT3cfJujVDVHtWTZnq4DJV+og+45FjSQW6GS6KfX9nOCoAjhyK3TgvT5SmXNl@vger.kernel.org, AJvYcCWZxovsMOh98Fzd7KhOWUDHe4rtPy0KqJ9ZdmXAT0FGO10WEsROG+xsu5UZ0jRQThpWV2KLVin0Q0zweZNm@vger.kernel.org, AJvYcCXM7oqbXlHNaAUIIHFKCcUbkZNvJRR3j7N6ZDWv8TQ7PH2zX1RBS8YmF9gdqyVXtRUOzWNBFH048rthcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4hlVRPAzrhyQlOV2NhSwloa/NWN6sfV1DWoTP/cUgt8iz8hb
	LhVCyt0VVZr4pWfqAXZiuk0o7l92kwUWgnONJqs6+maNE2+s6YgvRkLFqv4YcvduBb25JpFT8v6
	oWrY1P2BherW/zzcYJvRMJgnGLJfc3zo=
X-Gm-Gg: ASbGncuXUY8Vsr0vEaEYSjK3fZq2c7ryyFRVQPfyz6CvPSl7fDUsoxUUxaaLDsJkD69
	kQdwzz/jOIBIdK4gkN90rMeWsJArL8Cbyczxkx92LxTZ9fYVgxu8t1vVWHQt7rSsQCozlFYQKps
	OR/X8p1a1OVWau2n+ZSZtFbmzuWhAmXKju/HGhs7u1SwUiZ10mgKnaWgk8hvXZ1qKh2SupZO5oY
	TppROkP6A==
X-Google-Smtp-Source: AGHT+IFY0MbZLb0bMwxbZ+PpwvxknMRSDSEtmGUUfkPf8FMiipi3twBQiQyfFw0KMReae+VgqljgMIMlGZNHqtA5iJk=
X-Received: by 2002:a17:907:9447:b0:afc:b13e:f114 with SMTP id
 a640c23a62f3a-afe07d6c3d2mr116462666b.59.1755763767828; Thu, 21 Aug 2025
 01:09:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-4-jefflessard3@gmail.com>
In-Reply-To: <20250820163120.24997-4-jefflessard3@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 11:08:51 +0300
X-Gm-Features: Ac12FXwVMqs-aAPLfamX_ZktdMXh6B_pziPWvV2TGqV4fQDjxTmfQrUa3EjaTLs
Message-ID: <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com>
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

On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
<jefflessard3@gmail.com> wrote:
>
> Add driver for TM16xx family LED controllers and compatible chips from mu=
ltiple
> vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and Winrise.
> These controllers drive 7-segment digits and individual LED icons through=
 either
> I2C or SPI interfaces with optional keypad scanning support.
>
> Successfully tested on various ARM TV boxes including H96 Max, Magicsee N=
5,
> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platform=
s
> (Rockchip, Amlogic, Allwinner).


This patch is ~1800 lines. Can you split it to a few based on main
features (like the keyboard may be separated)? 2k is hard to review.

> Acked-by: Paolo Sabatino <paolo.sabatino@gmail.com> # As primary user, in=
tegrated tm16xx into Armbian rockchip64
> Acked-by: Christian Hewitt <christianshewitt@gmail.com> # As primary user=
, integrated tm16xx into LibreElec

I dunno what these tags may mean in the current context...

...

> +#include <linux/bitfield.h>
> +#include <linux/bitmap.h>

> +#include <linux/bitops.h>

When bitmap,h is included, bitops.h is implied. But it's okay to include bo=
th.

> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/leds.h>
> +#include <linux/map_to_7segment.h>
> +#include <linux/module.h>

Missing mod_devicetable.h for the ID table definitions.

> +#include <linux/of.h>
> +#include <linux/of_device.h>

Cargo-cult? These two should be rarely used in a new code, for this
driver I'm pretty sure they need not to be used at all.

> +#include <linux/property.h>
> +#include <linux/slab.h>
> +#include <linux/spi/spi.h>
> +#include <linux/version.h>
> +#include <linux/workqueue.h>

...

> +#define TM16XX_DRIVER_NAME "tm16xx"
> +#define TM16XX_DEVICE_NAME "display"

Not sure why we need these two.

...

> +/* Command type bits (bits 7-6) */
> +#define TM16XX_CMD_MASK                GENMASK(7, 6)

> +#define TM16XX_CMD_MODE                0
> +#define TM16XX_CMD_DATA                BIT(6)
> +#define TM16XX_CMD_CTRL                BIT(7)
> +#define TM16XX_CMD_ADDR                (BIT(7) | BIT(6))

As far as I can see these are clearly not bits, please use the form of
(0 << 6), (1 << 6) and so on.

...

> +/* Mode command grid settings (bits 1-0) */
> +#define TM16XX_MODE_GRID_MASK  GENMASK(1, 0)

> +#define TM16XX_MODE_4GRIDS     0
> +#define TM16XX_MODE_5GRIDS     BIT(0)
> +#define TM16XX_MODE_6GRIDS     BIT(1)
> +#define TM16XX_MODE_7GRIDS     (BIT(1) | BIT(0))

Ditto.

...

> +/* Data command settings */
> +#define TM16XX_DATA_ADDR_MASK  BIT(2)

> +#define TM16XX_DATA_ADDR_AUTO  0
> +#define TM16XX_DATA_ADDR_FIXED BIT(2)

Not sure why we need a definition for 0. But if it's required, make it
 similar to above.

...

> +#define TM16XX_DATA_MODE_MASK  GENMASK(1, 0)
> +#define TM16XX_DATA_MODE_WRITE 0
> +#define TM16XX_DATA_MODE_READ  BIT(1)

Seems also needs to be converted to plain numbers.

...

> +#define TM1650_CTRL_BR_MASK    GENMASK(6, 4)
> +#define TM1650_CTRL_ON         BIT(0)
> +#define TM1650_CTRL_SLEEP      BIT(2)

Are they really bits and not an enum in the datasheet?

...

> +#define TM1650_CTRL_SEG_MASK   BIT(3)

> +#define TM1650_CTRL_SEG8_MODE  0
> +#define TM1650_CTRL_SEG7_MODE  BIT(3)

Same Q as per above case.

...

> +#define TM16XX_CTRL_BRIGHTNESS(enabled, value, prefix) \
> +       ((enabled) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (value)) | \
> +                     prefix##_CTRL_ON) : 0)

Okay, but can you split it logically, perhaps making it only one line
(for the lines 2nd and 3rd)?

...

> +static char *default_value;
> +module_param(default_value, charp, 0444);
> +MODULE_PARM_DESC(default_value, "Default display value to initialize");

Do we need this? Why?

...

> +static inline u16 tm16xx_get_grid(const struct tm16xx_display *display,
> +                                 const unsigned int grid)
> +{
> +       return (u16)bitmap_read(display->state, grid * display->num_segme=
nts,

Why casting?

> +                               display->num_segments);
> +}

...

> +#define for_each_key(keypad, _r, _c) \

This is too broad a name for the macro. If it's useful not only in
this driver, make it in one of the linux/input* headers perhaps.

> +       for (unsigned int (_r) =3D 0; \

Can _r be an expression? Really?

> +            (_r) < (keypad)->display->controller->max_key_rows; (_r)++) =
\
> +               for (unsigned int (_c) =3D 0; \

Same about _c.

> +                    (_c) < (keypad)->display->controller->max_key_cols; =
(_c)++)

...

> +       mutex_lock(&keypad->display->lock);

Perhaps scoped_guard() from cleanup.h?

> +       ret =3D keypad->display->controller->keys(keypad);
> +       mutex_unlock(&keypad->display->lock);
> +
> +       if (ret < 0) {
> +               dev_err(keypad->display->dev, "Reading failed: %d\n", ret=
);
> +               return;
> +       }

...

> +       for_each_set_bit(bit, keypad->changes, nbits) {
> +               row =3D tm16xx_get_key_row(keypad, bit);
> +               col =3D tm16xx_get_key_col(keypad, bit);
> +               pressed =3D _test_bit(bit, keypad->state);

> +               u16 scancode =3D MATRIX_SCAN_CODE(row, col, keypad->row_s=
hift);

Don't mix definitions and code. It's only relaxed for iterators and
RAII (cleanup.h) variables in Linux kernel.

> +               dev_dbg(keypad->display->dev,
> +                       "key changed: %u, row=3D%u col=3D%u down=3D%d\n",=
 bit, row,
> +                       col, pressed);
> +
> +               input_event(keypad->input, EV_MSC, MSC_SCAN, scancode);
> +               input_report_key(keypad->input, keycodes[scancode], press=
ed);
> +       }

...

> +static int tm16xx_keypad_probe(struct tm16xx_display *display)
> +{
> +       const u8 rows =3D display->controller->max_key_rows;
> +       const u8 cols =3D display->controller->max_key_cols;
> +       struct tm16xx_keypad *keypad;
> +       struct input_dev *input;
> +       unsigned int poll_interval, nbits;
> +       int ret =3D 0;

I don't see how this assignment is used.

> +       if (!display->controller->keys || !rows || !cols) {
> +               dev_dbg(display->dev, "keypad not supported\n");
> +               return 0;
> +       }
> +
> +       if (!device_property_present(display->dev, "poll-interval") ||
> +           !device_property_present(display->dev, "linux,keymap")) {
> +               dev_dbg(display->dev, "keypad disabled\n");
> +               return 0;
> +       }
> +
> +       dev_dbg(display->dev, "Configuring keypad\n");
> +
> +       ret =3D device_property_read_u32(display->dev, "poll-interval",
> +                                      &poll_interval);
> +       if (ret < 0) {
> +               dev_err(display->dev, "Failed to read poll-interval: %d\n=
", ret);
> +               return ret;
> +       }
> +
> +       keypad =3D devm_kzalloc(display->dev, sizeof(*keypad), GFP_KERNEL=
);
> +       if (!keypad)
> +               return -ENOMEM;
> +       keypad->display =3D display;
> +
> +       nbits =3D tm16xx_key_nbits(keypad);
> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits, GFP_KER=
NEL);
> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, nbits, GF=
P_KERNEL);
> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbits, GFP_K=
ERNEL);
> +       if (!keypad->state || !keypad->last_state || !keypad->changes) {
> +               ret =3D -ENOMEM;
> +               goto free_keypad;
> +       }
> +
> +       input =3D devm_input_allocate_device(display->dev);
> +       if (!input) {

> +               dev_err(display->dev, "Failed to allocate input device\n"=
);
> +               ret =3D -ENOMEM;
> +               goto free_bitmaps;
> +       }
> +       input->name =3D TM16XX_DRIVER_NAME "-keypad";
> +       keypad->input =3D input;
> +       input_set_drvdata(input, keypad);
> +
> +       keypad->row_shift =3D get_count_order(cols);
> +       ret =3D matrix_keypad_build_keymap(NULL, "linux,keymap", rows, co=
ls, NULL,
> +                                        input);
> +       if (ret < 0) {
> +               dev_err(display->dev, "Failed to build keymap: %d\n", ret=
);
> +               goto free_input;
> +       }
> +
> +       if (device_property_read_bool(display->dev, "autorepeat"))
> +               __set_bit(EV_REP, input->evbit);
> +
> +       input_setup_polling(input, tm16xx_keypad_poll);
> +       input_set_poll_interval(input, poll_interval);
> +       ret =3D input_register_device(input);
> +       if (ret < 0) {
> +               dev_err(display->dev, "Failed to register input device: %=
d\n",
> +                       ret);
> +               goto free_input;
> +       }
> +
> +       dev_dbg(display->dev, "keypad rows=3D%u, cols=3D%u, poll=3D%u\n",=
 rows, cols,
> +               poll_interval);
> +
> +       return 0;
> +
> +free_input:
> +       input_free_device(input);
> +free_bitmaps:
> +       devm_kfree(display->dev, keypad->state);
> +       devm_kfree(display->dev, keypad->last_state);
> +       devm_kfree(display->dev, keypad->changes);
> +free_keypad:
> +       devm_kfree(display->dev, keypad);
> +       return ret;
> +}

...

I stopped here, I believe it's enough for now (and I would wait for
the smaller changes per patch, perhaps 2 DT bindings patch + common
part (basic functionality) + spi driver + i2c driver + keyboard,
something like 6+ patches).
Also, split i2c and spi glue drivers to a separate modules, so you
will have 3 files:

$main
$main_i2c
$main_spi

Look at ton of examples under drivers/iio/

--
With Best Regards,
Andy Shevchenko

