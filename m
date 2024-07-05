Return-Path: <linux-leds+bounces-2194-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D898C928A9F
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07CD71C2069E
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2024 14:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F711514F1;
	Fri,  5 Jul 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zz/Tj5pg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C2A14B07E
	for <linux-leds@vger.kernel.org>; Fri,  5 Jul 2024 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189430; cv=none; b=Ot0sc4/pXL/ZAbTXMpgI+UcFbpzJlTXSjTuJWt/1uh++G8rn3ZY0QM+FQ8tK0vhwHJrpBN4AOcanwctaad3Y4gUZyS0WHWrF+5T9tmirhX4IrdGe4tyeTQ9d474uWpfZIlNGjJbTGiFF8Gt7Hiu3yVUGVmXbir6322uVyqta9tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189430; c=relaxed/simple;
	bh=6B1rAOgRokr1VuehUKLFRuKgc9htcXW/gdaw56Lm6AE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=b3wwDo6oYIJG+ZKv/HN3yi/dNF7edJDE6/0/sa4WhiSCXW9MePxvRW/hVXXasgP6ozBpxLBT/8fehUKa0RSf7E5dLjjGApdbwDdCOs+JbMnncI/m3x9OXKbAJ9BCbvP6nnnx5kT1yUsM9mjRXuXpMD+g7tYFrBugkU2RY0lwvb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zz/Tj5pg; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ea2f58448so1763888e87.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Jul 2024 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720189426; x=1720794226; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhHj49GZBv3zl/hokFRERQnZxwaRp5ZfuhjFNNzUNh8=;
        b=zz/Tj5pgfHNze3iG4MF5q1uGfryJZlyhJO60SZQMizhmUwgyvPxh9+OjOP2f4qtpTa
         XDutToNY6eGoIl0/4PdRQDBp2PeeKG37/V8TkLc5fGP64+pfMXCaAgbxGFq0MnJKUadX
         MbcZ7dXOrfDJqIOaE06xF9ID9WaGymRJv8m1SdHuluJ6x0PL9jjRinXg+dc3cLZXaXFL
         7KcaIlIsUzJAhOvRSS9CSVaCopa1CyEBvjZb9B9VGhXFQ2ZFtHbVMnHqCE4wD6YMTa21
         0CSC8oeD1LVC+qtm7SPpOHqUQul/6YisdUXOVKhQDFK+YQY/I4vSU1kM0MMJ6jVFN5Zc
         fIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720189426; x=1720794226;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EhHj49GZBv3zl/hokFRERQnZxwaRp5ZfuhjFNNzUNh8=;
        b=Bv9gr38SwlnjkSXbGUmBjvoxv0s4vQhpDSAJvmG++2Ne2o6SR9LJR06CK+MfavxgMS
         6D1z8W3Uuf9vO43wJ8bDVpLpCKcaaHY/yvFcCCL3X8SPXTtn0aZTVpacsMehOB9gSO7h
         atjcWiEiri+fpSu1GWvD+YOqs3Pn785CpSuzl4xgoeJVY7Z/sBbn3BHlhdUBJO7HSxnd
         zK42CnJLH9R+OWWIhvu5ZHILgAe/+y/MMFsCQTzLNez6UOeaf9lLHN+Tb2RCrvy69CUv
         iqFFjYjUotP2Ac3EJYypk27GeyxiNc0Vd8tMid519ixMkCcHilLs6gBFNXROD/fzevlu
         8Q8w==
X-Gm-Message-State: AOJu0YxXid1WfF7XJzaHWEx1vrwmQCbunkbIoVXNA3LCAG7IejyYgHcL
	FV3PkObWv2VXChB0gytT4yHr/SIBs1zeB76dNvBjb9wT5Yk112LREMNsuAnt280=
X-Google-Smtp-Source: AGHT+IH/Vjd+6IBJc5fBd1nQSj01tTwzhRLpJTAG2Bm5+dEHblIvyY138m8h06tGQbQoierRc0bhLg==
X-Received: by 2002:ac2:598e:0:b0:52e:9c63:5fe8 with SMTP id 2adb3069b0e04-52ea06b77camr3198699e87.54.1720189426415;
        Fri, 05 Jul 2024 07:23:46 -0700 (PDT)
Received: from localhost (2a02-a210-20ba-5a00-9ceb-707b-2d57-26f7.cable.dynamic.v6.ziggo.nl. [2a02:a210:20ba:5a00:9ceb:707b:2d57:26f7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b0d0sm2847708e87.261.2024.07.05.07.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 07:23:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jul 2024 16:23:44 +0200
Message-Id: <D2HO9CAE81NA.3UIL5UZ1N5I4W@fairphone.com>
Cc: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David
 Collins" <quic_collinsd@quicinc.com>, "Subbaraman Narayanamurthy"
 <quic_subbaram@quicinc.com>
Subject: Re: [PATCH RESEND v3] leds: flash: leds-qcom-flash: limit LED
 current based on thermal condition
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <quic_fenglinw@quicinc.com>, <kernel@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, "Pavel Machek" <pavel@ucw.cz>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
In-Reply-To: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>

On Fri Jul 5, 2024 at 9:55 AM CEST, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
>
> The flash module has status bits to indicate different thermal
> conditions which are called as OTSTx. For each OTSTx status,
> there is a recommended total flash current for all channels to
> prevent the flash module entering into higher thermal level.
> For example, the total flash current should be limited to 1000mA/500mA
> respectively when the HW reaches the OTST1/OTST2 thermal level.

Hi Fenglin,

Only semi-related to this patch, but I wanted to ask.

Since most phones with a flash also have a thermistor for the flash led,
is there any plan to add support to be able to declare the flash led to
be a "cooling-device" for the relevant thermal zone? That way from a
Linux thermal API standpoint when the zone gets too hot that it can ask
the driver to throttle the brightness or turn the LED off completely.

Right now the only action the kernel can take is with type 'critical' to
just kill the entire system to mitigate the thermal situation.

Regards
Luca

>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
> Changes in v3:
> - Fix coding style issues to address review comments in v2.
> - Link to v2: https://lore.kernel.org/r/20240513-qcom_flash_thermal_derat=
ing-v2-1-e41a07d0eb83@quicinc.com
>
> Changes in v2:
> - Update thermal threshold level 2 register definition for mvflash_4ch_re=
gs.
>     Mvflash_4ch module thermal threshold level 2 configuration register
>     offset is 0x78, not succeeding from thermal threshold level 1 registe=
r 0x7a.
>     Hence it is not appropriate to use REG_FIELD_ID to define thermal thr=
eshold
>     register fileds like mvflash_3ch. Update to use REG_FIELD instead.
> - Link to v1: https://lore.kernel.org/r/20240509-qcom_flash_thermal_derat=
ing-v1-1-1d5e68e5d71c@quicinc.com
> ---
>  drivers/leds/flash/leds-qcom-flash.c | 163 +++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/le=
ds-qcom-flash.c
> index 7c99a3039171..aa22686fafe0 100644
> --- a/drivers/leds/flash/leds-qcom-flash.c
> +++ b/drivers/leds/flash/leds-qcom-flash.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights =
reserved.
>   */
> =20
>  #include <linux/bitfield.h>
> @@ -14,6 +14,9 @@
>  #include <media/v4l2-flash-led-class.h>
> =20
>  /* registers definitions */
> +#define FLASH_REVISION_REG		0x00
> +#define FLASH_4CH_REVISION_V0P1		0x01
> +
>  #define FLASH_TYPE_REG			0x04
>  #define FLASH_TYPE_VAL			0x18
> =20
> @@ -73,6 +76,16 @@
> =20
>  #define UA_PER_MA			1000
> =20
> +/* thermal threshold constants */
> +#define OTST_3CH_MIN_VAL		3
> +#define OTST1_4CH_MIN_VAL		0
> +#define OTST1_4CH_V0P1_MIN_VAL		3
> +#define OTST2_4CH_MIN_VAL		0
> +
> +#define OTST1_MAX_CURRENT_MA		1000
> +#define OTST2_MAX_CURRENT_MA		500
> +#define OTST3_MAX_CURRENT_MA		200
> +
>  enum hw_type {
>  	QCOM_MVFLASH_3CH,
>  	QCOM_MVFLASH_4CH,
> @@ -98,6 +111,9 @@ enum {
>  	REG_IRESOLUTION,
>  	REG_CHAN_STROBE,
>  	REG_CHAN_EN,
> +	REG_THERM_THRSH1,
> +	REG_THERM_THRSH2,
> +	REG_THERM_THRSH3,
>  	REG_MAX_COUNT,
>  };
> =20
> @@ -111,6 +127,9 @@ static struct reg_field mvflash_3ch_regs[REG_MAX_COUN=
T] =3D {
>  	REG_FIELD(0x47, 0, 5),                  /* iresolution	*/
>  	REG_FIELD_ID(0x49, 0, 2, 3, 1),         /* chan_strobe	*/
>  	REG_FIELD(0x4c, 0, 2),                  /* chan_en	*/
> +	REG_FIELD(0x56, 0, 2),			/* therm_thrsh1 */
> +	REG_FIELD(0x57, 0, 2),			/* therm_thrsh2 */
> +	REG_FIELD(0x58, 0, 2),			/* therm_thrsh3 */
>  };
> =20
>  static struct reg_field mvflash_4ch_regs[REG_MAX_COUNT] =3D {
> @@ -123,6 +142,8 @@ static struct reg_field mvflash_4ch_regs[REG_MAX_COUN=
T] =3D {
>  	REG_FIELD(0x49, 0, 3),			/* iresolution	*/
>  	REG_FIELD_ID(0x4a, 0, 6, 4, 1),		/* chan_strobe	*/
>  	REG_FIELD(0x4e, 0, 3),			/* chan_en	*/
> +	REG_FIELD(0x7a, 0, 2),			/* therm_thrsh1 */
> +	REG_FIELD(0x78, 0, 2),			/* therm_thrsh2 */
>  };
> =20
>  struct qcom_flash_data {
> @@ -130,9 +151,11 @@ struct qcom_flash_data {
>  	struct regmap_field     *r_fields[REG_MAX_COUNT];
>  	struct mutex		lock;
>  	enum hw_type		hw_type;
> +	u32			total_ma;
>  	u8			leds_count;
>  	u8			max_channels;
>  	u8			chan_en_bits;
> +	u8			revision;
>  };
> =20
>  struct qcom_flash_led {
> @@ -143,6 +166,7 @@ struct qcom_flash_led {
>  	u32				max_timeout_ms;
>  	u32				flash_current_ma;
>  	u32				flash_timeout_ms;
> +	u32				current_in_use_ma;
>  	u8				*chan_id;
>  	u8				chan_count;
>  	bool				enabled;
> @@ -172,6 +196,127 @@ static int set_flash_module_en(struct qcom_flash_le=
d *led, bool en)
>  	return rc;
>  }
> =20
> +static int update_allowed_flash_current(struct qcom_flash_led *led, u32 =
*current_ma, bool strobe)
> +{
> +	struct qcom_flash_data *flash_data =3D led->flash_data;
> +	u32 therm_ma, avail_ma, thrsh[3], min_thrsh, sts;
> +	int rc =3D 0;
> +
> +	mutex_lock(&flash_data->lock);
> +	/*
> +	 * Put previously allocated current into allowed budget in either of th=
ese two cases:
> +	 * 1) LED is disabled;
> +	 * 2) LED is enabled repeatedly
> +	 */
> +	if (!strobe || led->current_in_use_ma !=3D 0) {
> +		if (flash_data->total_ma >=3D led->current_in_use_ma)
> +			flash_data->total_ma -=3D led->current_in_use_ma;
> +		else
> +			flash_data->total_ma =3D 0;
> +
> +		led->current_in_use_ma =3D 0;
> +		if (!strobe)
> +			goto unlock;
> +	}
> +
> +	/*
> +	 * Cache the default thermal threshold settings, and set them to the lo=
west levels before
> +	 * reading over-temp real time status. If over-temp has been triggered =
at the lowest
> +	 * threshold, it's very likely that it would be triggered at a higher (=
default) threshold
> +	 * when more flash current is requested. Prevent device from triggering=
 over-temp condition
> +	 * by limiting the flash current for the new request.
> +	 */
> +	rc =3D regmap_field_read(flash_data->r_fields[REG_THERM_THRSH1], &thrsh=
[0]);
> +	if (rc < 0)
> +		goto unlock;
> +
> +	rc =3D regmap_field_read(flash_data->r_fields[REG_THERM_THRSH2], &thrsh=
[1]);
> +	if (rc < 0)
> +		goto unlock;
> +
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_3CH) {
> +		rc =3D regmap_field_read(flash_data->r_fields[REG_THERM_THRSH3], &thrs=
h[2]);
> +		if (rc < 0)
> +			goto unlock;
> +	}
> +
> +	min_thrsh =3D OTST_3CH_MIN_VAL;
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_4CH)
> +		min_thrsh =3D (flash_data->revision =3D=3D FLASH_4CH_REVISION_V0P1) ?
> +			OTST1_4CH_V0P1_MIN_VAL : OTST1_4CH_MIN_VAL;
> +
> +	rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH1], min_t=
hrsh);
> +	if (rc < 0)
> +		goto unlock;
> +
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_4CH)
> +		min_thrsh =3D OTST2_4CH_MIN_VAL;
> +
> +	/*
> +	 * The default thermal threshold settings have been updated hence
> +	 * restore them if any fault happens starting from here.
> +	 */
> +	rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH2], min_t=
hrsh);
> +	if (rc < 0)
> +		goto restore;
> +
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_3CH) {
> +		rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH3], min_=
thrsh);
> +		if (rc < 0)
> +			goto restore;
> +	}
> +
> +	/* Read thermal level status to get corresponding derating flash curren=
t */
> +	rc =3D regmap_field_read(flash_data->r_fields[REG_STATUS2], &sts);
> +	if (rc)
> +		goto restore;
> +
> +	therm_ma =3D FLASH_TOTAL_CURRENT_MAX_UA / 1000;
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_3CH) {
> +		if (sts & FLASH_STS_3CH_OTST3)
> +			therm_ma =3D OTST3_MAX_CURRENT_MA;
> +		else if (sts & FLASH_STS_3CH_OTST2)
> +			therm_ma =3D OTST2_MAX_CURRENT_MA;
> +		else if (sts & FLASH_STS_3CH_OTST1)
> +			therm_ma =3D OTST1_MAX_CURRENT_MA;
> +	} else {
> +		if (sts & FLASH_STS_4CH_OTST2)
> +			therm_ma =3D OTST2_MAX_CURRENT_MA;
> +		else if (sts & FLASH_STS_4CH_OTST1)
> +			therm_ma =3D OTST1_MAX_CURRENT_MA;
> +	}
> +
> +	/* Calculate the allowed flash current for the request */
> +	if (therm_ma <=3D flash_data->total_ma)
> +		avail_ma =3D 0;
> +	else
> +		avail_ma =3D therm_ma - flash_data->total_ma;
> +
> +	*current_ma =3D min_t(u32, *current_ma, avail_ma);
> +	led->current_in_use_ma =3D *current_ma;
> +	flash_data->total_ma +=3D led->current_in_use_ma;
> +
> +	dev_dbg(led->flash.led_cdev.dev, "allowed flash current: %dmA, total cu=
rrent: %dmA\n",
> +					led->current_in_use_ma, flash_data->total_ma);
> +
> +restore:
> +	/* Restore to default thermal threshold settings */
> +	rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH1], thrsh=
[0]);
> +	if (rc < 0)
> +		goto unlock;
> +
> +	rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH2], thrsh=
[1]);
> +	if (rc < 0)
> +		goto unlock;
> +
> +	if (flash_data->hw_type =3D=3D QCOM_MVFLASH_3CH)
> +		rc =3D regmap_field_write(flash_data->r_fields[REG_THERM_THRSH3], thrs=
h[2]);
> +
> +unlock:
> +	mutex_unlock(&flash_data->lock);
> +	return rc;
> +}
> +
>  static int set_flash_current(struct qcom_flash_led *led, u32 current_ma,=
 enum led_mode mode)
>  {
>  	struct qcom_flash_data *flash_data =3D led->flash_data;
> @@ -313,6 +458,10 @@ static int qcom_flash_strobe_set(struct led_classdev=
_flash *fled_cdev, bool stat
>  	if (rc)
>  		return rc;
> =20
> +	rc =3D update_allowed_flash_current(led, &led->flash_current_ma, state)=
;
> +	if (rc < 0)
> +		return rc;
> +
>  	rc =3D set_flash_current(led, led->flash_current_ma, FLASH_MODE);
>  	if (rc)
>  		return rc;
> @@ -429,6 +578,10 @@ static int qcom_flash_led_brightness_set(struct led_=
classdev *led_cdev,
>  	if (rc)
>  		return rc;
> =20
> +	rc =3D update_allowed_flash_current(led, &current_ma, enable);
> +	if (rc < 0)
> +		return rc;
> +
>  	rc =3D set_flash_current(led, current_ma, TORCH_MODE);
>  	if (rc)
>  		return rc;
> @@ -703,6 +856,14 @@ static int qcom_flash_led_probe(struct platform_devi=
ce *pdev)
>  		flash_data->hw_type =3D QCOM_MVFLASH_4CH;
>  		flash_data->max_channels =3D 4;
>  		regs =3D mvflash_4ch_regs;
> +
> +		rc =3D regmap_read(regmap, reg_base + FLASH_REVISION_REG, &val);
> +		if (rc < 0) {
> +			dev_err(dev, "Failed to read flash LED module revision, rc=3D%d\n", r=
c);
> +			return rc;
> +		}
> +
> +		flash_data->revision =3D val;
>  	} else {
>  		dev_err(dev, "flash LED subtype %#x is not yet supported\n", val);
>  		return -ENODEV;
>
> ---
> base-commit: ca66b10a11da3c445c9c0ca1184f549bbe9061f2
> change-id: 20240507-qcom_flash_thermal_derating-260b1f3c757c
>
> Best regards,


