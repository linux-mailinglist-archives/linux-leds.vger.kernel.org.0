Return-Path: <linux-leds+bounces-5403-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBBB45473
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 12:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B76A65A57D7
	for <lists+linux-leds@lfdr.de>; Fri,  5 Sep 2025 10:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C022D5C76;
	Fri,  5 Sep 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhf1vyfz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EF42D47F9
	for <linux-leds@vger.kernel.org>; Fri,  5 Sep 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067699; cv=none; b=flj5VKYXTMojeLwESGdl0ASo/olSSzoaD838mSIe0LPCPqhH5QunlC767pq8YeEsO1GhblNyj1a+wEXLKrQr3uXtnMNYMbSVEP6e1zYfKYSQXboJaSFahUAeVuheqJOeGhme0yIQkdG5yJZrtMydkwuMSNnxxb+VLjH5avm+tus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067699; c=relaxed/simple;
	bh=qCppbG+eQP46tSiZEY0crGxJVA1nNjzZ4wk6qR9CveA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cx8EPKB0a8EaMpfdFZvnl38O8Zi97b90xBn8lSqXQKdWiXvgxIs4sxa3vvp0VMfjnI3BKW8zoeOfVLTH6EEsBZOsYtLgjDa92C6i0gTy5V5czUtfmpuWlkmxxoP0LQ2p6OkPPySoI+dM/ScCOcUbprMJwmtn5pCM1KTZEQraJaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhf1vyfz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856OlYD031818
	for <linux-leds@vger.kernel.org>; Fri, 5 Sep 2025 10:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=; b=hhf1vyfzR3s0A5fM
	DAhvWijlnL9vn8hTAJrsAS/QJdRIOzhUHe4DNHvnBAM8c6AlYh6iIUH7pJtEFPQ8
	0W8Qs4oByESPGxBuOwNPJhtOEGmpRK2+H5KNJf/n+NNGQBqGnz6ex49pvHYybjXH
	kxSnv/O2nXS8q3iEocuDlNoyLETuVmh7SPehXjajgThSuYwgnk8O61mLDSz7CqQm
	hkI71xkbjw9EObY1O7inRyc3U/U9yYF6yfqqFgu2yUATzP3N0/ZgjkdL8xOc8vOZ
	c6D3WLQXrPYKgFRfHQ79XI5Pnt3JOGEOoFrLASo8OVKMl1/74j9dkudyDdA8hRzz
	0pa5ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw0au27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 05 Sep 2025 10:21:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-715c9cad6f8so2372106d6.3
        for <linux-leds@vger.kernel.org>; Fri, 05 Sep 2025 03:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757067696; x=1757672496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YhX9I5xQxAo+v+fO6pOEhRjl3CA+K4fHzStrCxl2ggk=;
        b=Ol6fywZHFjMC0j5cKelXzzdiQYxm3BKxECCk32SWfZuHHKYgEiH40QXxro69sGTaav
         kL0yPFNjQCTRSywnpcBsodpBf2BFmRicEMSiWz4mKPdPDUaIvuka1dRyxQkfYOLcw4xT
         rCILCcLPzxx/nbIZxO5Xr03T2i54VNdKXa+8Q3LbfeheCmcmp/BsWUI/pPtombli6Cmb
         QOCqmuEV29Psg2DFI6vkBeQJJybbQfUoV6gewmxFNKDUwPRoJ/hBdzA9H5uAoxdyqt/d
         InLl9r3W/mIUshQqtg8k2Sii9ZA8R12fOmswotVgxQtE6cPHUKC7VH5tfF74KOJy52Hr
         TrtQ==
X-Gm-Message-State: AOJu0YwkLa0+t4T7atdLk/HP4qGS0QQQ68oJ59vZG2IMruo3A7zHZ/Qk
	ruG9nCie1n+iVlkGpThUP2Ywf7yB+6v/Ax2+LekUfNvgIY0Nu96Q7VPudkGsERibMW4BaGY/9io
	9KX61j6cpYIS0B+5VbR/9txyoOp9iXVC3Jg3Fhjvcc46QoOf7E4lN4ywvr2gKa7El
X-Gm-Gg: ASbGncvlIOspe4ztTXwoSmocmO22xvyI/bDefdEuqCIbw5f8kx+imsiVp4OsO2WEpZ3
	FfvjpUOq38a6opGlCM55lTgkngYbn5Wptp+rPNI3dA+PD6pmw5lp6lwR25+9KaygAdmpD8gejug
	UAHTnVOC12XZPyLd6CiLW4Qx5av0wVr2eYJqtioLMC237sv7kY+dqMEd03EMdPrnR6Dkzbp+7Nw
	IdrZHF/lZsx3IpmlRziq74GsGeClnmBSkLHOMF9h5ID1sRv6Hs9YemhWRDdWto+EoE1xMnWOPLr
	1StfmN5HE4vYXsCYs1DfGozfoD9q0Elk+tGHtb1Ar1bDX6K+KV0gLTj5UwGXr9bicTUxoK7eCkv
	EKJfbv6FMP4hiVkJ2P/jmwA==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588761cf.1.1757067696151;
        Fri, 05 Sep 2025 03:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsI15M5gOFq5piSlzss18AHTX4GYCxGcCIZkv13DSKshZ+1CACZN6exOPR+BcJ3u0qTjcFRQ==
X-Received: by 2002:a05:622a:1a04:b0:4b4:95d0:ffd3 with SMTP id d75a77b69052e-4b495d11860mr62588541cf.1.1757067695509;
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0424cc1698sm1249620566b.21.2025.09.05.03.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 03:21:35 -0700 (PDT)
Message-ID: <2408b467-f1b2-491f-a701-4e45e1a1e823@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 12:21:31 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250905-leds-v2-4-ed8f66f56da8@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RvCvvFsfNQxVvkydHxYbGJunMgHbunfx
X-Proofpoint-ORIG-GUID: RvCvvFsfNQxVvkydHxYbGJunMgHbunfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX0n6Rb6huF8IU
 S+/sog84n3gDesZ0Nhk6MDgQl3g7K0tS5FsCGpsZdH6zstnIE1f9lSHXB+A9cEebR/8vykgJSwu
 8LipeiWETYfq4LbW5hkIT26XZgLdA4uDlKNM7Yb0ok5iPKCb64UxhWatc6CAKSbghvfnTpyo5oZ
 ZE5lD/HJew+iZBiyIa3d9JMF411kGoSc8cQCn6/WOZHh0adPJHYXQEoiDKkpRp3z26AjbM29BQL
 U3QDAWFQ1+xY8VX+ECel/u06b2CPbX32wpbsQLiEJV3jyeAkJzmuWgBqFdWnfhffsuXi4mNh9re
 f5B/MBf97y7xUO89ELuAtiAJmnf7sLUfD2xxC6cV3RvQ9pNXLqbMBeP1SwYKfVkg1rHHRu4O13W
 n4tc2dX7
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68bab9b1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=QE2y9RwVZUYpaLmqgykA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/5/25 9:59 AM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 637430719e6d7d3c0eeb4abf2b80eea1f8289530..03801b174713cb9962c10072a73e9516abc45930 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -83,15 +83,11 @@ leds {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&cam_indicator_en>;
>  
> -		led-camera-indicator {
> -			label = "white:camera-indicator";
> +		privacy_led: privacy-led {
>  			function = LED_FUNCTION_INDICATOR;
>  			color = <LED_COLOR_ID_WHITE>;
>  			gpios = <&tlmm 28 GPIO_ACTIVE_HIGH>;
> -			linux,default-trigger = "none";
>  			default-state = "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
> -			panic-indicator;

I think panic-indicator may stay, as it's useful and mostly mutually
exclusive (bar some multi-OS use cases) with the camera being on,
with the comment above it obviously being removed as you did

Konrad

