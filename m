Return-Path: <linux-leds+bounces-1534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49A8B5608
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2024 13:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 927BBB228FF
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2024 11:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633E13D969;
	Mon, 29 Apr 2024 11:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmrymyUv"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149823778
	for <linux-leds@vger.kernel.org>; Mon, 29 Apr 2024 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714388908; cv=none; b=imnUIjCFL4/EyM+gO2Nwd6m3yFRBFSii/RE0bOFub1MFkBOLa+kd6aF7CjECYHDmBvIdMBpUkPuCa4Xx+lU67CXlybfSvjChzhIXk9CfYYw6JVE1umxpiqeGE6H9lkhHi9BwZmuEQtJgLI3yOfhhulfAO2z1LCVEMExgX+5E+lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714388908; c=relaxed/simple;
	bh=rp6+hKC+ad+mgkEi98DBJjCqcJINH+IEzxTI1mkGLxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pvBv1cE9F+MjIvTW5dS//1xqQGjgjM87gwx2HL1Z/gvo+NqDSDV8sp+99idHilBh4PLu098BMuLGJlclGgZJx3AGChodfFmpSQM2QP7QkUGbwGs1DpskyaDy3YqyqetPIvMBgBWrKvo9pv5O5ZjQ4xPVtMzOQVIfw7/7b/lyxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmrymyUv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714388904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fi9Ww5WN0UHN0lPfAwwVKTm5WIJO8LV9mSzNDaozAKk=;
	b=PmrymyUv785GtFKpK2H0ldClJjFfmPkJ6h896xVdfSK6BnxCk+R2ZXdbY+7iPYNhccdgGh
	eB2yWNHLu39xAwa7iedjn8Gm47mVkH9HJA4yRkonWCtBtmhC4/+MspPll18aWwxTc3W9Vp
	LP+lOyID8ABvgGW5TgLysbCFik8welI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-BO02Q1NgOViyjxw1KARs8w-1; Mon, 29 Apr 2024 07:08:22 -0400
X-MC-Unique: BO02Q1NgOViyjxw1KARs8w-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51aaee20733so3360627e87.2
        for <linux-leds@vger.kernel.org>; Mon, 29 Apr 2024 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388901; x=1714993701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi9Ww5WN0UHN0lPfAwwVKTm5WIJO8LV9mSzNDaozAKk=;
        b=E+GUug9PZbdkR5jjs1Wf4IyRVRQymf8CJ2BbzjMetraw+/kuW5IY5Z85IsNArRWIBg
         z5Hdb8SzRNBsksWUBaxleLytv2PiZMwyXk5N4eWNanT937RSTHFZK5jvnpACCKID0XiR
         FMLU+8VBWMAdcoYFrfRqoaPCLdBY0pq1JYI2fNWX3G+W0FajRzNpVNyeNhjqR+f3Rs+m
         c6WonJ8vob3RRl+wVxCPEgutZcfjw+b2An1YFoX56mhfV8UUSsjZRVIkVlJk6exzQ0+s
         vWTGufjyMP3XDjvrOiWgKkNGzZ9VCO8vhtQxkGDs7dD7GPpuXxuHIT76SvPIQ6n8hO+I
         AkNA==
X-Forwarded-Encrypted: i=1; AJvYcCVPHpKfW89A3JSBzpqlw1Sxrq8jqVMXi5RsFLZj3RWzzM2eQorUeMzodoMdyhh5ECD1bIfDn55J+63jGdqfisrd3AkoHmly+wBtwA==
X-Gm-Message-State: AOJu0YwEvoPYpUVPPY02gQelgk59idRBp7awAui0rY9MfEdl2B8FyOlI
	2qwkXzuRKC5Xlxou8lbDKFcftHcENnhPuJecA83O1EPBDKS+9jOhyx9zKqn2g5ytmHGveL4Xf57
	cslX3FL/mLRdfhQhAfB5VsUCfRE1U+4m49qH+Ase3OBzM6FHCfWNxTSgnXG0=
X-Received: by 2002:ac2:58e4:0:b0:51a:c8ba:d908 with SMTP id v4-20020ac258e4000000b0051ac8bad908mr4900893lfo.62.1714388901474;
        Mon, 29 Apr 2024 04:08:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8/9kepMq4qGDA0SgBLzUsoTj90wfyKWPp2nBHN74LvVd8ORCf32skRlaD0gI0fxbnFiZi7g==
X-Received: by 2002:ac2:58e4:0:b0:51a:c8ba:d908 with SMTP id v4-20020ac258e4000000b0051ac8bad908mr4900881lfo.62.1714388901138;
        Mon, 29 Apr 2024 04:08:21 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y20-20020a056402271400b00572300f0768sm5885853edd.79.2024.04.29.04.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 04:08:19 -0700 (PDT)
Message-ID: <3e103075-c170-42e3-928b-41d3bb11e6e8@redhat.com>
Date: Mon, 29 Apr 2024 13:08:18 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026
 and 2027
To: Kate Hsuan <hpa@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
References: <20240424065212.263784-1-hpa@redhat.com>
 <20240424065212.263784-3-hpa@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240424065212.263784-3-hpa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/24/24 8:52 AM, Kate Hsuan wrote:

Maybe start the commit message with:

Add an i2c_device_id id_table to match manually instantiated
(non device-tree / ACPI instantiated) KTD202x controllers as
found on some x86 boards.

?

> This table shows the maximum support LED channel for KTD2026 and KTD-2027.
> The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
> 4-channel LED controller KTD2027 controls R/G/B and flashing LEDs.

Other then that this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> Datasheet: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/leds/rgb/leds-ktd202x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
> index f1c810c415a4..60ca6ec34336 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -606,6 +606,13 @@ static void ktd202x_shutdown(struct i2c_client *client)
>  	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
>  }
>  
> +static const struct i2c_device_id ktd202x_id[] = {
> +	{"ktd2026", KTD2026_NUM_LEDS},
> +	{"ktd2027", KTD2027_NUM_LEDS},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ktd202x_id);
> +
>  static const struct of_device_id ktd202x_match_table[] = {
>  	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
>  	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
> @@ -621,6 +628,7 @@ static struct i2c_driver ktd202x_driver = {
>  	.probe = ktd202x_probe,
>  	.remove = ktd202x_remove,
>  	.shutdown = ktd202x_shutdown,
> +	.id_table = ktd202x_id,
>  };
>  module_i2c_driver(ktd202x_driver);
>  


