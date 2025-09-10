Return-Path: <linux-leds+bounces-5479-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C0B516BD
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 14:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2EA178BD7
	for <lists+linux-leds@lfdr.de>; Wed, 10 Sep 2025 12:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA3A318143;
	Wed, 10 Sep 2025 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj/r7+F2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E006313E2E
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506911; cv=none; b=fNQ3/Z+mjpPIQeB0Xl0a20MDNVtafbi1e4hApDGmL+ARYR51FYfEoQ1ivLblK9XDG01o4xZhgMKcMMuMSjjDtkmugsQyWTtn63kBptsRzuBf4y1qaNkirwPmagO6Gbxg8t+/h+AYvhenSfCH1wC/Xlbl88VVL4QptM5qOc5y5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506911; c=relaxed/simple;
	bh=X6KFvaVVEp/dLB58ZazXkEEJ/edkPXleLAnQlioyPKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XO067joMPRIB4whVT4/VsppJ3OzOoWQW4sExF0Cc8CQFYFtY0VBfJF4bZNpEbNOU2ByRO6YhG0dYHVBq47SQCYTaLMYtOel7vsxggxBm73jvGx11Qi1BKa+EcINAoBXDfW4yLxcVqlHESS2KgWAGIh9pjhYYrcd77jhm+B0sqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj/r7+F2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFGYK022192
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=; b=Wj/r7+F20oSLhcZm
	gR7IlHEw0gGVfncRIWGRYXpijto16adl9ymBPXPuthfLEojRI5Av1bSHNvA49oIj
	aCUo37w1MOdFQk2HGeF+I4PlPmtIitFaGpFFNZwwkJQ+sYMmaUVYmGwHwgduKqyo
	88dNq3C8/tWeLOKZiMmzocJYh2hsmr24WCHA86087SNLdxn07jII9v5S86iR9b5s
	WTNpjisCL/gnTjGLu6uqZAK4S2AVnURN7MXCr8nJbzcj6xRTrDHQK13KyqOHy0g3
	9WWrWrFoZiHu31WeP+ksnlF1BMVx2VVBarAQln7F8AZZBIiMDx5iQqldQ5r5t+4/
	2YFssw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0urwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 12:21:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so11378131cf.3
        for <linux-leds@vger.kernel.org>; Wed, 10 Sep 2025 05:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757506907; x=1758111707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vMWTcElNgxy4rtHU4PlXXcjyINdBlSlLR0M7KQ8Dho=;
        b=r/ovjNqdzCkrpG+1ARuM0JfabWGitEncwx92aH0Rl3FMnHnhiE+L1pu5V/oe9ApgUf
         Y6DdTITPznMJ8bwkphOBodwLdEsNVvMfY7KXC1SqirNXbqnuSAD8Br6CJsLZ7xgUNMFR
         O5UdgtL1YEpn6mgH3nqD1sK3PCQAPyEyEeeMEbZPj2uIAx3ghEkkVzTsawFBSi49r3aH
         r3h8ziA5/VbiqpQwbxglB7+OhcXhnILZdJWM8xm3cNTwb150GZnsTeW/vMLcihqRW7mK
         yBpZxCE8wdmg9K5AutKTTiUXbV9+UYqSSA4o+VVEdeASJIAZj+5lTVKF79muiogemGzz
         u+2g==
X-Gm-Message-State: AOJu0Yw9p3fdrSPrYU2sliVMB2tRnozBrxDJ+96WwKAS/wvgYi7Ukj/h
	NDqN00J6DYEB74tw0mBsbc1SpdIGnS10qZJ5SvH8ZmI04nghhSk85YV8pjccYgVEhVH7DH08u7S
	bgYzRLYq/PawbJ3txlvvjpdg4OWbPy/UlkY8o/wqSw+ndEk0IcnQWZmTl7ScdoDnO
X-Gm-Gg: ASbGncuD3PnG3kh6tnM5DFfSgr+HmKCW43iq/WQsiPa6GgVE7uhUDIW7kqBIZ0a7mua
	vBmUUjOdApdK8iNl25YPCbIMeHWsSn6McDdmOfo1vq/LYM+clUsaCOlpV5PCcvfuzcd95FcIRhX
	pScYF270qSLbvCGIPYf0744Ld358a7EujIQMoHAPZb8QKJ+aKKt+7G3wBwHaih38gAgKkpEub7n
	CbNtcWBSC4zJ0rUc4DyIucGqBxapE67A4KFJYMssd6UwJGC6NXyn2NigdwRPs9HcPSVrPPiaZxI
	+ZJkn9cCggzzE1PLWH7E4hl6BmkaHtvwrcli90TEn0ZHYcdPIcA4tMioWFlAKw1ccMepbE3FZtx
	SUrRAm16q2RmmqunYTL7KvA==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672681cf.7.1757506906951;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQM2ETnZwgBv+qedS1fE1v5n9TD61CTWqUhCz41J601U3LDyveBpzWSkY3wpyOOnfMzFjhOw==
X-Received: by 2002:a05:622a:1787:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b5f848d05bmr107672451cf.7.1757506906461;
        Wed, 10 Sep 2025 05:21:46 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334e86fsm158892366b.56.2025.09.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 05:21:45 -0700 (PDT)
Message-ID: <1f979b86-b45a-46dc-b926-64f5b1b84f7b@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:21:42 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: sc8280xp-x13s: enable camera
 privacy indicator
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus
 <sakari.ailus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250910-leds-v5-4-bb90a0f897d5@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: La3KJaY7G3XCCn0k9XE52Oqo5qHth7nb
X-Proofpoint-GUID: La3KJaY7G3XCCn0k9XE52Oqo5qHth7nb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX4EFsMbnGF84s
 WrMwxJfZhBLA2mPLdfk55wA6pBIzQXgsxSqPBRMGdkUX2YD8NNYjIK4ordUgmJWJMRb26wIsIIk
 yoPbsgt/+tRyi84GEMc/YxeKH7UH5liYA+NcXipE5ZUq8oY1d5vc5RUV/9At038XNKVv4T82WGa
 7Zzlt70qJaGDpuTsNlFicMBcdjxdfl+C3RmrzCUrtLGHO185+tY48yA4SSVruAqDSOxFnIxGtZc
 MSpdbb6+ht4DDFc/koz1rWrJQ/HYJvMxI4+ap8OdZsrm6kfL8atZlBn7bbUMuYUjLg3j8xt34Tp
 PaHWoUgcZbAw8iJXn+XzprkBbxNUo3dwepg6cBkUVjV3IbDIlT7ZJo/t7SSP+wJdacv8lR8aRyk
 F6LF++TG
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c16d5c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8
 a=q3hGUckLsqYRD40seJgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On 9/10/25 2:01 PM, Aleksandrs Vinarskis wrote:
> Leverage newly introduced 'leds' and 'led-names' properties to pass
> indicator's phandle and function to v4l2 subnode. The latter supports
> privacy led since couple of years ago under 'privacy-led' designation.
> Unlike initially proposed trigger-source based approach, this solution
> cannot be easily bypassed from userspace, thus reducing privacy
> concerns.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


