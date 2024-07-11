Return-Path: <linux-leds+bounces-2261-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7956F92E841
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 14:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA421F21602
	for <lists+linux-leds@lfdr.de>; Thu, 11 Jul 2024 12:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1271E15B14C;
	Thu, 11 Jul 2024 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rsbL5l1q"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADDB156F3C;
	Thu, 11 Jul 2024 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700902; cv=none; b=CWuZtnNyYGJzsHnhzM/6heGf4wWboTH80v0v9jY2bULidybaC+N2PMKNNAibNYcVrNpYGBJFRx50Du63L6WrC3CVwITUnOq/r4GqYCVbFIoJvjv33Ce40C1euWUHnDxC0vc6kWY8cZrq8rPi3Eg36uMgktF6tnZi7WexUJ2Oa9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700902; c=relaxed/simple;
	bh=i4hyI/hy0o2C6P+eReJ4tkD49PMyVqhEhDDKVFDTbiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSaZD7FxC9NLL3QLigVYuWHycarIuM3bnqUxoah2H+EJWTTOhvziQ6yS5aB9seVElu6a1dSB417CH8gJbg4G8JlaVxZozThs6ByiUnF+rVORncHTznRso4eXN+bMMi44Q2UmVBfrWSkYG4d0t5Nk4mC8tgsc+ZlDlkCgky3whvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rsbL5l1q; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 757B787CDB;
	Thu, 11 Jul 2024 14:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1720700893;
	bh=NIzryQ37ZZoNVW+U0vbGNpcPRjx/Ml6ebapl6goqrtg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rsbL5l1quHBJDTctuFf/JbNjErt2GHuDH7RbMyG9r2Fw1zSoB1oDDVbbFkNFpES0n
	 wHFaqDRHwYP19WSXRR50zhgr2TY9zx91OFAEymfZbe0RHxxj6xb+U5M5Vilcqw4P3j
	 6xI7VTdZk6wc57K6z3CCkeBF8gcEhh7+DxOTSXsec1oilpHAOJ8m11Gr7Ku68jE5K2
	 5CE4zw9/tfVNT/VDO0P6rQDnUNm61kzc3yzOp46cGbDwCM7kzEjiKGwToToJt1Y+89
	 BdBW0eP6G7vXhvTNmO7w9HhiSQDGDaSoaCi5uWEQryhCT9IpSGe82y/YJzyv+g/0Yp
	 ISn6eZBQn5ixg==
Message-ID: <1458500b-150f-4882-992c-02823cb8dcf8@denx.de>
Date: Thu, 11 Jul 2024 13:47:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] leds: leds-pca995x: Add support for NXP PCA9956B
To: pieterjanca@gmail.com, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240711-pca995x-v3-0-a1bf1f3c3f5a@gmail.com>
 <20240711-pca995x-v3-2-a1bf1f3c3f5a@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240711-pca995x-v3-2-a1bf1f3c3f5a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/11/24 9:52 AM, Pieterjan Camerlynck via B4 Relay wrote:

[...]

> @@ -52,9 +69,9 @@ struct pca995x_led {
>   };
>   
>   struct pca995x_chip {
> +	const struct pca995x_chipdef *chipdef;
>   	struct regmap *regmap;
>   	struct pca995x_led leds[PCA995X_MAX_OUTPUTS];
> -	int btype;

Nitpick, maybe you can replace btype with chipdef in this place, without 
reordering the structure ?

>   };
>   
>   static int pca995x_brightness_set(struct led_classdev *led_cdev,

In any case:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

