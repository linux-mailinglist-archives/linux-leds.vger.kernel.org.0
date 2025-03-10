Return-Path: <linux-leds+bounces-4209-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBAA58D9D
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 09:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3F7164803
	for <lists+linux-leds@lfdr.de>; Mon, 10 Mar 2025 08:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A738922332E;
	Mon, 10 Mar 2025 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="FawhFLw7"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3C1209F5B;
	Mon, 10 Mar 2025 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741593903; cv=none; b=EolymxrwqVYmQ1Mm2b01uVivS8OvhQNCur9IW4WtD2UkK1It3DeJzzfIdoKX2JyA2shdXbFglargRnpE/g1vqAMV8T+5naF98QID8hUpXG05QKNFFtuC3HPf5yi7NX6Q3HV9Xzl5DcwmHwMGWiSUylN6KcEka3K+JXIJRvC4TWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741593903; c=relaxed/simple;
	bh=DHlfY57p6h6SKmE8ssHMDa5+6tjkTUcm/QHAqHKbtYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnKyb5Vjqu2c8K1D/K6ViNAOqbG684VZo/7dBTbYXmWN31HxMyIgnWSXk5Uuj+cIKkAJkANJjOvNxTuYGHvHCclPeNnnW13Uw/L6eWVwLuG2lp7pGd2sc77+qywGnl2u5zfvl87JA9ANf0aPFpep0lC5302xyi89tPJ+UXYD3lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=FawhFLw7; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=y1UGZfwMxMzHKFzr1JvXBywioLUm+BvcV2Z76x1etEc=; b=FawhFLw7Og8aaRtmS7FqI5xCke
	+grr16xbVC+Egw1Ar7NT74qmowzCtgTmnylfG3OinfuFGGydOlF+G1IWaFf9xpanQEJ9BBsp5lfjk
	Og0CN54nWYRe+arxzUbFBvjMg2FmlmEefomaxGKQd2YG7L0+dy8PTXwydoX6PdU4kHJo=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62820 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1trY84-001kgr-Jl; Mon, 10 Mar 2025 09:04:52 +0100
Message-ID: <597be0ca-ab3e-4313-8b35-57d2ce52f156@emfend.at>
Date: Mon, 10 Mar 2025 09:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-2-d1071d90f9ea@emfend.at>
 <554823f8-be69-452d-908d-a7c7a80bcd9e@kernel.org>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <554823f8-be69-452d-908d-a7c7a80bcd9e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Krzysztof,

Am 10.03.2025 um 08:46 schrieb Krzysztof Kozlowski:
> On 28/02/2025 11:31, Matthias Fend wrote:
>> +	tps6131x->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);
>> +	ret = tps6131x_reset_chip(tps6131x);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "Failed to reset LED controller\n");
>> +
>> +	ret = tps6131x_init_chip(tps6131x);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "Failed to initialize LED controller\n");
>> +
>> +	ret = tps6131x_led_class_setup(tps6131x);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "Failed to setup led class\n");
>> +
>> +	ret = tps6131x_v4l2_setup(tps6131x);
>> +	if (ret)
>> +		return dev_err_probe(&client->dev, ret, "Failed to setup v4l2 flash\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void tps6131x_remove(struct i2c_client *client)
>> +{
>> +	struct tps6131x *tps6131x = i2c_get_clientdata(client);
>> +
>> +	v4l2_flash_release(tps6131x->v4l2_flash);
>> +
>> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
>> +}
>> +
>> +static const struct of_device_id of_tps6131x_leds_match[] = {
>> +	{ .compatible = "ti,tps61310" },
>> +	{ .compatible = "ti,tps61311" },
> 
> 
> No differences? So devices are fully compatible? Then it should be
> expressed in the binding with fallback. Or the binding description or
> commit msg should explain why they are not compatible.

Yes, from a software perspective both are identical.
The only difference I found between the two variants are different 
valley current limits. These are described in the bindings.

Best regards
  ~Matthias

> 
> 
> Best regards,
> Krzysztof


