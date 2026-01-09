Return-Path: <linux-leds+bounces-6591-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369FD07679
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 07:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78593301357B
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43D52DB781;
	Fri,  9 Jan 2026 06:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Z3k8rymC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WkmcQYPp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8B28850E;
	Fri,  9 Jan 2026 06:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767940580; cv=none; b=hXuYaAXNP7mwfa43SQg9MiAnk1X3hxmdQZ9sjYEimkty6VTSdftQPi3nmjssf/wc5HAdaRjinb+FOe5f2W0roW8OnktGFNCo7ZRUAIVQ4OCdZHCflFCMFMcccj19IvgoM1gooE5TVwM3z3rCpb7zH3TQsPGDi56u2iNSKWxalrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767940580; c=relaxed/simple;
	bh=k6nAvvx5UVSbHO88lKNTmQGUQoFtGy7kceT8JUpw8Go=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ILf0ejMAdZBXFViN8jr9PYB08weYBeED6OkhUqn99V4yAc1Jy0b9XyKIdnRlTViHXJGahu6vNqxxNuMpAVy4m0mrPCuSdaY2NfgOFmwgqnOAtojhWxeZt4gTxYnmwrzwxytD8kAJfzZTZuKIo5hfNiR/u/ZxFjs3UmIWIqRqqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Z3k8rymC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WkmcQYPp; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767940563; bh=KFBoG2fcIxheggmVM+AQApJ
	yuE3iDl57EzYZzdHaxmg=; b=Z3k8rymCyRPCCIoyqZxbsyayVvG6CGqsrcdjyQLcc/LKkxIegQ
	vPOzZnySkZG2C00gULRdqZb+Lajp/acC0LJkGFAZ4DgeJBloaNsOSvyT5t+ABWqJnJgqHjwckm5
	P7LIszibYJqye37DKObXGq1Ih+0lv+0AZ8y0OYYB8dw0ZqrI6tVphU5bB1KOazs9c/KcUDiAr1O
	DEjiR0PDR2hxgpPzYlL9ufH9LmvCXuqJuDREMPOhJ5RhxFLX45QhCwNAsRnEaSOF132tdVmS4VO
	cE2RxtWUpIWFUZZURRfPCXFMKg9PtUJhpEO692b3YqMiK4ikZ5/6eO3Bm/AZmDKH67Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767940563; bh=KFBoG2fcIxheggmVM+AQApJ
	yuE3iDl57EzYZzdHaxmg=; b=WkmcQYPppQ+K2wEGm8QDA4IprDuJbg1u8P1XyGaIOvv7OO0LBh
	TEfwfdosBtVkxS8JSsxAZ/SmM2HhGojcn4BA==;
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 07:36:03 +0100
From: barnabas.czeman@mainlining.org
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Kiran Gunda <quic_kgunda@quicinc.com>,
 Helge Deller <deller@gmx.de>, Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio
 <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano
 <morf3089@gmail.com>, Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Thompson
 <daniel.thompson@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
In-Reply-To: <aV-UyhP7wllSBpYj@aspen.lan>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
 <aV-UyhP7wllSBpYj@aspen.lan>
Message-ID: <67acbe8ff2496e18a99165d794a7bae8@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-08 12:28, Daniel Thompson wrote:
> On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
>> WLED4 found in PMI8994 supports different ovp values.
>> 
>> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 
>> compatible")
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 41 
>> +++++++++++++++++++++++++++++++++++--
>>  1 file changed, 39 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index a63bb42c8f8b..5decbd39b789 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg 
>> = {
>>  	.size = ARRAY_SIZE(wled4_ovp_values),
>>  };
>> 
>> +static const u32 pmi8994_wled_ovp_values[] = {
>> +	31000, 29500, 19400, 17800,
>> +};
>> +
>> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
>> +	.values = pmi8994_wled_ovp_values,
>> +	.size = ARRAY_SIZE(pmi8994_wled_ovp_values),
>> +};
>> +
> 
> Do these *have* to be named after one of the two PMICs that implement
> this OVP range.
> 
> Would something like wled4_alternative_ovp_values[] (and the same
> throughout the patch) be more descriptive?
I don't know. I don't like the PMIC naming either but at least it
descriptive about wich PMIC is needing these values.
I think PMIC naming would be fine if compatibles what representing the
same configurations would be deprecated and used as a fallback 
compatbile
style.
I mean we could kept the first added compatible for a configuration.
Maybe they should be named diferently i don't know if WLEDs have 
subversion.
> 
> 
> Daniel.

