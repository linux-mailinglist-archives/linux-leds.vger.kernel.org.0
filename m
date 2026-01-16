Return-Path: <linux-leds+bounces-6665-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5DED2F4C4
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 11:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC45830D0A6A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jan 2026 10:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAD035F8B4;
	Fri, 16 Jan 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJwTJJGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWtQcUd+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2E135CBAC
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558083; cv=none; b=iIEuvjRXdOrm48O/g2t2nHLRZZFnhlvhAFV/NU/WUU7OfpVFIAbcOBEmnkKrQUcCwXuklqh4fxqi7J+lvW69LHUUF0bK0t5bXywaxetVk8nCsA4Mb/jjndgm+PF+3xHehYaybM+xlVCWU5dqP8D40ulSOvonJ/+ZIWbvxnSpg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558083; c=relaxed/simple;
	bh=4QebrYHi8s49B6sj+XuT+a7lSGj2d/XpXHh/yb6bJ8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DW9JejRX2h/4j1H67iPqcj190SRvb0R4rw0ov0BhXe2PpVEn5QUTdi6djPPQRnTbq1Vpp303oV3TpobVRiGFeXhRADEbgo/NK1PeaQD0sRR8EWASODPuUrB8xeJ4a7yCi87ZlHjbNXf6+cHpe8uwmUOsMZ1ZFZ3QRpdHv5IduuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJwTJJGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWtQcUd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8IKsR2615163
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=; b=FJwTJJGgW7eFqUaI
	6GTfqzIUGeKJva8mYQ4CVVPw6t0zLMsTCiZZKCkfHsi3cbvl2mQdJ5oq+t8mYnPq
	wY8cD7SvhiT1K3pMBK810jXv382zUkBCW9Js8ZxE+9Ot274WqpxhD1eNAMtM9VCV
	C2faTy3nsHxuLLb1MpBhVnKEamC9ZRxWK+ydhrrdLsBogMYmspZ8YBIq4+mnqE3X
	fiUCq4sY0KJuIVFZoQqR9BI+jcSVJMs4C5W4Qr13hXCOmTQfT7GBemWVRnPt7Cgj
	b8cG/XzCI8Giifi7jz4SX+gAfjDSGqZB8rbXFW/SzztNmhzPTZtu6ivTK6yRVplF
	t85RWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq977sshf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 10:08:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52de12a65so46372185a.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Jan 2026 02:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768558080; x=1769162880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=;
        b=BWtQcUd+9ibywMpnJZCz/MJMAQvGJj3JrrznDDqCstsA3Zmx/ALgfrLPsFyX7XQ/SC
         euBaDdPEXVS+/frgXqz4yi15o9iccPQ0p8ni2pJUrRniSE5cKNpXvoUcwRSFTOl/ew/4
         nnvGCn/82gGtTODWbEAv8l8H4sYN6E6+YSRZa3ETrft7wJFshXRxtiCSJ/666/Dr7f4u
         3ncI3cpdFZe/OFHTatFWvSOxDMzBxakrP2f5mDU4mSzOJZmkTSSGW5vzoPEyKa0aNJeK
         Gm435Wm6lhCX7cRQs85kLDONEt6lxp4hShuxdjzId7XZwMvYTb1N1KtJvZ/bOY59+Qry
         14ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768558080; x=1769162880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMp21ney8bm54p1fps9Pw9iiGOGyYYMunTK1tTna0vY=;
        b=ctoPV/Kuq4Pm9MfXddFoZuZ7726bGEinYrE0Y7NuV06YgFc4atEWefD/jmzTCNQSZB
         Y0bwe1rwasn6Cvm0tIAVuRUClUIRKNZlK4rWE553efGltfF89TZ5ahYZ8yksb5CWYulM
         de/+lezPcIJO2EbJw8NkLg0X5MUCXvxMfFz7qiPhNnu4Zh1cU8DEFEKQlJurBU56R7hf
         yUgooASkao//PxfljJ2a/ij7UVTKNg23cp34oqM8mNz+FDjpFkzYTuXS0gG2Y0+QiK4Z
         awEz0A21GazzQCw0ni+MZkwaFA2qLekYZfzGCFxJ+jPgjKATwU/TdrAn1y3k8SW52nja
         Ql5w==
X-Forwarded-Encrypted: i=1; AJvYcCVvdc7whk4Pz9Z2fRMbUdqoSlime3g0wQnwGv55+8JOvIB3p2CWtYgxdB80Zr4IYACZe95i8JxGTcWj@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEf18V5vPjjXq0gwtLwsTNsjcRHJKzrJ/RwE2rFfyDibFr4OV
	Q6iuGvuqOCi1OzXzmnJpatous01Frpg//P8SZVxoDF+CF+HOFlEXZtDPNWXXx/YCo9GWk6RDZXV
	MIuFdNgr4FWwpgM+agDUk1BMqVbdIE64LY0uVL9dGfQ4Moxd7jZ9DzOX79hxnmDOa
X-Gm-Gg: AY/fxX7AgQRNirJGjs71r5pLAJAZnZ8+Vnb9cVGER5zevnchbXrrUu3yCac5aRyncL7
	aVC9ViG9IedbJXUosA2iR9z60Ew/31RdlwLukwFEf2x9NkhIo1uOY9J4/K9jhx1NaRBjLuLAhbQ
	Vs2yvy8+CmC+FUpkToUpZGtYvUyuviq7WZGjBPltkEZ2pcvbKJvYr+32COVJK4P2IzcEG/7tTna
	C03M9hV1pkXcOxrMe5lpv3a7wOwJnQozXy1Dy1ULKhOyaQeONGY4CRIJREESMcLjdxpB/i/HGYm
	gy5NPfZLUWowRas1+lK3BthN2UvQpWQBRNGU6uPN+MQoqlwBzrTEWlRXedONYQgQKnl/kseFp16
	7t5NQZdKTUtodp/z5b+ij88MuG2iT6ppucWj3FAodvT5mYORRne/MQn0NReyrjK5QQwE=
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6a670cca8mr237361685a.3.1768558079682;
        Fri, 16 Jan 2026 02:07:59 -0800 (PST)
X-Received: by 2002:a05:620a:4111:b0:8b1:fa2a:702f with SMTP id af79cd13be357-8c6a670cca8mr237358785a.3.1768558079218;
        Fri, 16 Jan 2026 02:07:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8c82sm2074279a12.29.2026.01.16.02.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 02:07:58 -0800 (PST)
Message-ID: <66a1716a-47f1-42ce-a72d-8c69d29410d3@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 11:07:56 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-daisy: fix
 backlight
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
References: <20260116-pmi8950-wled-v3-0-e6c93de84079@mainlining.org>
 <20260116-pmi8950-wled-v3-7-e6c93de84079@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-pmi8950-wled-v3-7-e6c93de84079@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ibjC_jpgm0Je2u5x7bBrGVCp1oRY58NP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NSBTYWx0ZWRfXxCmFk/ke/Nk7
 5kKvVpY/iCtxIU0xGtP2yllyzuc4LQrmVrjCtsJ9Y5IY/bvc8vbuWgdCsXJ9lNT/2YW0v5V2vHq
 fdQEo5/A0IZqb9eEOExDlBPzvqVmdeuVuwg/klatureoDXjCBjvA9qByjzHcYk8xKl9P8Drz5EX
 pB4sQotRBiaXwVjkFCSFuhFflxx4KuTLjtT9/Fi4TY1N09VmGRBGVgir9AJ5NzILExkSKwtVMv9
 PiGZjrZT3jcm6/0v3VDKNQwtma1GLI/ZzdB3Wa8gBMOI167Zg8hgEjHpW9QglH11EW+mnMc3no6
 O9OpMnDxM3OMg7Ry1eYujAoTh53z92VAPDVO4WsVL5GPZc1CFkt+rdr3efEB3qnTbsnU/qKbC8z
 ybCXPp2tweIUHTSWavOPRCXeGN/CLi9dfYK2k+AkBvkzKRAvGOHcVH0BMuoXOCor2/c1aNwCweo
 HYVDG12iL5+jh5d47sA==
X-Proofpoint-GUID: ibjC_jpgm0Je2u5x7bBrGVCp1oRY58NP
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=696a0e00 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=HVKn8-F_4eW3eUG8FJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160075

On 1/16/26 8:07 AM, Barnabás Czémán wrote:
> The backlight on this device is connected via 3 strings. Currently,
> the DT claims only two are present, which results in visible stripes
> on the display (since every third backlight string remains unconfigured).
> 
> Fix the number of strings to avoid that.
> 
> Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


