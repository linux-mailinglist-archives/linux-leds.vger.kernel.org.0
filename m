Return-Path: <linux-leds+bounces-7390-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EENNI1vRu2k4owIAu9opvQ
	(envelope-from <linux-leds+bounces-7390-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 11:35:07 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493B2C98B4
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 11:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3CB3301FAA2
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486083C1997;
	Thu, 19 Mar 2026 10:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6Obaquz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIdHoE1h"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A963ACA5A
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916503; cv=none; b=tq4ZfS8xvLCqu+WFx1SibUbZnIJ6lAX8A2llKN/of+E2ar7Y/eHgVrubeWs+4gzlDzq88hslmsQ9W9Qx+Qk3jtyXqY26maDAno/4ZXH6fwVzc7MJnHf7foaGOVzxvD8MoINhe2r9Un/cUGltQhC9G5+F3EAF1WIh4MXevkmEFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916503; c=relaxed/simple;
	bh=hAWjeG+NsPQursv7HB44cYhVWfuO9vlvMjswBd0DeMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H+trnW4HqXOt9mwHlFKhQiManaTpfWgTnRAuwiTWit2JTstBH2KZRx4i82jFyzhttwWpspAy/XjPJN1lEzrLW9WYxoOEfjJmUneyPPV9bz94qZtTB9xGEP4eLOYvBlEeCEXLInh+YmLpXLQI2LzHFH3LCTj/A9WIQ/JHHRbYxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6Obaquz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIdHoE1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74LXM3928891
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=; b=W6ObaquzrkpXwG8w
	ZxxbaPsjH1ndCM94kiTk4eo8cUZ1hypd0js4Nv8APJ14lcCpVfandQsCktlh2t9T
	pJs/BTKkO75RfUkNWPtR5NwnM17rZrM6hv8LgfhQohv07aZePUVhGtZwSvjFa9IZ
	elRXiZEY0SiQ9FT3xuLpfy2M2A0EgQSpj4q8ruTX5IzAFIEXMrIZpNplMRlINmVS
	LhDeYA4NDKIGUsRguzfd9RPO2Oe22L3DOmk88u/uxboSG7M0KIJDIgFyHRi6COOK
	9IEKaHODpUUb/P38hfxXzCBDClrrajbKfF0caFfgfPqaKP/duomiwNigtSHU9R9q
	PTpnnA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1c1qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 10:34:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50943e69b08so5894081cf.2
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773916499; x=1774521299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=;
        b=QIdHoE1h016maJZbTABK5UOUSvpm8mxKJwns5lnh2JCh5aX4wClPTk359xLLJRaUyX
         EVXAr6PF3DdG3yX843kd3AS/k/tE23LJ9qaXHcXk/tlwT2A3EUdV5WhSzgP9J+hjHvig
         tSHirR0qUJCX0tC8ONX/T4MBkvQ8uipHQChf8W4VWk3HmlSxGDQaAQtRlws+ZUjx1iyj
         H2+hik2/+NOmhJBunH9nY1dWpGKP5bGR88MwaJMFLJ2jH7B7UYLM1jXP/RIMpAVoDaIw
         nROhF0wPDVI/6P3DFQ2zhIHp5cwGN5K3wUlL/IZeiBqC/A0Xdu7M/XVwzOEH8MjJnfEF
         QGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916499; x=1774521299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN1EVu/JbF8IkdV0IBCP32D0+7BYZp0d98zQyiRhmWU=;
        b=AwsesuAmlek4re47iwFL8S2JycsOoXNzKhpf9IAwNGYXKEPFcmyFqGlbhMvO81F4Sx
         7+5Sn+uUKNC5GAEYdyZ1Ob9+2vEQmKf3UotWABWDbna2ypEPL31Jd4ZGzYrFzp/Om9NZ
         m8ag8C5FuVg+kmRu2MEkcwy8MBXu3JSy4nGF7jRuYjfvkGdqV2y9ATzPrtJKdTAr6yG5
         /wHFKrw5JKhhqRetRnR1Ed6v7VaYdN1m6wI2zGbMMoz4xl/Ir1olYM1T1Ps8jUNmfF3h
         MU+mJLEKt3CtRUbTdUKsn9LDwiYPg1LhTEK/o8pWiBgjwyTLyDhyhyAZPYesR+Ls32dM
         lVqA==
X-Gm-Message-State: AOJu0Yyx3j25CYBCEHPyQCSKJxjCoH5LRSf86vh5cHrnEYc0WJrAL4xm
	WD9LDUPbNNI4Xzi+pbQWR6RI+gDzsRemT74Gln55byarnz99XISD09YjD3B4a3UU51eMlcWhfPu
	teICpUKgXWcDEzhkju2yUaIdl4lsNw1XShltT6iKdMjQ5XjBRnQJPDAXEnqu6FxZH
X-Gm-Gg: ATEYQzya60Vy4/EJMvId8relv3noTz/ZumBOWlXwbJRhAIwnIxD5JhjUrZnp7rABSmh
	4FLlHu5WavTYW4IWNQ0RL7N+fu9RUTIwXI/sOU9NJcoesO7MgwdmXdWJqtHMYUH0tUYOvrpav2x
	SlhVJ682eOw61BwrSOaJuwFexOoxBvLORNA99zYammZQMQZmLnhz9FOYCp9aVFmXMutgIcAhY8g
	IesqE3Fu1XDec1LSfOKUKzcKJG29/z3vSlpSHDMTkvPV9iX19bVhr2Or7UkFeraHr5HEday0AjW
	4blnYCjwe5H7duYabXJE7S0FpJ7RaOg3EoKEXX4ofxPuHQQXaf/2DIgypQldZhN3QpLXUlN+d1B
	LCGBRB14DHtHsXt/sryNoQceGuA4is9+o4afFsbItaNwrE4LrKTf1xR6PzESH4ifLZHPHcUG/4v
	XQKGM=
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr64099001cf.6.1773916498908;
        Thu, 19 Mar 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:622a:44e:b0:509:911:3273 with SMTP id d75a77b69052e-50b148b071fmr64098751cf.6.1773916498374;
        Thu, 19 Mar 2026 03:34:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1738f1asm402338266b.58.2026.03.19.03.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:34:57 -0700 (PDT)
Message-ID: <466e7543-20d1-4015-89c1-1e2bb0f1cb5e@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:34:55 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: guptarud@gmail.com, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
 <20260318-expressatt_camera_flash-v2-3-5c2b9a623dcb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-expressatt_camera_flash-v2-3-5c2b9a623dcb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2MdPWKUGPowzuwreykN4tzLD7f7gXEWd
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbd153 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=b-NmJ6g92bM9CzcnVPEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 2MdPWKUGPowzuwreykN4tzLD7f7gXEWd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NCBTYWx0ZWRfX5JWNV6TN9YMj
 +zovxlwix4HOCsCHiQ9zpz5gtKMC6xmNJzAdKE6D9q00Z50fD3XxBSmjoTvxkr1DdF5Igyy+TvE
 N+pHw4uoVONxdrhMj0BXSV+dkskj2f9mwv2Kn3Wq9shftScY41xyhYBN9B0X+qwAFt8Rb79wKHH
 u2cHx9lyLVBEY/ZYqX96rZp0rxycUZW1WNwYi9jkJ9HgdjgkbZ0TKwIeqQKU79gvRdvdPw8TE8o
 Ds7lia3tcvx5yOgAoaS5uOhlkYXN3xNUTLV7wluy/fBLdeRilPbKuZq0f+LQJAhOVc5tZlPckk6
 MU08alsnI7aNCldS1PL+V9+OgjkhfhBAPSXDPsPRqrQhY0tmbn3s518E9t6pfiSahIxqQCvjEOh
 kipwcpO1EMFhu4e0d7DMo6tAuOx3qFRA+1pplbgYgxAFwzozNnJA5Zo9XhRSJPy7L58O+YzRrD1
 4+mDWARxonZ5W6vbipg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7390-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0493B2C98B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 7:34 PM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add camera flash support for the Samsung Galaxy Express (expressatt).
> 
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, powered
> by a GPIO-controlled fixed regulator on PMIC MPP 4. The regulator is
> modeled as a regulator-fixed node and supplied to the flash IC via
> vin-supply.
> 
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
> 
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> index c4b98af6955d..ad5169a60937 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  
>  #include "qcom-msm8960.dtsi"
> @@ -61,6 +62,32 @@ touchkey_enable: touchkey-enable {
>  		regulator-boot-on;
>  	};
>  
> +	flash_gpio_reg: regulator-flash {

"vreg_flash:"

> +		compatible = "regulator-fixed";
> +		regulator-name = "flash_led_en";

"_en" makes it sound like it's an enable pin - if we don't have a better
idea, perhaps VREG_FLASH_3P3?

> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&flash_led_unlock>;
> +		pinctrl-names = "default";
> +	};
> +
> +	camera_flash: led-controller {

Let's drop the label since it's unused

> +		compatible = "richtek,rt8515";
> +		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&flash_gpio_reg>;
> +		richtek,rfs-ohms = <16000>;
> +		pinctrl-0 = <&cam_flash_en>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +			flash-max-timeout-us = <250000>;
> +		};
> +	};
> +
>  	i2c-gpio-touchkey {
>  		compatible = "i2c-gpio";
>  		#address-cells = <1>;
> @@ -247,6 +274,13 @@ touchkey_irq_pin: touchkey-irq-state {

This label from the context seems not to be present in -next, FWIW

>  		drive-strength = <2>;
>  		bias-disable;
>  	};
> +
> +	cam_flash_en: cam-flash-en-state {
> +		pins = "gpio3";

Please keep the pinctrl entries sorted by the GPIO index

Konrad

