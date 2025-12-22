Return-Path: <linux-leds+bounces-6461-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CABCD6165
	for <lists+linux-leds@lfdr.de>; Mon, 22 Dec 2025 14:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAB54300AC41
	for <lists+linux-leds@lfdr.de>; Mon, 22 Dec 2025 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21E52D322E;
	Mon, 22 Dec 2025 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g436c2Np";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvD5N6k5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0EC2BE7DC
	for <linux-leds@vger.kernel.org>; Mon, 22 Dec 2025 13:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408809; cv=none; b=md4Ayf7iuFioc2x7qP29EFe4B0s2297r7tqU729RIgAFrxU9BWOfPawiIy8coOaxiKuARTfmYJ8jZ37+2wyNAup7euv+cp8zn0xg1xPyly/32g9mGBVkzBvMNeVqqeN+naOQmnE6A3PYKOw7zw3qMyra1A2tNxC2rMrHfAeX7JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408809; c=relaxed/simple;
	bh=wv23DNsmsWzJoqwPtzDiDiysbtjWgZAM6vtUwbCcQwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OTFRBuzBeq1GtOr6ss6zOXFfom1JqoT1FxHHaaZTo07/Z3PIkycODXeibqO/RsdXcG/qUFPWTBALtaFd/gsKZNsOZ5hO2+X6xmvdkeNZUmy819rE5InOPaudxpSmNjEJE4M3OS863a2dLGtHPM6Hy3ZEYLvcgGS69Y5Jb6+2iQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g436c2Np; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvD5N6k5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8XSxT3799195
	for <linux-leds@vger.kernel.org>; Mon, 22 Dec 2025 13:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=; b=g436c2Np0AohmjmX
	W3NF26YkDIeY7QFDA40v2H/XS2cpwspk+DIYDXnNsBE4heNkzwIx8H8Ct6ikcz8Y
	Ok4RLf/C7vOywr4L2qX3FMQI2GZOXaD3Zyg1FDWfGKhiBmz/ZRhihEpBjymjwYgO
	ZwC4tbJDcTaOhBcI1Ry+PWtyzMb8dgDA2jkRqrU/ESWapuSQ5MwdK/fxw3aAwlwZ
	j8OD34SXDYnqeQWPELQUK8GEZ1/xGpn+sRgzcjLsRJ/BEfhMxU6NSU0jVFXkpggD
	fLx6EjTQTiWTpNwEY35EgmOZKDXFzPByyBf7gkl5cA7NpGcDPu2wQEQ/kJxAd9TK
	00vWhw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mry50bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 22 Dec 2025 13:06:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f29ae883bso57056725ad.3
        for <linux-leds@vger.kernel.org>; Mon, 22 Dec 2025 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766408806; x=1767013606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=;
        b=YvD5N6k55QtlCs1rAjdtuDk9TuX8bpTZCmSSxB2NZTFFMdi6C7rFTCGyd+3wNFd4/L
         ygmNKmapvXhFUv6VnCavGRlcmfQ7nC6FSD4jRc0VVVDYU+HEanXHBJAFZpytmcxGfrjP
         ZMiBMNWaYSs/BEhWOP4EgLAegqOkzohU2ZmS/fYczi1cxeoG7FeputQfffb3XMNJOLYD
         mF4s6qpqEiCB513H0JNQZIdemYhP8vRUI+I8AAgJyuJuhsKOJ934SE9mrNNOezS4/VqT
         SE7m1291zJbsXluq0djGIeDDAEp5BlJEwqTKI/0KaLvI0YSr92ZziW5bJMauYgtLpe9L
         xpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408806; x=1767013606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rl34VUSIcLKGSTcgfDKK7LNhN6XEgT4eoWUw45WEru4=;
        b=WMawzjiiz0tqgsJE9PCJ8NVZhdmCM3i1ZSZFVbSo5BXSjUoZu1e8ZrwxbHDL8zqTcg
         KUMwxGx/2DBgPsyu1RGl6unRig/z2aEXc74+HXffjzpjxDOqRvhjxXttluPHDkSa5whj
         UCjwy1Ab8LX5SvzMPc0ACq4at6D5njNBEf4Y1QrX5eLlv/vx3OacuuN6TLE+Z9AaQDxN
         2k/nvJ3fSLYxXbOG4w+OXMoN+qQw/OYempN9kUb8d85XWTYQXreCiYFzppfMh2Cx+pJa
         E92y6WZZtdmAkM5WR3Mv7I/z0hSFjxHkeOTWJeGGjtVdZmR0+0xby6Sd22ECMFEIgNUr
         X9cg==
X-Forwarded-Encrypted: i=1; AJvYcCVxPiayX8fIFvl0Sbr/gK3vV3UxfbzA3e7NqYU1Qw2V5NKmiZJl4er4LMdztYveui4aG+RN6xku7HvU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33qBv2x0Z3OE2keFha+YiTjKGs0eHtK4bemeguUSxnlAgEit2
	Kx8+Ae9rvHGAq4nV+QXjrqctUwIHqHSt9TmGat6MYlu6wl0Bst+RXiWk/nW9njY2qkaA7Atiown
	NDwVDTdrDkiDut+Lio5oFCp4kIZxf3es9QMo3WaQKGheBwbaEJEvAPzXVQtzBvGpx
X-Gm-Gg: AY/fxX6NGpGIo1jmsUOx5jCbcOMQbwhEyzLxrqVmOqbb8UFm8MUb/ehXfR92pE2o+yz
	XgDGOlcQAR9vqIRfqlCjw3UYb1Od2E98D3FD6hHckciq5qqU5KvcZ7VHE2wroAvNkDtLAaAsGK4
	97CE5HY/CMZEMSdwPq4t7bBfu5V0jP4z0cyYQXCagpgBHccMgLOyv0LIz/FtTCy+tawmSxrcq3O
	JuhXUw9xOcJb26RPuUH14WfkTubFkY8QLcS2B+Duh7ml/nEQswnsLygFS7K5xcGwZV1C9c26o4x
	S951Sfe+t7XOuK+jjHnLQlWvPJaF2XheV0nt59VPfegSdtMTK2Vw48ZOF7QvHeCOyAjkFsV/hte
	d0GwDgcoTdkLUyvFdAj4jcP2zCsNUj9dUqOOyFEIPIw==
X-Received: by 2002:a17:902:ccd1:b0:2a2:f465:1273 with SMTP id d9443c01a7336-2a2f4651332mr99434335ad.35.1766408805954;
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlbxx3zSYC7hX0CsS0/1ozD2P9MFWi8YNJtWnOe1tHF2S4inDEMsj0XZcm7mX2MOc53RRZRA==
X-Received: by 2002:a17:902:ccd1:b0:2a2:f465:1273 with SMTP id d9443c01a7336-2a2f4651332mr99433985ad.35.1766408805432;
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d6ec60sm96922405ad.86.2025.12.22.05.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:06:45 -0800 (PST)
Message-ID: <f6ca8c43-9f00-4dd8-9e11-90f2a4e8d18e@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 18:36:39 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for
 PMH0101 PWM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        jingyi.wang@oss.qualcomm.com
References: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
 <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
 <20251217-quiet-wandering-gaur-c9c6fe@quoll>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20251217-quiet-wandering-gaur-c9c6fe@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=69494266 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=g5AuMlRjdp1IwKd9_dYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDExOSBTYWx0ZWRfX5zW2JERLBquZ
 RmkYmHq++vT1mbQcrzwApCgtL97NjHK5Ng+fBU/Q3fQy2VaPHuFLnhzDYh5MUkBu9U0ZNe6Wy+T
 pQjSgXYxmXn8aUPeyEA9JaVnAXyrORi0CyQOUrvft9WLGxZlkd7/jHlQcyRB67L8xM2bA83Faoj
 YVz4YWMYlqLLFZ4MaYtl+Nut0gb0hDEAYJMK5hWzwEdj9gnpVjL2Brl8xH5yyxyyWMlxiuMfnqp
 mO+wzGtj/WPQyst8uu8XpSrAn01BBJMuo/xUpQ/jYBa7C3qS4MgGEQUv5AEYw44J0fQ3r5wxsWZ
 Ow00RYG2HTPrmkyIHc+j1hsZckszvZ7P6cbjLCCob/f+TZpi7Uifn1XwTmUR+ekRiQ+npOdr0VI
 Ua+9r1nj5YLSCDsMSAHBVYdccdCeaHz8YCgHeSnhHfG3D/WEqumaLOHVxfA5u8FxIL6hlI7mJ2D
 aoqW2KlKAVKz+Z8p0Fg==
X-Proofpoint-GUID: sxB8yd2SHIIyJMMoMXTGWVgpUNOI4hTe
X-Proofpoint-ORIG-GUID: sxB8yd2SHIIyJMMoMXTGWVgpUNOI4hTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220119

Hi Krzysztof,

On 12/17/2025 1:45 PM, Krzysztof Kozlowski wrote:
> On Mon, Dec 15, 2025 at 04:41:04PM +0530, Jishnu Prakash wrote:
>> Add support for PMH0101 PWM modules which are compatible with the PM8350c
>> PWM modules.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
>>  1 file changed, 1 insertion(+)
> 
> So how many nvmem entries it has? You need to define it in schema.
> 

PMH0101 PWM has 2 nvmem entries, the same as PM8350C. But I see that
PM8550 PWM was earlier added under the "if:then" condition for the number
of nvmem entries and you made this change which removed that line:

https://lore.kernel.org/all/20240226073713.19045-1-krzysztof.kozlowski@linaro.org/

    dt-bindings: leds: qcom-lpg: Drop redundant qcom,pm8550-pwm in if:then:

    "qcom,pm8550-pwm" is compatible with "qcom,pm8350c-pwm" (latter used as
    fallback), thus it is enough for the "if:then:" clause to check for the
    presence of the fallback "qcom,pm8350c-pwm".

PMH0101 PWM would be the same as it also has PM8350C PWM as fallback.
Do you prefer that I add it or not?

Thanks,
Jishnu


> Best regards,
> Krzysztof
> 


