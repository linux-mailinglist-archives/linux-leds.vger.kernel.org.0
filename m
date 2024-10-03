Return-Path: <linux-leds+bounces-2941-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D283598E7EA
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 02:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104B51C20815
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2024 00:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710374C8F;
	Thu,  3 Oct 2024 00:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Cb6D0MH5"
X-Original-To: linux-leds@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62668D528;
	Thu,  3 Oct 2024 00:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727916474; cv=none; b=m+s11f4e+kGAift6hmqHX3rgUrTfDjm8IIYFCCr9664xwYIbJ/I2yeseoNiVRpZa+iJA6SDJQt7HCAm2qGokuHngffN2isx0D2xrfT6vXluuj0orPWtkD4cjjf7FUe2pmS8TAh19Uo1PQFEgsvqxyr+gtHE0vU4ehuJAoyQFwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727916474; c=relaxed/simple;
	bh=NUq2mrCaLF1rdvXmkXui5EFCnbg/FxEgMAtxIQIwzfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAw2NhF5Vlk88GxL3bD9lSThtx4IFWnZ51Z4HJf0At3sQAwP9VRTxj0mmegLsn5psf8+eADvR8aIHGJvmCV52qAzN0Sac96m/CVrGA2AVYmndWZX7KXYoOlT83i8W6IJf94yJGNHIXn6JLCkb06FFG5+yhi6HCtWLZwX0wDCKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Cb6D0MH5; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 88D83889C3;
	Thu,  3 Oct 2024 02:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727916469;
	bh=kIblb8tGR6fk/1wR5vCritv1LtoFcFNCSySBUU+XPx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cb6D0MH5j8MPVSNecFq5+UjcoqBXGD0bI70hb15EmHgLR8mhYuOy+jrqBhSI2d4eh
	 KezSv347rGjv3JmESwhsV5DRNNomAohAefOPsQRrsp/oQ1vKEF2gDUIAUDxMD4XgNa
	 /yzyEK+pZXf6sWgxH40GsBu4RRiOXPViHr8Hk+FY0M655pdJ3YW2ZjBFZieEg6gJca
	 Z9hhANyO7UMJHQaN3NuXubrtGYVUpbZUTBQtZHU56RmyAmAKn/Bphm3mU4hafIHoTU
	 HOI7sQMdRFVMjGdgU6/JGhgE/SjhYXovEzIIzQQpk+iGEyrLpbasRU5GqGWS1F/K/J
	 V8pvm9wuq5dww==
Message-ID: <d0411d89-5c83-47b4-bef9-904b63cbc2c0@denx.de>
Date: Thu, 3 Oct 2024 02:47:48 +0200
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
 <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1d72f370-3409-4b0f-b971-8f194cf1644b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/3/24 1:21 AM, Andrew Lunn wrote:
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
> 
> Have you run this code with lockdep enabled? There have been some
> deadlocks, or potential deadlocks in this area.

Now I did on next 20241002 , no lockdep splat reported .

>> On STM32MP13xx with RTL8211F, it is enough to have the following udev rule
>> in place, boot the machine with cable plugged in, and the LEDs won't work
>> without this patch once the interface is brought up, even if they should:
>> "
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:green:wan", ATTR{trigger}="netdev", ATTR{link_10}="1", ATTR{link_100}="1", ATTR{link_1000}="1", ATTR{device_name}="end0"
>> ACTION=="add", SUBSYSTEM=="leds", KERNEL=="stmmac-0:01:yellow:wan", ATTR{trigger}="netdev", ATTR{rx}="1", ATTR{tx}="1", ATTR{device_name}="end0"
>> "
> 
> Nice use of udev. I had not thought about using it for this.
Is there some other way to configure the netdev-triggered PHY LEDs ?
I still feel the udev rule is somewhat brittle and fragile, and also not 
available early enough for default PHY LED configuration, i.e. the LEDs 
are not blinking when I use e.g. ip=/nfsroot= when booting from NFS root 
until the userspace started, which is not nice. The only alternative I 
can imagine is default configuration in DT, which was already rejected a 
few years ago.

