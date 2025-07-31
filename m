Return-Path: <linux-leds+bounces-5174-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75913B16A34
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 03:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 740B53B2D12
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 01:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CDC513AA2A;
	Thu, 31 Jul 2025 01:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaHfkFfd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ADB78F45
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 01:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753926234; cv=none; b=JDmrETgSHaC5LNXwoGrrStIIKOuAL9QT7fnszVfSxjukHKIRybKFxrp9VqsG9LT5jpbbFsPp/zy109bO6CAQoWKuqHzNVF5kwr9Lf5Xn2Jl982+3kiOjKLiHeBs1Ykb/wETdkJCYMe5q+fC2mD9IZKFzzBefN669TyGls0JYj04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753926234; c=relaxed/simple;
	bh=6c6CPKeVYSm/Nje3nx041XmLjIkTbymaDdjGrlTM10s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HY04K4PXpWzVTJ+ybRuDudv7RUBwtfnp1J1baHgIne8AGf7k/c0BiWKYGHSW+5SUI0Ks/5FtJvAKwZtIaD2vTGmuSFRwt8dDnnLsnQC3Wf7L0/S0FoRfu/SApwlKwOm0fETEWlX6Vz96K6U9RY1bKVcZ0EnwaIQ64l9nes014Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaHfkFfd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V1fRRZ015451
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 01:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iEClsVWkG5VKecjEdwib4zfwZqjUZAXc840AZ1TMsBk=; b=TaHfkFfdLH5flNES
	4MvvcGUNkZEvj+rrOPljdtEBXVqq3LR/wHSSIFpm2MgoAQv8dXoUiuoMcxL1U+1m
	QSFnESoBqWbrVxKE6gDBpKVC4K/w2tWbMc2lAX7lY7X6L443ppto2hRAIEHZkwsp
	aKFvXPmMQFToF3aMvy1euZ1Ec1wfPd1AxUnSlK3ixw3olamWqCcDbwrmLWNKX3Yk
	qOOSQysmY/TfBzYktQUUPhQivpOoIDR0YwOM8kAsbTVARHPxGQXKGGsc31TculqO
	wvI4FgvJo0JQcaCsF1ufSe88qPZykUW6JapwIXwl550Y6lwg7KPVciRjeQlC37oF
	5b+3Mg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qda5sj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 01:43:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2400a932e59so5860725ad.1
        for <linux-leds@vger.kernel.org>; Wed, 30 Jul 2025 18:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753926230; x=1754531030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEClsVWkG5VKecjEdwib4zfwZqjUZAXc840AZ1TMsBk=;
        b=hqrQqLeLafs63zRiz9QdiqpLbhbUYiHL+gOA34x9WTxVvlLX8KYPZ3+pxOdB7d7V6d
         JBnRpBcQHcoyLLkEWVvoN76nF6lyxScioOqv3NPtGEYQia3P8wZSa0JAwJn0O4ddA9SI
         uAtS7WnQgm6r+btY7pk7822MHvDzXlPnWA7HJPs5TYLGY86X7cQ+C0IMIFW1Dpmn+7k9
         8ThG5WBecI7ClIZnW0ysLBk1rR9i0B2z0j3tlYmGyseAkcSlTxzhw7J0FxyhrtNcxwP0
         QI1vTbfaOyUISqI1LqO6Jxi0Z/4ujtf5cZEzJx+AkCTlhquo9hbhnl8wT3yOtWUqMmvQ
         oHbg==
X-Forwarded-Encrypted: i=1; AJvYcCVvSOkkpiQXQl/avl1Rfh/tOq/MCgREVyIdhFzngkOGY7Hd1D1s7Rx4tVHaBlx7VTBv63xAXqgHJHlf@vger.kernel.org
X-Gm-Message-State: AOJu0YzcawnLgwLUyC3LPxqVHCeFx5KaKonEnNCXX71N/A9iivV85+yC
	m2KrjUlEC8nCoPzf0eOPhlgu7CoYbPuhtTc/sbUh7vFY5ZdVF644bZupDfQlNLhLW6xtrz9aLLd
	l3bxw7g3qyiUVHe5ghGLR8kjczjgtQ/gm2+n3AehBYuxIqw+BjZBmuveXLmuftAsc
X-Gm-Gg: ASbGncutLnn1hUEwbhqVYhen1LMPIO/7WdjSKp8HSoe8u3b2c5G4+LHtxvMtjUCtBnC
	DmcY6JUjfei8swgbz2f7MBGMipArJNGNjNtcYLeJzWvr1jTTMRlBhRx0GXDUTdORy3YM8woz1Ms
	8MTC0Zj732kCTAKIeHdKbR3gPJJe2W9m0YAVAvlZDojCF3vD/37blA1GAajMEnCzXf9szstECxc
	E9Ppe/5jAnCIzmDVU/VjK8wQq69YhuHvYEcVVltwc8lWjq8e42UBz9DYTu5jnImqbFZmK2yzZT7
	yOTyh+RAOVzGRDmzgSgHrCL8I66gbqygSbeT3bwCQMkGXZcnm4hDCdszEtRApqriO7LsmImxIJh
	SigINbuylw2G2IMrGjT/Td5XABsm5
X-Received: by 2002:a17:903:2a8d:b0:234:a139:11f0 with SMTP id d9443c01a7336-24096a72a07mr63142695ad.7.1753926230134;
        Wed, 30 Jul 2025 18:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGeA7dwAAcKBLFo4NeBFBuWGZ33mZa2ufW3SFDYSN5mlhbysww0yxJDxS/Ld+l1CU8IMpouQ==
X-Received: by 2002:a17:903:2a8d:b0:234:a139:11f0 with SMTP id d9443c01a7336-24096a72a07mr63142455ad.7.1753926229761;
        Wed, 30 Jul 2025 18:43:49 -0700 (PDT)
Received: from [10.133.33.141] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976995sm3442425ad.91.2025.07.30.18.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 18:43:49 -0700 (PDT)
Message-ID: <e0f827e0-1552-4542-ac70-70903227734e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 09:43:47 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
 <20250729-fix-torch-clamp-issue-v2-1-9b83816437a3@oss.qualcomm.com>
 <f3c004a9-dba9-48b5-9930-979053d0a32c@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f3c004a9-dba9-48b5-9930-979053d0a32c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uCkhw_4hXbEMsDUM9nfFELISOGMqa7aC
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688aca57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=-gdVP2Hq3PRLCh7MhMgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uCkhw_4hXbEMsDUM9nfFELISOGMqa7aC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAxMCBTYWx0ZWRfX/YxEIB0Jdylo
 vbg3sWjCLPQCQN4ly0pFIIM4tuUozrfJ7WA/V3KCPlwVH7UVnLKswR3CC2CtkpERqgFVBlpkUKD
 KhEqZGX/dYhy88Zy84C/j3ZRxt4IsZThfLtNqcYUwGyxOiJK9WkGvNvzxio37rY0vdDlp3MEekS
 qIkzqLLjdn2vR4YJQmDxNyCvLSmiLUeN5DQu8VyohPBdgDLOhsTewci9SbnYPA12Irz1YlE5P5/
 R/PA28HXZP0LFNFFtElqfwM6EgWDq/v1CqzTTu2fYXuHl9wJuCauX7MvXol+dypIEZjCFWVERp0
 +sPXbi6E7AJZp8SZ5zIwe41xqN/QKi+xRBn6ZSe9qWPqZQpFAviYSbs6E3HePEeiE5mQMmuL/0J
 xisPcXxYNEL0rkB/9RNFMx0a4B3glTqcWrqR8fndvwedqzYEUqfJLNJCYQWNGoq3GSh9H+zZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=732 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310010


On 7/29/2025 7:01 PM, Konrad Dybcio wrote:
>> +	torch_clamp = (current_ua / led->chan_count) / TORCH_IRES_UA;
>> +	if (torch_clamp != 0)
>> +		torch_clamp--;
>> +
>> +	flash_data->torch_clamp = max_t(u8, flash_data->torch_clamp, torch_clamp);
> Please confirm if I understand correctly, we may have N flash LEDs
> connected, and this additional safety hardware can only compare any
> individual LED's current draw against a single maximum value, which
> we're setting here
Yes, your understanding is correct!

