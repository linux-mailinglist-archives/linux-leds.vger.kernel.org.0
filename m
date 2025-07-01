Return-Path: <linux-leds+bounces-4948-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49777AEEBB2
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 03:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6889F1893315
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jul 2025 01:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDD70810;
	Tue,  1 Jul 2025 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7/Kodlq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF081E4A4;
	Tue,  1 Jul 2025 01:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751331768; cv=none; b=meszxTh5aAaOh6Z3D90yDmleZVhz6wPHlYDSq7OHGjNq9wbBFMztsy14y+SP/QHM6x0/mMqCvkKRUuirSCtYsJqCrQZMe+ZikTP2wV2Nvzfl+FEF7gNnGAnN6CxVZJQESowjRZy8Tfyjb3G1vm97D/OQN9fWLK9dhiafwB5Eaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751331768; c=relaxed/simple;
	bh=S5gzdYryCxi0ZpsxScrMI1W56iDeiiMUcuBN3/v73Tw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bTIXnfGNOs75aO8onlzL9AsKZpeOSFvGLCbd/K6xxtc6wQ5B/TgqrdMxI2fS27waqsFnPoWRn5w2wtNfsJxjqHiuXrohodnStEAw5LKaqjQmipNUIEBc85GesTyI8dP+uEpeL46DceWw8M6Ib3tc9q9qKAamVbyWABoEtbUzdfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7/Kodlq; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fafb6899c2so56049856d6.0;
        Mon, 30 Jun 2025 18:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751331765; x=1751936565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ag+jMLkZcqkX977kFPeDpR6Cz2Zqrt9MproaNG5rNzQ=;
        b=B7/KodlqPhFN0PlXiNc7F+IA6MYnT99pwmM/mOuS1bV8Zud1G2mruplElwUBvBPzYW
         sMwTFjwq/0L2tvsakFeXGAMUBiDV7yhPgY93Bbf+sOTCIQKACAi1VCfF47JvZU2Udh1Q
         hgRyQd/DI/7yKqi3z3KSHcdscf4p0eEnEZZdPbGiLZVcSQVFlGjEP58zqF+F0kDteLEr
         WBFv1+DsaTu20Vc3R+XvRCsORqlKdtTeVzjfbVBz6nhbmrDvReLL8nUUMu/HZPyoz99i
         h3RsPN6Kwil7PtDOeaT5R4vkZIFzeXRnD93HLzzGRw4GTikEGQ2Ne6XuMWuYSP0MvgzU
         +CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751331765; x=1751936565;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ag+jMLkZcqkX977kFPeDpR6Cz2Zqrt9MproaNG5rNzQ=;
        b=jfx/NBDt9HyHYPrzbwQFhpzd7/ADmvVmhlbMu2gltlsecsYiaCjPX8W7EVfK/oDzFT
         D74HNM/1rw1ystORXnDt3kpLEDQUAK44Y/5xmOoa0kCpBd4rWrZEy8wW0GdgpqxdmAMD
         +K/EmhFE7ml0IZL4A6PLKCHpMEHHxH4TvE7OKQoS7YSqjysHW+BocmnMVMyfECBUg0Na
         O6Uv1GEV62UHOGWkgdoioVv0jLfZPoTubZ9WCHRkvA/8ieuT2qkaX51+MbHk2k2y72qw
         p/CNzX03JCgKD5hJ1WYqVC9kNmtLoljvve65sNFzvSlaigu5AeZqFbCs5i3/jFGnu4pI
         +4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCX62QHNC9IJ8uIo+JaaighAfYoLF2KPJWiMAXgvrAJGrdysqRl4MVluhrkLsiF/grnap0GY/Q9B0OoHlQ==@vger.kernel.org, AJvYcCXYsD55w5U/GCYqfl7ortHHgS9ozYm6UeHhqviC/D74+Z8HS5LEhEjUl4fljB5hB+A/LnJMwvsVsJuc@vger.kernel.org, AJvYcCXrS4AItL1EF1aGCOWEmXvweqlb+HxOaerRhBYSIM4RpHZAoqTcZfx6qzqdA29FEbomlsveqh46HzUkRlP/@vger.kernel.org
X-Gm-Message-State: AOJu0YwC564NYkvvgGsQwmBx9/345LUtvKn/RUdFnJaOp3C8o1hhk/7h
	nHDKVwoXE0IWE+I2QPrm5Mhwt2+gU0+UtWqeIgBpW+cm1Unus/kcmHjT
X-Gm-Gg: ASbGncu6jSA9CcIfufuG1xsjzJKucsZrzRTXY9uHhmyy8CJvuyy0LEJh3HBaAJWfyQ2
	2H5i3QGKHScenGjcFZA3OXKODRjWU2Iju0gwW++BN9vYm8CMPSZZhIfsNT9jTmV/Bke5Z78qvKi
	t9rS8/HnHXsckN5FMo6X3jqrDxvfgEFqC0Jx24c6FvXSWDcuA9bgoIxVu72gsNsPa/8YLYuh20G
	mnkMeu3JRp6WVRbDiqlj9ladLbyAenFjlDtUZrDGnnpWDqbo2xlaV8wJQiFumYvNpTfRwAUZNLY
	RjpfW20S8SZ0PWJDgrj/0YpKQ2u6dHT5gFIV+f6hskYWNpwRHTsKzXtSw3GyyxPZnvDlszeZM70
	sXd7PaOLsWKLSzFBZL/K8FluWDSAckx0XCOs/rHFuGJ3g
X-Google-Smtp-Source: AGHT+IH3vIbRVpmc5Uq2SsXqSS9QLf/EaGxWQTCOTHt7kOE1MvyuwlYisQ/IDTDBnjrMdqeRyF4scw==
X-Received: by 2002:ad4:5de9:0:b0:6fa:fdb3:5879 with SMTP id 6a1803df08f44-7010a95a8bfmr26503746d6.1.1751331765014;
        Mon, 30 Jun 2025 18:02:45 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e7301sm76114726d6.62.2025.06.30.18.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 18:02:44 -0700 (PDT)
Date: Mon, 30 Jun 2025 21:02:41 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_7/8=5D_auxdisplay=3A_Add_Titanmec?=
 =?US-ASCII?Q?_TM16xx_7-segment_display_controllers_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
References: <20250629130002.49842-1-jefflessard3@gmail.com> <20250629131830.50034-1-jefflessard3@gmail.com> <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
Message-ID: <E66BF0B3-C061-4D5E-A929-8E940F3336ED@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30 juin 2025 02 h 12 min 16 s HAE, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> a =C3=A9crit=C2=A0:
>On 29/06/2025 15:18, Jean-Fran=C3=A7ois Lessard wrote:
>> This patch introduces a new auxiliary display driver for TM16XX family =
LED controllers and compatible chips:
>
>Please do not use "This commit/patch/change", but imperative mood=2E See
>longer explanation here:
>https://elixir=2Ebootlin=2Ecom/linux/v5=2E17=2E1/source/Documentation/pro=
cess/submitting-patches=2Erst#L95
>

Well noted=2E

>Please wrap commit message according to Linux coding style / submission
>process (neither too early nor over the limit):
>https://elixir=2Ebootlin=2Ecom/linux/v6=2E4-rc1/source/Documentation/proc=
ess/submitting-patches=2Erst#L597
>

Well noted=2E

>
>> - Shenzhen Titan Micro Electronics: TM1618, TM1620, TM1628, TM1650
>> - Fuzhou Fuda Hisi Microelectronics: FD620, FD628, FD650, FD655, FD6551
>> - Wuxi i-Core Electronics: AiP650, AiP1618, AiP1628
>> - Princeton Technology: PT6964
>> - Shenzhen Winrise Technology: HBS658
>>=20
>
>
>=2E=2E=2E
>
>> + * tm16xx_parse_dt - Parse device tree data
>> + * @dev: Pointer to device structure
>> + * @display: Pointer to tm16xx_display structure
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int tm16xx_parse_dt(struct device *dev, struct tm16xx_display *=
display)
>> +{
>> +	struct fwnode_handle *child;
>> +	int ret, i, max_grid =3D 0;
>> +	u8 *digits;
>> +
>> +	display->transpose_display_data =3D
>> +		device_property_read_bool(dev, "titanmec,transposed");
>
>Wrong wrapping=2E
>
>> +
>> +	ret =3D device_property_count_u8(dev, "titanmec,digits");
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to count 'titanmec,digits' property: %d\n", ret=
);
>> +		return ret;
>> +	}
>> +
>> +	display->num_digits =3D ret;
>> +	dev_dbg(dev, "Number of digits: %d\n", display->num_digits);
>> +
>> +	digits =3D devm_kcalloc(dev, display->num_digits, sizeof(*digits), GF=
P_KERNEL);
>> +	if (!digits)
>> +		return -ENOMEM;
>> +
>> +	ret =3D device_property_read_u8_array(dev, "titanmec,digits", digits,
>> +					    display->num_digits);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to read 'titanmec,digits' property: %d\n", ret)=
;
>> +		return ret;
>> +	}
>> +
>> +	display->digits =3D devm_kcalloc(dev, display->num_digits, sizeof(*di=
splay->digits),
>> +				       GFP_KERNEL);
>> +	if (!display->digits)
>> +		return -ENOMEM;
>> +
>> +	for (i =3D 0; i < display->num_digits; i++) {
>> +		if (digits[i] >=3D display->controller->max_grids) {
>> +			dev_err(dev, "Digit grid %d exceeds controller max_grids %d\n",
>> +				digits[i], display->controller->max_grids);
>> +			return -EINVAL;
>> +		}
>> +
>> +		display->digits[i]=2Egrid =3D digits[i];
>> +		max_grid =3D umax(max_grid, digits[i]);
>> +	}
>> +
>> +	devm_kfree(dev, digits);
>> +
>> +	ret =3D device_property_read_u8_array(dev, "titanmec,segment-mapping"=
,
>> +					    display->segment_mapping, DIGIT_SEGMENTS);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to read 'titanmec,segment-mapping' property: %d=
\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	display->digit_bitmask =3D 0;
>> +	for (i =3D 0; i < DIGIT_SEGMENTS; i++) {
>> +		if (display->segment_mapping[i] < MIN_SEGMENT ||
>> +		    display->segment_mapping[i] > MAX_SEGMENT) {
>> +			dev_err(dev,
>> +				"Invalid 'titanmec,segment-mapping' value: %d (must be between %d =
and %d)\n",
>> +				display->segment_mapping[i], MIN_SEGMENT, MAX_SEGMENT);
>> +			return -EINVAL;
>> +		}
>> +
>> +		display->digit_bitmask |=3D BIT(display->segment_mapping[i]);
>> +	}
>> +
>> +	display->num_leds =3D 0;
>> +	device_for_each_child_node(dev, child) {
>> +		u32 reg[2];
>> +
>> +		ret =3D fwnode_property_read_u32_array(child, "reg", reg, 2);
>> +		if (ret < 0) {
>> +			dev_err(dev, "Failed to read 'reg' property of led node: %d\n",
>> +				ret);
>> +			fwnode_handle_put(child);
>> +			return ret;
>> +		}
>> +
>> +		if (reg[0] >=3D display->controller->max_grids) {
>> +			dev_err(dev, "LED grid %d exceeds controller max_grids %d\n",
>> +				reg[0], display->controller->max_grids);
>> +			fwnode_handle_put(child);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (reg[1] < MIN_SEGMENT || reg[1] > MAX_SEGMENT) {
>> +			dev_err(dev,
>> +				"LED segment %d is invalid (must be between %d and %d)\n",
>> +				reg[1], MIN_SEGMENT, MAX_SEGMENT);
>> +			fwnode_handle_put(child);
>> +			return -EINVAL;
>> +		}
>> +
>> +		max_grid =3D umax(max_grid, reg[0]);
>> +		display->num_leds++;
>> +	}
>> +
>> +	dev_dbg(dev, "Number of LEDs: %d\n", display->num_leds);
>> +
>> +	display->display_data_len =3D max_grid + 1;
>> +	dev_dbg(dev, "Number of display grids: %zu\n", display->display_data_=
len);
>> +
>> +	display->display_data =3D devm_kcalloc(dev, display->display_data_len=
,
>> +					     sizeof(*display->display_data), GFP_KERNEL);
>> +	if (!display->display_data)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * tm16xx_probe - Probe function for tm16xx devices
>> + * @display: Pointer to tm16xx_display structure
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int tm16xx_probe(struct tm16xx_display *display)
>> +{
>> +	struct device *dev =3D display->dev;
>> +	struct fwnode_handle *child;
>> +	int ret, i;
>> +
>> +	ret =3D tm16xx_parse_dt(dev, display);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to parse device tree: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	mutex_init(&display->lock);
>> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
>> +
>> +	/* Initialize work structure with appropriate flush function */
>> +	if (display->transpose_display_data) {
>> +		INIT_WORK(&display->flush_display, tm16xx_display_flush_data_transpo=
sed);
>> +		dev_info(display->dev, "Operating in transposed mode\n");
>> +	} else {
>> +		INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
>> +	}
>> +
>> +	display->main_led=2Ename =3D TM16XX_DEVICE_NAME;
>> +	display->main_led=2Ebrightness =3D display->controller->max_brightnes=
s;
>> +	display->main_led=2Emax_brightness =3D display->controller->max_brigh=
tness;
>> +	display->main_led=2Ebrightness_set =3D tm16xx_brightness_set;
>> +	display->main_led=2Egroups =3D tm16xx_main_led_groups;
>> +	display->main_led=2Eflags =3D LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPE=
NDRESUME;
>> +
>> +	ret =3D devm_led_classdev_register(dev, &display->main_led);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to register main LED: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	display->leds =3D
>> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KER=
NEL);
>
>Wrong wrapping=2E Use kernel style, not clang style=2E
>

Well noted=2E Will drop all usage of clang-format and use kernel style onl=
y=2E

>
>> +	if (!display->leds)
>> +		return -ENOMEM;
>> +
>> +	i =3D 0;
>> +	device_for_each_child_node(dev, child) {
>> +		struct tm16xx_led *led =3D &display->leds[i];
>> +		struct led_init_data led_init =3D {
>> +			=2Efwnode =3D child,
>> +			=2Edevicename =3D display->main_led=2Ename,
>> +			=2Edevname_mandatory =3D true,
>> +		};
>> +		u32 reg[2];
>> +
>> +		ret =3D fwnode_property_read_u32_array(child, "reg", reg, 2);
>> +		if (ret < 0) {
>> +			fwnode_handle_put(child);
>> +			dev_err(dev, "Failed to read LED reg property: %d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		led->grid =3D reg[0];
>> +		led->segment =3D reg[1];
>> +
>> +		led->cdev=2Emax_brightness =3D 1;
>> +		led->cdev=2Ebrightness_set =3D tm16xx_led_set;
>> +		led->cdev=2Eflags =3D LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUM=
E;
>> +
>> +		ret =3D devm_led_classdev_register_ext(dev, &led->cdev, &led_init);
>> +		if (ret < 0) {
>> +			fwnode_handle_put(child);
>> +			dev_err(dev, "Failed to register LED %s: %d\n", led->cdev=2Ename,
>> +				ret);
>> +			return ret;
>> +		}
>> +
>> +		i++;
>> +	}
>> +
>> +	ret =3D tm16xx_display_init(display);
>> +	if (ret < 0) {
>> +		dev_err(display->dev, "Failed to initialize display: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_info(display->dev, "Display initialized successfully\n");
>
>Drop, drivers should be silent on success=2E See coding style=2E
>

Well noted=2E

>> +	return 0;
>> +}
>> +
>> +/* SPI specific code */
>> +static int tm16xx_spi_probe(struct spi_device *spi)
>> +{
>> +	const struct tm16xx_controller *controller;
>> +	struct tm16xx_display *display;
>> +	int ret;
>> +
>> +	controller =3D of_device_get_match_data(&spi->dev);
>> +	if (!controller)
>> +		return -EINVAL;
>> +
>> +	display =3D devm_kzalloc(&spi->dev, sizeof(*display), GFP_KERNEL);
>> +	if (!display)
>> +		return -ENOMEM;
>> +
>> +	display->client=2Espi =3D spi;
>> +	display->dev =3D &spi->dev;
>> +	display->controller =3D controller;
>> +
>> +	spi_set_drvdata(spi, display);
>> +
>> +	ret =3D tm16xx_probe(display);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tm16xx_spi_remove(struct spi_device *spi)
>> +{
>> +	struct tm16xx_display *display =3D spi_get_drvdata(spi);
>> +
>> +	tm16xx_display_remove(display);
>> +}
>> +
>> +// clang-format off
>
>Drop
>
>> +static const struct of_device_id tm16xx_spi_of_match[] =3D {
>> +	{ =2Ecompatible =3D "titanmec,tm1618", =2Edata =3D &tm1618_controller=
 },
>> +	{ =2Ecompatible =3D "titanmec,tm1620", =2Edata =3D &tm1628_controller=
 },
>> +	{ =2Ecompatible =3D "titanmec,tm1628", =2Edata =3D &tm1628_controller=
 },
>> +	{ =2Ecompatible =3D "fdhisi,fd620", =2Edata =3D &tm1628_controller },
>> +	{ =2Ecompatible =3D "fdhisi,fd628", =2Edata =3D &tm1628_controller },
>> +	{ =2Ecompatible =3D "icore,aip1618", =2Edata =3D &tm1618_controller }=
,
>> +	{ =2Ecompatible =3D "icore,aip1628", =2Edata =3D &tm1628_controller }=
,
>> +	{ =2Ecompatible =3D "princeton,pt6964", =2Edata =3D &tm1628_controlle=
r },
>> +	{ =2Ecompatible =3D "winrise,hbs658", =2Edata =3D &hbs658_controller =
},
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tm16xx_spi_of_match);
>> +
>> +static const struct spi_device_id tm16xx_spi_id[] =3D {
>> +	{ "tm1618", 0 },
>> +	{ "tm1620", 0 },
>> +	{ "tm1628", 0 },
>> +	{ "fd620", 0 },
>> +	{ "fd628", 0 },
>> +	{ "aip1618", 0 },
>> +	{ "aip1628", 0 },
>> +	{ "pt6964", 0 },
>> +	{ "hbs658", 0 },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(spi, tm16xx_spi_id);
>> +// clang-format on
>
>Drop
>
>> +
>> +static struct spi_driver tm16xx_spi_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D TM16XX_DRIVER_NAME,
>> +		=2Eof_match_table =3D tm16xx_spi_of_match,
>> +	},
>> +	=2Eprobe =3D tm16xx_spi_probe,
>> +	=2Eremove =3D tm16xx_spi_remove,
>> +	=2Eshutdown =3D tm16xx_spi_remove,
>> +	=2Eid_table =3D tm16xx_spi_id,
>> +};
>> +
>> +/* I2C specific code */
>> +static int tm16xx_i2c_probe(struct i2c_client *client)
>> +{
>> +	const struct tm16xx_controller *controller;
>> +	struct tm16xx_display *display;
>> +	int ret;
>> +
>> +	controller =3D of_device_get_match_data(&client->dev);
>> +	if (!controller)
>> +		return -EINVAL;
>> +
>> +	display =3D devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
>> +	if (!display)
>> +		return -ENOMEM;
>> +
>> +	display->client=2Ei2c =3D client;
>> +	display->dev =3D &client->dev;
>> +	display->controller =3D controller;
>> +
>> +	i2c_set_clientdata(client, display);
>> +
>> +	ret =3D tm16xx_probe(display);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tm16xx_i2c_remove(struct i2c_client *client)
>> +{
>> +	struct tm16xx_display *display =3D i2c_get_clientdata(client);
>> +
>> +	tm16xx_display_remove(display);
>> +}
>> +
>> +// clang-format off
>
>Drop
>
>> +static const struct of_device_id tm16xx_i2c_of_match[] =3D {
>> +	{ =2Ecompatible =3D "titanmec,tm1650", =2Edata =3D &tm1650_controller=
 },
>> +	{ =2Ecompatible =3D "icore,aip650", =2Edata =3D &tm1650_controller },
>> +	{ =2Ecompatible =3D "fdhisi,fd650", =2Edata =3D &tm1650_controller },
>> +	{ =2Ecompatible =3D "fdhisi,fd6551", =2Edata =3D &fd6551_controller }=
,
>> +	{ =2Ecompatible =3D "fdhisi,fd655", =2Edata =3D &fd655_controller },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
>> +
>> +static const struct i2c_device_id tm16xx_i2c_id[] =3D {
>> +	{ "tm1650", 0 },
>> +	{ "aip650", 0 },
>> +	{ "fd650", 0 },
>> +	{ "fd6551", 0 },
>> +	{ "fd655", 0 },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tm16xx_i2c_id);
>> +// clang-format on
>
>Drop=2E
>
>> +
>> +static struct i2c_driver tm16xx_i2c_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D TM16XX_DRIVER_NAME,
>> +		=2Eof_match_table =3D tm16xx_i2c_of_match,
>> +	},
>> +	=2Eprobe =3D tm16xx_i2c_probe,
>> +	=2Eremove =3D tm16xx_i2c_remove,
>> +	=2Eshutdown =3D tm16xx_i2c_remove,
>> +	=2Eid_table =3D tm16xx_i2c_id,
>> +};
>> +
>> +static int __init tm16xx_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret =3D spi_register_driver(&tm16xx_spi_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret =3D i2c_add_driver(&tm16xx_i2c_driver);
>> +	if (ret) {
>> +		spi_unregister_driver(&tm16xx_spi_driver);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void __exit tm16xx_exit(void)
>> +{
>> +	i2c_del_driver(&tm16xx_i2c_driver);
>> +	spi_unregister_driver(&tm16xx_spi_driver);
>> +}
>> +
>> +module_init(tm16xx_init);
>> +module_exit(tm16xx_exit);
>
>
>> +
>> +MODULE_AUTHOR("Jean-Fran=C3=A7ois Lessard");
>> +MODULE_DESCRIPTION("TM16XX Compatible LED Display Controllers");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("spi:tm16xx");
>> +MODULE_ALIAS("i2c:tm16xx");
>
>Drop these two=2E
>

Well noted=2E

>
>
>Best regards,
>Krzysztof

Jean-Fran=C3=A7ois Lessard

