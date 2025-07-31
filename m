Return-Path: <linux-leds+bounces-5175-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C2FB16EBC
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 11:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 718E3189380F
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 09:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E96221FBE;
	Thu, 31 Jul 2025 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9CwkqhG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B0B202998
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753954412; cv=none; b=SGUHhTDToJpOl7pa7sAA3ox6qLo4JunsiiDbvHwkn8mJQ6NPW+eChvNGps/lClU3sImitFjdgtJPsw9cQXByqrzYGBgASIvkae6K62zwvtJ90uOChcRqgsseGneBP1ZL/eY5tnNdRRYwmlOFDfQM0exEIRgrjVYyYJqR1EMieGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753954412; c=relaxed/simple;
	bh=C9OYPWcWgVHV/CiiGcURO/bIPuqAlqLabGz8H5AqQlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNPVXdG1350IX4uU0WGPRwP2tXX68ln4aPBYqxHeTCFX13mHzfu4/lldw2SDTGfw1WoHaDG3Xlsr9DAPMuWpOJE+5CLcFY+uli4azLqmTlE3X3wok6rF//2T6dCNwzCeps3hoH012rDqKdopoZqLGgdiuFB/1uEtj8VGuggEbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9CwkqhG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9RGBV003469
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 09:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82GPBT7CuEhijOA1vnxlMQVU8JDV/YKIyW9zLCTeOyw=; b=Z9CwkqhGXw5ThcGq
	a7cZu1W2BHNIkHgIFw7U4kPWFNctX/Rp8GYMj/yo4nyA2zOfeBI64E99zT2Q/z5x
	1hp6Pu/eg/e4X+UEiPGjd4rxs7WzbUZnkkhs1dwGb4SqIlZtpxx2f3LnhjkBRFm/
	o0FXPvTZa+msy+PL4FtTRQDqDhbZEI1nie7RG6xRCj86Zp5jQLodPcoAovoh9Zdu
	OD3xNHK+5oy/aKVSgAnlvCOi2R4B5UStikFD7kRqkVfKVf6Z2cibX5pSfonKWsMQ
	cfpVq6QDWxzqNfCQndzdV03y2yY5CINOf46QuZ4p5PjkUKzGY01mYNbsdnBPXgN5
	kacy2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwgbmkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 09:33:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dea65840b8so13574385a.1
        for <linux-leds@vger.kernel.org>; Thu, 31 Jul 2025 02:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954409; x=1754559209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82GPBT7CuEhijOA1vnxlMQVU8JDV/YKIyW9zLCTeOyw=;
        b=GvV0bHyu5ifaLbzYdEfAsVtOSae+PcnplrpawF/I2XFhptxoiZE3TGyfdQl4XsYiFF
         wgrx2zvw44o1QmDvXRqo9CxbXGtSi4ZkHyqvPyAb1BHMQfMkmK17JNqeoSoZdroVp/Bi
         X/9SyEteYNohrBeXSiLO8FyXda8kASQKexbbv9XXryI0Jv7NYtYpnoa1aTEsxmmXESv3
         wu93d6tCAsODJqEOEqrKw1OAXARRewx4vUq14hMPnuUtcwzC5MbtBy+wIC2XXgBRPem4
         uMyzQI5fJd2/nftt0VOaFPaZYrJxD4RMS2xra6VxH3qmWA+M1gT+IA/b3OlKYHJxiW1e
         5ltg==
X-Forwarded-Encrypted: i=1; AJvYcCV5mJ4RaftujunDz0jFv6/h3NmNkyfOvdgfA6QdKOBYsOBkB3VBL2zYOaepr/PLHHhzjQ7vwUD5Trji@vger.kernel.org
X-Gm-Message-State: AOJu0YynQV03XWukAKTpKtqdav/+FJmWhH//XaA8TwYpXynz8dIHpc3A
	tb7NXa0WilRzZdBpKdCs4a0152dJFIVnB3YZ2eNVX3rkooTDsy//2/fGOOQzohS7kSWPq+ND9q6
	3rGkmLIR0kT98aaHVyIK4+kypjs2R7H8sB75P6jaJjA3tzUPluJbv8dIIMuWlrkPi
X-Gm-Gg: ASbGncsVfF/F+kib7l3yg74Wdypd4GR2EqEGHRvAnzZKUlI1u4PqXUrQiF4I6oOnD7V
	nLjVGC4zLW7mBBZ7z+/hGMa1t5g+VLSbdwfXLgZ1dQrYOQEX89uFi/bDC32sYeBSo2o0PnNWoNv
	8gSaUmECcSr8RDHWEWKW+xfzVLgwtrGsmsQKvZKhy2tHkIPri7+id5lpcjCRcHcBNMSlxLgvoAE
	KqsWD0bNSCzx86aTkCZGmXVjxZTF+x1M4pKgCOScAeDgUgnN5dQUrIY/a29m+it4J3LWVBqVnlH
	LQBYmzYc+AZd3XgskJZn6+OjTb48+ZEyBPZI/X2r7i4nkieLXj5P9JZTapGT+7q0ZonhvOhlFgb
	4FM1Pp1+z19RAwom8cw==
X-Received: by 2002:a05:620a:1a05:b0:7c0:c024:d5 with SMTP id af79cd13be357-7e66f045980mr437147385a.8.1753954408929;
        Thu, 31 Jul 2025 02:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQJbanGKb37NjK2QkIb/mPbDk8ovAThngSePHzP6HkMxpYQ7Yf3dg+lzf6M7ZNTkULo79eMg==
X-Received: by 2002:a05:620a:1a05:b0:7c0:c024:d5 with SMTP id af79cd13be357-7e66f045980mr437145685a.8.1753954408559;
        Thu, 31 Jul 2025 02:33:28 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3e80sm81864266b.47.2025.07.31.02.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 02:33:27 -0700 (PDT)
Message-ID: <2496bdb9-2ad6-4fdb-9a35-e9b8a15d744e@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 11:33:25 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] leds: flash: leds-qcom-flash: update torch current
 clamp setting
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-fix-torch-clamp-issue-v2-0-9b83816437a3@oss.qualcomm.com>
 <20250729-fix-torch-clamp-issue-v2-1-9b83816437a3@oss.qualcomm.com>
 <f3c004a9-dba9-48b5-9930-979053d0a32c@oss.qualcomm.com>
 <e0f827e0-1552-4542-ac70-70903227734e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e0f827e0-1552-4542-ac70-70903227734e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WvgrMcfv c=1 sm=1 tr=0 ts=688b386a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=f1a5bq8nv78Meu0PtRoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pKVXUDNLWhpWEFBOaHBm5z3EtSAn4VD8
X-Proofpoint-GUID: pKVXUDNLWhpWEFBOaHBm5z3EtSAn4VD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2NSBTYWx0ZWRfX5af+ZqfGnDs2
 ZW1DLCl0mYqmvkv0s6pYVLuFr8XwyV78kBzZFHXqDmK3sNaYViTUkc4dizE3tqXHeD+g+zkTU+x
 Et5/CFVmGMxJNDg8NR/UwCbRzigqiYrDvH+x/ggozpppLeVkhBo5iAV97+Vz60QIcxi37UheNDv
 N8IwMRlfCVey+C7vXvfwVngLnj4G899SC8rEw1LryyJv/AqZyxWaF8gn+5DgxZkhcneeBy+VY+w
 cWE9hxb3qZzT62XKo+VEAzA8+A4PBfcFGCYw9WO+6fgMTPnULu5q+z4tz44XG4iMOU6ebZdBqsM
 dz3E1SLt3vb+piClXS+CB9aa4HzDS+WEiRBRs19N7X2altg+e/VZC80KdVNfgf39FK2k7mErdQ3
 6DDqUfYJ5v09IwNg3E1rvk+fp5jFu11zOc+AGpeas2NyLBlNx4p+FiRSO7RfSyk8g2Vs+3hZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=682 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310065

On 7/31/25 3:43 AM, Fenglin Wu wrote:
> 
> On 7/29/2025 7:01 PM, Konrad Dybcio wrote:
>>> +    torch_clamp = (current_ua / led->chan_count) / TORCH_IRES_UA;
>>> +    if (torch_clamp != 0)
>>> +        torch_clamp--;
>>> +
>>> +    flash_data->torch_clamp = max_t(u8, flash_data->torch_clamp, torch_clamp);
>> Please confirm if I understand correctly, we may have N flash LEDs
>> connected, and this additional safety hardware can only compare any
>> individual LED's current draw against a single maximum value, which
>> we're setting here
> Yes, your understanding is correct!

Great, thank you for confirming

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

