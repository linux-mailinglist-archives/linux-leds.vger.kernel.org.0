Return-Path: <linux-leds+bounces-3657-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FF9F6962
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 16:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873FC1888E89
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 15:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2939E1B043A;
	Wed, 18 Dec 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uivC4/pW"
X-Original-To: linux-leds@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E54317E;
	Wed, 18 Dec 2024 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534078; cv=none; b=KwiI2TP3I8mgYfWUEicWOY0horChWNRCTTHqmIaEQDOiU+wotxPHefxfysKaAb6AZgKIFwde2DM+g+zgInH9iycy6dyjwRfUJyoh7TDMWM6GY5o15iTSTQOXybgcSxnxST9t9LYPjRuldgoElwougcYaVPCT7EjPouHnNgnJlRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534078; c=relaxed/simple;
	bh=wVNSW7UCP5lGu0zTFsrk1zCLfZqJWeV0ih0qaaGAGGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B1yLMfpfJaGUCzn0aU/Mwj4Ex6LgPiu0rLuNCKueCxlIodvy52xmKUz4MBE5xt0s5vlUJstHzLRAfEuI3VXfuIrVpgSz6XXddHT5abEGd0xSdFBx9bx9xPpPtvAvZpOGski46sHWYy0RZ434MEYZlF4CYri2fjBBZZ48BqZaBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uivC4/pW; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BIF11qM107098;
	Wed, 18 Dec 2024 09:01:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734534061;
	bh=n+kqPoXzQVlq8tmKYfVCHYntyn3gNq+ZYuZncBmPltw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uivC4/pWeoojrE+ZYIsaEXDGlgkf00uT/Badm+XHN9PuG3Zu4Zattpbk8ITZPhkh1
	 9TdNDjxSyrqQ2N6DQd2FcKaYv16fYWEziD2s9ShsQd98jAYx5NvKoUyowmVPg6eYOv
	 oH6Y955A6/+AsTe37saoD8Ps1UWfVjLKPRsCsfcU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIF11Oa126932;
	Wed, 18 Dec 2024 09:01:01 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 09:01:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 09:01:00 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIF10Th093584;
	Wed, 18 Dec 2024 09:01:00 -0600
Message-ID: <c192ff06-dc68-43ee-8ab8-3c5a8faa3cb9@ti.com>
Date: Wed, 18 Dec 2024 09:01:00 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] leds: lp8864: New driver
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "lee@kernel.org"
	<lee@kernel.org>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "danielt@kernel.org" <danielt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
 <20241217133713.326853-3-alexander.sverdlin@siemens.com>
 <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
 <00caa5cf65fb4cf40cb94e3e715640ca0a7975f8.camel@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <00caa5cf65fb4cf40cb94e3e715640ca0a7975f8.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/18/24 8:45 AM, Sverdlin, Alexander wrote:
> Hi Andrew!
> 
> On Tue, 2024-12-17 at 09:56 -0600, Andrew Davis wrote:
>>> +static int lp8864_fault_check(struct lp8864_led *led)
>>> +{
>>> +	int ret, i;
>>> +	unsigned int val;
>>> +
>>> +	ret = regmap_read(led->regmap, LP8864_SUPPLY_STATUS, &val);
>>> +	if (ret)
>>> +		goto err;
>>
>> You could probably keep this simple and print the exact error here
>> and return, vs the common error message at the end
> 
> This would mean 6x dev_err() instead of one? While I have no idea
> what we could do with individual error messages here.
> 

If giving specific error messages is not important, then this is
fine how it is.

Andrew

>>> +
>>> +	/* Odd bits are status bits, even bits are clear bits */
>>> +	for (i = 0; i < ARRAY_SIZE(lp8864_supply_status_msg); i++)
>>> +		if (val & BIT(i * 2 + 1))
>>> +			dev_warn(&led->client->dev, "%s\n", lp8864_supply_status_msg[i]);
>>> +
>>> +	/*
>>> +	 * Clear bits have an index preceding the corresponding Status bits;
>>> +	 * both have to be written "1" simultaneously to clear the corresponding
>>> +	 * Status bit.
>>> +	 */
>>> +	if (val)
>>> +		ret = regmap_write(led->regmap, LP8864_SUPPLY_STATUS, val >> 1 | val);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	ret = regmap_read(led->regmap, LP8864_BOOST_STATUS, &val);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	/* Odd bits are status bits, even bits are clear bits */
>>> +	for (i = 0; i < ARRAY_SIZE(lp8864_boost_status_msg); i++)
>>> +		if (val & BIT(i * 2 + 1))
>>> +			dev_warn(&led->client->dev, "%s\n", lp8864_boost_status_msg[i]);
>>> +
>>> +	if (val)
>>> +		ret = regmap_write(led->regmap, LP8864_BOOST_STATUS, val >> 1 | val);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	ret = regmap_read(led->regmap, LP8864_LED_STATUS, &val);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	/*
>>> +	 * Clear already reported faults that maintain their value until device
>>> +	 * power-down
>>> +	 */
>>> +	val &= ~led->led_status_mask;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(lp8864_led_status_msg); i++)
>>> +		if (lp8864_led_status_msg[i] && val & BIT(i))
>>> +			dev_warn(&led->client->dev, "%s\n", lp8864_led_status_msg[i]);
>>> +
>>> +	/*
>>> +	 * Mark those which maintain their value until device power-down as
>>> +	 * "already reported"
>>> +	 */
>>> +	led->led_status_mask |= val & ~LP8864_LED_STATUS_WR_MASK;
>>> +
>>> +	/*
>>> +	 * Only bits 14, 12, 10 have to be cleared here, but others are RO,
>>> +	 * we don't care what we write to them.
>>> +	 */
>>> +	if (val & LP8864_LED_STATUS_WR_MASK)
>>> +		ret = regmap_write(led->regmap, LP8864_LED_STATUS, val >> 1 | val);
>>> +	if (ret)
>>> +		goto err;
>>> +
>>> +	return 0;
>>> +
>>> +err:
>>> +	dev_err(&led->client->dev, "Failed to read/clear faults (%pe)\n", ERR_PTR(ret));
>>> +
>>> +	return ret;
>>> +}
> 

