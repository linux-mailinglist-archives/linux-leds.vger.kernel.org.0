Return-Path: <linux-leds+bounces-5275-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEAB30290
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 21:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC5DF728EB8
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 19:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24290343D8A;
	Thu, 21 Aug 2025 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i35ofLcv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6D22D9EB;
	Thu, 21 Aug 2025 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803093; cv=none; b=qM42Wd19L8Oqfyn2yQ7NTyCWG85TBbie2K0Cq0TqAX9UsXjdBUVgOQp8I4A7S9/SipPkiZrTiG47xlQ8Ak53rDHSF01YfHhTR8tUOhqcItyLJV/wsQ7VYRDeFN6isQ8uhuakMw5SrMk+N5AhrY28UZqjpBnuFhsXUvFwluwx+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803093; c=relaxed/simple;
	bh=T/5jbKZjZAsfJFS55Ljq9FrHkFVdVQwC9ETNWMrwU/Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N7tk+fV6O80lm/V0ZK4eXA/xcl0k2m+tmOqNfco7l20C8cs5JZ/ybBOIdLPNaViCInY9vqH/6pwIaC4XpbZYXvkbAkLwR4/xHS5MqnMwIrmpqmzIpsYZ3VkSe6FJGR1pPL5BxWqg3X29fQAkJHQ6h+keS87XYHz2Duky7eOVG/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i35ofLcv; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87063d4a9so150966685a.2;
        Thu, 21 Aug 2025 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755803090; x=1756407890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zKLyVgqxSv578F+Btv5LEyuxiVTlyOhipe15BaqYJNY=;
        b=i35ofLcvgDMYBioMhvXSO8uh3w3MHJOf0JZD36iufYDHslKSrvYkMtQy6AwzHjLE4f
         b57t0MLXGjOD7fykp23XM6XebGaVjcyZUM5f+rGCsuQuH4h6mbt5467dQmIbhj9BzgwO
         iKaQdpJbcdwaVk94naTF4+hRZJA4zOwB7MkeA4kwUEV/l4rqpS6GNeFj+fVh6NujU0M6
         /2/L0Y2seuhpjePiV/nmY8ulD1msL+JBfiR8d9uw3hGTR5+b8qzAboMdEhb1xjNWmAlS
         792fN69XWL8TqmpGK33HPQEb6zRWlpLaUBAz9xszVC37k40rbn7OZcjAFJCd5Ojstt3w
         qERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755803090; x=1756407890;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKLyVgqxSv578F+Btv5LEyuxiVTlyOhipe15BaqYJNY=;
        b=CAO/4zIJyBtpfk3sl6bkLdBey5NnxFAaXBQ3YYbb4gkmKKpx/DerR/b+ojuC5+M7Mo
         hykNqvNNduGbvD4rJiQBogw4UQoX3m5T/FORWyI/1TCEFpu3uZp9ip/LTbkgTpvl2PRf
         IoMxTGuIzunUVSJjyLweOtCNodJqk1WGnS1Plr8fFK73GJLxT9a2anGOr29GgbT0NAMP
         MGHvmCbKtN9/3LdRqGAkRLoOTT/ord40G9n9kz+QNhLVxgzQpojsjjtrHhkmTIWmAayX
         gos3buB3oJNIoQ8SO0e+92gfsrCFGTL35eglhw+W9hlb9VaiGsBNvtAUgcWWRjy/vHf7
         06ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdm2ATpCqbS4yjysx9HobjmH3q+8mwMQNwKjyfcf3uyIwix9n/DXfHEbVd440hppOK9wXJhIfuV0ufhAIA@vger.kernel.org, AJvYcCX0RE7h23Cq9t2jjpo76O76/njcwp8pEUB4N3cuHIQDXwKczlITnQXPHCdHnPLIxixQ56LwC9oOQUuc@vger.kernel.org, AJvYcCX3vOFs3/7W3hO6LXRM25Wtc/H2wnN3/ULKSRv3UNyryBWOPTsbPXGPoy9p8kYM7+oySdP85+ipIGmYwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMM9wmeay+ADUKR67rUffUjTOj0Gcic0TxGorOvb1dDTw8KBcX
	uXJ5Ev7g1cD94DSWopEoqDEbpP/Bm7A7+ykKEESuDyuSzmiO0oFKYcz5
X-Gm-Gg: ASbGncsu6Q0WyxNKn4IslQbyhTpB5KHZr0cuVelep4PZRfoXKkFqk8Hunx5LzF8FjE5
	SMmX3aKKeUFHm+0rPcvzuw0Sdc38ahlfZ6t/9Sk6Tcf335ISX6UeXDkNgfQ98J8DYATlPTAkQt1
	M1ElEksGtK6zua/gw++GKvB3uvJ09xmgzfXyXu/cWrlA3oL/8z3sLpv+ulMeS966vxj2fZtezIx
	4YQjcNABaV8UGVYBpRmG8BWtHb5jHiuYShA62e2N2SO2q7tLlK/fCfb2pnOfMB6p4AaQo6IHpBd
	hYM20gNNYVWMUx9DGKYrFA9MEVahHAMmt4CO5miieFhDO5X/9Ad86rtxF/+ST9PkYUsbkEjbw1P
	zvagfKe8b4Adu6uhteiy9iS3G+EwBfawhraG5D/jWHcsxfW/a0bVu90DLms06U21sSFCcxA==
X-Google-Smtp-Source: AGHT+IFL3x6G/nvMxQYt5l7SgziO12YjvIRdKQLoZldQkR3zsgf3FNPda3SCWO3GxaC606fIUtEyXA==
X-Received: by 2002:a05:620a:171f:b0:7e8:34b0:6e07 with SMTP id af79cd13be357-7ea10f96f5cmr55720785a.7.1755803089404;
        Thu, 21 Aug 2025 12:04:49 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9300f0asm109489726d6.36.2025.08.21.12.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 12:04:48 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:04:49 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/4=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-4-jefflessard3@gmail.com> <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com>
Message-ID: <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21 ao=C3=BBt 2025 04 h 08 min 51 s HAE, Andy Shevchenko <andy=2Eshevchen=
ko@gmail=2Ecom> a =C3=A9crit=C2=A0:
>On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
><jefflessard3@gmail=2Ecom> wrote:
>>
>> Add driver for TM16xx family LED controllers and compatible chips from =
multiple
>> vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, and Winris=
e=2E
>> These controllers drive 7-segment digits and individual LED icons throu=
gh either
>> I2C or SPI interfaces with optional keypad scanning support=2E
>>
>> Successfully tested on various ARM TV boxes including H96 Max, Magicsee=
 N5,
>> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platfo=
rms
>> (Rockchip, Amlogic, Allwinner)=2E
>
>
>This patch is ~1800 lines=2E Can you split it to a few based on main
>features (like the keyboard may be separated)? 2k is hard to review=2E
>

I agree that 1800 lines is a lot to review at once=2E For v4, I plan to sp=
lit the
submission into separate patches and source files for better reviewability
and maintainability:
- tm16xx=2Eh / tm16xx=2Ec (core driver)
- tm16xx_keypad=2Ec (keypad support)
- tm16xx_spi=2Ec (SPI glue)
- tm16xx_i2c=2Ec (I2C glue)

I believe this will improve clarity without fragmenting the driver nor its
DT bindings=2E

>> Acked-by: Paolo Sabatino <paolo=2Esabatino@gmail=2Ecom> # As primary us=
er, integrated tm16xx into Armbian rockchip64
>> Acked-by: Christian Hewitt <christianshewitt@gmail=2Ecom> # As primary =
user, integrated tm16xx into LibreElec
>
>I dunno what these tags may mean in the current context=2E=2E=2E
>

These =E2=80=9CAcked-by=E2=80=9D tags follow kernel submission guidelines =
to record approval
from key users=2E

Per Documentation/process/submitting-patches=2Erst:
Acked-by: may also be used by other stakeholders, such as people with doma=
in
knowledge (e=2Eg=2E the original author of the code being modified), users=
pace-side
reviewers for a kernel uAPI patch or key users of a feature=2E  Optionally=
, in
these cases, it can be useful to add a "# Suffix" to clarify its meaning::

	Acked-by: The Stakeholder <stakeholder@example=2Eorg> # As primary user

>=2E=2E=2E
>
>> +#include <linux/bitfield=2Eh>
>> +#include <linux/bitmap=2Eh>
>
>> +#include <linux/bitops=2Eh>
>
>When bitmap,h is included, bitops=2Eh is implied=2E But it's okay to incl=
ude both=2E
>
>> +#include <linux/delay=2Eh>
>> +#include <linux/i2c=2Eh>
>> +#include <linux/init=2Eh>
>> +#include <linux/input=2Eh>
>> +#include <linux/input/matrix_keypad=2Eh>
>> +#include <linux/leds=2Eh>
>> +#include <linux/map_to_7segment=2Eh>
>> +#include <linux/module=2Eh>
>
>Missing mod_devicetable=2Eh for the ID table definitions=2E
>
>> +#include <linux/of=2Eh>
>> +#include <linux/of_device=2Eh>
>
>Cargo-cult? These two should be rarely used in a new code, for this
>driver I'm pretty sure they need not to be used at all=2E
>
>> +#include <linux/property=2Eh>
>> +#include <linux/slab=2Eh>
>> +#include <linux/spi/spi=2Eh>
>> +#include <linux/version=2Eh>
>> +#include <linux/workqueue=2Eh>

Thanks for pointing that out=2E For v4, I will revise includes to:

#include <linux/bitfield=2Eh>
#include <linux/bitmap=2Eh>
#include <linux/i2c=2Eh>
#include <linux/input=2Eh>
#include <linux/input/matrix_keypad=2Eh>
#include <linux/leds=2Eh>
#include <linux/map_to_7segment=2Eh>
#include <linux/module=2Eh>
#include <linux/mod_devicetable=2Eh>
#include <linux/property=2Eh>
#include <linux/spi/spi=2Eh>
#include <linux/workqueue=2Eh>

>
>=2E=2E=2E
>
>> +#define TM16XX_DRIVER_NAME "tm16xx"
>> +#define TM16XX_DEVICE_NAME "display"
>
>Not sure why we need these two=2E
>

I will drop TM16XX_DEVICE_NAME since DT node name/label property should be=
 used=2E

The TM16XX_DRIVER_NAME macro is standard practice for consistent string us=
age
in registration and module macros=2E
If helpful, I can add a leading /* module name */ header comment=2E

>=2E=2E=2E
>
>> +/* Command type bits (bits 7-6) */
>> +#define TM16XX_CMD_MASK                GENMASK(7, 6)
>
>> +#define TM16XX_CMD_MODE                0
>> +#define TM16XX_CMD_DATA                BIT(6)
>> +#define TM16XX_CMD_CTRL                BIT(7)
>> +#define TM16XX_CMD_ADDR                (BIT(7) | BIT(6))
>
>As far as I can see these are clearly not bits, please use the form of
>(0 << 6), (1 << 6) and so on=2E
>

You are correct=2E Per datasheet, these fields represent enumerated values=
 of a
2-bit field and not independent single bits=2E I will update definitions
accordingly in v4 for clarity and correctness:

#define TM16XX_CMD_MODE  (0 << 6)
#define TM16XX_CMD_DATA  (1 << 6)
#define TM16XX_CMD_CTRL  (2 << 6)
#define TM16XX_CMD_ADDR  (3 << 6)

and similarly for other multi-bit fields=2E

>=2E=2E=2E
>
>> +/* Mode command grid settings (bits 1-0) */
>> +#define TM16XX_MODE_GRID_MASK  GENMASK(1, 0)
>
>> +#define TM16XX_MODE_4GRIDS     0
>> +#define TM16XX_MODE_5GRIDS     BIT(0)
>> +#define TM16XX_MODE_6GRIDS     BIT(1)
>> +#define TM16XX_MODE_7GRIDS     (BIT(1) | BIT(0))
>
>Ditto=2E
>
>=2E=2E=2E
>
>> +/* Data command settings */
>> +#define TM16XX_DATA_ADDR_MASK  BIT(2)
>
>> +#define TM16XX_DATA_ADDR_AUTO  0
>> +#define TM16XX_DATA_ADDR_FIXED BIT(2)
>
>Not sure why we need a definition for 0=2E But if it's required, make it
> similar to above=2E
>
>=2E=2E=2E
>
>> +#define TM16XX_DATA_MODE_MASK  GENMASK(1, 0)
>> +#define TM16XX_DATA_MODE_WRITE 0
>> +#define TM16XX_DATA_MODE_READ  BIT(1)
>
>Seems also needs to be converted to plain numbers=2E
>
>=2E=2E=2E
>
>> +#define TM1650_CTRL_BR_MASK    GENMASK(6, 4)
>> +#define TM1650_CTRL_ON         BIT(0)
>> +#define TM1650_CTRL_SLEEP      BIT(2)
>
>Are they really bits and not an enum in the datasheet?
>

These are respectively B0 and B2 according to the TM1650 datasheet:
- B0: Off screen display / Open screen display
- B1: fixed to 0
- B2: Normal operating mode / Standby mode
- B7-B4: brightness enum

>=2E=2E=2E
>
>> +#define TM1650_CTRL_SEG_MASK   BIT(3)
>
>> +#define TM1650_CTRL_SEG8_MODE  0
>> +#define TM1650_CTRL_SEG7_MODE  BIT(3)
>
>Same Q as per above case=2E
>

B3 controls 8 vs 7 segment mode=2E I will make it clearer:
#define TM1650_CTRL_SEG8_MODE  (0 << 3)
#define TM1650_CTRL_SEG7_MODE  (1 << 3)

>=2E=2E=2E
>
>> +#define TM16XX_CTRL_BRIGHTNESS(enabled, value, prefix) \
>> +       ((enabled) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (value)) | \
>> +                     prefix##_CTRL_ON) : 0)
>
>Okay, but can you split it logically, perhaps making it only one line
>(for the lines 2nd and 3rd)?
>

I currently format it as a multi-line macro respecting 80-column limit, wi=
th
conditional ternary expression on separate lines for readability=2E If you=
 prefer
a different formatting style or logical grouping, please advise, as I want=
 to
keep it consistent with kernel coding style=2E

>=2E=2E=2E
>
>> +static char *default_value;
>> +module_param(default_value, charp, 0444);
>> +MODULE_PARM_DESC(default_value, "Default display value to initialize")=
;
>
>Do we need this? Why?
>

This parameter was requested by community users to allow a boot message
(e=2Eg=2E, =E2=80=9Cboot=E2=80=9D) before user space takes control of the =
display value=2E I believe a
module parameter is appropriate here to maintain separation between driver
internals and user content, avoiding hardcoding display content in DT or c=
ode=2E

>=2E=2E=2E
>
>> +static inline u16 tm16xx_get_grid(const struct tm16xx_display *display=
,
>> +                                 const unsigned int grid)
>> +{
>> +       return (u16)bitmap_read(display->state, grid * display->num_seg=
ments,
>
>Why casting?
>

I agree the cast to u16 is redundant and will remove it=2E

>> +                               display->num_segments);
>> +}
>
>=2E=2E=2E
>
>> +#define for_each_key(keypad, _r, _c) \
>
>This is too broad a name for the macro=2E If it's useful not only in
>this driver, make it in one of the linux/input* headers perhaps=2E
>
>> +       for (unsigned int (_r) =3D 0; \
>
>Can _r be an expression? Really?
>
>> +            (_r) < (keypad)->display->controller->max_key_rows; (_r)++=
) \
>> +               for (unsigned int (_c) =3D 0; \
>
>Same about _c=2E
>
>> +                    (_c) < (keypad)->display->controller->max_key_cols=
; (_c)++)
>

I will rename it to tm16xx_for_each_key to avoid overly generic macro name=
s
and remove parentheses around arguments to conform with kernel macro
conventions=2E

>=2E=2E=2E
>
>> +       mutex_lock(&keypad->display->lock);
>
>Perhaps scoped_guard() from cleanup=2Eh?
>

I will replace manual mutex locking with modern scoped guard constructs=2E

>> +       ret =3D keypad->display->controller->keys(keypad);
>> +       mutex_unlock(&keypad->display->lock);
>> +
>> +       if (ret < 0) {
>> +               dev_err(keypad->display->dev, "Reading failed: %d\n", r=
et);
>> +               return;
>> +       }
>
>=2E=2E=2E
>
>> +       for_each_set_bit(bit, keypad->changes, nbits) {
>> +               row =3D tm16xx_get_key_row(keypad, bit);
>> +               col =3D tm16xx_get_key_col(keypad, bit);
>> +               pressed =3D _test_bit(bit, keypad->state);
>
>> +               u16 scancode =3D MATRIX_SCAN_CODE(row, col, keypad->row=
_shift);
>
>Don't mix definitions and code=2E It's only relaxed for iterators and
>RAII (cleanup=2Eh) variables in Linux kernel=2E
>

I will move variable declarations to the beginning of blocks=2E

>> +               dev_dbg(keypad->display->dev,
>> +                       "key changed: %u, row=3D%u col=3D%u down=3D%d\n=
", bit, row,
>> +                       col, pressed);
>> +
>> +               input_event(keypad->input, EV_MSC, MSC_SCAN, scancode);
>> +               input_report_key(keypad->input, keycodes[scancode], pre=
ssed);
>> +       }
>
>=2E=2E=2E
>
>> +static int tm16xx_keypad_probe(struct tm16xx_display *display)
>> +{
>> +       const u8 rows =3D display->controller->max_key_rows;
>> +       const u8 cols =3D display->controller->max_key_cols;
>> +       struct tm16xx_keypad *keypad;
>> +       struct input_dev *input;
>> +       unsigned int poll_interval, nbits;
>> +       int ret =3D 0;
>
>I don't see how this assignment is used=2E
>

I will remove this unnecessary initialization=2E

>> +       if (!display->controller->keys || !rows || !cols) {
>> +               dev_dbg(display->dev, "keypad not supported\n");
>> +               return 0;
>> +       }
>> +
>> +       if (!device_property_present(display->dev, "poll-interval") ||
>> +           !device_property_present(display->dev, "linux,keymap")) {
>> +               dev_dbg(display->dev, "keypad disabled\n");
>> +               return 0;
>> +       }
>> +
>> +       dev_dbg(display->dev, "Configuring keypad\n");
>> +
>> +       ret =3D device_property_read_u32(display->dev, "poll-interval",
>> +                                      &poll_interval);
>> +       if (ret < 0) {
>> +               dev_err(display->dev, "Failed to read poll-interval: %d=
\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       keypad =3D devm_kzalloc(display->dev, sizeof(*keypad), GFP_KERN=
EL);
>> +       if (!keypad)
>> +               return -ENOMEM;
>> +       keypad->display =3D display;
>> +
>> +       nbits =3D tm16xx_key_nbits(keypad);
>> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits, GFP_K=
ERNEL);
>> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, nbits, =
GFP_KERNEL);
>> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbits, GFP=
_KERNEL);
>> +       if (!keypad->state || !keypad->last_state || !keypad->changes) =
{
>> +               ret =3D -ENOMEM;
>> +               goto free_keypad;
>> +       }
>> +
>> +       input =3D devm_input_allocate_device(display->dev);
>> +       if (!input) {
>
>> +               dev_err(display->dev, "Failed to allocate input device\=
n");
>> +               ret =3D -ENOMEM;
>> +               goto free_bitmaps;
>> +       }
>> +       input->name =3D TM16XX_DRIVER_NAME "-keypad";
>> +       keypad->input =3D input;
>> +       input_set_drvdata(input, keypad);
>> +
>> +       keypad->row_shift =3D get_count_order(cols);
>> +       ret =3D matrix_keypad_build_keymap(NULL, "linux,keymap", rows, =
cols, NULL,
>> +                                        input);
>> +       if (ret < 0) {
>> +               dev_err(display->dev, "Failed to build keymap: %d\n", r=
et);
>> +               goto free_input;
>> +       }
>> +
>> +       if (device_property_read_bool(display->dev, "autorepeat"))
>> +               __set_bit(EV_REP, input->evbit);
>> +
>> +       input_setup_polling(input, tm16xx_keypad_poll);
>> +       input_set_poll_interval(input, poll_interval);
>> +       ret =3D input_register_device(input);
>> +       if (ret < 0) {
>> +               dev_err(display->dev, "Failed to register input device:=
 %d\n",
>> +                       ret);
>> +               goto free_input;
>> +       }
>> +
>> +       dev_dbg(display->dev, "keypad rows=3D%u, cols=3D%u, poll=3D%u\n=
", rows, cols,
>> +               poll_interval);
>> +
>> +       return 0;
>> +
>> +free_input:
>> +       input_free_device(input);
>> +free_bitmaps:
>> +       devm_kfree(display->dev, keypad->state);
>> +       devm_kfree(display->dev, keypad->last_state);
>> +       devm_kfree(display->dev, keypad->changes);
>> +free_keypad:
>> +       devm_kfree(display->dev, keypad);
>> +       return ret;
>> +}
>
>=2E=2E=2E
>
>I stopped here, I believe it's enough for now (and I would wait for
>the smaller changes per patch, perhaps 2 DT bindings patch + common
>part (basic functionality) + spi driver + i2c driver + keyboard,
>something like 6+ patches)=2E
>Also, split i2c and spi glue drivers to a separate modules, so you
>will have 3 files:
>
>$main
>$main_i2c
>$main_spi
>
>Look at ton of examples under drivers/iio/
>

I plan to split source files for review but maintain a single unified kern=
el
module that handles both I2C and SPI buses=2E This avoids confusion and
unnecessary duplication since the hardware and DT bindings are shared=2E
If you intended splitting into separate loadable kernel modules for I2C
and SPI, could you please clarify? I believe a single driver module better
fits this hardware model=2E

>--
>With Best Regards,
>Andy Shevchenko

Thank you for the thorough feedback; I will incorporate these changes in v=
4 and
welcome further guidance=2E

Best regards,
Jean-Fran=C3=A7ois Lessard


