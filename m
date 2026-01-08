Return-Path: <linux-leds+bounces-6566-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB56D0425E
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 17:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5008B30275B3
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4E835029B;
	Thu,  8 Jan 2026 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/Bb5zSa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mrjhl7Ez"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9B347FC0
	for <linux-leds@vger.kernel.org>; Thu,  8 Jan 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862487; cv=none; b=QXMUyr3Nb+A8yKikM00opOYOz/eoAjtuUKd9HxFXWFTBMX+x5z4XhKjZgPMZkd/F8jwqOGZMnxeYTpQ0Jn7aB8Y6ejN91iBWjMKchCzYRHsU9DjTWjgqotWdfl2TaB+zTpHDqyI04Kv2pVIeJoLKhw7uvsbo93GwYb3n6bjcK3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862487; c=relaxed/simple;
	bh=mVSMXFK7v+Ah1A7LBJUtANrEGYnXVMe+OP0c2TZf/J0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgqJFF1szRpdsXbDvnduk0mi56+EaT8iO2F77tWyLvERKxJVEv5RsMXRk4j3jewp0U+cjynOFN3v5mPjxQ7o66RC3Dcbgz6HjAcwgeemNXyzCkvcRqZFfZ0LvvAlOhxD+dTQZONDlYOwXEgLhoDGmWlT1FLmYe2Ufeo3c+zYJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/Bb5zSa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mrjhl7Ez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084t2O43890559
	for <linux-leds@vger.kernel.org>; Thu, 8 Jan 2026 08:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=; b=Y/Bb5zSaYvFdWnf9
	awnXNWIyId5BHWwCbCccY6ArNvfk2q1nmPmyJx+RNUQGOEQeXZavfE+cWYce/IC9
	omeP7S6yRGQ1dMdbZaMuq8vRsdWQZ8ZJIFXQxaJ47wdOwBWe72+/C0yZKN3ji/ch
	t14YsuAz3ofZ4U7u0kA4lrAUR/inDAV5xxx6A8HMtE2EcAXcgXA+tJ5eEfOM0dAs
	/bnveI08c+Uf1hHIHozvyzhjSNxXwwrHgK0BWe4wXFHc3J2vxhzaK1crRB5eWEo3
	aKmJJKmtKcXoFCvuMGgzBze6OXT48ibkQ5e1IcERJXEcj+lP9riFt7D0/8ukMNIi
	IUNmzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy72dwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 08:54:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f357ab5757so9801111cf.0
        for <linux-leds@vger.kernel.org>; Thu, 08 Jan 2026 00:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862477; x=1768467277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
        b=Mrjhl7EzbXy3I2SqTBflfUT0ptztZTZwu91OLxSv4JFJVVdTsVIQ9CAGAwYHcUvCRy
         phPrnXNdq2QkeM7+e2vZcxeV9jWizyh/+ziQc//MZ7PElu17u0XrszgRTRYOviPzqHHR
         7N5tjbtdQzmsw+luUhku49wsDmBMYMuBb4JhtkM1fImf02qwEca0GK/rQE1gC1NVeEiB
         t7PPvAParvTFF8SSBwIevxIgsDC3hhlxscwZa9j8uD0Q6sOs1VK4v3a8agLohIdjHqi4
         GicoIwJtUMsLBQ7ST4eM80zGP6s8V8i2PFa5gqOUz10HS3fIy8UU+ykZTsPYqo1/LGal
         BfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862477; x=1768467277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoe34/R7xZJT8mu6kS6uEUp3vVo/O98wM0lwlPWZ0Hw=;
        b=PZg5VJU5/ZDq4fxnIPZtx5KB5BNZwQPgQs22nvJi6Lzo8IXpiiumMG7P7K2+nn3CNM
         Pqq80pxvHord4wIsNd12ip5quyAFv7sDpIzfKuIRcFtAgKVNo85NSSFFF7FlsO35Rko1
         IP61A1y8XD0hsZ6bO5ApeNe/JQEyEVpe+lItLFnoqb1VrYGbJ9arYkqWZXqyHAuSH+Bj
         FEdoCD3wIS3sM7OdJuXxHzbMB1vU0bOs1PU3pDksts9RXsRBARp8UXJplbuCz3qtbiyb
         YO2bj6//MlJvUceI0j9u8Ns/5kVVs/TjoU+2tfDKjrOU54BasipoPWJkCHwqqEb8y4zd
         e+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKS2WUkJpDgnbwBDG8BpVjSjCWhGPZgS2zHOXlAAHcrCQxgm4COPTAR2YhBCRB5VSsNtYrURYSafir@vger.kernel.org
X-Gm-Message-State: AOJu0YxCE5KaukxqkZGOlffTd+RAHlTV+MhIcjgPE7LVXfw4XtZ77mxN
	AF5TJDaDtSjjCAXo+6KD31uIjhotGbinN6UqacS6wgrSpOuyxO/Q/NjTlOEPqsyyN+ddFN7sbJp
	RAl3/SqVyqOzVJrc17rp4GLSzLYt9ujuHnKqTKPz3fqvYcATrV9khbZxClQbGaLSy
X-Gm-Gg: AY/fxX4LUJIKHpWqn0MKJsOht9vuuA5Eyk9Qk4PNSwdW1JHy+OwFCkHgyBSA54Ofjhp
	6tdLwVSaCB+lk81yd6w+QCkIOB4XpljKkUngHJ7p5ujyeZBvFke0bEx+ego7EEeIn3UpS3tjDUZ
	V2pZ7qxnR9TjMYxlm15zkCISLrQTDJsRjhF/M5i21e7YhBHBYPHrjGOa4moRIG7OuKOIxIqancZ
	oVQfcX+05d5uKjquLV2fRc+ZNfBwqx+u29Q1fP3yClY8YwZ8lY7sLMXT4cHbBvA3o3PTBeXS8Io
	G0MWIvdnJKUSTmRAyA+CutXN4udqNOm77Cw6K7tOVuUmSaJ6t+g3yt8XfuMBDQvH5IebCoQXNbF
	RwzESK1YB254UyN6MJql+Kyq/EOKxyBmGVGSR8uD7JK8TIngeLQ+/LKD1P6y+8/lPOTs=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr54667711cf.4.1767862477028;
        Thu, 08 Jan 2026 00:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9Zu4B4c1u8CU9ENDyOwL5KHQpxYNvhOydpv0jjl8YDszapOdfdCaPnmBYxJ0lXpbM7zjfFQ==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr54667601cf.4.1767862476596;
        Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm6893952a12.33.2026.01.08.00.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:54:36 -0800 (PST)
Message-ID: <45a2b510-c825-4191-975a-1389f4f18903@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:54:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: backlight: qcom-wled: Document ovp
 values for PMI8994
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-1-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z0rkTkjLVh-6QVcdQYcN3DYvIsLklxtS
X-Proofpoint-GUID: z0rkTkjLVh-6QVcdQYcN3DYvIsLklxtS
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695f70cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=RLX663m6bzWGV7rLlMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfXwL/zenZe8LTJ
 1cP7n9w0KVqMMwwP4I4UGRxQ47g7fjAPNgtYvrBVEnJ9C0QSVp2lrNR5pjPDuIti5M9XtLXb9e6
 uOXFEJrG0IV962xPkDuWJ1lXn0bv1+5HZ2m/jbZp8W+bFovmAEWapDPJTZIxMqsr30zYEgmxX10
 rX6NSLHmcCQ4CjSxS7VY9o6sLeGU/QcbobKt+4EsL7+ZvkXWCgjBARU0lrwsMvWDUD5yuSkSfG6
 flnKvXbSsOb1AfAZ6KjmJG3RT2GdhqGPoDvGLtkI9d8wPjEym+gXv33AA66IFZPv7UDGIsaoYj3
 yHh6coZF7xtKb+neiTisEWLKBzREDeU0mDJ65SwoyEVKrskv5ZfPZurFCZ0lkEUxIyKr5j9aPoO
 0nvNYDJrifzKlOciLnNS+UuSEfbWdJ+RTCxpX3Pa1BaVJQkA+ZZ5D84XMI1kGU2qr+Vo6tPpd7F
 vtUwwhtckbMGiDQ3wGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> Document ovp values supported by wled found in PMI8994.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I reviewed a version of this that said PMI8950, which is very much
not the same..

Let me try and get some more docs to confirm or deny what you're
saying..

Konrad

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index a8490781011d..19166186a1ff 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -98,8 +98,8 @@ properties:
>      description: |
>        Over-voltage protection limit. This property is for WLED4 only.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [ 18100, 19600, 29600, 31100 ]
> -    default: 29600
> +    minimum: 17800
> +    maximum: 31100
>  
>    qcom,num-strings:
>      description: |
> @@ -239,6 +239,24 @@ allOf:
>            minimum: 0
>            maximum: 4095
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,pmi8994-wled
> +
> +    then:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 17800, 19400, 29500, 31000 ]
> +          default: 29500
> +
> +    else:
> +      properties:
> +        qcom,ovp-millivolt:
> +          enum: [ 18100, 19600, 29600, 31100 ]
> +          default: 29600
> +
>  required:
>    - compatible
>    - reg
> 

