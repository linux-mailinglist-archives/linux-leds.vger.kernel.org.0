Return-Path: <linux-leds+bounces-857-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA6585A4A0
	for <lists+linux-leds@lfdr.de>; Mon, 19 Feb 2024 14:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C30321C210EC
	for <lists+linux-leds@lfdr.de>; Mon, 19 Feb 2024 13:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791FE3612D;
	Mon, 19 Feb 2024 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irElZST3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA12282E2;
	Mon, 19 Feb 2024 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708349317; cv=none; b=G211NzVZwKajjm+DszqD06WZTTQ+Nk/M56+sb7FzTqCQBNBptthKi6SQTEz8FtaYpCk4Cw0aED0OAFMFBxHyHnOZlfxtH6BCHfYEACTGtm4PO2dj7Vo9Aiij2/MwPHNaKId1zVbtKWL25D+hbmIGtgEbtui7zq+sBqp8dpvuNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708349317; c=relaxed/simple;
	bh=U6Xoimujhng8rp0yjcYZ+VvvasGvGK0MjKdjcM/FtUI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IXqxc6Zc2o92gEVIoBtUIL0VNcJhLfHgApGf3V10IbkqXEoc/Ej8LXFgAoLF8AjoR+YjTNp7+HqJoU9nTPYmxRmeOpDx9foTyzN8lXV1Aj2RVrty6+TxNXVLCR62wAZaHHibHke9M6gvDedcL2w7pR658eAsOE72/zm69s4zB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irElZST3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708349316; x=1739885316;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U6Xoimujhng8rp0yjcYZ+VvvasGvGK0MjKdjcM/FtUI=;
  b=irElZST366Iq/fXRDYzJHXiaiH2hoJywhnGTqpbf0YIwE+Ky6T1LxUZo
   kri/3odaQ/kBJo9ntSxtNhWaqtmMWg6MSb6Gcl8pQ4jzbZRa6SayAsckG
   jIZifseUMDGLVBI9cS7gVkpYIuI+ZJ4Rh7Fz+oQm+0X0sW50wWDDYlrka
   DwuEaXfXY5GJg6DDwni59DrRE2+KYAMp9x/KkzUma38570OobgPDFQV9F
   VeNUDK2/r4oHi9lrsnMJXQzzAW9DCHTQ+lKv6DGj1FfalR3hfHCMHqzgS
   qbSYfhRZVsEdBmNyWp0sbvWBFh1H0vozND3zUI1hNqEbbhw6tpJ7kvOp9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2551589"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2551589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 05:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="35517724"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.18])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 05:28:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Feb 2024 15:28:24 +0200 (EET)
To: Kate Hsuan <hpa@redhat.com>
cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
    linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Andr=E9_Apitzsch?= <git@apitzsch.eu>
Subject: Re: [PATCH v2 3/3] leds: rgb: leds-ktd202x: Skip regulator settings
 for Xiaomi pad2
In-Reply-To: <20240216160526.235594-4-hpa@redhat.com>
Message-ID: <9f2d02ff-5a8a-4c11-a1a3-bea43d7b6454@linux.intel.com>
References: <20240216160526.235594-1-hpa@redhat.com> <20240216160526.235594-4-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Feb 2024, Kate Hsuan wrote:

> The controller is already powered by BP25890RTWR on Xiaomi Pad2 so the
> regulator settings can be ignored.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  drivers/leds/rgb/leds-ktd202x.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
> index 8eb79c342fb6..6fd0794988e9 100644
> --- a/drivers/leds/rgb/leds-ktd202x.c
> +++ b/drivers/leds/rgb/leds-ktd202x.c
> @@ -14,7 +14,9 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/regmap.h>
> +#ifndef CONFIG_ACPI
>  #include <linux/regulator/consumer.h>
> +#endif

Why you need #ifndef here?
  
>  #define KTD2026_NUM_LEDS 3
>  #define KTD2027_NUM_LEDS 4
> @@ -105,18 +107,22 @@ struct ktd202x {
>  
>  static int ktd202x_chip_disable(struct ktd202x *chip)
>  {
> +#ifndef CONFIG_ACPI
>  	int ret;
> +#endif
>  
>  	if (!chip->enabled)
>  		return 0;
>  
>  	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
>  
> +#ifndef CONFIG_ACPI
>  	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
>  	if (ret) {
>  		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
>  		return ret;
>  	}
> +#endif
>  
>  	chip->enabled = false;
>  	return 0;
> @@ -129,11 +135,13 @@ static int ktd202x_chip_enable(struct ktd202x *chip)
>  	if (chip->enabled)
>  		return 0;
>  
> +#ifndef CONFIG_ACPI
>  	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators), chip->regulators);
>  	if (ret) {
>  		dev_err(chip->dev, "Failed to enable regulators: %d\n", ret);
>  		return ret;
>  	}
> +#endif
>  	chip->enabled = true;
>  
>  	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_WAKE);
> @@ -560,6 +568,7 @@ static int ktd202x_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +#ifndef CONFIG_ACPI
>  	chip->regulators[0].supply = "vin";
>  	chip->regulators[1].supply = "vio";
>  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
> @@ -573,10 +582,12 @@ static int ktd202x_probe(struct i2c_client *client)
>  		dev_err_probe(dev, ret, "Failed to enable regulators.\n");
>  		return ret;
>  	}
> +#endif
>  
>  	chip->num_leds = (int) (unsigned long)i2c_get_match_data(client);
>  
>  	ret = ktd202x_probe_dt(chip);
> +#ifndef CONFIG_ACPI
>  	if (ret < 0) {
>  		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
>  		return ret;
> @@ -587,6 +598,10 @@ static int ktd202x_probe(struct i2c_client *client)
>  		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
>  		return ret;
>  	}
> +#else
> +	if (ret < 0)
> +		return ret;
> +#endif
>  
>  	mutex_init(&chip->mutex);

To me this entire approach looks quite ugly. It would be much cleaner to 
have something along these lines:

#ifndef CONFIG_ACPI
static int ktd202x_regulators_disable(struct ktd202x *chip)
{
	int ret;

	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
	if (ret)
		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);

	return ret;
}
...
#else
static inline int ktd202x_regulators_disable(struct ktd202x *chip) { return 0; }
...
#endif

And call that function without any #ifdefs from the other code.

-- 
 i.


