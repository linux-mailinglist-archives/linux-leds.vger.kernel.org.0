Return-Path: <linux-leds+bounces-5589-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E16B9CB91
	for <lists+linux-leds@lfdr.de>; Thu, 25 Sep 2025 01:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE09516DB3B
	for <lists+linux-leds@lfdr.de>; Wed, 24 Sep 2025 23:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355FE283FEB;
	Wed, 24 Sep 2025 23:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ea+Y4f2N"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3A41D63F3
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758758156; cv=none; b=jOazvL4DUptELvhkfE62hTcJktC1XCjAe+U+rawho7ntjrUDbGuiC1YVb+SkX+5wT+geb+mzPOqaWjMmXoTsryV3TciURF90mDEiq678GnY2LpyYm7G3yG+HZ/qCeDQPHSkp4Ky/ICi1ffa29ut5oZ2gRCANoCywGvQW2VsTMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758758156; c=relaxed/simple;
	bh=pVFWRyED9uXe9kpHIiNh5s/rNAukrjZqYdBaoVesJPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7faZ2bBtlAcB8EoXrYCYu1q4e5+SfAq0uPId2Sd70MuttqUa8JF8YSqPCwq2vbVSxy9P15ZiZUO0pSABeQEcjvUb5/lmD5gKbjrezQjLq12gJ6I++TO6bqBwcqP/bykr9eIm0TQq1TrOp5hfzXAMefIhQ322W79BkzkZ6n4isM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ea+Y4f2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODb2DT019952
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KQxcXsvZfAS1wOTJMcdFx0mfDRF5q6RjS3aOLT4mUA=; b=ea+Y4f2NY5vZ8Jx8
	uPTphXJmu2TWODn/nklaUjeLfv7cGSV6z+oFfah1tg251ajdMV0S/urHWVUsvz8P
	9UaERUeDUZiYO9Y2dJPaeSbwC4z+K1DWLEliefK28hTIi8+nXfjwEliUb9twl3UC
	Du30Hd5s5U4/LCt5g4J3lZhvMAapmGFC7PlSmuZSigVM9HF7NokpDg0X/f1oHxGp
	XFU4x+bhPVkv1w1kcDn1R99JpfuCchxIh3y1u75g69wIA2m0NT517H/xETz+rwVT
	nOBTw8WBeItV+GO4wG2bB+lWuf4kzNA043XnomSuU0eCtfhd7icA6USIUqE28h4o
	dDG4vA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdyag8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 23:55:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b552f91033cso464734a12.1
        for <linux-leds@vger.kernel.org>; Wed, 24 Sep 2025 16:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758758153; x=1759362953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KQxcXsvZfAS1wOTJMcdFx0mfDRF5q6RjS3aOLT4mUA=;
        b=X6scysw9K9Hl3emshneX5vLMNuLMQdoJhud8ysa/+ZTwgkqga0w0QEnU9nqLjhZyHk
         bMQxkSZmdqJiohIF0X8fzjxzokuPRmVGCPXnO0X+Sr4eoiZXC6csmSbkHhUD8vhJLigc
         HRWXesCp3W/v4jHo9VWMZP5E6JHS2hApNjuLlaSKh3cFsWg/RBsqUljLsaT3yKtza/rv
         FJHyWNdh1r04Mg/u/ULOxv2ZrAtftPEYfDTh1g8198AMXY41Hz8hsWOJM/1XFLlAzQ9H
         dzyC3ppBTGeub9J8YU1OPw+zNZgpwHzhI0e2ucxfKYQM/ZMBMwZCe60R6L5mVBSBRaHT
         z0xA==
X-Gm-Message-State: AOJu0YyJJPIR/882Awq1f2rAQW72XOL4CEeWqbI0/h/4ddBrsEHZD6Di
	ZJJZTNvwyFN2a1jUpjPviz/yWlcOAJ5TbS2af04/RdkcsbJ3upxIPwZbTcNLGnmvbGoXe9n8XRe
	ZgMFXhaENZ0LOMxT0KagX2BR1AYBXrkjnWwM82qmTSQTRRRQ72YALHUiqNQTCjYmS
X-Gm-Gg: ASbGncuTZRpZvhugRWrzwv6fLRrwq93GM+yANUybfYMU3R8Q7xA2B88Fv76/3RVv+5F
	KIU7rjZ7iUznkph7FCvRztgybRe2T+v+5e4yjYCTudXh2RRbuLQFe+a36+EAS6emsmKHx1D2WrV
	ic618D5YKFJWi8rJIkrB5hxMVDu8kzzUHWiwV1XU/LchZS7fxrp+USunUDy6CKTxVq2LtQArLGx
	vrAHwir/Lm/2DOV+TrKNLk8WD3hl5ovmsX03ckzm5a/94dQArEQqYVZkLS1a4vrHzTj8E/WGtRo
	j5nMYbjVZ+hbdBpvLzIOYtKxFyJioWYPyP02pgkCbK3D3rtGYbjj44N8CJAVNnYaTQpDIkgHqc7
	VNyO22sPBuxklgA6yvj+TxuR0WEYl5i9nsi8=
X-Received: by 2002:a05:6a21:998d:b0:2b6:3182:be12 with SMTP id adf61e73a8af0-2e7c7ea3a80mr1785219637.19.1758758153133;
        Wed, 24 Sep 2025 16:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZP/Cw7FjCDl1k9YPTWC9PsfI8KuZIFhusxaePj9Boj23xR7A+imFLsr21Pu2tm9ndHFGvA==
X-Received: by 2002:a05:6a21:998d:b0:2b6:3182:be12 with SMTP id adf61e73a8af0-2e7c7ea3a80mr1785187637.19.1758758152728;
        Wed, 24 Sep 2025 16:55:52 -0700 (PDT)
Received: from [10.133.33.164] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238cab8sm233347b3a.2.2025.09.24.16.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 16:55:52 -0700 (PDT)
Message-ID: <e06694ec-41a9-4d31-9fd7-8f24f6aa17ba@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 07:55:45 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20250924-knp-pmic-peri-v2-0-32316039db2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S0D3Rum7z_jqfj7mQm9Hzr2PDVicXNzM
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4850a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BM8lxeQmQxDjDH1EPigA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: S0D3Rum7z_jqfj7mQm9Hzr2PDVicXNzM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4YJa+2n/junG
 8B1xsBt/QEiPjuVc4nmP1l7I1XX9pqqX0eLpKlNruJMVWqs7rzIoIwdQ6myICV0cIorsetCxB9A
 zhK3qLm3tIw2pcXiXwogywi13s2nHyBSy4QUxC7mW+UrVsXC8EamReuzS5DG+ibr0UdHwtv7np1
 QpI0qUeyaLFFtHbNCnsi7vN8HLKFdHxk2kHDLhY+75nQ7slAsz0phikErEpPCVGPMxLcA5gi+DM
 ZlZHo4WxYVQT/OBYNSE/xJLIl6wJplo9VHFTymIUCVCnLUGYR1sNfAYGUw18ztlYpk2f8K5MlDo
 bfRhe0Hwf4JibhcErfOvx2GNyjyfBsAGr5pjypt936Z1focHATqbnO2L0GunF9v5h7p3CXsmVxP
 0USToTle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

this was accidentally sent twice, please ignore this.

Thanks, Jingyi

On 9/25/2025 7:43 AM, Jingyi Wang wrote:
> Add bindings for flash led and PWM devices present on Kaanapali PMICs.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com
>
> ---
> Jishnu Prakash (2):
>       dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
>
>  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml       | 1 +
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  2 files changed, 2 insertions(+)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250923-knp-pmic-peri-e067c827c531
>
> Best regards,

