Return-Path: <linux-leds+bounces-5315-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33690B3526F
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 06:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1170F1B2698D
	for <lists+linux-leds@lfdr.de>; Tue, 26 Aug 2025 04:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5B820F09C;
	Tue, 26 Aug 2025 04:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUyrKfyL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080283D984;
	Tue, 26 Aug 2025 04:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756180920; cv=none; b=Xjkt4JoJTN9gB30Ea+SF5Fs+FZm3vL3ZuHtaGx6f/N01Veyt7/WLKfY2fCJbz9g1LrXofcP0EJv2g4PGANUTHagOiWHqbx13H4wADdx/wSDu0K36+7JHXv4bzgixvTHjuffNTq43BsmpVWn1Vcj8g21hZxpAo815Urx74jUK2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756180920; c=relaxed/simple;
	bh=3538VbyHo5E4XYOowQRklx9J7HdiZmeSTpOCbULUdwg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZBxl7lYOaB/4iAthMPY8MFRT2kmpwFJW0Xg65xe88Fc31CN93SSQo8BRzGGkKLrQaf9Ps2OQALQwcGWSXwzDSoTwAx8bKnAEbbOX1Z1qxViUvlPyymgcmXZhUFyf+qFNiS44LoIIAfVWb9fiG+UUviWDTax11/vnhOkOxUaOMNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUyrKfyL; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e870316b79so575735285a.0;
        Mon, 25 Aug 2025 21:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756180918; x=1756785718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYZtfOu2sTzFKmnnCvFst2n3HDgx1eNSREKAoaoeA/M=;
        b=TUyrKfyLoB57kJ15tn3JlUvnX6GUKH+FThFIJgqmDS5024P2YQNQaP6ywd/EY7ZLmN
         xQHkUPw0OcA2pW0IX0T+2ebRaTE4KBGsbPdEIl3HHQNP4aU0/c/saI8n6I6brJZfjP3O
         QLApFujMtDFILuyG+/Fz8RT6yw5yUzwkr1ASz8gvKYw0BqfsUpndXjv48i1zmU1JUwyA
         nmRjO15+spCkAuQyW2rWWUL4C9LzJFr/MQUBGvMnBiPlbxE/0hF85AbCj3pUeI0Fhz2M
         2PR4AeOppEmi8bF2yrDQuVa9dadmTE0DzUqocIEXu4c8bygvWRXFJzy0cr0teVVay0x7
         jInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756180918; x=1756785718;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYZtfOu2sTzFKmnnCvFst2n3HDgx1eNSREKAoaoeA/M=;
        b=OwNdMe8SOieMQXbH+PkW7d5BiNgxJjy0fPoG50gMmQ7AAlCfY8jRo26cXMpeLP3Ojm
         ZcUn/VUx4z62vyr8WZRJBIaTEdZXga2+ABb6IoK0onfkj82fjjBChky2dsSNmRtc15YI
         XJRks32aDedlTGYa/Lqz0w6zAxR1OHxXnslCM5rFjIF3ATejB3YFWDhgu01sZy7LfvdB
         YjwMLi9HjefeEZ7Ro1c3P8PCFUreToiSbcmzjbZ3QUelUBKqkUa/sOPtaqYGwFc3r7yP
         4KMZjODvX52LsIwm1QrOtabRtPahMiAkVHG2cCAroTbqF+hQU4rP1mXL+9krVPoTRgOc
         xo4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeHRhocENx28FB/jvXxshIXvnfmh7rsq4xe3NGPvS1JvOpfbtqhxxKsr4Yvfhd9otUXrANDNTfwra7@vger.kernel.org, AJvYcCUnBrRtRYta/hQsdBhUwwg+/FSAIAmSPWL60fuXRVlkcZU1gjG+nqAeuNbisJCugquDA6U5laG6rUIGXg==@vger.kernel.org, AJvYcCVfnCfTkoZ8oI7p3XSPAZwyTVUYDiS+uwNFEhN7xI66uYeEjAlvMraQLnDxzCMwQ9D9SCjaD3oa5uxJyXWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwN4AQWzaCGeZtTmaeSU0SAo/1lfmnrcfrDwPTqd7e5y69dA91X
	P7JvrvFpINvJA8yajnhLBp+fRTXa9XGdI0AB4pTGmIMgqSapAsGgxJBO
X-Gm-Gg: ASbGncvHL+c3+cotFivY5N0jcOhMsDdWYfw22LE4zKpAVQa5FujOvpdf8A7txidvzWG
	pPJyLE+VDMDDJRAu9nUBTvuFimx3777Ho4PWqMfdAgTDs/JvKuyimMtf0jVVlPbcl1BiYo/hA0X
	wo34hns4HZl4MZEJqd5A5sohYN63jBT1E7DKVBCSkSufmpA4GshXXWzKWKhAc/Lb6FKs9/I8LxY
	mG7QEtfohPiJzop0tuX0r+YKnWIWXr27iKDKMC5SHdQlY4BTDMtGdgMYfNbFjbT09OWYTKoTJl6
	Nf/H15Bt968g3kDRh/c0f7LKYGR+8IIf0A2qip/jK8jd4TehKI2Hz0xHQgV+Yfsv36Tw2uySRuo
	2rQXn8BMFomh8OjSbsajzdrfYLHyDxEcyam3QvyTiyigwmKQAPg3VFPq4tthl6FzcW7Lo+A==
X-Google-Smtp-Source: AGHT+IHz0zRWKU0+TYMO3TgA14QejdX10VcvwfSLmPslVWxbWq1Uu2s+60QYu/AIkei9UIVnG1owcQ==
X-Received: by 2002:a05:620a:ab18:b0:7ec:4971:398 with SMTP id af79cd13be357-7ec498f8be6mr1068970385a.11.1756180917562;
        Mon, 25 Aug 2025 21:01:57 -0700 (PDT)
Received: from [127.0.0.1] (modemcable197.17-162-184.mc.videotron.ca. [184.162.17.197])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebe6069a17sm618211585a.0.2025.08.25.21.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 21:01:57 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:01:57 -0400
From: =?ISO-8859-1?Q?Jean-Fran=E7ois_Lessard?= <jefflessard3@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_5/6=5D_auxdisplay=3A_TM16xx=3A?=
 =?US-ASCII?Q?_Add_support_for_I2C-based_controllers?=
User-Agent: Thunderbird for Android
In-Reply-To: <aKx-w0QOOQPyy9pW@smile.fi.intel.com>
References: <20250825033237.60143-1-jefflessard3@gmail.com> <20250825033237.60143-6-jefflessard3@gmail.com> <aKx-w0QOOQPyy9pW@smile.fi.intel.com>
Message-ID: <951E84EF-4ED7-4882-A5E2-6E3CD63E1E07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 25 ao=C3=BBt 2025 11 h 18 min 27 s HAE, Andy Shevchenko <andriy=2Eshevch=
enko@intel=2Ecom> a =C3=A9crit=C2=A0:
>On Sun, Aug 24, 2025 at 11:32:31PM -0400, Jean-Fran=C3=A7ois Lessard wrot=
e:
>> Add support for TM16xx-compatible auxiliary display controllers connect=
ed
>> via the I2C bus=2E
>>=20
>> The implementation includes:
>> - I2C driver registration and initialization
>> - Probe/remove logic for I2C devices
>> - Controller-specific handling and communication sequences
>> - Integration with the TM16xx core driver for common functionality
>>=20
>> This allows platforms using TM16xx or compatible controllers over I2C t=
o be
>> managed by the TM16xx driver infrastructure=2E
>
>=2E=2E=2E
>
>> +#include <linux/i2c=2Eh>
>> +#include <linux/mod_devicetable=2Eh>
>
>IWYU everywhere, too little header inclusions, you use much more=2E
>

I'll explicitly include all required headers in each source file
instead of relying on transitive includes from the header=2E

>> +static int tm16xx_i2c_write(struct tm16xx_display *display, u8 *data, =
size_t len)
>> +{
>
>> +	dev_dbg(display->dev, "i2c_write %*ph", (char)len, data);
>
>Noise=2E
>

Understood, I'll remove the debug noise=2E

>> +	/* expected sequence: S Command [A] Data [A] P */
>> +	struct i2c_msg msg =3D {
>> +		=2Eaddr =3D data[0] >> 1,
>> +		=2Eflags =3D 0,
>> +		=2Elen =3D len - 1,
>> +		=2Ebuf =3D &data[1],
>> +	};
>> +	int ret;
>> +
>> +	ret =3D i2c_transfer(display->client=2Ei2c->adapter, &msg, 1);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return (ret =3D=3D 1) ? 0 : -EIO;
>
>Can we use regmap for all parts of the driver? Why not?
>

These controllers implement custom 2-wire/3-wire protocols that share
sufficient commonalities with I2C/SPI to leverage those subsystems, but ar=
e not
fully compliant with standard register-based access patterns=2E

Specific regmap incompatibilities:

I2C protocol:
- Dynamic addressing: slave address embedded in command byte (data[0] >> 1=
)
- Custom message flags: requires I2C_M_NO_RD_ACK for reads

SPI protocol:
- Inter-transfer timing: mandatory TM16XX_SPI_TWAIT_US delay between
command/data
- CS control: requires cs_change =3D 0 to maintain assertion across phases

Regmap's I2C/SPI bus implementations use fixed addressing and standard tra=
nsfer
patterns without support for these protocol-specific requirements=2E A cus=
tom
regmap bus would internally call these same helper functions without provi=
ding
practical benefit=2E

The explicit transfer approach better reflects the actual hardware protoco=
l
requirements=2E

>> +}
>
>=2E=2E=2E
>
>> +static const struct tm16xx_controller fd6551_controller =3D {
>> +	=2Emax_grids =3D 5,
>> +	=2Emax_segments =3D 7,
>> +	=2Emax_brightness =3D 8,
>> +	=2Emax_key_rows =3D 0,
>> +	=2Emax_key_cols =3D 0,
>> +	=2Einit =3D fd6551_init,
>> +	=2Edata =3D fd655_data,
>
>> +	=2Ekeys =3D NULL,
>
>Redundant initialiser=2E
>

Acknowledged=2E Will remove=2E

>> +};
>
>=2E=2E=2E
>
>> +#if IS_ENABLED(CONFIG_OF)
>
>No, please remove all these ugly ifdefferies=2E
>

Acknowledged=2E Will remove=2E

>> +static const struct of_device_id tm16xx_i2c_of_match[] =3D {
>> +	{ =2Ecompatible =3D "titanmec,tm1650", =2Edata =3D &tm1650_controller=
 },
>> +	{ =2Ecompatible =3D "fdhisi,fd6551",   =2Edata =3D &fd6551_controller=
 },
>> +	{ =2Ecompatible =3D "fdhisi,fd655",    =2Edata =3D &fd655_controller =
 },
>> +	{ =2Ecompatible =3D "winrise,hbs658",  =2Edata =3D &hbs658_controller=
 },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
>> +#endif
>
>=2E=2E=2E
>
>> +		=2Eof_match_table =3D of_match_ptr(tm16xx_i2c_of_match),
>
>Definitely no to of_match_ptr()=2E Must be not used in a new code=2E
>

Well received=2E Will ban usage of of_match_ptr=2E

