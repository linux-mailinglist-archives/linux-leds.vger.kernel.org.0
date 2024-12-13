Return-Path: <linux-leds+bounces-3603-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B899F1924
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 23:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36A4F188E6F8
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 22:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84E118F2D4;
	Fri, 13 Dec 2024 22:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="TtUhHujo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DF62114;
	Fri, 13 Dec 2024 22:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734129173; cv=none; b=qtuU9iQ0iggkdt+USvY34GjIiHmvd5uvScq2twSgWXs8VPEXbZCmDxeAXxeUVdfdAb/ukCuPZUKRSeny6qcfRAaRabfUNcNHPHrbLuDTcojvPuzZ8HBqlyIupmT+YyFmhbTfQkqUVIFGYTn+K2XRlhwDT74oztHd9DtY57OebZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734129173; c=relaxed/simple;
	bh=vnmgKd4DpL+rwwN/tkLSZraFY2PgmaB34glLCaCeCWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tET6nLahgjC4uAt7NBzy3O9kZyP733qKW+jKbatgucGgoStTgxt6Wjxx/Ngby/EqJOcTr/bHDhBMtidvIuuW2VqQO6kCpJYWTi3v5+nkmSniNi27XeraCrVFQWZ+7QipyF8qBGNS3q+ROnHKz435e6MkW+2pQCp1hle3zmYdWGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=TtUhHujo; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BF71103B8FD5;
	Fri, 13 Dec 2024 23:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1734129167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3lMENMefBk6pUR9W4xYAZB0rcngf/adMQ7Rd64R32A=;
	b=TtUhHujoQYV7chB9SEaTrnGogUxwq5ffO+LBzAu0R980y8NtSb8AGVxW1K6Nii5SKgzXqp
	D4wlV6E0Y3vRsVIGQmaE9VDzvj8NxFJqeDvjwrQJr88EnPeIRqz/5sgIA9HtGAbfz5T9i3
	rR9O+tS5cdGYRSWhiKb3MtLf0vRp9xK6hOfImDmIBDiviWgBYHmpJ/Z+Scs94CCO3s7sjz
	DOI2UUaZoAcru0Jcx+rVY28NPHjS9uRXPTDlJYIih00GwzdDfNWP7dmSoVYx4bacBlzusK
	HBZkuG3tWujNwgrEEOuuwJkNGR8II1x6qCwBjpql5fW7o+t6OfekUWkYK/8VUQ==
Message-ID: <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
Date: Fri, 13 Dec 2024 23:15:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: trigger: netdev: Check offload ability on interface
 up
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
 Lukasz Majewski <lukma@denx.de>, Pavel Machek <pavel@ucw.cz>,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/3/24 2:06 PM, Andrew Lunn wrote:
> On Tue, Oct 01, 2024 at 04:45:23AM +0200, Marek Vasut wrote:
>> The trigger_data->hw_control indicates whether the LED is controlled by HW
>> offload, i.e. the PHY. The trigger_data->hw_control = can_hw_control() is
>> currently called only from netdev_led_attr_store(), i.e. when writing any
>> sysfs attribute of the netdev trigger instance associated with a PHY LED.
>>
>> The can_hw_control() calls validate_net_dev() which internally calls
>> led_cdev->hw_control_get_device(), which is phy_led_hw_control_get_device()
>> for PHY LEDs. The phy_led_hw_control_get_device() returns NULL if the PHY
>> is not attached.
>>
>> At least in case of DWMAC (STM32MP, iMX8M, ...), the PHY device is attached
>> only when the interface is brought up and is detached again when the
>> interface is brought down. In case e.g. udev rules configure the netdev
>> LED trigger sysfs attributes before the interface is brought up, then when
>> the interface is brought up, the LEDs are not blinking.
>>
>> This is because trigger_data->hw_control = can_hw_control() was called
>> when udev wrote the sysfs attribute files, before the interface was up,
>> so can_hw_control() resp. validate_net_dev() returned false, and the
>> trigger_data->hw_control = can_hw_control() was never called again to
>> update the trigger_data->hw_control content and let the offload take
>> over the LED blinking.
>>
>> Call data->hw_control = can_hw_control() from netdev_trig_notify() to
>> update the offload capability of the LED when the UP notification arrives.
>> This makes the LEDs blink after the interface is brought up.
>>
>> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
>> in place, boot the machine with cable plugged in, and the LEDs won't work
>> without this patch once the interface is brought up, even if they should:
>> "
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
>> "
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Is there anything blocking this patch from being picked up ?

