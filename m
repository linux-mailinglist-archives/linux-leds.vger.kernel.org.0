Return-Path: <linux-leds+bounces-6568-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35FD01D6B
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 10:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8FD530734DB
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 09:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60D42CD74;
	Thu,  8 Jan 2026 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oeHpLZqE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GnPa3SU+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C2387357;
	Thu,  8 Jan 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864022; cv=none; b=K6ZHBNPJdMZ6M1K1PjOe06WYhqnZbJI2ASKp3cr5OiHPaoBYj5a8PVz52QVw8hMrYCvRrWJPDrR96fm78BmxktmA7XRqgiC2VhDgCvlfxWV4Oto2A5Vo+vLYiWzh98zQ7p+U5lDUkYfvT67nHQKc6osIxZhAwFn3FapX/JFs5Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864022; c=relaxed/simple;
	bh=LJtMgR38bkWvUchTlzy/NoVrUe6+UjJfYA4juR3YW98=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ahQ2CGQqbZNEGiGpbznkDarIRgNVbCcZoH8//dtXA1WTmsrtuph7I0G+kH4xTy5yBeLBxL6w1J8VdmkVUf72Eeua4f+mv93cf9In4EEy8zF/M2JShANv0PzQa6iiIgS3YVfgBGlGUQoUBYDqBaVjEATUNqDlziVE4cAjLDDDcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oeHpLZqE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GnPa3SU+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767863831; bh=z4ln/Zq/EvlaymR0blLFOBp
	lOaJOGpOHDKqXZY4y8a4=; b=oeHpLZqEBNDpm7VXEpS3ews8h3auO46UyCzY13lWW+/xujy6j8
	/vBBspN2cDXW91fwUGQ8lyGBSVD8DWm3o5711M4D5RZDXejq7ZrOR2BYWXWQizuZ515ogWBvPW4
	0kSENW6cSdxtf/eam8hyR5OebJjZ2K8sJHXtwHQtwwkAmDAPrS8lnXNMpERZuAXLz1tY5BH45F3
	Ygkfagw78+pGgwHrRtxzcom+buFppUaePa9/LIjUP6hEfUrPUxFeiaprIzNnBRir20b0V7orWPD
	dSWJlFopcno1EAP+a83EzmB34gP4U4lD5pL2b1vML+ZsNf89vbga08zmvRd4c4ApqNw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767863831; bh=z4ln/Zq/EvlaymR0blLFOBp
	lOaJOGpOHDKqXZY4y8a4=; b=GnPa3SU+34/sBH74UPMPOLrHz2qYJEa8uyDGLLFSkFFbf9mXB2
	krHxaMWFzqce+xCL6OaPUB7SJZ630hKKM8Dg==;
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 10:17:10 +0100
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
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
In-Reply-To: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
 <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Message-ID: <c7bca43b1b912a6a100d83229d78abde@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-08 09:54, Konrad Dybcio wrote:
> On 1/8/26 4:43 AM, Barnabás Czémán wrote:
>> Document ovp values supported by wled found in PMI8994.
>> 
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I reviewed a version of this that said PMI8950, which is very much
> not the same..
> 
> Let me try and get some more docs to confirm or deny what you're
> saying..
I have sent it for the previous revision msm-4.4 contains the 
documentation.
https://lore.kernel.org/all/95f7c89fdf9b856f567a498cc56ecfa5@mainlining.org/T/#u
> 
> Konrad
> 
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 
>> ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml 
>> b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> index a8490781011d..19166186a1ff 100644
>> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
>> @@ -98,8 +98,8 @@ properties:
>>      description: |
>>        Over-voltage protection limit. This property is for WLED4 only.
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> -    enum: [ 18100, 19600, 29600, 31100 ]
>> -    default: 29600
>> +    minimum: 17800
>> +    maximum: 31100
>> 
>>    qcom,num-strings:
>>      description: |
>> @@ -239,6 +239,24 @@ allOf:
>>            minimum: 0
>>            maximum: 4095
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,pmi8994-wled
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
>> +
>>  required:
>>    - compatible
>>    - reg
>> 

