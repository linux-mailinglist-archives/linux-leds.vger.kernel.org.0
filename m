Return-Path: <linux-leds+bounces-5461-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA9B505F2
	for <lists+linux-leds@lfdr.de>; Tue,  9 Sep 2025 21:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D70E7A2BC4
	for <lists+linux-leds@lfdr.de>; Tue,  9 Sep 2025 19:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18752303A10;
	Tue,  9 Sep 2025 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bvk7wa4o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983A3019D0;
	Tue,  9 Sep 2025 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757445243; cv=none; b=ELE7+z/RLpZdVXNSpynXKKUOg3MShqTZWLk59fq71xQDXFuTtIecDlqNr71+Fd1UplNRpggPpgGDRktJ6Zc3ol0nfBuPLIQ2lTUIgVFXc8CxDiTqqusr9l3Yhl7XbMGe1RgN7EOJWtscnZkoIHJHoyfa3kPhgSKOQmhguhxzdvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757445243; c=relaxed/simple;
	bh=cLT7Fh+31UoPpula9NRXuzPBF3PSz27rAIBxf3ZAKcI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OSOo7CkPHmXtyYYxCKD45SJpeD1lyLsPunjKHaRQeT3c0ZNgbb1xTt6cNnOCjnP67qcbw4zyTG4zU9asBtg8o4fa3HBrefpU6xZ3xlRTZkiRvlmIbMbMOiLQehZeQXVFW/gc2nsBxKkjSKxsGUY3seSE1l4AcNAOGrJq2lP+YBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bvk7wa4o; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de4594b.dip0.t-ipconnect.de [93.228.89.75])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7B4B62FC0052;
	Tue,  9 Sep 2025 21:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1757445236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JRIvqcv/zz6QLi+ryFNU95kpIHeA6gbiLcJYEwwq48=;
	b=bvk7wa4oDkpkwJeWqWST7GE3pppWgn11zD+l59iYhpZAl9n+UCA1T30tIoIPSVlM5QJKru
	yYME0RUAyC/gtV9hC1Esh9BhSVc2XPA8sptdFqpWcTMFQZRZ7O8uOanloeez/gr53a/Wtk
	pl/f04QMVE4x/SAqOASeV3WtTpS+2pw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <cb7d0111-927f-40fe-b0f7-73e3a5136746@tuxedocomputers.com>
Date: Tue, 9 Sep 2025 21:13:55 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add Uniwill laptop driver
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
 alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org, lee@kernel.org,
 pobrn@protonmail.com
References: <20250831192708.9654-1-W_Armin@gmx.de>
 <20250831192708.9654-2-W_Armin@gmx.de>
 <cf5b6334-7558-4115-92e4-28b4b531490a@tuxedocomputers.com>
 <8400b8c2-5ee6-47db-889a-e3224010357d@gmx.de>
 <8cffb232-052a-4eff-84ea-af6254b837f9@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <8cffb232-052a-4eff-84ea-af6254b837f9@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 09.09.25 um 11:18 schrieb Werner Sembach:
> Hi,
>
> Am 08.09.25 um 18:29 schrieb Armin Wolf:
>>>> +static ssize_t fn_lock_show(struct device *dev, struct device_attribute 
>>>> *attr, char *buf)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return sysfs_emit(buf, "%s\n", str_enable_disable(value & 
>>>> FN_LOCK_STATUS));
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(fn_lock);
>>>
>>> The fn_lock register value does not automatically get updated by pressing 
>>> the fn+esc key (unlicke the super_key_lock), so the driver needs to do that 
>>> manually.
>>>
>>> Another posibility is: uniwill sometimes have a "config" and an "immediate" 
>>> value for a setting, waybe we have the config value here (and have the 
>>> immediate value for the super_key_lock)
>>>
>>> Also I realized: The value here is preserved on hot, but not on cold 
>>> reboots, maybe this should be initialized by the driver for consistency?
>>>
>> fn_lock should not change when the users presses Fn + ESC, instead this 
>> setting controls whether the EC will enter Fn lock mode when the user presses
>> this key combination.
>
> At least on my device Fn + ESC does toggle the Fn lock regardless of this 
> setting. How I love these Uniwill inconsistencies ...
>
> I talked with Christoffer and he said that the "Intel Project" line from 
> Uniwill does behave differently at multiple locations
>
> If the devices really behave differently we have the first mutually exclusive 
> feature here: FN Lock Enable vs FN Lock Toggle

Thinking about how to name this to make it consistent and clear by name only 
what is happening, my idea would be:

- fn_lock_toggle_enable (for the behavior on your device)

- fn_lock_enable (for the behavior on my devices)

- super_key_toggle_enable (for the behavior on your device)

- super_key_enable (for the behavior on my devices)

- touchpad_toggle_enable (for the behavior on your device)

There is no touchpad_enable as this is handled by userspace.

>
>> Additionally, some models seem to allow users to change those settings inside 
>> the BIOS itself, so i am against overwriting the
>> boot configuration when loading the driver.
> That's probably what's sets the value on cold boot.
>>>> +static ssize_t super_key_lock_show(struct device *dev, struct 
>>>> device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & 
>>>> SUPER_KEY_LOCK_STATUS)));
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(super_key_lock);
>>>
>>> I did not know what "super_key_lock" was supposed to mean at first, a more 
>>> fitting name would be super_key_enable imho.
>>>
>>> Cold vs hot reboot volatility not tested, but wouldn't hurt to initialize 
>>> imho as i don't trust uniwill to be consistent in this point across multiple 
>>> device generations.
>>>
>> This sysfs attribute controls whether or not the super key can be locked 
>> using a key combination i forgot about. Initializing those settings
>> is something best done by userspace, i suggest to use a udev rule for that.
>
> No again, at least on the devices i have here: the key combination is fn+f9, 
> but not present on all devides (the fn functions get shifted quite around on 
> different uniwill devices anyway)
>
> The combination still works when this is set to disable and just sets it to 
> enable.
>
>>
>>>> +
>>>> +static ssize_t touchpad_toggle_store(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                     const char *buf, size_t count)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = sysfs_match_string(uniwill_enable_disable_strings, buf);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    if (ret)
>>>> +        value = 0;
>>>> +    else
>>>> +        value = TOUCHPAD_TOGGLE_OFF;
>>>> +
>>>> +    ret = regmap_update_bits(data->regmap, EC_ADDR_OEM_4, 
>>>> TOUCHPAD_TOGGLE_OFF, value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +static ssize_t touchpad_toggle_show(struct device *dev, struct 
>>>> device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct uniwill_data *data = dev_get_drvdata(dev);
>>>> +    unsigned int value;
>>>> +    int ret;
>>>> +
>>>> +    ret = regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
>>>> +    if (ret < 0)
>>>> +        return ret;
>>>> +
>>>> +    return sysfs_emit(buf, "%s\n", str_enable_disable(!(value & 
>>>> TOUCHPAD_TOGGLE_OFF)));
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(touchpad_toggle);
>>> What exactly does this do? Seems like a noop on my testing devices. Also is 
>>> touchpad disable not already handled by userspace?
>>
>> This settings controls whether or not the user can disable the internal 
>> touchpad using a specific key combination.
>
> Ok, this function seems to be not present on non Intel project devices from 
> Uniwill. Here the touchpad toggle just sends a key combination (Super + 
> Control + KEY_ZENKAKUHANKAKU or F24 depending on kernel version) and lets 
> userspace handle the rest.
>
> Never mind then.
>
>>>> +static const struct hwmon_ops uniwill_ops = {
>>>> +    .visible = 0444,
>>>> +    .read = uniwill_read,
>>>> +    .read_string = uniwill_read_string,
>>>> +};
>>>
>>> .visible should hide gpu temp sensor on devices that don't have a dgpu and 
>>> therefore not gpu temp sensor (the value is stuck at 0 on these devices)
>>>
>>> also the number of fan might also not always be exactly 2
>>>
>> I see, i will introduce separate feature flags for each sensor.
> thanks
>>>> +static int __init uniwill_init(void)
>>>> +{
>>>> +    const struct dmi_system_id *id;
>>>> +    int ret;
>>>> +
>>>> +    id = dmi_first_match(uniwill_dmi_table);
>>>> +    if (!id) {
>>>> +        if (!force)
>>>> +            return -ENODEV;
>>>> +
>>>> +        /* Assume that the device supports all features */
>>>> +        supported_features = UINT_MAX;
>>>
>>> in the future there might be mutually exclusive feature (for example when 
>>> Uniwil repurposes EC registers)
>>>
>>> my suggestion would be to have a "force_supported_features" in addition that 
>>> overwrites the supported_features list (also for devices that are in the list)
>>>
>>> so something like:
>>>
>>> if (!id && !force)
>>>
>>>     return -ENODEV
>>>
>>> if (force)
>>>
>>>     supported_features = force_supported_features
>>>
>>> else
>>>
>>>     supported_features = (uintptr_t)id->driver_data;
>>>
>> Interesting idea, but i would prefer to keep the individual feature bit 
>> definitions private. Because of this i suggest we
>> look into this idea once we actually encounter such a situation where we have 
>> conflicting feature bits.
>
> Then maybe just have all the features as separate module parameters?
>
> On this note: Maybe also do the FN Key handling based on a feature bit? Not 
> that i see a particular reason why you wouldn't want to have it, but for 
> consistency and debugging reasons (and also if sometimes ins the future an 
> incompatibility arises here because Uniwill repurposed a wmi event or something).
>
> Just thinking out loud.
>
>>
>> Thanks,
>> Armin Wolf
>
> Best regards,
>
> Werner
>

