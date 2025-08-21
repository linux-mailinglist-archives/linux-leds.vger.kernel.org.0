Return-Path: <linux-leds+bounces-5273-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E216AB30060
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 18:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EDDF16D26E
	for <lists+linux-leds@lfdr.de>; Thu, 21 Aug 2025 16:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3902E2F08;
	Thu, 21 Aug 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQaijEAQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3E2E2F00;
	Thu, 21 Aug 2025 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755794545; cv=none; b=o8lp1b7KY5Nhuj8UWImqZ6w85vlC+Vt14H1q4OLIENr48nrb1acCePgF21PgKqj1iz+Dqz+e76t/IsgOep03ir//zXjaPx3dGzSOtBZ+A8CSLyNtTIVYZVOWbk/OQOYkSyqIIiirYR4Q2q+zmFy7FNG6K1xYA++YrqynYi1UaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755794545; c=relaxed/simple;
	bh=g4VQNKmSnAC9DQfCVPgHsw+XDHu7efI6T9ypGVxALUY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=N8KJHy2afZF0hR6itFeeiVYo/gB4C7VKoGRoOtbu3g1T9T2Lah0j01xuTDdyon7//yz04aloN6b39XBUb4Ix6xK36X9T+KFG597lbT5X6VjY4RYabwBUEAT7R/uAexvsrea8AmlFCs4v+jaefhyFM2HdFwEg/CE0OwfotCXR+gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQaijEAQ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e870689dedso87597685a.3;
        Thu, 21 Aug 2025 09:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755794542; x=1756399342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eDjfXTLIXvHyku6eeA6JQrBMgI3q0b62hMZfcvENsN4=;
        b=YQaijEAQI+l2c/HctjHmPt2G07sC9rkjkpsKuPyXviy370dOOlbWi5Zu3F7SEgAOOc
         i7YGel+j/wzBHPS3Wp18ZR3jNwRTdKdpcq0HPOPUh1l83/vgy+SBisX2/T8MChb6O49a
         2chAaD4bxyBe8ve7yY+LY0rKQpcDcyQO6eUkMLq/itcuy8/BZdHxTwa0/B1xvRkJAGC5
         29hiUQxsqI7W5aBhulwaJv3XhzrHuQhT+cAIolX2fTTXT5xrc61eWVP1T05pIqd73/eG
         qGuC41DabGjo+DtGuw+cWPJQCESBnkVDp8HS3S9/gJpLSdeuc/BNz8YJrMcg0gPtzX53
         RkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755794542; x=1756399342;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDjfXTLIXvHyku6eeA6JQrBMgI3q0b62hMZfcvENsN4=;
        b=A7GAX0y2j+Yw5EMwE74OtZ7Ozq+rJuLIrbW7VSJ/4sIRPTtJ4Xod41vpO1rFoBef++
         8wqJzVABEX3wNpjSQS4+qz8DF+PBlrU9IsyCpPX0TVmTFkzEZR6k310Q7vfN8LkiZHRb
         v2FhCTDf8sCgKKUJd36ogx8tSjK8QytKCr9fhEZhY+ZI3YJRGmSuCr8aeWBEp0jk37xV
         1LzfjwFuKkkgxK2jpaV8sD4VOYduMxEUFHDbScV3ujlZFYEm0Dp0YusrneizJWDKaXLG
         pvJVsha7fJ6HNZ5Lo+PgsWQcd5NZuu+0IeeJ+vdkxvK0H0IEbGJtCwraifRlebL4+5G4
         Nq9g==
X-Forwarded-Encrypted: i=1; AJvYcCW252ctHqURFeABnjPOy5wDFEDkegbvfn+/RZj57D7ADdfH3x/FWZcEaaDCh3jycqyDPhWO6Q+Zr8St@vger.kernel.org, AJvYcCWmNWDThGk3Y6UZy1rYWBytSo0hS6yV28kDgHMO7m/Vx8TNwIVZlEfUSMKzICZ5iE5vH+UfiyxsFgNQ8g==@vger.kernel.org, AJvYcCWvr7O5lXB3g1zYPYKt/FZdILhxq+JGxPF/7hYXZ3pQ5XECYujB+2I4i4cGF+NM0GyTtI1uF3S0qwmyBGNx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/kwfaoCxd1EI+ms3yMVD0O4GqehYdZIS/QenqI2rNMQKXi/K
	7ZOxiEIW5YqBHHE8B+FiYQR6JIe9uZx9ZCSYpLsOZYsSIKoUJR43MESRQmVapwia
X-Gm-Gg: ASbGncuZXZORoBqOwscsznK+tWZK1eBZgfWpSrt4oXPRzY18WivAzEv3ktl7WON7d8I
	fIRwzJcbi/RjuoL3WfofE1S/4U3b9pkxlq2RkUIHIu9bs4Y51q0MywusUslmzzNwW7SW923Xujr
	a1DvsDqDsbTxY1CpIArzzo+h9f847RoulZXs5txWXANlD4rC2VmSP+qw40kcECTLsaqIoTXbUvG
	VqGbhKTzJ2ZKLY+8XBl9YbUK8xd3EbTeezYJq2iKP9ybTsW+dchz/5h4CeA3yKZU0jIjBCpmkd6
	GUO02+dFhbpXBU39V9MHTxsxW0+tNBY8P862XIMtY+NThOHWtzKMx7FfGuEVGwu0lSdZ+xb5TX0
	6NI1yHgZ39dtoIfwEd61wFCYtIKSM9Uz9/q0WbSp/fvQ4BNFUCT0AADsC8W8iuJgi9OdfHg==
X-Google-Smtp-Source: AGHT+IGMn0Sig5qE7OmBL7SDQ5NFdbsvx+ZhiNSfvAOYyUYwJGPdtiOiIJBwNmWcekndGoeT1JQ5JQ==
X-Received: by 2002:a05:620a:4002:b0:7e6:9e25:df13 with SMTP id af79cd13be357-7ea11049b6fmr3132385a.51.1755794542364;
        Thu, 21 Aug 2025 09:42:22 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020b25sm1145947185a.13.2025.08.21.09.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 09:42:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 12:42:21 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <20250821-passionate-mouse-of-essence-2c5af4@kuoka>
References: <20250820163120.24997-1-jefflessard3@gmail.com> <20250820163120.24997-4-jefflessard3@gmail.com> <20250821-passionate-mouse-of-essence-2c5af4@kuoka>
Message-ID: <13E7CEAE-6865-485B-9486-7EBEEE46E285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 21 ao=C3=BBt 2025 03 h 43 min 51 s HAE, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> a =C3=A9crit=C2=A0:
>On Wed, Aug 20, 2025 at 12:31:16PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> +/**
>> + * tm16xx_map_seg7_store() - Sysfs: set 7-segment character map (binar=
y blob)
>> + * @dev: pointer to device
>> + * @attr: device attribute (unused)
>> + * @buf: new mapping (must match size of map_seg7)
>> + * @cnt: buffer length
>> + *
>> + * Return: cnt on success, negative errno on failure
>> + */
>> +static ssize_t tm16xx_map_seg7_store(struct device *dev,
>> +				     struct device_attribute *attr,
>> +				     const char *buf, size_t cnt)
>> +{
>> +	if (cnt !=3D sizeof(map_seg7))
>> +		return -EINVAL;
>> +	memcpy(&map_seg7, buf, cnt);
>> +	return cnt;
>> +}
>> +
>> +static DEVICE_ATTR(value, 0644, tm16xx_value_show, tm16xx_value_store)=
;
>> +static DEVICE_ATTR(num_digits, 0444, tm16xx_num_digits_show, NULL);
>> +static DEVICE_ATTR(map_seg7, 0644, tm16xx_map_seg7_show, tm16xx_map_se=
g7_store);
>
>Where did you document the ABI?
>

Currently, there is no formal ABI documentation for the TM16xx sysfs attri=
butes=2E
While map_seg7 follows existing auxdisplay conventions (which lack ABI doc=
s),
I plan to add TM16xx-specific ABI documentation under
Documentation/ABI/testing/sysfs-class-leds-tm16xx in the v4 submission=2E

>> +
>> +static struct attribute *tm16xx_main_led_attrs[] =3D {
>> +	&dev_attr_value=2Eattr,
>> +	&dev_attr_num_digits=2Eattr,
>> +	&dev_attr_map_seg7=2Eattr,
>> +	NULL,
>> +};
>> +ATTRIBUTE_GROUPS(tm16xx_main_led);
>> +
>
>=2E=2E=2E
>
>> +#if IS_ENABLED(CONFIG_I2C)
>> +/**
>> + * tm16xx_i2c_probe() - Probe callback for I2C-attached controllers
>> + * @client: pointer to i2c_client
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int tm16xx_i2c_probe(struct i2c_client *client)
>> +{
>> +	const struct tm16xx_controller *controller;
>> +	struct tm16xx_display *display;
>> +	int ret;
>> +
>> +	controller =3D i2c_get_match_data(client);
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
>> +/**
>> + * tm16xx_i2c_remove() - Remove callback for I2C-attached controllers
>> + * @client: pointer to i2c_client
>
>Please don't ever add comments, especially kerneldocs, for such obvious
>driver API=2E This function cannot be anything else than what you
>described=2E Why? Linux core driver model tells that=2E You never have to
>repeat what Linux core driver model is=2E=2E=2E
>

Well received, thank you=2E I will drop these trivial kernel-doc comments=
=2E

>Best regards,
>Krzysztof
>

Best regards,

Jean-Fran=C3=A7ois Lessard

