Return-Path: <linux-leds+bounces-5535-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB882B871F8
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 23:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6777A18944C2
	for <lists+linux-leds@lfdr.de>; Thu, 18 Sep 2025 21:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A64E2F4A1F;
	Thu, 18 Sep 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uGTCfmJy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBED2D23BD;
	Thu, 18 Sep 2025 21:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230783; cv=none; b=RgOk7BnD8vBMGZNCcpURNRSM9fy88AWRbHljjVx/Qr+hS92LEeTC3YU12QIcPPW1aZEnOThwM6KPzGvE0XELFyR9eiVL+pUB3FYoFZFpwXhMTAnMMY3g6C7IuEtPYABDJJXZx6IPBhBCJlNmgJplh4sj99dg9zJtPkjNVSJzRiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230783; c=relaxed/simple;
	bh=l3kxpaPVpWBKn9UY4SLY3demdcLKz3JAdgzZ5dzS5fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+y6ajVEopqOiv8OEHa0+s5L96s7x8ARoyVMWAL97qhNq4QUGH5LEoJSYlstWzfjH0vSsPqxf8TuIff1ihKkw955irMWZrVIbv9GfixCmRUeb8MiC3p15EOWsM5jhyfKfhOZrZTwq2kJ+E7jcOBsrafcFWSz8ZyiXShSzDxmstA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uGTCfmJy; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1758230737; x=1758835537; i=w_armin@gmx.de;
	bh=IeXpzKMhgcek3n66+AbraQ6rA9NQSE7BLSJM0jBKC+o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uGTCfmJyUzrvK0TaX8o4/e/oRvk2OMQ1K+lJdnhkGLPxEPTDMnbS5bQgeMw5CI3d
	 gY23Gi4uSuYHSJxYDruajwItE4fc66HxVX1tPof7G8GloTZQbNLotupMC9U/8B/d2
	 8Tl6RVAGM2MB4nAERfwV6vtvxB8hMre9szsQ0xGPQn4vFkT6t4Ra318bst1CG7XgY
	 kfaYq3c50tQY1SvxQE6xdRvP41YV6FnwOANnEMxwgrO57bXUTaZS7xvDMQwU5ldfT
	 vTxzc6sM4YcSTOqQx5LI83OiD2R3C7BRHDFtDXo6eY5XshxdEFpmDwdZCD4HZQk0j
	 92e46YvM5NjelmKLpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1uIkNJ3HzB-013zhy; Thu, 18
 Sep 2025 23:25:37 +0200
Message-ID: <2e38c9e1-ef5d-4344-ab12-4f4305040422@gmx.de>
Date: Thu, 18 Sep 2025 23:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
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
 <cb7d0111-927f-40fe-b0f7-73e3a5136746@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <cb7d0111-927f-40fe-b0f7-73e3a5136746@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:me0vi8jfWNuiONOR7lSnbCL4K9yzXt8jI0UKOWkEzfSlWxQ4M52
 xa+kJNzrFxHCHUFwfY7ZSekwavsybw654Muu84cYWqp8+KWTN4I/tGUSQKB1CspBCV0RCoa
 G20WPEg2gBU//Ul+RZS88D+ojjFiIn8W4VnDR/OJp0JKnOgZxJjDWBUF08XxbCvJJ7YIiu0
 +M9fZEN6Qz9RTE1pQPRiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WDWOKBz03Vw=;XhQkysFxxQqgKoD/CYfJymqVsNO
 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

Am 09.09.25 um 21:13 schrieb Werner Sembach:

>
> Am 09.09.25 um 11:18 schrieb Werner Sembach:
>> Hi,
>>
>> Am 08.09.25 um 18:29 schrieb Armin Wolf:
>>>>> +static ssize_t fn_lock_show(struct device *dev, struct=20
>>>>> device_attribute *attr, char *buf)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_BIOS_O=
EM, &value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disabl=
e(value &=20
>>>>> FN_LOCK_STATUS));
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(fn_lock);
>>>>
>>>> The fn_lock register value does not automatically get updated by=20
>>>> pressing the fn+esc key (unlicke the super_key_lock), so the driver=
=20
>>>> needs to do that manually.
>>>>
>>>> Another posibility is: uniwill sometimes have a "config" and an=20
>>>> "immediate" value for a setting, waybe we have the config value=20
>>>> here (and have the immediate value for the super_key_lock)
>>>>
>>>> Also I realized: The value here is preserved on hot, but not on=20
>>>> cold reboots, maybe this should be initialized by the driver for=20
>>>> consistency?
>>>>
>>> fn_lock should not change when the users presses Fn + ESC, instead=20
>>> this setting controls whether the EC will enter Fn lock mode when=20
>>> the user presses
>>> this key combination.
>>
>> At least on my device Fn + ESC does toggle the Fn lock regardless of=20
>> this setting. How I love these Uniwill inconsistencies ...
>>
>> I talked with Christoffer and he said that the "Intel Project" line=20
>> from Uniwill does behave differently at multiple locations
>>
>> If the devices really behave differently we have the first mutually=20
>> exclusive feature here: FN Lock Enable vs FN Lock Toggle
>
> Thinking about how to name this to make it consistent and clear by=20
> name only what is happening, my idea would be:
>
> - fn_lock_toggle_enable (for the behavior on your device)
>
> - fn_lock_enable (for the behavior on my devices)
>
> - super_key_toggle_enable (for the behavior on your device)
>
> - super_key_enable (for the behavior on my devices)
>
> - touchpad_toggle_enable (for the behavior on your device)
>
> There is no=C2=A0touchpad_enable=C2=A0as this is handled by userspace.
>
OK, i will rename the sysfs attributes accordingly. However i suggest that=
 support for the other sysfs attributes
be added in a separate patch series, as i want to get this one merged as s=
oon as possible.

Could you test the next revision of this patch series on your device as  t=
he=C2=A0 other testers sometimes take a lot of time to respond?

>>
>>> Additionally, some models seem to allow users to change those=20
>>> settings inside the BIOS itself, so i am against overwriting the
>>> boot configuration when loading the driver.
>> That's probably what's sets the value on cold boot.
>>>>> +static ssize_t super_key_lock_show(struct device *dev, struct=20
>>>>> device_attribute *attr, char *buf)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH=
_STATUS, &value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disabl=
e(!(value &=20
>>>>> SUPER_KEY_LOCK_STATUS)));
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(super_key_lock);
>>>>
>>>> I did not know what "super_key_lock" was supposed to mean at first,=
=20
>>>> a more fitting name would be super_key_enable imho.
>>>>
>>>> Cold vs hot reboot volatility not tested, but wouldn't hurt to=20
>>>> initialize imho as i don't trust uniwill to be consistent in this=20
>>>> point across multiple device generations.
>>>>
>>> This sysfs attribute controls whether or not the super key can be=20
>>> locked using a key combination i forgot about. Initializing those=20
>>> settings
>>> is something best done by userspace, i suggest to use a udev rule=20
>>> for that.
>>
>> No again, at least on the devices i have here: the key combination is=
=20
>> fn+f9, but not present on all devides (the fn functions get shifted=20
>> quite around on different uniwill devices anyway)
>>
>> The combination still works when this is set to disable and just sets=
=20
>> it to enable.
>>
>>>
>>>>> +
>>>>> +static ssize_t touchpad_toggle_store(struct device *dev, struct=20
>>>>> device_attribute *attr,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, si=
ze_t count)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(uniwill_enable_disabl=
e_strings, buf);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D 0;
>>>>> +=C2=A0=C2=A0=C2=A0 else
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D TOUCHPAD_TOGGL=
E_OFF;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR=
_OEM_4,=20
>>>>> TOUCHPAD_TOGGLE_OFF, value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return count;
>>>>> +}
>>>>> +
>>>>> +static ssize_t touchpad_toggle_show(struct device *dev, struct=20
>>>>> device_attribute *attr, char *buf)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(de=
v);
>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4,=
 &value);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n", str_enable_disabl=
e(!(value &=20
>>>>> TOUCHPAD_TOGGLE_OFF)));
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(touchpad_toggle);
>>>> What exactly does this do? Seems like a noop on my testing devices.=
=20
>>>> Also is touchpad disable not already handled by userspace?
>>>
>>> This settings controls whether or not the user can disable the=20
>>> internal touchpad using a specific key combination.
>>
>> Ok, this function seems to be not present on non Intel project=20
>> devices from Uniwill. Here the touchpad toggle just sends a key=20
>> combination (Super + Control + KEY_ZENKAKUHANKAKU or F24 depending on=
=20
>> kernel version) and lets userspace handle the rest.
>>
>> Never mind then.
>>
>>>>> +static const struct hwmon_ops uniwill_ops =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 .visible =3D 0444,
>>>>> +=C2=A0=C2=A0=C2=A0 .read =3D uniwill_read,
>>>>> +=C2=A0=C2=A0=C2=A0 .read_string =3D uniwill_read_string,
>>>>> +};
>>>>
>>>> .visible should hide gpu temp sensor on devices that don't have a=20
>>>> dgpu and therefore not gpu temp sensor (the value is stuck at 0 on=20
>>>> these devices)
>>>>
>>>> also the number of fan might also not always be exactly 2
>>>>
>>> I see, i will introduce separate feature flags for each sensor.
>> thanks
>>>>> +static int __init uniwill_init(void)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 const struct dmi_system_id *id;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 id =3D dmi_first_match(uniwill_dmi_table);
>>>>> +=C2=A0=C2=A0=C2=A0 if (!id) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!force)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return -ENODEV;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that the devic=
e supports all features */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported_features =3D U=
INT_MAX;
>>>>
>>>> in the future there might be mutually exclusive feature (for=20
>>>> example when Uniwil repurposes EC registers)
>>>>
>>>> my suggestion would be to have a "force_supported_features" in=20
>>>> addition that overwrites the supported_features list (also for=20
>>>> devices that are in the list)
>>>>
>>>> so something like:
>>>>
>>>> if (!id && !force)
>>>>
>>>> =C2=A0 =C2=A0 return -ENODEV
>>>>
>>>> if (force)
>>>>
>>>> =C2=A0 =C2=A0 supported_features =3D force_supported_features
>>>>
>>>> else
>>>>
>>>> =C2=A0 =C2=A0 supported_features =3D (uintptr_t)id->driver_data;
>>>>
>>> Interesting idea, but i would prefer to keep the individual feature=20
>>> bit definitions private. Because of this i suggest we
>>> look into this idea once we actually encounter such a situation=20
>>> where we have conflicting feature bits.
>>
>> Then maybe just have all the features as separate module parameters?
>>
>> On this note: Maybe also do the FN Key handling based on a feature=20
>> bit? Not that i see a particular reason why you wouldn't want to have=
=20
>> it, but for consistency and debugging reasons (and also if sometimes=20
>> ins the future an incompatibility arises here because Uniwill=20
>> repurposed a wmi event or something).
>>
>> Just thinking out loud.
>>
I suggest that we implement the handling around those additional feature b=
its inside a separate patch series.

Thanks,
Armin Wolf

>>>
>>> Thanks,
>>> Armin Wolf
>>
>> Best regards,
>>
>> Werner
>>

