Return-Path: <linux-leds+bounces-2303-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECE4939898
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2024 05:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4608B1F21FD8
	for <lists+linux-leds@lfdr.de>; Tue, 23 Jul 2024 03:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1893139CE2;
	Tue, 23 Jul 2024 03:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H+L/wcWY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05901E4AE;
	Tue, 23 Jul 2024 03:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721704542; cv=none; b=Pu7hG/k2i2H0Cm8uMVbhTUqY59WmTZucOuL8+Uw70fPdSYuryHx33ZeBGYMrCr4dxV8hYXF/PymfItrVJBi4/sCOeWtw3xj1se4SgJrWlrwQrNjR14B0csRP8MTqPxObvH5V7HVQ13lBqCxLQZKvIAVwtiz28uNhUaPzTWcxDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721704542; c=relaxed/simple;
	bh=iSOFaeD86UGMPL4JJ3DmMtQNKs9kFCexcgKqQKNJsoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PkWS2Tdr58TTmH0W0slepiPov31gek3QQwmBnTdukRZCULVKLM/D0a5E5JOYDlBosyhtoZKRbQNKOyT7vreLpkOQYOAKMlryw4AQi+gO4Cd5hI4R30LxSSa5q/GCWNYqpp7Lunz1eop9ZXJ+QkRaEjucxhM2AuQalhgrbl9aZ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H+L/wcWY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MNNvTl016652;
	Tue, 23 Jul 2024 03:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDK9Qa40SE2RbF1J8N6jdHGbtx3jxSOkp8qLxvqIbjc=; b=H+L/wcWYaB0J2Zc2
	UkNNrOuqGpr/RdFc0FizS8sG2mbJjBNUxo2ZorNoOqT9BYKH//woSy50NAyBvOG5
	zK8T+m+cG7Lck8/MeWX74VycwG2LY8uFjTgaeU8ixuQWxc4jLe0nTxXYkbp0HQf0
	/wWJn1KWFKFhwVcWWxbtCWbsliAFIFIzBdrn2w9I15vZ7xES2hPuB50wVBHCFjEt
	YIHt+bGQShKuAlAQmdk2+yt1ES8QPB404KCYwx1pRifWq14KqyniCQPGEDFxwogu
	DpQIvfmtods7+lz+iaUpxCMhOA//HDsAdxjym0bFpGZpWNs/UPmBptOHX6/nKnhx
	ACrHwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5m6wh03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 03:15:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46N3FXiT031575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 03:15:33 GMT
Received: from [10.239.154.73] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 20:15:28 -0700
Message-ID: <b2c4d8da-780b-470d-87ee-263cafb050e8@quicinc.com>
Date: Tue, 23 Jul 2024 11:15:26 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] leds: flash: leds-qcom-flash: limit LED current
 based on thermal condition
To: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        Pavel Machek
	<pavel@ucw.cz>, Lee Jones <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "David
 Collins" <quic_collinsd@quicinc.com>,
        Subbaraman Narayanamurthy
	<quic_subbaram@quicinc.com>
References: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
Content-Language: en-US
From: Fenglin Wu <quic_fenglinw@quicinc.com>
In-Reply-To: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f_v9o3rIQXJo7S6wc02iD-69h5dl3GTV
X-Proofpoint-ORIG-GUID: f_v9o3rIQXJo7S6wc02iD-69h5dl3GTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxlogscore=894 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230023



On 7/5/2024 3:55 PM, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> The flash module has status bits to indicate different thermal
> conditions which are called as OTSTx. For each OTSTx status,
> there is a recommended total flash current for all channels to
> prevent the flash module entering into higher thermal level.
> For example, the total flash current should be limited to 1000mA/500mA
> respectively when the HW reaches the OTST1/OTST2 thermal level.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---
> Changes in v3:
> - Fix coding style issues to address review comments in v2.
> - Link to v2: https://lore.kernel.org/r/20240513-qcom_flash_thermal_derating-v2-1-e41a07d0eb83@quicinc.com
> 
> Changes in v2:
> - Update thermal threshold level 2 register definition for mvflash_4ch_regs.
>      Mvflash_4ch module thermal threshold level 2 configuration register
>      offset is 0x78, not succeeding from thermal threshold level 1 register 0x7a.
>      Hence it is not appropriate to use REG_FIELD_ID to define thermal threshold
>      register fileds like mvflash_3ch. Update to use REG_FIELD instead.
> - Link to v1: https://lore.kernel.org/r/20240509-qcom_flash_thermal_derating-v1-1-1d5e68e5d71c@quicinc.com
> ---

Hi Jones,

Can you help to review the change again when you are available?

Fenglin
> 
> Best regards,

