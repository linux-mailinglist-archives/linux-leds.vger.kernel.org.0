Return-Path: <linux-leds+bounces-4278-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A46A6118B
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 13:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 429427A9DD6
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7AF1FE47C;
	Fri, 14 Mar 2025 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="ZJy+PQr6"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166401FF1A8;
	Fri, 14 Mar 2025 12:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741955920; cv=none; b=RKUDFgInYuz7co+S+Wy1r8gMGhzy5BAX4fn2szGZ2R4TapsgQgEE90RVELjLTXC+dsGsPYbTLAzWaQci0dru9WZ3SxI0T2Z6A4WPG74EFZXvD7m6tA0F+s9UYmUNv00BqeuzZwE8vl5HU6W+Epp/hrGzr9AK57T0sJZEW1uBqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741955920; c=relaxed/simple;
	bh=vOgy0s3Ijmkeasy12zLFJKxY8z4lZdIGDJQACKfdfX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZykxO9kpFk4v8YQqGxTiMPMv2/0YJW0QngalPAExT1m8gYRxmlNlmCFWcnOlbh22jqOCNkpA3Q2mjlsYnYRSbCkLPrxgCR7kr9dLboyzUBL05P2OMMvPFdU6/e8PjRuXd4U65VgfyIttb3Vcb7FSm4HbOSNr3mWUFSCTspaDNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=ZJy+PQr6; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mIxQ1dxQxp6C/TV6htutkor/iBB33VBzcKLVVA9Ia8U=; b=ZJy+PQr6ba0IlYAnto0gpfyZRG
	jwetHAksMo+PqxkAHS4uSxggSZxQ3H2Z4KFM8v3kXQ+2+aaoy0pKkVqayfX4Ld1F/BsaRsKU579f3
	GtqBWDpypW0g/QIZKjYo/fOk0bjBXO6RkCfc46Mscshtsqbb9mHWcOONTZpLiGXqBov0=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:49180 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tt4J7-00EQNW-5B; Fri, 14 Mar 2025 13:38:33 +0100
Message-ID: <7f9b920f-1851-4ebe-9054-d32de79d3678@emfend.at>
Date: Fri, 14 Mar 2025 13:38:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com
References: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
 <20250228-leds-tps6131x-v1-2-d1071d90f9ea@emfend.at>
 <20250310144946.GH8350@google.com>
 <def0351b-c037-47c8-b395-d64cfca7ae25@emfend.at>
 <20250314105257.GD3890718@google.com>
 <8a16c018-8466-4dea-8f1e-e8a65e3ed950@emfend.at>
 <20250314114551.GL3890718@google.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <20250314114551.GL3890718@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hi Lee,

Am 14.03.2025 um 12:45 schrieb Lee Jones:
> On Fri, 14 Mar 2025, Matthias Fend wrote:
> 
>> Hi Lee,
>>
>> Am 14.03.2025 um 11:52 schrieb Lee Jones:
>>> On Fri, 14 Mar 2025, Matthias Fend wrote:
>>>
>>>> Hi Lee,
>>>>
>>>> thanks a lot for your feedback!
>>>>
>>>> Am 10.03.2025 um 15:49 schrieb Lee Jones:
>>>>> On Fri, 28 Feb 2025, Matthias Fend wrote:
>>>>>
>>>>>> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
>>>>>> stage is capable of supplying a maximum total current of roughly 1500mA.
>>>>>> The TPS6131x provides three constant-current sinks, capable of sinking up
>>>>>> to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
>>>>>> each sink (LED1, LED2, LED3) supports currents up to 175mA.
>>>>>>
>>>>>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>>>>>> ---
>>>>>>     MAINTAINERS                        |   7 +
>>>>>>     drivers/leds/flash/Kconfig         |  11 +
>>>>>>     drivers/leds/flash/Makefile        |   1 +
>>>>>>     drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
>>>>>>     4 files changed, 817 insertions(+)
> 
> [...]
> 
>>>>>> +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
>>>>>> +{
>>>>>> +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
>>>>>> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
>>>>>> +
>>>>>> +	guard(mutex)(&tps6131x->lock);
>>>>>> +
>>>>> /> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
>>>>>> +				 false);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
>>>>>> +	.external_strobe_set = tps6131x_flash_external_strobe_set,
>>>>>> +};
>>>>>> +
>>>>>> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
>>>>>> +{
>>>>>> +	struct v4l2_flash_config v4l2_cfg = { 0 };
>>>>>> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
>>>>>> +
>>>>>> +	intensity->min = tps6131x->step_torch_current_ma;
>>>>>> +	intensity->max = tps6131x->max_torch_current_ma;
>>>>>> +	intensity->step = tps6131x->step_torch_current_ma;
>>>>>> +	intensity->val = intensity->min;
>>>>>> +
>>>>>> +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
>>>>>
>>>>> tps6131x->client->dev?
>>>>
>>>> Do you mean the name should be taken from the I2C device?
>>>> The current name, for example, is 'white:flash-0', while the I2C device name
>>>> would be '4-0033'. So I think the current version is appropriate, don't you
>>>> think?
>>>
>>> No, I'm implying that:
>>>
>>>     tps6131x->client->dev == tps6131x->fled_cdev.led_cdev.dev
>>>
>>> ... and that the former is shorter / neater.
>>
>> Hmm. That's interesting. I thought these were two different devices, which
>> seems to be actually the case for me. Hence the different names in the kobj.
>> Are the devices really supposed to be identical?
> 
> Interesting.  What are their names?

tps6131x->fled_cdev.led_cdev.dev: 'white:flash-0'
tps6131x->client->dev: '4-0033'

Best regards
  ~Matthias


> 


