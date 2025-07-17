Return-Path: <linux-leds+bounces-5090-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6070BB09643
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 23:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32207A401F3
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 21:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D49A22DFBE;
	Thu, 17 Jul 2025 21:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIMVvM1b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16DF2264A7
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 21:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752786406; cv=none; b=YbkLY7yOTvd+rCSJyRXEy3kFw17HE/rR5nO+LOhXPe1boWgj9r23sNO4OpgYTNw+T+9sT5KLDy5az6+a3NssfXbuPpPuRFQ8pzMlfZL6Kwk3L5U2vVKL1M3QdG3yGzGHtpRyVioLl1fVtcbDgVv+9w/ap8k0L8YQmE4D/3AtpSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752786406; c=relaxed/simple;
	bh=uhfsvd6ujR5IiuRkGHiGSpUgRbJAikw6tYn5QgEz+VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XZPnVutYRFUUSYdY464zKSfX0MaahEpzWuGBUpsulYcACima/UDlKd4sx9w4A+mUaDlW1hcnk5C7LHJ5LsGJEkx9OrpPpzTaKmFKi6cSQq77I1swAxxq/7e8T2B7y1ZgcChumDgGhVMl2MgZ9YdADoLFsJFnnLovZJPl0QvNHGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIMVvM1b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNNZW032515
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 21:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=; b=fIMVvM1bN1hE4eUK
	WGzlKQawrUeXo7QK+Ku6DfRkL9mijak+Krr7T78veaG/n+2cu3v93hVr3JsQ5ME3
	cXLeCvcFfBgaodGi5fGCWH6LSu6KmvUVMrvzmNI3+sn0hvy/6RF4XsxtvDzY51m+
	kjvLDcteG81VEZOwVTB5gkcp26i7buKXYdP3h4qqW9pDz67Wb1JaThOwzNAhVruR
	SWd7LGbo5HkjnpTs0FRDOSyuVu1fSs1L4OaHU6uz1gm1ABKhY0RyXq6ZTeKy/6Kz
	G3cl1nZNOWZ230vSSGE22EyN2fimf8eiLR1KADQOvSBbrwiZgqE/qaD2L5kdgJ5y
	04lUug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug389ats-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 21:06:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e1d3bc3bd9so10043785a.0
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 14:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752786403; x=1753391203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjye/euzJtJqLLETvGURwJ94G0Q37cEw/XWFQryemcE=;
        b=Z1HMs0ihQSMv0jwJJAwOYG9zQmEbaTFLLHAYdrWuD2GC48gGnGwUz0pjDX/elMjXe0
         nctNe8p9dGBhD2T/H8LUib/jipbV5wkPk0xbZOEA42ox2qk44IB/+/7WZsmGXgd8e4h8
         YaibMe/wwTt3Wqi2pGb9hQaxaus3VMuFHQWQLw9b+b1Pnl0zuWNON36VDJGK94MhfB+n
         SBKbuSLQ9kDqfjr7t8/aXeTvZ4wQKlHRa3QBmcVOXax1pPJb0PPGb87W5N21nx2ZgaUE
         0F7jwhIm8ZWO2J2efWNFuuJ0b+5J8FIuFvBbwWZdP9KMg6CmWhvFzJYYmlQoNbg6MhFt
         tM2w==
X-Forwarded-Encrypted: i=1; AJvYcCXo6/sk8NCwwXM/GJTKqMqdbX+ayWm1/Gt+ahDmt+WuWJU/Kb2nJmYGhPdl8yzgAqiVSebNp2UlqaAf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxc/Fws+thQexRu3k/ukPmpOZGyIFlVj1/Q94JunvoGFVo6DYo
	RpwS7UI5ESmdarjF6MxG1TAVznm4Pd8zD+sMK2JJvt23tTydc/oUtDJuR8J2DeW2p9XoN9OATJ4
	xrm9mb5uWNuPtabQVs6ZTuJzm3stCVIfxVzsDvHRp3HZ+mbnlRPapvMcbqcRLP84Y
X-Gm-Gg: ASbGnctokb7m2XqEi6ZXktsr2KSlMUBrV0HY0NgpFbwygnHqUaNVTFWw+QrXCtw54KO
	I0drqzeZw05ZncmCnBlauQIaMyZuoJr+Okww7uF60dlh3I+DXtV7MnNd/fbzSv5yPLtq2oUsPGa
	iK/idJKoxCpnNtai9zEAEch/zHaR/7zZSvs0rXRic7gnvUwBGeppsHUXhEkdnGNPxpkLaboVFK6
	doFlaU+sMRBktBOmtaR1Qrpj1k5iu5BkgE7Eia1lElHi6RI+WSJ0dd1uwx3jELkuNkVKBhN0EAI
	SgAbA/0pcYYgQSxL4RA3cbTLGIJyJNV/Fjf1sN84eLJo/dbEPYRbjJN3ECPJAS9YGmlPWTKWGoX
	ApvlG8c1LwqmXdHWd8jwJ
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451824885a.5.1752786402691;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuPa/yRCQICTQrA+jm+Q73xxpZUEJk2US/0cdFi63bdkyvw+FC7AgcXaKulKKmsTwOdsW8rg==
X-Received: by 2002:a05:620a:192a:b0:7e2:ee89:205a with SMTP id af79cd13be357-7e342abd519mr451822985a.5.1752786402252;
        Thu, 17 Jul 2025 14:06:42 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826461esm1427290566b.100.2025.07.17.14.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 14:06:41 -0700 (PDT)
Message-ID: <653da558-9dff-442d-acc7-65a1c0f84494@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:06:38 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: Add PM7550 PMIC
To: Luca Weiss <luca.weiss@fairphone.com>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
 <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-5-09777dab0a95@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4NiBTYWx0ZWRfXzRHt+9zhqXZn
 md2D7u/Cwcx4aYZQf5tb6yp/HLcqe0EtXAMSx3cvYfUsgnZ59e42faTrv9NU2lypajs5/pxuOn1
 n8NaZ2Xo485wDx0BrG3xFdavH87OZVyN/Fiq8NenvrpEfhje1YPcJlfXveUZJ1GPY4W9n7GiMQ3
 /IUHpR7GcCPJAWwM1bzfWZpz1Y0GKvIqqhi6Hrk/7icHmr3cGPLbNWlddR+gyLX1yqt80L5K7ve
 yEi3Nvo716TLuXp2uTjmM790d8565hM/yWrdE3Z3aQJwB014fVlJP9s9w5klq5+PBZKEr8ufywx
 Xq9SGbmX/xs/K3QkX++eeLRtuGy5ARPrXXC5wqvDzLJaiyRNFTB/iT60VIcyrl/CzwNzb9z7pA7
 Ne4cKfKNhFU9nKe4TyXXOZDR1Kw+BhRvvoe1Rd9hYkMHB8u3HQjSQl4soPcicZbnwohZlaUh
X-Proofpoint-GUID: _JIwsSjMsL6_KfPhLmtmIVMN1j-04Tg1
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=687965e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: _JIwsSjMsL6_KfPhLmtmIVMN1j-04Tg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=884 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170186

On 7/9/25 1:46 PM, Luca Weiss wrote:
> Add a dts for the PMIC used e.g. with Milos SoC-based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

