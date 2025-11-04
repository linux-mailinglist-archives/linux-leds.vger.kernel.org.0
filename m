Return-Path: <linux-leds+bounces-5971-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C213C2F5D3
	for <lists+linux-leds@lfdr.de>; Tue, 04 Nov 2025 06:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A04CA34CA2C
	for <lists+linux-leds@lfdr.de>; Tue,  4 Nov 2025 05:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E5C2C029E;
	Tue,  4 Nov 2025 05:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGhdmJ5w"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADB2BD5B2
	for <linux-leds@vger.kernel.org>; Tue,  4 Nov 2025 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233810; cv=none; b=CYSQQvcyCvtMgoNu1TiubT+aahYKM7DzfjsND7QK0QnOPCLqwhWa7JqK5WAr8zDFXot8sSLWk7Lhe7VH0nKGKypzVbqwTmW2SJ87SpgNMm8i2cCEcc91QFNkbuNc4JkpyjsY3t1y+ftHNIxj+2xpYXbtNidgrF9SyKt9LF/kw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233810; c=relaxed/simple;
	bh=BpMFFzCKsqjHvHxf4Lx02ot6GpP/Rp2oDI5kb+IS4aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0LUnxmnO9zy0g+zBNAjnor0j3/qDO3Y2cNNusUZJMOi6QATi4NcopCH5UshpoVrHTXSDUUMiy72zFLgZ3PCvIygE9kMeNsAOaoOydhtHxlirenRI8QS7pDm0yWgY7h6Iumb9vJfoobt8f05JupJt/idkkTJbp54RCJENpu9iBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGhdmJ5w; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b71397df721so277758466b.1
        for <linux-leds@vger.kernel.org>; Mon, 03 Nov 2025 21:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762233807; x=1762838607; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4RUZF6DeQxRbL7hk8aE8m25nMDIdsE4Fw4B+jDjdxs=;
        b=NGhdmJ5w/FD0zIbBJimNdq31/qPk7ReZ5pej2yzLNHch5QqC52uoE1jP8nO3JOw9Ps
         3/P3H1RzoM4UfleMMg3JkPf1ELBpd+zwd9gcOQyaPNPPoh1LjBIES/JtpAD6c+bXsLtA
         uoQAUcLnnuP7ved22f0Tr9jT+hkJeyhxMN+5gMIX9UD81EPVWriu4IGZZJBDzrMzFc/5
         ap3TeYwqCy4t7ifkDt6IDspo/k1ZBVOmtIVGkkCXoyLhkdeTQcXx3ZkkKUkQIJIg2TQ2
         i6Xhrt/VNzw1FEFuj2+g/EbidE6ypM5xPbxDlYAaCMz8Wg4HiKygyaezMm0v8/xREsMP
         0TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762233807; x=1762838607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4RUZF6DeQxRbL7hk8aE8m25nMDIdsE4Fw4B+jDjdxs=;
        b=ffiWR0cA2AUZjVwThDjHzWT7MuZF20EPeG4OAY/wzgxlIsr9QKLa5XhQqaXJ+gZAYk
         oFLnhac971XapXOpa7sjMXycqGwOMng6bJHD8aJuj65HEvexYmLmL/C1mgtUTbQ18kHT
         Y23M7/MSW84MaCF/z29g6R57TlgdfdMy0fWWOuwGjEiEHpJ+ukwjpniBIZC1cROGv7U0
         P+R05X1oP1Mfkyla4OAdqWw21IfEsTXtZgN4rFmGrP73iXDJS5L/zA5biT1j+0P20e8D
         BB+rNbynBZQ7UvdmehVzi0M+as26rOuiaS5mwfdEdVIGvIuO/iEqIcYMYYEMxiEuskg5
         eBhw==
X-Forwarded-Encrypted: i=1; AJvYcCVyUPh4EdgvJXpM1+w9hZSpSJsqGGDJwoK8ABIs+vmskrRutPJqZXtC/973f6j3BJrPUP/UL5Y+lYaB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/XmqGyt5zvMs2fL2KxMPccJ/cfrxIEsfrqV8hKK3Wg+1adGNn
	A2OSRWeY3YGwL0tejXj3t5/H6hrojMuBpxsy4MIS9z79S09BUJUdYIfAqEmHfVK4HwWssP4X0Wy
	o6B3FOnqJt4ROr3TWPMz0lGFDnZkHMcs=
X-Gm-Gg: ASbGncsvJrdZ507rWey8g/fCzkxiJlGsAhtf95tpKxCWkVr0b3XutpR46F7DwQKq4h7
	39/GkZXvchd7TrSH2VEUuRXL+/V9mXCGtrZLtpR8OJc4E9Sb1s3sPfClBEXeuSck/PQ/Y5nW3CS
	L0ns4y3nmGCfOBFNkehD8LRi+bhl2GndLAGT1ASiU2m9OFhn8AV7z7GZhN/LMoP0f3XW9Dr8Z2H
	Ro4Cbq5Odd6EWFlUxcEV94qIxPTwRZe4B9r0I192jGA9Z7LhqpaeU/gIz7t
X-Google-Smtp-Source: AGHT+IE9GdvxzDs+AiWUrHrkWTw5ZWTLQAZJtdC7zFZ0vRv283/BNkkD0+50XIVUnPGg88dPjuz0BaVD627TibUqfoc=
X-Received: by 2002:a17:907:1c93:b0:b4e:fc90:47a8 with SMTP id
 a640c23a62f3a-b70700b5153mr1814180666b.4.1762233806865; Mon, 03 Nov 2025
 21:23:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com> <aQjY5_uEaTv4_L2s@aspen.lan>
In-Reply-To: <aQjY5_uEaTv4_L2s@aspen.lan>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Tue, 4 Nov 2025 13:23:15 +0800
X-Gm-Features: AWmQ_bkg7-u1JQXWEtjUocJxGMuIfL8KF1cVsoKVcrovu50dF2JnvSEL5f1fIno
Message-ID: <CAK6c68gjzSytxwX5kUYLwbRceFgTHP-mynUSq1tNmUWD8n55Cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:30=E2=80=AFAM Daniel Thompson <daniel@riscstar.co=
m> wrote:
>
> On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> > From: Pengyu Luo <mitltlatltl@gmail.com>
> >
> > Add support for Awinic AW99706 backlight, which can be found in
> > tablet and notebook backlight, one case is the Lenovo Legion Y700
> > Gen4. This driver refers to the official datasheets and android
> > driver, they can be found in [1].
> >
> > [1] https://www.awinic.com/en/productDetail/AW99706QNR
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > ---
> > Changes in v2:
> > - add handler for max-brightness and default-brightness
> > - use proper units for properties (Krzysztof)
> > - drop non-fixed properties (Krzysztof)
> > - include default values in the aw99706_dt_props table (Daniel)
> > - warn when a property value from DT is invalid (Daniel)
> > - drop warning when optional properties are missing (Daniel)
> > - add a function pointer into the aw99706_dt_props table to handle look=
up (Daniel)
> > - use a lookup function instead of hardcoding the formula for the iLED =
max (Daniel)
> > - move BL enalbe handler into aw99706_update_brightness (Daniel)
> > - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727=
-3-caojunjie650@gmail.com
>
> Thanks for the changes.
>
> I'm afraid I don't like encoding the `shift` in the DT properties table.
> Caching something that is so easy to recalculate makes no sense to me.
> See below:
>
>
> > +struct aw99706_dt_prop {
> > +     const char * const name;
> > +     int (*lookup)(const struct aw99706_dt_prop *prop, u32 dt_val, u8 =
*val);
> > +     const u32 * const lookup_tbl;
> > +     u8 tbl_size;
> > +     u8 reg;
> > +     u8 mask;
> > +     u8 shift;
>
> There should bee no need to record `shift` here. It's just a
> duplicating information already held in `mask`.
>
>
> > +     u32 def_val;
> > +};
> > +
> > +static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *pr=
op,
> > +                                   u32 dt_val, u8 *val)
> > +{
> > +     int i;
> > +
> > +     if (!prop->lookup_tbl) {
> > +             *val =3D dt_val;
> > +             return 0;
> > +     }
> > +
> > +     for (i =3D 0; i < prop->tbl_size; i++)
> > +             if (prop->lookup_tbl[i] =3D=3D dt_val)
> > +                     break;
> > +
> > +     *val =3D i;
> > +
> > +     return i =3D=3D prop->tbl_size ? -1 : 0;
> > +}
> > +
> > +#define MIN_ILED_MAX 5000
> > +#define MAX_ILED_MAX 50000
> > +#define STEP_ILED_MAX        500
> > +
> > +static int
> > +aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *pro=
p,
> > +                                  u32 dt_val, u8 *val)
> > +{
> > +     if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
> > +             return -1;
> > +
> > +     *val =3D (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
> > +
> > +     return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
> > +}
> > +
> > +static const struct aw99706_dt_prop aw99706_dt_props[] =3D {
> > +     {
> > +             "awinic,dim-mode", aw99706_dt_property_lookup,
> > +             NULL, 0,
> > +             AW99706_CFG0_REG,
> > +             AW99706_DIM_MODE_MASK, __builtin_ctz(AW99706_DIM_MODE_MAS=
K),
>
> These __builtin_ctz() calls shouldn't be in the lookup table (if they
> are not in the lookup table then can never be inconsistant with the
> mask).
>
>
> > +             1,
> > +     },
> <snip>
> > +     {
> > +             "awinic,ramp-ctl", aw99706_dt_property_lookup,
> > +             NULL, 0,
> > +             AW99706_CFG6_REG,
> > +             AW99706_RAMP_CTL_MASK, __builtin_ctz(AW99706_RAMP_CTL_MAS=
K),
> > +             2,
> > +     },
> > +};
> > +
> > +struct reg_init_data {
> > +     u8 reg;
> > +     u8 mask;
> > +     u8 val;
> > +};
> > +
> > +static struct reg_init_data reg_init_tbl[ARRAY_SIZE(aw99706_dt_props)]=
;
> > +
> > +static void aw99706_dt_parse(struct aw99706_device *aw,
> > +                          struct backlight_properties *bl_props)
> > +{
> > +     const struct aw99706_dt_prop *prop;
> > +     u32 dt_val;
> > +     int ret, i;
> > +     u8 val;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > +             prop =3D &aw99706_dt_props[i];
> > +             ret =3D device_property_read_u32(aw->dev, prop->name, &dt=
_val);
> > +             if (ret < 0)
> > +                     dt_val =3D prop->def_val;
> > +
> > +             if (prop->lookup(prop, dt_val, &val)) {
> > +                     dev_warn(aw->dev, "invalid value %d for property =
%s, using default value %d\n",
> > +                              dt_val, prop->name, prop->def_val);
> > +
> > +                     prop->lookup(prop, prop->def_val, &val);
> > +             }
> > +
> > +             reg_init_tbl[i].reg =3D prop->reg;
> > +             reg_init_tbl[i].mask =3D prop->mask;
> > +             reg_init_tbl[i].val =3D val << prop->shift;
>
> Can't you just use FIELD_PREP() to set val (either here or at the point
> the init table is consumed)? That why there's no ffs() or clz() at all.
>

Thanks for it, I tried to find something like FIELD_PREP() to avoid
keeping shift, but I failed to notice it in the bitfield.h. I will drop
the shift field and use it to handle bit operations gracefully.

>
> > +     }
> > +
> > +     aw->init_tbl =3D reg_init_tbl;
> > +     aw->init_tbl_size =3D ARRAY_SIZE(reg_init_tbl);
>
> Copying a pointer to a single instance static data buffer into a
> dynamically allocated data structure isn't right.
>
> You should include the init table as part of `struct aw99706_device`.
>

I see. Multiple instances should be taken into account.

>
> > +
> > +     bl_props->brightness =3D AW99706_MAX_BRT_LVL >> 1;
> > +     bl_props->max_brightness =3D AW99706_MAX_BRT_LVL;
> > +     device_property_read_u32(aw->dev, "default-brightness",
> > +                              &bl_props->brightness);
> > +     device_property_read_u32(aw->dev, "max-brightness",
> > +                              &bl_props->max_brightness);
> > +
> > +     if (bl_props->max_brightness > AW99706_MAX_BRT_LVL)
> > +             bl_props->max_brightness =3D AW99706_MAX_BRT_LVL;
> > +
> > +     if (bl_props->brightness > bl_props->max_brightness)
> > +             bl_props->brightness =3D bl_props->max_brightness;
> > +}
> > +
> > +static int aw99706_hw_init(struct aw99706_device *aw)
> > +{
> > +     int ret, i;
> > +
> > +     gpiod_set_value_cansleep(aw->hwen_gpio, 1);
> > +
> > +     for (i =3D 0; i < aw->init_tbl_size; i++) {
> > +             ret =3D aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
> > +                                           aw->init_tbl[i].mask,
> > +                                           aw->init_tbl[i].val);
> > +             if (ret < 0) {
> > +                     dev_err(aw->dev, "Failed to write init data %d\n"=
, ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
>
> This should use FIELD_PREP() not FIELD_MODIFY();
>

ACK. FIELD_PREP() makes more sense here.

Regards,
Junjie

