Return-Path: <linux-leds+bounces-6556-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6753D00B91
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 03:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F513020CC8
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 02:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBCE2765E2;
	Thu,  8 Jan 2026 02:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FyYQRWjU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qJJrC6Bu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3112727FA;
	Thu,  8 Jan 2026 02:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767840319; cv=none; b=Lmak4I0X5gl7fjLg/WGTP33wARXTytN4DdtlBm6FgSx9EyvtTqUIwAmwzask2rlhJaphtPqmSG2OhbRc6GQzKTCD8ozjez2SV5mvH/gTqQ93hc0Es8e3TRCo6XKUsmsEtksh0Zge5aDYkz4OXSrqtzDl6JVmxkTqWt7QF299sBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767840319; c=relaxed/simple;
	bh=BE+/2PGu2BRhUqiJOSHlZMJ+TdrDhNO1Y0c2lc1iJWU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=cfnsTILwo8zFcFl7CHWrWI6Qh7B/6iqcWdETJ0ILMykI8ekOlF76zKL5zRiepbJNeSkDosoVwF9QXagp2WpAiNxpfTIU+VXz8lyhnRJrR+8d3qJnFvLX426UhVxjLkYGyGmkgUoRYMapHrOPe0JeuFB8C/xXjR9lBr1MHike74Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FyYQRWjU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qJJrC6Bu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767840161; bh=2lSfWiQqDeO7HMs59Rd2an6
	RkPZ8CLhIM6e2qCA8PNc=; b=FyYQRWjUPUJl+YHpvA9ndH9UaO/P+F3yqmDcTfkaaSJiJWV8Fo
	tU+GYbNJvEsPhXvdF9KBX5JwMU6vaZyTM0tcMAqhNtyLdq/EeJCNKtmGH9mMwVs/G7rwOu3r8YW
	BQlM3KGZdmgRFnojSr8puYhLnTaMjjTcyrK8kdpOEKhXD20VAdksfGD0erIki1lDtVxWYBYK6yh
	LgzA7ptyXdZMRoR1AH/ntfk02qlCnxuROLmoEbrJlroR/PeMaduFy6wE1ssxxiAt75UbOPMTdhm
	U2OB3Rc4FouIVhIPAjvsRhSmXYie3d8NViMgZIYTjTG4KGtMUDFGL9T2itTAHthM3Uw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767840161; bh=2lSfWiQqDeO7HMs59Rd2an6
	RkPZ8CLhIM6e2qCA8PNc=; b=qJJrC6Bu+IUBZXn4NkYSSLnaYTABUCMbcM5YNh3hL09bLNZ3Cz
	IgjF1CZuWptRPdkr/6dx8gl0cTpit8LFUTCA==;
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 03:42:41 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Kiran Gunda
 <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>, Luca Weiss
 <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy
 <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>, Alejandro Tafalla
 <atafalla@dnyon.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8950
In-Reply-To: <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
References: <20260107-pmi8950-wled-v1-0-5e52f5caa39c@mainlining.org>
 <20260107-pmi8950-wled-v1-1-5e52f5caa39c@mainlining.org>
 <bfa54cfd-b5cd-47c6-b941-3bb5673d19f6@oss.qualcomm.com>
Message-ID: <95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-07 15:03, Konrad Dybcio wrote:
> On 1/7/26 2:31 PM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8950.
>> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml           | 20 
>> ++++++++++++++++++--
>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index a8490781011d..306fb6642617 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -98,8 +98,6 @@ properties:
>>      description: |
>>        Over-voltage protection limit. This property is for WLED4 only.
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [ 18100, 19600, 29600, 31100 ]
>> -    default: 29600
>> 
>>    qcom,num-strings:
>>      description: |
>> @@ -239,6 +237,24 @@ allOf:
>>            minimum: 0
>>            maximum: 4095
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,pmi8950-wled
>> +
>> +    then:
>> +      properties:
>> +        qcom,ovp-millivolt:
>> +          enum: [ 17800, 19400, 29500, 31000 ]
>> +          default: 29500
>> +
>> +    else:
>> +      properties:
>> +        qcom,ovp-millivolt:
>> +          enum: [ 18100, 19600, 29600, 31100 ]
>> +          default: 29600
> 
> Out of the supported ones:
> 
> { .compatible = "qcom,pmi8950-wled", .data = (void *)4 },
> { .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
> { .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
> { .compatible = "qcom,pm660l-wled", .data = (void *)4 },
> 
> I can confirm both allowed and default values for PMI8950/98/PM660L
> 
> I could not find any data for PMI8994 (or PMI8996, the essentially
> PMI8994-revbump), but it's very probable that 8950 is an oddball,
This commits add support for pmi8998 and documentation is telling which 
PMIC supports which values:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/commit/7a1b6d0276828f270180db40935bb034a3470865
TLDR:
- qcom,ovp-mv		: Over voltage protection threshold in mV. Default is
			  29500. Supported values are:
			  - 31000, 29500, 19400, 17800 for pmi8994/8952/8996. (As far as i 
know 8952=8950)
			  - 31100, 29600, 19600, 18100 for pmicobalt/pm2falcon 
(pmi8998/pm660l)

> so:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

