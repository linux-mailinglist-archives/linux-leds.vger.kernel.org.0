Return-Path: <linux-leds+bounces-5283-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C038B30BCA
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 04:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18597A23AC0
	for <lists+linux-leds@lfdr.de>; Fri, 22 Aug 2025 02:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31B619F422;
	Fri, 22 Aug 2025 02:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt4jco8Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA79156F45;
	Fri, 22 Aug 2025 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755829253; cv=none; b=f5mdvNkDPI+3zCc1c4Cz0zTk5+MHCDi2B20ZaV8arTGE1CBsTN+zC9DwzupZ+hwAnACFL/XRFuwOSDwD6MVa54R81WzbxplWiiUJrnTT9VQPnQDas+t3sWAQJacRKxzuaETg6ONcrDcnvDKgojnh7a8i+CNVUSjUz1IY0w6EzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755829253; c=relaxed/simple;
	bh=6O8fYlO1R5x6/jbEeNC0N2qygbRIw1qrchUEw4YATVg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=KRJ81rJFO7Tzp4Agvbw4GzWeQVqmPRRxAG812L4Z3zK6DEnGkCiAt+kRvZ2NtoGMu1XstEIBFIxqOuKDPyDPinw+CAPUOQzbX+Jix3794JAw0Uvvx+uQb/DeoQQmA+DAmfjTLhiR6oPsdkhvIapgVzKNe7AdUdkyxJglNESeAes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt4jco8Y; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b1099192b0so28387831cf.0;
        Thu, 21 Aug 2025 19:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755829250; x=1756434050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+L3amawsSiHQRqV1QKvj1U+TFZjbLvfwHvMxNBF9cEU=;
        b=Vt4jco8Yivyb/HM+Jp8LPBlkBysJsXeObI1aPccqZC2UvbsptSPHJC0URoBmH6Eu8n
         VmJywg98oadzNN72fjOkX8v80yYjOgydMNoyP7TwkfbdAchG0/GV/9/6f1cuIIb/UaNB
         HqLSoAdPd/TylvNGoOMmuEkfXRhXyaQ1flgGsyESRu5TLrzXmSBQelCqEsIaWAT04jC3
         2zxUKtQU103PxhdDgN4/BUZkwVmgPQ6RSq8vs8LKOWA5gi7VOaGtGRNXsjAjBj2MvW5L
         OQ1Owcc3nH4NM3eqkoxa07wIJbwtVcMKNaJP5kykKGZmjTVHBpGe4oKuVYAF97x0wAuu
         I35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755829250; x=1756434050;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+L3amawsSiHQRqV1QKvj1U+TFZjbLvfwHvMxNBF9cEU=;
        b=RzG6RRuV+Sm6mGOH1tpieJhyt5S2NKOTp0s+Jx4E4KAUs85H1Z7jY/TQ0PwV/8M3ap
         T13ik3Efp+ChG+c77GHVwuDfWkVoAXcqsGrtaMosjs2NWkF+aq0Yx5TIOL78k+G372px
         YLTC/UDRxlkK60CdqUM5tH+OUPYeKyjwWC9Ev+Jzr0o9SnAZ3qjxVZQ/mI4yK0f5kFSh
         IeshN9sK7cuIhuT3aKHc0LfLgHIsPCq5MLe0j9k0GSFJ0MqBJ/5UOlGRnlfSCfyFxx7K
         TmhARGDOWccmadzkeYvzVGOlNLd/0sI0nTteoXl+uyoJgQfhzWrxOOEY2ERkjQLRPGkY
         DSXw==
X-Forwarded-Encrypted: i=1; AJvYcCVGW7VL4DKqBgrX3wIwKDwE8xmki5ePYMDMmggXVoAMWUzJbEhUiYhKGNaK/tpaHQYnUylhJNPaT/Hx@vger.kernel.org, AJvYcCWup9ghr9QLjNZI48E18dxRiJkPvLdfkIRuqj4gFVyZdP1bUGNmBHlhjJe22M1cv1HnnnrsNe9kEWjn/Q==@vger.kernel.org, AJvYcCX7EkykGqRFIzk5lNBwWjZQJOD1I9pt8mZfYchvqyDingC+RAQPjB0hHdoSxXaHIJxsfl/xKpxXWUDDWApF@vger.kernel.org
X-Gm-Message-State: AOJu0YxShMrjdZe5EgDJueCtQCdB59Oe8W3YQghdZyj1xgN90CbPES4H
	56vdc8thE21DD8gd+5bNvLv7sj7Fb5l0SozRBBhgRBGVEcYCtYwUbjih
X-Gm-Gg: ASbGncuM0PaCot8Dw0fQaJz/udDqWg06AH3FowJogRUxI8STmSFD3QyZKPXguQyQF3A
	rTjlVGA46E6HH6wmNadvDPD9QSdX0a9QFZ4Ukw+kSCuD+Vc6toc0G9CEu4qnS+5/IRggGKxlJUe
	fW1o5GDVAdXl7Z7KMO4vy5aJnwvDEuKj/oh2wRaqZInjklrombQ5qFok8YKj6gJLajklMeEkaup
	B5OdG1rHEWh6rS33vU1L9xP08j58XTF2IhA370sUz2SFtc1lpo/b6nhlCxxPXI517VwUqxgXwha
	G7mhjAWua25gQ+0UBX8OTEwaIC+/QIS7bTzysotKsBoSubaAIR5PDi38vXC6oyS07xW2wgTgZh0
	J49BmujuiVnrvynUVUlIrfO2WFx5WwmyIoDDSaFBhrOCq/fvkqccdvjLepJksM255Dk37Ke876Z
	rWkC1p
X-Google-Smtp-Source: AGHT+IH2ML+9EvoImoYh4vzbrS8AhGBT8c/Ck3cZA4lCK3+f0yQ/ujxVonsICOfMnbyE2KVp3+pm4w==
X-Received: by 2002:a05:622a:400e:b0:4ab:6154:d2a3 with SMTP id d75a77b69052e-4b2aab4ac00mr20498701cf.52.1755829250448;
        Thu, 21 Aug 2025 19:20:50 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc5c8a8sm113713741cf.23.2025.08.21.19.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 19:20:50 -0700 (PDT)
Date: Thu, 21 Aug 2025 22:20:46 -0400
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
In-Reply-To: <CAHp75Vcdp5fHPNAy=_iEFR6Fa5PEE4U++T5owE1mW_H2-y3ijA@mail.gmail.com>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-4-jefflessard3@gmail.com> <CAHp75VfG7p+YYV1b9f6i_o-VrLhMh_=TaLdZTVRWHa8ky-G8Zg@mail.gmail.com> <D21AECF9-85D7-4846-9DE6-8B9DD912339D@gmail.com> <CAHp75Vcdp5fHPNAy=_iEFR6Fa5PEE4U++T5owE1mW_H2-y3ijA@mail.gmail.com>
Message-ID: <D0111A5F-5FA1-4405-A86A-C0D772FDAAEA@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21 ao=C3=BBt 2025 16 h 19 min 23 s HAE, Andy Shevchenko <andy=2Eshevchen=
ko@gmail=2Ecom> a =C3=A9crit=C2=A0:
>On Thu, Aug 21, 2025 at 10:04=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
><jefflessard3@gmail=2Ecom> wrote:
>> Le 21 ao=C3=BBt 2025 04 h 08 min 51 s HAE, Andy Shevchenko <andy=2Eshev=
chenko@gmail=2Ecom> a =C3=A9crit :
>> >On Wed, Aug 20, 2025 at 7:32=E2=80=AFPM Jean-Fran=C3=A7ois Lessard
>> ><jefflessard3@gmail=2Ecom> wrote:
>
>=2E=2E=2E
>
>> >This patch is ~1800 lines=2E Can you split it to a few based on main
>> >features (like the keyboard may be separated)? 2k is hard to review=2E
>>
>> I agree that 1800 lines is a lot to review at once=2E For v4, I plan to=
 split the
>> submission into separate patches and source files for better reviewabil=
ity
>> and maintainability:
>> - tm16xx=2Eh / tm16xx=2Ec (core driver)
>> - tm16xx_keypad=2Ec (keypad support)
>> - tm16xx_spi=2Ec (SPI glue)
>> - tm16xx_i2c=2Ec (I2C glue)
>>
>> I believe this will improve clarity without fragmenting the driver nor =
its
>> DT bindings=2E
>
>Sounds good=2E
>

Excellent, I'll proceed with this structure for v4=2E

>=2E=2E=2E
>
>> >> Acked-by: Paolo Sabatino <paolo=2Esabatino@gmail=2Ecom> # As primary=
 user, integrated tm16xx into Armbian rockchip64
>> >> Acked-by: Christian Hewitt <christianshewitt@gmail=2Ecom> # As prima=
ry user, integrated tm16xx into LibreElec
>> >
>> >I dunno what these tags may mean in the current context=2E=2E=2E
>>
>> These =E2=80=9CAcked-by=E2=80=9D tags follow kernel submission guidelin=
es to record approval
>> from key users=2E
>>
>> Per Documentation/process/submitting-patches=2Erst:
>> Acked-by: may also be used by other stakeholders, such as people with d=
omain
>> knowledge (e=2Eg=2E the original author of the code being modified), us=
erspace-side
>> reviewers for a kernel uAPI patch or key users of a feature=2E  Optiona=
lly, in
>> these cases, it can be useful to add a "# Suffix" to clarify its meanin=
g::
>>
>>         Acked-by: The Stakeholder <stakeholder@example=2Eorg> # As prim=
ary user
>
>Ah, interesting=2E TIL=2E
>

Good to clarify - I'll keep these as they follow established process=2E

>=2E=2E=2E
>
>> >> +#include <linux/bitfield=2Eh>
>> >> +#include <linux/bitmap=2Eh>
>> >
>> >> +#include <linux/bitops=2Eh>
>> >
>> >When bitmap,h is included, bitops=2Eh is implied=2E But it's okay to i=
nclude both=2E
>> >
>> >> +#include <linux/delay=2Eh>
>> >> +#include <linux/i2c=2Eh>
>> >> +#include <linux/init=2Eh>
>> >> +#include <linux/input=2Eh>
>> >> +#include <linux/input/matrix_keypad=2Eh>
>> >> +#include <linux/leds=2Eh>
>> >> +#include <linux/map_to_7segment=2Eh>
>> >> +#include <linux/module=2Eh>
>> >
>> >Missing mod_devicetable=2Eh for the ID table definitions=2E
>> >
>> >> +#include <linux/of=2Eh>
>> >> +#include <linux/of_device=2Eh>
>> >
>> >Cargo-cult? These two should be rarely used in a new code, for this
>> >driver I'm pretty sure they need not to be used at all=2E
>> >
>> >> +#include <linux/property=2Eh>
>> >> +#include <linux/slab=2Eh>
>> >> +#include <linux/spi/spi=2Eh>
>> >> +#include <linux/version=2Eh>
>> >> +#include <linux/workqueue=2Eh>
>>
>> Thanks for pointing that out=2E For v4, I will revise includes to:
>>
>> #include <linux/bitfield=2Eh>
>> #include <linux/bitmap=2Eh>
>
>> #include <linux/i2c=2Eh>
>
>Probably not this in the core file=2E
>
>> #include <linux/input=2Eh>
>> #include <linux/input/matrix_keypad=2Eh>
>> #include <linux/leds=2Eh>
>> #include <linux/map_to_7segment=2Eh>
>> #include <linux/module=2Eh>
>> #include <linux/mod_devicetable=2Eh>
>> #include <linux/property=2Eh>
>> #include <linux/spi/spi=2Eh>
>
>Nor this=2E
>
>> #include <linux/workqueue=2Eh>
>

Agreed=2E With the split structure, bus-specific headers will only be in t=
heir
respective glue files=2E I will need to reintroduce #include <linux/of=2Eh=
> in the
SPI glue for of_match_ptr since it's not included via spi=2Eh (unlike i2c=
=2Eh)=2E

>=2E=2E=2E
>
>> >> +#define TM16XX_DRIVER_NAME "tm16xx"
>> >> +#define TM16XX_DEVICE_NAME "display"
>> >
>> >Not sure why we need these two=2E
>>
>> I will drop TM16XX_DEVICE_NAME since DT node name/label property should=
 be used=2E
>>
>> The TM16XX_DRIVER_NAME macro is standard practice for consistent string=
 usage
>> in registration and module macros=2E
>> If helpful, I can add a leading /* module name */ header comment=2E
>
>Instead of an unneeded comment it seems better to use explicit string
>literal in all cases (two?)=2E
>

I'm surprised by this preference since driver name macros are very common
practice, but I'll use explicit string literals to align on this preferenc=
e=2E

>=2E=2E=2E
>
>> >> +#define TM1650_CTRL_BR_MASK    GENMASK(6, 4)
>> >> +#define TM1650_CTRL_ON         BIT(0)
>> >> +#define TM1650_CTRL_SLEEP      BIT(2)
>> >
>> >Are they really bits and not an enum in the datasheet?
>>
>> These are respectively B0 and B2 according to the TM1650 datasheet:
>> - B0: Off screen display / Open screen display
>> - B1: fixed to 0
>> - B2: Normal operating mode / Standby mode
>> - B7-B4: brightness enum
>
>I see, I would put a double names then
>
>_OFF_OPEN // is it "open" or "on"? What's the difference?
>_RUN_STANDBY
>
>(find better names)
>
>=2E=2E=2E
>
>> >> +#define TM1650_CTRL_SEG_MASK   BIT(3)
>> >
>> >> +#define TM1650_CTRL_SEG8_MODE  0
>> >> +#define TM1650_CTRL_SEG7_MODE  BIT(3)
>> >
>> >Same Q as per above case=2E
>>
>> B3 controls 8 vs 7 segment mode=2E I will make it clearer:
>> #define TM1650_CTRL_SEG8_MODE  (0 << 3)
>> #define TM1650_CTRL_SEG7_MODE  (1 << 3)
>
>Hmm=2E=2E=2E Here it's clear and both are probably needed in the code, bu=
t
>maybe it also makes sense to put similar for the above?
>
>CTRL_OFF (0 << =2E=2E=2E)
>CTRL_OPEN
>CTRL_RUN
>CTRL_STANDBY
>
>?
>

Yes, for consistency I'll use bit shifts for all field values while keepin=
g
*_MASK definitions using GENMASK/BIT to clearly describe bit positions=2E
This makes both usage and pattern clear=2E

>=2E=2E=2E
>
>> >> +#define TM16XX_CTRL_BRIGHTNESS(enabled, value, prefix) \
>> >> +       ((enabled) ? (FIELD_PREP(prefix##_CTRL_BR_MASK, (value)) | \
>> >> +                     prefix##_CTRL_ON) : 0)
>> >
>> >Okay, but can you split it logically, perhaps making it only one line
>> >(for the lines 2nd and 3rd)?
>>
>> I currently format it as a multi-line macro respecting 80-column limit,=
 with
>> conditional ternary expression on separate lines for readability=2E If =
you prefer
>> a different formatting style or logical grouping, please advise, as I w=
ant to
>> keep it consistent with kernel coding style=2E
>
>We have a relaxed format and I don't mind that people use it=2E But the
>main point here is readability / logical split=2E Also parameter names
>can be shortened a bit (like value --> val, enable --> en{a} / on=2E
>

Understood=2E I'll shorten parameter names and format it on a single line
using the relaxed column length for better readability=2E

>=2E=2E=2E
>
>> >> +static char *default_value;
>> >> +module_param(default_value, charp, 0444);
>> >> +MODULE_PARM_DESC(default_value, "Default display value to initializ=
e");
>> >
>> >Do we need this? Why?
>>
>> This parameter was requested by community users to allow a boot message
>> (e=2Eg=2E, =E2=80=9Cboot=E2=80=9D) before user space takes control of t=
he display value=2E I believe a
>> module parameter is appropriate here to maintain separation between dri=
ver
>> internals and user content, avoiding hardcoding display content in DT o=
r code=2E
>
>Currently we have a compile-time option and I don't think module
>parameter is what we need=2E If somebody wants it, please make it a
>separate patch with much better justification ("a user wants it"
>doesn't work)=2E DT most likely is also not the best choice as it's
>about HW and not some policies=2E
>
>TL;DR: please drop it for now (but if you wish something, use the
>compile time option we have in Kconfig for that)=2E
>

Perfect suggestion! I'll drop the module parameter and replace it with a
CONFIG_PANEL_BOOT_MESSAGE Kconfig option=2E This is a much cleaner
approach than a module parameter=2E

>=2E=2E=2E
>
>> >> +static int tm16xx_keypad_probe(struct tm16xx_display *display)
>> >> +{
>> >> +       const u8 rows =3D display->controller->max_key_rows;
>> >> +       const u8 cols =3D display->controller->max_key_cols;
>> >> +       struct tm16xx_keypad *keypad;
>> >> +       struct input_dev *input;
>> >> +       unsigned int poll_interval, nbits;
>> >> +       int ret =3D 0;
>> >
>> >I don't see how this assignment is used=2E
>>
>> I will remove this unnecessary initialization=2E
>>
>> >> +       if (!display->controller->keys || !rows || !cols) {
>> >> +               dev_dbg(display->dev, "keypad not supported\n");
>> >> +               return 0;
>> >> +       }
>> >> +
>> >> +       if (!device_property_present(display->dev, "poll-interval") =
||
>> >> +           !device_property_present(display->dev, "linux,keymap")) =
{
>> >> +               dev_dbg(display->dev, "keypad disabled\n");
>> >> +               return 0;
>> >> +       }
>> >> +
>> >> +       dev_dbg(display->dev, "Configuring keypad\n");
>> >> +
>> >> +       ret =3D device_property_read_u32(display->dev, "poll-interva=
l",
>> >> +                                      &poll_interval);
>> >> +       if (ret < 0) {
>> >> +               dev_err(display->dev, "Failed to read poll-interval:=
 %d\n", ret);
>> >> +               return ret;
>> >> +       }
>> >> +
>> >> +       keypad =3D devm_kzalloc(display->dev, sizeof(*keypad), GFP_K=
ERNEL);
>> >> +       if (!keypad)
>> >> +               return -ENOMEM;
>> >> +       keypad->display =3D display;
>> >> +
>> >> +       nbits =3D tm16xx_key_nbits(keypad);
>> >> +       keypad->state =3D devm_bitmap_zalloc(display->dev, nbits, GF=
P_KERNEL);
>> >> +       keypad->last_state =3D devm_bitmap_zalloc(display->dev, nbit=
s, GFP_KERNEL);
>> >> +       keypad->changes =3D devm_bitmap_zalloc(display->dev, nbits, =
GFP_KERNEL);
>> >> +       if (!keypad->state || !keypad->last_state || !keypad->change=
s) {
>> >> +               ret =3D -ENOMEM;
>
>> >> +               goto free_keypad;
>
>(Hit send too early that time=2E=2E=2E) This goto is bad=2E It means
>misunderstanding of the devm concept=2E See below=2E
>

I can assure I understand the devm paradigm=2E The keypad probe is optiona=
l,
failure doesn't fail the main driver probe but only generates a warning=2E=
 The
cleanup code prevents memory from staying allocated until device removal
in this specific optional failure case=2E However, if you insist, I'll rem=
ove the
cleanup and let devm handle it normally=2E

>> >> +       }
>> >> +
>> >> +       input =3D devm_input_allocate_device(display->dev);
>> >> +       if (!input) {
>> >
>> >> +               dev_err(display->dev, "Failed to allocate input devi=
ce\n");
>> >> +               ret =3D -ENOMEM;
>
>No, we do not spill an error message on ENOMEM=2E This is an agreement
>in the kernel community for drivers=2E
>

Acknowledged, my fault=2E I'll ensure there are no ENOMEM error messages=
=2E

>> >> +               goto free_bitmaps;
>> >> +       }
>> >> +       input->name =3D TM16XX_DRIVER_NAME "-keypad";
>> >> +       keypad->input =3D input;
>> >> +       input_set_drvdata(input, keypad);
>> >> +
>> >> +       keypad->row_shift =3D get_count_order(cols);
>> >> +       ret =3D matrix_keypad_build_keymap(NULL, "linux,keymap", row=
s, cols, NULL,
>> >> +                                        input);
>> >> +       if (ret < 0) {
>> >> +               dev_err(display->dev, "Failed to build keymap: %d\n"=
, ret);
>> >> +               goto free_input;
>> >> +       }
>> >> +
>> >> +       if (device_property_read_bool(display->dev, "autorepeat"))
>> >> +               __set_bit(EV_REP, input->evbit);
>> >> +
>> >> +       input_setup_polling(input, tm16xx_keypad_poll);
>> >> +       input_set_poll_interval(input, poll_interval);
>> >> +       ret =3D input_register_device(input);
>> >> +       if (ret < 0) {
>> >> +               dev_err(display->dev, "Failed to register input devi=
ce: %d\n",
>> >> +                       ret);
>
>Use in all cases like this
>
>  return dev_err_probe(=2E=2E=2E);
>
>pattern=2E
>

Thank you for pointing this out=2E I wasn't familiar with dev_err_probe()=
=2E
I'll add this to my toolbox and use it consistently=2E

>> >> +               goto free_input;
>> >> +       }
>> >> +
>> >> +       dev_dbg(display->dev, "keypad rows=3D%u, cols=3D%u, poll=3D%=
u\n", rows, cols,
>> >> +               poll_interval);
>> >> +
>> >> +       return 0;
>
>> >> +free_input:
>> >> +       input_free_device(input);
>
>> >> +free_bitmaps:
>> >> +       devm_kfree(display->dev, keypad->state);
>> >> +       devm_kfree(display->dev, keypad->last_state);
>> >> +       devm_kfree(display->dev, keypad->changes);
>> >> +free_keypad:
>> >> +       devm_kfree(display->dev, keypad);
>> >> +       return ret;
>
>No way=2E We don't do that, If required it signals about exceptional
>case (0=2E01% probability) or misunderstanding of devm:
>- managed resources are managed by core, no need to call for free
>- using managed resources in the contexts when object lifetime is
>short is incorrect, needs to be switched to the plain alloc (nowadays
>with __free() from cleanup=2Eh to have RAII enabled)
>
>Choose one of these and fix the code accordingly=2E
>

Same as above=2E

>>
>> +}
>
>=2E=2E=2E
>
>> >I stopped here, I believe it's enough for now (and I would wait for
>> >the smaller changes per patch, perhaps 2 DT bindings patch + common
>> >part (basic functionality) + spi driver + i2c driver + keyboard,
>> >something like 6+ patches)=2E
>> >Also, split i2c and spi glue drivers to a separate modules, so you
>> >will have 3 files:
>> >
>> >$main
>> >$main_i2c
>> >$main_spi
>> >
>> >Look at ton of examples under drivers/iio/
>> >
>>
>> I plan to split source files for review but maintain a single unified k=
ernel
>> module that handles both I2C and SPI buses=2E This avoids confusion and
>> unnecessary duplication since the hardware and DT bindings are shared=
=2E
>> If you intended splitting into separate loadable kernel modules for I2C
>> and SPI, could you please clarify? I believe a single driver module bet=
ter
>> fits this hardware model=2E
>
>Please, make two independent glue drivers=2E The common approach is
>error prone=2E See, for example, this:
>https://stackoverflow=2Ecom/q/79462895/2511795 (read about kernel
>autoloading part)=2E
>

Thanks for clarifying and providing the link=2E I understand now=2E I'll s=
plit into
separate modules (tm16xx_i2c=2Eko, tm16xx_spi=2Eko) with shared core follo=
wing
IIO-style practice to ensure reliable kernel autoloading and proper module
aliasing=2E

Best regards,
Jean-Fran=C3=A7ois Lessard

