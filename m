Return-Path: <linux-leds+bounces-5955-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB57C26509
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 18:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3A7D35054D
	for <lists+linux-leds@lfdr.de>; Fri, 31 Oct 2025 17:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7840D2E0915;
	Fri, 31 Oct 2025 17:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmaCf/xu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACBF1DDC1B
	for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761931074; cv=none; b=k2h8lwo4GKc4k1V/sQC8u3N4E0ZAhkWlvbqFEOKkIGJgAUHUBMFrT8KhGsjnqTzlTFjT5By5yjGF0GCP3B9nyFbSgwVucZhsWjJIo1A7Wy1qJ5forvTcpSDpVjtW8HeZGbTbspcandBswrXXu+zN1nmL6ROWxlUAQJFxdNV+qUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761931074; c=relaxed/simple;
	bh=6YE+EUsQGtSx446gpZNZw+eN2rFdcYZpwhURMadYCFM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=av7lsqI/P/7FJ/YWuutaMBa5szfLZksM2o0S1pXLt0DPz/KEFRKcYsEonLdM6Ds8DapzLmfn0f/u9ex9RhOSIwDsZe6jODtCGAfmKHn4J9JMt9zGRI0Kl/Tdk6PEOxtSrME69xEZVCQkiy6p8tEC/jsVajGmBmUw3HH0fFVC8TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmaCf/xu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4ecf30c734eso23301221cf.3
        for <linux-leds@vger.kernel.org>; Fri, 31 Oct 2025 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761931071; x=1762535871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L406zOhjGvRQjgKoF167xXspJON4fHy2737WT3qLAWI=;
        b=hmaCf/xuUs8QAEBgNE27wSJLHvh2ZV/u0m72sQFwvqYEDpmEdbDamanjvN0GdE5Dpy
         4FSx8wIWX97MQDOooqeumcMqElhiT8gwz28oMGA1sQZZZkcGEllACQP2EIsEZo31H+wO
         dJRT3Lf/xLIRxgKBrEje/mK+w4aA8ivlt3jwRbP7ToP943SNcyx13577yUzijd2XTcQV
         kT/AH5P9s6WmWjYfEOV+7WaNtB3+R1aOSdKEAnULrlDPwCoyAxW9sGhnZDduTUCAp753
         dl0KUie3lraB0LprD9/NLhkWC0mhde40r+9SHytnw8s4X6915ZdPQM7307FyPRATjdt8
         MyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761931071; x=1762535871;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L406zOhjGvRQjgKoF167xXspJON4fHy2737WT3qLAWI=;
        b=MfkMkdrCgz/opEh1qg+1gX1G6RDmTtgOVuIDtM+BpWO5O7U3UWyTishdEJy7CX6Bm/
         RZYcLmBemYxsVZqUJFpfmXMrgzQbpoBQLuo4WrOEJQUGjXhF1IHWu5uOPgHV40pHu69s
         QrLeVHwSd0gVd3A2VOToMPKd1eFyLH4WYZ3rpnGtKUFDikcAR4t7dB6Ys8Lw5TCvT9uX
         A91Ze2WtlitT1gKlGRFsr/ZVEoHxni9LoFmxfeIl0FJsXkAhpXTqy9OVgkRoszuAhCEn
         ET5fIOgWNF7VJdUXhM15bQVydNTqExBJAgzZLSqS8eWesj/2aitpLeOkLueo3Cq82vzU
         PpxA==
X-Forwarded-Encrypted: i=1; AJvYcCW4vIq9oCbaRo9a0aWwgy1adrtGOncdXNfGwqiULMROwe/ltjoqTbKiqbLm3UdNa0HGcqF4/fqTdqV4@vger.kernel.org
X-Gm-Message-State: AOJu0YzeGZQmF+v7Khst9jMkwG9nU2ArnDnOwvbtbyaohZfkWEZrJ1Wb
	58ow9X+AJzAtT1ygBT0LV5TK/WD4iK+3jXBhLUuPSbGyu11JV1ND7q9T
X-Gm-Gg: ASbGncvxg6ipVEOuA5xmOLc3wKXyb2QS9pvOWLub/eAqhC4M4c7x44Cgo5mdwoxMlAR
	YC2nq2TWfu61hqtnX25CYfdN3f6lg8Q6miEVsYYnNHugXM+jeNeNGuiPMtGxfeLRjzKEFYCardw
	YHQFVNWiOImI5MSq/Hm0NHmkpOBpTpw+jkNWb1YS1Xn+vEYUQOr6pxKzVWlwYmaHE/HFv2U0FfB
	eSNXQHI3JmHhogq2Fqjk5cciOzzwzLAUgKhYtOGbwvkb0YY3S5PUuqaE30OVRq1iKbj5BVpvZpW
	xBCRNtg4USp0eb9juQI5gy8UhFD6xYk0DCmrq6hdxRQkqOGiy/daF/WroYcR6ge6h/aAaRl3TUk
	bA9IL9u+AgIyErnuYrOiGMdudsan83nSmp1J2JdO5O+zChO6DOHgkJxWIGSXogaDFU3FQzaCZP4
	Wc0o9PNU2G4ob9l+AVlzRpqTq8qU2IbaOrcgt1aG0cmWodLDgOdTA3pCEP2dKD2PWk3Btqhg==
X-Google-Smtp-Source: AGHT+IFF/xbXKHeh0aqy6rNM3iGGALnl75ODFeCzjDabWgvjFVkdKRlNgEsFE7VrNQsbJgdY/32joA==
X-Received: by 2002:a05:622a:5518:b0:4e8:9c45:de4b with SMTP id d75a77b69052e-4ed30f8b639mr62531971cf.44.1761931070737;
        Fri, 31 Oct 2025 10:17:50 -0700 (PDT)
Received: from ehlo.thunderbird.net (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed35312187sm14155301cf.30.2025.10.31.10.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 10:17:49 -0700 (PDT)
Date: Fri, 31 Oct 2025 13:17:46 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 Paolo Sabatino <paolo.sabatino@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_4/7=5D_auxdisplay=3A_Add_TM16xx_7-?=
 =?US-ASCII?Q?segment_LED_matrix_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <aQSEWGg50VHIECoM@smile.fi.intel.com>
References: <20250926141913.25919-1-jefflessard3@gmail.com> <20250926141913.25919-5-jefflessard3@gmail.com> <aQSEWGg50VHIECoM@smile.fi.intel.com>
Message-ID: <B4CFA18F-CE12-4257-AAD0-FA9B744A1E29@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 31 octobre 2025 05 h 41 min 44 s HAE, Andy Shevchenko <andriy=2Eshevchen=
ko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Fri, Sep 26, 2025 at 10:19:05AM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add driver for TM16xx family LED controllers and compatible chips from
>> multiple vendors including Titan Micro, Fuda Hisi, i-Core, Princeton, a=
nd
>> Winrise=2E These controllers drive 7-segment digits and individual LED =
icons
>> through either I2C or SPI buses=2E
>>=20
>> Successfully tested on various ARM TV boxes including H96 Max, Magicsee=
 N5,
>> Tanix TX3 Mini, Tanix TX6, X92, and X96 Max across different SoC platfo=
rms
>> (Rockchip, Amlogic, Allwinner)=2E
>
>=2E=2E=2E
>
>> +config TM16XX
>
>Hmm=2E=2E=2E After applying this patch there will be no compile test cove=
rage=2E
>
>> +	tristate
>
>IIRC there is a trick how to achieve that by modifying a tristate line to=
 be
>visible depending on the other options=2E
>
>E=2Eg=2E,
>drivers/dpll/zl3073x/Kconfig:4: tristate "Microchip Azurite DPLL/PTP/Sync=
E devices" if COMPILE_TEST
>

Acknowledged=2E I'll add COMPILE_TEST:
tristate "TM16xx LED matrix display controllers" if COMPILE_TEST

>> +	select LEDS_CLASS
>> +	select LEDS_TRIGGERS
>> +	select LINEDISP
>> +	select NEW_LEDS
>> +	help
>> +	  Core TM16XX-compatible 7-segment LED controllers module
>
>Please, elaborate a bit more here=2E Usually we expect ~3 lines of descri=
ption to
>be a minimum=2E
>

I'll expand to ~3 lines describing driver purpose and supported hardware
families=2E

>=2E=2E=2E
>
>> +#ifndef _TM16XX_H
>> +#define _TM16XX_H
>
>+ bits=2Eh
>
>> +#include <linux/bitfield=2Eh>
>> +#include <linux/leds=2Eh>
>
>+ mutex=2Eh
>
>> +#include <linux/workqueue=2Eh>
>
>+ types=2Eh
>

Will add missing includes=2E

>=2E=2E=2E
>
>> +#define FD655_CMD_CTRL		0x48
>> +#define FD655_CMD_ADDR		0x66
>> +#define FD655_CTRL_BR_MASK	GENMASK(6, 5)
>> +#define FD655_CTRL_ON		(1 << 0)
>> +
>> +#define FD6551_CMD_CTRL		0x48
>
>Do we need a duplicate? Yes, bitfields can be different, but since the re=
gister
>is called the same, I would leave only one register offset definition=2E
>

Acknowledged=2E I'll consolidate to single definition since they share the=
 same
offset=2E

>=2E=2E=2E
>
>> +/**
>> + * DOC: struct tm16xx_controller - Controller-specific operations and =
limits
>> + * @max_grids: Maximum number of grids supported by the controller=2E
>> + * @max_segments: Maximum number of segments supported by the controll=
er=2E
>> + * @max_brightness: Maximum brightness level supported by the controll=
er=2E
>> + * @max_key_rows: Maximum number of key input rows supported by the co=
ntroller=2E
>> + * @max_key_cols: Maximum number of key input columns supported by the=
 controller=2E
>> + * @init: Pointer to controller mode/brightness configuration function=
=2E
>> + * @data: Pointer to function writing display data to the controller=
=2E
>> + * @keys: Pointer to function reading controller key state into bitmap=
=2E
>> + *
>> + * Holds function pointers and limits for controller-specific operatio=
ns=2E
>> + */
>> +struct tm16xx_controller {
>> +	const u8 max_grids;
>> +	const u8 max_segments;
>> +	const u8 max_brightness;
>> +	const u8 max_key_rows;
>> +	const u8 max_key_cols;
>
>What are const above supposed to achieve?
>

My intent was to mark these as immutable controller characteristics, but I=
'll
remove them as they don't provide meaningful protection here=2E

>> +	int (*const init)(struct tm16xx_display *display);
>> +	int (*const data)(struct tm16xx_display *display, u8 index, unsigned =
int grid);
>> +	int (*const keys)(struct tm16xx_display *display);
>> +};
>
>=2E=2E=2E
>
>> +struct tm16xx_display {
>> +	struct device *dev;
>
>Missing forward declaration=2E
>

Will add forward declaration=2E

>> +	const struct tm16xx_controller *controller;
>> +	struct linedisp linedisp;
>> +	u8 *spi_buffer;
>> +	u8 num_hwgrid;
>> +	u8 num_hwseg;
>> +	struct led_classdev main_led;
>> +	struct tm16xx_led *leds;
>> +	u8 num_leds;
>> +	struct tm16xx_digit *digits;
>> +	u8 num_digits;
>> +	struct work_struct flush_init;
>> +	struct work_struct flush_display;
>> +	int flush_status;
>> +	struct mutex lock; /* prevents concurrent work operations */
>> +	unsigned long *state;
>> +};
>
>> +#endif /* _TM16XX_H */
>
>=2E=2E=2E
>
>> +#include <linux/bitfield=2Eh>
>> +#include <linux/bitmap=2Eh>
>> +#include <linux/cleanup=2Eh>
>> +#include <linux/container_of=2Eh>
>> +#include <linux/device=2Eh>
>> +#include <linux/leds=2Eh>
>> +#include <linux/map_to_7segment=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/property=2Eh>
>> +#include <linux/sysfs=2Eh>
>
>+ types=2Eh
>

Will add missing include=2E

>> +#include <linux/workqueue=2Eh>
>
>> +#include "line-display=2Eh"
>
>I would add a blank line here as well=2E
>

Will add blank line=2E

>> +#include "tm16xx=2Eh"
>
>=2E=2E=2E
>
>> +#define linedisp_to_tm16xx(display) \
>> +	container_of(display, struct tm16xx_display, linedisp)
>
>One line, we are using 100 limit here=2E
>

Will format to single line within 100 char limit=2E

>=2E=2E=2E
>
>> +/**
>> + * tm16xx_set_seg() - Set the display state for a specific grid/segmen=
t
>> + * @display: pointer to tm16xx_display
>> + * @hwgrid: grid index
>> + * @hwseg: segment index
>> + * @on: true to turn on, false to turn off
>
>Can also be %true and %false=2E This helps the rendering to use different=
 font
>settings for the constants (where applicable)=2E
>

Will use kernel-doc formatting conventions=2E

>> + */
>> +static inline void tm16xx_set_seg(const struct tm16xx_display *display=
,
>> +				  const u8 hwgrid, const u8 hwseg, const bool on)
>> +{
>> +	assign_bit(hwgrid * display->num_hwseg + hwseg, display->state, on);
>
>Do you need an atomic call here? Perhaps __assign_bit() would suffice,
>

Keeping assign_bit(), it's required here=2E Two distinct concurrency scena=
rios
exist:
- Bitmap: Multiple LED triggers (network, timer) + userspace write to
  display->state concurrently -> need atomic ops
- Hardware: Mutex serializes different hardware operations (flush_init,
  flush_display, keypad polling) that can race
The mutex doesn't eliminate bitmap concurrency needs, they're orthogonal
concerns=2E

>> +}
>
>=2E=2E=2E
>
>> +static inline unsigned int tm16xx_get_grid(const struct tm16xx_display=
 *display,
>> +					   const unsigned int index)
>> +{
>> +	return bitmap_read(display->state, index * display->num_hwseg,
>> +			   display->num_hwseg);
>
>One line=2E
>

Will format to single line within 100 char limit=2E

>> +}
>
>=2E=2E=2E
>
>> +static void tm16xx_display_flush_init(struct work_struct *work)
>> +{
>> +	struct tm16xx_display *display =3D container_of(work,
>> +						      struct tm16xx_display,
>> +						      flush_init);
>
>I slightly prefer
>
>	struct tm16xx_display *display =3D
>		container_of(work, struct tm16xx_display, flush_init);
>
>Or even a single line=2E
>

Will format to single line within 100 char limit=2E

>
>> +	int ret;
>> +
>> +	if (display->controller->init) {
>> +		scoped_guard(mutex, &display->lock) {
>> +			ret =3D display->controller->init(display);
>> +			display->flush_status =3D ret;
>> +		}
>> +		if (ret)
>> +			dev_err(display->dev,
>> +				"Failed to configure controller: %d\n", ret);
>> +	}
>
>First of all, I'm not sure what the lock is protecting=2E Here you allow =
"init" to
>be whatever, while in the below code the "data" is protected=2E
>

The mutex serializes different hardware operation types occurring concurre=
ntly:
brightness changes (flush_init), display updates (flush_display), and keyp=
ad
polling=2E The workqueue prevents concurrent execution of the same work, n=
ot
different operations=2E

>Second, I haven't seen changes in this function later in the series, so p=
erhaps
>drop the indentation by negating conditional?
>

Will refactor with early return to reduce indentation=2E

>> +}
>
>> +/**
>> + * tm16xx_display_flush_data() - Workqueue to update display data to c=
ontroller
>> + * @work: pointer to work_struct
>
>Perhaps add a small description and explain that this is interrupted if a=
n
>error occurs and that error will be stored for further use by upper layer=
s=2E
>
>Does the same apply to the above function?
>

Will add descriptions explaining error handling behavior for both function=
s=2E

>> + */
>> +static void tm16xx_display_flush_data(struct work_struct *work)
>> +{
>> +	struct tm16xx_display *display =3D container_of(work,
>> +						      struct tm16xx_display,
>> +						      flush_display);
>> +	unsigned int grid, i;
>> +	int ret =3D 0;
>
>> +	scoped_guard(mutex, &display->lock) {
>
>As per above, and here AFAICS guard()() will suit better=2E
>

Will change to guard()() here=2E

>> +		if (display->controller->data) {
>> +			for (i =3D 0; i < display->num_hwgrid; i++) {
>> +				grid =3D tm16xx_get_grid(display, i);
>> +				ret =3D display->controller->data(display, i, grid);
>> +				if (ret) {
>> +					dev_err(display->dev,
>> +						"Failed to write display data: %d\n",
>> +						ret);
>> +					break;
>> +				}
>> +			}
>> +		}
>> +
>> +		display->flush_status =3D ret;
>> +	}
>> +}
>
>=2E=2E=2E
>
>> +static void tm16xx_brightness_set(struct led_classdev *led_cdev,
>> +				  enum led_brightness brightness)
>
>One line
>

Will format to single line within 100 char limit=2E

>=2E=2E=2E
>
>> +static void tm16xx_led_set(struct led_classdev *led_cdev,
>> +			   enum led_brightness value)
>
>Ditto=2E
>

Will format to single line within 100 char limit=2E

>=2E=2E=2E
>
>> +static int tm16xx_display_value(struct tm16xx_display *display, const =
char *buf, size_t count)
>> +{
>> +	struct linedisp *linedisp =3D &display->linedisp;
>> +	struct linedisp_map *map =3D linedisp->map;
>> +	struct tm16xx_digit *digit;
>> +	unsigned int i, j;
>
>> +	int seg_pattern;
>
>Hmm=2E=2E=2E Should it be signed?
>

Keeping signed, map_to_seg7() returns int per its API contract=2E

>> +	bool val;
>
>> +	for (i =3D 0; i < display->num_digits && i < count; i++) {
>
>This means "whatever is smaller", perhaps make it clearer by using min() =
?
>
>> +		digit =3D &display->digits[i];
>> +		seg_pattern =3D map_to_seg7(&map->map=2Eseg7, buf[i]);
>> +
>> +		for (j =3D 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
>> +			val =3D seg_pattern & BIT(j);
>> +			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
>> +		}
>> +	}
>> +
>> +	for (; i < display->num_digits; i++) {
>> +		digit =3D &display->digits[i];
>> +		for (j =3D 0; j < TM16XX_DIGIT_SEGMENTS; j++)
>> +			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], 0);
>> +	}
>
>Or unite these two for-loops into a single one with i < count conditional=
 embedded?
>
>		for (j =3D 0; j < TM16XX_DIGIT_SEGMENTS; j++) {
>			if (i < count)
>				val =3D seg_pattern & BIT(j);
>			else
>				val =3D 0;
>			tm16xx_set_seg(display, digit->hwgrids[j], digit->hwsegs[j], val);
>		}
>
>?
>

Will merge loops with embedded conditional as suggested=2E

>> +	schedule_work(&display->flush_display);
>> +	return 0;
>> +}
>
>=2E=2E=2E
>
>> +static int tm16xx_parse_fwnode(struct device *dev, struct tm16xx_displ=
ay *display)
>> +{
>> +	struct tm16xx_led *led;
>> +	struct tm16xx_digit *digit;
>> +	unsigned int max_hwgrid =3D 0, max_hwseg =3D 0;
>> +	unsigned int i, j;
>> +	int ret;
>> +	u32 segments[TM16XX_DIGIT_SEGMENTS * 2];
>> +	u32 reg[2];
>> +
>> +	struct fwnode_handle *digits_node __free(fwnode_handle) =3D
>> +		device_get_named_child_node(dev, "digits");
>> +	struct fwnode_handle *leds_node __free(fwnode_handle) =3D
>> +		device_get_named_child_node(dev, "leds");
>> +
>> +	/* parse digits */
>> +	if (digits_node) {
>> +		display->num_digits =3D fwnode_get_child_node_count(digits_node);
>
>> +		if (display->num_digits) {
>
>Drop an indentation level by splitting this to a helper=2E
>

Will extract digits node/num parsing into helper function=2E

>> +			display->digits =3D devm_kcalloc(dev, display->num_digits,
>> +						       sizeof(*display->digits),
>> +						       GFP_KERNEL);
>> +			if (!display->digits)
>> +				return -ENOMEM;
>> +
>> +			i =3D 0;
>> +			fwnode_for_each_available_child_node_scoped(digits_node, child) {
>> +				digit =3D &display->digits[i];
>> +
>> +				ret =3D fwnode_property_read_u32(child, "reg", reg);
>> +				if (ret)
>> +					return ret;
>> +
>> +				ret =3D fwnode_property_read_u32_array(child,
>> +								     "segments", segments,
>> +								     TM16XX_DIGIT_SEGMENTS * 2);
>
>> +				if (ret < 0)
>> +					return ret;
>
>Why '< 0'? Here it's definitely not a counting call, so it should never r=
eturn
>positive in this case=2E
>

Keeping if (ret < 0)=2E While usage with non-NULL buffer won't return posi=
tive
values, fwnode_property_read_u32_array() documentation explicitly states i=
t can
return count when buffer is NULL=2E Using < 0 is the defensive, API-compli=
ant
pattern that matches the function signature=2E

>> +
>> +				for (j =3D 0; j < TM16XX_DIGIT_SEGMENTS; ++j) {
>> +					digit->hwgrids[j] =3D segments[2 * j];
>> +					digit->hwsegs[j] =3D segments[2 * j + 1];
>> +					max_hwgrid =3D umax(max_hwgrid, digit->hwgrids[j]);
>> +					max_hwseg =3D umax(max_hwseg, digit->hwsegs[j]);
>> +				}
>> +				i++;
>> +			}
>> +		}
>> +	}
>> +
>> +	/* parse leds */
>> +	if (leds_node) {
>> +		display->num_leds =3D fwnode_get_child_node_count(leds_node);
>
>> +		if (display->num_leds) {
>
>Ditto=2E
>

Will extract leds node/num parsing into helper function=2E

>> +			display->leds =3D devm_kcalloc(dev, display->num_leds,
>> +						     sizeof(*display->leds),
>> +						     GFP_KERNEL);
>> +			if (!display->leds)
>> +				return -ENOMEM;
>> +
>> +			i =3D 0;
>> +			fwnode_for_each_available_child_node_scoped(leds_node, child) {
>> +				led =3D &display->leds[i];
>> +				ret =3D fwnode_property_read_u32_array(child, "reg", reg, 2);
>> +				if (ret < 0)
>
>Ditto,=2E
>

As per above=2E

>> +					return ret;
>> +
>> +				led->hwgrid =3D reg[0];
>> +				led->hwseg =3D reg[1];
>> +				max_hwgrid =3D umax(max_hwgrid, led->hwgrid);
>> +				max_hwseg =3D umax(max_hwseg, led->hwseg);
>> +				i++;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (max_hwgrid >=3D display->controller->max_grids) {
>> +		dev_err(dev, "grid %u exceeds controller max_grids %u\n",
>> +			max_hwgrid, display->controller->max_grids);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (max_hwseg >=3D display->controller->max_segments) {
>> +		dev_err(dev, "segment %u exceeds controller max_segments %u\n",
>> +			max_hwseg, display->controller->max_segments);
>> +		return -EINVAL;
>> +	}
>> +
>> +	display->num_hwgrid =3D max_hwgrid + 1;
>> +	display->num_hwseg =3D max_hwseg + 1;
>> +
>> +	return 0;
>> +}
>
>=2E=2E=2E
>
>> +/**
>> + * tm16xx_probe() - Probe and initialize display device, register LEDs
>> + * @display: pointer to tm16xx_display
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>
>Unneeded kernel-doc=2E
>

Will remove kernel-doc=2E

>> +int tm16xx_probe(struct tm16xx_display *display)
>> +{
>> +	struct device *dev =3D display->dev;
>> +	struct led_classdev *main =3D &display->main_led;
>> +	struct led_init_data led_init =3D {0};
>
>'0' is not needed=2E
>

Will use empty braces:
struct led_init_data led_init =3D {};

>> +	struct fwnode_handle *leds_node;
>> +	struct tm16xx_led *led;
>> +	unsigned int nbits, i;
>> +	int ret;
>> +
>> +	ret =3D tm16xx_parse_fwnode(dev, display);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to parse device tree\n");
>> +
>> +	nbits =3D tm16xx_led_nbits(display);
>> +	display->state =3D devm_bitmap_zalloc(dev, nbits, GFP_KERNEL);
>> +	if (!display->state)
>> +		return -ENOMEM;
>> +
>> +	ret =3D devm_mutex_init(display->dev, &display->lock);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to initialize mutex\n");
>
>I believe it's ENOMEM here, so we don't need an error message=2E
>

You are right, underlaying __devm_add_action() only returns -ENOMEM=2E
Will remove this dev_err_probe()=2E

>> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
>> +	INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
>
>devm-helpers=2Eh have something for this case, I believe=2E
>

Cannot use devm_work_autocancel()=2E The shutdown sequence requires specif=
ic
ordering: (1) unregister LEDs to stop triggers, (2) clear display state, (=
3)
flush pending work, (4) turn off display=2E This sequence prevents hardwar=
e
access races when triggers attempt to update the display during removal=2E=
 Manual
INIT_WORK with explicit flush/cancel in remove() provides this control=2E

>> +	/* Initialize main LED properties */
>> +	led_init=2Efwnode =3D dev_fwnode(dev); /* apply label property */
>
>I didn't get a comment=2E This not only about label, but for entire set o=
f
>properties that led framework can consume=2E
>

Will remove /* apply label property */

>> +	main->max_brightness =3D display->controller->max_brightness;
>> +	device_property_read_u32(dev, "max-brightness", &main->max_brightness=
);
>> +	main->max_brightness =3D umin(main->max_brightness,
>> +				    display->controller->max_brightness);
>
>Hmm=2E=2E=2E Why 'u' variant of macro?
>
>
>> +	main->brightness =3D main->max_brightness;
>> +	device_property_read_u32(dev, "default-brightness", &main->brightness=
);
>> +	main->brightness =3D umin(main->brightness, main->max_brightness);
>
>Ditto=2E
>

Correct for unsigned brightness values=2E umin() is the appropriate macro =
for
unsigned types to avoid type conversion warnings=2E

>Given a comment about propagating fwnode, why do we need all this? Doesn'=
t led
>core take care of these properties as well?
>

Manual handling is necessary because:
1=2E default-brightness: Not implemented in LED core
2=2E max-brightness defaulting: If DT property is absent, default to
   controller->max_brightness
3=2E Ceiling enforcement: When DT property IS present, clamp to not exceed
   hardware limits (controller->max_brightness)

LED core only reads max-brightness optionally, it doesn't handle defaultin=
g or
hardware ceiling enforcement=2E

>> +	main->brightness_set =3D tm16xx_brightness_set;
>> +	main->flags =3D LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
>> +
>> +	/* Register individual LEDs from device tree */
>> +	ret =3D led_classdev_register_ext(dev, main, &led_init);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register main LED\n");
>> +
>> +	i =3D 0;
>> +	led_init=2Edevicename =3D dev_name(main->dev);
>> +	led_init=2Edevname_mandatory =3D true;
>> +	led_init=2Edefault_label =3D "led";
>> +	leds_node =3D device_get_named_child_node(dev, "leds");
>> +	fwnode_for_each_available_child_node_scoped(leds_node, child) {
>> +		led_init=2Efwnode =3D child;
>> +		led =3D &display->leds[i];
>
>> +		led->cdev=2Emax_brightness =3D 1;
>
>That should be set to default by the led core based on the property value=
, not the case?
>

Individual icons are hardware-constrained to on/off (max_brightness =3D 1)
regardless of DT properties=2E This enforces hardware limits, not reads
properties=2E

>> +		led->cdev=2Ebrightness_set =3D tm16xx_led_set;
>> +		led->cdev=2Eflags =3D LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUM=
E;
>> +
>> +		ret =3D led_classdev_register_ext(dev, &led->cdev, &led_init);
>
>Why not devm_led_*()?
>

Intentional non-devm design documented in commit notes=2E Explicit unregis=
tration
before removal immediately stops LED triggers, preventing them from access=
ing
hardware post-removal=2E devm_led_*() would require complex brightness cal=
lback
state tracking to handle trigger activity during remove()=2E Explicit unre=
gister
is cleaner and eliminates this race=2E

>> +		if (ret) {
>> +			dev_err_probe(dev, ret, "Failed to register LED %s\n",
>> +				      led->cdev=2Ename);
>> +			goto unregister_leds;
>> +		}
>> +
>> +		i++;
>> +	}
>> +
>> +	ret =3D tm16xx_display_init(display);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Failed to initialize display\n");
>> +		goto unregister_leds;
>> +	}
>
>> +	ret =3D linedisp_attach(&display->linedisp, display->main_led=2Edev,
>> +			      display->num_digits, &tm16xx_linedisp_ops);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "Failed to initialize line-display\n");
>> +		goto unregister_leds;
>> +	}
>
>If we haven't yet devm for this, it can be
>1) introduced, OR
>2) wrapped to become a such (see devm_add_action_or_reset() usage)=2E
>

While devm_add_action_or_reset() could wrap linedisp_detach(), the overall
shutdown still requires explicit ordering across multiple subsystems (line=
disp,
LEDs, workqueues, hardware)=2E Using devm for just one component while man=
ually
managing others adds complexity without benefit=2E The current explicit ap=
proach
keeps all cleanup logic together in remove() for clarity=2E

>> +	return 0;
>> +
>> +unregister_leds:
>> +	while (i--)
>> +		led_classdev_unregister(&display->leds[i]=2Ecdev);
>> +
>> +	led_classdev_unregister(main);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_NS(tm16xx_probe, "TM16XX");
>
>Needs to be namespaced _GPL variant=2E Same for all exports=2E
>

Will change all exports to
EXPORT_SYMBOL_NS_GPL(symbol, "TM16XX")=2E

>> +/**
>> + * tm16xx_remove() - Remove display, unregister LEDs, blank output
>> + * @display: pointer to tm16xx_display
>> + */
>
>Unneeded kernel-doc=2E
>

Will remove kernel-doc=2E

>> +void tm16xx_remove(struct tm16xx_display *display)
>> +{
>> +	unsigned int nbits =3D tm16xx_led_nbits(display);
>> +	struct tm16xx_led *led;
>> +
>> +	linedisp_detach(display->main_led=2Edev);
>
>> +	/*
>> +	 * Unregister LEDs first to immediately stop trigger activity=2E
>> +	 * This prevents LED triggers from attempting to access hardware
>> +	 * after it's been disconnected or driver unloaded=2E
>> +	 */
>
>After switching to devm_*() this comment won't be needed (besides that it=
 will
>come orphaned)=2E
>

Should not switch to devm_*() as explained above=2E

>> +	for (int i =3D 0; i < display->num_leds; i++) {
>> +		led =3D &display->leds[i];
>> +		led_classdev_unregister(&led->cdev);
>> +	}
>> +	led_classdev_unregister(&display->main_led);
>> +
>> +	/* Clear display state */
>> +	bitmap_zero(display->state, nbits);
>> +	schedule_work(&display->flush_display);
>> +	flush_work(&display->flush_display);
>> +
>> +	/* Turn off display */
>> +	display->main_led=2Ebrightness =3D LED_OFF;
>> +	schedule_work(&display->flush_init);
>> +	flush_work(&display->flush_init);
>> +}
>> +EXPORT_SYMBOL_NS(tm16xx_remove, "TM16XX");
>
>_GPL
>

Will change all exports to
EXPORT_SYMBOL_NS_GPL(symbol, "TM16XX")=2E

Best Regards,

Jean-Fran=C3=A7ois Lessard
Hi Andy,

Thanks for your feedback=2E

