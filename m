Return-Path: <linux-leds+bounces-5976-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCEC30F84
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 13:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 949C034D360
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F212E7F14;
	Tue,  4 Nov 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQutNc31"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49029A9FE
	for <linux-leds@vger.kernel.org>; Tue,  4 Nov 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762259055; cv=none; b=siFwJqnt/pfID9ByAjzeYzaY5Nxgv7qPgMleWJZO26LiP6HU4mNVy4Q8M5VxewK3PCn2nQwYFlzwx+UyRLt8UBa1Xb4sNy2uxf6M5NHIEWp73CpjgGuVFh6ZfAVvjNHsLMs8pkZ7HFdgf+2jqAw9DcjFyENRpC3Jw1LRNUCdHXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762259055; c=relaxed/simple;
	bh=4G4WmsNqNizyWK3nhkV2waDHR6+qEIhH3Gbq1UFjq7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EAl5mjF/ejADF/Gjt9N4crWEBmNhWH0jZ79UN9Mw24n5DSUx8MJUCNIIKgcnxqVRihpH5wXCo2mtvCCBVpBpJQQl9gB4z2/mO0XWE1r0wXpCEn9FRXYfksRIyieYu8+lI+6Gm7df/QhkUXc3pDm0uq4b8OGjxs64UC/Nmx9LSXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQutNc31; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-6409e985505so4623355a12.2
        for <linux-leds@vger.kernel.org>; Tue, 04 Nov 2025 04:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762259052; x=1762863852; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w9oB3T8XUJgBGc+hBaim4B4JguaWQfKbWBDqClypRw=;
        b=KQutNc31ZFNIt7trjML1B6+ICKFTlx6hKjVrRTkwjs10Wu/IMqdhP5kmYHeDnt2A4W
         uCaDl7Ge7UL9TMX9HZZKPbsrhPm1UygeaYjGKwiy0N0AoJ/mHD7aczntUFpL6+0wby1z
         LaiBurl2htcuaQ+v8tNWqhHfJTxsz4Swbmtjdg0sIMkhgDzxjuV7tAtzhPpUVo5ewwRt
         UniK7m+/o1kvYur85i9ySkYViaeh70z9TgleXn+XAu1+LioF+ENSgcWpobLKacdVpfY/
         27yK8APNxomBtU9rlWhg9oardPjl+thVom/SPDOX7kbypCQrjpFoKFIxrrbTXWpuvyck
         RHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762259052; x=1762863852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w9oB3T8XUJgBGc+hBaim4B4JguaWQfKbWBDqClypRw=;
        b=T5xPUNVjMkulqFRMmgW13KEHN6Ex+nyeNKyYkkFH8L/+QihrVqv9sJDxN8PiWJ3Mcg
         3CyDeMJJUCMK7Tuu/tazqcVZynWCH0JdxlIC/exYhEq10y+RfZzHaAjnNLLD0+Wl40MP
         Aw3bHAY7xTMf9yGxBHDuoN74iw2JYPZyZP8I+ZyCYCafJGZILp47uFxw8n8fqpmvGQxW
         8NIg3xV3LLlz6iecEnFU24t1bzVqlHcRckZxpuai+vy8iI3GhSo2UlSayc/1WMkn0FOf
         lu0Y4A+O70+32GTlP9fnJ9lDu47TVc+kUVcZs7tE9AGVbrYZW4Kd6xLHP7xE4DjFT7bf
         lHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxGTDEHm8qzYHwbnGnLwI7nbvFr1JNyewFpIKKwxDWA0+a6C+a31vAlcLD9z/HznoICtdmY7YNfhRw@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeIRTpfSNApQTRj/yNrT4CbWgt7jUkb16mM4PGjV/C5cAApa3
	OKndWN029d9I06JnDstmbTk9W0DNdVoBSwab3aqUzQyikhHSux+g0vdpvLlrCnxzNy7OjmPdz8o
	CAlCDW8L0ebvaVf69IB7b9kkJ9drc6+8=
X-Gm-Gg: ASbGncu9yZGHUTjSQsQb+oO1bi/2cyqL3O0n36fvX2nwq65P7SH45eNF4INhQ0TBCWu
	ASmwPPahxoboyG3r4CnE4dqZX6P0jViddxvypq+Cnj9ZnFmZ4+2//Ax50hZUYZ6ZL6qOCDwff0y
	Hp2R3j2fwLvEhFr1t3T8az+gzmq56gj+xCrHB+VH0R9W+WL+t/eojNeIFUAWncuurC/bI65f9Ve
	Q4IDvWmYLxgPaN1yIQz7CUtSHTv4mBPcmLKPIwiEprqeWWFM2lD5KrLSiq6
X-Google-Smtp-Source: AGHT+IG6ud+xpKAMBlMA5WdjCGVGxS6YVcNlLSwDSmnLLrN6CJtwEsTAMY7TqC8k7Rf1nkyRUDIwFwQ7kTSNndxnDeE=
X-Received: by 2002:a17:907:97c5:b0:b71:5079:9702 with SMTP id
 a640c23a62f3a-b715079aed8mr550597766b.21.1762259051951; Tue, 04 Nov 2025
 04:24:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com> <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
In-Reply-To: <20251104-attractive-dragonfly-of-perspective-0d52d6@kuoka>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Tue, 4 Nov 2025 20:22:32 +0800
X-Gm-Features: AWmQ_blg6GhTdK5EC6AuU-36Dga5TQMKLH2FNjAQ7Rr6vjrvigIa3A71HhVneEs
Message-ID: <CAK6c68j2j536UEgq36RAuAv7HGW9VTUS-s32+1YDshqK+gTfzw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> > +struct reg_init_data;
> > +
> > +struct aw99706_device {
> > +     struct i2c_client *client;
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct backlight_device *bl_dev;
> > +     struct gpio_desc *hwen_gpio;
> > +     struct reg_init_data *init_tbl;
> > +     int init_tbl_size;
> > +     bool bl_enable;
> > +};
> > +
> > +enum reg_access {
> > +     REG_NONE_ACCESS =3D 0,
> > +     REG_RD_ACCESS   =3D 1,
> > +     REG_WR_ACCESS   =3D 2,
> > +};
> > +
> > +const u8 aw99706_regs[AW99706_REG_MAX + 1] =3D {
>
> Why isn't this static?
>

That was an oversight on my part. It will be static.

> > +     [AW99706_CFG0_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG1_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG2_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG3_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG4_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG5_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG6_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG7_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG8_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFG9_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGA_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGB_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGC_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_CFGD_REG]              =3D REG_RD_ACCESS | REG_WR_ACCESS=
,
> > +     [AW99706_FLAG_REG]              =3D REG_RD_ACCESS,
> > +     [AW99706_CHIPID_REG]            =3D REG_RD_ACCESS,
> > +     [AW99706_LED_OPEN_FLAG_REG]     =3D REG_RD_ACCESS,
> > +     [AW99706_LED_SHORT_FLAG_REG]    =3D REG_RD_ACCESS,
> > +
> > +     /*
> > +      * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will un=
lock
> > +      * Multi-time Programmable (MTP).
> > +      */
> > +     [AW99706_MTPLDOSEL_REG]         =3D REG_RD_ACCESS,
> > +     [AW99706_MTPRUN_REG]            =3D REG_NONE_ACCESS,
> > +};
> > +
>
> ...
>
> > +     aw =3D devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
> > +     if (!aw)
> > +             return -ENOMEM;
> > +
> > +     aw->client =3D client;
> > +     aw->dev =3D dev;
> > +     i2c_set_clientdata(client, aw);
> > +
> > +     aw->regmap =3D devm_regmap_init_i2c(client, &aw99706_regmap_confi=
g);
> > +     if (IS_ERR(aw->regmap))
> > +             return dev_err_probe(dev, PTR_ERR(aw->regmap),
> > +                                  "Failed to init regmap\n");
> > +
> > +     ret =3D aw99706_chip_id_read(aw);
> > +     if (ret !=3D AW99706_ID)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to validate chip id\n")
>
> Why are you exiting the probe with a positive value like 4 or 8? This
> makes no sense. Registers do not coontain Linux return codes.
>

Thanks for pointing this out. Using -ENODEV makes more sense. I will do
it in the next version.

Regards,
Junjie

