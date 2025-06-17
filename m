Return-Path: <linux-leds+bounces-4842-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF3ADDE42
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 23:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE5E116A5AC
	for <lists+linux-leds@lfdr.de>; Tue, 17 Jun 2025 21:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1A028ECE5;
	Tue, 17 Jun 2025 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LybIrmmE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F44261584;
	Tue, 17 Jun 2025 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197165; cv=none; b=lDY67IYqZwnbiUss/80NV98/7EtXYW8JGBWjiTyxRshC/0abVpVs2MMbmr8ME2XUQ54LV4OTiDNqDlhe30tb+W/Ep1K4hrKWWvI9blRpvBi9/8RiL4N6B2o5Ahlj0DkA8k27cc4umVuDCQuh63ie0D588xcODfMsuqPJ49MSkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197165; c=relaxed/simple;
	bh=+yF5th3hKHr3Fc/YnZeaTAX61q87mTP3B6ZUns7YCy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oOOs/TkyaaRd2176y4PmDgGz86FOnPytVljYsdq4yr2WNzVMIR1jN9PYDZtNlnrZeM04Lp3QrCToHl9b/9ovO1cIZUv7m22v5Wn3uR1jIDiXzEKM53PDcguhZdUQtzqlMLq1JuYqcOKcpG3za3mNj0mTp3PclqQzHcc75xqGSgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LybIrmmE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750197153; x=1750801953; i=w_armin@gmx.de;
	bh=+yF5th3hKHr3Fc/YnZeaTAX61q87mTP3B6ZUns7YCy4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LybIrmmEmoRxy8FR7f5OFdJqEZrwUBBdfRDHOxu/f5EEfOozwh5HUWp19g47VRks
	 0PAlJ+p+ne/FT8pZE2s/wI9gQVkwb7cqO9FLoiLjRTO1+bNo+9rNCw+uoV6Gw0FID
	 jxeEcjCUqloYb/tMsabSLltBk5ypV4HVgRpI1zhZE1Ag4wQB1zxSeg+0HYyb5jvaX
	 W6TQVInqHbqNq5cMVbrMjBw6tAH9KeV1huSbDxp1PL+c1J+cG+6lEdEDAj1zQIhiN
	 d2nBigrh7gZDg7mDpqwRlU/QSL626BzAuku61PdJAphoANx7PmU/ydt9GOkeHEdhD
	 dPMBnP3+Jsv3sjB3rQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1uuqFw0P6L-011PTK; Tue, 17
 Jun 2025 23:52:33 +0200
Message-ID: <d645ba09-1820-4473-96bb-8550ed0b0a26@gmx.de>
Date: Tue, 17 Jun 2025 23:52:31 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <41de4cd4-2a27-4b14-a1c0-e336a3cec317@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r5Pls7PPPYvKle+1oHFSbtm8ITwah/+8bvFkI9ozlK/HDrapaoV
 HMTyp4/P78WiCfpUOTuz/ybmV2byHd3qWogSto3lq7njgaXCylU5/ABQ+k+VG0E9cq2YEPN
 il9N3LtIskbAMLFdNhVrcOiQOElL7Dc6qV3JD9ddcdtthurPLkORkVrKRTklwYTDLVaoqzk
 QzYG85tTXpMAGVvLdPxlA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7uBwR7FlPu0=;Hm6L/P5fL8aCFaS584GH0+e/18R
 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
 Pjl81otPvhGbqrJz

Am 16.06.25 um 14:46 schrieb Werner Sembach:

> Hi, small additon
>
> Am 15.06.25 um 19:59 schrieb Armin Wolf:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>> +
>> +What:=20
>> /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/rainbow_a=
nimation
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Juni 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.17
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Forces the integrated light=
bar to display a rainbow=20
>> animation when the machine
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is not suspended. Writing "=
enable"/"disable" into this file=20
>> enables/disables
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this functionality.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current status of the rainbow=20
>> animation functionality.
>> +
>> +What:=20
>> /sys/bus/wmi/devices/ABBC0F6F-8EA1-11D1-00A0-C90629100000[-X]/breathing=
_in_suspend
>> +Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Juni 2025
>> +KernelVersion:=C2=A0=C2=A0=C2=A0 6.17
>> +Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Causes the integrated light=
bar to display a breathing=20
>> animation when the machine
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 has been suspended and is r=
unning on AC power. Writing=20
>> "enable"/"disable" into
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this file enables/disables =
this functionality.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current status of the=20
>> breathing animation
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 functionality.
>
> maybe this would be better under the /sys/class/leds/*/ tree if possible

I CCed the LED mailing list so that they can give us advice on which locat=
ion is the preferred one for new drivers.

Thanks,
Armin Wolf


