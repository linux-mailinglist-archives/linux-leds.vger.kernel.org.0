Return-Path: <linux-leds+bounces-3440-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C437A9D8B64
	for <lists+linux-leds@lfdr.de>; Mon, 25 Nov 2024 18:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE73B298C6
	for <lists+linux-leds@lfdr.de>; Mon, 25 Nov 2024 17:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D5D1B4152;
	Mon, 25 Nov 2024 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nbmMj7Zs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A05192D6C;
	Mon, 25 Nov 2024 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555260; cv=none; b=r278nxQddlatLAkb3ClyixfcUJlmIRQMvBKbIPJ2QpxcprZO0sdJMKoY0NdTGV3b9JucBQWLSqOnia4P3YsnCuuQ/WmQipR+WP3YEJeGJGotltE38WyeC3pppvVrTjC7q74ghVnynMpUYgKgBf22mLKMdBe3zWMvKQYTItnHZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555260; c=relaxed/simple;
	bh=WHzghXeHADUeiy5JloG47SfpO/VnnN6vY8DaO8TdF8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5qLa6t5hdi9sGiRGphLeZJ9RpQE+lNOgdNdM/TWhuXmc+CbO3PbNKFMzXSX+wB1kKkB0Yr0nHc10b4STMFbjfIJ6sZYLdL6wFLLCJji4elrFoDmrvOL0A5iOq4fLfkbluyjSNUr6fdO1VAoIdddqErhQvAqhwumrkl8ks5k4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nbmMj7Zs; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732555231; x=1733160031; i=w_armin@gmx.de;
	bh=WHzghXeHADUeiy5JloG47SfpO/VnnN6vY8DaO8TdF8k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nbmMj7Zs3nihgPYFTKBoBObMRXSeeKalFFYA0M0+Cz/Gm4jnXkaYGqesYQOm/9SP
	 gZHvG27PGT9iGZEamhG3hZUiF7nkXcdxfKRPj79yt9Yf6TvJH0q6GCwhDnMNeT+9P
	 ODjGgpQOOg705Z1a7/MbhiUmdve44/LAyXxFq4jnFeNCFjsg/w0aC5hGrhEaKfBkL
	 B/Zso+BVgqxQZC4r1Jf+lJ7BUp7aXmC3iC1ypwimTvma2oMMcSK9YN017o7Fvf8e4
	 UxseOozc121jKWFxoMVpSEjvjeh9DFfc8NA2dxtBth1/3SW2iDaPwYYkuJ2hGhPw7
	 0XNgOkiq+OmlL8fdtQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.119.183] ([176.6.135.59]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiacR-1tsnST2z2t-00ojDM; Mon, 25
 Nov 2024 18:20:30 +0100
Message-ID: <b531a5a7-d96a-4840-9831-d01a2b77c000@gmx.de>
Date: Mon, 25 Nov 2024 18:20:28 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, lee@kernel.org, linux-leds@vger.kernel.org
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
 <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
 <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com>
 <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de>
 <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jmlrr+GGPcc9ISIvohsaOCF0m11ZighJGNXu4bfggEMVsl3MAZ2
 EKwf4RxmWVL+YO1mPmMKxlAbDl7lh2g1a6WWBHlcXg5xY1zs/w3/0HiMaO/AzL+CuWvDFW2
 Nn2W5c69yzzVvTN2iGaWXHPLE+X9OIxcnnXIq5cN8bMZ6C3Q42L3w23nWO6rCObNFgC+B/A
 NHYXlnyoI/ykPahlOaTNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JvGZaCzb40M=;e/95gJEUpGx5FWwNW2CUJGFrUsE
 tMYjqg/hpI7emAnhpDFsWzVFZbwPNbdbKA+RBHGbJCCQkFcu2PxCneju+GmCGWC5uMxgsvwYZ
 fKknIIryJ5UC6ip3rcyP6Fit+QuoTBmUsUGR0MuDn7UcRlUsiWi4bsyAlhd7inYWSCdDGXPNw
 F6b3+CIYm2kI5jGhLXYQLoUE31aTb9A4p/vFz3ZTmvz/h5xcqgn3txDhXxD1y5Ij6Qt732QvC
 HWctyzY6GclDV/I2Add4mAJxWsnqo+mLBTNMEDwQQmXyozoLOv+cn85MlFr86F7z2jRhyu4SO
 ISxBVhGHu/EDeN8X0sNPevxm/bTAcS+ri7E73D7vbyKliMJhdtseqoA0OS2uWjOLh6mh5lylp
 aWzB9QkonqisLb9K0UMGGOZJ6CEa3F0vQDzfZsbmJDdFjfJ8amvASfE8uJ837lBHpxojPrXQY
 GFEGruY7p1VnIhRqVhNuQA7V2iSp338bp440vTDtC6kSg12zEKH+oKELIrNIKfkDGHD909Zg1
 FMz+EVMQCU3gdNSUZgdIwY9RD+3lMGMPwdJjgm9m9PqphydsSk828wGqDSJ+y7PAfxIhFIUnQ
 S3B3RICZUNfEZ0o5AfwXgzYzPX08/PQRJoyEsZiV2djYbHGohD7mQ0xQCB8fMwPhSU6Wtf47S
 BpteihLcoEVn9gTfgPBqdp6qxohZUx1n6l1Q3uWBWtJ+Vxx9825p8eMLuxsKEXuSvsMWZTfBw
 0Yucu+Lk6lvvXfrBupBJXxRYv1yodbRf+aTaxg7vVTWguxxofr+hYc9eNSYOPUTVYGeQgbqpU
 REjEAfsuokkCozhdK2s4YwI0zPVsKrjQ/fr/gU47NuAxyUo8piwvJt128Ox4g+ggDLnVMp9f5
 SnUe7PbxHujD+0kVxEq7jX2lKf82/11ZIPqqURoa2VQCKEfPsiNF+Ccqq6lwbxukPd0vPuAkz
 u4mdU3JuxWarsKj4phKjrQX+H2cfbCq9gQABziHRItc5NriNu+ew5lFO3vgWmXRvoQMqhuGJ3
 fDt7WF66YcNC9xWk/xO7FObNF8ZDqTAZ/wxXvYKE1nxSwUqXs7zH3mL5c8chb8jb7jUrVHiKN
 PlqU3Cdd3wMnasNJ65npvjeYihBr7S

Am 25.11.24 um 15:16 schrieb Joshua Grisham:

> Den l=C3=B6r 23 nov. 2024 kl 23:19 skrev Armin Wolf <W_Armin@gmx.de>:
>>> 1) Yes or no to create new platform_device even though one already
>>> exists with the ACPI device ID as it's name?
>> I advise against this, because if the driver somehow binds to multiple =
devices in the future
>> then creating a second platform device will fail (same name). So No.
>> [...]
>>> 2) If using existing platform_device, should these kind of sysfs
>>> attributes be under the dynamic device ID-based platform_device or is
>>> it ok / make sense to move them to driver attributes?
>> Driver attributes get created then the driver is registered, so this co=
uld lead to
>> various lifetime problems, so please use device attributes.
>>
>> I suggest that you update the documentation of the driver to tell peopl=
e that:
>>
>> 1. They should use udev for device discovery
>>
>> and/or
>>
>> 2. They can find the attributes under /sys/bus/platform/drivers/<driver=
 name>/<device name>/<attribute>
> Thanks again Armin, this is very good advice! I have made these
> adjustments now in a local copy but then stumbled onto something else:
> what about the hwmon and kbd_backlight LED class device names? Right
> now I have also hard-coded these with "samsung-galaxybook" but in
> theory if multiple different instances of one of the ACPI device IDs
> existed (as you mentioned could be a "possible" scenario in the
> future?) then I guess these would break as well?

The hwmon subsystem can handle duplicate chip names, so naming the hwmon c=
hip
"samsung-galaxybook" should be OK.

For the LED class device: you can use led_init_data to set default_label a=
nd
devicename (just copy the platform device name for devicename). By setting
devname_mandatory to true the resulting led class device should have a uni=
que
name.

> Having said that, it would be REALLY strange if any of these Samsung
> notebooks had multiple instances of one or more of these ACPI devices;
> it would be like saying there are two completely separate "platform"
> devices on the same notebook, where both can control their own
> keyboard backlight, performance mode, etc.. I can't imagine this
> should ever actually be the case? Also in this case my driver will
> actually only try to create the LED class device if the ACPI method to
> enable and get/set its value within the device itself is returning the
> right success codes, so it seems even less likely that there would be
> two instances of the ACPI device IDs on the same notebook and that
> both are responding positively to the ACPI method to enable/get/set
> the kbd backlight brightness? The hwmon device, on the other hand,
> will always be created if it finds any PNP fan devices that need
> special handling (e.g. they will not be reporting their values by
> default as acpi4 fans so will be set up by the driver instead).

You are right that it is unlikely for multiple compatible ACPI devices to
exist, but being able to gracefully handle this case would still be nice.

> I tried to look in the kernel for existing platform drivers (and
> glanced through several non-platform drivers as well) to find any that
> might be following this pattern of dynamic LED class device name or
> hwmon device name and could not really find anything except the Intel
> int3472 which is using the ACPI device ID as the LED class device
> name; otherwise, everything else I could find under platform is using
> hard-coded names, including drivers that seem to follow this pattern
> we are talking about here (using existing platform devices based on
> ACPI device ID name instead of creating new ones, e.g. ideapad-laptop
> has hard-coded LED class device names with its
> "platform::kbd_backlight" and "platform::fnlock" even though the
> actual platform device is just matched from the ACPI device ID VPC2004
> ??).

Sadly not all drivers try to handle such a situation.

> For specifically kbd_backlight and hwmon devices, I think it is more
> likely that people will be making various scripts / config / etc that
> do things like show the fan speeds in various widgets and/or control
> the keyboard backlight via script, so it seems to me like it is even
> better if these can be fixed names that anyone who uses these devices
> will be able to use (e.g. "samsung-galaxybook::kbd_backlight" feels
> better than something non-fixed based on ACPI device ID like
> "SAM0429_00::kbd_backlight").
>
> This feels a bit like sub-optimizing here, especially since pretty
> much all of the other drivers I can see are hard-coding these kind of
> names already as well.. is it ok to just leave hwmon and LED class
> device names as hard-coded with prefix "samsung-galaxybook" and
> if/when it comes along that someone has a problem with multiple
> instances, it will fail with an error message in the kernel log and
> they can submit a bug? (where we figure out what the right course of
> action is exactly for that case)

I am CCing the LED maintainers so they can give us some advise on how to h=
andle
this the best way.

Thanks,
Armin Wolf

> Thanks again!
> Joshua
>
>> [...]

